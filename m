Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i62sm7265944wmg.17.2019.03.18.08.59.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2019 08:59:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA7BE1FF87;
	Mon, 18 Mar 2019 15:59:06 +0000 (UTC)
References: <20190315143057.20165-1-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Dongjiu Geng <gengdongjiu@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-4.0?] arm: Allow system registers for KVM guests to be changed by QEMU code
In-reply-to: <20190315143057.20165-1-peter.maydell@linaro.org>
Date: Mon, 18 Mar 2019 15:59:06 +0000
Message-ID: <87sgvkw4vp.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wfqrLae5U0aH


Peter Maydell <peter.maydell@linaro.org> writes:

> At the moment the Arm implementations of kvm_arch_{get,put}_registers()
> don't support having QEMU change the values of system registers
> (aka coprocessor registers for AArch32). This is because although
> kvm_arch_get_registers() calls write_list_to_cpustate() to
> update the CPU state struct fields (so QEMU code can read the
> values in the usual way), kvm_arch_put_registers() does not
> call write_cpustate_to_list(), meaning that any changes to
> the CPU state struct fields will not be passed back to KVM.
>
> The rationale for this design is documented in a comment in the
> AArch32 kvm_arch_put_registers() -- writing the values in the
> cpregs list into the CPU state struct is "lossy" because the
> write of a register might not succeed, and so if we blindly
> copy the CPU state values back again we will incorrectly
> change register values for the guest. The assumption was that
> no QEMU code would need to write to the registers.
>
> However, when we implemented debug support for KVM guests, we
> broke that assumption: the code to handle "set the guest up
> to take a breakpoint exception" does so by updating various
> guest registers including ESR_EL1.
>
> Support this by making kvm_arch_put_registers() synchronize
> CPU state back into the list. We sync only those registers
> where the initial write succeeds, which should be sufficient.
>
> This commit is the same as commit 823e1b3818f9b10b824ddc which we
> had to revert in commit 942f99c825fc94c8b1a4, except that the bug
> which was preventing EDK2 guest firmware running has been fixed:
> kvm_arm_reset_vcpu() now calls write_list_to_cpustate().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>



> ---
> Should we try to put this in for rc1? Not sure... Testing
> definitely appreciated.
>
> ---
>  target/arm/cpu.h     |  9 ++++++++-
>  target/arm/helper.c  | 27 +++++++++++++++++++++++++--
>  target/arm/kvm.c     |  8 ++++++++
>  target/arm/kvm32.c   | 20 ++------------------
>  target/arm/kvm64.c   |  2 ++
>  target/arm/machine.c |  2 +-
>  6 files changed, 46 insertions(+), 22 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5f23c621325..82f40a7ea90 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2559,18 +2559,25 @@ bool write_list_to_cpustate(ARMCPU *cpu);
>  /**
>   * write_cpustate_to_list:
>   * @cpu: ARMCPU
> + * @kvm_sync: true if this is for syncing back to KVM
>   *
>   * For each register listed in the ARMCPU cpreg_indexes list, write
>   * its value from the ARMCPUState structure into the cpreg_values list.
>   * This is used to copy info from TCG's working data structures into
>   * KVM or for outbound migration.
>   *
> + * @kvm_sync is true if we are doing this in order to sync the
> + * register state back to KVM. In this case we will only update
> + * values in the list if the previous list->cpustate sync actually
> + * successfully wrote the CPU state. Otherwise we will keep the value
> + * that is in the list.
> + *
>   * Returns: true if all register values were read correctly,
>   * false if some register was unknown or could not be read.
>   * Note that we do not stop early on failure -- we will attempt
>   * reading all registers in the list.
>   */
> -bool write_cpustate_to_list(ARMCPU *cpu);
> +bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
>
>  #define ARM_CPUID_TI915T      0x54029152
>  #define ARM_CPUID_TI925T      0x54029252
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2607d39ad1c..554f111ea89 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -265,7 +265,7 @@ static bool raw_accessors_invalid(const ARMCPRegInfo =
*ri)
>      return true;
>  }
>
> -bool write_cpustate_to_list(ARMCPU *cpu)
> +bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
>  {
>      /* Write the coprocessor state from cpu->env to the (index,value) li=
st. */
>      int i;
> @@ -274,6 +274,7 @@ bool write_cpustate_to_list(ARMCPU *cpu)
>      for (i =3D 0; i < cpu->cpreg_array_len; i++) {
>          uint32_t regidx =3D kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
>          const ARMCPRegInfo *ri;
> +        uint64_t newval;
>
>          ri =3D get_arm_cp_reginfo(cpu->cp_regs, regidx);
>          if (!ri) {
> @@ -283,7 +284,29 @@ bool write_cpustate_to_list(ARMCPU *cpu)
>          if (ri->type & ARM_CP_NO_RAW) {
>              continue;
>          }
> -        cpu->cpreg_values[i] =3D read_raw_cp_reg(&cpu->env, ri);
> +
> +        newval =3D read_raw_cp_reg(&cpu->env, ri);
> +        if (kvm_sync) {
> +            /*
> +             * Only sync if the previous list->cpustate sync succeeded.
> +             * Rather than tracking the success/failure state for every
> +             * item in the list, we just recheck "does the raw write we =
must
> +             * have made in write_list_to_cpustate() read back OK" here.
> +             */
> +            uint64_t oldval =3D cpu->cpreg_values[i];
> +
> +            if (oldval =3D=3D newval) {
> +                continue;
> +            }
> +
> +            write_raw_cp_reg(&cpu->env, ri, oldval);
> +            if (read_raw_cp_reg(&cpu->env, ri) !=3D oldval) {
> +                continue;
> +            }
> +
> +            write_raw_cp_reg(&cpu->env, ri, newval);
> +        }
> +        cpu->cpreg_values[i] =3D newval;
>      }
>      return ok;
>  }
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 79a79f01905..59956346126 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -497,6 +497,14 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
>          fprintf(stderr, "write_kvmstate_to_list failed\n");
>          abort();
>      }
> +    /*
> +     * Sync the reset values also into the CPUState. This is necessary
> +     * because the next thing we do will be a kvm_arch_put_registers()
> +     * which will update the list values from the CPUState before copying
> +     * the list values back to KVM. It's OK to ignore failure returns he=
re
> +     * for the same reason we do so in kvm_arch_get_registers().
> +     */
> +    write_list_to_cpustate(cpu);
>  }
>
>  /*
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 50327989dcc..327375f6252 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -384,24 +384,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>
> -    /* Note that we do not call write_cpustate_to_list()
> -     * here, so we are only writing the tuple list back to
> -     * KVM. This is safe because nothing can change the
> -     * CPUARMState cp15 fields (in particular gdb accesses cannot)
> -     * and so there are no changes to sync. In fact syncing would
> -     * be wrong at this point: for a constant register where TCG and
> -     * KVM disagree about its value, the preceding write_list_to_cpustat=
e()
> -     * would not have had any effect on the CPUARMState value (since the
> -     * register is read-only), and a write_cpustate_to_list() here would
> -     * then try to write the TCG value back into KVM -- this would either
> -     * fail or incorrectly change the value the guest sees.
> -     *
> -     * If we ever want to allow the user to modify cp15 registers via
> -     * the gdb stub, we would need to be more clever here (for instance
> -     * tracking the set of registers kvm_arch_get_registers() successful=
ly
> -     * managed to update the CPUARMState with, and only allowing those
> -     * to be written back up into the kernel).
> -     */
> +    write_cpustate_to_list(cpu, true);
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 089af9c5f02..e3ba1492482 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -838,6 +838,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>
> +    write_cpustate_to_list(cpu, true);
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index b2925496148..124192bfc26 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -630,7 +630,7 @@ static int cpu_pre_save(void *opaque)
>              abort();
>          }
>      } else {
> -        if (!write_cpustate_to_list(cpu)) {
> +        if (!write_cpustate_to_list(cpu, false)) {
>              /* This should never fail. */
>              abort();
>          }

Hmm so running my testcase:

 * gdbstub enabled with an active sw or hw breakpoint
 * run userspace program in guest:
   - sw breakpoint works fine
   - hw breakpoint never triggers because guest segs

But it's a weird failure case because it's not at the BP site, the guest
segs in strlen for some reason, see the guest log:

  (gdb) start
  Temporary breakpoint 1 at 0x400d2c: file /home/alex/lsrc/qemu.git/tests/t=
cg/arm/fcvt.c, line 407.
  Starting program: /home/alex/lsrc/qemu.git/aarch64-linux-user/tests/fcvt

  Temporary breakpoint 1, main (argc=3D1, argv=3D0xfffffffff838) at /home/a=
lex/lsrc/qemu.git/tests/tcg/arm/fcvt.c:407
  407         printf("#### Enabling IEEE Half Precision\n");
  (gdb) bt
  #0  main (argc=3D1, argv=3D0xfffffffff838) at /home/alex/lsrc/qemu.git/te=
sts/tcg/arm/fcvt.c:407
  (gdb) break convert_single_to_half
  Breakpoint 2 at 0x40088c: file /home/alex/lsrc/qemu.git/tests/tcg/arm/fcv=
t.c, line 118.
  (gdb) c
  Continuing.
  #### Enabling IEEE Half Precision
  ### Rounding to nearest

  Breakpoint 2, convert_single_to_half () at /home/alex/lsrc/qemu.git/tests=
/tcg/arm/fcvt.c:118
  118         printf("Converting single-precision to half-precision\n");
  (gdb) c
  Continuing.
  #### Enabling IEEE Half Precision
  ### Rounding to nearest

  Program received signal SIGSEGV, Segmentation fault.
  0x0000000000416150 in strlen ()
  (gdb) bt
  #0  0x0000000000416150 in strlen ()
  #1  0x00000000004079b8 in puts ()
  #2  0x0000000000400898 in convert_single_to_half () at /home/alex/lsrc/qe=
mu.git/tests/tcg/arm/fcvt.c:118
  #3  0x0000000000400d88 in main (argc=3D-2384, argv=3D0xfffffffff698) at /=
home/alex/lsrc/qemu.git/tests/tcg/arm/fcvt.c:412

--
Alex Benn=C3=A9e

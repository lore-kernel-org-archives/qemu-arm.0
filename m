Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662E2108B8F1
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 10:53:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3XSv-0003er-TI; Fri, 20 Mar 2026 06:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3XSv-0003eU-3s
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 06:52:29 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3XSt-000808-H4
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 06:52:28 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ad46a44easo1559297d50.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 03:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774003946; cv=none;
 d=google.com; s=arc-20240605;
 b=FUh7M3HMraoiRilYCNCdrQUrnRoRCnYsDjzyTHZL+ISqVtYatDQkmeg8OMdV+Wg+Tr
 NM9ERVAK4NTCvi8zSzlPlGUDt4xAR2fiNKi5fI/Cq+KuNbtjV11jz8JP3m+riowW8FwB
 rmc0hfySs0R1jnhRsqpEf8vWXJdLFVbQsEE4ELKvGU4z39otm+vnndahfLLJDU3k/JyI
 WXYv/pAfATONh7ek7XtknvB7320j/3nz4U616cWVuBg6LbXx94TO36opHRe6AVvGk8fe
 amwE5/XODEgcEURPk/UrJ/2j10K8K2eW3A5Heile/rvhAsG3qzS/UChOmMPtuuGhGgZ+
 HDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Z6PPnfzUTwjFX86DMtMJF/Tfkc2SPydseYXWWsYUlYg=;
 fh=R3io8sV+WXwTGasLOXRO0Z/iuiXkFSMmQdEM59faC7Y=;
 b=GSpZJnXLhRCARM6GxGy0j5gLPRlWwQ6deTrlMhh0208uBaCXFK6i/z6xI+S64+viwE
 s+sbHG5oO+JAOMjpRkYKYWkGKJTyzFAaFoFpk4WtUM3Qx5Yc0iJkoLcgZCqDW+NuuopZ
 cu4URo10cj1VtAOVW4zbE+2NlMAUFFix/U8+elNL1Q8cpjHQs/8bOn5TwtGER2IXg39J
 mAUR0b/AJA9ZMMSPWKU1zEU2+8s5aYxjqorjQm0eyA+nFXH8mU6a2BlJA/eGZp70qKNU
 etzxsruQ+tBGlzNEeoKXHxt/oSalnMKtJAkHINJHkObsB7ITYRSHcX41pX7qGSPU5jsB
 8ksQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774003946; x=1774608746; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6PPnfzUTwjFX86DMtMJF/Tfkc2SPydseYXWWsYUlYg=;
 b=mVhT0zI3GUmZ6Hg+m+j2Uz/4ZMrBLIq6DL6hB0Tkg5ZeEBaYaMJkVqaJZsuplyXMEk
 08tg+b/0qHdnD/wWjr/qjAoOGKKjWtG8ylsvy+J00feoWbinmGAb5bGgLEPHYYEd9Iuj
 q4i6zYqcgP5WGbMbi/42sUrF9x1kCOYCjoh+DMp2n/5CAyPOsWm70GKxBxOYStQFa8hI
 usXQyRnZ+UyyCNK05mXBUOyuu37B0DfmROY3CPnACBaJYo1GJrd82ZhaCnKOih+uCLXt
 X8zW+EgRlVUrG9vHcrNKrv7BV5gXLsQbUjC0ij8fOOrjK8wmE7m9+mcJh+9za0LOO1nj
 Rfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774003946; x=1774608746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6PPnfzUTwjFX86DMtMJF/Tfkc2SPydseYXWWsYUlYg=;
 b=YIgIJpj3yPD2PfS0fbLnnFgl1JQiWE5nyZRVYMDm5r/kjoNWvk0ueGZj0/bOAT0/lV
 HWK6UMOW+oM8C1AUAyoYsI73UvEcf0e0ja0P+SAFH3uz9iENN8zNrKSeuu68MdQxTuQe
 zBDNdiyeHr/z0NAqgbRr/VvsLEadDP3V0PrMKaT6i6BqivdPUawyxp+q/8oiylNIjgQd
 Qf59PlTIdNq9IWb1PQvjoSJz3hmFpSdZdIU+Ncl57zkemZX2+9R6/EqcsW2ul2W7KiXy
 uD72cvPo2BlKAfHv/hsXOHARcCvCHhpyDxYw1W1HACNfLV1eNQliM6155EE/7Kcbc7kB
 Pe7w==
X-Gm-Message-State: AOJu0YxvnqU6CU34ZRVGto0sBibSnKaOVzInfeEDLeLP28zpy+XKj0x6
 Ywl6eIuhn8TFKL558dCnB1zm+gd/KjEyLtcVF/cnqL7iu4IP+glfJd2LcE+SBSY0JxGP//79OCx
 SYS6H2nzF2Wo1JvLActk4GjK8FHdnSI7uqcpghvKMSQ==
X-Gm-Gg: ATEYQzyOwGbHb/HrmA3vt1CFhqNk4/E2PaRREGu9EZHDfy3+CECOJIiTTkPdKxcs5Cs
 YflLJXIFEhBHuou3CuSL98zZGYJPbDAOmROSx4FS/VQeIpX2s+yTqtnh4fxFPmqWnH5ytcQLjHU
 dxq7CUbn5q93yp4+x+2zbay7jJgsdDFdGj9JamlazAwqb2B0/XX/Vi30JjTUUd9T/d/UBkKi5Zz
 28RMeF1frf5RzxyTsqlYx2yiIotC7RpIJeDDZ0erGckrh2HL+uYsu+jMfwqsrHO2BWyKTQMiPPx
 aGwzJ/axt2+qnlN5BJ2b/7dED4brKFh1B2s01WwefgqlsoGu1x+YulaQk8NBf3DhqxuTljNfmwN
 V+w==
X-Received: by 2002:a53:d7c8:0:b0:64c:f90c:743b with SMTP id
 956f58d0204a3-64eaa764fe2mr1951252d50.41.1774003946077; Fri, 20 Mar 2026
 03:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260315163840.30741-1-zenghui.yu@linux.dev>
In-Reply-To: <20260315163840.30741-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2026 10:52:14 +0000
X-Gm-Features: AaiRm53-BBalFXXadzniPrFk6Ut4vlJ4b4rvFsowSFtqiBYHwbN73pNDXqqWoVw
Message-ID: <CAFEAcA_kj1eRpjMYDF4b6hD1_P0+PazzdHFfTJFj=Hn231DBGA@mail.gmail.com>
Subject: Re: [PATCH rfc] hvf: arm: Inject SEA when executing insn in invalid
 memory range
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 15 Mar 2026 at 16:39, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> It seems that hvf doesn't deal with the abort generated when guest tries to
> execute instructions outside of the valid physical memory range, for
> unknown reason. The abort is forwarded to userspace and QEMU doesn't handle
> it either, which ends up with faulting on the same instruction infinitely.
>
> This was noticed by the kvm-unit-tests/selftest-vectors-kernel failure:
>
>   timeout -k 1s --foreground 90s /opt/homebrew/bin/qemu-system-aarch64 \
>     -nodefaults -machine virt -accel hvf -cpu host \
>     -device virtio-serial-device -device virtconsole,chardev=ctd \
>     -chardev testdev,id=ctd -device pci-testdev -display none \
>     -serial stdio -kernel arm/selftest.flat -smp 1 -append vectors-kernel
>
>   PASS: selftest: vectors-kernel: und
>   PASS: selftest: vectors-kernel: svc
>   qemu-system-aarch64: 0xffffc000: unhandled exception ec=0x20
>   qemu-system-aarch64: 0xffffc000: unhandled exception ec=0x20
>   qemu-system-aarch64: 0xffffc000: unhandled exception ec=0x20
>   [...]
>
> It's apparent that the guest is braindead and it's unsure what prevents hvf
> from injecting an abort directly in that case. Try to deal with the insane
> guest in QEMU by injecting an SEA back into it in the EC_INSNABORT
> emulation path.

Shouldn't that be an AddressSize fault, not an external abort?

My guess would be that hvf is handing us the EC_INSNABORT
cases for the same reason it hands us EC_DATABORT cases --
we might have some ability to emulate the access. We probably
also get this for cases like "guest tries to execute out of
an MMIO device".

What happens for a data access to this kind of
out-of-the-physical-memory-range address? Does hvf
pass it back to us, or handle it internally?

Is the problem here a bogus virtual address from the guest's
point of view, or a valid virtual address that the guest's
page tables have translated to an invalid (intermediate)
physical address ?

> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  target/arm/hvf/hvf.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index aabc7d32c1..54d6ea469c 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2332,9 +2332,32 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
>          bool ea = (syndrome >> 9) & 1;
>          bool s1ptw = (syndrome >> 7) & 1;
>          uint32_t ifsc = (syndrome >> 0) & 0x3f;
> +        uint64_t ipa = excp->physical_address;
> +        AddressSpace *as = cpu_get_address_space(cpu, ARMASIdx_NS);
> +        hwaddr xlat;
> +        MemoryRegion *mr;
> +
> +        cpu_synchronize_state(cpu);
>
>          trace_hvf_insn_abort(env->pc, set, fnv, ea, s1ptw, ifsc);
>
> +        /*
> +         * TODO: If s1ptw, this is an error in the guest os page tables.
> +         * Inject the exception into the guest.
> +         */
> +        assert(!s1ptw);
> +
> +        mr = address_space_translate(as, ipa, &xlat, NULL, false,
> +                                     MEMTXATTRS_UNSPECIFIED);
> +        if (unlikely(!memory_region_is_ram(mr))) {

This doesn't look like the right kind of check, given the
stated problem. Addresses can be in range but not have RAM.

> +            uint32_t syn;
> +
> +            /* inject an SEA back into the guest */
> +            syn = syn_insn_abort(arm_current_el(env) == 1, ea, false, 0x10);
> +            hvf_raise_exception(cpu, EXCP_PREFETCH_ABORT, syn, 1);
> +            break;
> +        }
> +
>          /* fall through */

This "fall through" remains not correct, I think, and it's kind
of a big part of the problem here -- if we get an EC_INSNABORT
handed to us by hvf, then we could:
 * stop execution, exiting QEMU (as a "situation we can't
   handle and don't know what to do with")
 * advance the PC over the insn (questionable...)
 * feed some kind of exception into the guest

but "continue execution of the guest without changing PC at all"
is definitely wrong. A fix for this problem ought to involve
changing the EC_INSNABORT case so that it no lenger does that
"fall through to default" at all.

thanks
-- PMM


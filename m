Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp293742ejc;
        Thu, 19 Jan 2023 04:32:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2KV43QJSB0BiS69Bj9TXwTPmp+3JNgejR7GCA3+XvEyoV1qqVQ/rzBQYaeFCyHx6f7TDO
X-Received: by 2002:adf:f7c6:0:b0:2bd:dc81:286e with SMTP id a6-20020adff7c6000000b002bddc81286emr9596453wrq.37.1674131540132;
        Thu, 19 Jan 2023 04:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131540; cv=none;
        d=google.com; s=arc-20160816;
        b=jID02cYdKtFqe1IvaAeVMTClkHNptz9oT1fz0Ski2gARnkhTcKxFBkFnChpmX/ujrG
         8nGLsa9x+aImMIr/r8NEdEWKdMQXJSx5Y248eBl7Ojs9SgPfubvbo7B5xXAm8rukbSs7
         OVdh2qcb2fVHoDybnAUXBK9hsm/HChxXR8Y7cHmtbGOHK/kgrlbdiKZJ6H22yhakaEig
         4aAm0CcFOLdlDDA+6n6sgSqDuJXSDmyvqhhaD8FdtojkVHn+L0NybyWyFRxxrZcnsYHA
         fvW/RFRv1+GKbCRk6Ellfz3R2s9QMJy0LgZ80u3C3UhfuKhK4EGxMv03FovJHTH/dMSu
         nc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=9+L1SQIrEUE97f/bZ0nkPw3GH4QiHeOKZFUoaUOMW9s=;
        b=0ydbJZVAqk+91ufDrOTkxn/vF0ZMagmwPsKvLiSvxM1SH6JJcnq4NaAR4czs1zTRB+
         okakwzW5/N4OCz5hL7SswNPSZiVQzs6Gu74PDZTSm515pl1sYPZE2lQSy5nZPNLqvoME
         dgl0IrX4askd7bu0A+k91EWk6bb1y+O2cxweWE+wUeoGuEGnAJB4Gcig/kQpO7J/cY6d
         exzU/FLCorgFELRIlmC5ISxNEwtnf5Z8t2qESrjHnGXnKmIaR/HL1Zx237oZe3SYR8Yq
         a2OjVHomMRrNw9fPsuvTkD7B8h3aYk2QOnwQjDgj5y1xf/QVXxtJxHrjLc+c0Pt//QYG
         FfVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wC0912m4;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id a3-20020a056000050300b002be1e9f819asi7573533wrf.1040.2023.01.19.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 04:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wC0912m4;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8C653886E;
	Thu, 19 Jan 2023 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674131539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+L1SQIrEUE97f/bZ0nkPw3GH4QiHeOKZFUoaUOMW9s=;
	b=wC0912m4jN4efZvMtd24pIpXV75dAFUR4C+7bN2ti+4g8AekWS4AcshYh+7VxwzBE29dqO
	U/W/TljAr3AG8dwaCuFocQRUYQiqAkgd0EdCqqGhtCpleAqhSMi+lHrffUQZl5YCMwdKf5
	4R1RGMosWBPEkTmuQW+erRnn7mYzTfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674131539;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+L1SQIrEUE97f/bZ0nkPw3GH4QiHeOKZFUoaUOMW9s=;
	b=EaGqgo8nWU72vaH3erunFFHvx1y5v/gQMxMof7khTzQMNVL7R0Nt8okmKmyI+FUxQi/1eE
	YD24h8PNt76VC5DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 49821139ED;
	Thu, 19 Jan 2023 12:32:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WcdYBVM4yWO3YQAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 12:32:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Date: Thu, 19 Jan 2023 09:32:16 -0300
Message-ID: <87bkmu1z8v.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Aczrh5HFw2M7

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>=20
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>=20
>> For the build _with_ TCG, this should behave the same as master.
>>=20
>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@lina=
ro.org
>>=20
>> Claudio Fontana (5):
>>    target/arm: rename handle_semihosting to tcg_handle_semihosting
>>    target/arm: wrap psci call with tcg_enabled
>>    target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>>    target/arm: move helpers to tcg/
>>    target/arm: Move psci.c into the tcg directory
>>=20
>> Fabiano Rosas (15):
>>    target/arm: Move PC alignment check
>>    target/arm: Move cpregs code out of cpu.h
>>    target/arm: Move cpregs code into cpregs.c
>>    target/arm: Move define_debug_regs() to cpregs.c
>>    target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
>>    target/arm: move translate modules to tcg/
>>    target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
>>    target/arm: Move hflags code into the tcg directory
>>    target/arm: Move regime_using_lpae_format into internal.h
>>    target/arm: Don't access TCG code when debugging with KVM
>>    cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
>>    target/arm: Move cortex sysregs into cpregs.c
>>    tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
>>    tests/avocado: Skip tests that require a missing accelerator
>>    tests/avocado: Tag TCG tests with accel:tcg
>
> Testing on Darwin:
>
> 14/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp=20
>=20=20
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code=20
> should not be reached
> 17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test=20
>          qemu-system-aarch64: unknown type 'arm-gicv3'
> 18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
> qemu-system-aarch64: No machine specified, and there is no default
> 20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>
> Reproducers:
>
> $ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest=20
> -monitor stdio
> QEMU 7.2.50 monitor - type 'help' for more information
> (qemu) gva2gpa 0
> **
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code=20
> should not be reached
> Bail out!=20
> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code=20
> should not be reached
> Abort trap: 6
>
>      frame #4: 0x0000000101fdd6cc=20
> libglib-2.0.0.dylib`g_assertion_message_expr + 116
>      frame #5: 0x0000000100360ce0=20
> qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=3D<unavailable>,=20
> secstate=3D<unavailable>) at helper.c:2495:5
>      frame #6: 0x000000010035f7f4=20
> qemu-system-aarch64`arm_mmu_idx_el(env=3D<unavailable>, el=3D<unavailable=
>)=20
> at helper.c:2514:16
>      frame #7: 0x00000001002d17ec=20
> qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=3D<unavailable>,=
=20
> addr=3D0, attrs=3D0x000000016fdfda50) at ptw.c:2982:23
>      frame #8: 0x00000001003c660c=20
> qemu-system-aarch64`hmp_gva2gpa(mon=3D0x000060000390f0c0,=20
> qdict=3D<unavailable>) at misc.c:714:12
>
> $ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
> qemu-system-aarch64: unknown type 'arm-gicv3'
> Abort trap: 6
>
>      frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
>      frame #3: 0x00000001003d32e8=20
> qemu-system-aarch64`qdev_new(name=3D"arm-gicv3") at qdev.c:164:9
>      frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init=20
> [inlined] create_gic(sms=3D0x0000000103ff0d10) at sbsa-ref.c:405:16
>      frame #5: 0x00000001002f30a0=20
> qemu-system-aarch64`sbsa_ref_init(machine=3D0x0000000103ff0d10) at=20
> sbsa-ref.c:773:5
>      frame #6: 0x00000001000905c0=20
> qemu-system-aarch64`machine_run_board_init(machine=3D0x0000000103ff0d10,=
=20
> mem_path=3D<unavailable>, errp=3D<unavailable>) at machine.c:1404:5

Are these errors without TCG? If so they will be fixed by the other half
of the series by removing the machines/cpus that depend on TCG. Nothing
against fixing this now in the specific tests, of course, but a user on
the cmdline would also hit these.

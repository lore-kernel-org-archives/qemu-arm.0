Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81FCCD98F2
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:38:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waA87-0007Aq-ON; Thu, 18 Jun 2026 06:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waA86-0007AM-4Q
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:37:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waA84-0000HP-CK
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:37:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so4761485e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781779066; x=1782383866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDxznsl/6Uo/ITlkR7IfOweSjgQg0yr1ktlstQMVMkw=;
 b=HXLsguZ5jQ3b74GWgaw8TolLeSfILhDgirs4wk1u8edSWgXjZgM6wNuddywg5N6LPq
 L2gS0qOPN59PJRRRZFM8ILoNQ1+w7tkorKk0WJMZKdYQCAqVEv7jyeB5gIAH8EM0bqPM
 q/hHOPzDkkc9uncSsJRoeIyBnMQvnSt/IK+4lL2QxMNHciaCejaXLyga/ceqgjWLCliP
 KWNab9KmCHAh8tz/kNvBKReJFkNZx85dOx3DU2T1JywYW5sbs8b13vQZ/yfsGvXeDUc0
 7/7bCsEp+lVVa4l/z1gda8GN5ZjrThSTO8AKDM3/F03lLTTBA/JMZDBKSeEcG41D3udu
 PMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781779066; x=1782383866;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDxznsl/6Uo/ITlkR7IfOweSjgQg0yr1ktlstQMVMkw=;
 b=NFnguBBc4S1cGrchgcoDMWHAdQQ9U/T1pavC95JM7nLAhKxF0BkmpcdIfqS5+7Bbvn
 d5q4fQv03Gbmja8uqUxhhcYF1yVd5G4CIf/xSR0MLx3nMhqBIWOr2aQ0pF1SgjjKvLHQ
 80+GFrgmvNNAkGEqNIbYiFgmeIDXX0sbaTgmQqSTs2MFMrcxPL4kbhd9pTNqpPi4Zl9S
 ZplNmOzG/a74RQ/yFbqTrTCRjhOCKNrp4P4CyqX+xJII1BQClntz59tih7VpDeRVLmx1
 FQ8yS1N0uGB9XNq5sGfJVl/YZshmcworqIDNh7qTJWwJJc3pbVyWF/QOFachC5nWVu7A
 K/Hg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/FAWQj3pixkrngeBmy6ilZnoVKlazXTwfC61DmM4tIX/lG9fMojcjOquBO5Zs6rOcrBVv04YhS+Q==@nongnu.org
X-Gm-Message-State: AOJu0YzoodM+pcspVeAs5NeESlvV8/GwyK79KE8pyMkvQkAvC5NMUKUq
 OMGcqIeFF07x9LkBg1bKNyAyoEvhGHDFid+hQPzgaWLG0/wGsvh+WrMunpWepxG5lWE=
X-Gm-Gg: AfdE7clmblVc8TeeVUHP/s8Fp5UZvS93EmVj0elbA5L5EzPH4MqLS0cJB3/PHXhfa/c
 pDOi5tVTJyX9hZHgN5WM/P+BLrxyZoLXBhSxAzZRAHYzR3U27X+P3pxzPcg66HR9nTTRYLpQk/P
 vi4+ppGyQua7qI4wsOGiYBsBtwy54SXmujID5VC7s8F64s/hQNBRUD6VYv8boVXEuMRAFyFF/nG
 gS6rp9s3JeKUxaFRXUNXTjMUW/xGxNAZR7OsFN8HKYaBNj6FW+HpptUmdiA+mQkB/bV7CamXa2l
 ZbfOOwm8gigsdSwvHv3h8qUHNERRrRm0H3XG9l4u5TVEmMaQBtoWzenwdf7plq5xhm/WgCdO/0A
 Kt2JgQWlpMCetjB7sWF6gSPwADeSd0HL/GRIlPK+f5WI+dWiI19jZg3Yi534FermtOrxPbOnT6+
 s30of7Gd1icOo6
X-Received: by 2002:a05:600c:1395:b0:490:e5c1:b8b9 with SMTP id
 5b1f17b1804b1-4923a8c402emr25812765e9.0.1781779066259; 
 Thu, 18 Jun 2026 03:37:46 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm265073355e9.12.2026.06.18.03.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 03:37:45 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AF69A5F905;
 Thu, 18 Jun 2026 11:37:44 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Arnd Bergmann <arnd@linaro.org>,  Tyrone Ting
 <kfting@nuvoton.com>,  Hao Wu <wuhaotsh@google.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  "open list:Nuvoton NPCM7xx"
 <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] hw/arm: use correct base address when setting CBAR
In-Reply-To: <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
 ("Philippe =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 18 Jun 2026
 12:07:19 +0200")
References: <20260618093615.3793919-1-alex.bennee@linaro.org>
 <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
User-Agent: mu4e 1.14.2-pre1; emacs 30.1
Date: Thu, 18 Jun 2026 11:37:44 +0100
Message-ID: <87pl1ogmmf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> On 18/6/26 11:36, Alex Benn=C3=83=C2=A9e wrote:
>> This should point at the base of the Cortex-A9 MPCore private address
>> space. If it doesn't we will confuse the Linux kernel as it probes the
>> SCU registers and erroneously assumes the system is a buggy Aegis SOC
>> and nerf the emission of SEV instructions, deadlocking any WFE's in
>> the kernel (or QEMU smpboot code).
>
> I'm confused...
>
>   The Configuration Base Address Register holds the physical base
>   address of the memory-mapped GIC CPU interface registers.

For which CPU? These are cortex-a9's not a57's and the behaviour is
IMPDEF.

See:

  https://developer.arm.com/documentation/ddi0407/i/introduction/private-me=
mory-region

>
> NPCM7XX_GIC_CPU_IF_ADDR is the correct address of "the memory-mapped
> GIC CPU interface", NPCM7XX_CPUP_BA is the A9MPCORE SCU MMIO address.
> AFAIU the modelling looks correct.
>
> Per your description, the Linux guest tries to access GIC_CPU_IF_ADDR
> but ends up accessing SCU_ADDR? Maybe the issue is with the
> arm_boot_info::gic_cpu_if_addr address we pass to the guest? Maybe
> the secondary reset code is corrupted?
>
> static const ARMInsnFixup smpboot[] =3D {
>     { 0xe59f2028 }, /* ldr r2, gic_cpu_if */
>     { 0xe59f0028 }, /* ldr r0, bootreg_addr */
>     { 0xe3a01001 }, /* mov r1, #1 */
>     { 0xe5821000 }, /* str r1, [r2] - set GICC_CTLR.Enable */
>     { 0xe3a010ff }, /* mov r1, #0xff */
>     { 0xe5821004 }, /* str r1, [r2, 4] - set GIC_PMR.Priority to 0xff */
>     { 0, FIXUP_DSB },   /* dsb */
>     { 0xe320f003 }, /* wfi */
>     { 0xe5901000 }, /* ldr     r1, [r0] */
>     { 0xe1110001 }, /* tst     r1, r1 */
>     { 0x0afffffb }, /* beq     <wfi> */
>     { 0xe12fff11 }, /* bx      r1 */
>     { 0, FIXUP_GIC_CPU_IF }, /* gic_cpu_if: .word 0x.... */
>
> Can you check ^^^ this value?

I don't think we use this for npcm7xx:

  static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
                                           const struct arm_boot_info *info)
  {
      /*
       * The default smpboot stub halts the secondary CPU with a 'wfi'
       * instruction, but the arch/arm/mach-npcm/platsmp.c in the Linux ker=
nel
       * does not send an IPI to wake it up, so the second CPU fails to boo=
t. So
       * we need to provide our own smpboot stub that can not use 'wfi', it=
 has
       * to spin the secondary CPU until the first CPU writes to the SCRPAD=
 reg.
       */
      uint32_t smpboot[] =3D {
          0xe59f2018,     /* ldr r2, bootreg_addr */
          0xe3a00000,     /* mov r0, #0 */
          0xe5820000,     /* str r0, [r2] */
          0xe320f002,     /* wfe */
          0xe5921000,     /* ldr r1, [r2] */
          0xe1110001,     /* tst r1, r1 */
          0x0afffffb,     /* beq <wfe> */
          0xe12fff11,     /* bx r1 */
          NPCM7XX_SMP_BOOTREG_ADDR,
      };
      int i;

      for (i =3D 0; i < ARRAY_SIZE(smpboot); i++) {
          smpboot[i] =3D tswap32(smpboot[i]);
      }

      rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot),
                         NPCM7XX_SMP_LOADER_START);
  }


>
> Maybe this code has to be updated for your WFE use case?

In earlier attempts I did drop the wfe in favour of a NOP until I
figured out why the SEV's were not flowing.

>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Suggested-by: Arnd Bergmann <arnd@linaro.org>
>> ---
>>   hw/arm/npcm7xx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
>> index c2bbcd89dbc..c27f149c04a 100644
>> --- a/hw/arm/npcm7xx.c
>> +++ b/hw/arm/npcm7xx.c
>> @@ -492,7 +492,7 @@ static void npcm7xx_realize(DeviceState *dev, Error =
**errp)
>>       /* CPUs */
>>       for (i =3D 0; i < nc->num_cpus; i++) {
>>           object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
>> -                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
>> +                                NPCM7XX_CPUP_BA, &error_abort);
>>           object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", t=
rue,
>>                                    &error_abort);
>>=20=20=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F3C5B572
	for <qemu-arm@archiver.kernel.org>; Sat, 22 Aug 2026 21:06:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxsvP-0000XN-Ra; Sat, 22 Aug 2026 17:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wxsvO-0000Ws-4a
 for qemu-arm@nongnu.org; Sat, 22 Aug 2026 17:06:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wxsvM-0003Nj-AM
 for qemu-arm@nongnu.org; Sat, 22 Aug 2026 17:06:45 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c15c42a45adso528483766b.0
 for <qemu-arm@nongnu.org>; Sat, 22 Aug 2026 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787432802; x=1788037602; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7hfdKEto3Mfut07oAlYPNJk31gEIeim99CqprSe3al8=;
 b=PJOZR6HM8aODu5Iv/qfCqQOybL71UCP2K/X7AGHwmuHnEX8AMFm84ikFyTKIRjpQjl
 mJuzZg7jX30Xx1vHuWxkgOQFVeaxXQi6vYbX2J75XieXxOP8jCR1Zz26XOx92jzCOG5Z
 jIvV76FfIoJAlzIXGwy8SL9lgZB5b08/dUh/MGoSH4qh7RxQcUMY1qXiY48ShGYaITmL
 2lYEH8ozmsXyLnh2V8ttbG3xEHcZxOSB2QxCiLHo/GHh+Ud+xzGWvVt7Szh5n+/niaKn
 hpdoNe7l1siW9Ela3zaJdDBbakHowU4pBZExIxrPEcRsVkPBDuQJfmX7KC+20PNan7rZ
 yYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787432802; x=1788037602;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7hfdKEto3Mfut07oAlYPNJk31gEIeim99CqprSe3al8=;
 b=OIglZ7pVezAxROoQvYUk0iLfclo3XXHCz+MiT/jlcCNFERIngnIvTirlo6H/TMg+yd
 QWK2t7l2+ynYtciP6PDMcQEemkb/0Pf4ioTF5eWgTVKUcWEyu5mNBcgj8QmfoRNLqB4O
 jExOhszNqlqIVcp9//M7UWCZbHwdEzJSR2YR5N04dCjR8yFzm+Io2vSYpHjbWmcdcH2c
 In0/mApoaom6EczEAV+a03V0YjXBDLyYjTf/tY9fjVkdxa4a/ZoCz4YwqjQmTndFGoyH
 n1j+MKlil4hulhEHHWjWERITx025+3uQrHNnc9wJCMGlBCimQpFjJnyf2daO6OKJOf4+
 R+4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNs+hasvwuYGIeWc75lyu9V7rG8itVgZD2AiEoau7eOZO4VAlHUovcSbE/ZsbpA0P44hs3cy/PWQ==@nongnu.org
X-Gm-Message-State: AFuF++lxtWSf6VPr21m2wd2WNfzdpP+d/YWpw8r7DiaY+2TsQDWYOzai
 JP7dCr6zDWrLzu8Y3qlfcMTZdXEiKxNShljrvCagctDr4XYOT7/KpBGZ
X-Gm-Gg: AR+sD104Yo6FeL9GLs3An/gUubnIAD+RKlorT6XX5jkwHg0hdBjXOiEQYX0GptlHdYc
 pyarb0KtYeHi8fcPqWLFKuvtgkGrSmjSV8M5kcTuLDTv0vexcqami6NfdQyyi5kUVd/ixdfvEkC
 B/C/DWnPf54hvqx1hNbUUNGbfZ+S9vgG03CT34Xak/KBlnRsqPfs84LQ8r1mHUJYLWRRJdnR3Rs
 atgYOPbc2oPzJSKGICkL2vkPF5t3tEFSp5cyDRoZDbvIkti2gcB5lOmvnce7APBjwMHc79CkuDI
 3ECQnEN6SRTpiqSB3UXiocCFMavSEfW4TAAioRUOmLjrifgwQdCbMCmd56ONu/E9L3VlkLHL0J1
 stl0gIeHvsyZPDPWo164BZ89CNE3X9ZMlpkHOMQDjSoPL9EopC311r4RuaKDIQW02SQtXJHrmFz
 fRESgIr0L5wKa4rIKuTCAeYcLmxjMSSjwk+pU39LP3OsjnkLJ0dQ==
X-Received: by 2002:a17:907:d641:b0:c12:8a:7d7b with SMTP id
 a640c23a62f3a-c244d45ad42mr2113491666b.1.1787432802349; 
 Sat, 22 Aug 2026 14:06:42 -0700 (PDT)
Received: from localhost ([2a02:8071:50c5:5c0::361b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496296a46sm557817766b.21.2026.08.22.14.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 14:06:41 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>, Bin
 Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Fabiano
 Rosas <farosas@suse.de>
Subject: Re: [RFC PATCH v2 00/14] hw/arm: add TI AM64x SoC and am64-virt
 machine
In-Reply-To: <87qzjrojkl.fsf@draig.linaro.org>
References: <20260820124824.618671-1-wafgo01@gmail.com>
 <87qzjrojkl.fsf@draig.linaro.org>
Date: Sat, 22 Aug 2026 23:06:41 +0200
Message-ID: <87qzjpj25a.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=wafgo01@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On 2026-08-21 11:26, Alex Benn=C3=A9e wrote:

> Wadim Mueller <wafgo01@gmail.com> writes:
>
>> Add support for the TI AM64x (Sitara AM6442) SoC and a board around it,
>> ``am64-virt``. The model is complete enough to run the stock TI boot cha=
in
>> end to end:
>>
>>   ROM boot (tiboot3.bin) -> R5 SPL -> TF-A/OP-TEE -> U-Boot -> Linux SMP
>>
>> This is a resend: I posted a first RFC back in May [1] but got no feedba=
ck
>> on it. Since then was the series rebased onto actual master, reworked for
>> style and split into reviewable pieces, so I send it out again in the ho=
pe
>> of getting some review.
>>
>> RFC because I would like feedback on the overall approach before polishi=
ng
>> further; see the open questions at the end.
>>
>> [1] https://lore.kernel.org/qemu-devel/20260528211210.74266-1-wafgo01@gm=
ail.com/
>>
>> What is modelled
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> <snip>
>> Open questions
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>   * pc-bios/dtb/am64-virt.dtb: patch 13 checks in a generated DTB (with
>>     its source) for convenience. I am not sure a machine-specific blob
>>     belongs in pc-bios; happy to drop it and have the functional test
>>     generate it with dtc instead, or drop the Linux-boot part of the tes=
t.
>>
>>   * Splitting the DMSC: hw/misc/ti-dmsc.c is large because TI-SCI is
>>     large. It could be split per message class (clocks / devices /
>>     processor boot / security) if reviewers prefer, at the cost of a
>>     non-functional intermediate state.
>>
>>   * Only one of the four R5F cores is modelled. mc->max_cpus reserves
>>     room for the rest. Because the SoC realizes M4F/R5F vCPUs in addition
>>     to the A53s and every vCPU needs a TCG context slot inside
>>     smp.max_cpus, the machine defaults to the full vCPU budget. I would
>>     appreciate a better idea than the actual "fail early with an
>>     explanatory message" handling when the user passes a too-small -smp.
>>
>>   * The register-level stubs (DDRSS in particular) fake success rather
>>     than modelling the hardware. That is deliberate, but tell me if you
>>     would rather see them as plain unimplemented-device windows plus
>>     firmware quirks elsewhere.
>
> I would add one more which is who is committing to maintain this model
> if it is merged?
>

That would be me. The series already adds a MAINTAINERS entry with
S: Maintained. In v3 I will make the F: patterns narrower, because
hw/misc/ti-*.c currently claims every future TI misc device and not
only the K3 ones.

I develop and test firmware on
real AM64x silicon (a phyCORE-AM64x SoM), and I use this model every
day for this work, so I have both the hardware and the vendor boot
chain here to reproduce regressions. I also intend to review patches
which touch these files.

The testing side of the same question I have answered in the thread of
patch 14, where you raised it.

Best regards,
Wadim

> --=20
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro


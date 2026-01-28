Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BDBD3F083
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl9HS-0003pu-Cu; Wed, 28 Jan 2026 12:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl9HL-0003ho-2X
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 12:24:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl9HJ-0003Cz-B5
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 12:24:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so425065e9.3
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769621067; x=1770225867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slQ3hYd8ClQ18h9hf0kfWYDGQN5aXxFsgImjHRZGuWA=;
 b=N4YrG+X86m69mwnX48w4K6S0zW6V4q8k+2fg4vMuUmlwYh2l3SYb9prC2cMleCh9lN
 hpN95l0rBVx1Q3xPD+c3aV0RreCMbKJn7Ky5ystFnhfuWD0KQfyPVTbHUnRtxD8CiRcp
 RGmM1M7u7bwr0gWuU4rlkRqAKc7FZgRa0fvz44W8nUJa8mn5ZsfwA3weqWLNcITPkTxj
 8ZQBqMRF2M3pKXpxWejY9jI+E0oOSRvJtocowwtHtgcvue8QefqyfOy9bWTY9PIHF6SZ
 bk9yNaifhzpTPBUIar25zSfr5OqEmjO6TJqT6vy7L4g3sV00rpmAyGnfR97TtG+vtAum
 d2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769621067; x=1770225867;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slQ3hYd8ClQ18h9hf0kfWYDGQN5aXxFsgImjHRZGuWA=;
 b=snvRna/6COAXh9SDooy3+COM44Us1Gjy1U7GgcW6oxphyUjseJ0qldZPFEAotrkGvV
 VAfapLF2CmY6SYX6ESd45Zb/V398TcXBjmKfsJQrqhhEvN5s/++0Tz0QDlxIl/QQXGGS
 eWXF3CFXO4w8qgjQ/S/Pk4KDQYT3Uw8SneIcyym1m/ixTT8KYVNMkS6eaXkloDXUz5Ae
 ppG7H/+B/hHsj4ZSImcxh2muF2oLpCob8s3YqcWWUzT6AuWevdVmlhr9ACTpD03ZFAeH
 +mMk8OyvEnNeFFzBHnEwV+zXOoQ6gBTGPwzaiSbfg+XJHsv+ye2EPCJBxHgSWMze2RAD
 +p1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY3J5jzJ1+qESV1iz/hqmTt+2/18I7Lhz+3gskcExwKvnRTi6dG1nxTLtbvewG2TNgp66/2t0k4Q==@nongnu.org
X-Gm-Message-State: AOJu0YyXkw1W6kg8ul3qiCV9/2qt6iS0xZXbQJ4s/r9Z6Qfi3vI7zoTx
 tIYkoyw65a5EyijGmd//YrsmKM3C1tyhV4m6u0d2SuOEM9xrccSBBoOU+JfhjLa+hQc=
X-Gm-Gg: AZuq6aKI3ZpyeNnILseOrl3kacpsnDmoP6pEQYiuoKlaUCO74bvcZPnKKf2QJPbyF5o
 ImOxoAZbeNW+Vk3jJ6rtdiVKdI6O8qURauodo1SFmdb9lJ8NLsm5uabzcEyhqqo5OEzvgQQ7faD
 BpzilYZQCK4VIv3wLmHJ/uiDmtf5evuk7XBgkZF8VgESerPMqyxF3XWc1iHwVE7dS/OMD+p6XFI
 EThE21HbSSuMZ1+s6YlwK8MuI+nvDwU4uDi3CsMposCN/DoALNosSg758u2Qnvw5HyuCPbwI9mg
 IA+lyjxmFxRLVJL/pGOxWhKcCcS/j6aqShngN0iSN3ridpAR7LeenZ3Z1TBP7DfMNt0ywC2OzHO
 LBRJyigOVSybqtN5BRtkDI52Gnbxihvy+NCJoKbYkkYZSMizr8jwzKMWPIw70ukN+qv4OXCd+VA
 57OQp6bPcCskE+BUuyaZ4WLQ==
X-Received: by 2002:a05:600c:a102:b0:480:6fbc:695f with SMTP id
 5b1f17b1804b1-4806fbc6c9cmr25264535e9.32.1769621067257; 
 Wed, 28 Jan 2026 09:24:27 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806d255fc9sm113015e9.0.2026.01.28.09.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 09:24:26 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BCED65F895;
 Wed, 28 Jan 2026 17:24:25 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas
 Huth <thuth@redhat.com>,  Radoslaw Biernacki <rad@semihalf.com>
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
In-Reply-To: <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
 (Peter Maydell's message of "Wed, 28 Jan 2026 16:25:00 +0000")
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
 <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Wed, 28 Jan 2026 17:24:25 +0000
Message-ID: <87v7glabw6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 28 Jan 2026 at 10:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> As the builds in codelinaro.org are going away migrate the binaries to
>> share.linaro.org. As the hotlinks don't encode the filename we need to
>> explicitly tell uncompress how to handle the files.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>> @@ -54,15 +54,11 @@ class Aarch64SbsarefMachine(QemuSystemTest):
>>
>>      timeout =3D 180
>>
>> -    ASSET_FLASH0 =3D Asset(
>> -        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-=
ref/'
>> -         '20241122-189881/edk2/SBSA_FLASH0.fd.xz'),
>> -        '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384=
a5')
>> +    ASSET_FLASH0 =3D Asset('https://share.linaro.org/downloadFile?id=3D=
kyoMLGC9zXa4oA7',
>> +                         '76eb89d42eebe324e4395329f47447cda9ac920aabcf9=
9aca85424609c3384a5')
>>
>> -    ASSET_FLASH1 =3D Asset(
>> -        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-=
ref/'
>> -         '20241122-189881/edk2/SBSA_FLASH1.fd.xz'),
>> -        'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412=
fc')
>> +    ASSET_FLASH1 =3D Asset('https://share.linaro.org/downloadFile?id=3D=
Dj1HRXnDnKtU6Nj',
>> +                         'f850f243bd8dbd49c51e061e0f79f1697546938f454ae=
b59ab7d93e5f0d412fc')
>
> Is there really no way to have a human readable filename here? I know what
> edk2/SBSA_FLASH1.fd.xz is; I have no idea what
> f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc is
> going to be.

It doesn't seem so - the underlying server is:

  https://github.com/Forceu/Gokapi

>
> If we can't have useful filenames, can we have comments saying what
> the filenames
> would be if we could have them?

Yes I can add that.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


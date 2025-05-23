Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2241869njc;
        Thu, 22 May 2025 18:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCA1WCEL7Y+JPjXPBglXfshjTEiC5RRYlTx/eQTp+CRstHMKBuLSF6nAfDlmI6UgZtafpNaPObBSfUxQ==@linaro.org
X-Received: by 2002:a05:6102:d88:b0:4e2:ac09:fbac with SMTP id ada2fe7eead31-4e2ac09fd87mr12456906137.23.1747962841328;
        Thu, 22 May 2025 18:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747962841; cv=none;
        d=google.com; s=arc-20240605;
        b=kfUbc047U4mEOvQV3c7PgbGES7+EJNLJE0CNC2cSdYyFLaFvDWFgqJLktawF85hEpA
         AXafmaOWaaHE6IQV6e3XIV/ReDP308YsgX32XUVWaeOUZuZdsP+Y4F6CuZMBjXrTfrgF
         SqyrrD2QuZKCAUDCV5Pk9Mbs4k2STS8dROM6ybar0OC18NQG55uWi5yIeMHVoLfau71c
         zsPakJt6BUwFDWmMKZS2jupfbaDnyX8QnTqOVzX0sgdkCGb0LJxI8/5Fyg0DT1af51xp
         JihfgdtCjzWfYFFgS5xP0RxhDx6xkeYo5BEbkm66msVi2k4rXwtxqhlAFP5pu3PQUi+n
         Eqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gCEPHijVWh21bdlDld6lQdhgKqvpabRR/RC4fMVNV6I=;
        fh=06GzwzR3qg4AGo/gakOLySUwRiaf7g3+tg26vtCq95s=;
        b=VLNNzpZbzbtg/rWnkX4o61uWWEseX1o5QVyTGzz2m3tIzjfRcs/2NIQPeSWXtOf/qq
         y8SBCTSI7t9zlsi5z2xHwV6KJWW/wb1VI95yhvXhoZ9YogV+oZLG+aLZKDvExIrGRz5l
         a4a00Te+qPnwggij2GVVE1pAB2qanuOtm/9oypFvyyoVmUgaTNSi1Mf14khO5ARyELnH
         pRWY3imitoGlKIykkvjVvzp3DLikthNFFvv1cgwz0kZKMPYDPz3JWrijovJuaNAOr9rB
         QUJUxlSpXF9klp/bbG0euZ6lA5/9KNqZTXHsZKjgnWWfyjS/1fnQZLnWi8EMJHe0wEEZ
         Xcxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHRPwaNn;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a1e0cc1a2514c-87bec1e6d7fsor1309103241.5.2025.05.22.18.14.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 18:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHRPwaNn;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747962841; x=1748567641; darn=linaro.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCEPHijVWh21bdlDld6lQdhgKqvpabRR/RC4fMVNV6I=;
        b=DHRPwaNnHswIb1xSUsDYf2o4+uPS1THEhK/FFywE+FdCWcw95L5/jlRSj4EApY+jTm
         MtYtcuDEPrlSfOxqIGBdkS32PGmR8WqFylVgvoM/poMBT0iqEFuPMLihLWbABn++lKJ8
         CFz1cc7JMQuBUPNRiCQfBFqtGFT3HJ9ij6s13kh7Qm5PDeMuVxFpXSrnm5uiPEawG78K
         MdbmxG70Ms2QUeX3V13xLQrTjOT+E4JgTRhhJ0wV3rW5kJJ5BQywTmrkWQia7A0ueqwS
         4lyZ4meCk5yLsgELYgMPfBrxNCu3H4VceFn3Kq8oWlaEqkuI5xwFHf5ejMpsJQWCd3LL
         zRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962841; x=1748567641;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gCEPHijVWh21bdlDld6lQdhgKqvpabRR/RC4fMVNV6I=;
        b=qO5kDY6xCjI17nfZdCrtgLaeqzZJeSQdcWb7oH6KxVWwo2x8pCmrXjUv1cs7QrOO2+
         my3aOy63syO8QnW9S/abfhLMhZqZObFqlcGmerB0z34m09jTfVnGijuwX94elQycv0pI
         /S+U/UBuMyUV3U/VXV7DiSSMMkxlODJF1XpC8K04yic3h6BbgXT6juxpgj3l8SN9ikAb
         +TXXnkeOJKbN1akhu4PXYsrytaYq/jkc9qiYxYxzq6VgPWcun7k1llizVDnbTfF09sB8
         mkRCBSo+HeeoxkEiBOoFbDGHDWggHiWAf6wNQZx4um/15t5PhrGuV3JXEjGWtGaSII0S
         T95A==
X-Forwarded-Encrypted: i=1; AJvYcCUmddKg1x4jQO4lxWUkHuQS3MT0jBNqja1Eyqesy8nuDjTguSKanjYcHtoCsDwhPIk+NMq99m4ZCk70QQ==@linaro.org
X-Gm-Message-State: AOJu0Yxq40WdcoW4jiVvqUY17hZgNiw5ufsHzRHjXfFRPCo4xgRw3OtA
	tLpCXuVaQ4Y9Ox/ZZdE8+KHEzkikxYcQ3Ly/q/FpVuIuFIv/WcBhV8/PdEe/HtfSSR4S8w==
X-Gm-Gg: ASbGncu9xiUvKZ8c7cgQfc0YSGJPhQZ+ha57llS6IigX4XyP89sm/cnYMPM88gV7mS6
	FmZIZB7WD8m4uCd/F6ei3d+XqJR8pvWVRZSwAwEGBbaMQDPI6BdULMxbAIEKLmF2s6I2w0OPgI3
	Tf5nlx7v1L8jL/Hg0BdXXCCfZInbiOOzd3D6a18w4p5alz7qG9oTStbgCbxKQunPVf/7QXcVCD7
	vB3oof1O+jTgIEHig5y/L9j/dPwI9+7CeBmsuOmGszkDUmdTq7JJVrktPMRY1+Sn6RG8bzxqKwk
	KTj0yqcIXZNKkClmpSdTzAelzVnfs9/dM8HjEHxLOBThUFt+g9IYQXs03t8VlgLRGmw2QKBha4W
	86dsQChxqrdLYVm0pYI2bt3bdsSw0VhxC5eBoshr4
X-Google-Smtp-Source: AGHT+IGGijAvz7VnHBOKNCAhoV3jzSOqNpyQahifYB0fNaOmOLyCEsjvs19+dsIoiPfvscpmbJZ2DA==
X-Received: by 2002:a05:6102:370a:b0:4de:d08f:6727 with SMTP id ada2fe7eead31-4dfa6bbb263mr25240750137.13.1747962840802;
        Thu, 22 May 2025 18:14:00 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:59c4:f305:3d77:f678? ([2804:7f0:b402:6ba2:59c4:f305:3d77:f678])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa66bcf1bsm11842587137.10.2025.05.22.18.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 18:14:00 -0700 (PDT)
Message-ID: <e376b3f5-81e9-4b67-ba8c-048ca713d894@linaro.org>
Date: Thu, 22 May 2025 22:13:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Subject: New test in bios-tables-test.c for the ACPI PCI hotplug on ARM series
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: fmxc6oDS33ki

Hi Eric,

While we go through the ACPI PCI Hotplug series [0] and review it, I'm
starting to take a look at tests/qtest/bios-tables-test.c.

You mentioned testing the combinations of "acpi-root-pci-hotplug"
and "acpi-pci-hotplug-with-bridge-support" flags [1], but taking a
look now I see that "acpi-root-pci-hotplug" is only used in a PCI
context (not in PCIE, so not meaningful in GPEX), hence
"acpi-pci-hotplug-with-bridge-support" would be the interesting
flag for testing the ACPI PCI HP series for ARM. Since this maps to
'use_acpi_hotplug_bridge' variable in i386 (e.g., in ICH9 controller)
and this variable is being controlled by machine flag "acpi_pcihp"
in the series, I understand it's only a matter of testing the ACPI for
acpi_pcihp=off and acpi_pcihp=on. What do you think?


Cheers,
Gustavo

[0] https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg03487.html
[1] https://lists.nongnu.org/archive/html/qemu-trivial/2025-05/msg00020.html

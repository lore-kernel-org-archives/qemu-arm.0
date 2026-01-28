Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97282D46BEC
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 18:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlA4o-0008Be-Pg; Wed, 28 Jan 2026 13:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlA47-0007sp-Cq
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 13:14:58 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlA43-0002n4-IE
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 13:14:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso1345225e9.2
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769624090; x=1770228890; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DRcUh7PURIcQwzuyI23M4BSLo5kjaU/4yRKy2aKy23c=;
 b=CVNWK+NBzBzVu58wS+AJgHS1agaPVNnPQyOiI0CZaXPUPMKbL/RTbotFg13QL6PVYM
 tncWOm6apX83KkQsB1SNBcSbTZ7Z4zSBbGHZR863i6NmBGH+3dZBAEvSej+1kR2ADiUJ
 rRFQ2tUvd16LV+PGo0mRShOMgISKcZfAgqCHhQL2CvRyR+zRulsnSdIjOHk10SGd/Zlh
 H9RRTxyYsCcWPKy8cctgVNsfLO2vTIrGlPH5CBTtN6SvyzaL8DK1AfvGD1jXAnSNuzxX
 Wto5GyS+W4M2F6Z0fhglC5n+/+Kq9UmxNwyvBjZPvbRmo4AIxf9ClM0Nh6AdYxqOfc1k
 unGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769624090; x=1770228890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRcUh7PURIcQwzuyI23M4BSLo5kjaU/4yRKy2aKy23c=;
 b=V0tAX4HgILdnCDe/suVv8OXnBi4apNEG+Mb3I+vwco7pPdyTrTlq9W47vjp/E36Z7T
 SrPmWCE5KRcR3bGoKdpIGaAwn18OHWnxhrgNnAVuQnqbuXs7ecMUwFrDDlezO+702+c8
 giz/63cOi4JZe6KI9m2tEOj+zMqS0LHBuiL5WJq9NjmHNV42qAS6z64yMwl6+Dr+bWhD
 Ac5pCkwlZD7ja+EVOOK37hiHnoIHeXq5kqUwEGZcUSORbkD7jRf8ksnxyXeDbk+WoHiu
 9x9npSQOlZGa3ttTqyJPnGLB9sCyC5FFJV27IJrI1l+11q0nJkWszkmTPRXoegucZVzN
 jZWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ7wkexMmPcySF5uSw96stMHCrfj4l2xiDM7+Vi0uNALpgLcijd5eDTy7Wyz6+bcR7PiPK5JBgcw==@nongnu.org
X-Gm-Message-State: AOJu0Ywau62Sp6rJjUaWeh3uG7m/+L/UD7LsFMfX67iJy6mWQVQ1dQW+
 zdxDWt5ohoGcQVhJljEj85FI/NhqJencUUoqwwDvpOQn2K0qhJxwFhW6MKFnc+6zcJU=
X-Gm-Gg: AZuq6aKjmDKsIiMHcXxAMKMZ3onz//djE/soQ/r0kg9YS/NMC68fjhtwo+NF4LMl94J
 Dz66nbeqQtN2773ywuBmxCLx0UGqH/jlBt0iaTpWukn1v8RnctBWAQma+pzqZKoLQCoUFRnXUXG
 bnkHuIvKk4jDNKsi3j7aLg8sEp9phTFGPDWmXHyGaVu3RqLdg/bYlVtSQlcD9VEfpAyr/rNxJ5N
 ehimJUx5+DI1htWLpUTNwbkZ3W7yI5CcbQMoy0hZGxBhfOIE34Wu2KIycpFQkuty3AE9ADPc+Pi
 MpMWuoGiwHVHda9j3bHgTJjKzPM9cdHHvm7pMqRjIy41O172MycfV4BXV2i7eRrc3+8gOow30rL
 M+XHq0hoY/i4I4Bp/DTUkZf1Kpeb7OYO3gIZIA0XU7TPHJxbXh6wKaWGf2x+Pu9N/5KwKr2z9zE
 B/AHbI8twB5B+SKJNYLGUKnRJ+6ltqGwHT182V2zcnG3D7hh62yTOnbA==
X-Received: by 2002:a05:600c:8208:b0:47d:92bb:2723 with SMTP id
 5b1f17b1804b1-48069bfa957mr79894055e9.3.1769624089834; 
 Wed, 28 Jan 2026 10:14:49 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce564f9sm82659925e9.14.2026.01.28.10.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 10:14:49 -0800 (PST)
Message-ID: <2448d9d2-fe73-4099-8724-fac68d2533d0@linaro.org>
Date: Wed, 28 Jan 2026 19:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
 <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 28/1/26 17:25, Peter Maydell wrote:
> On Wed, 28 Jan 2026 at 10:58, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> As the builds in codelinaro.org are going away migrate the binaries to
>> share.linaro.org. As the hotlinks don't encode the filename we need to
>> explicitly tell uncompress how to handle the files.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
>> @@ -54,15 +54,11 @@ class Aarch64SbsarefMachine(QemuSystemTest):
>>
>>       timeout = 180
>>
>> -    ASSET_FLASH0 = Asset(
>> -        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
>> -         '20241122-189881/edk2/SBSA_FLASH0.fd.xz'),
>> -        '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a5')
>> +    ASSET_FLASH0 = Asset('https://share.linaro.org/downloadFile?id=kyoMLGC9zXa4oA7',
>> +                         '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a5')
>>
>> -    ASSET_FLASH1 = Asset(
>> -        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
>> -         '20241122-189881/edk2/SBSA_FLASH1.fd.xz'),
>> -        'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc')
>> +    ASSET_FLASH1 = Asset('https://share.linaro.org/downloadFile?id=Dj1HRXnDnKtU6Nj',
>> +                         'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc')
> 
> Is there really no way to have a human readable filename here? I know what
> edk2/SBSA_FLASH1.fd.xz is; I have no idea what
> f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc is
> going to be.

https://share.linaro.org/downloadFile?id=kyoMLGC9zXa4oA7&filename=edk2/SBSA_FLASH1.fd.xz 
works for me.

> 
> If we can't have useful filenames, can we have comments saying what
> the filenames
> would be if we could have them?
> 
> thanks
> -- PMM



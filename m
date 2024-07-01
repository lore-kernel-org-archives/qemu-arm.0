Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1483799njm;
        Mon, 1 Jul 2024 10:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFDF+ZLkyNdrLF2tajmoRc5yNsEgNRw2vm7Re9yPcqqNE8ThOTvCYaKaDjDtC3BzmJkeYhaEzksxM2Cume8paeZngBNnLd
X-Google-Smtp-Source: AGHT+IHbaOwqdCM1XhVG0AbJORYFCJG4ZUPwXAANWsCDyLcEy3tc7nXI3Zh4nnHG/OF78HkA9RmG
X-Received: by 2002:a05:6102:162a:b0:48f:46db:7a11 with SMTP id ada2fe7eead31-48faf062676mr4499549137.6.1719853272203;
        Mon, 01 Jul 2024 10:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719853272; cv=none;
        d=google.com; s=arc-20160816;
        b=zdS7FysSDMue68UaS9zfvTn7v2gRddoCdnF67My5d9nZ3T/AIhmz4yxhpeOwdEYrmF
         6XguEczbBQtUmYk6B78f+L2Ge6avnp3I9KIs4IWKr2mB1u+dSD/TXJllZclYKnyjYbVg
         EzU8CCyv1gapIGx272Xui0lzu1ZIfhusooCx4K8xvbsXn7PcPgbg1cJlLUx/fM/v08CO
         BV5Y8fwh2DuASzcydzrT6c9X2Oyp1oVD0+uM2R7JUFc1n0Y815dVzLei2jdTxaOiBWbV
         HXUlw5PVamVd71+qk5uDJHZC90e0LeGDRw7Y9UevLWXmpRycKzQp6I2bMJOKuh+QAIS+
         bpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mEsogqTUaDgWi+GkfAb+mJ2jGR4tDWYaiJVWVpgtbWQ=;
        fh=Vb7cbQ70HGIjnjCTLsvICfog+g03xm76vSpUneajyfs=;
        b=Pyh1Ectd/MfJHjN0yX6bXZ0kA4tNOcmuSYojuB6qfI2sIRUe2WcnUzRap1N7yA+Pw4
         Pc4yQW4enoSleb1n1ytzMK9K/sBb1g0ZTaeAml9739mp3Pg/LqZZ1gr3oRufhIxlh1Ju
         oqYn8F9/kRUGu/CIn3CPEbAFsX4a3DBnhjxK+hA/iQYPTGjfbBW/SQtP4jp4p/VPP+xm
         UP/8ZYarsJBVR4YswoatTOHf08qIpdbkTMTHtD2M3KJSp1aCt8gHzrKXHO0Cuf1jutRV
         xu2ePwroPDcv2oo6t/STXoeeu50Zs4VTxzGx1WdQRtG3auFrB1HxNUJA80FjLgGL+nTU
         96ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McybVgVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48f9b293f7csi1167116137.707.2024.07.01.10.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 10:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McybVgVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOKOQ-0007Nk-Dz; Mon, 01 Jul 2024 13:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOKOH-0007MF-6g
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 13:00:33 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOKOD-0005Lq-Hk
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 13:00:32 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so3294261e87.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719853226; x=1720458026; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mEsogqTUaDgWi+GkfAb+mJ2jGR4tDWYaiJVWVpgtbWQ=;
 b=McybVgVfGuSww4cU6RTKMcVUmOxhA+uJeGV8YTQYKa8rmNu6wk8pSzURcgu9WQi1BP
 Ptzt7FYF3Q96ijMFJgpGoZTHi3uGMEFCfC//gNxEDRrjUNmWefC6C9cEusRazh2XBmQH
 Boxqk3tIVazWJ8zpREMFhsl9bPyytUX0QXMT/8zn7lJikLJTDedPyjR7GSlOy/KKi+9Y
 qhexn7Kim10mRlk03O80GJZRzQ7shwWY0hA1CSSp9J/QRkustNfbxaG4gyoeXMPD1Hf1
 eKmG5wqomzXTXPuFQEu9Rf1/oeKsspmnmtwjvANp0c30XGF5QtgR1x13iXUHUYwypV5b
 S/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719853226; x=1720458026;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mEsogqTUaDgWi+GkfAb+mJ2jGR4tDWYaiJVWVpgtbWQ=;
 b=H54rqxyXM+LhFnyDE7iTOeYPWFvvEnR48IfozWIzUomSwwImsSLZuRYo+a3Ja578po
 CXJxwKrL3HTGhu7hrN8h8iBUc2sIDpqVH0KHEJORl08MpRkF/Fysh2T1enATyJmaWvma
 SMv8JZ0idOoG8aX8j4yZOSkgFc8fP+9vQunAjWwvJjH5sfbTdcg9u9fUza7ZglWNOCkX
 TGjUNP8qpfiivIcnhm4bhm57qg0yR5r1k87XWI3UT3Mogao1iuKoXZjSvn0YzadsiHvn
 QmSkhr9tgccYw+rlERsC3D6RspwxHXpXsa9TsYVdTRpmVam9KERBEVJeBfNls9mG3LoA
 QLmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4sbR6HOrkrcQ9r4cniKqi+v4fBFdrbVWB073cfIJpsgvHNl3qETj/Ll8oRYLdYZxQ6xMCx7Lrd5klmTumsx1LfYax
X-Gm-Message-State: AOJu0Yz5TkifzNsSOP1JTe8O1EwXB15r5fvH2shJvcDvV+onhq5ESoKO
 zU159FlUoqRIC3Fpm8aETScURHaQsz7rjeexfU5qyAHhxXc0t88pLvADmTJ/u4zPh1BRUiOqfqO
 a
X-Received: by 2002:a05:6512:1151:b0:52c:df4d:bb9e with SMTP id
 2adb3069b0e04-52e826932fbmr4733608e87.41.1719853220764; 
 Mon, 01 Jul 2024 10:00:20 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a32asm163254745e9.31.2024.07.01.10.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 10:00:20 -0700 (PDT)
Message-ID: <07ad2b0a-8d4f-4104-8343-3b28c181d705@linaro.org>
Date: Mon, 1 Jul 2024 19:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/avocado: sbsa-ref: add FreeBSD tests
To: Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20240624-b4-move-to-freebsd-v3-0-71496bf119d4@linaro.org>
 <20240624-b4-move-to-freebsd-v3-1-71496bf119d4@linaro.org>
 <CAFEAcA-suKn9LAB8qrNaRu9NeG8DyT_ae0va7uSHuiL3VSk+BQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-suKn9LAB8qrNaRu9NeG8DyT_ae0va7uSHuiL3VSk+BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3WkFyKuk4bYT

On 1/7/24 15:37, Peter Maydell wrote:
> On Mon, 24 Jun 2024 at 17:20, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
>> than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
>> so we can stay on 14.x for longer. Tests done on OpenBSD will now be
>> done using FreeBSD.
>>
>> OpenBSD 7.3 stays with Cortex-A57 test for local runs only.
>>
>> Moved from Neoverse-N1 to Neoverse-N2 as sbsa-ref defaults were changed.
>>
>> Timeout messages expanded to mention being affected by PAuth emulation.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>   tests/avocado/machine_aarch64_sbsaref.py | 75 ++++++++++++++++++++++++--------
>>   1 file changed, 56 insertions(+), 19 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
>> index 6bb82f2a03..bb2c098aac 100644
>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>> @@ -1,4 +1,4 @@
>> -# Functional test that boots a Linux kernel and checks the console
>> +# Functional test that boots a kernel and checks the console
>>   #
>>   # SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
>>   # SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
>> @@ -8,7 +8,7 @@
>>
>>   import os
>>
>> -from avocado import skipUnless
>> +from avocado import skipIf, skipUnless
>>   from avocado.utils import archive
>>
>>   from avocado_qemu import QemuSystemTest
>> @@ -165,7 +165,8 @@ def test_sbsaref_alpine_linux_max_pauth_impdef(self):
>>           """
>>           self.boot_alpine_linux("max,pauth-impdef=on")
>>
>> -    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
>> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'),
>> +                'Test might timeout due to PAuth emulation')
>>       def test_sbsaref_alpine_linux_max(self):
>>           """
>>           :avocado: tags=cpu:max
>> @@ -173,7 +174,6 @@ def test_sbsaref_alpine_linux_max(self):
>>           """
>>           self.boot_alpine_linux("max")
>>
>> -
>>       # This tests the whole boot chain from EFI to Userspace
>>       # We only boot a whole OS for the current top level CPU and GIC
>>       # Other test profiles should use more minimal boots
>> @@ -200,6 +200,9 @@ def boot_openbsd73(self, cpu):
>>                                    "Welcome to the OpenBSD/arm64"
>>                                    " 7.3 installation program.")
>>
>> +
>> +    # we keep OpenBSD 7.3 on Cortex-A57 by request
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> 
> Don't skip stuff if GITLAB_CI, please. If we don't want to
> run it on the CI then we shouldn't be running it by default
> when a local user runs check-avocado either.

I did request that.

> Any skip should have a clear description of the reason why
> we're skipping it.

Right. Maybe replace by:

   @skipUnless(os.getenv('AVOCADO_TEST_LEGACY_OS'), 'OpenBSD 7.3 is EoL')

Or AVOCADO_TEST_LEGACY_OPENBSD... Naming is hard.

Regards,

Phil.

Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F410D46C16
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 00:53:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlGHo-00034z-EM; Wed, 28 Jan 2026 19:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vlGHl-00031h-4K
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 19:53:25 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vlGHj-0007EX-CF
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 19:53:24 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82361bcbd8fso221339b3a.0
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 16:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769648001; x=1770252801; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0vbFu+mtC79CxccabgBPMkYatnTmJjqgBPJ9Teq/tY=;
 b=svBe30eY7Cq21JRc/BOF1mqd9pK26YF5cOvo5dKcYYEge+6OvyfaFAc0bFP0WFFEZz
 h8yQXyFwkKK4qloNI/Aoo3E8LwM6QjiR3CVAkdqSGhSU61Jn1lCi67TJv/qrWgA3e1qt
 SWSKYTGa+NZXF0A5/TqD8bSwB7o9VzgB4w0UXEqMGr3FJezBhDnKLt6d/Ec16GetPg1+
 40XNmsvQtiBB3h41aEGloEVD9ghOyEyJGfNJietHSX1HG9WIKrV6sQLjZG0CBUz7Jd4b
 P3yYB5WonJFNVu9/u4Q57XVncZ/j5TCpuLm1J8Uv6ql6DzB8bP4O3OXkIQqsyZiEr5aL
 wK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769648001; x=1770252801;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d0vbFu+mtC79CxccabgBPMkYatnTmJjqgBPJ9Teq/tY=;
 b=mSAEZIZxmb2ZIR0TBicJj+tcUkpKJdZ7UsJszhJ+j0EBEQHQoYxsotDCrRRkng5iYN
 z5CqzfE1YFHu5nvW6q7+p3bDuKadJmUUzdF+rq/uRYfeOLuCP3FI8Cw4SUXwLSHz3hmk
 PxWUBDpSn0v299gyIwYgiu3frMPTElQi7yo+JX0CsHAYC4CNsD7RwJ4snzHlmvZhRdnr
 TXMEZV0IKxg/dxdzhBfd7qK38CP7r3Z+fzcuGQ19Dm0MToCnJBsxX+MqpEwaOtFrQKtW
 ZZLRvBSrCcxXzoPCxCKlcqU+BcTy6ywIccgWYphFezV7d5AHh+QOnsCqHDRcU0qXVfXI
 bNDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFELLYJUms7+pz6ycVloYgvFZKE5JuxBnfuxoqif23qoxLlSorDPXqUvWlBDOsnOse6eTDNOVRbw==@nongnu.org
X-Gm-Message-State: AOJu0YzI5+Ax9l2dbKsh8gxF4DlJs7uDZhSvwVQ3Cc1eBtNSiHn5TORG
 KsUoYul4kpmrY+D00chLt9jhZ4/xG9PSuLmdlS0mYUH7Dw1rwM1qi3FG/uL9A1js5qQ=
X-Gm-Gg: AZuq6aI+TsYC4HkTLCw2M8dOAaQF0fEIVvP3w074FopJFV1AIMow4RXGBRj0oVbQJls
 Me+2ug1ACHTIS3VeVL+dDqja/f5bKbSrgmhcBBZGZ6rNccAhnNYer0hykum53K/kfTusB+UkDgI
 8Sj3NXVu4lq08u9MLz+g10JfZUjBYYF9iCaXREtspwWKgKpJi+3F5DxauTcDs0nDK/GS9j59Qpx
 e2dao1PFCEGpsis/xa+iuCLMe1vm66TOWGJjwLnlFZFzGLinVZ2N4OGiGHgBG6t+tYf1CI5N1gU
 F2YmELeyVpXhG1bl/zFIyidQmuJlHWrxR9FHPm1gjjj4HdYLQOmkfKdmQA4CZMcDypaGklgCT2H
 D6KH4GwBlw7XFseRxedWyxHIPw30M0w4knhkUpgPxfvj6U4h4q9nGGAvn5sOtN6RrNOn/DImdfX
 suInmw+1IJW9/8tvOezsyp9iXlVwCWsmUtXU66zab9yy+O8H5MfJeOn3wK
X-Received: by 2002:a05:6a00:3d12:b0:822:bd7:e949 with SMTP id
 d2e1a72fcca58-823692c511dmr6702059b3a.57.1769648001468; 
 Wed, 28 Jan 2026 16:53:21 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379b59e10sm3670414b3a.25.2026.01.28.16.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 16:53:20 -0800 (PST)
Message-ID: <c2e17000-e34e-4244-a377-ffd37627aba0@linaro.org>
Date: Wed, 28 Jan 2026 16:53:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
 <20260128105839.3487840-3-alex.bennee@linaro.org>
 <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <CAFEAcA_sT6pGhXPpgaEqkJOVuAj3e1KMz_AP6-MZ6YP41YvoRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

On 1/28/26 8:25 AM, Peter Maydell wrote:
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
>

Hosting on GitHub/GitLab as a release file?
Or anywhere else than share.linaro.org and that has names instead of 
hashes for url (i.e. not Google drive).

> If we can't have useful filenames, can we have comments saying what
> the filenames
> would be if we could have them?
> 
> thanks
> -- PMM
> 



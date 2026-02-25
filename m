Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899C0FD45F1
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 20:29:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvLVV-0003Zv-Tp; Wed, 25 Feb 2026 15:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLVV-0003XN-9H
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:29:17 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLVT-0001mj-Er
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:29:16 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8249fc726e9so105570b3a.2
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 12:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772051354; x=1772656154; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SjCCMuK4CTNL3vWvtLROq6iP4PEtKgpugNTB4qxmL34=;
 b=QzoT4per5sm9vQ0Og9Ji/MVVnWQHO2z2Dj6AH+2gxd5Ysw1ttisuxQEMtAik1a/Vjx
 EA9yyFp3VIsWttPZ6z7xeZTj1aTqHKzpbXZ7AVpnM8MNSG55dm+FBk1DPEnI8GSfIzsV
 0RoyIEZTfiTxeDAjvo/GsweFE/LFycXokOoWPIhljmNPL0C0FPFJPX8WM2ZIWj4OpnX8
 Hw6yj1iSBpak6TtybrWh7hTIFsA0kkFhK+PAkBbDMCfDjbJ3nLu5m27fuZLrf9zzAefZ
 tz1unUTLFEgu9QhtZ6XjXsvsMA+508QzMXsoFKjGOYIXV5cA+H2Oytmy9S5WO20yp+Uv
 bMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772051354; x=1772656154;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SjCCMuK4CTNL3vWvtLROq6iP4PEtKgpugNTB4qxmL34=;
 b=j4pnnpandx2AlZKA30YK5Zesz9Nfgpb3qgyfvrgig5C+8ktjtddoEq09Z0V1MYvAO9
 uyJ5J7nDf29gjxSyKv68IuLBskd0Bm377rMROslbK5gjJauIHgeR0D+scjX7H88a7DLZ
 HreBRNwD1iEG4F3aB3jxo+TvEihBuJt8PJPp69Rs6UwVgILqsM/uaW579NPNV/ggQsv1
 tXLEtY603JqQpA0iDG/dU7ROMf1poU68HLF8Ht39K+tHsSAaglArYFhD/vzVkA6QzceN
 d22ce91JkFAasBE43Uyv9F+6SxJUdT4dIlysqw4m193e6HdV8XWi0gjrksm1Ojz5crDW
 JScw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUENeQjrhdR2ZX72UhpwPPVbn6Njg8P1dG683vK/16BGA4YdCOu/V7lXSAZd1GyG6wkdKjkGCIAZg==@nongnu.org
X-Gm-Message-State: AOJu0YxgJq/z3LJSGkM67ubwZ0kPaSzDT+jh7xN2n7xh64CR+3EYKNSz
 AacnPOwDukSK+au11o97AWK/RoKE0bDZtJ66hrF6pxAHCy1lDdbuo0eHD7Aey9WGaLk=
X-Gm-Gg: ATEYQzwGQGpkA7iy67+uE6hXpfuQlOmwu35d/tjkaDMGEhZwHkbdY6QFvmV7xG8qExW
 H5STb0dHjA0AQgwqML42A2mheRcwfe9cf3xXcpGKEKIMrrj0su8DiMGst56+6l52brm8YDuVsGQ
 uXRcNiw1nf3nD6GvHDenESE/cAMFyNpYuJlMEe2duFmCnRByPEk5rj/GLIR6jX68x+Ppme2lIX0
 r2GIl7EVQ/HLNbqsWlFYp2wN60+jvMkYfqJnNWZXNwF0uMEGKCt1SNucC7LGjDJjZsD8i9UxGs3
 NCpnClwjxwM0o0SUf1ErVfirqJIxvbW4r6tCxzoZCVtI2m9sBzzI0hWZhipq6Ddqb1L2W7eW36s
 Am1oCyA80O8anpLZGF0yD23QH9A3sjQ6b1eziAqsCxlfrc8frcab9mM/eb05UqVd4BLqr7JG8bK
 Txu7GoeRbKwusnWNibTbJQWJNYlaoKrXiLZmdItyk82bJQwCvpAD6F+ytWtKPDBnQfhmTI3qWMt
 YEKgJk=
X-Received: by 2002:a05:6a00:18a7:b0:821:8250:8ded with SMTP id
 d2e1a72fcca58-8273390984bmr1064539b3a.65.1772051353813; 
 Wed, 25 Feb 2026 12:29:13 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d8bcb2sm105276b3a.22.2026.02.25.12.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 12:29:13 -0800 (PST)
Message-ID: <f86f20df-d4e0-4f92-8298-79aa24e2df65@linaro.org>
Date: Wed, 25 Feb 2026 12:29:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 06/31] hw/arm/smmuv3: Track SEC_SID in configs and events
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221100250.2976287-7-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221100250.2976287-7-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

On 2/21/26 2:02 AM, Tao Tang wrote:
> Cache the SEC_SID inside SMMUTransCfg to keep configuration lookups
> tied to the correct register bank.
> 
> Plumb the SEC_SID through tracepoints and queue helpers so diagnostics
> and event logs always show which security interface emitted the record.
> To support this, the SEC_SID is placed in SMMUEventInfo so the bank is
> identified as soon as an event record is built.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/arm/smmuv3-internal.h     |  1 +
>   hw/arm/smmuv3.c              | 20 +++++++++++++-------
>   hw/arm/trace-events          |  2 +-
>   include/hw/arm/smmu-common.h |  1 +
>   4 files changed, 16 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


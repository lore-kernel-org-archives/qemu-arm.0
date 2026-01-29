Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E80D6100C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:44:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQRN-0001Uc-TS; Thu, 29 Jan 2026 06:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlQRL-0001TV-Sl
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:44:00 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlQRK-0001tg-Co
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:43:59 -0500
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so845569f8f.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769687036; x=1770291836; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EG1b2E25uPPycRnSDZlttadmeC7xMOmaZm7E/W9cq3A=;
 b=lw8TIoFoqhMnrkOwLDyxfM0p3RoMEoQ0WSrMZWLUn8yUp14FRxYA2S+YRbQnbpq0+r
 /ZveWqJSQSIV3Sg25Secny97oC6+IfrKCKkSnLf9cqPl3rdVfdReOuKwubLLZL6Bpx8k
 gZqOi3+GjIIZCATM7cYTjG6A1MNwcGOm00+sVKuLoYTNNVHZN4PSyWyKWRyKqT8u7ynK
 3FFIxPjEYcnOdsL79PYw0OBbmelUaVNL90tbuBrgrDbxfJ+N7Vd2r2d9kunGD3xsJRP/
 ZelGsUjpg4Uuofp8umLHj0k15lbvACF/VS+3Xy0hL0R389hgI36hGnWbFaQMCGkPO+JA
 4D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769687036; x=1770291836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EG1b2E25uPPycRnSDZlttadmeC7xMOmaZm7E/W9cq3A=;
 b=GpbhHy7gkmWc3a2I8IUUPseASXSKzq5cK2RAoMqzGm3sJPAvICzsMbobADCoWiECRn
 Lcg1j460WoKsq0/pLg7SMAKpyku27Lnh6CLN9aFugwz0os5SkCrDLniBn7OjiO1aHltF
 4dhBxEPwDJWfeuIyxPjwYhP9+nXdORXPIkXk+AduKEE9sTQO50QPMnIfVZDLxaGNTntD
 0HucFCkrtXwpsJrXTOTLX21PnVaTFNHbi8JAJeggritwDOP/m1l121ypv/ZiAEwYsyyS
 MR5tvSVP/drBdJPQrtJPsnzff9hJ9QvwepTFDGNLYQ+KvOsG/jq0PbeJJC9hrg4vnkOi
 NvUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMc7Z16stZcBlHG5ao07Pjmbmp83rdsObCNG8r1ACX87rNFocy9xacpi1bo8i40lSas4QiG0rG8A==@nongnu.org
X-Gm-Message-State: AOJu0Yyp8TiwKPl2xf5acRwnSpIBfbPh1Std6smZ1pfk8cB3LDl+hE4D
 Ju43tlf74cVYiqPfxgLSov5Nj2fa4AThRS4cXANPRvYeVyq2vsev33pAw813e2nybDQ=
X-Gm-Gg: AZuq6aLK+wt/QFOb2syLqybr9lr2xbj+3HDZk+a9sbGRbCL1yid6rFX/i6unfCapZa3
 RMeMvPH9HpAGdY/WtZIyePDXMB2fxz3wDO0rHRJNNeppgdKDZ5Eictl095uXGLD9EdMyXrmz2iQ
 olTUBSgWNo7brSOqjchi+Jhlds45cOKM9CWD2hlpT7/vKtm6youT4QBcL2t4xuljBPV4J2Yubnq
 DTewAkaZ9Trv8kyMb2TZQbZrKa1qTdfHcsc3nbMH3abdpmVm+nHMK1xROT7JHdDmBjxc3AtWBLL
 AvV7ucAAaC+xI7iEbN2qNosqLdcsZtiTDs/Puj3r+bXAYcOXLhx2t2DWEbF6BwOlxDWcpPp885i
 k6jQzuTmi4kexV7VMTtwVbFwj3OUACKf7jKOOkF02psHZgTjFxxoDU3K75EUycGyhoFR9D4+QCp
 GcM9sPuD4cx5lYc00bZ7SRwWtnhm7Cn1qMgvZnMrGMXgSNccD7/0CkJA==
X-Received: by 2002:a05:6000:2511:b0:435:a464:f468 with SMTP id
 ffacd0b85a97d-435dd1cd4ffmr11976243f8f.47.1769687036214; 
 Thu, 29 Jan 2026 03:43:56 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132368csm12824998f8f.31.2026.01.29.03.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 03:43:55 -0800 (PST)
Message-ID: <70fc96ff-a9f3-4c09-a557-aab1ae17c705@linaro.org>
Date: Thu, 29 Jan 2026 12:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] target/arm: Account for SME in
 aarch64_sve_narrow_vq() assertion
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260129113455.1283266-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x441.google.com
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

On 29/1/26 12:34, Peter Maydell wrote:
> In aarch64_sve_narrow_vq() we assert that the new VQ is within
> the maximum supported range for the CPU. We forgot to update
> this to account for SME, which might have a different maximum.
> 
> Update the assert to permit any VQ which is valid for either
> SVE or SME.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> CC stable on this one, because it might also be a problem for
> a CPU with both SME and SVE but where the SVE max VL is less
> than the SME max VL.
> ---
>   target/arm/helper.c    | 2 +-
>   target/arm/internals.h | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


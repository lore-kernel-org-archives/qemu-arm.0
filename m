Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071D1E9A05A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 18:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt9EI-0008O8-0E; Thu, 19 Feb 2026 13:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vt9EF-0008Nh-NT
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 13:58:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vt9EE-0008Fi-8n
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 13:58:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso10086085e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771527500; x=1772132300; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4jY2TKQ/6khl0TswZ38/HGZjrhkE2U1OAjxsEygmsQg=;
 b=fVIM+1Nq6QRclHlzeQ6QjwLOSR2vPNx3dgplJGl3bVOdF71T2Ex03O47mRXN3v+IfQ
 7klvTLo2pNumBH3HgI0R+O+gYvhUX/U9Gr4qFpNFR/7bcvn3sX3UcoHkuYHYjR0SexOQ
 mBLmgo6eF+JuuYsJqXmmisScrLIOFX6aMqbLAbqWalPd36UMLXladBlg2zhf/0uR4fOV
 ArvKdIfeRgDUfJ9mM20cEuAKrKOdxcIF2FvWwpPBNG2crUMh1XSpGHjndDzj6HYFsLyH
 0s/kxV5v3A7IyCKDVMmxOwLygP2O2GHX0XpoicC1WZvlkFAZoLyMWBaYtDxhsy0x73UK
 BcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771527500; x=1772132300;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4jY2TKQ/6khl0TswZ38/HGZjrhkE2U1OAjxsEygmsQg=;
 b=ZAAwCobyydxUkAynMRDtaAUf1Uf5K1ahKPzO0jiNzRSnRFThuvSmlN524aADeFyF0n
 g3CThuT6Wwvb0SdnoFDMWt5LwpV7W+1twPkje+y7z1oStek5Z8g+3vUgfOIAdsTKTKL+
 4o11AUkkaiTM60t7T8KxfWrzR1Ro4iIXoDcwkjrvJUHg+abSdDNq+ObtAIS/NkB/3TUD
 LlDamtWJ0vQqbzPOwZwWLg/47/PFPJEp3tcZmaA54jQTuL/NF+lELadsCUVTL64dg5ii
 CFYD/3Mj6GFZOiQb17wQBrkTK2tp+q9ruSD92488HfjG+Nk2HZ+hC54y7AuvwqG/hZgw
 UYXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRcxR2vmLQcK+xRLjP7KVBrR2kk1iS6MJd+LBreOAAcfB2nWGP3pp33YbpjRXAxSgq4+Xk0JSM/g==@nongnu.org
X-Gm-Message-State: AOJu0YzQB8HX41dk1cRz59lyeEOJ+HQRQKilYxi9juZNUaJD2P/uot0L
 lgTFjgtM7SBsU8N8w+vLl61iuv3luuDjVUpeIRtoB88ALoUS0gRDWwEIJWXXLR2KZMc=
X-Gm-Gg: AZuq6aKzqg6B/CR6L46xtLbpwjeJaH8HcqX6CMn/E4MAKYYLTubx77Jo5cshDf2eOH3
 avlNFl0jxqvwO5tPoppl3XOXtMHzn4w74n7esFr/bdCLq2wAS17JUvoN5QJVL6wObYZzLl3v4zU
 uZk5gGpDvegBFhUelm8aU4AMf3P48AEGt564sdr4Mf1tPsZAG2ZjZaDkH0SdB/cVumcr+GoQ9Yt
 p9NHnnXP0RV+3m85nG+uYyiZPtwnX5nzVvCvMMz2DnTcfSC8ruQsmGHAITuGkPCKIZmf6WuUIBL
 KERuoPfgYG6PFgQt9trzly8aedr8NtuCmak1W7jz12ypm79oAz+fYdu0OsuNFB8NeLGBQr8TPoN
 v0gs/PGK9O9gLmORBkbULAtBTQKqiAR+TBi2t6SFUfRMa8s0HJeKM/k95y7fDVIPNca70BHnrYN
 Fe6EU3apGg0f4ZoKGuDZBdsPqFTQBmafF2//6i3Pq4AECetwuqaZliQp11q1tnoWVP5g==
X-Received: by 2002:a05:600c:310d:b0:483:2c98:435e with SMTP id
 5b1f17b1804b1-48398aefddcmr101909595e9.34.1771527499986; 
 Thu, 19 Feb 2026 10:58:19 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a3e140aasm1341755e9.22.2026.02.19.10.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 10:58:19 -0800 (PST)
Message-ID: <17d7732c-4518-4e96-ac54-d46a3573060f@linaro.org>
Date: Thu, 19 Feb 2026 19:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt: Update error message for bad gic-version
 option
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260219110228.3804482-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260219110228.3804482-1-peter.maydell@linaro.org>
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

On 19/2/26 12:02, Peter Maydell wrote:
> As we added different valid gic-version option settings,
> we forgot to update the hint in the error message produced
> when the user specifies an invalid value:
> 
> $ qemu-system-aarch64 -M virt,help | grep gic-version
>    gic-version=<string>   - Set GIC version. Valid values are 2, 3, 4, host and max
> $ qemu-system-aarch64 -M virt,gic-version=bang
> qemu-system-aarch64: Invalid gic-version value
> Valid values are 3, 2, host, max.
> 
> Update the error string to match the one we use in the help text
> for the option.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


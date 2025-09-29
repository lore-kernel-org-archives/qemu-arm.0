Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53142CAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:05:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3MvT-00038I-Hq; Mon, 29 Sep 2025 19:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MvR-00037w-T6
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:04:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MvI-0007SU-D9
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:04:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-781251eec51so2548418b3a.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759187085; x=1759791885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7daLdMryoE4ld1REFUXqk6x+ffDGPqF5mj3J0+GRjCw=;
 b=H6xb43WnVrg6QtFuaz5Sk3uH9pfH8PzR7ncreWpa0arwcudTwqvOsNv+hSEW4JOyBE
 cDKyOBuBwbFw5ACdeV2QDg6+IV23SO1MzslfI4yVt2EyBKcm8Wc1yhndTMKvFUfy/kUJ
 ktz/NhANc1wS+HBlDyijHXviUU4nhk1LpimITrCgfFLNuejRGB1woOc+mhHjuLcM62KJ
 nTAuVBidT1Xt0BMgcTBxcqk0ecMtDg4K1OzKt+1PI8rNxGQhnVXDDLh/d9KehICDiwst
 bd4XMmNdD6Y8o9JbRexCsunbicLBko4z9fvYm+cI/o0QiyklgSpD+Z+QvsEVqMLeIPq/
 gnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759187085; x=1759791885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7daLdMryoE4ld1REFUXqk6x+ffDGPqF5mj3J0+GRjCw=;
 b=Bmq0JNpDedb6kpm3WE/ax0t94HBZMHsLkfQXrw5zFi5W4T/82yWcVopoLqXFICGBk/
 YGtv4YLGTi6rWxpmqSURHRBjGoJ0vXMzQp5Q+bUcFXxZZGzAWE/HzyB4JU8vDeScEEC7
 mgbx+9k+urVbunwYG4x0r0fxbDzTncFAZIg75OvnX9RvuKzB+FDo1qG702ypgMRMKZio
 7pJU6xRtjDwcQBqmdKCoxaqN8WqisS/Y2uFkIur+EUXaqDzHYslmeorPNV9aOKQtpPNM
 Xe7p2xfwwqqS2v56RdHd6G3TGcGN76OkLi/ajnuxfj0Jgr8nPNc0mECW0srcn32ZTDE0
 XAdA==
X-Gm-Message-State: AOJu0YwlXcS2oP1VYf5ynvM+RTB3aIH1dMgvtNthbiCKkENtowsxvUmm
 rTwjRjibYXslzIE/8H6Br+4HUjkVyiAztigVTUYsKkZYCg4vLCsHYJQZwwzD4TRJkPHcuYPNx4i
 sdS196FI=
X-Gm-Gg: ASbGnctl3e3HPmJBoPtdoeHV/eo8RtHmMnfCTR9xkZfWjZrf1M2SZk/A6r+wgqRCS9J
 A2hnr1N6zv77AyYVZsD30wW6gVP+NX3fDDyc9MliLe4qKN3KytGScavKrRuIFzm1gJTK8hVjK5m
 V3geV+OqKwIPpE2Vl/JBvJs/w6CCizAOk6GaAhYz4Tzeqp5SOFsZhKS9mbIRj9GX0Y8KxbtKRvi
 Ud6ME978JyO6W69Es2VD7qUkOmN236l/fapHwwkNDTsW/FakSe1/QMHstXfLUqsiOvT+LSi/tt5
 RmThoIjkVAukhz7Vi7xYQO5MvRNVb6J2WlivIqKpwpAI+ZtoHV+IM10yJEq4VRl6F4Iwb/m1dNi
 HMCWf5JSBr3lVbmLN3z2GWbQVcvip7lN5DUBemtuVMdIVnfRK5sbumhQr
X-Google-Smtp-Source: AGHT+IHGWG6/x7LvSAYvBMAK4dtuhHiiWP6EHwBkrUQrFuhIwqpmxtwpKNvltP6tEOSdCUrBF9Tyrg==
X-Received: by 2002:a17:902:e74b:b0:24c:caab:dfd2 with SMTP id
 d9443c01a7336-27ed4a7aef4mr206903985ad.61.1759187084733; 
 Mon, 29 Sep 2025 16:04:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27eec33b775sm112611275ad.12.2025.09.29.16.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:04:44 -0700 (PDT)
Message-ID: <ec38fc6c-cf7f-4919-9bbf-f13c04c6c7ac@linaro.org>
Date: Mon, 29 Sep 2025 16:04:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] target/arm: Fix GPT fault type for address outside
 PPS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-9-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> The GPT address size fault is for the table itself.  The physical
> address being checked gets Granule protection fault at Level 0 (R_JFFHB).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



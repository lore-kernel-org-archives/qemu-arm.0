Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD068CCFA13
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 17:51:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI93v-0003M3-MB; Wed, 29 Apr 2026 13:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI93s-0003LR-M3
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 13:51:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI93r-0003g6-0R
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 13:51:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cff5dafc3so48263f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777485057; x=1778089857; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6b+d+uZRQyukNLh4W4POk/tM1wWODXpRoFthuXctfSM=;
 b=jVZJ1v5hooage91ehISRplI7Pin6MbYFqhA2kDICHvHaaBoCq/srlmFynp/6a8sOKZ
 Ss5Hc3Q3lBJYAnF7I52uNx3frfGRGQkfWDmrZobQT2uuDzMnbcI/zMMH+4OXY9HdlCTs
 xBPnXrNZfox8HbDocterDZ0YkD8b0LrJgEjzkqh++CSByXjm1LgRefytfVtT7eytYvif
 HK5KynJUEp2CNDuVjYuBKkjYiOu9wzikn6PYMbRat4zJ7o6EA/tH7NuQ9OwjaRj6yki8
 +xkQUY4Cy3bD6L7AGBLyu3eyREVMCjX2yHatU+/fYBYl6HBnp7j+Io6XvURps2yazhDL
 s4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777485057; x=1778089857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6b+d+uZRQyukNLh4W4POk/tM1wWODXpRoFthuXctfSM=;
 b=rTxqGjz55YidtjOleEYLjQuYBb8FcuPRRUQ+h+RQpTSNkwntQ7p4np9DQyW7kIPlL6
 zn9gUnj+hKWIC04F4e1vBPEERM/I7i0NKxKYKkmCHQM7DRzjdUHktmLfWI8h5aP+JEFa
 yZtQE+qbsDCkIV8FNAo5cyFqac5Cl6oB45H9WY7SLsJZhos4/2JuuE+wmFp8JNrrbzNL
 iGVim/Pm2iuR9AejYqZMrgPG3GvLXMordsagnRMe1NTHIo392WrfPMQFBguPuKJkeiQ+
 MqEaTdWvtedgyUGDVtVM5Svv7fyYgT+H27Z4HtfVS6pLCtl12iYIwElhm1oevG+gnfVG
 Zn+w==
X-Gm-Message-State: AOJu0YznDJjSDe+aLdAEfrJ1+JezJ0SBbS0rkJrllYeMPBqqmACobfLV
 M2yNK10EsjoEtBhad1wc+L1FZekw4+pFjjc71HTZeoYlRpPUaJ8W4KSdFb5Qor/je2c=
X-Gm-Gg: AeBDieu4BRlydTEL/71gceOSwuw+EnH/lbRioB5BMOSzah/eM3IR8ZTJVPQuTw3NGrD
 ZNTLGIs6nLc4Bvmi0QvJ37wUSwIIt4mv74irwWjg09dSesWG/VKAyClAecJURbaWiFtGfZkmdWt
 wU73RoUzogGnCiYysUqvY//sSI65lWA2MDERawn9PLVsW5o29B3NCeZLjdfEulUH5ngK05qMRTN
 sO5/n2jFHWzD4jdm8MBDxf+8f0jK3DC4lvVGmQhfO7eg+DVYo0xWGOwlbmGFvQqE/I/AXK5zohQ
 OwUC3lt1DorTAZ0HkfEt0WP4XtBAjbjtXJqVRSESsDrLURYHCNDikUSBmznHczYHGWQ4QQNhGpW
 J+j3mEhWzERVmrPnoBUe5+jgRvpDeiyOT4DCr2R6s3/u5X7Oe9wloGGRAFExe31eYfTYqCD+n6f
 8WVx24PrYebTbnd45eGrkqS4KejIgcACuhE5/JpefXtmfCFUFVFNuPx6jEzVmHXS1yjKTcM50Pw
 fAe
X-Received: by 2002:a5d:5d0f:0:b0:43d:7a97:78af with SMTP id
 ffacd0b85a97d-44790efde1bmr8616557f8f.42.1777485057021; 
 Wed, 29 Apr 2026 10:50:57 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b4216604sm8318184f8f.10.2026.04.29.10.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 10:50:56 -0700 (PDT)
Message-ID: <6cda8d0c-595c-4a56-b8b6-5337f56f93ee@linaro.org>
Date: Wed, 29 Apr 2026 19:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/84] fpu: Drop parts_float_to_sint_modulo
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts64_float_to_sint_modulo at each call site.
> 
> That leaves parts128_float_to_sint_modulo unused,
> so move the whole function back to softfloat.c and
> specialize for FloatParts64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 84 +++++++++++++++++++++++++++++++++------
>   fpu/softfloat-parts.c.inc | 79 ------------------------------------
>   2 files changed, 72 insertions(+), 91 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


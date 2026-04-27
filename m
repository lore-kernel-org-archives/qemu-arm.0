Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70373FF8860
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 16:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHOpp-0000xi-RV; Mon, 27 Apr 2026 12:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOpo-0000xF-AK
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:29:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHOpm-0005fi-P5
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 12:29:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43eada6d900so10264556f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777307361; x=1777912161; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VvhaK+3SREO8B77/SX1R4EVjJES6EyGcbh0w9K7dx0=;
 b=B31LuyqRMSPfOYOYd+uJU+h21zoYq4ErSGDJMDnve7XM0cc3TH3upZOz+7aHq9imjf
 YZIBDJ/gQ1AJAnl4VawlyIAD3JSKTBZ17ADylPFKe1rNt4DKoDCdBpUeXH3JJrWeu1wF
 BbnYfByKEk3xF5fbKaYxmW3m68F7uia0O+t4FXndN1691fpGdng3IRelsyTJ+K1UsVpV
 IZdk774TjQPQK0ToZIstYtpfrYzXcxlLpaIEE7fBR2oKlbAqE7/rUkhAjDW3AVsX3yCW
 jwz84qx+pddYJGvZFAOlB+3zdh5Spu9vge+nm+pOi03F50GBKdMrUjkIfAFPWkjNKDNW
 XJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777307361; x=1777912161;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4VvhaK+3SREO8B77/SX1R4EVjJES6EyGcbh0w9K7dx0=;
 b=bFp1XxVPj4iMTmCtWsvxQ0xsUtdANk9fdERwtOYulMQ74itJeR4KPauzha4enrcL5W
 fEweheimXjKdJwHJkf5mcj62KIMB/gt/8ZnVShT6ISrZwnFdFx3SbfOJXqhZmZmQJ3fH
 tnQGnGBYps8MpyTCcjbxKhQh9XKnFyE3uyeQggfsyvgouyovxKO2GL32N/cCTm7tGB0+
 EqvU3bx5A/waRmSOQ1m9dmCB9GWaMFL0OzkXMYP2R5OejMQqqm4iiD4T1fIsZP2iGV6Y
 O3viDZ5xYDW9YTr3LBefkeymGXzrmqp+SDzeC0Uafob3c7reHLhMT/gNnFfGPzXVrv4a
 6maA==
X-Gm-Message-State: AOJu0YzMH8Xx6s2nREn8YHN+wMQtGW2tcBAUaUN54SrA9x5RE3mjmegD
 Ji1S8uzKM9Dt+mAA0ZDj0zIwNoWzO+SVPRRjA+0gz/r4bb10O2cj170tKIDzwH/zMJ4=
X-Gm-Gg: AeBDietbiXa45rdqIqkBip8aqPITCB9hqgDKaKMCnPsOv+eFQ9oXcsE9ZpdrX83x3bP
 50mnrri7q2/UHdkzeoxCHhsPqmD+6kLMwd9XqAPDDrf/pzIJbRYaNVT0bgBpHeXWIOBq3jbFP2r
 YpxvpkxjLc2bHaTE4dFFe35wVhbNVBWMKVykMjVa1IYlWkfqROHn8vIR11OZ7GjC6wM9MnGrjvg
 7hVu5uOnde2KPSj1T26s4pcS1G9SPI8fYaq9wa6L/dOExpJS9m+2FenZcIuJzstZO65HSf/nWvW
 ZIfyekQXDBMAjKETSWDucvhqA8dYmDIp0zrD338kla+klmmaNPr3i0FIDNTZ+p25ZwuvZmUPuNs
 AG5QSZJm+giOMhzvPgSQ/iZvxAPkMLznH6sFG3HxZmWWGJ/DQ7JxIHYOin2/zM8qQjpWOyUmlyv
 WrORtVv71whFtGgMVycgB372tnp0IBFHT2MjbRIlZMoImNaH77AkO2i98rwY0d1nGmgKkKs19OU
 Ebo
X-Received: by 2002:a05:6000:25c7:b0:43d:71b:204b with SMTP id
 ffacd0b85a97d-43fe3e1433emr68443912f8f.39.1777307361246; 
 Mon, 27 Apr 2026 09:29:21 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a092sm45529471f8f.23.2026.04.27.09.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 09:29:20 -0700 (PDT)
Message-ID: <31923bc8-577d-4d84-9079-1211a9638c2a@linaro.org>
Date: Mon, 27 Apr 2026 18:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/84] fpu: Drop parts_return_nan
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_return_nan at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 17 ++++++-----------
>   fpu/softfloat-parts.c.inc |  8 ++++----
>   2 files changed, 10 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


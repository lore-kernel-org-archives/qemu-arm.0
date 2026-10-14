Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97619CC6B19
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 06:21:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGsMr-0005zU-BJ; Wed, 14 Oct 2026 02:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xGsMp-0005wC-Vv
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 02:21:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xGsMo-0006y1-CZ
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 02:21:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48b0946c2c2so2309532f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791958893; x=1792563693; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=28lfvFBPfsWPL2u/keKxvsqU2LOJMsUMJ/4qE40SHkI=;
 b=V1g8s2Cr8C6lqqBtCDOZb1Q4viXCESI03re0hK63Njpp2UzJ6Wd16Iccs8WUaHRVFJ
 3TM0bdGa9ub33suzKX1gV6rM6fYJrRDuUnZuFuCuN0ixfHL2W0LwTJ/5983/QbLKaSfU
 HG1X6WaQ90vrLqiTw2MdeTyMtkzEo2xx4/g4SyJWdAXcXxaPtIN8CGDkzRN0DNmu4e82
 XGWLnm0dDoBNriCPfd0bRCTeZCgDzgeENpYCt9t7Hp/WemNnUs9LeNhwQrTIl/Q3wsok
 QeXiRgDGJauFaXtHrMlFgt+lwDuXp4EPRtUtvo+y7tjXEBJVPAuIHq8ssEWIqJlDG/3/
 Xxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791958893; x=1792563693;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=28lfvFBPfsWPL2u/keKxvsqU2LOJMsUMJ/4qE40SHkI=;
 b=Un5iCTrNCSvC3dsPY6eqWrDKbsCb2Cj1+Kn2NaGjeDJvYIrtkMNdkpnV2fXjwydSdZ
 9ZRlEfs7yJWlzSt9JbmGx8M9sX6A8tloF0syZkDVCRcm+m/sMapAPx+dLnmG8Co0raxr
 MbMyYrzIF6M9LOgTCBiFN22WHu9rD4U7e8n/uvqizKLUk/Cn4drM5RfBdcZbTxZNqmoW
 cg8BG2AriO32Ms/xkPw2Wt+7qQxjsR/wxqHD4e2Q/uWmdssoSoo6mVBXHwvmNXdV1nNY
 vAU1bfB47JYV2xzLefAG3PMsMG3d0Qifhx35uQnsdJCLWOVEaYh7vqMADgJAqA04uKzT
 uKdQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0BNz/gTfUX1dyaSYaGS9qZnXDqAVLfKZenq6vFQkw1dpcg4ubKhlzNaBUhsYc9iItwUZpbCqeTg==@nongnu.org
X-Gm-Message-State: AFq9FYLh/P99QV6Gg+/PPAIk6Whnj7dTqs902DzD9qJQoGk6rOwP0qqD
 1Mp1diGvVXNlaXlgYsZYJxM5D2JaWR9REnr/MFQosPHawOSKuG/yPbEIB/odFbVOVvk=
X-Gm-Gg: AYBFou359nvejtbZZcxiJHKtp8Ez1UfT9qnS+LI+d9Xj143UfL71uHP7U+XDU3O8uB7
 9EIzhOnoNngA10BN9NfDqAWoMxrs8tmPVDcaWNLx0p6rKoRQMNSwE8pdIMdhSNUv1k7FRhL19OM
 bl6lyXWN0aQGOHIZPnzKb76YyMGypr9prRX69rgsRg06XHsj60mjlCXTl53aukkParIwZ3omx0L
 UzJwiurunmtmIeWDxTM6ZOWQ37M4Gpsr/MIwHqCP0LSEj3n5Y9I1gSjxnGqjEmeKTAyupWuF+Da
 mAXRUXhq2t3Vung1drLzWbV3ztT/J/l9wZzw2OGcSWfcCce3blfwLzXLd9Y3z5559WbMbAtbslH
 +NU3UDxEK9rFrJEWGoSAxDL8FYQvBWdGdVfTeu4VebYLw+7p6sLirNnuQNLOUNk43PG+qnE2aex
 T5296YMEIeAwN6xtOqOTsCI1mKzLouRNF/zselFUyD2OkFHVY59SNnQcpNTDuC/b02EMG4OfQqC
 oT3A9EJQxUYMFr9U6hKN7AgAIfgWz2OijBZtZd02hqmLPAwx4fNiDfHQag3YDPM/lo=
X-Received: by 2002:a05:6000:29d3:b0:48c:6616:8f32 with SMTP id
 ffacd0b85a97d-48dbacfa174mr18660165f8f.53.1791958892856; 
 Tue, 13 Oct 2026 23:21:32 -0700 (PDT)
Received: from [10.86.151.227] (ip-109-091-152-129.um37.pools.vodafone-ip.de.
 [109.91.152.129]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0967affsm8646212f8f.1.2026.10.13.23.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 23:21:32 -0700 (PDT)
Message-ID: <39a2941f-1106-464c-8041-147c91dc037a@linaro.org>
Date: Wed, 14 Oct 2026 08:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/tcg/gicv5-cpuif: Fix typo in
 ICC_PPI_SPENDR1_EL1 name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20261013105704.1071427-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261013105704.1071427-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

On 10/13/26 12:57, Peter Maydell wrote:
> A cut-and-paste error meant that the cpreg for ICC_PPI_SPENDR1_EL1
> incorrectly named it SPENDR0; as these regs aren't exposed to gdb the
> string here is for debug only, so this has no visible consquences,
> but it's confusing.  Fix the error.
> 
> Fixes: 585dad9e79e1 ("target/arm: GICv5 cpuif: Implement PPI pending status registers")
> Reported-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/gicv5-cpuif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


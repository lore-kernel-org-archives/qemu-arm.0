Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2CBC9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 19:02:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9SEb-0004F4-3g; Wed, 23 Sep 2026 15:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SES-0004E2-Dr
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 15:02:22 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SEO-00042a-I6
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 15:02:15 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2dd77300825so8374215ad.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790190130; x=1790794930; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=a2YDElJcR12vsEtPmbjpiDU+yc4lParm4JCS943iTuI=;
 b=BOKM3sZDvssQ04QCfQpS2Sg2+Rx/DMmG08Zy26JgdZl/ewUWvwbKb8YBDiQIgXls+g
 Llw4uZ5dP2tvNdolnI345v9mbfGbXEoMLGAPcc/yUk4KL6/cb5Qf9SarfI3B9cDzefmO
 s3sa4E6VvGv27zxp/22tn/4ffYGgMQ9Tx0GYiH+g7Eo6XfFIpMqSMO0s0c+IMzbXoIm6
 uWnufMGGAZiNE2BUzn4Fjj7OyorAAonV9LiTY3wDC8AyQkcjqK2u2Mh1G4iDH5Du614i
 1XrLBJjR0G41XJPYRExJYEJtjEqTCwuADGvMB1UtFfo3h11xvfAgx8WDPa6QrpW572pQ
 xuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790190130; x=1790794930;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a2YDElJcR12vsEtPmbjpiDU+yc4lParm4JCS943iTuI=;
 b=yR3NjTCdwln+R2rtK/KCcYXTBooTkAXvCN5GKWWFLNnhr1HHy4q30HjflgLz8tzzag
 WUC67KQra6MFbLbVfpomLEEFubU1oTgsuOc5DBIYw3AeP0IQ1UoslPxKcSRdH8sFs1eL
 gokO4xc0RfUBdR8yXHgfqGc08NeBsOCS1p0h898yZezf8K9rihTZsezXnVufsiTPfXZC
 XLLIUe9DF9LKSaNt032iVhWj0XjkOPPJV7zgUaECB8G2Vcn1Zt9CkwKsy5HD6dUGBWGu
 vh13q5w5iJJnRVOwNG9tB5mvcMfiu/gV8A3mVlSr+QMF5ASGD3SUnWeK7g7+kQv+noe5
 8wVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwZyOjr3f835eORr/fQnq6ePTFJwj6vKTmX3XmWwiF8h8F0sLYw8qMK7P4aSTRaldZz150mlJyXTg==@nongnu.org
X-Gm-Message-State: AFuF++kEMc+HfP3Hyjiv80qTH0YHA1lMK2pS8NfhXRXH5CfECvrCa35k
 JDs5UrsS+FoyQnM3HSYnR+Kx+NbaFMT0P0VatfjlBnsOeqVci5lWdbyyr17lWAanPGc=
X-Gm-Gg: AYBFou1mYZq4lMo/QpTUzWGYbylni/cRa00S4MbFK11r+KcL80MkmJoRuj6/MoWMWWS
 ucMzSj897p1BnfbR55G1dCuAnfXG4ACbe9ENkwuPKQhX3KWAbFPTtA/WgHwflU+HlbqHmkhBrnn
 L3ZU174WrKnFuXo84l3zmt4lTMdabnrGJzUzwq9GVYRR7BkRGQ+wCm7BjQ4JomoO+2zWZoscO3d
 qkdXCqBMJ3Ys468TgwB0KQQ7Idr7qFDO1v8lEzGYTN0pygTmbRBKo6E+yE9HM/Jpw3RzW/+yrXt
 1kHs5RyUC3EMo2MgxMUAJoUlALaGfdel5SYKze1/pGiD1GhdeScsvM1BzrnhwPdTLWjJ+Dbd6k/
 Ez/jLU2FGbwljgLDgSYxdbchT1eVXYtJAmIk2DhgyRRrJGYNCJHbUHFH6gMEjHTIr/rDosX6nU5
 F51bXqJWaJraWDX1RSzu2NEdm3LqAz0Po4qYjyypooKnrOTLV4IsmwV5iZfHlrVamg6HQNklXBr
 mWQxEej3jhmN0avZDZgaVcdPf/dxJFVk2kgkinyvAAo/sSeV2E=
X-Received: by 2002:a17:903:37c3:b0:2d7:107c:917b with SMTP id
 d9443c01a7336-2df7d735ccamr1242585ad.0.1790190129690; 
 Wed, 23 Sep 2026 12:02:09 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a603828sm15795525ad.77.2026.09.23.12.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 12:02:09 -0700 (PDT)
Message-ID: <28357eab-ce8d-47be-ad9c-21efb7c03822@linaro.org>
Date: Wed, 23 Sep 2026 12:02:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/21] target/riscv: Skip empty MIP updates
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-11-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-11-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
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

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> Return early when the effective mask is zero. This avoids taking
> the BQL and processing interrupts when riscv_cpu_update_mip()
> cannot change env->mip.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


This breaks the usage in riscv_cpu_set_mode.  One could argue that 
should be calling riscv_cpu_interrupt directly, but you'd want to 
examine locking as well.

>       /* No need to update mip for VSTIP */
>       mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +    if (!mask) {
> +        return old;
> +    }

If this is kept in some way, this should be written as

     if (!mask || (mask == MIP_VSTIP && env->vstime_irq)) {
         return env->mip;
     }

Note that there is an existing bug in which the returned 'old' is 
fetched before the bql lock is taken.  Note as well that the existing 
mip update statement doesn't use 'old', but could if it were fetched at 
the right time.


r~


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF4C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:54:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9TyT-0008Mv-K5; Wed, 23 Sep 2026 16:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9TyL-0008Kg-Lt
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:53:46 -0400
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9TyJ-0006w7-7P
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:53:44 -0400
Received: by mail-pz2-x2a.google.com with SMTP id
 41be03b00d2f7-cc1cea4c7a0so824677a12.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196821; x=1790801621; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=a30oX7q6ipaVXfhtzL+femr1p4CeTPsvQJEgRmutiz0=;
 b=ne2U5fqPk1Nbb/t8RCtoAf+QImORnAEOzqYNitsDyS1nS9BwYmIOKg8q0rQTnXuKOV
 UxtlhvCr6w+iKJLT12jQX2ep+ICrzpI0pk5KN/ezUjWbJ91g3VVtMP6OMsEncJNLYGZR
 1fpbj/RIYFx055kL70ERgbWpP8x0Z6i8/vsETYT5y4bNKKCBRf+pY09elluZCLs1i5sP
 okUYWyiFN93caJNHNKz5Kdwxmtz5dWhKvkMr1BGHxsNt1MQ+ADR3ifEplHmUSm+XfmDr
 lLG2cTF7zBHeMcfM2msSv6UVHcb63ULmDHyiE5X4X8Exxl/QgE4zbdq3dMTim8AWnngn
 WRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196821; x=1790801621;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a30oX7q6ipaVXfhtzL+femr1p4CeTPsvQJEgRmutiz0=;
 b=nJDZ/TZB51Qae/HOi3Qeqcj0/au5UfehS9i5eIVRqNP9vUF044Sx9xBApdbHI5mIxg
 0HcPC3zkBloqWPsW1m5CUhbZPcSapRM8PUTfCPSA40e2psWE3Nu+yLErJ4ci9WXad0vt
 8Tz4y9a0mPw5J3vnH9F1POBUHEKc17KSnv3mHRRgrU4eTNGUxtK2VS/8YlOYB5VTTsWT
 ukj9pYNqRbkoG3iwppbrhpiox2LO+4mrmYoZxBIF4cxEdWtPrrMA7ePFaUw0kbyq3Uy+
 wA7LZceIDnvJWQsFZYhoeBrdKewOArH34bXIGYnLkaRkgbMySQbGBxJ2i9kDkKbZ5uN3
 E8BA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLQCBBH594gMdTrozUebQDQq1J2IhSRJCH7XvMpmZx1woFHUqiYt7rQ6Xa4Pt+65LbBD6eBUCdaw==@nongnu.org
X-Gm-Message-State: AFuF++m9U4l3dTlbDWEAbH5/w1o2ZKHFvFgSyU8uGLVcLL6vcrWA2BeB
 uAiZIJU0WouZogbbBCOVCo+gtQ2gYlmfCDZ/XuBanGJ/GCPcfFVimJGm+idb/TofQlU=
X-Gm-Gg: AYBFou0nwX76jlU8z+D9QmaRONdCxbiY0jObC/25b4wun+2pvTTjeoNCeok+z2D2CFs
 2uuH7mkaGfhwNep3PU9HxraJKYnIacryDiQpSpux5ZIsVUMZJd6Pmgesn8bX92C+3yJplK/rWCF
 CeVH/PHYZ5ENK1d9fSGTign+P25i53YwL9LlTBSX+Gee+03427RcGeVCW0e0GlcSZO8RuFuWbhD
 Lxwc/ydzFwssl9TOi0CsjQkQWDQnM8e2j7DpAIcb0AWj/aE4PY7yrddBbi29Kn4xP+5gwL1jXMn
 xz5WcGTIqU+ojDHFTHjUE6IkhaHPfZYHj54zmGsqDSON7DI3wuPQm6jEbKPVnN8rg7ObN2/LDi+
 GbhexrJqvbq5udsROypfF/zVOP2h4ofcqJb6QJPEfcf3Ghh+XwbcjDugyY+Z7gREfH4Sg4tOqpP
 o127CzbxKR5ft3U5bAZ9mea79oIGg4zyMK/6wg8407IBlP4zcVOVeHdKVXrWpOPBRMmoRCPQvae
 dQNyqrZIL6j4HxCanrMuCFA6q/pMAa6OIeYE2TC
X-Received: by 2002:a17:90b:1e53:b0:3a0:71d3:bb64 with SMTP id
 98e67ed59e1d1-3a09860b71amr296306a91.27.1790196821149; 
 Wed, 23 Sep 2026 13:53:41 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0972b11d4sm863831a91.4.2026.09.23.13.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:53:38 -0700 (PDT)
Message-ID: <70ef8524-f301-4247-b0a5-2a63f2d79f53@linaro.org>
Date: Wed, 23 Sep 2026 13:53:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] target/arm: Don't use arm_cp_reset_ignore when
 fieldoffset is 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/7/26 06:02, Peter Maydell wrote:
> In cp_reg_reset(), we treat an ARMCPRegInfo::fieldoffset value of 0
> as "reset is handled elsewhere".  So we don't need to explicitly set
> ri->resetfn to arm_cp_reset_ignore() when we haven't defined a
> fieldoffset in the cpreg struct.
> 
> Remove the setting of resetfn to arm_cp_reset_ignore in the handful
> of places where we were doing this unnecessarily.  These are all
> timer registers, and doing this brings them in to line with the other
> timer registers (e.g.  CNTPCT_EL0 has no resetfn, and now CNTPCT
> doesn't either).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


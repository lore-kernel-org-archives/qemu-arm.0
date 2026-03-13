Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09B6106FD6F
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 03:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0tW3-00024I-Vo; Thu, 12 Mar 2026 23:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0tW2-00023t-HK
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 23:48:46 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0tW0-0003gA-3F
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 23:48:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso16341545e9.0
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 20:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773373722; x=1773978522; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iJQ2W2G+6Qw3c2GrqLgBBmZoU/G2K5yKsF2yohSvk9w=;
 b=Q3PCMuTcfx2j8bmHUwp3i/VoJoocYzivPERFLFzIi+i3tgjUYkL6bXjWgAdEu7ev5o
 iEfXXmRclfmGwbC3DH8VZE+3Cu/cnM2jir17PzoLbZEqjTgu81MJTn1Evm5pIwn1OFqy
 K8PBtC+RlAYHOimEvx549t1UqNjnPTy/+qrRAzu0G7f4zJUF5ggw7ZxUDREbNQAj6NMG
 RoHb1BP4LlddKqZ+R8xfBGrQjVS7lu0Lwx+EO7fZBstg/hSzCSrJn8Gpjud6OYhHTGaP
 ha1yuCY4EpdMH8rdg26Ore1GOXpgxVyxcLj1lJ9pM21WO5YIeh3WlZDqfgC+7kMGVuCK
 SJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773373722; x=1773978522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJQ2W2G+6Qw3c2GrqLgBBmZoU/G2K5yKsF2yohSvk9w=;
 b=lOSKyRgwwiiidlNn2ytDGw5O4KiVVcPMArB/yxtZSqxxpT65aL4zW1UlIRdAhcAhFm
 BURhdXtNoOX8n54XYxzl/5A6SO+6YQmYM6YG2dkrMuanqQNTCXK2T4dLbB3goScXyVnb
 qkclNWejmpZpvreDZ+eW4MTm06UF6ld8xwMCB1MTiOEjqmSkPf53CPKdvxksXK0QMbX4
 gLL2l/M+LCS0HdhqkZ+RSWtTi21B9FO1cpE7TgIK1rw3vEoAktMQAuESCqdrBLNe4Ajm
 RaqiNZdokk4dCMDa5gJqZBk27lDFx7BjMRfUVixrx2Mnoap1MeVm+iqwj43gSnY31LWu
 2JPw==
X-Gm-Message-State: AOJu0YwmdjVqMJ9UYHJ21wQY7Udw4GJ+9Oi9mXHwP2Kl3tcpijtv+foV
 oNGYL8GLIUd4QGWwp7BoWjiuwbqRbi3PuFhEaWpIcbpWCEE40+uCgxK6gTg6MbpFnsY=
X-Gm-Gg: ATEYQzwkcJRFa2ey5I5vJGF/bV2yGKaU2y78kYIIMyxWVzl6+L8aEXNMvTOVeBh1WJg
 3anqYteVhB49LBys0hoNIv2MgC3wGHDYCLyFVyYwRd8wTMI+jelJm1BMfgK45TsTcULYbiVJJ/7
 eXqudBjnXX3VLDrqGLV3lRgjc8RDsVweg1Rlz/dWmHPDhodSzIXx9iXdeJ3CPeN+PLwR/tQede6
 wRnxU5/oqUT7z4j7WaFfLbqsGsBLGoHEH4H8pt1n3lg3E0DObKnqOuGWjcikKhc/p4eoNTJY3IE
 ryy57cOM6OpTpcklc+qeIqXnd8PDP+Ny94eDvRw2z+Mum4WGkjvcLoIPzXz6Zwtz3iUYJu3SeZt
 aG0JZ8rgeWM5TjT8wugAEmkWsSmtw/hhvqzwtxUATLUzBTn+A4Wacydd8vxLv45PPmy1MG2UE+c
 uVCHN+fGTvpZqoywssYTmPkOsbK81YlKnQD+nDbi7waLa9LF0nub+nznwN/+dWN4aPAV1ybmnuC
 cM7
X-Received: by 2002:a05:600c:6290:b0:485:33b7:573d with SMTP id
 5b1f17b1804b1-48555ab0a59mr31222065e9.1.1773373722056; 
 Thu, 12 Mar 2026 20:48:42 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b66dedfsm179029505e9.12.2026.03.12.20.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 20:48:41 -0700 (PDT)
Message-ID: <719ac842-22be-4617-8b87-02424f2b9ea5@linaro.org>
Date: Fri, 13 Mar 2026 04:48:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm/cpu.h: restrict cpu-defs.h to target
 specific code
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
 <20260312224702.1608408-2-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260312224702.1608408-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 12/3/26 23:47, Pierrick Bouvier wrote:
> Allow to use this header from common code, which we do in next commit.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20b..b8042f65bb4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -25,7 +25,9 @@
>   #include "hw/core/registerfields.h"
>   #include "cpu-qom.h"
>   #include "exec/cpu-common.h"
> +#ifdef COMPILING_PER_TARGET
>   #include "exec/cpu-defs.h"
> +#endif

Since there are no other uses of COMPILING_PER_TARGET in this
header, this clearly mean "exec/cpu-defs.h" isn't required here
at all but elsewhere:

-- >8 --
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20b..445d5a8a31d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,7 +25,6 @@
  #include "hw/core/registerfields.h"
  #include "cpu-qom.h"
  #include "exec/cpu-common.h"
-#include "exec/cpu-defs.h"
  #include "exec/cpu-interrupt.h"
  #include "exec/gdbstub.h"
  #include "exec/page-protection.h"
diff --git a/include/exec/helper-head.h.inc b/include/exec/helper-head.h.inc
index 5b248fd7138..5603c9941a7 100644
--- a/include/exec/helper-head.h.inc
+++ b/include/exec/helper-head.h.inc
@@ -46,6 +46,7 @@
  #define dh_ctype(t) dh_ctype_##t

  #ifdef COMPILING_PER_TARGET
+# include "exec/cpu-defs.h"
  # ifdef TARGET_LONG_BITS
  #  if TARGET_LONG_BITS == 32
  #   define dh_alias_tl i32
---


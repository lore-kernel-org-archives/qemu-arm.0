Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801102ejb;
        Thu, 19 Oct 2023 14:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmiu+KgPNfpUH3N1eZyNKS81iVVXB7HYuk/pjcqY54i763MCxmX2IKxSqw0StT4sPS+Sw2
X-Received: by 2002:a05:6102:23f7:b0:457:bc52:9b04 with SMTP id p23-20020a05610223f700b00457bc529b04mr171447vsc.35.1697750500122;
        Thu, 19 Oct 2023 14:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750500; cv=none;
        d=google.com; s=arc-20160816;
        b=zmS/mC+JPAz+2ZONCZVeJyGhGpw0PAolCwX7n9HUP5QvBuZxljxJhxj7ZUrDrb5uAt
         01smkVb+ZoXQpQ806PD3EzAHgSHxHEd+GnqfsAJVyncK1u7Ya7Xq+mIcVfRkye3V7b6U
         cMmqpa05FuLCrmwBsiN5Rz9PG1Te1G/gf0/yHoTJgSE9Cver/KT0CZPJLO6E7BW3wd8b
         iEX+nY5AGbmI/+sS1FOup3U5HQ8iOeMq9riRWvHowDEUUkGB1JXY7+wZxSyrxzRUoEv+
         d2Q6YzJLNvilfeq+rQM9Fmhjk0VtxCObcfiP7s+QlhiPSbm3YN/ZYMZQ1hr4RLOaHLDt
         1UqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MEQ8PJ+7/tWDp1e1acSYNFj06Phs17Z7XzBWfANn630=;
        fh=V9LgoFM5kd25IC4eMUI8GLD4a31JHGzO0z+CEHczK3o=;
        b=zlFje5favGWANBI/SQPZFz/hnzYjsy9WFhZTojk67CEmYkWvQndK6460QC4rv2jcec
         BF6vJ552JpLmrb0iIPwn2NzlkYLa5tX171uBXZrCptJuqIxWiM8z/INc8FpAUYBlMn+3
         0E4jMAu4zklBA0aNXYTK9sQue8OIxU6aEfp7H5UBtjlRUVycUhubMjNrN90N3BNWDnLp
         TpkPR7Y8vPSzHmWiTrHZkX3kyJOuWyzQNy7OJfosgyzQWQ5nTj+jd/8YNShfNNBDbVeO
         AS+2elTMHWN7VLZC6r+7B0QgCsPM3/aZgj26SBX+wKgctIB4XTxq2J6m+CMD4gXDOmNe
         zn6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDViE9tQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a0562140b0800b0066d1e737d52si351477qvj.53.2023.10.19.14.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDViE9tQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaQt-00072H-AK; Thu, 19 Oct 2023 17:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQm-0006iH-7m
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:19:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQj-00056g-CE
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:19:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso938315e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750384; x=1698355184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEQ8PJ+7/tWDp1e1acSYNFj06Phs17Z7XzBWfANn630=;
 b=yDViE9tQp/gicWUGWWdsRr1qTN+E5FmiOiHU/JDklz1PZSTagLoPj2z+4vxHlrpTtb
 1YmOacRZGynauV5AFHqK8ZnWXRZTEQoWOiqMvWpOr/jsk9yWed86kPLhVopuPM4WKcT7
 pjp/fneWJM25xnadFndmf7W5aCCQpUTafpjByR5WubaPVWI6dAC/NiPP2P9VbHa1Z93U
 d3rfRWE3HSKkqDrdhCf5ELTVylBgJELfzBGPPWvz8XrpffVDjKwF1Fbgx8YCXVusyzO6
 VwrXb2xUth1IdHfCKTB3a8yS+v4AFqrEJJgi8nG7jNIs8tcFaGwN8Mf8GkTys8NVrjvn
 AG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750384; x=1698355184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEQ8PJ+7/tWDp1e1acSYNFj06Phs17Z7XzBWfANn630=;
 b=DkVB3WdHsyRRgJtLcvzwupkg8hn0C25zbvJi6AjurYrLZLBSdI2Jl4A82usteGrM5E
 czRaihdBDDLclSyi4hDq2dt8EO9ntOHF08g+Xftm2gkQhQ+Hx+F6bABDdpBPHYveDYus
 mmP4vHMw5BjYEoKVBNtCQMIl0FnpW78HftJROrMti2SMC8zMdA/5fnzuzcZcwLaY+ITk
 n5uhKiBFPuIyBvdpWNwHL5L5DnxZFNWbRIXtyM929qu+LpVa/88J0cH3xYNGUL+V3NRt
 pVMi5JVnfaSzFJwIsWb5ClFxmep0+ZmwN4rdJkLs3nR0tj21Rw6mfafKBiYGy92gidlv
 Nc5w==
X-Gm-Message-State: AOJu0YyE8i+ubU4kF4mSbLVV8y3bgxAt51NN4cfwKodcxrfIAa7KNgrz
 non3rXhvLIfrM1wVtBTpA0dLgw==
X-Received: by 2002:a05:600c:3b20:b0:402:f91e:df80 with SMTP id
 m32-20020a05600c3b2000b00402f91edf80mr2978322wms.3.1697750384014; 
 Thu, 19 Oct 2023 14:19:44 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b0032dab20e773sm214722wrm.69.2023.10.19.14.19.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 13/46] hw/misc/mips_itu: Declare itc_reconfigure() in
 'hw/misc/mips_itu.h'
Date: Thu, 19 Oct 2023 23:17:38 +0200
Message-ID: <20231019211814.30576-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YhHjsJnpYQat

We already provide "hw/misc/mips_itu.h" to declare prototype
related to MIPSITUState. Move itc_reconfigure() declaration
there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231009171443.12145-3-philmd@linaro.org>
---
 include/hw/misc/mips_itu.h          | 2 ++
 target/mips/cpu.h                   | 3 ---
 target/mips/tcg/sysemu/cp0_helper.c | 1 +
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index 35218b2d14..a413789151 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -79,4 +79,6 @@ struct MIPSITUState {
 /* Get ITC Configuration Tag memory region. */
 MemoryRegion *mips_itu_get_tag_region(MIPSITUState *itu);
 
+void itc_reconfigure(struct MIPSITUState *tag);
+
 #endif /* MIPS_ITU_H */
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index fb44defc93..5fddceff3a 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1350,9 +1350,6 @@ void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
 void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
 void cpu_mips_clock_init(MIPSCPU *cpu);
 
-/* mips_itu.c */
-void itc_reconfigure(struct MIPSITUState *tag);
-
 #endif /* !CONFIG_USER_ONLY */
 
 /* helper.c */
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index 5da1124589..d349548743 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -28,6 +28,7 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "hw/misc/mips_itu.h"
 
 
 /* SMP helpers.  */
-- 
2.41.0


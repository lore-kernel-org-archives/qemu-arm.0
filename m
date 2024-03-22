Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1273377ejv;
        Fri, 22 Mar 2024 08:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoHfINft6ha10kwf0w907nSVVxdMJhgj6+r7au8nxZ0DeN0mF46zvYPVpSKG1ByAksY8LyX/xrSYdFBxwD07ukQUU558T3
X-Google-Smtp-Source: AGHT+IGgnlWX1KOfhKiYzVZ3yskISEIecNKLW/ENJbkDm4pk21N6MD8U0DzyGNfnsCPQ8bs13QKh
X-Received: by 2002:a05:6214:5014:b0:696:75e4:1d1b with SMTP id jo20-20020a056214501400b0069675e41d1bmr249981qvb.8.1711123148359;
        Fri, 22 Mar 2024 08:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711123148; cv=none;
        d=google.com; s=arc-20160816;
        b=ApUWEEJzVMomhhVZ8PfukQ9M3hw4endt+ojleWZx7XWdY40VU61YhuINzeONiL5+8o
         HUDFIbdraIGpv/I2RPZDqLfjtuV1GXMrHFF/pG0zhhnyppFYTKkTFBmtKb+vHCFeT7Fv
         ASwrEDDpenEu/qfKeiW2vmrI/l/Ag/aEqA6QkoiJi2wDFxyORpVIJq4j+jQOqIyNpriu
         gB1FoyDgPQCQxceFnCcL+tTGnhP9tIDDdLIBeqMyDfygqP4a7JfjzF+XTcOS+ySkm7fd
         7EmWopidKZpHLTbu03Wd55giW6rgGnq1+B/eHhlBu3ufY4qwIgTX3jALlmT1RQ3Vb+Uf
         NyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UxjY8qQEnjtbAhkgYiOeCHJsc+3HFQ5wgndLMK/z5QQ=;
        fh=JzhUxzmpT3Kx0szYg18HKozZBflG1EwR9+QWfWnSBqU=;
        b=z9kbZm0LxySwEGbs5PUSfQrvQrvdfTY7nIfDLOI/M2rHalt55xZ2rZjwGBuV9RQebY
         4lpr22WwXATDiLrX8zhc3kwlmqwwUw3EBErlopELzVIYSrnIl5ySh5f3un72OpSaZK9Y
         Kv37FCXUpS0bHoGw5655FtrlrrwqwNWZLBw3LaI9wlG8/QG2KeTAP5dSH5piEFP+4/vF
         uYvIM90VWn8pps2o5rB++zgRfwhYAw+9VruphFAxaZ0S5eJNBd6LevLwWHLw+RdiJI48
         C4k9iVPiEacSBF5Vt/jePO20b0RYsLV5roiH2NL8RspwgnEVrAvTVpA97Sk9M+1/aKmN
         UEDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R8r5hRY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf3-20020a0562140e8300b006966d32ca02si1265823qvb.609.2024.03.22.08.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 08:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R8r5hRY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnhHr-0001Aw-2a; Fri, 22 Mar 2024 11:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnhHp-0001Aa-Dy
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 11:58:29 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnhHn-0005eO-Tk
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 11:58:29 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d475b6609eso29372611fa.2
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711123106; x=1711727906; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UxjY8qQEnjtbAhkgYiOeCHJsc+3HFQ5wgndLMK/z5QQ=;
 b=R8r5hRY6gwbZVFB1TBsELt667RJ6iOqB98kN5CMLlnMD5ufnNEOZArHovNoWw7R63I
 wO9L/NLD0TNQSiE/lGgYYwH8D5IXPMyu3wT8yhPj0Qffl96HmY5E3rMo97+wmY+8oyqS
 RCInRUQNNJoUuBxyfmkRL503TD1fcSoTVmjwRrZmheak9oq84i2nJzGFbjPtOSeCdgIi
 +VeThnHK/yL8Mui08oaJui16LH1ROUnxT8NRnXEsaaC3pQJ9ftZUKbv33wHQnYJTaS0U
 wSkjynO3Vk2z2MujaDaaWP3M8NeAtNCEAtlyk6/I4itHa4fuSv4R5Rb+5TecmGKoU1Xm
 aIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711123106; x=1711727906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxjY8qQEnjtbAhkgYiOeCHJsc+3HFQ5wgndLMK/z5QQ=;
 b=XeUacKl3xtNle8ntVVASTXJD9Mrt1/2qbiZl52rmW69DtO5tVZQN833JBh2eeZ2OMR
 /JmnAAFct3CpaBr1iPp90MAL9NiIfSw8h53bWPW6e3ycsHEYPgobK4igOPreCFq7riu0
 28Sbua9xGSzLRxue6vGj38J35vmltCUQGO2/rIJH97G4mFXa5ifg5D3gVjpnRL0s0Wsn
 31XyCVzsCFZnwc9pFmN608eWJokkWMDBiKU9CreP/dLqa7mQPhxX5gwIygysvKdeBb1D
 zL0q4nzFx8EqpaIo0GR5RWaQx5RcmlSvh1gIy6I+fvmNzwIejf6mfgH9dzHwe9G3Durc
 YDSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFIZhf7FSwQiwE5c4JcfRRyFXGjNq7/IY1HhyMVCqGq4ps16JtuiGf+zVTlxJt1rXsCwntx8GPAYNiy2pKn2ctHpvR
X-Gm-Message-State: AOJu0Yw/cm9udI1e2/YzlsDGIAKrybsJZKGFROvyQNQYZdQvRMYo9pPk
 rndE2j1BqWCQ9MA1Guye1RBHlkBx8x1PGgZeWrVGEph+SlPRGKgSmag50xj/eXE=
X-Received: by 2002:a2e:8ed1:0:b0:2d4:74c5:2cd3 with SMTP id
 e17-20020a2e8ed1000000b002d474c52cd3mr2166352ljl.41.1711123106159; 
 Fri, 22 Mar 2024 08:58:26 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.178.251])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c350b00b0041477e76ec6sm3486777wmq.2.2024.03.22.08.58.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Mar 2024 08:58:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Luc Michel <luc.michel@amd.com>,
 Damien Hedde <damien.hedde@dahe.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 2/2] hw/misc/stm32l4x5_rcc: Propagate period when
 enabling a clock
Date: Fri, 22 Mar 2024 16:58:10 +0100
Message-ID: <20240322155810.5733-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240322155810.5733-1-philmd@linaro.org>
References: <20240322155810.5733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mUEuJVc+q6GW

From: Arnaud Minier <arnaud.minier@telecom-paris.fr>

The "clock_set_mul_div" function doesn't propagate the clock period
to the children if it is changed (e.g. by enabling/disabling a clock
multiplexer).
This was overlooked during the implementation due to late changes.

This commit propagates the change if the multiplier or divider changes.

Fixes: ec7d83acbd ("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
Message-ID: <20240317103918.44375-2-arnaud.minier@telecom-paris.fr>
[PMD: Check clock_set_mul_div() return value]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/stm32l4x5_rcc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index bc2d63528b..7ad628b296 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -59,7 +59,10 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
         freq_multiplier = mux->divider;
     }
 
-    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
+    if (clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier)) {
+        clock_propagate(mux->out);
+    }
+
     clock_update(mux->out, clock_get(current_source));
 
     src_freq = clock_get_hz(current_source);
-- 
2.41.0


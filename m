Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp701679ejj;
        Mon, 25 Mar 2024 06:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSwShNbP5/HgsX1k62OC4cXmpvpVarcNaRy7oucb2HolyGCGNaUAI2K+ebsoIZ35GZz68Yq7bOknklaAsZbWGwssd/lxIh
X-Google-Smtp-Source: AGHT+IE/XzRTOhWQIyyw2kv2zPKtxYYWRSnJAuD+cJmyRUbfrjfydUcx1iEiy8ghEgk5U5hOkU80
X-Received: by 2002:a05:6870:63a4:b0:21e:77bd:b7e0 with SMTP id t36-20020a05687063a400b0021e77bdb7e0mr7145702oap.39.1711373630426;
        Mon, 25 Mar 2024 06:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711373630; cv=none;
        d=google.com; s=arc-20160816;
        b=fnJfm1S3DhpPp4LRABTbBHmUadX2ElBvfTZcE5OyDG7UXnktNTAEhqwLnsM6yrzW/C
         PL7wH6rmBO5Wo9mD6STmftc1YiuL5y4jbHEvD8wQubtSzYRFyArIWzao93kYmd3Pkrzs
         qaISyPakmqIiPLFTeIu91KuGJQr8GWTnRU4vYTmyQ/dODH7CH0DGGIE3gINKBgJ56YWs
         M1HsEw/57ZG2TC5yrlI003E3F9SmG9MOj+iyElkicgyYSIe6o0HK1D4KrnFUpWUD4s9y
         AZmAxc+CYIU5KEbDdO8g35fS6LT+iBIFOCeEKrZb6l2o50vf4zAMQWgwmDqJcsezVzyz
         ARvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ECmMULAo7ez5jaBxa5Wjvt8SfPbxgHkevNpFi8ZZgIM=;
        fh=xZuP8fVJGVRbMPXs6qMaCqi+WQ6WIRWSxnOS4dtF+Lk=;
        b=yb8X8tmI6qucb2WpnvLwH+Tcv4JgCFyPZDBPU48Bt4MuZJWeH0nV8UanZUgAj3ISF+
         ZkUBgsbVHVwu+L7FxvfGnXJNAKYRxXyhZYEmXvx9TqCURO6tbWHWFkcQ6NJ5nC7/j2eW
         LlVdunaYV9o+Ct/ori7QPTODvWX3uqLWOBGepFUKdteOktVxdNHZi7tA5XYShwYrIm9o
         4x0OcRp/7L/9874bLGuuUzBn8+uHqQ7DsMDEdNU4h5AMTnxDycmTrzUjv73HiIHat5U9
         QZatBOJ3TSltW6p3yuvoQ6ifjab321bEGcAvhKREKvgbQYRtMP11skh/Vq1lTEbspkTZ
         IcLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWZt6tpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020ac87f4b000000b004315f2fc3d8si969142qtk.16.2024.03.25.06.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWZt6tpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokSN-0003Al-Uc; Mon, 25 Mar 2024 09:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSM-00032s-Sj
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:42 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSL-0007QG-6n
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:42 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so5469465e87.3
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711373619; x=1711978419; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECmMULAo7ez5jaBxa5Wjvt8SfPbxgHkevNpFi8ZZgIM=;
 b=LWZt6tpq8WlS3qrd9yC0vjOon2RtjlV/kpiGcYDPto/i2m2brHGJYw4bnoswlYEVTh
 i+nPU8Arb5RumI6cvT9qkkZSnjfgLPALq+b6mWQmC7LSTSkn95EkhBRNngOLNeG+xSBh
 VmGi1o7tj9Ncx1rfac3AdHc7yaNSjTD+mGPTk4eC2telqYrf/XITDa44N/5ksWn6/1g4
 tpQ1kUTGaunJyxoc5l+oBTXORBr27DqD/DFWIwTFZ76WLBhO1X6hGXG1H7qamxmJRo6x
 Uh4vhysIPFnv+UBsuJcZJp55Aioas82JoP1Def3hnMlnNjmB1vBlmYxAGwG//6HL/LLw
 v7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711373619; x=1711978419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECmMULAo7ez5jaBxa5Wjvt8SfPbxgHkevNpFi8ZZgIM=;
 b=I6gZBTghjmakDrYSmmGWB+1IAIaA5dwp8cw7nJfUAV+Mz3wYcRgffM2uFTefFYy1v9
 aFxGupZGhIFL70OGlrrz+1W0CDEYW8wdZwdQYRzuLS70SmgZS/deDm4IfDp6cM6YtrJG
 gEEx+7qv1QpDLpI6iWQQDquaHRpianFZ2zacurAtAhIG1iwKtvt3b+4syMUjKiGl+kpB
 gpEkNWZf+GNCCG1LM/WeW7HvUaPx0AZUb92c57Xqs3wNxOX4VsTEdxMP+CzAmuYHGRWC
 spfexgbuTMBI3jpylzhrJtDtR0pzGg9/5gaynvCZ4TVVPIOc5shjqK4sUTkBUmOtz4je
 jkGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdLgEy8pRhtO6MUpTx1leBVa0+yMVBRA19bzFGCZwyct5Bwr+wLuAnlo/oauuBgyrUcoYaZGE0uLP16CAxzGha3dSa
X-Gm-Message-State: AOJu0YyXPHwQYx+2S95oPT5pXqxaQkKPS9XZL9JHy/vblzVBAlq1un5C
 PfFkib8qJKbgDEIRhx5cDvCLCunXJPGoGEvLyh9A5tworA/+L/taMqVIgsyXzrk=
X-Received: by 2002:a05:6512:55c:b0:513:184a:ff5f with SMTP id
 h28-20020a056512055c00b00513184aff5fmr5010410lfl.50.1711373619372; 
 Mon, 25 Mar 2024 06:33:39 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 en7-20020a056000420700b0034174875850sm8133536wrb.70.2024.03.25.06.33.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 06:33:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 6/8] hw/misc/stm32l4x5_rcc: Inline clock_update()
 in clock_mux_update()
Date: Mon, 25 Mar 2024 14:32:56 +0100
Message-ID: <20240325133259.57235-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325133259.57235-1-philmd@linaro.org>
References: <20240325133259.57235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: cq+Q3dRhAePe

Trivial inlining in preliminary patch to make the next
one easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/stm32l4x5_rcc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index f01113308a..8852b434db 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -48,6 +48,8 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
     uint64_t src_freq;
     Clock *current_source = mux->srcs[mux->src];
     uint32_t freq_multiplier = 0;
+    bool clk_changed = false;
+
     /*
      * To avoid rounding errors, we use the clock period instead of the
      * frequency.
@@ -60,7 +62,10 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
     }
 
     clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier, NULL);
-    clock_update(mux->out, clock_get(current_source));
+    clock_set(mux->out, clock_get(current_source), &clk_changed);
+    if (clk_changed) {
+        clock_propagate(mux->out);
+    }
 
     src_freq = clock_get_hz(current_source);
     /* TODO: can we simply detect if the config changed so that we reduce log spam ? */
-- 
2.41.0


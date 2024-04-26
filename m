Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638860ejb;
        Fri, 26 Apr 2024 12:47:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3BnI49uVz6TxZtfYuCgqsROH2mawai1hny6nKwf6W04mT/YR/VZXcFwYIVxs5ayci4hJXJj5xRh6WN6LwsiLDARvXHn1o
X-Google-Smtp-Source: AGHT+IGUNxVcxQaan3CVXx83VRi4k1QkhbLTeys7gV0GYb9ZgXjKe5EECmCne6a8Gt4UKwGLO2mx
X-Received: by 2002:a05:622a:1a03:b0:437:c3d9:140 with SMTP id f3-20020a05622a1a0300b00437c3d90140mr1012170qtb.18.1714160852464;
        Fri, 26 Apr 2024 12:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160852; cv=none;
        d=google.com; s=arc-20160816;
        b=jX9ecDEM55G7yfr4ks3ERwceTuIY/wc/nST2T3qCdI60qZ6jO7PsSZdwvpI9Zx5Hab
         piiyAcLNLBAL96diHEJWyMWk0YJjJm41oR/1uVJSzZ0dBNqlNPlqB4AtsIYcymALLocI
         m5R/Bz6uCsmhFVeVE57mfRszrcugI/ody1lxFBlwA07uV6WiVoFdPQeXRMS/+v3ExsC0
         O73icQbQJ7rzO25OBgUCjtpvfBzMxnlJQ9cJzkpH1JW2CCXGSjvaPRDmCCptTnLfppUp
         2ElZMMvrb+YOhB1+lMMo/Q801ztqoa0EHO6levGPg2TMGdkhxdkxTKbmWPPtu3gBPpFN
         5N9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7ENBQU0RX+7z0jYkAe6EtdYUSGSuY24I2mpEgO+y4o0=;
        fh=gUEsd95llBLtqUKhUnPIoHQ/SNwiv/bmtZ7rMzFWY9Q=;
        b=wpRZVpkawGQo9Jt8RYTq3dgvWWC3G80qDqpFXPwMuLHTFxeFAEp5mVbL2+kDAHd1b8
         40UfxRkNQO696IJt89mENE0fCewS1/1IxS93ayunUH9gmhtUR79DIQy/L31ER5OhlQle
         ljFl0hx9+Uhnt3bUnaUMOkZ904y1WqpSYHhbirMSSpC0eOOKprEN23XsN/jMli+MZ+lP
         gujrwWQRt98y61nJR1TnB6k6SMVeX5b10MoN+J5mRzEAsUAAtTgZwjHVyMmmGsMiFTE6
         Sbdhby2S8CYLiZmiEzy18wySOG9sAoR0NyLcvvMhc+CzrVNLs64hzsDmmfQojYq/EzLy
         LvNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qFvyHQit;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85949000000b0043a2a444439si6419994qtz.685.2024.04.26.12.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qFvyHQit;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0RUV-0003dT-Mj; Fri, 26 Apr 2024 15:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RU9-0002Rs-16
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:43:54 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RU1-0003Eo-Os
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:43:47 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5724e69780bso2137809a12.0
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160623; x=1714765423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ENBQU0RX+7z0jYkAe6EtdYUSGSuY24I2mpEgO+y4o0=;
 b=qFvyHQittAKmODWxgVXsBe4Ov8PYrWSNK6/GUkdqbRgFvRN0Oy8XDFoPDIalHvP+dw
 mJqP2fpz43U8fyf1+VGmvk02UG7w/zlNFWJVN+yYUs9OGQOjg7wm5KGV5nJs2pE9g8PJ
 1MKydN8toAgbovLi1Z3fT28QS1UCYLW4CkshqNsc6vDe8KiqD2/pAFKFPbbn3uTZGOGG
 NrI9yZ0ctKmJ7CUQm28dsw0H4jcWw+cYiWAuDjRLQiZ1elXkSTW+K8Mw6yCWqTsjlszI
 1gq7TAued3ftv5HU97WLfQ1txFOP8uaf1aJUqhT7xGPGwgmYymI6AxqQgCOMhDQbiDHG
 DaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160623; x=1714765423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ENBQU0RX+7z0jYkAe6EtdYUSGSuY24I2mpEgO+y4o0=;
 b=SvVutiojXwh/vORos2p1+kP+EApnHhir6e1mnnx/jvrbNgKHp8GsA1doB+HLhSyy0W
 WaYI25xwzKnXnW6iEKn+YAWbb209JpsR/vOnxV+uxHsY57flzc4deVRtFI/d49996lHL
 iDFuCqx+43COuTR38lrYPfIr2eUQmugB9lmth/AZRj8uv4aZaePDHnchIrO/IWH7qo/5
 L4yP9levDMZ9SL+bA9ebubx7YsicEMET3sOSCF55F4s81JOOVEs34cbr2hJNbecTWh+a
 0le8ACirb2q9QVqtTUjQeSXbZiBh498g9LIvt1Iwdl7sNlKb18qn1yATZxqQaLKX2jBg
 qd3g==
X-Gm-Message-State: AOJu0Yxj4EG4VmmV++KGzVNQScbovqJE6mOu7b9Vbz/TDZ5ZSnciNrZG
 bGKJhO2lS+Eva2S8OSzJZqCZY4v10RvS/7Bu6xtEfx8DoQxAh9GoRfBTadpc3eOmx8gOWjXIQS9
 /0t8=
X-Received: by 2002:a50:99d6:0:b0:56e:355d:2ece with SMTP id
 n22-20020a5099d6000000b0056e355d2ecemr2481443edb.30.1714160623526; 
 Fri, 26 Apr 2024 12:43:43 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 ek17-20020a056402371100b0057266474cd2sm289245edb.15.2024.04.26.12.43.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 17/38] accel/tcg: Include missing headers in 'tb-jmp-cache.h'
Date: Fri, 26 Apr 2024 21:41:37 +0200
Message-ID: <20240426194200.43723-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5UJhlhr81mqz

Due to missing headers, when including "tb-jmp-cache.h" we might get:

  accel/tcg/tb-jmp-cache.h:21:21: error: field ‘rcu’ has incomplete type
     21 |     struct rcu_head rcu;
        |                     ^~~
  accel/tcg/tb-jmp-cache.h:24:9: error: unknown type name ‘vaddr’
     24 |         vaddr pc;
        |         ^~~~~

Add the missing "qemu/rcu.h" and "exec/cpu-common.h" headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240111162442.43755-1-philmd@linaro.org>
---
 accel/tcg/tb-jmp-cache.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index 4ab8553afc..184bb3e3e2 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -9,6 +9,9 @@
 #ifndef ACCEL_TCG_TB_JMP_CACHE_H
 #define ACCEL_TCG_TB_JMP_CACHE_H
 
+#include "qemu/rcu.h"
+#include "exec/cpu-common.h"
+
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
-- 
2.41.0


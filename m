Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1782637njb;
        Thu, 6 Feb 2025 12:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiJLcOkpHDPJmx4KIHW7p3BybZUQ4TDExaMLQA15LpoZJhnJ4EV6yanITAz0WCOhCYyPPAVoWXgUhZVA==@linaro.org
X-Google-Smtp-Source: AGHT+IEuEldAvTe24e4sjpKp8riAGFL9I0/ZWB6fLQzSRKErqBFAuAWyHvL3eOtLV7I7I5RdFxe9
X-Received: by 2002:a05:6102:441a:b0:4b9:bc52:e050 with SMTP id ada2fe7eead31-4ba85dac693mr529554137.2.1738872354170;
        Thu, 06 Feb 2025 12:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872354; cv=none;
        d=google.com; s=arc-20240605;
        b=OhHogi3JspiatsTlDZG12CFXbgIOZsN6oqUrvTkrnjgyXBQDLH2LbOGWx4eB9Loqdc
         C8sQ8j7ExvVmS2bKTaBxLKeZxpv2e52f3JDdiuL5MoEFaYTpLYZYtRvKu7DMx+CY8/XZ
         GGiY8z95Ku6lzV5rKJN1AoV5524mh0HUPMy/tD3H3XKGPIVHKbBkQpdHixQnCnBtwVkA
         QMyEnIpRWSOQtSIu3bkyoZ+YafW8AZ349ztk+d48TBSeZeHF53qNNjbE8kyKDvREPMvc
         6odNwtuIK1eKW/JZiSNLf6VdxpMk6G+SCTKw7De5+V2gRoXaWx/hfXelCQGXCICSap1h
         nVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c5KiZyKM080ZbjR4LrQImvIYhFqt6qNWMePeRVyLyag=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=e37VtH26lhNmg7QBEpKhfMe2m07E3mzuZsZb9OjMZiJTFPcqSZVbdjcQiABg4O+DKm
         zGbb31QAsZ8TNF6n5bbMtxpYHk/YzG6Aue6IG/389hC681k2puGdCDgqBUwFjWpZaRcd
         SUGGcQgt4leHWmaUX62JN8SgJosmNOcliZhoGIt/avodMahQGwISU/3X9XE+zrclDSUh
         uFuecZPcqJxxp46faFESZ6WMlr553LKA7L5DBdI7Rp0NG35sSuzkpaAIQwCqig7HYcl5
         eIh5PwN8JJ88t9PeW0KbyB9Pn/DwOLqaAs5RoAZOd0TSI6SjlMLsTtjffQ43pVmfIbRh
         3nHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/C3f/uW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba7790c39asi383378137.560.2025.02.06.12.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/C3f/uW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg85J-0001rZ-Jn; Thu, 06 Feb 2025 15:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83Z-0007pI-Bt
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:11 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83Q-00018B-FG
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:00:55 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f9d627b5fbso2320476a91.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738872051; x=1739476851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5KiZyKM080ZbjR4LrQImvIYhFqt6qNWMePeRVyLyag=;
 b=l/C3f/uWwWY8TGe2T1p8KlI0s+TMp94xhg3ebrAErup+dy+rIWr5i07dIqjlKAKDqS
 7iizN1QeSH+LDgV/hFEyoCblZpGXfileYxTDKcF/EqdImTi7TqV9gi0rioaQv0awNaC0
 Y14F9+ItOPlJ3/lLWVuknQUu1FKY8DEMlr94vElE2j7j3TOprKtGBu7Ps3t2v3WrR10y
 fdZgyiPOcZr3tMR6+YaxP2QL9+XBGCaE2tnueVxIsKBQEGD1Wz/1nrMJLx8fRfKlpKyu
 /u3D+P85kwSxnk+UnZatiWmQZSMThSV3DMhRLr6NTOY3uPrf59pASANriAxXGaLrJY5Q
 lhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738872051; x=1739476851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5KiZyKM080ZbjR4LrQImvIYhFqt6qNWMePeRVyLyag=;
 b=n8i+zWALa6G6AVp7U4o1WdMxH7Cl9+yZbb/jnToHP6sFzKTRAR5baV9Vg4qbzsccmD
 On4JVfTSTVU2NJNl7QqH0Znh+9b5garuGfEBmUttmlRJ1r3B54uWln94Xt0I07NOqYQ9
 wyrKSHZiTnG35dXj0+Rg/l5QnT22p7qQ8OJ7uj5Z1Q5/ywtghBOlSx9WIKRdH21UqTNs
 9m+54ULUwwkJ2p9IyB1lKaEunL0HcHgLSPW+bACKogX2ZDCDXy4BmPR6uwqR/j+TWIfg
 sc535WrLklRZKsu5aifq5a7cuMAsTVEuaju4sYjIzQVq2Molgs9cnnihfQgEU0l8HQt7
 cwGQ==
X-Gm-Message-State: AOJu0Ywyl9KWcL5gEPShYYduslxkCag7t9o/EilCOVM8OKiiW/WwvppV
 1GgbNJXZ++FODo6Qj6M+IEJA/xQuf5/X4mRn7deJYGT9+mXzOR9SB7D1Lse5I98=
X-Gm-Gg: ASbGncudKlFMrHYazVhQGWaB3u75GsrGgnCZxdtJRnun/czIE0B/+Vfe1k9rEYzYyl4
 znAxa8woKfM5IW49X9CBQkKScMNn+uWLrB+WvVcD+5/wBu73a8yx5n4Cmi+CbZGCOfthDyIWRuI
 OoHyTnZgl6m+TFi3MGmGxTJzz4hRsyhvszHPjMe50cx/rP3ASK7jkiED9aahKujoE/7v4VUwT/k
 EDc7BT9KmTTJtNLfK252BzBQVbeO9Db4j2EUyanxSik84JIZjRqAhsQzr7EkjF9ScUF66b7/Ad7
 pFM3h+OqzFTpSbmfDMvc/vrW2YDTf1WFh3iM+GSEAt4e8MY=
X-Received: by 2002:a17:90b:3c81:b0:2ee:9e06:7db0 with SMTP id
 98e67ed59e1d1-2fa240641ddmr555335a91.11.1738872050859; 
 Thu, 06 Feb 2025 12:00:50 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee24sm1808857a91.36.2025.02.06.12.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 12:00:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 45/61] target/arm: Remove CPUARMState.vfp.scratch
Date: Thu,  6 Feb 2025 11:56:59 -0800
Message-ID: <20250206195715.2150758-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: QYojZGYuNiDB

The last use of this field was removed in b2fc7be972b9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 61f959af8b..91edeae9ad 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -693,9 +693,6 @@ typedef struct CPUArchState {
 
         uint32_t xregs[16];
 
-        /* Scratch space for aa32 neon expansion.  */
-        uint32_t scratch[8];
-
         /* There are a number of distinct float control structures. */
         float_status fp_status[FPST_COUNT];
 
-- 
2.43.0


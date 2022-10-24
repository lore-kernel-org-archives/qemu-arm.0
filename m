Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3035464ejn;
        Sun, 23 Oct 2022 22:20:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xVNeQmp6XuEjBpq3zutzoTMkAkNSYcis6aGPceBzYHnyoUqMUPtJfaSzcq18XSSAK2Zu/
X-Received: by 2002:ad4:5be7:0:b0:4b3:fe6c:904b with SMTP id k7-20020ad45be7000000b004b3fe6c904bmr26831225qvc.42.1666588835500;
        Sun, 23 Oct 2022 22:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666588835; cv=none;
        d=google.com; s=arc-20160816;
        b=OFLvNdtMPSVujwI0wWqEXJOChwtaQfzdfRuSpEqOHKg9MDs2gyJxzvAh6AJLTdrB7V
         27AmIc0ic3wu+/C9Hec5JWNmUTrEVmmMTEyp01AycjbDPlewfqFulWz9KA6S5qXes0hK
         4Ew19zeS2nKV6le4W62nYDFzf8M0tl2b8tfOFMPp6Mw65do60unwT182lQzGlNTwMjni
         GOu8DgYWJ+U1ttHzqJMSym4PNHzmtXmxE94Yh0TiD4hwoUaFdeQ1Ae7aHWvqEwVzdGEK
         VyE09gqHFpl/klGInEW18MrknGyotU4Bl+vXjDjlg3mSIgewdtTjexhQG78mgnOYZcR4
         Vz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
        b=lpl2SAIwq4Qnhpbh8oFDIDDBEOkUEldAmFf0dzmG+393UnPt+tqR8tkcE17BIlBrUE
         OoavWp/+k5Gb6dnrNZAQptVRYgsF2ECC+QgAp7eEJ7PYyYGPfuvQa3GelDB9sIr+BWD8
         W8mhefP9cNsiu+lbo1aCd4AnxI8Ifet8HHjSYLvk/F41/xrQIVZ99XvnSiINa7RVpgKY
         c2Ed7bUTJX/pf/ZhizjSOGlPHzKTvbS2na7b5ayF8pOB3zCWUmGoQhYXGy0Xic+j+Dxp
         +G3V8JojbmeLriUSBuE0dAoPdRJs97Epdf1tv7wZZe2Em5ViSqyDuin9aaSlY2PYyHBb
         5Y5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbfi46uB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05621421eb00b004b3dd79cc94si16100626qvj.532.2022.10.23.22.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 22:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbfi46uB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ompsC-0006pU-QK; Mon, 24 Oct 2022 01:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompri-0006ZF-Uy
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprf-0002K9-1e
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:10 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s196so7834765pgs.3
 for <qemu-arm@nongnu.org>; Sun, 23 Oct 2022 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=dbfi46uB/7gS8ippsDDPhZaM5XIwv8C8/d1kVqkcpxlsE+qzNODqsqFISf9M8dQd+s
 gasowfX0iZwEFaTpDb6QaV1bK9WYXptzqRX7PCmLll9kAF2nDqf/0olhEO7JW532l7zj
 jOFEA0oLX8vkFj8kXvMRzKTTPDqylXx8zEUsLFZGR9tXFt+Zn0L4MTQ2yKiohXvsxjP9
 BiEMs1t251nMEoDnbK5xD6MNyeNYSHvFsHabW/vTx56qPSOsdTZiZ0rEydj9B+r806Bs
 vFu8Ic879Phb6qQDxcpVjj8cKyP1JJXuJwvbS04oihKB1lpfB+Kl/Ezg9aVHntz2+I8/
 jyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=Jc0N2Rnge/ZzypAGaDIF46n8RyIHxCUj9pQFp1mJ3RmO5hSXifh2H65daqOKq1MSCZ
 Acm1CKT54qHcU5RpgUg7YfIk60boN+P/z0xb4JqPGqHpm9mCLqsRGVZi0cBfVt56rf/v
 d0BNO5p/aySrzsDbB6Y2baw4rcR3azVKufG/o3driV1t4YoAwUaMarbmfn8v7C9WyT4m
 pfswqEyogPLol/syGM0GnzvFesGA+9Na0x7VWJ+aRTDe/RaXkhlAlwh/bURyrNkbqaEp
 M9ZBwwzSYn6EMWShNrTrpA59KZZHFPBJr1hlrF6srUO2uiruHheMufOBnID/UgyDzQRY
 O/3g==
X-Gm-Message-State: ACrzQf2MxAda4CyrQDgNugv5SGXj+4GYoJHqq0R7xQwaTFOuTJ+bBQtZ
 7kqoTYrM6m3fHFhM2thbPBRbzQ==
X-Received: by 2002:a63:54b:0:b0:464:8e6:11e7 with SMTP id
 72-20020a63054b000000b0046408e611e7mr27325447pgf.212.1666588745685; 
 Sun, 23 Oct 2022 22:19:05 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 03/14] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Mon, 24 Oct 2022 15:18:40 +1000
Message-Id: <20221024051851.3074715-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rDk+KZKYLXY9

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c..0eeb4abe53 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1


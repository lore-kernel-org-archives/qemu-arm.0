Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp274173njg;
        Tue, 17 Sep 2024 09:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKf+YRtjPGWcKx1AQ1p2+oupvwEkpJb1cbDmulc+m2uypzF8lo8hwp8ylD9DIKSRsx+QJKuixw77WwfA==@linaro.org
X-Google-Smtp-Source: AGHT+IGzPtMTJN23Dh3jLRHTz0eMkCg1ARNLU+Rv9xZ0aNd3VWOau4Mo3XbnCO0vhlTMRx+tIcGP
X-Received: by 2002:a05:620a:1a1e:b0:7a9:aef5:e5b6 with SMTP id af79cd13be357-7a9e5fa1ad6mr3084458185a.41.1726589640789;
        Tue, 17 Sep 2024 09:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726589640; cv=none;
        d=google.com; s=arc-20240605;
        b=OqDIN/xHo6ugoVA/67InB7u2fZfVfreA+/O9HxSp8E33prRqQezih5ePOsIYnbi7QQ
         AVMZB+JJ5bWaEWDH3F0S8qFMnIEiUjLu4zk53B+ZDy2MiH0FeGH2LCA7L1TNfRCIFUpn
         0z9oDeia2/Y9QtD34PuPT0p1Mwnt6L+tY7F613RdYY08uAXys1pYHYDbLfiT+GwhxG9m
         ZsoyZ31f7TAwRRl/Gsi9wShXTFGAbeoeqBxcn2EkM7ZWc3AXTfBG3I6+1ygY8ORM/G6/
         AD8e7Rs17exCcmiNRK5m8YAfOKqCopi49deYgDjQm++Atbl1LaerZEYY6fwGHgmJch9X
         5kQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DXtzhQMzXPZEve28/UaAqCjf2VzfUHrh5WPlBaS6+B8=;
        fh=kF6i7M35pGLH2qLKppHGMaXCi4TLRRKwLtmFfZysyIQ=;
        b=g2H+Ug/gXgmChVQ84wsWnbd+8AQByADvQOFyGAM+i4aQhII4n5eduG/Y4ENTEGMAD1
         iOqfvbzbOe2ww3gP6Kze9gknZv1Nlu4XzCOkWNFK9CJ2YEnfIyPblc3GTmcLibf7fGLF
         8WOQjI3sT5Ft4TEn8UEpfIhhijJsZpNZl0MjNmpzh+gcOOnxqFNZbMwk4wKlqqStFB55
         dp6IXaRnCdZP2u8++KCiJDDjEEANXDSt7bzvLE9Mii+1CcXBaxLcbmSIJWfNch4PCtRf
         6TmZi05DT3mm7KbVJjAqXrRZt5UIqD1gCC4+KLaSQoUxQlNfC6IUBllJ9niwvUfDI17h
         +68w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0lKXmhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-459aaf1a538si82941861cf.537.2024.09.17.09.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 09:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0lKXmhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqapk-0002wW-Q6; Tue, 17 Sep 2024 12:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqapj-0002tW-PR
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 12:13:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqapg-00058t-P2
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 12:13:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cbe624c59so38338045e9.3
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726589619; x=1727194419; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DXtzhQMzXPZEve28/UaAqCjf2VzfUHrh5WPlBaS6+B8=;
 b=A0lKXmhEmNAuHefngrdFrV7DWnU2wLPIdHJtwbAaUmmvXpArbRxYmi1vLtY9YnwZAr
 CBQ0Kp9TZLe23YPbwKm4eN974rB8OZM3btn702yooP5VLp+OPJOw2IxYUvn0K8b6MG/h
 uDrGnGpjQ8zgl4dgt2+Ey7DyIZcuTXk+uYukqOwqRExStAvLKNPn40Lv0MuTk98hJcBl
 Wb03anBCDrs80sG+XBWGr6vvZY/2IK4nDCmOFPYKmqNAx+gok0RBaoT4imHGoWmkxcPC
 nnRAG//fboh7ilMj96qapODBHnevZS2q7OuEjjpmpDvUmjV4JBRN9RNBygPd1Y2l1Hbk
 KOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726589619; x=1727194419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DXtzhQMzXPZEve28/UaAqCjf2VzfUHrh5WPlBaS6+B8=;
 b=gVHkNQx/A/oKOq4d217eJuiu8jm+o0D7LfyWJ1aAYsMIjyUWsO2cTumcEnMscGGqWT
 i3TKv3UiNH0C+EBZrepFuDRTO3XzM6b3+qpwX/z6dDN7c1suzOvPLVEyNKYR+7gbGPGQ
 l0bGwl2nHgQHD0+yzH2M85NITuV802/GFUW7gjzcOOLJfci1cORRPGEOvn5sQbrx/xXd
 8Nca+cN24hEIrIgPPVFCEchXgF0+Cqm6+tDMKIMSfxO+tLEJtl48I9F1WPhehG903/ZN
 zADK/Qy8rUIfWLtHA75yN+W6VMA2dnAawg+zIO12si5BgkoCaknQoulE1ojdQoWPHnQq
 M6dQ==
X-Gm-Message-State: AOJu0YzcngN1k5Mp2xkWJcn6PkymGLRdlAtV5MkLxW6/OS8Bz8YG+EJ8
 srRoUFrV3V/SJ7PtUMP+GNNA2JPinMsuKYLakZWF8OCkNXaR2h7uTkfqJynJc1HMoBEe0+gOten
 N
X-Received: by 2002:a05:600c:1987:b0:42c:b22e:fbfa with SMTP id
 5b1f17b1804b1-42d9082a660mr101034345e9.21.1726589618704; 
 Tue, 17 Sep 2024 09:13:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b8b5asm107810295e9.7.2024.09.17.09.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:13:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] target/arm: Correct ID_AA64ISAR1_EL1 value for neoverse-v1
Date: Tue, 17 Sep 2024 17:13:37 +0100
Message-Id: <20240917161337.3012188-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: kUHINqAvH8NW

The Neoverse-V1 TRM is a bit confused about the layout of the
ID_AA64ISAR1_EL1 register, and so its table 3-6 has the wrong value
for this ID register.  Trust instead section 3.2.74's list of which
fields are set.

This means that we stop incorrectly reporting FEAT_XS as present, and
now report the presence of FEAT_BF16.

Cc: qemu-stable@nongnu.org
Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index b9f34f044d0..01689208286 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -677,7 +677,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
     cpu->isar.id_aa64dfr1 = 0x00000000;
     cpu->isar.id_aa64isar0 = 0x1011111110212120ull; /* with FEAT_RNG */
-    cpu->isar.id_aa64isar1 = 0x0111000001211032ull;
+    cpu->isar.id_aa64isar1 = 0x0011100001211032ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x0220011102101011ull;
-- 
2.34.1


Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1281480lfm;
        Wed, 17 Jun 2020 22:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbNwaZlYzZIvnI8lmcHACbY+IWFqFtIEa7J0u+JzAy5GQNUXZl4IyfPq58HSkCU0N31wqk
X-Received: by 2002:a25:3b94:: with SMTP id i142mr3550350yba.46.1592456677450;
        Wed, 17 Jun 2020 22:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456677; cv=none;
        d=google.com; s=arc-20160816;
        b=ITeFAOykCxHnp9Xdzb+iVd+HvJoNMGexPwkSlEKLZ65jPwKrzwDQ1/WQocPG69IeWK
         lJORDntgBDoHxy3DX1vXpfzbryiJZCxB+b2Vkk5ptLmdWXRlY1bmZ3pQ+SGkVR73PUnv
         6VT7uyC2XyQ+2rnrbPtVmW35fIkBEyyaEzoxvZxiuwGtLvjo4os0XDYlhlzBcNiUyAWI
         gxhnlEGPL48uXU+e7b4xBkJ+nAd5nohNrSPq4tsOR2qQSsKruUzi4Yj6c6yOF4Ci1Sac
         m5s2PLz8Udp5UIMHYQPOeG4zN8Oe8tQW0rBt1ASKRfNynbMn3Kgj9bD+mstCcVxcLe/J
         ePJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MepNhYFr1+IOeR1yUlz4CllcCZZho0JnjR8wxuWPCCs=;
        b=nnh67K5q5QVgQbjderp9tg30Isc2WpITtiLP1lWGknbHGWJ9HNfhsIt/pd38/tVYWv
         5+0kkDjLVgmwdYgeeYvabSBFap5muBL0Zaxm1YaR7u6NXYYTuLNIsSxk65Zz+K57mfHJ
         TR25hX16LqFENDklnuUi2M0tTvZg3t/Mf0QekJEWpDa7ofwL8DBM96o5NJSNxuRwYlmC
         jd23CbhFQu68/n15Ac8sW3gdh+9Ewt/O/zbQn/vVOLaviW2NFAukH0VVnaj/dMUUVTQ4
         RiUp9QWk8WVcdxjxbs9LtJo9wyx+asZomgO1r0qq3z0v0BCmAFyHbzucQkMpp102110Y
         BG/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pGE/TBgY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si1492691ybq.274.2020.06.17.22.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pGE/TBgY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmj6-0004ur-QL
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmD0-0003h4-KZ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:27 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCy-0003Lv-Oo
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:31:26 -0400
Received: by mail-pl1-x641.google.com with SMTP id k6so1903701pll.9
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MepNhYFr1+IOeR1yUlz4CllcCZZho0JnjR8wxuWPCCs=;
 b=pGE/TBgY7pi/we4LZSV2eO6ZFmN9jYsljcuFvbh9WpWZmwEYU387MoUWMV/FCDCrWs
 iE4xc1ckAcN1i5+iOJNeztkHEPDj+uGj5TyhImIWFXtqwesVRdJAokh80ebnZHnIm5Ls
 hQ/8uR/KmOdU8b3/heHzvL9mvOZjChb9g0D5FphWaVr1ju2wjVXD6ENZ9ew0++CBlvgQ
 HJx2D+vsRDp6riR8r009t7phNj5mcVBG9INjBRhcuCKo3/+TVvSGGMEMqgdA0tHBgt7G
 HquZl02nYU23yRcq2BY+S1OOokILD4WsS4bGFnastM7/5LfskRndPbZya3nu5tbqPRC/
 QY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MepNhYFr1+IOeR1yUlz4CllcCZZho0JnjR8wxuWPCCs=;
 b=TaO3i4ez6Sk+XdueZHjJbqMtJPTtJmdQ8o37wv4kvESEZ7efHZB9C+/hhUdqlZhjTq
 BdPklUllJjzdOPCBI7NIyuuZBqpg6FhhwOReEYDXYAPfplrpIWMzZoJ5oMIgtV1yGbuh
 S8i1iVjbcwQWnHskjBeD/ivFIcByIJo0Gtk6INNNUie5Ch0J6Bx5MGz/rtQL0nhkad/8
 5JcUvjPldOg0IN6UU2sjM1fgQ4B4AejZH/eZ2UIrXpPNmC843v1xrUxA406F8M4Auc5b
 RzzoaHcjIFQEB7iJ92QIlMJeCaYae1LA6/h3AcY1muqnuM8tWhIKkQrMSwgdxvP3nw6l
 zppg==
X-Gm-Message-State: AOAM530v3IE8oclVWANDkwLsFil8dmldXv8tTv2UjilRGWYsu1YB234B
 r1U2z636a4rn3rMphDkxfmib3g==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr2079283pll.191.1592454683494; 
 Wed, 17 Jun 2020 21:31:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o1sm974337pjf.17.2020.06.17.21.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 069/100] target/arm: Split out formats for 2 vectors + 1
 index
Date: Wed, 17 Jun 2020 21:26:13 -0700
Message-Id: <20200618042644.1685561-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gvLDSSTRwGTW

Currently only used by FMUL, but will shortly be used more.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5815ba9b1c..a121e55f07 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,7 @@
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
+&rrx_esz        rd rn rm index esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
@@ -245,6 +246,14 @@
 @rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
                     &rpri_scatter_store
 
+# Two registers and a scalar by index
+@rrx_h          ........ 0. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_22_19 esz=1
+@rrx_s          ........ 10 . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrx_esz esz=2
+@rrx_d          ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrx_esz esz=3
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -792,10 +801,9 @@ FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
 ### SVE FP Multiply Indexed Group
 
 # SVE floating-point multiply (indexed)
-FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
-                index=%index3_22_19 esz=1
-FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
-FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_h
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_s
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_d
 
 ### SVE FP Fast Reduction Group
 
-- 
2.25.1


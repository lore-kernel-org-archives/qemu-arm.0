Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2513743lfi;
        Thu, 26 Mar 2020 16:22:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtMxz9up2Y3O0XAIFvDlGFvbb8PUJTyGv41tPz+Yd3GAY2o9FEjINeSHumc3AeQOe5ODCp2
X-Received: by 2002:a37:391:: with SMTP id 139mr11412537qkd.6.1585264920821;
        Thu, 26 Mar 2020 16:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264920; cv=none;
        d=google.com; s=arc-20160816;
        b=kGNiKPyRUI4xdMmA3BOsvdK+5ZK4WC+ryNGbqAS8ropkauiFkMpF6Sbn/asiTJj94Z
         QpazJL92BRbJHTpGE8EJcx4jKF2CRWbcYqg3MHn1bWfqgf0ukVeh0sFXsqXD07ak6h03
         nfCysski3BoW+XR1Yh3gZXN78MkdSHlfeWVgG2Pox1YrA1WcHYa5rqnSGJ4nl9qJCrlS
         HyNwbyNpCmPGNsT5ukMo+PylZ/vwHViF92BFH2YCoZeGmCCmc/JdORnxcRQhKTm8zcte
         4arBAHHjrp1tgSvV+q2ylinnkRKPn5qd38IU+5L2jjxncYKWYUZbLQiEs9WS5oBijJKl
         N/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XWCeE/5E1HZf0ja/1RRJESpNCJLpd5hNPRFBKO5ZIL8=;
        b=sZ7GzGsePCfD5YX+gx6/KeJSb+2Bh7ebtU/KyTQjy/kLbg96kEJzXO2ne9KKua5rsz
         WHmr4+xIUOZ+Sh7g4LXxMVaqvgBIoNCTlOTMBM0XTqvGolzr4pR33DnhBi8kyIFdgDH0
         eictTFlz0RafmWOMnBvwBFKIukF7SS7Y1stwMFptDH8dowVitu3Qq90y33yZ21X104QN
         nvJs4XA9K2BgrUoS08d7mUdKPbA1N32sUkX2S1AfBSEFuIpPBaoWXYuncxtzJAi68g6J
         6DhQ2Z3Xn7UHjGTE26z/72xGxhkadFOLRyLCsFtwsM0mghVnkg5yMyr18kkuJhaRN7N0
         e/Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=icKxNZgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si2389095qvn.100.2020.03.26.16.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=icKxNZgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbp1-0005k3-7r
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbck-00037W-9r
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbci-0001zB-6z
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:18 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43409)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbch-0001xx-U4
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:16 -0400
Received: by mail-pf1-x444.google.com with SMTP id f206so3540072pfa.10
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWCeE/5E1HZf0ja/1RRJESpNCJLpd5hNPRFBKO5ZIL8=;
 b=icKxNZgINscLHQzuXJde8x0qqoeXNgrjWKtOxFEHuJVwQZzSoa8bQCLD44dWlVwp+9
 BMfNG++TtWZ71up4vdx5vki2E1b08GzPXuPscp4JWsnA4bQQeZZYeT9ymHWWnfDHmqyW
 Pe8u5LgMyX/xLK4fbYM/+4Pt+BwY7A7glNoM6xzEa3/L8ou1HWORqMdV1ho3zkjmuAXr
 TayBcIb6G9kr/TFuiWU+MddOdi/9BLdy5TYLsQLRPcihZmyc7QKM2b136J/QLSIgEzOh
 XRdZP3f940aoT4Y2HwsPI+Uju0+0XJP5Q2HpQl/9renCWjG0v1KFTEjVspZYORJ7gvRg
 qdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWCeE/5E1HZf0ja/1RRJESpNCJLpd5hNPRFBKO5ZIL8=;
 b=qZuf+Lu8WpxtOfZKbOugHHHa8Srguya3FQkaaaJBSEzQ0kUTyhFB+6p2hfKaFKn2/B
 Jbpl6nJBldJmIlnvI6Eyuc5ypsChgIeljk72j9TT6IMrGMIjmmqRaboszyn3ZAYNOFuF
 AMabEcqSRDMDkGgqwhubTr6o7i8bve8LYPJTUL2SZMd4zpA/Sii6A/3WT17P/U4qbfq3
 8sYHNa79RW24SmQFaYUejaqV8MEsJ44m76g26FWV9Oq8U5SaFN/VmK8X1zjL2OAYQ3CL
 zgKeUF1B28s838IKuF0tFBloFpYBpWGR1ZgIsqWmsV3tOgPmKr7zUdD1IKOdtbGzkine
 eQ5A==
X-Gm-Message-State: ANhLgQ20sjKec98m1nCjq3Y/Q3lSOQ/GFBUfC7+LDv4jrll764Qk/vW3
 8p55Ix1n2SjlGsKjCrpnP+ZmclPFHH8=
X-Received: by 2002:aa7:8108:: with SMTP id b8mr11659763pfi.212.1585264154959; 
 Thu, 26 Mar 2020 16:09:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/31] target/arm: Implement SVE2 bitwise shift and insert
Date: Thu, 26 Mar 2020 16:08:35 -0700
Message-Id: <20200326230838.31112-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UTuSx/mT+F1Z

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 756f939df1..9bf66e8ad4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1d1f55dfdd..7556cecfb3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6351,3 +6351,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, arm_gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, arm_gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, arm_gen_gvec_sli);
+}
-- 
2.20.1


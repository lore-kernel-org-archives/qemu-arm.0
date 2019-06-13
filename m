Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp932wrg;
        Thu, 13 Jun 2019 10:18:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+4/cy01DbpPrQJ6p9eiwfsXtHGMT0E8yk3MesURCaqDre37LfdcDCa9mzPA0ReqbvMyw0
X-Received: by 2002:ab0:7035:: with SMTP id u21mr13709748ual.26.1560446308415;
        Thu, 13 Jun 2019 10:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560446308; cv=none;
        d=google.com; s=arc-20160816;
        b=KbagI/yYmhr0F/Uj9zJzKCG5JTDQemapJKjYQaENGGDSVo4ZlNIa0hECorRtm1Ll8G
         4cf5C1IVVH0B9AHmUyzHzGTrY8S4iJfLl5Lmg/gciq/EZVo7C8EwXebJRwoU0mg93T9y
         Z9bg90PtxCRzSytzgmINa6iw3VDwjd8LlVPGtYSvlLG5huQC6LK+bSZMiia3hlJGWaIj
         9PADPPcoYnMLrVJsQ5G30qkT+d/38tbF3e4p36dSUJZJmqI+OJYG/Q98/XDZ0hQemItd
         XiAMHZmwgU8rpMPoBpRuk2a/SO0XHE6U+2z2p7Dzct6rtdz1YPoLEKVLL55ERZM//lv2
         f7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=vi4fuS6trrxryGpXVQHQgicRuxlNLJ/gRR72lTmjq/A=;
        b=Ey5CfBODiid3C5NnQMWxzcko+1HqNTNqdYAgXz7uhR0B5+2Vf1y4cYpAnS1Mk/oeei
         0t+DJ+rjbyHZHG9c0kNGJDz9E9nqcEUiqvuCmUcykjB2f3oDuhrnLjpAwsitg7RedAnu
         puSUODuNr9NivXBI3u6ItO5OJM7abhuUydR290s4/vF/7qznTRXLCVf1wFsCSSRGuGyv
         Qvs8WOu5xQd+BlF4mVE/zUG2epDBgzQVgz2fMp086joV/26vZQNQXlL4lQGvtqOt6E7R
         WvdyYloHz0Mf59UxDORiVYHg267QK4dfz+cdIzPhxS1RR9AEaMbRvr13/6hMoonlAfsd
         bVag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rScZ2W9Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si146764vsk.49.2019.06.13.10.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 10:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rScZ2W9Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbTMo-0005sU-WE
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 13:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlD-0003tn-6r
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSl8-0002nv-05
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:32 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSl3-00025P-Ii
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:28 -0400
Received: by mail-wr1-x442.google.com with SMTP id f9so21465240wre.12
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vi4fuS6trrxryGpXVQHQgicRuxlNLJ/gRR72lTmjq/A=;
 b=rScZ2W9YLKkFihqFm6aSR6MHhwsWKG3a37gRHHLVmhQHEveS32ARV/ikKswpYuKKlt
 A+CXDlcQgpn871h/qf2vl7uQXtUMgngRmdnLJnYE5jIPc1s7dAfFg+siI6SY5IV7JQvc
 Xn5SJnzsN+HoVI+FvfNQud7ByQqS9tgNod6xMHxzHHyYs+6q6DL3XEgJoNQPoGOq8ohT
 eFX5Ox7GDpJM8+Q7NQRXxc+SFf+8me5m65x8MhIpBFrEi998gj3Hdw3WzCZXnj6mQcks
 cyI4HImQze/Yh8tMh33t5IDuohomsO9DX/cbnyE3lDl3TAJThZu+lYow5GEfhWUMvdn1
 /Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vi4fuS6trrxryGpXVQHQgicRuxlNLJ/gRR72lTmjq/A=;
 b=oLE9koulxRFrrXIwtmwFacH5fE9H0phJjJ1zwxod0DJPNzpJJH7FK7FySKE8Dh5VoK
 dA8nwBWaLf3hNWlyHNFCPZOssFz6AkFmfNWAVeDVgQpL3BawA1tUEik/CfYlI7pxtFPJ
 ljT8BUpFfD7eCrwuaTcRPXGEkhjApcj+4Zc41sKcfVkzpF5/jK2dO5jvDFDUl2X6aSTH
 3HeOzvNdjpc3Ej5zd9ZFySo8muGJd8rMIcoP6SDJ73P6NbX+fV66TtEc9KVgsjFOY6/u
 wGW4HTl4ayXq69ECRQnQQb8I6jYOKQNp3NsD6OiCL/RIgWmIjWcoEvPkAdOX8nwslrM6
 asBg==
X-Gm-Message-State: APjAAAXLa54AL6xFfNIvUGaYhhhikap92EF2AsLDMX5wn2IPtn8d4me+
 xRX9bTYHGdzuzvbemEO2An9cH8CLxp6j9w==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr61452916wrw.306.1560443962570; 
 Thu, 13 Jun 2019 09:39:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:08 +0100
Message-Id: <20190613163917.28589-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 03/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VABS_F
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9m1ckvUCyACK

Where Neon instructions are floating point operations, we
mostly use the old VFP utility functions like gen_vfp_abs()
which work on the TCG globals cpu_F0s and cpu_F1s. The
Neon for-each-element loop conditionally loads the inputs
into either a plain old TCG temporary for most operations
or into cpu_F0s for float operations, and similarly stores
back either cpu_F0s or the temporary.

Switch NEON_2RM_VABS_F away from using cpu_F0s, and
update neon_2rm_is_float_op() accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c274c8b4602..a10fded1f39 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1374,14 +1374,6 @@ static TCGv_ptr get_fpstatus_ptr(int neon)
     return statusptr;
 }
 
-static inline void gen_vfp_abs(int dp)
-{
-    if (dp)
-        gen_helper_vfp_absd(cpu_F0d, cpu_F0d);
-    else
-        gen_helper_vfp_abss(cpu_F0s, cpu_F0s);
-}
-
 static inline void gen_vfp_neg(int dp)
 {
     if (dp)
@@ -4191,8 +4183,13 @@ static const uint8_t neon_3r_sizes[] = {
 
 static int neon_2rm_is_float_op(int op)
 {
-    /* Return true if this neon 2reg-misc op is float-to-float */
-    return (op == NEON_2RM_VABS_F || op == NEON_2RM_VNEG_F ||
+    /*
+     * Return true if this neon 2reg-misc op is float-to-float.
+     * This is not a property of the operation but of our code --
+     * what we are asking here is "does the code for this case in
+     * the Neon for-each-pass loop use cpu_F0s?".
+     */
+    return (op == NEON_2RM_VNEG_F ||
             (op >= NEON_2RM_VRINTN && op <= NEON_2RM_VRINTZ) ||
             op == NEON_2RM_VRINTM ||
             (op >= NEON_2RM_VRINTP && op <= NEON_2RM_VCVTMS) ||
@@ -6761,7 +6758,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                             break;
                         }
                         case NEON_2RM_VABS_F:
-                            gen_vfp_abs(0);
+                            gen_helper_vfp_abss(tmp, tmp);
                             break;
                         case NEON_2RM_VNEG_F:
                             gen_vfp_neg(0);
-- 
2.20.1


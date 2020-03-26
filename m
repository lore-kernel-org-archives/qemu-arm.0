Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2502090lfi;
        Thu, 26 Mar 2020 16:09:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsouPdu7T/G47GDif7RRoaHbmOi7wUBDSdnHjFlgnJ3db0Kgk0bKcfhZ47dvUAuPbR6pEWL
X-Received: by 2002:ac8:4416:: with SMTP id j22mr10909242qtn.85.1585264152855;
        Thu, 26 Mar 2020 16:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264152; cv=none;
        d=google.com; s=arc-20160816;
        b=tx+UymPFc532HobslpKRD2mmbeUSAksB8C+Z2V6NhT2g4fxDpMM23qpPkqUbqLgkHG
         4/JMI2dDKJdu4GF2OlRo5cvguceLYOetHawnoYb+93EJoFe2FVN+yJgsA775R5/MpjfE
         /4eLNYqnwZQkRp71npXAFyPGxTUg9DvTgfrG6i+JclYW8dnyHhYW5i4EdXSVGRJvGP9j
         /JSj8nBG+CGIkxN694LjE0sSjdTs4KSFxZg7OHyRtfcG+9IIXPa2U+AMvjyRE0pnl153
         VegrAUfY0752onwOMLkAuCp8lauiMQI39d3cwfzCPy6Jaw8hA90Ig/JKj3Ei9wzTyR+Q
         ifKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Sz8Q6/lROF919J+K+cTqN6AeyEkEwGuAjIPol0tSqWA=;
        b=RpPNycNT1wz+izQB5Y//362QhSLSm083Pcaw83jwafNG717kS8H7cjhtZ4Obr6ixL2
         /LXVDvY/41+W9QqtVQ9Wl9Z0Bydq8bB1HELWx/W1PmqtM7wSEWteFwpIO1XWL3LLaAk1
         ydY6V5IDwi+APPHQZsubuxw0lXw4KwFO73ZLhHVqx96S/hqC5Fn/QVyodnItw3DY7pS1
         I2QnVOSD+pa+WaFED9wsjrNUHUTr4E8dYjDL30fNRNiKg1MGTONIgcct01st/WfVXHfy
         iJQTN+FfZO5Vhm1eIU/LDE4zcpBcFQe4x6P+Oimnfwb2XXEV8TYBJBO7CTxE8Z2nVz/v
         ehmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bCT8eHrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g29si2846476qtm.90.2020.03.26.16.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bCT8eHrH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbce-0002Xq-4u
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58319)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcQ-0002Im-7K
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcO-0001Sn-W7
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:58 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcO-0001Rb-Pq
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:56 -0400
Received: by mail-pg1-x52f.google.com with SMTP id d37so3147172pgl.1
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sz8Q6/lROF919J+K+cTqN6AeyEkEwGuAjIPol0tSqWA=;
 b=bCT8eHrH03fihfc4mys2UWYgxhCZJ3Eapf7D7S00Lg9bWrQGq0DSmu744se0BHLjGh
 DwuCyP4cypLCDASWuWTY6OYPCIoJP1OLzkFkhNICLoiZyEoLV17lB9IIWLuilfQ8FFDE
 HVOdsAKdSfZrHcS5MnA6JlC/maqVdgt+OfI5+ajF4MwkVuONJgvrmm8uUa6wfnwxaza/
 YWdK9bCWF9lafluE/31aNF/sgdtqLlWBnUQ/1YZQWTbPdfm+A+sFngvccHk+p8nIkYhi
 m2BdmtW0TikIeH+bZkBbXm/V01DSVsfBIb3TonHZ2I0JUU56JrX01i/B8IKv7jBzbOKD
 FumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sz8Q6/lROF919J+K+cTqN6AeyEkEwGuAjIPol0tSqWA=;
 b=VYfE/DKBfNcBWboh6Hf9walGmaWLiftqK+m8/FVSYawNJSAbLPYE6fuUCNEaNzm5oI
 8BFyybipUf27hxb+wBLmnGwWeWTxFvcNyJzerxBkQRxnGaSk7Omky0PzPldGCQ+DGrSw
 Sk6sGixlKCi3ZEQb6C8E4LRXM8nzD5FtOyK+lv98utikyxxO40f6ooaNmmPJCjb2Gzde
 G8oVPQFP51AsZ0k+4biIM7Fp282F2dpU4rb9LYOz76SSg/sVaCa9cMO8bjXztAVAaBRo
 SAwK1+NwfQaX7Txw8FFzBuI6YzanXGsDZhdQH4ML0U0HteyfWLGNVxwBgejN8Iqqojii
 PUCA==
X-Gm-Message-State: ANhLgQ0OdU2e9DifhYrZW893OxA8xZX6U00iL4nQ1jQlcN/6Gd615TnU
 xBg60vmja3JJQbl/5HynraWVeQ==
X-Received: by 2002:a63:ff4e:: with SMTP id s14mr11080157pgk.269.1585264135783; 
 Thu, 26 Mar 2020 16:08:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/31] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Thu, 26 Mar 2020 16:08:19 -0700
Message-Id: <20200326230838.31112-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52f
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
X-TUID: cyy/UJ9CB8Hs

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 7 +++++++
 target/arm/translate-sve.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a239fd3479..8d5f31bcc4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -109,6 +109,7 @@
 
 # Three operand, vector element size
 @rd_rn_rm       ........ esz:2 . rm:5 ... ... rn:5 rd:5         &rrr_esz
+@rd_rm_rn       ........ esz:2 . rn:5 ... ... rm:5 rd:5         &rrr_esz
 @pd_pn_pm       ........ esz:2 .. rm:4 ....... rn:4 . rd:4      &rrr_esz
 @rdn_rm         ........ esz:2 ...... ...... rm:5 rd:5 \
                 &rrr_esz rn=%reg_movprfx
@@ -1180,3 +1181,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rm_rn # SSUBLTB
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ee8a6fd912..accb74537b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6051,3 +6051,6 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
-- 
2.20.1


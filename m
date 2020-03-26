Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2507169lfi;
        Thu, 26 Mar 2020 16:14:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuVsEkSC0lX9rpt5lVK2rM9KLcMMyWqFS1WHzL5EUDonN6nmGzroGhcIrQG1Mj1ONGClKW3
X-Received: by 2002:a37:bc43:: with SMTP id m64mr11107270qkf.287.1585264471893;
        Thu, 26 Mar 2020 16:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264471; cv=none;
        d=google.com; s=arc-20160816;
        b=NhCxNFZuZQ1ppjdW8E+OzBcXNpx2Kv5t8mU6hpQYMXzzodjP0/vKTxqQsJcAhThYHC
         JEhVcAh5mt0u0A07c4+1Jm43zurs7ow2krlsJq06B6aAUrobRqOSXy9jg6ZKyOW5t45A
         xGYyuhXDGp0kUPGUkJKDn04TJyxdQEDT+3e8Mc14sPYOs0YCFNGYr+Bqye2CDVLoSMf8
         Wsh1QkIyM/CfqUvhmRIiO+53ALaotKq//2iwpIbCqG/1HgrIYD7o4VfL4GiEQLQORwJn
         T0TCNeXT6KKSEG1vIX/VB7u0MlqS6vQ8X/ZPKsXwnp29Gr3x5sppHv8RRvE2o4QLhZoZ
         oppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cv1t9pmvTM2or2y2OW8+tePDhkWPmqSM7xnDl7FKLbM=;
        b=aSdeJaxra8h7KmRSvZY25gE3Of5b86XwrZPiaaLvjmaOz7ZeJULswsr85MJimDk7+c
         /1lfNcrhNSVoSG0lzRFHlrwqciBpZSHt4hNCRnQMYY7hlwu6R+K5v1O7mRR12J4bjfJd
         89+nKF6WLl5KIfsM8JJvSqrq3zAAq2y+YXWvYc8vfW+LXSIIfpvgN2tdvl9iJQgegtJk
         UFXktCN4rprz9l5/m0tJc2/OwkA7G1QPswAEa6t5YzOazDMyH9YaA2tRa/Y214/Jfqwp
         zBDZWYRodIp/7ep6Jx27JwKs16JqGQP8x6MR/IYiiy6367LISBZKSZp1PqykYgP7liX7
         MxXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uIqBnWL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si2275304qvf.210.2020.03.26.16.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uIqBnWL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbhn-0002VZ-9x
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcV-0002XY-Bp
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcU-0001bw-3j
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:03 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44772)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcT-0001aE-S6
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:02 -0400
Received: by mail-pg1-x542.google.com with SMTP id 142so3639753pgf.11
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cv1t9pmvTM2or2y2OW8+tePDhkWPmqSM7xnDl7FKLbM=;
 b=uIqBnWL8T4v191boSmUZwB494xE/PGFRifYhV43jeTNSJ3Cj5Mm43BNKjSeUAl55sw
 vZpHh6nj8aEaZFog2zlzPCeedO3UXD8V9+nLMzCuqI9iircm7N7FIdUre1kskonwCdgr
 KBHtgE1vg8AQRYnz74dth6UCBR9+I222bWevRB9nK1VYtmgZ4rIND3oCiHe1/TrhKiRj
 IGGoyLmmMUQPujB2Rf9iBo5fch/Cxcbj0DMTZuam8fRBKKxY0j1JMG/s5Fbf0dobOhFe
 8SVvRMM1qrpW8VkmErq1AKHlE96DpetQ8FrjlFbH2hHMWpY8JvoWgRElvU/Kt2HJGreR
 6S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cv1t9pmvTM2or2y2OW8+tePDhkWPmqSM7xnDl7FKLbM=;
 b=fffyFygb4A2De3H2bqRLeJZdXRyvym+hwX+FbIQ/7n2nsqKWBJWqvAjXq9wQrawtn7
 I3JWjV+EJuI0ONbnPr/++K5fambCJH8kWJeO/nUCsUUUXYx0uZhR/snPxUEUdxQY5Xou
 8lMGBaCStB6brUBUn3hTZYFQKy15HkFUB01CnWi+r7A8Lybl/U6VqIbagbBA26DsX+gJ
 b1TxBYGx3KRGdf8fQiXuL/pf6HIt+e2x9jFZHnitf9rbukrgAbT7vrU2QA3bVMVbk0AN
 rSiMqRNfTJ6F1Ht2er1KkFcjuJnFsO2c5lSDiDp4GnL0E0fTizJGIDl4NVWxoZZxL8Af
 YcIg==
X-Gm-Message-State: ANhLgQ2YhrHgo0Lm5O9cARWWCaMj0ZyUmc5VZ2+ia5Y7pcXW4FJw85EF
 +QDhA9jvVa5vnO7Hya8tJT5i/PtuKKM=
X-Received: by 2002:a63:e544:: with SMTP id z4mr10927219pgj.174.1585264140810; 
 Thu, 26 Mar 2020 16:09:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/31] target/arm: Tidy SVE tszimm shift formats
Date: Thu, 26 Mar 2020 16:08:23 -0700
Message-Id: <20200326230838.31112-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: iNKbF5bSRdbq

Rather than require the user to fill in the immediate (shl or shr),
create full formats that include the immediate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 04bf9e5ce8..440cff4597 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -151,13 +151,17 @@
 @rd_rn_i6       ........ ... rn:5 ..... imm:s6 rd:5             &rri
 
 # Two register operand, one immediate operand, with predicate,
-# element size encoded as TSZHL.  User must fill in imm.
-@rdn_pg_tszimm  ........ .. ... ... ... pg:3 ..... rd:5 \
-                &rpri_esz rn=%reg_movprfx esz=%tszimm_esz
+# element size encoded as TSZHL.
+@rdn_pg_tszimm_shl  ........ .. ... ... ... pg:3 ..... rd:5 \
+                    &rpri_esz rn=%reg_movprfx esz=%tszimm_esz imm=%tszimm_shl
+@rdn_pg_tszimm_shr  ........ .. ... ... ... pg:3 ..... rd:5 \
+                    &rpri_esz rn=%reg_movprfx esz=%tszimm_esz imm=%tszimm_shr
 
 # Similarly without predicate.
-@rd_rn_tszimm   ........ .. ... ... ...... rn:5 rd:5 \
-                &rri_esz esz=%tszimm16_esz
+@rd_rn_tszimm_shl   ........ .. ... ... ...... rn:5 rd:5 \
+                    &rri_esz esz=%tszimm16_esz imm=%tszimm16_shl
+@rd_rn_tszimm_shr   ........ .. ... ... ...... rn:5 rd:5 \
+                    &rri_esz esz=%tszimm16_esz imm=%tszimm16_shr
 
 # Two register operand, one immediate operand, with 4-bit predicate.
 # User must fill in imm.
@@ -290,14 +294,10 @@ UMINV           00000100 .. 001 011 001 ... ..... .....         @rd_pg_rn
 ### SVE Shift by Immediate - Predicated Group
 
 # SVE bitwise shift by immediate (predicated)
-ASR_zpzi        00000100 .. 000 000 100 ... .. ... ..... \
-                @rdn_pg_tszimm imm=%tszimm_shr
-LSR_zpzi        00000100 .. 000 001 100 ... .. ... ..... \
-                @rdn_pg_tszimm imm=%tszimm_shr
-LSL_zpzi        00000100 .. 000 011 100 ... .. ... ..... \
-                @rdn_pg_tszimm imm=%tszimm_shl
-ASRD            00000100 .. 000 100 100 ... .. ... ..... \
-                @rdn_pg_tszimm imm=%tszimm_shr
+ASR_zpzi        00000100 .. 000 000 100 ... .. ... .....  @rdn_pg_tszimm_shr
+LSR_zpzi        00000100 .. 000 001 100 ... .. ... .....  @rdn_pg_tszimm_shr
+LSL_zpzi        00000100 .. 000 011 100 ... .. ... .....  @rdn_pg_tszimm_shl
+ASRD            00000100 .. 000 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
 
 # SVE bitwise shift by vector (predicated)
 ASR_zpzz        00000100 .. 010 000 100 ... ..... .....   @rdn_pg_rm
@@ -401,12 +401,9 @@ RDVL            00000100 101 11111 01010 imm:s6 rd:5
 ### SVE Bitwise Shift - Unpredicated Group
 
 # SVE bitwise shift by immediate (unpredicated)
-ASR_zzi         00000100 .. 1 ..... 1001 00 ..... ..... \
-                @rd_rn_tszimm imm=%tszimm16_shr
-LSR_zzi         00000100 .. 1 ..... 1001 01 ..... ..... \
-                @rd_rn_tszimm imm=%tszimm16_shr
-LSL_zzi         00000100 .. 1 ..... 1001 11 ..... ..... \
-                @rd_rn_tszimm imm=%tszimm16_shl
+ASR_zzi         00000100 .. 1 ..... 1001 00 ..... .....  @rd_rn_tszimm_shr
+LSR_zzi         00000100 .. 1 ..... 1001 01 ..... .....  @rd_rn_tszimm_shr
+LSL_zzi         00000100 .. 1 ..... 1001 11 ..... .....  @rd_rn_tszimm_shl
 
 # SVE bitwise shift by wide elements (unpredicated)
 # Note esz != 3
-- 
2.20.1


Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1266169lfm;
        Wed, 17 Jun 2020 21:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfqjEzWrt30L+8A6XV6Fadx2bISj6urih/jj6BQgyxq6fnGWCWr3OWmRFbbGoH+su/MmKb
X-Received: by 2002:a25:e087:: with SMTP id x129mr3438949ybg.73.1592455128786;
        Wed, 17 Jun 2020 21:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455128; cv=none;
        d=google.com; s=arc-20160816;
        b=smGaeCAKzGI5Mp8XOYQMEuU0TcVjM2Tg7T0l6bPS1o8B4GzJpd3P5x8Kru37lRZR1W
         LZXssHk+8L9rTndD5vStGkNQQgJBl8uR1YnqrnlqC1gULPMFjoAT1H/OVc7huvoJyBRx
         1A2QFPR5nq3PiYi64s5K/AZR184w5+KvS45MgVkq0Vpc3yHYt+AtRI/E3Taf+vHcfRg6
         6LYr6jR87i2G3NkGPUj5akBIBKYkYr2ruTH74A4dzoUJ+SHHI8QYmnXfY5HaHuoW8dCY
         SPoHGVyK41FXPIQWffUN9ghf09DYdX9BG/jRTrj2cqEZKVS6KcIkPcozwz+XN6ThPk4t
         yKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0RZoidkINKk+4kSs+3+p0XQ23yggd+OITaADAOtdoSQ=;
        b=qkhgYN2nkjKJJvkUN5qjDFyE+YUUFfk4LBacGnISUZ7KpTTaO0BjfJ5uTbB4EwfN6m
         fOBE2Sh2MG5/bYBvpiNEzvsdjn40VvtAHOmil6GEgskYSnat8LeIBPkbo6rQQ7Ahi+kK
         lLsd5MuVzodE4sAKq2zqiWRsySCeqn45eR2D1NvcRJZ0AE4WX1Ruct9I24wXTqV79tbY
         crvq2Tk40cOjpc5JoZIN+QliDX6w+XsrKD/J6cgl6252GUvWItZme9GHJFmcT+GIcbuM
         5zmbXvhmoybt8CMwle8Q/G2x7r+uIKnOV20RaKl1ejQ7+rPdx/z/tJ5xqvnJGgZCTmLJ
         PRYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdpzleGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i81si1690599yba.193.2020.06.17.21.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdpzleGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmK8-0007uT-3F
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAA-0004qM-KJ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:30 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmA7-0002Yz-Pu
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:30 -0400
Received: by mail-pf1-x442.google.com with SMTP id a127so2177522pfa.12
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RZoidkINKk+4kSs+3+p0XQ23yggd+OITaADAOtdoSQ=;
 b=WdpzleGlCy8bwgXaTGEstzgWarF1p0trcqnl5Ic7uXErpKv3IqDiKeD1MeZWx0lxFR
 HViZj0fL9V2F32F4FwTh9ccZ6aWTaDzdwkla6zsgq+xK6MFjGQzEzN7QMduy5afWr34b
 OHlPL9NRuGxlw0BR0ZpuswS7oM/Og2VGclH/Mpi3tdY+EUfvi06OglPOsOxIexMZOKkB
 HZ2dwZNZW3GaM/y2+rRyYFwjXptnuZUX0iHehJGxk9C7muT/KpOr4hpIZFNtHEVaGBl2
 ePKCO1+bwz067626lHm9aXxCT7BBAPMD44hEyWqrYj2m3+hMFM4+jIDqdAFguZZVjwrx
 fhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RZoidkINKk+4kSs+3+p0XQ23yggd+OITaADAOtdoSQ=;
 b=QiAq4oqyGy8vNwySDNENtk87QLGJdiyt+UZHPtMcu7HRr5DaX77ig2Lxn7Y23QoDSg
 WlDUa2RjXc+IdnkYDfHkTqYLy6jSGafZC3Ddo+2HUcmPIOblWcVtxl3D1K0h7ND1+bWy
 nFQe8Ua96xNoYBH8h50a/U1pH2Tb53Clt4SRbEftdACqu/2C9W0Uopg6Q5N6Es/sPkxL
 iBu03odNdo3aFXadNW+4YLN6g+kK7+75ulwfPj8fCQvWAiuUQ/w1iO0IP9CN4C4JrIar
 XSMhrvDUKgd0GsOxTI9ae8AgBDVZBxfNNjXqnA59Y72hPWb+halV0NQMFlxiPPlwirJc
 f/1Q==
X-Gm-Message-State: AOAM532pRKYhSfvw5XiF6oy1cB8pDcpDjAQn9n8WXuNqd5f8Nn+fAih7
 7Jf6yKOkBoFM05zOfDSUTKOnZA==
X-Received: by 2002:a62:1b82:: with SMTP id b124mr1914290pfb.172.1592454506533; 
 Wed, 17 Jun 2020 21:28:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l134sm1154412pga.50.2020.06.17.21.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:28:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 029/100] target/arm: Tidy SVE tszimm shift formats
Date: Wed, 17 Jun 2020 21:25:33 -0700
Message-Id: <20200618042644.1685561-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
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
X-TUID: gMSoD/4ZPNIM

Rather than require the user to fill in the immediate (shl or shr),
create full formats that include the immediate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 079ba0ec62..417b11fdd5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -150,13 +150,17 @@
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
@@ -289,14 +293,10 @@ UMINV           00000100 .. 001 011 001 ... ..... .....         @rd_pg_rn
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
@@ -400,12 +400,9 @@ RDVL            00000100 101 11111 01010 imm:s6 rd:5
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
2.25.1


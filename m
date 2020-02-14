Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2309030lfp;
        Fri, 14 Feb 2020 11:47:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyuPHutzr3O5rIRPh3s4cX1L9kH8tgqD4yVChTLGfcUXNIq3bMn4DmFy3QIzAqiF5EfLTrG
X-Received: by 2002:a0c:f513:: with SMTP id j19mr3630700qvm.206.1581709630915;
        Fri, 14 Feb 2020 11:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581709630; cv=none;
        d=google.com; s=arc-20160816;
        b=Eu6QyT1K4yLKJK61WEHw+/VeTmJTSuyQAFRMhgQFNFFiP65dr8FICJfg5yzMlfqCpo
         CLtixZujzLBWQinE6IufAqUD1yB0CNPCZoA3QmIzFTkR5oAvnkYLXseDXOWAchFVHvuE
         ezrkltO8rOYAzhfkaZPhzD9vEMkeRzNOTSp9wMnujIu69eL7/bSaoXJ4dOSIJGw9OMXL
         gjjS9GT3qJI/mDy00Z1uDYWe5qLjgosxcwG4j9DfRT60X9+H9REDKIunxZZ+1xYM/urP
         0ohXHoN+i5RRmytP8JaEEvmBPtfTVqY2TDKdsUEWbq8+EZAkIEWlgX0Q7W75L7eMI3+D
         +7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yTA4qfOsQYBcYoiqQ1YZpvzyazgjvt/ZI8cUNM+8GpQ=;
        b=i3ZuZQCK87DDw95SM8Ye945tl/kgMMv6hdBBt/o3e9hTCmE81yTdzpqGbm2eMv+MTA
         kSXbvVNkFpSQrdekrkq4mgDy/ARUdApG6GgjS4WyB6FnpY6BichghOflrIrEBWZP+x2y
         AibU/Y2tNxhPjwpP70XMPrUsVoXXuVxibzSzKRTXQoxPCOD7iDhhaf4hcuCyG5rnZToG
         9zu4XeXd9T1+YZVwaviwu+j1g9plw+CPwP4j+nvLVlM5p32B1a73gHGrOcCSdfskyhmg
         ACRntUMt2FbYJTzp0Sjdp4eo+mxoIqKLeO5GE8rcJxhKXuGi8LPNqOkeSeEk9+MkZYH6
         j4UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBsr7nSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si3149989qtv.238.2020.02.14.11.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBsr7nSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2gve-00038O-9u
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 14:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvJ-00031z-Vl
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvJ-0003Zw-2g
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:49 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45419)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2gvI-0003YH-TI
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:49 -0500
Received: by mail-pg1-x541.google.com with SMTP id b9so5314454pgk.12
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 11:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTA4qfOsQYBcYoiqQ1YZpvzyazgjvt/ZI8cUNM+8GpQ=;
 b=SBsr7nSM2LLr4N2M5dlysnfC3xvq1pOz79clPN2umUyjEMNXBO2ufDQY6Yx7lhZoBs
 ZWN1wV7M+A6WWanRrWCkLctVs9MSPE5B75K5370jV5DTzTlHA9GvT7GzLwgg4nI3b4ze
 njnd9IIIJIUgBmSfxGexSbW8myH/YkLTvruzAUcIlnAyPKF+PXildLle84oaDbBZInTX
 MIBN637q9AXpCwQEun6o5rStncWVxlOPfagAhDhaKC6C1+r1Fdd38zFEJ/JrKAcWb2z5
 4j3r60vZgj4KEq8SWHRZCtg1c0e6cZp8C5GICuIq81TKoy5hv4M7X23BBzQgiPo0xKPe
 Fw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTA4qfOsQYBcYoiqQ1YZpvzyazgjvt/ZI8cUNM+8GpQ=;
 b=kXZ1ywqrg74pgZx9xHIuE/AW+mTOX3GSRGTxxANUEYAr5H/32JP+Rl/xwnDINm3ioA
 q4fAkrpvomC5u5sZt1UEekoBrknI7TkjSEoAKCPmvzm00xGRtMbhZ5Li39vxPA2LYwHh
 xn9zvUagdz1y5QoHDmTC6LF71zvrAnxytgE2AAIDMoXYESk5cOGvMSgVnTvrXMI57Pra
 1FkGrMUBdfHs05R0Fkm1BDiRADk/S9ORpqBeeKsoIjdFXXPaq1JTjuyMVjGDESLAnTs/
 gi3NlXlGHe1yW23pWA9xvHXpQgPGMNQm9dlPgqKfFAT6fYFzh+MmahWQmTy+lDvJHDKY
 6lIA==
X-Gm-Message-State: APjAAAWrC2ZUnPqYoDZrxTSAwuRG3ooSHu5ImWgAom7AyBA8LL/EayL8
 5/CBYl0YhyOHomRyDb19jqUc/g==
X-Received: by 2002:a63:2842:: with SMTP id o63mr5291335pgo.317.1581709607947; 
 Fri, 14 Feb 2020 11:46:47 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id g13sm7558851pfo.169.2020.02.14.11.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 11:46:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Flush high bits of sve register after AdvSIMD
 TBL/TBX
Date: Fri, 14 Feb 2020 11:46:41 -0800
Message-Id: <20200214194643.23317-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214194643.23317-1-richard.henderson@linaro.org>
References: <20200214194643.23317-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NgV+v9h3sj/R

Writes to AdvSIMD registers flush the bits above 128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 620a429067..096a854aed 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6964,6 +6964,7 @@ static void disas_simd_tb(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resl);
     write_vec_element(s, tcg_resh, rd, 1, MO_64);
     tcg_temp_free_i64(tcg_resh);
+    clear_vec_high(s, true, rd);
 }
 
 /* ZIP/UZP/TRN
-- 
2.20.1


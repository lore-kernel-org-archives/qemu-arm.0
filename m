Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2311706lfp;
        Fri, 14 Feb 2020 11:50:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxy2pQq4TJNSMq1b5XO9bOkkJCO6nvjxB0Jl0F+8JwelpPv68ZwmHCTY0PQHyl2xNFhkZf5
X-Received: by 2002:a37:2f07:: with SMTP id v7mr3909055qkh.261.1581709833015;
        Fri, 14 Feb 2020 11:50:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581709833; cv=none;
        d=google.com; s=arc-20160816;
        b=0bypMm/N3C2Q2v/8RNmObiSYA3ZwPCY1mwIP2OzyHhl5IYrWyqnqQuyFJf7ZpZ3egl
         sGCQ0/TFLVh1Y8K1Y4wAz8hRU4qPezQefo66rVruQ6VEbhSDP/xlwFpUwJ7SCesN7shB
         /wnJecDjBVCDCP+GytpFUsRzuxgpuxddI9axbbakIGzyJLYH5vasLCDjn+YygHvYnctV
         yLeRLgpcMlOcXGPRAAq8BBIPt0XqbXYZz4VWo4/rO42xchDAB8z7nenTLfUwHfBt0dTT
         eCuvwhPMWw/NtHIpjAF4ACJ1ZpJ3AxWoIt5XqyLbdi9egEHjzx76UqwQAFUnNEvySm4i
         ucFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HlkIYk7mnAAf7AbZuXJxcfBvUpBjMWEzz4Glx4QDkeU=;
        b=xwPWPzOEymIZ5CU0PIx9hu8dUcMpCrZrQMQQkhhL4K279yVZapy/Or6R5Uv0Hg5+4v
         oyVwDwn4tNMoKtCmnNPVJlM8Q020+Api/zd36ZT2Bb2JONUZ02w2wssg8feKLuHAE1mV
         xsLLBcGUPRUS1wgc4lyGE0AVCBcrO3DGoJWi9js3HqErU4nqiKHDdIRIx3gUgyVgdks5
         890zAnqbD8JW8aRihvF0Wkf8UfMFIYDEsoLCeXvAimHwE7aUQ5coEj0Fh9iB6HRS/ig0
         IQCHsdTwDJrTdL3QvAeuRyGLlKNQfJM39Eh2NHCSS6Hl0GV6znPI/qZHjsPgi9vidnha
         UuPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZJpr2yNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si3167767qkk.363.2020.02.14.11.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:50:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZJpr2yNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2gyu-0007wn-Fw
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 14:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvL-00033m-7H
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvK-0003ct-77
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:51 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:32953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2gvK-0003b1-1J
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:50 -0500
Received: by mail-pf1-x442.google.com with SMTP id n7so5370731pfn.0
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HlkIYk7mnAAf7AbZuXJxcfBvUpBjMWEzz4Glx4QDkeU=;
 b=ZJpr2yNc4bFP0OQSn9wxp9sciMybWSOPY3ZBxGD/wZw9U32RjStcE0eH70GeKj/CQD
 15gorhT6j8dFvMw12/T/LDxNV7BNbrX01ZbFo6xulNyW6iWvP6QHA6arflTMpR3Cwzpc
 M5CED+VyzP4Yg7ubx+0QOg6skJqFSIOF1QmCzvvHx6rizFma9a1LXjF26dNEcPnIh8he
 KfsOh4lgNrWXE/1vQkwaY9Pys1atlmwxZNPIqr37pZmGZP3y1UaDudf9YMP5ELPYYUvm
 eacJT8axDZAzba6m+V/WStVmtiNGs+/+mghDQXefLaLweK0Ck7mDXACxMXSanfCVhgRO
 Qazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HlkIYk7mnAAf7AbZuXJxcfBvUpBjMWEzz4Glx4QDkeU=;
 b=Eat0sVDgbO2Hs57dXA8tyRF+CAdw0C/z4QOXp1KucS1n7a82yN7BCRflIgyEhLlZW9
 +ToQnzOX9V8lF6satqsL5jYRPmyLIN6PQquF0ByPsP7+qm4l39AxF9pNn/cZqcI2XZZU
 7jTQeEwvP6eDSIHTS5Vb0rr3dQCbDrX8wgVPylTi+O3PpUMfqLO0NRCWkC2CTxziVib8
 0HN0zsGeb43dNZjX2/EFRTNfRsv4l+MBKTnBWhSpG89ckZJrp3PM3pAZRbB5g0FJQL+O
 3eUSOT6h3qXvlPIi5+4jIaykbZq+FwmXjRZ66li1/frXaAjprgYABeAbfOqRLMy20HGv
 L1hA==
X-Gm-Message-State: APjAAAWZdrDBJStPpZ6+z7B6Jl5MiJ1T2gF6H3d01LhSCxGrw+ImtXKm
 SpjMvU/HFvr5Li5ZpLm4gVLfEg==
X-Received: by 2002:a63:d18:: with SMTP id c24mr5238576pgl.218.1581709609094; 
 Fri, 14 Feb 2020 11:46:49 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id g13sm7558851pfo.169.2020.02.14.11.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 11:46:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Flush high bits of sve register after AdvSIMD
 ZIP/UZP/TRN
Date: Fri, 14 Feb 2020 11:46:42 -0800
Message-Id: <20200214194643.23317-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214194643.23317-1-richard.henderson@linaro.org>
References: <20200214194643.23317-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: SxyGBpyKO5tt

Writes to AdvSIMD registers flush the bits above 128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 096a854aed..b83d09dbcd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7054,6 +7054,7 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resl);
     write_vec_element(s, tcg_resh, rd, 1, MO_64);
     tcg_temp_free_i64(tcg_resh);
+    clear_vec_high(s, true, rd);
 }
 
 /*
-- 
2.20.1


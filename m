Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2309364lfp;
        Fri, 14 Feb 2020 11:47:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwZs5is5UWnDjBrRxVWylSPoQ5+t09lnhjfr6GO3lOHVwiQjQSDPAFQVuEIq2CrEPEkooI
X-Received: by 2002:a37:4a51:: with SMTP id x78mr3908937qka.445.1581709654901;
        Fri, 14 Feb 2020 11:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581709654; cv=none;
        d=google.com; s=arc-20160816;
        b=Wwx9MBAroEG7yLNxL+NiwA1K79vemtQFFq61n4AYRJAcJo8F3+adgyg07vIXbJIgXi
         iNsFZ4fATeURMBMMzbLwxl3sqLQV4T4abYZUvFJ7ANPtOmoEHFaxPcO28UfFIdhoxdIJ
         6Hup9uVj1ZXEsfD0SvjKkKsuo7g0OFfgcyjYuaEXTGi4NjmV6mXMYpYQmGOmZ+suw53P
         d3v32ESyIRk8e/k28MirSmXrsdHLmCjfXouufzb1OEXYTtYd6w66zj1wyv1S5Laubae0
         fQJHx17YhSNeeB7RWGUXtaf64rod0kwDHZeC5P5DdPIyEWFK7sGsLUdNDVMwWM0E/TaF
         8Hdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q4tpwQmU/GY5DYP8gwmfjDF7+GhkCh2mU6sZu+wMVTo=;
        b=xbDyu32Uf1t8Aj7ohG8F6hxr3rkbbI5uV1tKPKNLa3HfA5HkxpZ4cepTJ+Ir0G6Cne
         y7Ayp/lg+e/XDK4LiMPE4uqtZanQ86gnvOx/LVRKdYZy8OkrwYS9eMDrJEa4TmgEiysO
         Jv4aZFFYSFK8+GrTfsVnMpHDLmwjeRmtXB+E1MgcKs4prQIVTH9njlB4zW0OEfYlgFyu
         9lVk5hF5gB7BaLYpdVkSq4K5YBwVTCdMl89SC9bUmxy7HfwNGgxDPYcL+cdW/eTiuEvm
         4xrOi73HpJSeyccG8kgtQrhaeSatvmoFZo2QEPdEhUpaSyFqU8Dy/QmvCL5MdlIjgRSu
         6jfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aIL/6iZq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si3446542qkh.84.2020.02.14.11.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:47:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aIL/6iZq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2gw2-0003PT-5K
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 14:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvJ-00031b-7g
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2gvI-0003Xi-3O
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:49 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:32814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2gvH-0003W6-Tw
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 14:46:48 -0500
Received: by mail-pj1-x1041.google.com with SMTP id m7so998832pjs.0
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4tpwQmU/GY5DYP8gwmfjDF7+GhkCh2mU6sZu+wMVTo=;
 b=aIL/6iZqb8svQMq2gMc6FZYFZXQS5/dpAxvOvYgf4atmsGl/3Ij2Fwtk7/9qztMwdl
 t+Kg8k9fb2VgmrZ1JZ6/ggspKB5SNTcKjnofgfYwFdlQsKb+uPNogRIreD2uP7qoH0MO
 0r6wtm7x4oRP3yH864VPZMpa85TQ5rUaC2lNB4O3UwK8474h/qO7DANCZ/nvmI3XI91v
 gbrDyP17AEubmX13RYFyUk5JQzfYiDZfCMqf5zTAQ7HPOxa10rmWW6P1GYltyrSeMJch
 D55fzwsXz+BKe2+78fdX2bwPBSxqFKC4aOdFRAQCxeDt/32yAEYgaLrJMS5Rkfo1oQLk
 BXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4tpwQmU/GY5DYP8gwmfjDF7+GhkCh2mU6sZu+wMVTo=;
 b=WhPOf7HFO453LWRJz/sVoSvKR7Wd2nIrYTCALeKop2d0zt3a2sabiw4BJ/4+dZARul
 Se7AWQJIfzZA8QWnpmrsNFp5KCzHg0+z9VmBm3gIMwQrl4z9tlwUzR5AqhLl/daseRcX
 tN2dnsCTM3SSg0hMwTraPsjqhIw6/kQdsionEF1WtOmlXTXeN5nBZ34e8b/hJbPigIpg
 ccZH8EjVPfBa4kfhu0HekRmkPhCCa3qrEoEdl7QlAm/MPER2n9jf7rFhGPAbbV2W9vIE
 OR3lGLGxS74i1XUrHcmAIDXSuMkxsUW00nCHSfjcz9Kd599IF2EhR0IPOOaL+weLTGQP
 nUHA==
X-Gm-Message-State: APjAAAX29+AX0EoCeZk5VpSl/A2g6ebLy2c7egBtch7BrXKo6EZtxT1v
 h9BmyvYyuXhQF3Ie+rfVb0xMJA==
X-Received: by 2002:a17:90a:a406:: with SMTP id
 y6mr5734073pjp.115.1581709606869; 
 Fri, 14 Feb 2020 11:46:46 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id g13sm7558851pfo.169.2020.02.14.11.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 11:46:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Flush high bits of sve register after AdvSIMD
 EXT
Date: Fri, 14 Feb 2020 11:46:40 -0800
Message-Id: <20200214194643.23317-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214194643.23317-1-richard.henderson@linaro.org>
References: <20200214194643.23317-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-TUID: Y9FjLQ8BOwVb

Writes to AdvSIMD registers flush the bits above 128.

Buglink: https://bugs.launchpad.net/bugs/1863247
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7c26c3bfeb..620a429067 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6895,6 +6895,7 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resl);
     write_vec_element(s, tcg_resh, rd, 1, MO_64);
     tcg_temp_free_i64(tcg_resh);
+    clear_vec_high(s, true, rd);
 }
 
 /* TBL/TBX
-- 
2.20.1


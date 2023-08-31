Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5080483ejc;
        Thu, 31 Aug 2023 06:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWRMnPlyZf+pddsuUlHd4JlpsHiYmJok/8sJP6zkbo2J2ZzDvu8UluXCunIVMzjVx3dWX8
X-Received: by 2002:ac8:7c53:0:b0:405:45e1:de14 with SMTP id o19-20020ac87c53000000b0040545e1de14mr3002723qtv.27.1693487293398;
        Thu, 31 Aug 2023 06:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487293; cv=none;
        d=google.com; s=arc-20160816;
        b=KlEUJRko9uveCRrljlAsiUQhBThjwb4mHlpdcpTv9JLzd5Ztkq4ZHRhR6T/Vl5RzWV
         48nFiPyfVPFebu11Y1qGBP1jkOfRZQwUnpZ5wdyf/y6ug7ZzZ8dFtd/FI+V9lLDquEt7
         eD4OZs12kO6WGRk6kIuFp73I8V6EBFbQs4rghEa9/ktn7Jshp5XZuffFXHl6DYamTedi
         WMO+2gHCA+n9g0atm7hvIe5+y7IzqEQv2aY8fXpr/9mMDYUIEBZaqxm2i53/yt+cBiIF
         /7WAGMPMpLrPfWUFxxUjEwMCpBWxGYXUOCk4rA9Gn5PGPzO3y9h6jR2OUKqvwzsv701b
         dHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ckF3KMkPZoMJE539B3wi9BjBQFsmfr+Lf+8EhQQKEuk=;
        fh=oqkxg9j63M6YqZWP4SziXgurivxQ6XH1yX5knoDTdbU=;
        b=Qbb8xd6VJzVqBBy05GJkqBj2GXNHrnphuvgVc6PVNx/8lSTcr0EDDicePEfnnMMoKf
         pFvxFaT+dz5vvqxRm77EqOH81X4yMOVmSnbeZXIkLgf3x3mJ5Z7teH1xfVynKmkSs4FT
         C/GKNr8GLYxHSqqRH7+waeLfdA5YKeec4fbWligVfdk+aTGgtO/HB9sGXgBSaw8TILyO
         1JfvkUO36Jx3QgJmfNCUW1d+TWGs45Oa74Sakb/OC9Read1xDfzk85+05rbYrFg9H4++
         4gYkAiWn34C23DR6pTztxbNTWIRm++6fJbktZyumSnpTr/jQEJw9Gjxu1vwEqihg2Z5J
         Ddnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3BDIGHi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05622a045100b004122ed9aa29si812805qtx.730.2023.08.31.06.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3BDIGHi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhI4-0008Pt-CD; Thu, 31 Aug 2023 09:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFM-00037v-IL
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFJ-0005SW-6C
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401ceda85cdso7524185e9.1
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486679; x=1694091479; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ckF3KMkPZoMJE539B3wi9BjBQFsmfr+Lf+8EhQQKEuk=;
 b=w3BDIGHi0jtA1JGF+WnjEKOUXj3SSbAAMMuWB5/xoS9Yt1LNAHb/z/0YL7+iDsuPeO
 uh9Ve8fGlesKcq/SRxH8JdmnvbLu399WZXFa3nq8tfw5PLkz6Z82Pi+6dmjAcJqW58l6
 u/HpHOnsDXR4fN+NFLkAYSzAaZ4yj1PSxAsSPLXULSxVZ0mwpWAlHlYqJrlkQYl8raBd
 tFxLzvBvd9x5xNbEJRWw+Git5t/DdHMQ73vuSv6XQjZPQGG3MyMq2Ib00xedCaECYBO6
 44rQv1bCSlcYoCvX0db8AygZy3MfJZZ2/A8sb3L42SN+9vnX5u9PZnz/hyDc4PvHaShf
 rBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486679; x=1694091479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ckF3KMkPZoMJE539B3wi9BjBQFsmfr+Lf+8EhQQKEuk=;
 b=kT9yh4zZqAM9+oHKIcUW8/LH4Wc4mMVc7F8v0Eul9/JpnD1GK0cH52LZkpoiR6x/J6
 kEhcUbYSRou+ef04TpT9i9SNFsMbuFWZHihf6Wkc/PBUz0zQ5xTIGdd0IGJstqslaVvz
 h8IHcImC1JfSu3dDK9Pi2c3kBuW/rbPXXah60aX0yyMsbOanXeaV5UxOAyo4ZSPDeec3
 Rgv/JaYhWhjfBmjYn2/YjwhgQ4fS6FhMGG358uVYyKO9/sb8M+qZfdwbRmqPAOMlDR+9
 fD7yRtPJE8IV64KOzadlmQCdDQTEm13Y4P4erUbRNbd7Ei2KnsHGCYsU5qzt9QQVIR7e
 4Tew==
X-Gm-Message-State: AOJu0YxN1ADPQfBPhBCjjGLkFfAJ0YJjnEGRDJayb8lDWXifMzhiacdK
 Rp4xbM50j3sA72IDvE4jFxdBEYxINOBzoGcFPVI=
X-Received: by 2002:a05:600c:11c1:b0:3fe:90f:8496 with SMTP id
 b1-20020a05600c11c100b003fe090f8496mr3959276wmi.1.1693486679232; 
 Thu, 31 Aug 2023 05:57:59 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003fe1fe56202sm1908227wmi.33.2023.08.31.05.57.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 12/41] target/translate: Restrict 'exec/cpu_ldst.h' to user
 emulation
Date: Thu, 31 Aug 2023 14:56:14 +0200
Message-ID: <20230831125646.67855-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6FXR52bN+q6W

Only handle_sigsegv_accerr_write(), declared with user
emulation, requires "exec/cpu_ldst.h" (for the abi_ptr
typedef).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-6-philmd@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d02517e95f..b2f5cd4c2a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,7 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#ifdef CONFIG_TCG
+#if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
-- 
2.41.0


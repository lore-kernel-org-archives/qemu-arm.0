Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1042842wrq;
        Wed, 23 Oct 2019 08:30:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4pqbhhdmrBx6ahS/0NdjToeoWLxdJ7e9KhKOR1L2Tk1PWh4q2WsBIyQHr9ZbMX0HBLzrO
X-Received: by 2002:aa7:d8c6:: with SMTP id k6mr38199497eds.87.1571844636218;
        Wed, 23 Oct 2019 08:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844636; cv=none;
        d=google.com; s=arc-20160816;
        b=uVzsHasDmBdYDcjWHWbydTEW4XmndxnkY5ik6YzLvM8OPFo5XHTBcXX1F6Bj0poAHJ
         FaQDbEHQBrdwYKehPDRYcW8ORoQD506sFwEkNT3uVZwHT0Hh6iY95mik54vOEfu4s5BV
         I2WHbNCAfmg0hHhuHJvjKtX46m7kfnHDc9OFfUIHFsd5npMchaMyJudu8l86wyyC4uG2
         Upb4f7068GLhxCgYzGzI/Toi2Z6rEhrqGbXKge3+D0Id5R60yIMmA945jsmQQW/+bH0T
         JkS6tcK1XeKYi8BooWFvSr39+Lz16z3y5b897zAqkaMn4sL6/vMmN50Py0SdM4oelyiQ
         0T0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
        b=qR/VYZbLIBG55AOYFDb7Ieqnpo0XVY4BxyhBCgPRp44iF9pXtIqQreeZzw+afc2YqY
         78O8WOc+V3hM4q+7zGGrZIOjd6ZTOFG9rONaErlJlRv5guR12brMxSuHYgBSCAogtBis
         3vmSWoqDGo/nx9gMxcY3UMlI6eUQrkd4UjJle5qcGe8y6UopJJ/z1HCA562LIVZZkATh
         xvyq03PcoDfJxEZzjKzgYCTaP8yuwYvDqzxHohd8/WSKxRTSwUZCB4v0CsxUY0jmHtBx
         aDfFU1h8hiWkiZSBnam6fLEbsDv4jyH4qo5VxQ0rKfNA1ZfSUBIlrqdQCZBbVxPX5NTL
         CIcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m2C8Roib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si6706147eja.227.2019.10.23.08.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m2C8Roib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIao-0006Xq-NT
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8u-0008A7-Oy
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8r-0001GY-NJ
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:44 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:46550)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-00017c-GO
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:41 -0400
Received: by mail-qt1-x841.google.com with SMTP id u22so32678675qtq.13
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
 b=m2C8RoibueHknxvHHmygii7frJMQFcjjKTc7biRX04nhvioilXfsWLektiwgg02/gs
 2dGtRi03vI5AFS0Yw60XH+QL1UikrZ4ujJxcEaCVHmyIFdgt2hLcU20zgRF49kCkqsp5
 Kz4g8aL7OD7ihrlK8KUB/tGvfDnAo9vC1DdvCoAp5bGrmLmbNHncrjDIzgrYrwMLLVKv
 Mb29/Kd/ftwtdKCJoRhpjg4/og4NAy2LNJx3+y5LmFu5vAQtDKNyJXlD5c/MXZRp5zwo
 jx5jAU1kiEBJlK6IdWzMUprT9Ymmx2+IEMIkvPULrmMU/REsY7B/llk+po+YWh8Dd96W
 kE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
 b=cX4N/iecPhmXIp93EsoAnwPpKf3HjIy0pIGMLeF1iUAhHXZuhAYzZIFiJYs1n7+ZKE
 hcde4c33ysETsr8jHIUbsf5PVLG5sF1lNTXdr/zGubKP5MYl8Jj35uLLkXEzc28Q5cP9
 va6SX/7vB71qRUa3tIj1Is0jX1MFu08hdJ9cPw+LbFlE9Dqd9qqHWZf/8pADFDcx7cDj
 erZYBy5PGpZOxXf04LL9ggW2UFPI0s6E9vnTmWFrwvuaXvr6jmKc9gQzeaztvmmOtvyI
 JOtdM8J2w8l9ZcoLRS6yRY2cOrHJdk4eq573NtGIOu8U4Pm+jZcbTK3Si0lE28FlheVc
 DBew==
X-Gm-Message-State: APjAAAVAgeqXjSUPdJ4DN1ZbXsihY6sVI0+09vHjzbHrhm4W6XqxMhnv
 ZJnhPbXG1s33iP9zmnis+IgHhSMsrfA=
X-Received: by 2002:ac8:2a66:: with SMTP id l35mr10054665qtl.340.1571842881175; 
 Wed, 23 Oct 2019 08:01:21 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 14/24] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
Date: Wed, 23 Oct 2019 11:00:47 -0400
Message-Id: <20191023150057.25731-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LIkmUZF0TmWV

By performing this store early, we avoid having to save and restore
the register holding the address around any function calls.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f7d3f257d..37424e3d4d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11225,6 +11225,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     uint32_t flags, pstate_for_ss;
 
+    *cs_base = 0;
     flags = rebuild_hflags_internal(env);
 
     if (is_a64(env)) {
@@ -11298,7 +11299,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags;
-    *cs_base = 0;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.17.1


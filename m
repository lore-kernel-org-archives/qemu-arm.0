Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp9903wrs;
        Tue, 20 Aug 2019 14:29:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwprtx73wRbJ4PTIBwKDsbto9wMkICIq+tP3TSsPXh16QojhQ1xhvcoTJmHRhOtHWBPSzPG
X-Received: by 2002:ac8:4782:: with SMTP id k2mr27773041qtq.3.1566336589448;
        Tue, 20 Aug 2019 14:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566336589; cv=none;
        d=google.com; s=arc-20160816;
        b=QU4IR47mONpxVetyI2MDVXtOA3ybitb+GmvKTEM1Fj6BRJifTZd0wl+hfmqtLUr396
         K5kHqEOaJJqdwP5tKf4BDbb+ZNRMcuGhndM8ztHAUtOTXeIunBUueAySctPpLJFH2TKI
         PvxQotqMk0JYggPrIYJMb6zWDy3J59AQuTseLije3yMAoQM4nEda0jpr1ZieKUeiCc8X
         Qtl8gCsnt7EbnK1TXy5fve0qintgDHUDa3c/d9IsTtS103ZxB+b3yjUOWwNcEI/YXEyF
         9x9WWi8MR4he77XB87LjxzLpAbcqnmQ2O9JG3CaKd0BOTBryGdFmH2kbBXD2ITDxSSDN
         2C+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=bdJW10ZyVTM5Zc/CPE9B8BqW0sLbaJccOlvi6TIDC8k=;
        b=duyrWXZoJRYWxTmLcOQeE2t1NB44FFpv3s5QjtCm0it/xJtNhAqMOegwpS86aiUc3k
         IyJh7UaMEzG6WvJqOYafQOrk7kfW3XpMzhkXTBGjBKlFKYxZ249kL2f0WrxsQSUkhWN9
         mV2kIk2lZAy98tSAP9ThM0q6N/AKA0uKXcBWP9j9ypHW9f+hgdyOFm71ZFcwXmq4TzRj
         YqfDRc4eRnpgmt2G9DlfUpO0GJnd+z+hLmzrZBUlNDJRXajG7/ArCPQXrTOVb7co9GUy
         FDcmufxzIW83D8XEKWb2WC19e3odDyyMgSXBROLzI68TiFW5J1oaejxJuK0SqvqeG48j
         humA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rnC4h8aE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si11450376qkc.17.2019.08.20.14.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rnC4h8aE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BhL-0003bu-HV
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BM1-0000Je-5o
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLz-0000AZ-CF
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:45 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38874)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLz-00008A-0S
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 17:07:43 -0400
Received: by mail-pl1-x641.google.com with SMTP id m12so92443plt.5
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 14:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bdJW10ZyVTM5Zc/CPE9B8BqW0sLbaJccOlvi6TIDC8k=;
 b=rnC4h8aEmYQxndmLKvZxqqh0jLXDwHQja/q6YbWGpszBe2d/evuhQa6WFKat0TVKi8
 X4xpnm72b3eCdNe8zQa+RQAttemLmDjJqvXcXIZJ9V/ZKeL6nhugFiE7vbMJQIOX3xYu
 KA+hAvXSnwJe3fq1pB0g9zfiN2NDYZpkh/l6DJ3WGYUJIuaxkvmauPH9i3FjPC7OgMBG
 cQbvHqzoURlLu0u9O6Mki/w9+I+cku5dztq8i6q45zRxRubqhNrsnYRWMEJ/IOSC3GxQ
 Y02lIokDSN4CzP6SQypX0WlpwxpB54pTHWSRTHU+1cKmVxn1tTAWXq1WhLooAFN6VB/i
 T9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bdJW10ZyVTM5Zc/CPE9B8BqW0sLbaJccOlvi6TIDC8k=;
 b=qEOBmmNuJqLlWiprpZpeXbgVZkPHZnh1u341Vw54sI/UZKtVmZN4Utd7udCZi3Fs5Z
 c4bpB/0gATlDJASsxxhnrU3Kx+5OHcLMPnrkYwRcd+0ngYNzbj+uZEi3Whj7JXIcsIl7
 4IWLB/YUgmtxsOe7sb0l2EB+ENUrBjuJizgRKAAa6bD7Van32FhR++L7wcuUVO09N53X
 uohZullvmLYkZWoNukecJve0YH/Qe6A9nRNrhRkxRZ9yV2b9sZ5QA8LmnxUrYGvxeJEm
 0elekE3bEeJ10eH0w8732n7AhIEvlkXZ9t/9rO3kGQiGlRIM4kAlTSIPaImTh6HWCaQx
 NHsg==
X-Gm-Message-State: APjAAAXdOb96HDt7Ro1JKqI0bWx+Ijo6Daku25oU8rxPJOgBLKCrjTDe
 742EITON1mGNIa/uliSH2UwlBLfG90w=
X-Received: by 2002:a17:902:b905:: with SMTP id
 bf5mr28175471plb.342.1566335261331; 
 Tue, 20 Aug 2019 14:07:41 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:17 -0700
Message-Id: <20190820210720.18976-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v5 14/17] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
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
X-TUID: Oy3SLoKaLZvb

By performing this store early, we avoid having to save and restore
the register holding the address around any function calls.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 19bdb9b9d6..7a94495788 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11187,6 +11187,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     uint32_t flags, pstate_for_ss;
 
+    *cs_base = 0;
     flags = rebuild_hflags_internal(env);
 
     if (is_a64(env)) {
@@ -11260,7 +11261,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags;
-    *cs_base = 0;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.17.1


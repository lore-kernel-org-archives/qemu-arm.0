Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp620317lfo;
        Thu, 28 Jan 2021 14:42:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe3sPhUeiE8Amp/hd/0aW6BOr4NHxZmw9Nh04/4vv+TPGjm+9ZL3gQ66ixytWY9r6mdwqM
X-Received: by 2002:a25:f54:: with SMTP id 81mr2050040ybp.76.1611873753649;
        Thu, 28 Jan 2021 14:42:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611873753; cv=none;
        d=google.com; s=arc-20160816;
        b=UosIa6KFwb5PRlAGOyXCbzavUDaXb5L8Ok/G7hARsK3aKX43PLsoay1flSEQBFRlQP
         LBkLPvJLz9ukp7PvIecV3smIp/+Dba85bNwELoT8M1aVO7aO9UY2+TgCuSqHGwpWzqMZ
         xbt5JTsWnx79w5Bbz6PHZUU4MY3SPX40oillnemKcAW3p6A9iLSdPAtcTavVdHFoBccc
         Jp2pa/3KpC5VH5LgX7Y3XDhjRt4XijAIRJQYGGPp9CQDcyRRYZeZK0j3YTRyrbwqJ/PY
         SPk3jDtit4UbAqmVnG2FI7+H8gdHM/Dl25QTw1nb6IH60g4ur0LIWMHS0h5QlTYsFzFR
         /I5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ro1QlxJECFSg4T0qJhYTh9dJGKCuHRxnJ3IHfAQq/RM=;
        b=RsjkDtcFq8H6zWO9Y4VyIYWNMMo+cbnX8PlLia0i5/1SRScf36nfNqTz5RyInCGWiE
         RKY8NpsV81KwEEYijWKWeQVHZu9hbcjOKxhrKjp9Xj2Kwb9eCI4Y8hh4LWTb8bHzrrBw
         bNqskww2qdyGh1zF3Nm12PkaGdqTPGbuAbIRUzejDiOjrAzKobJmT664L4Wk4g1Ihvm8
         U6KDA+SEUmk5PNTCtvdYveoFQHNXhPazhTcY+NapozunZjnVP4L8Uwb6E7K4ESSXUyEs
         fIzVqMwv2izWwepow7hYZ61hzwBnbRf4hAsW7wezUxXf/m1GytYSPx/t9zW3H4/TuhWS
         3SLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TYrpS9gA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g32si6343308ybe.426.2021.01.28.14.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TYrpS9gA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Fzk-0005TF-T2
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzD-0005Ql-Pa
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:41:59 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz5-00085D-32
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:41:59 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y205so4966045pfc.5
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ro1QlxJECFSg4T0qJhYTh9dJGKCuHRxnJ3IHfAQq/RM=;
 b=TYrpS9gATOUJYsbU8tfz+MqcCiG0GJFuTz18MJvgyG8WoM4iDZo6HeTH14sZr1Sp+O
 53JEcBFkWMZ97eAL16azZ6GKpNxy+I61nm9m0XgiJU0vy8rc1SRn32zTmFIszQc0rUW6
 3IqkDlCmeLcHH0YKRL5wF+JcQivJjv/tY3hDzkSE3l79LEr+FYRgLQi642xO5b4XYJRm
 3h2tX0Vl4wKjw1kis1H3g3OobRZkzo0swpongq+lr06Sr5GXhIXvDgizER4hpXQlLBl8
 9fIcEK31i/l9ZQ7uUPzHPr+2to6mvboPxP7IJwGg0AuRP3WJZZNLvVyGik0XsNno+oP/
 4q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ro1QlxJECFSg4T0qJhYTh9dJGKCuHRxnJ3IHfAQq/RM=;
 b=N+pqIOWmyiCgs9G0MEw/F7CW7J0GbN1j4ore6BW/6j/WEecKPFPp2FaSvnZHmFyRZE
 WvsmUFg9GrlLmLwGE5sIpeBnNo8Dll+AqN7IyZvC1pUJYer/vP1RikMqssoM675cEF7l
 VAsMhatU34kSNVhp5QzLJzg0ogGAQlrazOm5VRFYWsM2CZEtA4QG8cgZeX/wcl7XQqI/
 uW3SjHMOx5wa9poxbrygIV1g32IMV9fivFGx5psCaC8tSnxmhOJMWYaeUpwddpNPQ29p
 rwKJqbq47UfK4MFhTiwlN7MVOx9q7s9kvUv5jfSy00AHvm7WBJm4ujb2H1Ykomc6rAcQ
 us2g==
X-Gm-Message-State: AOAM532dyA5rl5KCCJXJW4An6Bq4XU+6HQGwyR0zZCJpszympRgcCKmH
 D0bPzSQth3yPoKVSdPxZSx/L4FLtZlVaBuIM
X-Received: by 2002:a63:1f21:: with SMTP id f33mr1639027pgf.31.1611873709819; 
 Thu, 28 Jan 2021 14:41:49 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/23] exec: Use uintptr_t for guest_base
Date: Thu, 28 Jan 2021 12:41:21 -1000
Message-Id: <20210128224141.638790-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OTSICXc4hJmG

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 4 ++--
 linux-user/elfload.c   | 4 ++--
 linux-user/main.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c23c77589b..c52180e8e6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
  */
-extern unsigned long guest_base;
+extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 65163e1396..c09d74d788 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,7 +41,7 @@
 
 int singlestep;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 unsigned long reserved_va;
 
@@ -965,7 +965,7 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  0x%lx\n", guest_base);
+        qemu_log("guest_base  %p\n", (void *)guest_base);
         log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a64050713f..29f07bb234 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2135,9 +2135,9 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     void *addr, *test;
 
     if (!QEMU_IS_ALIGNED(guest_base, align)) {
-        fprintf(stderr, "Requested guest base 0x%lx does not satisfy "
+        fprintf(stderr, "Requested guest base %p does not satisfy "
                 "host minimum alignment (0x%lx)\n",
-                guest_base, align);
+                (void *)guest_base, align);
         exit(EXIT_FAILURE);
     }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index bb4e55e8fc..55aac56d70 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -58,7 +58,7 @@ static const char *cpu_model;
 static const char *cpu_type;
 static const char *seed_optarg;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 
 /*
@@ -819,7 +819,7 @@ int main(int argc, char **argv, char **envp)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  0x%lx\n", guest_base);
+        qemu_log("guest_base  %p\n", (void *)guest_base);
         log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-- 
2.25.1


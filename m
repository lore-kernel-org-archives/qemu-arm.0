Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1348497wrm;
        Thu, 17 Oct 2019 11:57:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyy9EuCgQ8lZh7atfMFqdvJMweKt2DoWTVDwwDLASgmURoiX8Ae9DmyGqi7jAp1lYqRvMqB
X-Received: by 2002:a05:620a:127a:: with SMTP id b26mr4727644qkl.61.1571338629964;
        Thu, 17 Oct 2019 11:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338629; cv=none;
        d=google.com; s=arc-20160816;
        b=nF24Bu310iJpConHwbKOrUTbeEoNyoEl4xkPz/g3hcwHvjVFGd+X63VPYg5WnFPAaD
         INpP3qE5bT+q4dO4h2oCaCcQhgnGE4TcMOuIoyeqBvmWbY0ivY5DiNOVMiHBowr/PgEX
         ZYCBTA3p0c/aq3rAAZfkPvCgX55LXe7xfePpJR6/GBunGNhAmfv904dR9Qjo70WjpBjf
         aVDFrhSXwtnwPAWkFF6A8RdxkyM9WQmsRMFgMs3R78iwQvNryIc16BHvR4OBxOKqCdC+
         K6Swa5oX4vBm5yviFxUGy2iQbI77WjqXTam9F/v3F2s9i4kr8cw3B1gsXO7PWPJDbnsM
         XgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
        b=pgTahb+CW2dUygiWE/1lFa5van/nSUkaRFNPmaQXKl8VvbGNIEvjiJlcskDB8jJjeA
         o1yu6Kn/G2r7i5VVHdQaEmY2FndQXWXS8gCM18vwhEibF+5yE3mAxuc6WxSJtBOltvxN
         WvoII2/hqQlmdiBIZp0pHDgdjaatkglyWidfZ/wEqBt2wQDNWcy6KOjgI/+asQNsfCDr
         qbDWXtHlbvui7afQCsoXgZ47qMy1BBWK+iNAUhLEjcq1oBn84uzx/rvcYtxs3uirS80I
         ENvON5LmdMFhjHLnXyvNQ3gAL+dE9fEkjlpQ6lFft1XhEVMvcRjkiuSJ09Q5E0CWPbQO
         2+vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I3b7WLm7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si2962049qkj.211.2019.10.17.11.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I3b7WLm7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAxQ-0007Ix-VN
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs8-0001Je-Qx
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLAs6-0000wu-I1
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:40 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLAs6-0000ud-6b
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:38 -0400
Received: by mail-pg1-x543.google.com with SMTP id i32so1852007pgl.10
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 11:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
 b=I3b7WLm7g2SoY2lWEY7zxBBtx/2zPvZoEAzkBwDk6gU0LTFGfgdnAFYS7FAHEMqy4t
 KvVGfMqEkB0/9p2eDkFVuM8zFzfeXRJCpBl+JDD1QMII3oC+YdFgUJQY8yLdoDN3bw+u
 72WmDUOVKfk7ne4L8rS5/WW7hExClQh9VJh7cH9EvwmFpxscuK5QWDV7NfrKtr85wG7A
 FAB0UIiLWHt/7GEVS13l3b/qw6DQnO38qIw5VkkfQ1VSv6uQ1ADuZSZgoyQhBS68c8E6
 mcIN7FH6bTo6jNqID9DwC0pxJeboDhwvaCmd8e9H8kY9CQKD7JLEjDxTVI0yObyE8jYA
 4Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
 b=gjCU7vFvkmCCPTZ4u66FOpsxaYySvVMC3CxC6M7UO4E4d+a2RUw1ZrQPVxkp92VO88
 nkzmWdOTRp+8RNaGbEdjG8OMi5b4LEWLounpqvmC85p1sY1E5lf6oDp8UJGxelns/Vmu
 Xffms3J67+ouYH10uYpmZG2fYa2i0K+tok1zsqEiOulAc+zrvLnooZvgAYg719QYi+Ft
 wE4WvTIKuN1k1qgoUM4k4e7YDsIYjGHDsTx3vPZZZVSxzWyX5rUfziuBkfon9V76SpNS
 9WkRvFRMu1pLyzvmGCqYqjDDTZxKgXb5HfWExhIZo1aLuw/D7VRDebcY+n3CiK1F4Dy5
 CWRQ==
X-Gm-Message-State: APjAAAXpiURBzVFxOqSrumwBJ7GmbnEkjMgFiQC7bTx0lb/f/Fy3ZK5R
 JhHF70yM0mq6ZChCC/crkDbMZqX8Tjw=
X-Received: by 2002:a17:90a:fc82:: with SMTP id
 ci2mr5939815pjb.13.1571338290658; 
 Thu, 17 Oct 2019 11:51:30 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/20] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
Date: Thu, 17 Oct 2019 11:51:04 -0700
Message-Id: <20191017185110.539-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: bzSBisa4lEaS

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


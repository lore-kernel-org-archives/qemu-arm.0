Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2616621lff;
        Thu, 19 Dec 2019 11:03:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqywj3fizLd+VKFfdgel1zh4W9SZ39TJFl+vR8WqXEruAL3Ea9sYsp0/74hzgzhQqL48Anjv
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr10392918ots.250.1576782191904;
        Thu, 19 Dec 2019 11:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576782191; cv=none;
        d=google.com; s=arc-20160816;
        b=BhJvTxtqm35iF70ev8wpMRilWoXoE3mkLcc4hBK+4D6ggvmeFKZ0fkCSdlfm5SJmhM
         ULqmDu1ulfuslg4t8tY+QkeaI4KXPQVnL305gdFqjyE1gGPXFV/I1WDWHkMsGLRanJGq
         WWktKgtMyWVJaXT/R/L5gA7umwXDBM0/yGBF90JMj/t/qbtckTePe0h7qiBqL3nGlnGt
         /SjWCYiqkUv51yyQuRmbsgbZcMAnfPrq5i4lPiSdG6/j0lH9xTvU4vdi2qGUfVNQTAKv
         KTupJlyDYHYIInOKn1baIObqtEUIkl3FTcE+nHnHo2HPBUlgGuvq5HOHDNsq9WCMVWAK
         Od0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EvN7owG5HPoEIvZGOHW50DRqlmt77IJjf48sxQbIWC8=;
        b=E+oEOY6gd2gaDQu/xP6KqfpOjEL5j4avgecsIHefJSQFBLYmzzisZjMqw4QIM6jwBe
         Owt2hQHqWuuS3sAuG3IZ1/gzSqxm3qFz3KEFVKnxBVsk4XQkkhqUHgeMZJIReYn+GnA3
         HnK3Gq0CBSAIkfnyqb7iHYKISMx/VroIobClTCHR4GJ+rj5gUzrq3VtVYnisfygnl4+C
         SXfQ3932Pq03plaHW88UWqDEC53CcLOKp2ZRq8VO5bLlDlBysrXyQXkxSDJrNeo5PtyG
         friCcurqEvIdbmYevXJrVcW1i/uHYvbcQk6QWsh7u/4NNc/3ZApq7U4edfTPRSvw2QMS
         MoQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iQN0Ey6T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si3745374otk.304.2019.12.19.11.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 11:03:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iQN0Ey6T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ii14p-0004fe-4f
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 14:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0tg-00074D-0U
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0te-0007r2-JY
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:51:39 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ii0te-0007la-9g; Thu, 19 Dec 2019 13:51:38 -0500
Received: by mail-wm1-x342.google.com with SMTP id a5so6519270wmb.0;
 Thu, 19 Dec 2019 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvN7owG5HPoEIvZGOHW50DRqlmt77IJjf48sxQbIWC8=;
 b=iQN0Ey6TvoUdvQhGvT3+wzjLpiqH49Soc8MMq9/2F18zlaA3ixJrdSQHcbQZMDUGaa
 EU9frq4JchJFigdK3xQy4N/UEYQUL5kWlIsGIEupClQxX1zZuBfvZzyATVefvtn6XC2o
 FsNwwihiNerV0zn7OO/AZLIbAVfwnw+2GUTPyo8Z6rFUXCoUp/Z/Q96gJnffvCG01Tis
 OR9uOWl8v23oBrLlLZTKGfE1QWcbL4XWtVueuN+xbyNhYJ4pQbpQlDNewDIPK9Wu2izU
 ZYr4Mu4UYQ8gDsLJgIEy7m4VXMz4ab5KL06ast+ZlbAracfi/CyMV8aGbr2aTKJel1P6
 GTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EvN7owG5HPoEIvZGOHW50DRqlmt77IJjf48sxQbIWC8=;
 b=WuGJVqmYolxpuoh4B5Zzsr1TjjsLKLonvI09rPh4ZxVsL6zrHg1KFNbRpppGBkcj98
 0Gj1IULYi+fTJaN3jMG/4TqjKjsnQj0tDUxs4d7YG8ZNUagzCRlhhO60Ktu2PxWHnQcp
 7rBiIQN+cfM3KeqwH8foDY7quvQ/+q7o2v7fpWaRTe3hwLVXKtGe79D6NHcVGz8TArl7
 xJJVYVd3yLm+QZeHz4uJZYs2A1VDB/xyN2bQN47eCS8/YESRiWIzhuGUt7dSP+hJZRj9
 cNVynoSV+ipazEPyx9oy9Hs0pvg3rVFx7RV4Zh14AhBoXUcGKj9RvSNco57iJHUjvThn
 C+Rw==
X-Gm-Message-State: APjAAAUqnpoF41E+GDfU+tv0E+GJbOVCYjEY+mGU/ABH3ciThPKu2T27
 Vr8Q09q/2yqGtcQfNdlZq0vSYLU6
X-Received: by 2002:a1c:8055:: with SMTP id b82mr11828185wmd.127.1576781497017; 
 Thu, 19 Dec 2019 10:51:37 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id b67sm7435494wmc.38.2019.12.19.10.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [RFC PATCH 06/13] hw/timer/allwinner: Rename 'timer_context' as
 'timer'
Date: Thu, 19 Dec 2019 19:51:20 +0100
Message-Id: <20191219185127.24388-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219185127.24388-1-f4bug@amsat.org>
References: <20191219185127.24388-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PYXl8JgJ++iv

The previous 'timer' field has been renamed as 'ptimer'. The
'timer_context' can now be simplified as 'timer'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/allwinner-a10-pit.h | 2 +-
 hw/timer/allwinner-a10-pit.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index a60b9f3031..b5ac6898fa 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -21,7 +21,7 @@ struct AwA10PITState {
     /*< public >*/
     qemu_irq irq[AW_PIT_TIMER_MAX];
     ptimer_state * ptimer[AW_PIT_TIMER_MAX];
-    AwA10TimerContext timer_context[AW_PIT_TIMER_MAX];
+    AwA10TimerContext timer[AW_PIT_TIMER_MAX];
     MemoryRegion iomem;
     uint32_t clk_freq[4];
 
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index effdf91344..44e6eee3a8 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -301,7 +301,7 @@ static void a10_pit_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 
     for (i = 0; i < AW_A10_PIT_TIMER_NR; i++) {
-        AwA10TimerContext *tc = &s->timer_context[i];
+        AwA10TimerContext *tc = &s->timer[i];
 
         tc->container = s;
         tc->index = i;
-- 
2.21.0


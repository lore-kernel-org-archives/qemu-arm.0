Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEB9C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welGC-00064T-7o; Tue, 30 Jun 2026 23:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFu-0005gx-Nn
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFq-0002o9-OW
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2c82538b6c0so1418415ad.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875089; x=1783479889; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=453lJLYfSza/GUfaKZX+AmJfUJI+W0lWC7DD9POCfCA=;
 b=DbkmgQhsTPiN93TarzKWntJgDzmm4sYiXLRapZHfGq975of//2F4//tiP03XkSCdtR
 6BH6LvoTFOHEM47WjDdvrvbIiBEDTgXu7hs+vf6AF5a+P48i7SCm4nM5tzl/DxolZvmr
 /NMPI2fHl3pOd+ARyQd6nuE5C4QGLHeSAAMzpj3TPrEIEYRpOhK7uSoxEC0GwRP+9zdL
 kscxxJCjwopFOA50ysadiWwznjy8iaV3I75XVDN6pu6N5O996bHgoZQxrJnD5tBvb8cE
 58FYxw3932D+7LX9v6nLTO3B/lQWV9BxTDPnRJvW0j87gFwzBLrDOl4uggE5F2zMwoiW
 wyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875089; x=1783479889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=453lJLYfSza/GUfaKZX+AmJfUJI+W0lWC7DD9POCfCA=;
 b=pxJmO8vnGvJh0jkZpsb4FqJY6/C0F045kw6MzTSSZBHauwRNDRDYL/UOoqgNtzDX8o
 WCDpbx53nHRccKIA32HgLeTQkKhJkBTyOGGNk6yda0sVRjG4tNpObfwEpwUZGHoxK4gA
 xFqVB8iM2AF/mny/YnLZwtZLb702PhB4vO3V1PztZpmPEHCdq5AqrNP/OMPi9k1ysJjt
 rc2PQ3Ja/V1IxGlDJ/Zd5cQHSp5YwrM4CZIjG5nkPVpHh1T95ylL7VrHIIchzw8RN9gt
 J8aYTO2gyBGI8ef1jM4I/DkDcFOabsc0W86ZsxtUAgSEAd19V7H9pDYWPPFx7yWj0H7r
 cc5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpabZfAixN1IP3WS0wE7gXsn34U3xqzOa3CYD9EzuQ/+Z2HjVNbJdBNp/aMHAx3FMZpgHGd28FGXg==@nongnu.org
X-Gm-Message-State: AOJu0YySlNPvZXWYPE5D0TQGyuaVfS7vKzVPAbNdMYvsuP4HmhpmezO1
 wvIpmMpD4JXNPChJddhIAt31HKORu3f7WOpbi8ZDLAaaA94CRY6sV8RLD0jMsScf5Tcc2aP0lPl
 mkYcJ
X-Gm-Gg: AfdE7cmi3OrFtvhF/EwxtdV5Z8tfmwK+SEEiLiwUidasU9tFqzT5U7s879gTKTyCvbf
 0zpS4Gf30jcikow5o7EOl6tTNobv9QZMrnn4UtxfTci+fUKTXK1+5eLkC/hNLXWL7hT7emFMDen
 PfOELjgVI7lejtOscjVfGH5EgGCzQ50zykg/vlzvsBeUq1B0WtpRyfyOrFW78678HEzMh/+FO/d
 NTW3Bg7CFiX+ijkP6sm1DtGxZfVz46/CkJ4yTGaQWEbs4+Cw9JQc1EJfABYLLkPNxLtFrKWFYE9
 yKjtQywHt2gQpEo6Jk1VITiOxGpeCXnMgTEbHmhbYxbXQvzRsCGn18ZbFNYecoJ1vmpyZZccYBC
 NsypnjfGiqJcZksEz45yQvMNyNcY8vT5nctJMeKcSClYfPtmaA4MYYKUcbKLIBjKm+/tBK/Yhd0
 xlATgaphxHu0JmiOZ+Z21wjZTj3hgV5AiaGdpiwVMBRPQoSuoerA==
X-Received: by 2002:a17:902:d549:b0:2c9:e5e6:8621 with SMTP id
 d9443c01a7336-2ca2e718688mr54455215ad.25.1782875089104; 
 Tue, 30 Jun 2026 20:04:49 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 05/17] qemu/typedefs: Declare CPUBreakpoint and CPUWatchpoint
 globally
Date: Tue, 30 Jun 2026 20:04:31 -0700
Message-ID: <20260701030443.1382447-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 8 ++++----
 include/qemu/typedefs.h   | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 4013d9a07c..fc91343875 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -26,20 +26,20 @@
 #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
 #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
 
-typedef struct CPUBreakpoint {
+struct CPUBreakpoint {
     vaddr pc;
     int flags; /* BP_* */
     QTAILQ_ENTRY(CPUBreakpoint) entry;
-} CPUBreakpoint;
+};
 
-typedef struct CPUWatchpoint {
+struct CPUWatchpoint {
     vaddr vaddr;
     vaddr len;
     vaddr hitaddr;
     MemTxAttrs hitattrs;
     int flags; /* BP_* */
     QTAILQ_ENTRY(CPUWatchpoint) entry;
-} CPUWatchpoint;
+};
 
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 2344c92182..919fe8ebff 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -39,9 +39,11 @@ typedef struct Chardev Chardev;
 typedef struct Clock Clock;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUArchState CPUArchState;
+typedef struct CPUBreakpoint CPUBreakpoint;
 typedef struct CPUPluginState CPUPluginState;
 typedef struct CPUState CPUState;
 typedef struct CPUTLBEntryFull CPUTLBEntryFull;
+typedef struct CPUWatchpoint CPUWatchpoint;
 typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisasContextBase DisasContextBase;
-- 
2.43.0



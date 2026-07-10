Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1085AC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:57:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIGG-00034e-Kc; Fri, 10 Jul 2026 16:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFB-0001jo-Pt
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:45 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEw-0000rQ-Gu
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:45 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84536ecfc5bso1562085b3a.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716869; x=1784321669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oTQ42LKlvaXUmLWp84DyN7oebX42kH2GrCSdO42BkNs=;
 b=nPlyKx4uzAOKw2uirf/xZ9exHJsp3oN3YTEYePgVhZPpFLWok0T6nbuE5nkc2Y/m7Q
 6D+T+7cEnfIIJbwJAPvd90UDRCj54XlGvC4QSspveQM9k7d3cx0jVjijGx1Tg6hXTjSd
 2a0p+IrIvUa15CCbzxYxCXfDRJH60ktXGutwZuYpnnhGu8M8aWHLenBfSNX+XK1oIeDH
 uvY9sTff79AD5jJ2RCGBywSTeZ+P2ISPd5cWMISZFZnt8FM+p3FYMKau7LY8HFwI0tWh
 0Xttku3klGSHY2+/ErBEHQ4gv+HtLsiv7zD2HtK8yxZaKQvPVBic7E/Ba8Fv+DEzGcHf
 tuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716869; x=1784321669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oTQ42LKlvaXUmLWp84DyN7oebX42kH2GrCSdO42BkNs=;
 b=hC1GKOdgqnQWlwm3mHdeWjl+pKznojUkKJJvAXLNHzK8mZCzWN2gzdlvTZLSI8nc5R
 IpdbtwEm0bu5JtnYlQd6AhcxpboqvATVjgUxil+xnL+1e9tHhN8+3hHqMoUGYR0Hl4Vv
 e3l7svMQMB3QDAo4G4txJuNKDhHbxXGvrnIPqckI6X25wopvJ0itBQBQkgPvXJfJ3ywn
 PhXr7p1ajrikq5sWb6BCLDPz2mf/84PWXPKRwJlZOhy3yZD2tsN3LVY+Cvldsveh93my
 7aETWNKQS3YxrAN3A7CuRp/GGHV5unlZ0k/AgV2UaEyl1RAfsJ20Vp3F9R3lkXFOcZY/
 dhjA==
X-Gm-Message-State: AOJu0YwD7wK3/K72iqw38BNM026nX5ZuzzQpjDW502uzlphDXSM2XEXG
 KMzp/64uVomMWpo423/aKj/oaoiCyM784DVNQwgKyD6zLGrag81asjlzM/r1avCHb2A=
X-Gm-Gg: AfdE7cmiGanJmTfRJKS6/dux2Yf313POLtz8pMgsVkIYWgz97xJLTHdZFuL1Sq0zbTb
 TLm3+y6ds2fNZjQ3PYlVKccxbmCLeTGMKRS/XyduqhZ751kF0y9rL1+owug2Fc1Yiu2+wP7aR9k
 vUxClL6BFVODfqUwczQ5eNpWnNIMHJ4POuampt26QKylEt8ux1fSAZ3GR0rG4tK9VIZ5BBXWiKk
 8qNcQKlyXORL7/n3HzQpplHYCNjqujxJJ+YYke0dAJfOrr2TB1lKlyFv77m7yFuYNeJ1Jjp0LyH
 +k9nW7HqAg9ZGkz1q0y+dZNMo4lWnqepzg0OLMeXPfiFSE4xRtzn/+5ZZJvXBc0ZhFCZ3hWK2SS
 jloHDcQSYbch8TuGh4uvH12x5CaHQkMmM3jgbqRocMGw0sCXjT+aUqkFbRsjd8wd0UI81PsHPSW
 aoWFrU5Z/gDlCfgQ2pfg==
X-Received: by 2002:a05:6a00:f89:b0:848:3e74:85eb with SMTP id
 d2e1a72fcca58-84889611e4fmr542804b3a.1.1783716868959; 
 Fri, 10 Jul 2026 13:54:28 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 24/51] exec/breakpoint: Add CPUWatchpoint.hitlast
Date: Fri, 10 Jul 2026 13:53:34 -0700
Message-ID: <20260710205401.836304-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Allow the debug_check_watchpoint callback to see the
entire range that triggered the query.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 1 +
 accel/tcg/watchpoint.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 60fda8dbb7..fe6dd02bdf 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -37,6 +37,7 @@ struct CPUBreakpoint {
 struct CPUWatchpoint {
     IntervalTreeNode itree;
     vaddr hitaddr;
+    vaddr hitlast;
     MemTxAttrs hitattrs;
     BreakpointFlags flags;
     unsigned id;
diff --git a/accel/tcg/watchpoint.c b/accel/tcg/watchpoint.c
index a7ce5fa9dd..edd1d5708b 100644
--- a/accel/tcg/watchpoint.c
+++ b/accel/tcg/watchpoint.c
@@ -89,6 +89,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 wp->flags |= flags << BP_HIT_SHIFT;
                 wp->hitaddr = MAX(addr, wp->itree.start);
+                wp->hitlast = MIN(last, wp->itree.last);
                 wp->hitattrs = attrs;
 
                 found_wp = wp;
@@ -109,6 +110,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 wp->flags |= flags << BP_HIT_SHIFT;
                 wp->hitaddr = MAX(addr, wp->itree.start);
+                wp->hitlast = MIN(last, wp->itree.last);
                 wp->hitattrs = attrs;
 
                 if (tcg_ops->debug_check_watchpoint
-- 
2.43.0



Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289494njb;
        Mon, 7 Oct 2024 18:22:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWduc8TqrFrnxcLGRg5aipA3nOBCFD3tUhX1XtEBUGQmg9gbp4lejyVpdRTJRyATm9SLjZYYJNpjK+7Qw==@linaro.org
X-Google-Smtp-Source: AGHT+IFo3jqJtSBtPnRr4TaJ137HxRBVx+BAIu4AExT4Bglck1OIvD3ELwq3WoSOc2jVhxPtGzrL
X-Received: by 2002:a05:620a:28cf:b0:7ae:310a:84e5 with SMTP id af79cd13be357-7ae6f421c77mr1948941985a.8.1728350559043;
        Mon, 07 Oct 2024 18:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350559; cv=none;
        d=google.com; s=arc-20240605;
        b=ICoFEmdXvnjPWgko4nR1JkfX3zVfs8jSamtYeYVdfbUXtOpJoJAHM4kudiYutXOp/P
         SSn4UWfgflONxAiUX5lXMXE1JbaPMJps/T6ResmHd6bv6tC13G2uiqMYX3+6zz3gVtJ4
         a6LyyOwNuALNhdLa1PvrARYU3Y08xbSbYDYAI5SFrzvOGyNMD4IbQYSoX1caOBh3yd+4
         P2/wBCEChyq1/yn9aW78GCeteeg20iXvY8UWONYHLDWUEp0ZVPhLDgj5o8Yz+kTdx8el
         uGADVrGcdF3B2+RhTEV+B8CXk7k5/M39FIJE3sk1RjSaTlK84kTHaTUrH/Rt+BzA7IXN
         3faA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=wyZg7kxpkNCds2EZflCHxHMwXfcdXxrO/ZcaHcLL39s=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=an2yUvC8OAQRZxo9VoyVQf9tNygorxcR23cpkFCxpISJa/i98uea/rfczgcuuUuHVc
         BXOuMeg36xlnY+jUneNBg/zXlxZyYo2fXnhc+HWXm8RRxl7+VehOK6RFLYzON6ErdSXU
         xWy4Z+cwTK46/5kq/apE8Z5ICxNHE4EoOFCrk8LT4QoZG3bC6ujNMZUMEW+2bGHlSEz9
         nPqbok12iWRvQ+XjxSDtDBl6oCXfiuzQcy0CrOLH/he/utnaEWJXkDlHAxNWCr8lz7H/
         0tiOC99Rv5ri37hRUhlgQ/AWAtKiibS6HTaNsdz0nVcHGFXxNbmPRVrUHHYO8Q0WqBf6
         jpyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sUmZs6x5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7aed2cfdb32si91597385a.333.2024.10.07.18.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sUmZs6x5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxyt2-00008v-S9; Mon, 07 Oct 2024 21:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gYgEZwUKCOIXEZMTKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--tavip.bounces.google.com>)
 id 1sxysR-0007d9-8Q
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:04 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gYgEZwUKCOIXEZMTKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--tavip.bounces.google.com>)
 id 1sxysP-00006s-JF
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:02 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e294f38bddso80295677b3.3
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350338; x=1728955138; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wyZg7kxpkNCds2EZflCHxHMwXfcdXxrO/ZcaHcLL39s=;
 b=sUmZs6x50LQ/pe4Gez4ZK7t8kjzZvn/cx2qAoJC/7Y4F68dzQ2xvg5k45/wjdGXgo3
 hFQf/wA/gJMDCEmbwjZvVkLT1pCF9CcYNQz50G99FM2uXCZx57Db8ZQLDjWvdLu9qFQT
 ovBzXs1neqv3tzxBZce9oLOY7tmfUHv2RgCc3RbJlZH4rsWqQLF/aT7ccrIFGNrnYufX
 jIMQ9zzLKMsc57TWkNSR/qvyorhy+F9gQ3Jj93KlQJzgiVw2qwdwNDlQzNIpd1ps0MaM
 ZfsQsRSiBCoTu1ogZkiFizMVw9hIB36Ew55tHEq013wHhq03py+2Mj/uno8nxwVXKBIa
 ueKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350338; x=1728955138;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyZg7kxpkNCds2EZflCHxHMwXfcdXxrO/ZcaHcLL39s=;
 b=fr4Eb9z+26lF1pDe0aKZCI/GLr+mAOLZz0BZDww2h/ZYqjY45tHYkJ15yfhePMNt8E
 K9BLN0Er2VF61+JqbjjJz+WgbrBGjh7pR/bXgD8l8TkRNses1vmMDYiyqU33rT0RnyRV
 le3P6ZfDocMsdozMu6IWS1b/jvU/DqKwUERj/0RYKiY7MskZWOx6l2jnFv88SJKXREt4
 a4gwVF99RwWMBgHBtDff5eVfa5HvxPEQi214rqnkQvyTxKoLNTnLvE/sQoCh+2D3xKkr
 mXBSO94cWb5adhz5PE2fjrJ5L2+tIWxSBvnG7Ef4rUfI0Xnisu+/7B7xXYsyLm63auxC
 qxvg==
X-Gm-Message-State: AOJu0YzvlUZnWxOLDxee4YH5qqgCoQoAety58xHsM16w3SrPHeWmj3+e
 TvZ1tDV63PAvYi7PyM85kDGNuhIydCC4HpV2216o/aFBvUgsBuW38VnRyxiefc7RLHc0KChGRw=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a81:b513:0:b0:6e3:eab:18b1 with
 SMTP id
 00721157ae682-6e30eab1934mr52557b3.1.1728350337999; Mon, 07 Oct 2024 18:18:57
 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:28 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-3-tavip@google.com>
Subject: [PATCH v2 02/25] tests/unit: add fifo32 tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3gYgEZwUKCOIXEZMTKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--tavip.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TzCMB0134vEV

Add push/pop and peek tests for fifo32.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/test-fifo.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/unit/test-fifo.c b/tests/unit/test-fifo.c
index 14153c41fa..d0e05ba95c 100644
--- a/tests/unit/test-fifo.c
+++ b/tests/unit/test-fifo.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 #include "qemu/fifo8.h"
+#include "qemu/fifo32.h"
 
 const VMStateInfo vmstate_info_uint32;
 const VMStateInfo vmstate_info_buffer;
@@ -432,6 +433,53 @@ static void test_fifo8_pushpop(void)
     fifo8_destroy(&fifo);
 }
 
+static void test_fifo32_pushpop(void)
+{
+    Fifo32 fifo;
+    uint32_t e;
+
+    fifo32_create(&fifo, 2);
+    fifo32_push(&fifo, 0x11121314);
+    fifo32_push(&fifo, 0x21222324);
+    g_assert(fifo32_num_used(&fifo) == 2);
+
+    e = fifo32_pop(&fifo);
+    g_assert(e == 0x11121314);
+    g_assert(fifo32_num_used(&fifo) == 1);
+
+    e = fifo32_peek(&fifo);
+    g_assert(e == 0x21222324);
+
+    g_assert(fifo32_num_used(&fifo) == 1);
+    fifo32_destroy(&fifo);
+}
+
+static void test_fifo32_peek(void)
+{
+    Fifo32 fifo;
+    uint32_t e;
+
+    fifo32_create(&fifo, 2);
+    fifo32_push(&fifo, 0x11121314);
+    fifo32_push(&fifo, 0x21222324);
+    g_assert(fifo32_num_used(&fifo) == 2);
+
+    e = fifo32_peek(&fifo);
+    g_assert(e == 0x11121314);
+    g_assert(fifo32_num_used(&fifo) == 2);
+
+    e = fifo32_pop(&fifo);
+    g_assert(e == 0x11121314);
+    g_assert(fifo32_num_used(&fifo) == 1);
+
+    e = fifo32_peek(&fifo);
+    g_assert(e == 0x21222324);
+    g_assert(fifo32_num_used(&fifo) == 1);
+
+    fifo32_destroy(&fifo);
+}
+
+
 int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
@@ -445,5 +493,7 @@ int main(int argc, char *argv[])
     g_test_add_func("/fifo8/peek_bufptr_wrap", test_fifo8_peek_bufptr_wrap);
     g_test_add_func("/fifo8/pop_bufptr", test_fifo8_pop_bufptr);
     g_test_add_func("/fifo8/pop_bufptr_wrap", test_fifo8_pop_bufptr_wrap);
+    g_test_add_func("/fifo32/pushpop", test_fifo32_pushpop);
+    g_test_add_func("/fifo32/peek", test_fifo32_peek);
     return g_test_run();
 }
-- 
2.47.0.rc0.187.ge670bccf7e-goog


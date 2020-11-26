Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1784811lfb;
        Thu, 26 Nov 2020 13:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK8vdPl+GEltwFeFVWJJk5OmuBQtSij92moaN6qki7FT2vTASJmD3ceZKstp6iCQXow931
X-Received: by 2002:a25:7711:: with SMTP id s17mr6952442ybc.283.1606427440762;
        Thu, 26 Nov 2020 13:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427440; cv=none;
        d=google.com; s=arc-20160816;
        b=C0U96p3Zbv2TthxgZ62AWU8SXU5+jhWrAnMyGiPjX0N7fJ8Q/FXJV+NH8Pp/U8trY6
         lYEwMPKOVyWKzVfWDQ2FUsflAPxm7KjlCCK/WRIE+6EcKANGDQMbJHMJaHhXybBUGnzu
         cDhqfaB3hS+Cfw9WRT4d9o8zHWdQRdVVCwqJy2UlnCw4AOi97YLLOxAd0LtlUNfXFVHj
         ZqDTvfvt2nnzLEbMjyDiBdyYhKytlRjHFYM5xF3WeaG0mYUGGxVjI51bRH9exdj85lMm
         GsKL7iSOh3AaE9p+hwYz0V29p195i6+ecjCdnsodb63kfYkd/jj5V++BuousjPp+XvOb
         ZNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4kYghup3wnS3IF42SVLwWHHRv5CvJ5rkwyiL/gwkIPk=;
        b=je2v7TOVJFGQgNLXgLVUwoS1XXJcvAXdGhEbrLgKbf0jazUWDvDOpb6X+YOovSZY37
         +/mdxJxMlLE6WbGwt4RJ8Fpf704x1BEy3X7/D96V0vG/pfzr+AD0DW+q3oq2BerEMoVT
         BMndozsuAcs6QOw9vO0UCbMfxE6iBsCWyZEOJP5MW2fa3JWtQ+eLQMqYdua02Q0v5o7l
         RV6hk1KcoTvyXLhWKtE5I+C+48zIHEdZEWLsfdkozCxMLDpf8b8uyXYaOe1lehDCWjVZ
         THPkSOSMPwSROeuTxcUq+Y31rq+0MRisrlKMUebX4bzJUp1l8FsvP1lEWp2DkSzRgHC7
         VAyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si6491888yba.220.2020.11.26.13.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPA0-0001p3-4k
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9m-0001lk-HF; Thu, 26 Nov 2020 16:50:30 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60628
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9k-0005mr-Le; Thu, 26 Nov 2020 16:50:26 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id E832E39005A8;
 Thu, 26 Nov 2020 22:50:20 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hvf: Use OS provided vcpu kick function
Date: Thu, 26 Nov 2020 22:50:15 +0100
Message-Id: <20201126215017.41156-7-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQVxf6Cs9rV1

When kicking another vCPU, we get an OS function that explicitly does that for us
on Apple Silicon. That works better than the current signaling logic, let's make
use of it there.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-cpus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index b9f674478d..74a272d2e8 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -418,8 +418,20 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+#ifdef __aarch64__
+static void hvf_kick_vcpu_thread(CPUState *cpu)
+{
+    if (!qemu_cpu_is_self(cpu)) {
+        hv_vcpus_exit(&cpu->hvf_fd, 1);
+    }
+}
+#endif
+
 static const CpusAccel hvf_cpus = {
     .create_vcpu_thread = hvf_start_vcpu_thread,
+#ifdef __aarch64__
+    .kick_vcpu_thread = hvf_kick_vcpu_thread,
+#endif
 
     .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
     .synchronize_post_init = hvf_cpu_synchronize_post_init,
-- 
2.24.3 (Apple Git-128)


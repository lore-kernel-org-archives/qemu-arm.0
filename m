Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp58261ejf;
        Sun, 14 Jan 2024 23:02:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBg8ma3XqUE6HMop85eIcanns6s0uJCO1P7gkhO4eyHCs70OMGXKAs3zgQyLbn7NGx5udd
X-Received: by 2002:a05:6214:482:b0:681:118f:cfd2 with SMTP id pt2-20020a056214048200b00681118fcfd2mr7282576qvb.89.1705302160453;
        Sun, 14 Jan 2024 23:02:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705302160; cv=none;
        d=google.com; s=arc-20160816;
        b=YNW72FPtQko4Gx53qOygeVNO7sn2/gDmXFoKHjoc7yVWY2Gk/ZVvXtbe/GwvC1E3hI
         LSo2VfrWBoKWNQD52M7pd9H7RUOUC47rs3teHdG2i8sE7dU/4Xi2QToZmKhdgIy2HqQP
         7YOlmj3qFDMxq+59p1/tGK7+51ME1t23caU6zN1m16tWcQpMOPnoHy2vLyXmMoZ8ii3+
         MaZOodYjHJgkowV5U4s2/Vv/45T+FdPYPy2iER4z8lgpe6hWB9JZZgisTsx5g61L2Rwy
         KFUnlKK3FkA2VYDtN7RFHYWn+D8olncKQjIL+8l3/lNFe7Furc/TnNcvxNsPn9fKl/Ci
         KVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=st4H19IuPgBtimyiEY16Nd8XTfWsJqzO+UONb4+2o1A=;
        fh=Rt+CO+GXgdbbWF4Aa2/18yDUDSOD2L7d1fT+UjSEMHw=;
        b=QmZklPuiEVStv7eCS1VgajegZ5/qOT09jNa61b6ojJka+DPOv/tpU6+2tIPJ/AMztr
         BmSgM7N7INwtMH7sLPoUnbH+0Yecp3oUaFs/7VE09Qa3ob/qMxY8kSqNl7B/l1/QptaB
         5TckXpvl80eRpMzLAMJXbS3icCbplE4TMnVlrZcRmlJ8CRiI2KSwiD5Me421wm6B0gCR
         g44mXhIvVhCuadOncQfMtFBFkxIL3o/GJ24ZPI70mq6zudYWSk5yiGgshSAE0rwWMFdm
         9u5xMUweI4inupMUgAv30kjJBsVgO/nEx4lQL6antbdRqz0HWxXypureWlR9F2knPpZ4
         8kLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/asr9IJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a0cabc3000000b00680703b9fa8si7185267qvb.289.2024.01.14.23.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jan 2024 23:02:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/asr9IJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPGzP-0004nh-Ai; Mon, 15 Jan 2024 02:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rPGzO-0004nT-JR
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 02:02:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rPGzN-0003OX-3X
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 02:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705302148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=st4H19IuPgBtimyiEY16Nd8XTfWsJqzO+UONb4+2o1A=;
 b=F/asr9IJ1uwK9EeyonyfHpTItMdbC3UBXKO/GVSEjWUCqCuuHqb2VuYlaJPA/PiT3Ft378
 u0wA1ZTKfsFUDMzpJsJGTvNlITC5XBD2kOdujSCreqbO8hey8RK2hqKqUB56BfzYm4R9uv
 X3ZPFSkiitcTlOxyYIL50bWFp0hLNwU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-DBx1d1r9NhOmqPc0fI3Mqg-1; Mon, 15 Jan 2024 02:02:26 -0500
X-MC-Unique: DBx1d1r9NhOmqPc0fI3Mqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7EAB185A783;
 Mon, 15 Jan 2024 07:02:25 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445302026D6F;
 Mon, 15 Jan 2024 07:02:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org
Subject: [PATCH] tests/qtest/npcm7xx_watchdog_timer: Only test the corner
 cases by default
Date: Mon, 15 Jan 2024 08:02:23 +0100
Message-ID: <20240115070223.30178-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.758,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: tzCshmJMEduK

The test_prescaler() part in the npcm7xx_watchdog_timer test is quite
repetive, testing all possible combinations of the WTCLK and WTIS
bitfields. Since each test spins up a new instance of QEMU, this is
rather an expensive test, especially on loaded host systems.
For the normal quick test mode, it should be sufficient to test the
corner settings of these fields (i.e. 0 and 3), so we can speed up
this test in the default mode quite a bit.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_watchdog_timer-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm7xx_watchdog_timer-test.c
index 4773a673b2..981b853c99 100644
--- a/tests/qtest/npcm7xx_watchdog_timer-test.c
+++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
@@ -172,9 +172,10 @@ static void test_reset_action(gconstpointer watchdog)
 static void test_prescaler(gconstpointer watchdog)
 {
     const Watchdog *wd = watchdog;
+    int inc = g_test_quick() ? 3 : 1;
 
-    for (int wtclk = 0; wtclk < 4; ++wtclk) {
-        for (int wtis = 0; wtis < 4; ++wtis) {
+    for (int wtclk = 0; wtclk < 4; wtclk += inc) {
+        for (int wtis = 0; wtis < 4; wtis += inc) {
             QTestState *qts = qtest_init("-machine quanta-gsj");
 
             qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
-- 
2.43.0


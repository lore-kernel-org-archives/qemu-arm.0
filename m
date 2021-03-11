Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp716500lfg;
        Thu, 11 Mar 2021 15:15:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkCX3qLVP25ul3ObXWE+CIXj9S9pbUXTR3xMBe7LUjKD6DOcX7fujXYVWxl2HVIaoXMmAg
X-Received: by 2002:a92:1a51:: with SMTP id z17mr615907ill.295.1615504527227;
        Thu, 11 Mar 2021 15:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615504527; cv=none;
        d=google.com; s=arc-20160816;
        b=th81cgtbHXOyjtw4SEnVBgi9D9uQjQqc+I47MPDB5rmpG1w1cuI+sC1wfVHUmOEFek
         EqaYFRvYgMX6h4sbCA+tQrZ4J7Hi4OoNyR6+tuMTwrqL/TQIbeQ+8g562hTpZyYZI0xh
         jo8k/0SC8mvKABBGmlV6rGVrcBsc1byhSibBYVLkfiO4iBSS6lPurwtDR+e2ljaUqa1s
         IZOZk1yMyXW79swImA0YA42qtKuR6yUzsXT78+PzLoeBv5YjK+QjjaKw0Prv3n0eCUj5
         0Q7bWaoIHhqk6TOHNyqv36I9Ec1eJamFsDfi9z+i5mwW4w50YsBUYRrU2eDgWNowz0Oj
         Ttyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nCMOis7blvx2AGe7FC9c1Tgf4rXmZrQipdbYJNU+L/o=;
        b=pG9NuK6oefdyPsZ0Maqf1u/IeyCT9sJ+5sH6UhGtx0w8HBi3zKqD2l8pwkNZKWpmZz
         l43wfK7NsY1LYPtt3gfN/ZXpjU8h91/m2eprRIBj8piTDknw3XRBZjCoywjWirtwv8Sg
         Npb7qmk0h7E2jyTrSPUes51cyZZRbviwxJziqaSyU/NkeUs8Rv1nxMMdqsSuwPkuQucz
         6qjRWk+ohYi/dse5CtlXd45qCQYt9xkmuevkBleZokjAolvKPEa6xzDXgkCCC7JPfGK+
         IsEGZKK6sE74ite3vfokXQUTBbc+r1gTXt3/xI6Mux2lAu2VxVksUhmOzP5bg0tH2Usx
         ET8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bkMEq8IK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si4024355iol.61.2021.03.11.15.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 15:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bkMEq8IK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKUWc-0005pJ-Fy
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 18:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTy-0001o5-Dh
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 18:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTh-000534-4U
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 18:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCMOis7blvx2AGe7FC9c1Tgf4rXmZrQipdbYJNU+L/o=;
 b=bkMEq8IK9Wnm9f1tJ2hKI7jZAsQbzD/BExQ/XfsRwazQj6F3895AlBpIE3TD3CEoUvcR6D
 JdFq12VU0IHwkFcst48tYSJsJGSkQf/nrfi5obCoHzV/Hr311v2FgFfdVguVSI1UM4WypL
 Sq+xKiRfFd56/foxuSa71EcwOPBiJxI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-1GknG8vwP-aiBficw1jcCg-1; Thu, 11 Mar 2021 18:12:22 -0500
X-MC-Unique: 1GknG8vwP-aiBficw1jcCg-1
Received: by mail-wr1-f70.google.com with SMTP id 75so10159646wrl.3
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 15:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCMOis7blvx2AGe7FC9c1Tgf4rXmZrQipdbYJNU+L/o=;
 b=hpvZCdrAoiqmm/6fM3f+jnTVd8ekoWMgHLoGKKWPPdYWTIGdrW/wwX2BAmeX5YdhgW
 QJfmp+9lRCFaS2BcKWVPfWb0M2xXHeSUpHV+XORDudHMMsBRc/4oia4GV+ZSTVlMfxqX
 6JimFWuI09wIyqFo0YcW+02VigORpSrczk7qDUmx6YLp1+IRt9iOFhVfWeYazXKvtP+I
 xYLoytq5Suz6IHQsTNIz4fo61U8hFFA6cv29W2hjd3+0mdn+yxD/7bcSKSYBrtSczM0T
 q0QFC+yqZwP0pKSiDM5JKcCRefhQzvSRnZSO9xIYIck4orpD4NVfuTsOcPSY2Bxif6iG
 F/pw==
X-Gm-Message-State: AOAM532iNydOcduky4+tC+8Dp6h1wRTUAjIAs/krpw/9BSphzf4J+9UE
 yeI/roolz42Cqc5j3Gc+qhx3tTQc+cfwuAhVQZi6F5YM4YTR1KnQRhyNmwVO6g3OVu0nVlLnwyN
 WcZcmeh8YzrAc
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr11500899wrw.247.1615504341243; 
 Thu, 11 Mar 2021 15:12:21 -0800 (PST)
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr11500890wrw.247.1615504341101; 
 Thu, 11 Mar 2021 15:12:21 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm291253wmd.41.2021.03.11.15.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 3/6] qtest/bios-tables-test: Make test build-independent from
 accelerator
Date: Fri, 12 Mar 2021 00:11:59 +0100
Message-Id: <20210311231202.1536040-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v40hZXbpdNro

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, we can remove the #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a5..73378f9da94 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -718,15 +718,13 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
-
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
+    if (data->tcg_only && !qtest_probe_accel(data->qts, "tcg")) {
+        g_test_skip("TCG not available, skipping test");
+        goto done;
+    }
+
     test_acpi_load_tables(data, use_uefi);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -745,6 +743,7 @@ static void test_acpi_one(const char *params, test_data *data)
         test_smbios_structs(data);
     }
 
+done:
     qtest_quit(data->qts);
     g_free(args);
 }
-- 
2.26.2


Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2095723lfk;
        Sun, 24 Apr 2022 20:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym9d+00wx7BXeZ0wtID3Drg4x2Q8jYkXi39RjHpzOYEi3l37YaZvNVD3FoMPrj8DJsELad
X-Received: by 2002:a05:620a:12c8:b0:69f:6117:f154 with SMTP id e8-20020a05620a12c800b0069f6117f154mr865199qkl.551.1650857530897;
        Sun, 24 Apr 2022 20:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650857530; cv=none;
        d=google.com; s=arc-20160816;
        b=iY5ybqGlrN/1yl/yoPIW6s0AYcUAXqICyoPeW7jlIjq+8WNIleuL5fSew4JSALkOAl
         IJ+OhdryCwEUyJqEaU5aRBw68Oxx0EIn4L2btjF+6vVrWZ3oi7CMmr4D00yRUdvMEkPG
         pc7Hbpp510UIF7R4eVDSjHQSPdNJMy7n1VkpEHwzIlIZGdW+/NDC6QE3XKqUdUT2tEbn
         fupk6ke7TMi2GX0i6OdfC8rgwlfVm3CoFmrHdjd3/3W743wS62aQkP5sNF1LCd2mf8Dp
         tn2tJRcEd3MBEU8aRic/wU1k1vWNlA5cPfzH6oyB3TyWDXTJJuvKnA+4WK0UMa3mtEEt
         04+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:dkim-signature;
        bh=uoHhIJ4R/67fuvZggh2sr/0tlBmhhnLYLXRVqyhFjss=;
        b=x7UP/HHKD7QXFDAKaV1CbgW9RBJAe7zFGI+vKAMgVkLgKvROh0nQfEGYUx/anydJNP
         4CVku99Egf8h6eXbsvR1zhh5a372JSZx1jbjaE+YdTxoRFLALRUS1UyQq8F+DTFZoHAu
         KK7umhXCkORxOycJxDK0vjTq96Aq1rOhUR+RTuhSTWdie+xK+bac3V/QwyIcxbovfJTo
         GvmtlZsi+/2/4TXlGtoBK0cr3G8g6p6/deB2YJH4am4nWNCbp8hRo2cONCQzv1JSxJT2
         kKce52YZDFfna2jw0B1eZZjEllrRrK1hEjo2x/xMcI2tiedryTS9rgbJaAk3bBIdGI7t
         PADQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ql2FtxDd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ac85f82000000b002f364692fdbsi1014953qta.20.2022.04.24.20.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Apr 2022 20:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ql2FtxDd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nipSM-0006QQ-5x
	for alex.bennee@linaro.org; Sun, 24 Apr 2022 23:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQ5-0003PN-V1
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 23:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQ3-0002QA-AB
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 23:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650857386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoHhIJ4R/67fuvZggh2sr/0tlBmhhnLYLXRVqyhFjss=;
 b=Ql2FtxDdSCAB8sdp7vsYwMFXjXIFb5M4DNQnpcDO/ZZ0MDkCcth2tNc+49BygF7k6SZcAs
 N7Kbfd1P55H5sFIS6ttF1ky/z9D314I2FcaLNBmSy8Rhts1NYlDnaclH6Vyj+3yOxdI2ON
 RJ4YPMZFtpauTQl3EBL6u7ifAk6XL4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-vgWVbO2gMqSIeoVDGJGAmw-1; Sun, 24 Apr 2022 23:29:43 -0400
X-MC-Unique: vgWVbO2gMqSIeoVDGJGAmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF37E185A79C;
 Mon, 25 Apr 2022 03:29:42 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EAE91468940;
 Mon, 25 Apr 2022 03:29:34 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v8 2/5] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
Date: Mon, 25 Apr 2022 11:27:59 +0800
Message-Id: <20220425032802.365061-3-gshan@redhat.com>
In-Reply-To: <20220425032802.365061-1-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lbV3y8cBw+9q

The CPU topology isn't enabled on arm/virt machine yet, but we're
going to do it in next patch. After the CPU topology is enabled by
next patch, "thrad-id=1" becomes invalid because the CPU core is
preferred on arm/virt machine. It means these two CPUs have 0/1
as their core IDs, but their thread IDs are all 0. It will trigger
test failure as the following message indicates:

  [14/21 qemu:qtest+qtest-aarch64 / qtest-aarch64/numa-test  ERROR
  1.48s   killed by signal 6 SIGABRT
  >>> G_TEST_DBUS_DAEMON=/home/gavin/sandbox/qemu.main/tests/dbus-vmstate-daemon.sh \
      QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon         \
      QTEST_QEMU_BINARY=./qemu-system-aarch64                                       \
      QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=83                                  \
      /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap -k
  ――――――――――――――――――――――――――――――――――――――――――――――
  stderr:
  qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found

This fixes the issue by providing comprehensive SMP configurations
in aarch64_numa_cpu(). The SMP configurations aren't used before
the CPU topology is enabled in next patch.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 90bf68a5b3..aeda8c774c 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=2 "
+    cli = make_cli(data, "-machine "
+        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
         "-numa cpu,node-id=1,thread-id=0 "
         "-numa cpu,node-id=0,thread-id=1");
-- 
2.23.0


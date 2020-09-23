Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp470671lfq;
        Wed, 23 Sep 2020 06:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwks+cJygrE5ev5z/YAYHyxSw3dKLODiWf6fkOeVk6cSDpZrjDRARYzTZjSmFnIVzeiqxsV
X-Received: by 2002:a25:2683:: with SMTP id m125mr99534ybm.38.1600868454655;
        Wed, 23 Sep 2020 06:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600868454; cv=none;
        d=google.com; s=arc-20160816;
        b=E4UntXN+UD481n7tQbjvE+kJLiK+rBuCZslr8C3e43zj9Fd5PnZHMfB27yosOPQfi0
         RD5g+qC8Ip3anS9QCZ2uz+e3vevCwHhZkAr2C1tfYuVODn+5WaPF03+0Xb/6LOr3JqoI
         ieHnq0HmQenYJXs033X9LDF5KeOlbn3M2zaKjtJm7an2QijV/zDAF9GusuUR9FiANLQF
         pNjx4CS3YNhG6j9cqq0YCwG0Kd0PCuY4k/fIRyqGo3hHp9VqFD3rX4QP+nkuLBbohr77
         PpQhiJBtRyRSEAljEJEBap5gNTLo+yHip+DuyzlXVvjlJENNEZqBe510yzModwvyaxgv
         Xa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oi4oV3Xsy5ZeUaCWVzh/DLdC08IxX7F0TM96NbBv1Mw=;
        b=gtKoqNBUOOI2pSGNa5p4CrQ9+j+7p3DLTCJpyOCruc1ttb5rPU21fjyiAoFJPkpie7
         rw3RLv9NnqdUuvC8yQ1BKXLYsFXuaPtDf8LxetR96TOGbGat/cuTE56FDCB3EuIw5avF
         wpGK5mvUeyrXAy4kgszfaNemwxBIUk/H3vDBog8iap+5R2A/CWYFucQqOPSYy3s5UJ8j
         fgOP+gNE4l6D//wIHQ6H/atACrAxci2jhYOCBsgi/rQPN3p1+rUS2I5jQwjg/eZaZVSL
         uY6I0POjWNyUEhBTRo9vB85cE1tpdIEdGgpDDKF/ohoDOY05sJE66f7yzOUMwqUdRdM7
         7XCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QC7QLtMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si24448ybb.325.2020.09.23.06.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 06:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QC7QLtMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kL50w-0003qT-2H
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 09:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL4yo-0000YY-VL
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 09:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL4ym-00061D-Ow
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 09:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600868320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oi4oV3Xsy5ZeUaCWVzh/DLdC08IxX7F0TM96NbBv1Mw=;
 b=QC7QLtMZWObHqIkQUl0UdCGKI1qITvrgPHXa1DobhALsPFYFgEexq2Z9TbsD10JYUZNXIZ
 uBZUqUvLKhMC5ybg9P7EaI+FHwATUUg4QLWKni8JlrGWn4mBGcllQPpiyeKQ/rn/C2MGVv
 tZmiZfmZthxZI3o5Rm2RbWQKUc2AB1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-LxmbRGm2NR2ZhuU90UX06w-1; Wed, 23 Sep 2020 09:38:36 -0400
X-MC-Unique: LxmbRGm2NR2ZhuU90UX06w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D4B11891E82;
 Wed, 23 Sep 2020 13:38:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-73.ams2.redhat.com
 [10.36.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A11660BEC;
 Wed, 23 Sep 2020 13:38:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/smbios: report error if table size is too large
Date: Wed, 23 Sep 2020 14:38:03 +0100
Message-Id: <20200923133804.2089190-3-berrange@redhat.com>
In-Reply-To: <20200923133804.2089190-1-berrange@redhat.com>
References: <20200923133804.2089190-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C26UQ3Rzl0hM

The SMBIOS 2.1 entry point uses a uint16 data type for reporting the
total length of the tables. If the user passes -smbios configuration to
QEMU that causes the table size to exceed this limit then various bad
behaviours result, including

 - firmware hangs in an infinite loop
 - firmware triggers a KVM crash on bad memory access
 - firmware silently discards user's SMBIOS data replacing it with
   a generic data set.

Limiting the size to 0xffff in QEMU avoids triggering most of these
problems. There is a remaining bug in SeaBIOS which tries to prepend its
own data for table 0, and does not check whether there is sufficient
space before attempting this.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/smbios/smbios.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index d993448087..8b30906e50 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -365,6 +365,13 @@ static void smbios_register_config(void)
 
 opts_init(smbios_register_config);
 
+/*
+ * The SMBIOS 2.1 "structure table length" field in the
+ * entry point uses a 16-bit integer, so we're limited
+ * in total table size
+ */
+#define SMBIOS_21_MAX_TABLES_LEN 0xffff
+
 static void smbios_validate_table(MachineState *ms)
 {
     uint32_t expect_t4_count = smbios_legacy ?
@@ -375,6 +382,13 @@ static void smbios_validate_table(MachineState *ms)
                      expect_t4_count, smbios_type4_count);
         exit(1);
     }
+
+    if (smbios_ep_type == SMBIOS_ENTRY_POINT_21 &&
+        smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
+        error_report("SMBIOS 2.1 table length %zu exceeds %d",
+                     smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
+        exit(1);
+    }
 }
 
 
-- 
2.26.2


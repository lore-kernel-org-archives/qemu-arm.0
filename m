Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp546747lfy;
        Wed, 19 Aug 2020 08:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBaoFx52CJICxqddudJoWmaJlTpyCr2ARB4KOUBci1jYPucuxN134btRh+HFqC0jwKLEIb
X-Received: by 2002:a25:70c1:: with SMTP id l184mr33319275ybc.87.1597850614220;
        Wed, 19 Aug 2020 08:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597850614; cv=none;
        d=google.com; s=arc-20160816;
        b=S3psiIXJXTriBgQ7167EXsYifpKFkmTiUY3akBa/kqkCcO1GTQpAqRu2MirefCBF9U
         E35iRuQ25iXhOHWqggusPgmuj33TMx21zGzfF4JorDOoiUmhArIHgwhskdmjQPxdEuMO
         H+POElZ9sPXBAHZwD/8Cj4GDHqclZG6RiWP7N0x7aIKinOliZU4Ar3gyfu0qwwYc3jw5
         215+SxCPSsqRJv9vDHIDe+OuTg/Nj6xRjYS6AlgV86xT8in8+uA5P8Tx5L2zXyJgT9oy
         d7cWhIfqkWRu929FzZbCZXYiMbjpw+dB23S8ajqfMab4AB1J5pXGYmo4WAM1rvQ5beQV
         k0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wGorU/6GZMWrstCQWJaP84CHFXi4dSIi8ZH+Ss2AFdE=;
        b=jH+S0z4FbJuD0RSvM46SBQQGTCwSnof74MFoVtW6kwWxIPQVVG9RofXhPVy9v5Uifc
         lm3ouhvOZCFSL7a4EL3onSIc/3BNcS6rbLr7//Z9Sx39sYZtfhi5Pjr7pYuh7Wdkcxoo
         /mUD9FQJMIcnl9+Bn8HitMJcw/CRDm+s1vIdrgWnUQ7VaaFjRd0WLq8c/WUKZ1q52pUT
         WjUU4yGe806tzSJYtFcU82fv0ixsedvsgYx2kaRbVnW5Pcj6s/pKEzMOx5bCs+3clBTl
         XLF4mcT3Ml2LcALG4l72LbY7aebVPIYMbTk5GdVnN9nNwomvtHNnHn5qMq7FPncvNvJE
         1lVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D/DePV7B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si29118900ybe.431.2020.08.19.08.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 08:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D/DePV7B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Pw5-0008Qj-Hh
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8Pvv-0008KN-56
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 11:23:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25904
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8Pvt-0000I5-9B
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 11:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597850600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGorU/6GZMWrstCQWJaP84CHFXi4dSIi8ZH+Ss2AFdE=;
 b=D/DePV7BIOfngpezC2oSkX+PxJ3KaMwh+HsHB0j57HnDrk/pIL7T0V/2MVlTBYpUIjIlOx
 6fYJ8ZAq4fojvhnMUvdtbWtxCymN4xCGS9iZ0GOVFlVlw7FDtJD4MWCTtoUFvjCxyiMhmE
 aCcugLnjOrKOcDulV96WZipuVLrpkD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-fXf2v10JNJKrtgKKQYWdZQ-1; Wed, 19 Aug 2020 11:23:15 -0400
X-MC-Unique: fXf2v10JNJKrtgKKQYWdZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4E0181CB07;
 Wed, 19 Aug 2020 15:23:13 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5359D5D9D5;
 Wed, 19 Aug 2020 15:23:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/3] qmp: Expose MachineClass::default_ram_id
Date: Wed, 19 Aug 2020 11:22:57 -0400
Message-Id: <20200819152258.703874-3-ehabkost@redhat.com>
In-Reply-To: <20200819152258.703874-1-ehabkost@redhat.com>
References: <20200819152258.703874-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9y9I2NeTwxQW

From: Michal Privoznik <mprivozn@redhat.com>

If a management application (like Libvirt) want's to preserve
migration ability and switch to '-machine memory-backend' it
needs to set exactly the same RAM id as QEMU would. Since the id
is machine type dependant, expose it under 'query-machines'
result. Some machine types don't have the attribute set (riscv
family for example), therefore the QMP attribute must be
optional.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Message-Id: <9384422f63fe594a54d801f9cb4539b1d2ce9b67.1590481402.git.mprivozn@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
[ehabkost: updated doc to "since 5.2"]
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qapi/machine.json          | 5 ++++-
 hw/core/machine-qmp-cmds.c | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 481b1f07ec..abc6fd0477 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -357,13 +357,16 @@
 # @default-cpu-type: default CPU model typename if none is requested via
 #                    the -cpu argument. (since 4.2)
 #
+# @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
+#
 # Since: 1.2.0
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
-            'deprecated': 'bool', '*default-cpu-type': 'str' } }
+            'deprecated': 'bool', '*default-cpu-type': 'str',
+            '*default-ram-id': 'str' } }
 
 ##
 # @query-machines:
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 963088b798..21551221ad 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -238,6 +238,10 @@ MachineInfoList *qmp_query_machines(Error **errp)
             info->default_cpu_type = g_strdup(mc->default_cpu_type);
             info->has_default_cpu_type = true;
         }
+        if (mc->default_ram_id) {
+            info->default_ram_id = g_strdup(mc->default_ram_id);
+            info->has_default_ram_id = true;
+        }
 
         entry = g_malloc0(sizeof(*entry));
         entry->value = info;
-- 
2.26.2


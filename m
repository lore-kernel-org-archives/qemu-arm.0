Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp109686lfb;
        Tue, 31 Aug 2021 21:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxfwudozBa4TGg1GZXHw3NdMpFIg0oIxgU+GzKYtQsu4EAEiHNYHwp+nJAwQcI+CCt4/uT
X-Received: by 2002:a05:620a:b0f:: with SMTP id t15mr6530560qkg.352.1630470131658;
        Tue, 31 Aug 2021 21:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630470131; cv=none;
        d=google.com; s=arc-20160816;
        b=vyQMZEtWMw9jXL59uwakzLzam8PuNiIdOUJs0WOL36QS4WiQmemnqh1yBf2qED7v0+
         vaMxeFepq1XH/XNRldwWvafp45E/TIxV2BkUrqnZVbCis6sTtOuNWi0YtpR9RHry/XH6
         4pDIjHvJDHuRduzyu3nsMg1iidsFFQ/QAjmtYsjn+2Hvk67en/wA/sVr6XFLKHD7z2ni
         +gEnrbA1Y3OlQnlSIuqTYcBmQbpfI8SwKI1m+raOb87O1nn5szZqP7hlHB1qRt9uQzkM
         FU0TtN3JDJ3W5mWpqgaL6dapohBIK+PL2PAsS59UqwKRS2lp5dT/iIw/fY/syWFNuYxS
         3mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N7iWJX5rZcaKv3HDBPNmpCLRyD7YNvjEVi6LfD4Sk0c=;
        b=LEgXS98R6XwWF8B9uX7IlDCv3QRJS1LOv6TIIm+AmqqHAHy9H+7mIFyrWvH6GgLxxT
         IMKXjPxpfiHN0W3ffdYzpPH22ZO+hktLCeu8EzoF9s4av3tPamrxpQ1sNUDKhMta8uwh
         G7Isesl3Dq24c8ui2OAsKgvnQBs/LMyrVh5M3d15e7iVl2bOMFFl9XtKM6+WODUo34yO
         xXm3tBGxYGMGjsveEYo6bvI43XqxplPsm65dLwfyfjq/Oo/Y/Q2+S+vk/ntGhL/ek+tF
         Le8OJ7jUt/+BGhCQbk67CO8/HfyyIiIjSCsSHY7sBtnoWzuHHReoLEvJP6S53XGzr51K
         LTSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dlvuoYVZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si13166946qto.211.2021.08.31.21.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 21:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dlvuoYVZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLHlK-0000wP-Tt
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 00:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHj2-0006VN-RS
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHiw-0001jT-B3
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7iWJX5rZcaKv3HDBPNmpCLRyD7YNvjEVi6LfD4Sk0c=;
 b=dlvuoYVZe0TF+F6m2M/0r2A8VIRzcXDT7CXpp/H2NySTN+HvK8KTnNMUVUyhp/dSVpMs9d
 0OaMRhIDXUg/rJPLSR7BCKAQf1IVi0zYtt3/DtKaugMFyW/bsxrJ15UZr/F9gXawupcwH0
 7zTZa42y4zBVdspE42puT3xmqovRwMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-jUh_jpxBNJSx4kcJ3lxNNA-1; Wed, 01 Sep 2021 00:19:38 -0400
X-MC-Unique: jUh_jpxBNJSx4kcJ3lxNNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D8ED10509F6;
 Wed,  1 Sep 2021 04:19:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6869A6B541;
 Wed,  1 Sep 2021 04:19:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D5D718009F3; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
Date: Wed,  1 Sep 2021 06:19:02 +0200
Message-Id: <20210901041903.3111086-6-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WW43FlyIk/Dp

From: Qiang Liu <cyruscyliu@gmail.com>

xlnx_dp_read allows an out-of-bounds read at its default branch because
of an improper index.

According to
https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
(DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.

DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.

In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
will write s->core_registers[0x3A4
>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
rather than 0x3A4.

This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
but does not adjust the size of s->core_registers to avoid breaking
migration.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/xlnx_dp.c            |  6 +++++-
 tests/qtest/fuzz-xlnx-dp-test.c | 33 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/fuzz-xlnx-dp-test.c

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 2bb7a5441ad1..9bb781e31254 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -714,7 +714,11 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
         break;
     default:
         assert(offset <= (0x3AC >> 2));
-        ret = s->core_registers[offset];
+        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2)) {
+            ret = s->core_registers[DP_INT_MASK];
+        } else {
+            ret = s->core_registers[offset];
+        }
         break;
     }
 
diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
new file mode 100644
index 000000000000..69eb6c0eb104
--- /dev/null
+++ b/tests/qtest/fuzz-xlnx-dp-test.c
@@ -0,0 +1,33 @@
+/*
+ * QTest fuzzer-generated testcase for xlnx-dp display device
+ *
+ * Copyright (c) 2021 Qiang Liu <cyruscyliu@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+
+/*
+ * This used to trigger the out-of-bounds read in xlnx_dp_read
+ */
+static void test_fuzz_xlnx_dp_0x3ac(void)
+{
+    QTestState *s = qtest_init("-M xlnx-zcu102 -display none ");
+    qtest_readl(s, 0xfd4a03ac);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+   if (strcmp(arch, "aarch64") == 0) {
+        qtest_add_func("fuzz/test_fuzz_xlnx_dp/3ac", test_fuzz_xlnx_dp_0x3ac);
+   }
+
+   return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2bc3efd49f94..757bb8499a23 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -187,6 +187,7 @@ qtests_aarch64 = \
    'numa-test',
    'boot-serial-test',
    'xlnx-can-test',
+   'fuzz-xlnx-dp-test',
    'migration-test']
 
 qtests_s390x = \
-- 
2.31.1


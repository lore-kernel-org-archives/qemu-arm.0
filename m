Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp475995ejc;
        Thu, 23 Feb 2023 00:15:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+nBlDmav26sY96+iK9lOgvHhPXoYK9LCLsfhpwZwkeUVTlSuR8Doau+gNdc3dlafys5LFn
X-Received: by 2002:ac8:5990:0:b0:3b8:6b0c:9fd with SMTP id e16-20020ac85990000000b003b86b0c09fdmr4441157qte.44.1677140153776;
        Thu, 23 Feb 2023 00:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677140153; cv=none;
        d=google.com; s=arc-20160816;
        b=Gv1imzDBnbCofDNvXgLViWRjYVVtO31E07Q7N5e61Gl8KyYUfp1biUKLdCL993EsB3
         g7UFEe2j4yqF/l9tzrMaYPHSnRzE2f2iOEzt5r14IOLP3ubSFV/C78DP4A2ZgbKAmJkJ
         nN9BrwjPgs79JHeHKmKdCPVucxaF8iFcygWk4oB5ZN4/de0PsWB49AhaA0/c7Ap0LqUj
         ZZkdp/p9OvLtXIW7KOKMg+L/wYgWDbV2meXxlHCvRHDLF3jBtSQplhJEAZdJrbjcHpaY
         iLwIXgS6WizLV3fgX2IR3xXWJYMRbUT60nxDrNJEKxq9LdyvYrtxlj8HEozq8vhsJ5Bd
         XB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N93heQF4SVVlaYuxobhHpAFpD9Mv4hw0bmrbFiLSBLo=;
        b=hrmW3R3LBl9mYuCJ7MQogn5HxKyhvmvj7LK6JkXW4Rv5DoKSoid+pjRuc9+zfd5Vr0
         jxUSGLMTjJFXnwfzWsL91GtQUzN8SnEyLdx+vI3T0lSZuUa7J2Id6jKSe1X+ZULsFcBt
         FMOIR1lwlcJOwMST9VXiUxRWvVSaGc41TYw/eQ7NJMrqTufXDVHNKQIh2N3cfkhx9oVP
         D5YkN4DvrDzcLntHO38Y6KidW0UD+xYTePTpanc9SdfQHM3Mkj7rmbtmYKEFE3Q//2m6
         PMPO4Ur1rRZorJWnChqEg5FRQL/GW3IXEIS9xD2MqmkjO00p+cxiFcX/eYbY8iuz3fmW
         Qjwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BEiXGKQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ae9df01000000b0072dcddbd03asi55180qkf.755.2023.02.23.00.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 00:15:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BEiXGKQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pV6kQ-0003XQ-EQ; Thu, 23 Feb 2023 03:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kO-0003Wp-KW
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kN-0001EW-6w
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N93heQF4SVVlaYuxobhHpAFpD9Mv4hw0bmrbFiLSBLo=;
 b=BEiXGKQ0Aj7ZImlPAnhQtqp8puvAXWRHXDPzyT6Y1iyEVv8BBaqoWSnFciu92k6VTubgiQ
 86NuDgbW3dBKTZgCb1TePRnawmLtTTwUwdBDC35yn2UG6GLCf7Yktl6eVQoOB8MqYgGBMj
 vZubgUTnK7krxG69quZ8Q3V01witvmQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-Br5-GpZlNDG1AeyYhnmSMg-1; Thu, 23 Feb 2023 03:14:28 -0500
X-MC-Unique: Br5-GpZlNDG1AeyYhnmSMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08A23101A55E;
 Thu, 23 Feb 2023 08:14:28 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40CDC440DC;
 Thu, 23 Feb 2023 08:14:21 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 1/4] qtest/numa-test: Follow socket-NUMA-node boundary for
 aarch64
Date: Thu, 23 Feb 2023 16:13:58 +0800
Message-Id: <20230223081401.248835-2-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1lfcfUHS6i35

After socket-to-NUMA-node boundary is applied to aarch64 in the subsequent
patches, we need to explicitly specify 'smp.sockets=2' for 'test_mon_explicit'
and 'test_query_cpus' test cases. Besides, 'test_mon_partial' isn't applied
to aarch64 any more.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 tests/qtest/numa-test.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index c5eb13f349..ebfd522af3 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -25,7 +25,8 @@ static void test_mon_explicit(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=2 "
+                         "-numa node,nodeid=0,memdev=ram,cpus=0-3 "
                          "-numa node,nodeid=1,cpus=4-7");
     qts = qtest_init(cli);
 
@@ -87,7 +88,8 @@ static void test_query_cpus(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram,cpus=0-3 "
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=2 "
+                         "-numa node,memdev=ram,cpus=0-3 "
                          "-numa node,cpus=4-7");
     qts = qtest_init(cli);
     cpus = get_cpus(qts, &resp);
@@ -565,7 +567,12 @@ int main(int argc, char **argv)
 
     qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split);
     qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
-    qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+
+    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64") ||
+        !strcmp(arch, "ppc64")) {
+        qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+    }
+
     qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
 
     if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {
-- 
2.23.0


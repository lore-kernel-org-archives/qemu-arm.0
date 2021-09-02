Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp145246lfb;
        Thu, 2 Sep 2021 04:04:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlUhMoGtWQnzMzopxS+h5hGX/i9Hga+CDFE6poayHuJLoIluwQnBKzgW3DczeVh2jxN6r1
X-Received: by 2002:adf:b7cd:: with SMTP id t13mr3075540wre.63.1630580646264;
        Thu, 02 Sep 2021 04:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630580646; cv=none;
        d=google.com; s=arc-20160816;
        b=LCRculBxzqGcuGaSAtXRcmjUqQz2vycU5d7UN+Lmpm7yS+8SREcUb5sziQGpvM+WJi
         OU1SjFz+y++VBs+a6qk0aBw7C4k2ezyu3IwIMSUtx4/IlnIaJuYC62mWMP9U7agz9wvO
         V7UjkkfIwuJLjdYRWW+v0o7exDRatx24LCz/LXHQX6RT12Fj/8nOE6NynSciMFv8D06F
         y9vVV+0z3ROZVI9/uzjXDSXswn7OJdlItKGRqd+ZpEqhmFYbmSAyfn0cxk5HpzEgkPcR
         To6G9pXaYfCuRevsS5msIGLk7taBivpYyiiQF+b+QlFFbw7FlAJYj1TNIwdLcht7UEoZ
         Uiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=u4yPDQH09gRIUI0qZ1XPgfvKTrF19igTpD2YCepyEpE=;
        b=UsjW7ntfk68sRf66J0+UHOrtftB4nUOfOxnwEqS0SSoCR1/ykqplCSaoamli95dgjy
         rv5+iFWtFVIjAD2ntf9om0zxxr8xPPG4iTBumdmqK4ZVi513rr2VBjQ3naX0HiEVLraH
         1P9CHPJ6xU3htvhZzV3vgFw8eni/5Z57L48mZMhwwaeAoh80R6r9uZSFQJGXl3q9FFiN
         YBpdIelP/KF64Z0+xje+DbT/A9oZ76FjKk/1P3N59OJZI7IGSPdZib/54BfRdNxZqfL/
         4Dy5J0HHSwqVazoOzuDdfyOdBoxspladH5nkfURS5NOL029QNWWK0ADmr1Pp+Wt9DGKT
         dorA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si1585914wmg.194.2021.09.02.04.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 04:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLkVp-0006uc-5k
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 07:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVX-0006tq-4J; Thu, 02 Sep 2021 07:03:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVT-0003WZ-I2; Thu, 02 Sep 2021 07:03:46 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H0dGZ5yV0z8xd7;
 Thu,  2 Sep 2021 18:59:18 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:34 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:33 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 01/14] machine: Deprecate "parameter=0" SMP configurations
Date: Thu, 2 Sep 2021 19:03:17 +0800
Message-ID: <20210902110330.18036-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HzRiYtEM+un1

In the SMP configuration, we should either provide a topology
parameter with a reasonable value (greater than zero) or just
omit it and QEMU will compute the missing value.

The users shouldn't provide a configuration with any parameter
of it specified as zero (e.g. -smp 8,sockets=0) which could
possibly cause unexpected results in the -smp parsing. So we
deprecate this kind of configurations since 6.2 by adding the
explicit sanity check.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/about/deprecated.rst | 15 +++++++++++++++
 hw/core/machine.c         | 14 ++++++++++++++
 qapi/machine.json         |  2 +-
 qemu-options.hx           | 12 +++++++-----
 4 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1e1a5e96ad..3e9e655129 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -138,6 +138,21 @@ an underscore between "window" and "close").
 The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``-smp`` ("parameter=0" SMP configurations) (since 6.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Specified CPU topology parameters must be greater than zero.
+
+In the SMP configuration, users should either provide a CPU topology
+parameter with a reasonable value (greater than zero) or just omit it
+and QEMU will compute the missing value.
+
+However, historically it was implicitly allowed for users to provide
+a parameter with zero value, which is meaningless and could also possibly
+cause unexpected results in the -smp parsing. So support for this kind of
+configurations (e.g. -smp 8,sockets=0) is deprecated since 6.2 and will
+be removed in the near future, users have to ensure that all the topology
+members described with -smp are greater than zero.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528..711e83db54 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -835,6 +835,20 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Invalid CPU topology deprecated: "
+                    "CPU topology parameters must be greater than zero");
+    }
+
     mc->smp_parse(ms, config, errp);
     if (*errp) {
         goto out_free;
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..10a97837d3 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1297,7 +1297,7 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @cores: number of cores per thread in the CPU topology
+# @cores: number of cores per die in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..aee622f577 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -227,11 +227,13 @@ SRST
     of computing the CPU maximum count.
 
     Either the initial CPU count, or at least one of the topology parameters
-    must be specified. Values for any omitted parameters will be computed
-    from those which are given. Historically preference was given to the
-    coarsest topology parameters when computing missing values (ie sockets
-    preferred over cores, which were preferred over threads), however, this
-    behaviour is considered liable to change.
+    must be specified. The specified parameters must be greater than zero,
+    explicit configuration like "cpus=0" is not allowed. Values for any
+    omitted parameters will be computed from those which are given.
+    Historically preference was given to the coarsest topology parameters
+    when computing missing values (ie sockets preferred over cores, which
+    were preferred over threads), however, this behaviour is considered
+    liable to change.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.19.1


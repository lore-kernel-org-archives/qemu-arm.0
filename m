Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2789362lfp;
        Sun, 26 Sep 2021 01:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9oi1J4itKMcYdu65JD3v/8mK82FJBuZyoTi9QF21ytaB/hGRD6sqNvl0Ud39QR9H1RTI8
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr14855731ilv.249.1632645999198;
        Sun, 26 Sep 2021 01:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632645999; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWMxHajlEmRN5v7P2VCs3QTyllr4ykPufb9vCd0k5xEmWenyMWcAlCWHpkp6ukDhND
         wtX8i7ePg2cts4vcRmoklRAZFj7xy9jUF0ruwcTylGG7oAfZrTKnEwFZ7GsXdcmhbYt/
         HWLDz0QLZ6zO7nWccFShUOpDqRhpyeNTVtQzfXWwrYPA8G6klR+aeFtPrSdF6no6uJ3Q
         8XQYeOmz8EU/CKJiSpVjv2Vuh5aguhYGKNPvvhUmTtRkaLZyER4UYWCQIEQvPkgBRiHL
         7GAeP/bdArk8Wb+gKqnpYDM3EVfRXgMcGoEObpi/Js6PHu3zcTNNyKXsYVfs2YbpuA87
         /GEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Ve/oHzg4YlI/TX0DYoXX0SPl5rYLQSlUjjPeWlkdw2A=;
        b=dHHrcQepPl/Mh1oxcd+mGgGT04vaySNBkbWU/HEsbSZ6khvoJcwYXBBVVlRAMP+TPz
         VrDVo9/No6ZZC9xjRpkES+NoYxD18x8wmf4Zk3mQh2dagUwnewbH2vtbVzqcTYQOqI0v
         ecgw+1f787Hz6dCTvzwVwtAiKCzefnzmricGI2lRgTr4zwNsgpKtS+0ou7CNAHNBEp1a
         56B7sgRuhAtmT3gK9jWMlO6fAwO5222trWtrdl+lmuS3M9FHuphs7gh10UXcS8pahoQM
         lE1+wFL3ufkcyYjBxijTN8kQDlxAGwlgNWZx+9P7XgLUZ9MBWGTC6GCMJ7Bhrqy1/+iQ
         SU9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k39si18394915jav.88.2021.09.26.01.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPnx-00061c-Io
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnL-0005w6-MB; Sun, 26 Sep 2021 04:45:59 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnH-0002EB-M9; Sun, 26 Sep 2021 04:45:59 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HHK4W32V8zRXBm;
 Sun, 26 Sep 2021 16:41:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:45 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:44 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 01/14] machine: Deprecate "parameter=0" SMP configurations
Date: Sun, 26 Sep 2021 16:45:28 +0800
Message-ID: <20210926084541.17352-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tIZqxGOa5UII

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
index 3c2be84d80..97415dbecd 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -160,6 +160,21 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
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
 
 Plugin argument passing through ``arg=<string>`` (since 6.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
index 8f603cc7e6..91d859aa29 100644
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


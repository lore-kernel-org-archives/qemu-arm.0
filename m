Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919119lfb;
        Wed, 30 Mar 2022 05:56:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIhMyRTULrbcbE+GkFlvoxJXwkHPNnSMrihEOOGFo5vtzpyUnO4FamT6G/hZzoEqUSlEmw
X-Received: by 2002:a7b:cc12:0:b0:37c:1ae:100a with SMTP id f18-20020a7bcc12000000b0037c01ae100amr4224009wmh.54.1648645010180;
        Wed, 30 Mar 2022 05:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645010; cv=none;
        d=google.com; s=arc-20160816;
        b=ofL7O1LVSP18V0X/Mgu9Tm6gFiNdGoO1ijwpJtw+D1zLGjnzDhn40ZhXq256PR5zxF
         l3+7V1Z19eH6lXud7SE9Lf/SyJAPjbuCQel+em4b6bHflVWZUpfFynCVrkQvWhVMBuz4
         VS77P3I1uTM1SExb8yE+AlKAYl4lcURyRtYcAotYxnPx2UdvoktNWBl96Nq0r5eXP3ZW
         ZSZnifP8MTP/LFa3TKmvpn/g3iukOhREIIhgN8OlpZo1b6Sit3q6kwvd/WklSLA8LmyI
         s9Z7jhEbvo7Ze7Z+XPWpWTCf5OmjqrEZN185K1D4l/vx/UuLJ0FL0he3eyfJmOVnKTA9
         AqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cuMqYjKLUiOJpMyaEYbHpLc1NjYNYXkz7u4Bj2qu9+0=;
        b=Fx4vtWwB7bs0CVZ6mn5ZcELLeUvuiFRIPMNI6HM9JECg9f+aBf3Sjvc7+pOI5iZDk/
         6wF/0ZR7c4xnkgF/Viwgv9erf0pXcZF/J6hl3E0uISC6Ov4b6Vk8/0SBcqi54bqle6kE
         9aCbHCCE6QzOAilV2n3x1JKnf+UAeob6J77eMZcqThMxGFeaM6aZ67epiXtqdc5TWwKt
         DiDebP9oX+5kRhcr0i/pSBVIixE6rDrsp3z+bp/PvTQV1v02RDNhrrVV321yqgyPMQRQ
         H+yHsbU4+KbxhHNRdyq+7ZbfJa4cLgAp5zyPIFVgK+ZzxxGSU0M41sOExQI0hJzGiHbB
         8rtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=AF5vgjPK;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id p8-20020a05600c1d8800b0038ca2ed5da6si2240185wms.30.2022.03.30.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=AF5vgjPK;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 10E1621EBF;
	Wed, 30 Mar 2022 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuMqYjKLUiOJpMyaEYbHpLc1NjYNYXkz7u4Bj2qu9+0=;
	b=AF5vgjPKJfLfOCE8JJV0wIHVMssFOH9O+283ap/NOqh3nvzncFwiViz4w2H1j70ovAdUCk
	H6zETNsRK3hmb/k2LH1knxYvkM2faq77tkaDrymyqd8xr8xTI/GixhEENC+/1AMd/14Bwa
	srv/dw8yRP2afosiJbf2Wx2P+i7a9us=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 06/18] hw/cpu/cluster: remove cluster_id now that gdbstub is updated
Date: Wed, 30 Mar 2022 14:56:27 +0200
Message-Id: <20220330125639.201937-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: q7WkLR5E4GDz

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cluster.h | 7 -------
 hw/cpu/cluster.c         | 7 -------
 2 files changed, 14 deletions(-)

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 2125765f21..6704434cc0 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -60,17 +60,10 @@ OBJECT_DECLARE_TYPE(CPUClusterState, CPUClusterClass, CPU_CLUSTER)
 
 /**
  * CPUClusterState:
- * @cluster_id: The cluster ID. This value is for internal use only and should
- *   not be exposed directly to the user or to the guest.
- *
- * State of a CPU cluster.
  */
 struct CPUClusterState {
     /*< private >*/
     CpusState parent_obj;
-
-    /*< public >*/
-    uint32_t cluster_id;
 };
 
 /**
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 3daf897bd9..51da6ce3a9 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -42,7 +42,6 @@ static int add_cpu_to_cluster(Object *obj, void *opaque)
 static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 {
     CPUClusterClass *ccc = CPU_CLUSTER_GET_CLASS(dev);
-    CPUClusterState *cluster = CPU_CLUSTER(dev);
     CpusState *base = CPUS(dev);
     Object *cluster_obj = OBJECT(dev);
 
@@ -64,12 +63,6 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
 
     /* realize base class (will set cluster field to true) */
     ccc->parent_realize(dev, errp);
-
-    /*
-     * Temporarily copy the cluster id from the base class as
-     * gdbstub still uses our field.
-     */
-    cluster->cluster_id = base->cluster_index;
 }
 
 static void cpu_cluster_class_init(ObjectClass *klass, void *data)
-- 
2.35.1

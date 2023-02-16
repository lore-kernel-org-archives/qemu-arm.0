Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp540435ejb;
        Thu, 16 Feb 2023 06:23:58 -0800 (PST)
X-Received: by 2002:adf:e88e:0:b0:2bf:96ae:7cc8 with SMTP id d14-20020adfe88e000000b002bf96ae7cc8mr5372175wrm.4.1676557438264;
        Thu, 16 Feb 2023 06:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557438; cv=none;
        d=google.com; s=arc-20160816;
        b=pm3e5di5LZHpIYdRBUBwrXbf4vB4oLTT/TRmD4z1Slx7WL0JmS4Z9QHAuYQhiib+99
         CGhwzPOH6VBobbwXLTQ2brHs8up9r98V1ObGdkBNQVhSqFpgPN9LaohngiLh1yBM5dmE
         IRwDxFlX4+tKCSyt+Ne7pcDtFCTKCtrQFkHBLhiUtOco3dZa+Cs1kAnfKPvSONJzk0Gq
         AtbPG+9IsJfBRjxZ4vt6evYQsAMlLcpTqOW1LtoN/Zjk9NQSKu1nYoPzevKGD2Er7gVi
         H4TFt3VwvwRYJCsf6YKyqakecHlnWZTWmhxt9boqR8N5HDs6nPAPZ76uKgpE3bbOCBPn
         aViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TZ4uzPiIvaikQ5NFFcOsPUHe0pcwccK15cuAkxemPTA=;
        b=eoKn4kXdQt4d+duoBvoHrM6Oml3Xy3xr4k9PUJkIeKZlOKRlZMgznUCbypxVkYQOUL
         1km9MbPT0Q969dZc3i26XLSSvpEbkAsZre36rk4cgX95bfDeXsOwNr3/oe9CFoIqG1Vf
         cnsKRgP1khqY6jeD3C4J5eEv95VKl6mTOxsJkEXDeazvDbkdWrFyXHYU+TvuWHpQ25hZ
         qhqd+gxDJbEPW5wVOVF/YX3w0207MYUn4600b1M7NYEM6OXmMljmnQ+VqzDIBCbRH5AN
         JbL88pYW9tQdCo3zPmdCthX10s8LgpNKXoEPuHYL3jHUA/RNpfMGdKWF/N4TfXx6HrqF
         cX4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JArp8dD4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n17-20020a5d6611000000b002c5a49ddd39sor1323wru.48.2023.02.16.06.23.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 06:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JArp8dD4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ4uzPiIvaikQ5NFFcOsPUHe0pcwccK15cuAkxemPTA=;
        b=JArp8dD4R8i9ifo9Kg88q6SCj/BK1wTc2w+bvfRsuUg2ItI2ElysT+3mjeNwa8TTt9
         4ogl0/DxDGnr80jQwyUjDHT7W4sOIlYC4hzDq9QtxOEoCF53Zq50ui4MGI1mARCvpS6l
         Bz0U03E0DTPSCq5i/4xEOmtEHMY0Rqd1cq3OHYdZZeawxLrAxweQg7JgrgKjUvcUMD15
         6jI7PKtyt2UNcqNa8RQ4wtGkkUOK6hHPwcLF7JGpD9+srXEQK9GpAQzTt/bsedZ3yerz
         sNhWUug7bTQnU4Bj6i1/Z75gbbUeffCIM4a0Q4qpraXRHkaXWuqhF99e5hcpCw6Bqw6Y
         AXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ4uzPiIvaikQ5NFFcOsPUHe0pcwccK15cuAkxemPTA=;
        b=y4yXqsSZgRif/Eoj+tvlktJ7X2L6Bdea4q0vZY2MKRfhoUaO2AFe/Wbk+OLEuMasA/
         d3zf015hMF5iU4qRKVFWN1KQnYhfmUY8VemXF6jGJOJoXX0BGTIflKHliELnfYhbXpkg
         1SQCfTupsbOcrf3CVTMfowS7bC3uXw3miMKCRSUmCg/jiW03/+G6YgQkxx1rvYQnJhyY
         fozEKk7mknRu/pcxwLN1IQmFkdq9MgiscixiI3F8aYAUBAEibJ89+S+IZjqkvPDEBfWu
         k/FxhCgKBxacJzXnSirrjfZ9GL84MoVtyhUKp4BT6ZKxPPfPCZIm5qiulEDkiWnetkeV
         yifA==
X-Gm-Message-State: AO0yUKX1ZqFxMnYIJG+SSGv7hpnZiFK6KCvfrjByb9H7G/RcElHyznUO
	Phf8CO9EKTq6Wer/tNoSods9W9xZ
X-Google-Smtp-Source: AK7set8XlXGDEcTFxARBu57Ip2Ufhe6qVEFVF5ij33wD24nwWwNzihpnZ+ZkKjS9nTycV0iezXPFdQ==
X-Received: by 2002:adf:f092:0:b0:2c5:4af3:3d26 with SMTP id n18-20020adff092000000b002c54af33d26mr4287485wro.9.1676557437923;
        Thu, 16 Feb 2023 06:23:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003dd1bd66e0dsm1879797wme.3.2023.02.16.06.23.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Feb 2023 06:23:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Bin Meng <bin.meng@windriver.com>,
	Zhuocheng Ding <zhuocheng.ding@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Robert Hoo <robert.hu@linux.intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Zhao Liu <zhao1.liu@linux.intel.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 3/5] hw/cpu/cluster: Restrict CPU cluster to a particular CPU type
Date: Thu, 16 Feb 2023 15:23:36 +0100
Message-Id: <20230216142338.82982-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vkqXuB0qFuON

CPU cluster id is used by TCG accelerator to "group" CPUs
sharing the same ISA features, so TranslationBlock can be
shared between the cluster (see commit f7b78602fd "accel/tcg:
Add cluster number to TCG TB hash"). This mean we shouldn't
mix different kind of CPUs into the same cluster.

Enforce that by adding a 'cpu-type' property. The cluster's
realize() method will check all children are of that 'cpu-type'
class.

If the property is not set, the first CPU added to a cluster
sets its CPU type, and only that type fo CPU can be added.

Example of error:

  qemu-system-aarch64: cluster /machine/soc/rpu-cluster can only accept cortex-r5f-arm-cpu CPUs (got cortex-a9-arm-cpu)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/cluster.c         | 19 ++++++++++++++++---
 include/hw/cpu/cluster.h |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index b0cdf7d931..0d06944824 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -28,6 +28,7 @@
 
 static Property cpu_cluster_properties[] = {
     DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
+    DEFINE_PROP_STRING("cpu-type", CPUClusterState, cpu_type),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -41,11 +42,17 @@ static bool add_cpu_to_cluster(Object *obj, void *opaque, Error **errp)
     CallbackData *cbdata = opaque;
     CPUState *cpu;
 
-    cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+    if (cbdata->cluster->cpu_type == NULL) {
+        /* If no 'cpu-type' property set, enforce it with the first CPU added */
+        assert(object_dynamic_cast(obj, TYPE_CPU) != NULL);
+        cbdata->cluster->cpu_type = g_strdup(object_get_typename(obj));
+    }
+
+    cpu = (CPUState *)object_dynamic_cast(obj, cbdata->cluster->cpu_type);
     if (!cpu) {
-        error_setg(errp, "cluster %s can only accept CPU types (got %s)",
+        error_setg(errp, "cluster %s can only accept %s CPUs (got %s)",
                    object_get_canonical_path(OBJECT(cbdata->cluster)),
-                   object_get_typename(obj));
+                   cbdata->cluster->cpu_type, object_get_typename(obj));
         return false;
     }
 
@@ -69,6 +76,12 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "cluster-id must be less than %d", MAX_CLUSTERS);
         return;
     }
+    if (cluster->cpu_type) {
+        if (object_class_is_abstract(object_class_by_name(cluster->cpu_type))) {
+            error_setg(errp, "cpu-type must be a concrete class");
+            return;
+        }
+    }
 
     if (!object_child_foreach(cluster_obj, add_cpu_to_cluster, &cbdata, errp)) {
         return;
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 53fbf36af5..c9792d6f05 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -76,6 +76,7 @@ struct CPUClusterState {
 
     /*< public >*/
     uint32_t cluster_id;
+    char *cpu_type;
 };
 
 #endif
-- 
2.38.1

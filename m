Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp540351ejb;
        Thu, 16 Feb 2023 06:23:52 -0800 (PST)
X-Received: by 2002:a05:600c:330a:b0:3dc:42e7:f626 with SMTP id q10-20020a05600c330a00b003dc42e7f626mr4943935wmp.26.1676557432344;
        Thu, 16 Feb 2023 06:23:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557432; cv=none;
        d=google.com; s=arc-20160816;
        b=mTiEg7NsIyr/Jylp6qnOT1ACaZXaaz7NZHbcFEmlJMSrgawrriO2Lw3otbovbxI3x4
         u42yprO16Bya6iJ/PDpoZTBrKgqdcxLyPGHgGjwaW4RRbLJlG1SrdWx2FEQtf1rY31z/
         gSjm+dsoaADbd1ul8vN8+PlQzH8dnxlkc8jCXM+FXojOhtBUd+CKR8prQUssx6Xh6fKu
         9W+C/ljsjZ136zf3ITHbLBbZGO8Cbp6XfFq59JNLKldHjBtt0IJwTh1NUxmIBtGCyk5k
         JQZxSEddEy2ML92EkcumpENGCpSrINbLk3LlFW+ofdazGmXuQFIsxOkLmYvQyFxmi5xY
         IjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Mp16C8opTjs5capPqEpUNYeRp9xjtzcoAR4MvUbLxj4=;
        b=B3xusJM+DFF7QIjBU1/oqU6sBwUK7q8agUi8ca1BpuUYQcvCDWq7+NULJJQ76/OCxD
         3BsvDKuxBbvQIXXqd4CyFxC5zihOZRUabjxv7vsJDWYyQxnKpPbYai36CxCcIkoLaZPK
         CluqIXOGXw0OAb5xUul16k+/HKpohxvah3/8xgDAo+kFtNYxQuTF5X+TrhPVNvTDZqHr
         3ECRqnPY0N9p4V57ZlHcjDB5jqCE7mNkbSV8HXcdEPdIRrA0Scs5BNjFpIREEKqOEBCS
         JS5UZF8bByiRahIeAHp4ygbmsaCRTIcJzi9HhbvAkq2I63O4uw1wDHJBRP4AH2i8RKN6
         3auw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H6p4daE/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id az17-20020a05600c601100b003dc5823d6ddsor729596wmb.22.2023.02.16.06.23.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 06:23:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H6p4daE/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp16C8opTjs5capPqEpUNYeRp9xjtzcoAR4MvUbLxj4=;
        b=H6p4daE/Kz3tCO31ndsJ/BJM2mMtyqWplOw7nhJDYtNnepPf6xGO8z87MEh4lqTIYv
         BggD/hXpaI5snCBZH5DlV1svBtmLWIEhE8RL7SiHo4v1MpNGyjr9Z9rsqBx4nPagxLQ0
         zJY0BmDTDiY8Uj9u2cPLm1uEkKP6/YZCT7oisyuYufzA3FvLbgc6SIFogHbDNtjV4GO/
         6VtmwpWunTGBLUO07MQMkgBPkmWpRGuK2XXOd4HR79/JNE+lVAjRCXNqFEgq9ntxJB+u
         pAyrIg6082amKhKrs/Jn+vD1ChIrbP2n7ac5IuLdY0nnNc0FaJ+926XuDCSiBNnXViJ4
         b3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp16C8opTjs5capPqEpUNYeRp9xjtzcoAR4MvUbLxj4=;
        b=rfvbZTJG1jh1Jd6kdNQ32UWWvEhv+cRsp0PEZfExeJdLU+jpJSDm3FFlBknWyZgnon
         y1PwsrNzDkV2oF7U16vIo44XjDj2qO8fTTsSkFtYcpxtnl1ca2PQel2dUpOLKI4K70f8
         0QD8g7H2OzNqTgjsRd5OT8oGlULRCL1ysszNsJeK1bzLH4VQvBSH1KmbL6z3Pjhi71yH
         +/jvCYCgqFC14Kvq90CrfcIzGuKVYdQFivaORZHxqZt8AkB5IdM+sRWE4/XoWsieKYZO
         7Xiohea/rF0uIE+GrOViCETJR7SvK6HxrR2fbI2q5dlNvuQI0JWdPc5Xc0vYwImFBvVa
         kLCQ==
X-Gm-Message-State: AO0yUKVa9NZGayKqDHtHhP/GULRneBPkNEqm2Rx6UteH5RwNUpZpswWP
	aLGhSY8DtfIGRRye4mRCqaDWTRgt
X-Google-Smtp-Source: AK7set8ovpStILq+IXLgnaen1PQ146dQ+ti5Wy/ucK86cF/OUvzH3RBwLW6OLeSsnqJCFhSIrU4W5A==
X-Received: by 2002:a05:600c:18a6:b0:3e2:f80:3df1 with SMTP id x38-20020a05600c18a600b003e20f803df1mr1794039wmp.19.1676557432074;
        Thu, 16 Feb 2023 06:23:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c348400b003df5be8987esm5562823wmq.20.2023.02.16.06.23.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Feb 2023 06:23:51 -0800 (PST)
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
Subject: [PATCH 2/5] hw/cpu/cluster: Only add CPU objects to CPU cluster
Date: Thu, 16 Feb 2023 15:23:35 +0100
Message-Id: <20230216142338.82982-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mxvouWc5st56

Do not recursively add CPU and all their children objects.
Simply iterate on the cluster direct children, which must
be of TYPE_CPU. Otherwise raise an error.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/cluster.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index bf3e27e945..b0cdf7d931 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -39,12 +39,19 @@ typedef struct CallbackData {
 static bool add_cpu_to_cluster(Object *obj, void *opaque, Error **errp)
 {
     CallbackData *cbdata = opaque;
-    CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+    CPUState *cpu;
 
-    if (cpu) {
-        cpu->cluster_index = cbdata->cluster->cluster_id;
-        cbdata->cpu_count++;
+    cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
+    if (!cpu) {
+        error_setg(errp, "cluster %s can only accept CPU types (got %s)",
+                   object_get_canonical_path(OBJECT(cbdata->cluster)),
+                   object_get_typename(obj));
+        return false;
     }
+
+    cpu->cluster_index = cbdata->cluster->cluster_id;
+    cbdata->cpu_count++;
+
     return true;
 }
 
@@ -63,8 +70,9 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster,
-                                   &cbdata, NULL);
+    if (!object_child_foreach(cluster_obj, add_cpu_to_cluster, &cbdata, errp)) {
+        return;
+    }
 
     /*
      * A cluster with no CPUs is a bug in the board/SoC code that created it;
-- 
2.38.1

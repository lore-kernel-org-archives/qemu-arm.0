Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919055lfb;
        Wed, 30 Mar 2022 05:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl8vFXFgA6zJGgJlry9z90JXxM7QcMWfqFfHh+UvtNrjGIIhyUa7fa6leLuakabfcCVTjM
X-Received: by 2002:a05:600c:3512:b0:38c:be56:fc9c with SMTP id h18-20020a05600c351200b0038cbe56fc9cmr4307094wmq.197.1648645006885;
        Wed, 30 Mar 2022 05:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645006; cv=none;
        d=google.com; s=arc-20160816;
        b=Dt6j61DN3Jvwv3+D0U2+XeoBe9RdSxO1HnJzChbCOL6ZNn6NQ+bwQTwfZ58w7AkUV9
         ma9mHjHvWLgvCCWsTwMAbkkOFsjXfVWARnRj42zTwGik6khf24uFFeAXZhmzKu8YufP4
         jVd47UmbI+WQVML+nDiXWH1FYjEDxx1v/QnBH1kLgJfgd+gbuexP/Avcnip4hULFcWCd
         KLhdPiDaFO5bifSKo0zKOSldq8E5+XiM2VyuSeAVwy4kLtAX/SnQ+SzmpCBRdPb+a2D6
         Sfur09u3Poq/nV2eYPu7Yr3kS0sTriMG7IVcWWx2dM0s47ofV9B9/1m9zARTk3R0HWTs
         iApw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bhFYNyYPRCcLBEZVNCD7ZOOJTmG3o6A4RaJXBk+/Kv8=;
        b=ND/DygRDnEpbNAzsUIMmoN+/MWbjOr6B/xFBi1IvE5Z5X2mqcLwxyvQLwwkoQg+pVK
         bDmQNhlKp1xyDDRn1BzOirRSgb6l8vvKJiMKoaSUC6lRx9snZqS+x0vuPC10Updl3Wtw
         mXeI8KbJbllWeJLTD2BL9viZojjIfzkKW757vLWsqixpKIv063Jo5KyeKTsc0vpx7BuM
         Oe+u7OmRZCmin77VfmKaVSfdZ2PsNxhEpOtqd2SrfZSOpiH8i0W2p1Wzi0gdmGbPVuyB
         z8eKBr/ptQpiHdyDgvWzbdmZVoCeSAPeJa7wGKhkkc4RCDEw2bUpd6q1OYSygb3Ub0bh
         PEbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=O8alWpXz;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id u5-20020adf9e05000000b00203e9019366si19962098wre.234.2022.03.30.05.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=O8alWpXz;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 9298621C6C;
	Wed, 30 Mar 2022 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhFYNyYPRCcLBEZVNCD7ZOOJTmG3o6A4RaJXBk+/Kv8=;
	b=O8alWpXzpOtujLY+gf/pdmUH9vF0nohuGWIGH4rkN73/DhaPiJcgsFfExnJIeShmz6XsSW
	SZaRBtErNBiDPrBTGffAH/rHIycScRe6X0ApX0pZceLfUmK03IKIBEsovfhN+LDQtiRzBn
	+dKG4JiBNJgH8j/I2gR9n1NwpEnymCs=
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
Subject: [RFC PATCH 01/18] define MAX_CLUSTERS in cpu.h instead of cluster.h
Date: Wed, 30 Mar 2022 14:56:22 +0200
Message-Id: <20220330125639.201937-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: F/kQBqJZc9t/

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/core/cpu.h    | 6 ++++++
 include/hw/cpu/cluster.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 136973655c..38c72cbda1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1054,5 +1054,11 @@ extern const VMStateDescription vmstate_cpu_common;
 
 #define UNASSIGNED_CPU_INDEX -1
 #define UNASSIGNED_CLUSTER_INDEX -1
+/*
+ * This limit is imposed by TCG, which puts the cluster ID into an
+ * 8 bit field. Default being all-1s, custom index cannot be set to
+ * more than 254.
+ */
+#define MAX_CLUSTERS 255
 
 #endif
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 53fbf36af5..09a2b86832 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -57,12 +57,6 @@
 #define TYPE_CPU_CLUSTER "cpu-cluster"
 OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
 
-/*
- * This limit is imposed by TCG, which puts the cluster ID into an
- * 8 bit field (and uses all-1s for the default "not in any cluster").
- */
-#define MAX_CLUSTERS 255
-
 /**
  * CPUClusterState:
  * @cluster_id: The cluster ID. This value is for internal use only and should
-- 
2.35.1

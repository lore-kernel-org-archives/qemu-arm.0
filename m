Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919150lfb;
        Wed, 30 Mar 2022 05:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvKtVs+lUGK3DZ4yJA7UBmVwrkR3v0i8W5N5DPtiId2AbqpEcnMxAS0tSZdWMpj2/9DxBg
X-Received: by 2002:a5d:5690:0:b0:203:f727:362 with SMTP id f16-20020a5d5690000000b00203f7270362mr37493909wrv.717.1648645012681;
        Wed, 30 Mar 2022 05:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645012; cv=none;
        d=google.com; s=arc-20160816;
        b=HA3cvJl2OBWocJSj+8YnAn+HVgQiQqzXboQRKD1jkls2OjeNLtbiDwr3VJL7EwGibq
         s99GxLDCHsrQnuEmgkMoO32rjf+mDZuSt9ztBs48VLCE8dUphizgw8McQL/eQAOOFU2j
         7ReNcbdrtkNupO7YeAltHnrohF9wBae1TFcdPqd0On+zHYjdflSU3p1Bp+aBlTwbnOTN
         LdkNO7l8zyO3fYTue4cHAWoTTF33Rr4M5/soeVBsy+V884NopcNp8wBQlchEYGKG1VlH
         AtBz3l5cdQKXOGWHpV/V+ju5Pt4s9GQEEQXPLrVVofaY0xgdwxFk2TtXtcjN9VKwCdRk
         TtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OP2KACeS0PxZ1cbQpDRjk56f4TeAFjOJTUpHlmpiXfc=;
        b=yaeXxBsvu6Ly5LM1yDVQfayhw+Qki83WXEcM218jgwods50zAambIakwDf8dApqJLG
         ZcGNLCukNLJRs0t2eA+d3heeZG95jQMVK09eJTHa8xT/myFmFMAqZwcTq57vwe/xcFWj
         poo09fqV0zhFSzaOgtP9eqF3e7tLc1jfDr+qauiqpep1jdP+QB08GoOnC9ZHUUPJylhx
         auOmeuYViL/2RSj84fsEPTaQkc4ePdD1pzXdFlQ13NV3253IcnWRZ3ztrji9Q2DjQ2Ip
         eiQSKe9VhPQt5nlgJBgfZA9v1eKdFbtDBoAwTCBiJsnPkFD3M117htjPbFO6jUq0j5G1
         47Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=OVTr74r2;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id e8-20020a7bc2e8000000b0038c77be9b67si2235935wmk.130.2022.03.30.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=OVTr74r2;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 7FBAE21EC6;
	Wed, 30 Mar 2022 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OP2KACeS0PxZ1cbQpDRjk56f4TeAFjOJTUpHlmpiXfc=;
	b=OVTr74r2H1SGGg81PNbAotcOyG0vhNKotyLUFtZKSoRNmscrUSzencupPVJvnAMFhaNeju
	2wPb/gokuOGkPlCtv1oqDkEMUDTSGeJ7o9f4GO2yy+aPKfZGK0u85KjH1K1JU6gHtq505n
	JZswpS2ELJUPLRqhSaK9i7Jb2NN+TKQ=
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
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 10/18] hw/riscv/riscv_hart: prepare transition to cpus
Date: Wed, 30 Mar 2022 14:56:31 +0200
Message-Id: <20220330125639.201937-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: fd19D2FiMnZa

riscv_hart_array does not need to be a sysbus device: it does not
have any mmio or sysbus irq.
We want to make it inherit the new cpus class so we need
a few tweaks:
+ a temporary helper realize so we can switch from sysbus_realize to
  qdev_realize (will be removed afer the transition is done).
+ a helper function to get an hart from the array (the current storage
  array field will be removed).
+ a helper function to get the number of harts in an array (the current
  field will be removed).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/riscv/riscv_hart.h | 19 +++++++++++++++++++
 hw/riscv/riscv_hart.c         |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index bbc21cdc9a..71747bf37c 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -41,4 +41,23 @@ struct RISCVHartArrayState {
     RISCVCPU *harts;
 };
 
+/**
+ * riscv_array_get_hart:
+ */
+static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *harts, int i)
+{
+    return &harts->harts[i];
+}
+
+/**
+ * riscv_array_get_num_harts:
+ */
+static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *harts)
+{
+    return harts->num_harts;
+}
+
+/* Temporary function until we migrated the riscv hart array to simple device */
+void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp);
+
 #endif
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..780fd3a59a 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,6 +27,11 @@
 #include "hw/qdev-properties.h"
 #include "hw/riscv/riscv_hart.h"
 
+void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp)
+{
+    sysbus_realize(SYS_BUS_DEVICE(state), errp);
+}
+
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
-- 
2.35.1

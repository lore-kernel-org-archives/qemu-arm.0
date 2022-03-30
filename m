Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919130lfb;
        Wed, 30 Mar 2022 05:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7cx+3wIWmyXo7bcql5x1IW73k1SMnzm1gnL7ckiCzAqWR+1/quto1Q8+UpYWIbAEja0U6
X-Received: by 2002:a5d:5507:0:b0:203:e0a3:7016 with SMTP id b7-20020a5d5507000000b00203e0a37016mr34816106wrv.575.1648645010943;
        Wed, 30 Mar 2022 05:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645010; cv=none;
        d=google.com; s=arc-20160816;
        b=LPV+EzZo1NCzszyAd5QQZ9T/wT5inKXfRrobi0CROcbcyiyrx0ovGMld+S7mVBpLvj
         hVNziGQyojOuA+B2Jvk7CGvp3WH04U5nyrj7t2nxn1/5k4ftub3PyJIV3XWDSafQQgM3
         D9o7s+gdZm/7c5ABA2VOOoVfNv4wADZkuEEei4+/WqHgUQ9OzerW87a7PhMeBA9xUjq5
         fwxzz4xU3eoTGnWNNpSfn187gPBraa0b8dltWFD3qEVayqBVSsLFiwDjttFtbaMhgXkk
         fav7dKhc+E8UK2Xl3uO56ixhWCjab+feDvjEe0hIBBZqdjErGdP9fm37Xp7w9+Yj6RsY
         yecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yAl9UmQScRePk2SVLTDCbmbb8crA3T3m5WK8Zes84L0=;
        b=qyQyh5JVf+nOjEaQd8Dw1CE6cgxn8xnSSd9bXtADZ2aSkYPtVkVKYEut4PJicZoLRQ
         hNurxm/5LcwfPVz5Q4NvKdwQZpACoaQU99vd72l/rtwIciyyBHG++oxy7VcbycvJ8OeV
         FqcQqblzaOzqucyYtqiBFwt9KwcSMgW8AjzwMly1hsh07pUHDE24DMhG6233sVBPlRh5
         wTjOLPBh0iySPj4/rEAU1H4g4vvBZOww/klzMizs9wgKmd6WuECWOQ4TNmMrdhyCMngY
         LvVyjMC/gNhIA1gV8APGY2KMUPMkcdpayTFdilkSUzw01jOquaorPseJwTirzNuFTAZb
         l7QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=dfO7Ra3d;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id b17-20020adf9b11000000b00205c998a29esi9372460wrc.180.2022.03.30.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=dfO7Ra3d;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id A5D9A20780;
	Wed, 30 Mar 2022 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yAl9UmQScRePk2SVLTDCbmbb8crA3T3m5WK8Zes84L0=;
	b=dfO7Ra3dxjxDgRm4zGt6tgvWY84pbYNMVI+E95RBI/Ir8ziXlohCAafkmv37SizYYv7f4n
	bo8kjQnqwWaMS36AWqckCMc4iqbaw9BkxqV6nDFt4eWmBelMA3HSX/75F8gTUW+VIA1ZeM
	Th2BdEQK2ixSbGnJUbUPaiz7xNxKEQY=
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
Subject: [RFC PATCH 07/18] hw/cpu/cpus: add a common start-powered-off property
Date: Wed, 30 Mar 2022 14:56:28 +0200
Message-Id: <20220330125639.201937-8-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: uhng59O7ksTy

Can be used to initialize the same property on all
cpus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cpus.h | 3 +++
 hw/cpu/cpus.c         | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
index 295d7537e2..7e89a0d018 100644
--- a/include/hw/cpu/cpus.h
+++ b/include/hw/cpu/cpus.h
@@ -46,6 +46,8 @@ OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
  *      written before realize in order to enable/disable clustering.
  * @cluster_index: The cluster ID. This value is for internal use only and
  *      should not be exposed directly to the user or to the guest.
+ * @start_powered_off: Default start power state of all cpus
+ *     (can be modified on a per-cpu basis after realize).
  */
 struct CpusState {
     /*< private >*/
@@ -59,6 +61,7 @@ struct CpusState {
     struct {
         uint16_t cpus;
     } topology;
+    bool start_powered_off;
     CPUState **cpus;
 };
 
diff --git a/hw/cpu/cpus.c b/hw/cpu/cpus.c
index ed9402c100..d1fe80f0ab 100644
--- a/hw/cpu/cpus.c
+++ b/hw/cpu/cpus.c
@@ -27,6 +27,7 @@ static Property cpus_properties[] = {
      * FIXME: remove this property to keep it internal ?
      */
     DEFINE_PROP_INT32("cluster-id", CpusState, cluster_index, -1),
+    DEFINE_PROP_BOOL("start-powered-off", CpusState, start_powered_off, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -71,6 +72,10 @@ static void cpus_create_cpus(CpusState *s, Error **errp)
             cpu->cluster_index = s->cluster_index;
         }
 
+        /* set power start state */
+        qdev_prop_set_bit(DEVICE(cpu), "start-powered-off",
+                          s->start_powered_off);
+
         /* let subclass configure the cpu */
         if (cgc->configure_cpu) {
             cgc->configure_cpu(s, cpu, i);
-- 
2.35.1

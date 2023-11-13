Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408250ejc;
        Mon, 13 Nov 2023 07:21:43 -0800 (PST)
X-Received: by 2002:a17:906:34d2:b0:9d2:20ee:b18b with SMTP id h18-20020a17090634d200b009d220eeb18bmr4978048ejb.42.1699888903019;
        Mon, 13 Nov 2023 07:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888903; cv=none;
        d=google.com; s=arc-20160816;
        b=hBsTnBewzyaSHeLSNnNVE6B3rwDWFTpLyyu7qJbpFX3czTI5tXIQhblqCjdnuiJMfV
         F4T+WsuH0ELWOOz/66aasncHAKzrNWQQgmTxk22Q94odS5aGgfql4DccS6z61fQK+ztI
         zdsjBDxG/gNsiRdMR19+XgjqeUkEFoGjdUqA6gOGF0OU7nM30qdfHZOxkkB7YqFjkJt9
         0Lc/5A416A0Pb8Rxg1Omp2ZtljSvZgTARrIAeH+YdetAz4bEq1ZIqOvulfpVjLf5WHUS
         fCvhDsoRvMzDuorCU7G5RLQ0hxdVV7/6I8rT2zRuQzrrgpUCtgX3/4uqIda4raqTqtAp
         8kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YAZk+3Dse8rl86kxKUGHVuPZUfUpHgJaPljFBSi46HI=;
        fh=l0GfR1YsFBV1p/d6Yn0Cy9b7NFKbeuH6aWfu2sQY5rM=;
        b=UhHpSDcg5/8+3f0C32qvgKoteBr1pk34/vCASdUpC3FjlVoOxoY/KuzqfBiiJGCIiH
         wyknVijz1CcIXU3y4W78JzQNWWISI44LWNjUN/C1tnPRWpJ+ZsrCakDrf89wyI4O6kzl
         VYAcg7a/51Y4xGEetk7IYA4V6st8OagVZ2cXyhvJi2fA9e2pn4iJg4Hn+cDrMREvKlEt
         Z+/vGx9eVeZ6qwjh70uMWt276hRuWiFXxG8Jb/Ua+7ryM6JmSUwjMeRzDwN0zprFPTfG
         hADNe1NLvM7mVKQD6Y8V+zb23LSk0kgBSaJJBcn6uj4h9AjPZvcdEYSX6wSxQ2jecPBT
         fg/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIOqng8c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k24-20020a170906681800b009dd8453eac1sor1173645ejr.13.2023.11.13.07.21.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIOqng8c;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888902; x=1700493702; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAZk+3Dse8rl86kxKUGHVuPZUfUpHgJaPljFBSi46HI=;
        b=XIOqng8cNYIKCvQv/Or9mN5cO3OY14WSveYZ+eb8dw1pJDhDrK1iojwzQ5KYvtL0CQ
         usGU33vKZeDUOW7hqSkkDTnsXuEcQkVov1Dsrjp2o2wKm5mWHWiP10B4ppEG8HCumsjm
         39CiCddF1Ke2ifes1NxnakvpXJ82ZsqLeSu+TKrdWMQ1fOj8Ys67Hk7hcwXrZi5BgbXu
         mfwCEtq12+sv/g8NSKAE/atDNsq9ssfsyiVSzOnww4YzKqjBLOdkYj4W5Zy41n69h1DE
         bDGHGxp+4z7Ep8CjzR3BX/qN2TmiNZCiUfoJba4YVf1MGN+cq8y19xxDmOMuwvI5b2J+
         r4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888902; x=1700493702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAZk+3Dse8rl86kxKUGHVuPZUfUpHgJaPljFBSi46HI=;
        b=HGPTdzPzvabeiGl37B4w4YlxrXjpMxYSl7iOSBaau1jsSV0Fz3Q8uG2mPAdUNpB6XH
         xI7fMcWPqaNLVoyD0/GyTTQevWCWp9fKovLg+DkDqdmxozcuqQj32l0XyHJvkFSLBgxC
         /VCBEQoJGDoKk26B50l9F733pZHzprk0L0RJI8XTY53upSfPBWpPZKcvDoNgGdtbckVW
         geJ5J2zA+aFggW1TNwZJo0xcg6higjs7Drnn4XKN5I0wBQKofQh66kG3QqhkRAN3Av11
         jnzuj4VHy5vhzeaRVtbNKWGd5qyQrXqLzdaAROiK2BqrXaFSUrPseebzb7XKIR+iAA3u
         tPfg==
X-Gm-Message-State: AOJu0Yzo5y7vfh5BsjkgYHJTiy4cHFshinUtKpuNcbjS27FHHqbfPSiw
	Xkl7IhMd3viJWNQoU7Q9CqWb9jHK
X-Google-Smtp-Source: AGHT+IGj6dXGN5MguahUCcbomoo2q2R5bpml51YnyeqNpSNRHHGNbaVXW8b4IH/nqJe1/joi6MIM1w==
X-Received: by 2002:a17:906:84c:b0:9ae:6da8:1819 with SMTP id f12-20020a170906084c00b009ae6da81819mr4194118ejd.48.1699888902783;
        Mon, 13 Nov 2023 07:21:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id d17-20020a17090648d100b009e6cedc8bf5sm4165051ejt.29.2023.11.13.07.21.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data() out of handle_ioreq()
Date: Mon, 13 Nov 2023 16:21:07 +0100
Message-ID: <20231113152114.47916-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EhwTU9MR4Ulh

Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
function to xen-hvm-common"), handle_ioreq() is expected to be
target-agnostic. However it uses 'target_ulong', which is a target
specific definition.

In order to compile this file once for all targets, factor the
target-specific code out of handle_ioreq() as a per-target handler
called xen_arch_align_ioreq_data().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Should we have a 'unsigned qemu_target_long_bits();' helper
such qemu_target_page_foo() API and target_words_bigendian()?
---
 include/hw/xen/xen-hvm-common.h | 1 +
 hw/arm/xen_arm.c                | 8 ++++++++
 hw/i386/xen/xen-hvm.c           | 8 ++++++++
 hw/xen/xen-hvm-common.c         | 5 +----
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 27e938d268..734bfa3183 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -97,6 +97,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
 void cpu_ioreq_pio(ioreq_t *req);
 
+void xen_arch_align_ioreq_data(ioreq_t *req);
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
 void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 6a1d7719e9..c646fd70d0 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -128,6 +128,14 @@ static void xen_init_ram(MachineState *machine)
     }
 }
 
+void xen_arch_align_ioreq_data(ioreq_t *req)
+{
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)
+            && (req->size < sizeof(target_ulong))) {
+        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    }
+}
+
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f8a195270a..aff5c5b81d 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -699,6 +699,14 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
     }
 }
 
+void xen_arch_align_ioreq_data(ioreq_t *req)
+{
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)
+            && (req->size < sizeof(target_ulong))) {
+        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    }
+}
+
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     switch (req->type) {
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index c028c1b541..03f9417e7e 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -426,10 +426,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
                        req->addr, req->data, req->count, req->size);
 
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
-    }
+    xen_arch_align_ioreq_data(req);
 
     if (req->dir == IOREQ_WRITE)
         trace_handle_ioreq_write(req, req->type, req->df, req->data_is_ptr,
-- 
2.41.0

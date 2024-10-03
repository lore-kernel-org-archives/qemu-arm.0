Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp1661724dlb;
        Thu, 3 Oct 2024 11:57:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSoQk2hUKMHuGIg4ew5u3Xrs9SKilMXYAfuGBtLelSq8cLglSd0hxvaKDOkdYFSydHmpr1neoboD+rLw==@linaro.org
X-Google-Smtp-Source: AGHT+IGXhIak5ppQN7fFYT4FvHcr57v6zbdQhWBE+b7OR0q5vV0l5GNVMdy74UmqevPmE3Lz35L7
X-Received: by 2002:a05:6122:180d:b0:4fc:e3c2:2c71 with SMTP id 71dfb90a1353d-50c85444ac7mr373686e0c.2.1727981867113;
        Thu, 03 Oct 2024 11:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727981867; cv=none;
        d=google.com; s=arc-20240605;
        b=jCD9VLMaxBf2AWTtbUheyCZ18j1yNyPXFJMsifTp3tnMsEov1g2SAQO2Jx6wd9FDTT
         dBO+wJQWgor3bIOW9ixrijf3C/cwjpyFqmdvYpLXkZzKb3KwRy4LnTl85av7cBqp53Eo
         GkT4iinP2ifyrKT+75U928VJiw4HrSeT6731oMPEfTQTU2YHZgpd6Gq+kH0L1qeMTAFY
         3arxtr8P14RHJcrssTlyX1Sa7nZXSNi7WBRxu6WCcFjTt1g0SgvpuDWz5atoWTW9tk6/
         qmo/2fW6/34NOdzXTjUP9/AU1tijyrxBslOjh2hd4mxUAT4d395hu5T14AOJPw9h+9NC
         TnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
        fh=/4ERqf01ZkUWaKrBHlmaLXrqdSp5uSRMBysUJJ55WrA=;
        b=Vtv7q+Xjv8tscrmuT2ePURbx1Ic4Q2WFgOv8uXrVnpuy42ut2xQ44ifEHQB9sDUpUZ
         9lxkBAgX0XSlaIaaOy5bExO8ThH1GquogxCag/JKo1YegqoKyD8P5rdWCBanc3VHa+br
         qSLbMd6YhN78rGWF9dT1xs3EALKHf6kcUqXi5EzZq2gMerdF1H0Sn20zNi7w92i8gozz
         W3mHkVYHmHelajdbAkc4Apf55HuzGLZyN2PliUKfjaPHhFcjsgQO8xUK2qqTYxfBiMdx
         zlPF6Qf9SOCXQ7pSSSmlMXKgTYAxdD97LVffJoKBFNRYEcC5Fx9N9kSYRbQDpPyp61aR
         ZgEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyMzGz+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb936148e1si18830956d6.170.2024.10.03.11.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 11:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyMzGz+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swR0p-0000mu-25; Thu, 03 Oct 2024 14:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1swR0j-0000lV-Db; Thu, 03 Oct 2024 14:57:13 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1swR0h-0003JS-K1; Thu, 03 Oct 2024 14:57:13 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so13922091fa.3; 
 Thu, 03 Oct 2024 11:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727981829; x=1728586629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
 b=TyMzGz+45A+2ao9S+4QZSrdsSmQSotMitGvcq3LX1WLGwBrE2gJPmpD7btiHM4n2Xn
 lEg1lypUtouzqhmOzXQ0lGDHVANEfMKeYiZEN8wPms22N/iC4SoUgoiSFVgSALPIKfVh
 8bgAAPIJ/isT7D5sNmJJGkL6IEziOfTN0GSzMchHA269gdIT1C78+Dbwjee9zD4tl8uo
 xCKAhCH4TlqiT5MXaOH5pJnAnf7kS4Z4YqrG7MhTuY4McvefYNNLOq7QPI1HQDkwX34d
 XoXsramfPRbA+pT6wMFnY0CyGmyH6SYbKkoBlYpj67gXDQa3+ObjNN1WhOJPTBxr5evl
 DeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727981829; x=1728586629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G14n863A5XJ+R3OWZM+ShGFWWx326n2e7KMDwbqTXOk=;
 b=l0ngi4aQoSgjVMtp++OnRyBtlZlCcbk4yUxd/ius6DlcLIoAMbMCwBP5XP040AjKee
 HS4Gu1jQU+0oOD8+Mn8sg/f5lKnrjDkHYCJe7OTqCshJFmP6bnubzoP5ipNK/7yW8iFb
 8uvUhE/2fDxhQUYna57kbyaSMi4sncIXjQCQKQYQrSY9oGNal5eRA8BiejFQ649uhoGp
 buu42Z9d+6ouuo6BSPNT05OKgqdyQGxx+lxlU38iQrlLGcl7S+dPrdo0T7z2V4ehyNAR
 eLQAJWWWNtIydKGNUvE5EjEtdbO59n46Xab64wLwHsvm2pj2Y8uGTdY2QiGw+fE8SCNc
 yYAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXvI5gsmuzjNKqDLGnyCYhge2z1GlR8d8cTShb3pEXOnklrscdle1WRmeiUg7dRRQ2hTIqGVbDuw==@nongnu.org
X-Gm-Message-State: AOJu0YzXU3E6WYbinxkj0kYDik7R3hubfZsktmSS9ZYtiMD8U8nX6ke5
 LB2e6J79M6VDWwe4eDPbgWX71UXNSV89EIcIMLk2Gy6LYjS4wfYn727Xmnl3
X-Received: by 2002:a2e:a543:0:b0:2fa:c5e5:629d with SMTP id
 38308e7fff4ca-2faf3c1404bmr240971fa.3.1727981828500; 
 Thu, 03 Oct 2024 11:57:08 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc6c18dsm2772521fa.97.2024.10.03.11.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:07 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 peter.maydell@linaro.org, edgar.iglesias@amd.com,
 xen-devel@lists.xenproject.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v2 3/5] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Date: Thu,  3 Oct 2024 20:56:52 +0200
Message-ID: <20241003185655.1480819-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: r0J7Z7ifOKTg

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a way to enable/disable buffered IOREQs for PVH machines
and disable them for ARM. ARM does not support buffered
IOREQ's nor the legacy way to map IOREQ info pages.

See the following for more details:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen-pvh.c                | 3 +++
 hw/i386/xen/xen-pvh.c           | 3 +++
 hw/xen/xen-pvh-common.c         | 2 +-
 include/hw/xen/xen-pvh-common.h | 3 +++
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 04cb9855af..28af3910ea 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -66,6 +66,9 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
      */
     mc->max_cpus = GUEST_MAX_VCPUS;
 
+    /* Xen/ARM does not use buffered IOREQs.  */
+    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
+
     /* List of supported features known to work on PVH ARM.  */
     xpc->has_tpm = true;
     xpc->has_virtio_mmio = true;
diff --git a/hw/i386/xen/xen-pvh.c b/hw/i386/xen/xen-pvh.c
index 45645667e9..f1f02d3311 100644
--- a/hw/i386/xen/xen-pvh.c
+++ b/hw/i386/xen/xen-pvh.c
@@ -89,6 +89,9 @@ static void xen_pvh_machine_class_init(ObjectClass *oc, void *data)
     /* We have an implementation specific init to create CPU objects.  */
     xpc->init = xen_pvh_init;
 
+    /* Enable buffered IOREQs.  */
+    xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_ATOMIC;
+
     /*
      * PCI INTX routing.
      *
diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 08641fdcec..76a9b2b945 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -195,7 +195,7 @@ static void xen_pvh_init(MachineState *ms)
 
     xen_pvh_init_ram(s, sysmem);
     xen_register_ioreq(&s->ioreq, ms->smp.max_cpus,
-                       HVM_IOREQSRV_BUFIOREQ_ATOMIC,
+                       xpc->handle_bufioreq,
                        &xen_memory_listener);
 
     if (s->cfg.virtio_mmio_num) {
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
index bc09eea936..5cdd23c2f4 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -43,6 +43,9 @@ struct XenPVHMachineClass {
      */
     int (*set_pci_link_route)(uint8_t line, uint8_t irq);
 
+    /* Allow implementations to optionally enable buffered ioreqs.  */
+    uint8_t handle_bufioreq;
+
     /*
      * Each implementation can optionally enable features that it
      * supports and are known to work.
-- 
2.43.0


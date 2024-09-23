Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2280081njb;
        Mon, 23 Sep 2024 07:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKYyyKr2Ic1UbqGjuEEMPlsI5WLEmyAN4UudJLWSUMB1WmkHc1rVwvXTvM1bdIxVI/LWv+j03IG2/r/A==@linaro.org
X-Received: by 2002:a05:6102:3ed6:b0:49b:d2ec:c617 with SMTP id ada2fe7eead31-49fc766911cmr7824748137.29.1727103329221;
        Mon, 23 Sep 2024 07:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727103329; cv=none;
        d=google.com; s=arc-20160816;
        b=OXYB24wks5S29ZgdaogANhQ4g7H2TRoHvV2spfnxt34TTMRPabqYbCGYWdvceoVPXc
         M7I4xJtRBw5X6nJwZ2zBTQnu1AahR9T1YnfKrXVUf1W171AE2CwdfIXh5LBLSG8ai8Y/
         /Kp4LJTT1ted0A2TjClErNJor45Qz1JYz0EQVfHvry40AsHLVVazHWovSQoWKIuGPUfO
         ySAtd0uGbwg3Bv/75ZyywMMgsy5uaay0nNIdQ2BncJKAaLjGPFKy8ruCPEGKZTdWVPoZ
         8qeP5sFAiuLDNXF9Z/tZ8gICh1eMcU3BynyeQwnKDxiIEcL78qCZ+GXzvhafZF6E/6mE
         bgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pBoxVH+Ru8Cf8WZg/qIWXUyc6DjCMqmFHFamf1lm7RE=;
        fh=Ki6NY52GuCCpoRMWv9SjUPmMI4ZQSx1g8V5lrEvm/no=;
        b=KOoqmdYmi/eafu4hHWR/oE1u5Y9AwLQUqOpxjxExUeG6fYjOiqWb/KGAPNlVkvqXXI
         KSmAaCvP+ywHh3Y4Fi732sIlumXk8hqWuH5Yt4Kui/BHIK15H3t5obCIVx2QBtSmFcYy
         MY9t2jVM4RGZ6sldcmh9FRqM7rS/rSM+bnFHjoWmT7jksNu43c6bTw56Sfu94vAnL1SI
         +zvdhD0GX9ZGYUKgMyLMiGrprv5Dj1SqPLYxDiA9FDQKsXdnasrxWsuk2mZFLOa8F1F9
         MYTW9yqHwM1EoL77TxsUsdpEx1XeCXfGOnG9X6NDyPtJhsIjmjyOa2iWr/+PPInf8A1O
         gvQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4TPETIj;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-49e6b438a82sor1811151137.12.2024.09.23.07.55.29
        (Google Transport Security);
        Mon, 23 Sep 2024 07:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4TPETIj;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103329; x=1727708129; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBoxVH+Ru8Cf8WZg/qIWXUyc6DjCMqmFHFamf1lm7RE=;
        b=D4TPETIjE20+4UNJgUMuP521iSg7gxgR2erzDpiQZ+D8WYDj6vQrkLCuPPGHAwPkNW
         EM59hSG/vXLiAih1LsOejRLqDPdpNB0ltqq/2Oom/nDtaAe5s4NFo/QCKXnHCdmeOeuB
         n2XnxsibCwtOjHjMcrDpxN375KayPFJf6jsKlW6qvR5lK4Vb5uv1PgWfyyVyo84unnCQ
         tKzDeEKnYmioSHS6vfKunB5yKUa3pFZf4eMNqyV0fFVPzKeIcQlaMtXtsTMwUCYK77jo
         G4GIHaeDBx2DY0LK7CylVptM4LrsM7Xr59qdcoVYJwNouP4OdydXQ4Pui/hguHzkkWIY
         hyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103329; x=1727708129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBoxVH+Ru8Cf8WZg/qIWXUyc6DjCMqmFHFamf1lm7RE=;
        b=EOXCy62jTt7lZ5auv8FmjA8jM9je1gO1nrZJqlZ8Gsh8rSz4iEPR8IsM77d7s+JnOP
         HjPYUFKtvCHErakllVWgNJ575QrudMxPP/gDvehe8QY9D2c2TyU9Tv6i/v7qHJTvDqBk
         CAowVDL2+3MDrmq254T290hWe7le6eY8kFT9jBSGQFKtmha+yFrJEY5qn0G6c/GuYw7C
         Fq8U//f46YtxN1F5G54uwsf9nJoQTPR2kCEIasI2C+SoyKKAnVfwbyJGKF8YZYtrAZ1t
         akfD6E3Bm0x2dv6j3EncBVbRWYGB8ZJGWJyHmQX47ku1Xn5eXCyVAurKmJJ9yKkhGVyN
         9VmA==
X-Forwarded-Encrypted: i=1; AJvYcCUJTW3niwkzyc/4WbDHR6H72mkT0EEULZzgAWJnTCu4SKPDrxAZombdyrzWWnRGJbcqFjz6wCy/XXeZMltnzg==@linaro.org, AJvYcCW9WVFoLjBprvw4q2NWQsEdXfFdKqvOxQ0clN23p0jOW2fOP2AO4PBjJRwJX6d692xHgpBOGbKyjga9eA==@linaro.org, AJvYcCWrRsTo92oPUCLMKVv6qvmgyot5fLm/APhVbdkbvwmyPV1Ni/4UzjjjljaoCSNIMEOl34/lBgyr8sNhA4wVSk1I/44=@linaro.org
X-Gm-Message-State: AOJu0YxSROekA+DjoxS9nelArOe4ERaL2M4wMc+nymRY/CognBMYbxkA
	OFwlWQyUc3b+LXDLz4kM2Rp8JivRYOzQQAbpAh1uqwKmFdbj7fri
X-Google-Smtp-Source: AGHT+IEVIq+5zTRJIDiwVEZ//hmPV3dnxQ6KGiEO/YrKl7+YpgOR25Qn3clhu6UZuNekZAImrbXJhA==
X-Received: by 2002:a05:6102:94c:b0:498:e25c:738f with SMTP id ada2fe7eead31-49fc7624bf3mr7212517137.18.1727103328687;
        Mon, 23 Sep 2024 07:55:28 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-849399971dfsm3226559241.26.2024.09.23.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 07:55:27 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/4] hw/xen: xenpvh: Disable buffered IOREQs for ARM
Date: Mon, 23 Sep 2024 16:55:18 +0200
Message-ID: <20240923145520.1323504-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HAA94QqZDB7s

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a way to enable/disable buffered IOREQs for PVH machines
and disable them for ARM. ARM does not support buffered
IOREQ's nor the legacy way to map IOREQ info pages.

See the following for more details:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2fbd7e609e1803ac5e5c26e22aa8e4b5a6cddbb1
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/ioreq.c;h=2e829d2e7f3760401b96fa7c930e2015fb1cf463;hb=HEAD#l138

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

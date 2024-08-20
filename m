Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp341255njx;
        Tue, 20 Aug 2024 07:29:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUh1AKxwJGvjgI7xFYmt0tNQw45dqEV57k1FTbmoR1CxAOc9tPgprETdOm72+dcDL08tCEO1BqFr3P9xA==@linaro.org
X-Received: by 2002:a05:6512:1256:b0:52c:e3bd:c708 with SMTP id 2adb3069b0e04-5331c68a8f7mr9388545e87.10.1724164199376;
        Tue, 20 Aug 2024 07:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724164199; cv=none;
        d=google.com; s=arc-20160816;
        b=yA6d1AvJQvOjtkfnV9ymOVlraszQ23qXlB0Y73w85uo5LQki+G1QS2gUwBZMANrFHG
         cDNGJ33QPcP0JiVIBjlHQ8CjxqYIWsUmVcRdpd3BeHy4XOcKRQOwk7i15kSJTDzK3iSm
         9yqw68t8a0XEkkTow2P4wpRj+G3/yZDFSa4+ooRC4gZC+zvRo7Li4iFiTMVq0Xedhebe
         xWf8Fuq/cdgfqDssYe8iWyfiDjNG4xjKiihI2gr6NtwtERcwu0Hiv5fYyfyiKSxXzsVE
         hg33ad8KZycq2DhR3XSpByvEArwJbk7lIsF/zsQfO0lmGeFye3nrdCuJxoUDZHxBafVY
         KOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3FilNtR3ylHjSgCwXgc1/4kLFqGR/asrW9olruIp6U=;
        fh=khdzFXzGFt0VIBN2ybq+THBXN6+ZZ5PjoL8EnBGb4/Q=;
        b=BDdCUZ27xJb5H3V054pyFnTBWYcdLkoBF25uSoIYBdPSYRmkvV+rQlf47QS4lC4RMS
         fS7ynNAEd3jAChYy3li/7fp++k1NWiH7zUM5m+6ifUHRnr02gF7avIHV1H7h8qq4/oLE
         JV0AI8WHdXOEbBrI+Pv0gobUsqryd9kArLK5MtFgUdozQKWd9ud8SmcwKima6F+gX7w7
         0c31v0jn/RXTqZGWv75Mvdyas8tSC4y3jDf5nFOYgwUJsiSnENz4PTEquiv4tDj1P26M
         OJ6rXTZsT+UuLnLCZW7yM0kScA2U5PgsxVCoFNt/QjcAkiHA0w1uF9zk+MJ8H+NPFk47
         2kHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kH2JowpA;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d401c0bsor3216324e87.20.2024.08.20.07.29.59
        (Google Transport Security);
        Tue, 20 Aug 2024 07:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kH2JowpA;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164199; x=1724768999; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3FilNtR3ylHjSgCwXgc1/4kLFqGR/asrW9olruIp6U=;
        b=kH2JowpAy/7zskDlSG5oukRFR9fdPHFn+LRnukLgisVEBWkXy0gzBktkJObHP+o05I
         3nOKzEErgh/nLWj/rxBeG5WDjw/Xqa30CiplvodYpvJtfShYistPModieZuW/nDAueXP
         /IP6GYk1Arpp137z2LVJbJKH2lfp6RWwIBuKfNT8SgmS4PnZb8E2AxizatEVu0xtXSgl
         NUICnLnMl1RRECVQgUqPZRqfX03WRd4kNJBWX7L/wERFBfSgIHILYS20uhgd3lKGkrOW
         MaBZD3TLdZYZHDj89l4soSXUm8CbdzlJfsbn9TsuF1AMsrrZQXCLcvBIuvWVz4thQPPu
         OSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164199; x=1724768999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3FilNtR3ylHjSgCwXgc1/4kLFqGR/asrW9olruIp6U=;
        b=xVXFWkhIHt96o6OVuh1I82An0Y+Jalkl/YP42XiEYvbt9ddfmwLRBpJrWdmKbRnXrB
         D9dTzsK5FiceGyVY4RivVyJK3RjFDQhlivZE/0kQscKRvBHNb+VILysa8sYTeYT6NWn3
         yQEGgxUEB0FCgaIBoLSB4c2smEliWfdsTx7OW/oxC4sGy2HMXoWCuUTxLaGJyjRjv2px
         Ig2eM+yqw6WYZKYqEPlGbMLXzRH7OqefRnKKN9eed+LOYRMaBo6rt80XgStbhEV5ruu1
         QgwO8HARr/10nyQiUPtX7AImdEgBpQJA8Q3BzlvwlfobK63omhb8Vdy94YTcyMN8hWNq
         8LCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsYUG9CJ+7oAuhdS/uoWWEZGuVIKYbIwyYowzEkQsVso3kQF0JgzHUhvca4+Lvfh2JtZoXliQOWtvplevTSw==@linaro.org, AJvYcCXlW/fq7euI1DFWzgo00fYGi0AW2tflzgyyFcUOGQHamSrBGtHRRFIl8TNjkQ5Af1srEwOfDlyF3V9P5Q==@linaro.org
X-Gm-Message-State: AOJu0YxwwhDJ7xfFvbreOLXTKBl/FyLCCXhXWYJsqyMCkvM2pG/alpU8
	gkBfGSGoLp0YV9xIt+dj22vf0Luxx0jLCxaLI1x+YoU7Y9qu03UXzm144his
X-Google-Smtp-Source: AGHT+IGQzw9towbWt3esYv6BylqAAAmG7i8maUZip7BzOASpnZ5frQ70BGwkwxAacACbTLNukHjFrw==
X-Received: by 2002:a05:6512:224c:b0:52e:a008:8f55 with SMTP id 2adb3069b0e04-5331c6dcd38mr9613532e87.41.1724164198100;
        Tue, 20 Aug 2024 07:29:58 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d41e1a0sm1782218e87.196.2024.08.20.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:29:57 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 04/12] hw/arm: xenpvh: Add support for SMP guests
Date: Tue, 20 Aug 2024 16:29:41 +0200
Message-ID: <20240820142949.533381-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WnDyWyUPRZ/U

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add SMP support for Xen PVH ARM guests.
Create ms->smp.max_cpus ioreq servers to handle hotplug.

Note that ms->smp.max_cpus will be passed to us by the
user (Xen tools) set to the guests maxvcpus.

The value in mc->max_cpus is an absolute maximum for the
-smp option and won't be used to setup ioreq servers unless
the user explicitly specifies it with -smp.

If the user doesn't pass -smp on the command-line, smp.cpus
and smp.max_cpus will default to 1.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 5f75cc3779..fda65d0d8d 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
 
     xen_init_ram(machine);
 
-    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
+    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
 
     xen_create_virtio_mmio_devices(xam);
 
@@ -218,7 +218,26 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
-    mc->max_cpus = 1;
+
+    /*
+     * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
+     *
+     * 1. If users don't pass any -smp option:
+     *   ms->smp.cpus will default to 1.
+     *   ms->smp.max_cpus will default to 1.
+     *
+     * 2. If users pass -smp X:
+     *   ms->smp.cpus will be set to X.
+     *   ms->smp.max_cpus will also be set to X.
+     *
+     * 3. If users pass -smp X,maxcpus=Y:
+     *   ms->smp.cpus will be set to X.
+     *   ms->smp.max_cpus will be set to Y.
+     *
+     * In scenarios 2 and 3, if X or Y are set to something larger than
+     * mc->max_cpus, QEMU will bail out with an error message.
+     */
+    mc->max_cpus = GUEST_MAX_VCPUS;
     mc->default_machine_opts = "accel=xen";
     /* Set explicitly here to make sure that real ram_size is passed */
     mc->default_ram_size = 0;
-- 
2.43.0

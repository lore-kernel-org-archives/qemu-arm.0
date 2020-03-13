Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501524lfc;
        Fri, 13 Mar 2020 11:37:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu67JP2KmSSP1DmOJVlxuAS1yICNeT4Rxf6qQ0m63tIKtRaeZGnayaazG4z78/HfuF6ro0m
X-Received: by 2002:a25:bb81:: with SMTP id y1mr18245689ybg.139.1584124657887;
        Fri, 13 Mar 2020 11:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124657; cv=none;
        d=google.com; s=arc-20160816;
        b=Ln5DHUXW4GPAxUQDKVF2D5URM902QsIdXZ/bHtemHhk9syyHloiko/Ra95bG/rWyUn
         WCwO4ArQhilqRLB46Ui6s92+cRw0qzwZCLb+XySTPx6YQJU3yqyWophMn/FNwKrTkEc9
         r5rXI4ujqlc8VcYH6oWcDONQpCNKTCxSih0dXlf0a8ZseEXkG9HeYWaWYKtxDDjqYunW
         VM62RZlZVjDBTKdjDIEhsYT8bAZKoT1RHnel1JduiQQRtEcvzujSQ1Sq6Y8FSS2XnceR
         GqvYLxSKT3n688D7BzxtRETX7KXdCf6I2gKRymRVl8ehbxQ7AntnfPGyptFUZO9RPjLm
         kauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pry6+pV8fUl3y5exktsH4W1Uxi8wrIUzy2x3T/v2sI4=;
        b=BA/QMvdNA/jnYwa9O+vvdYT2TuEGLfuIrFWD8YkPLjEm1caUX0WtR+wVXOQ0tRsrLL
         KCQU3Yr6aT6Cktzk+ZczIc9KMJobVbwKmjNf3lAzlsutzOejIbx872LosB88uZQsp3vL
         O+YzCVIb7GxdGm01AFjAmpbefi9v9Kq7EaI2fNyJjJNvMbxUEUmevRv7/XIhTPVqriO7
         FvkbURBCPihLkIpXgC/KnxLARAy4FOhZPWUIcLlk0s+kW3Ksc+Pn7elfc7yx7OMePiky
         sXk7tpNSKq3IEDqBbd4ehFaIS+JNf9XF5y7lii6hgE9AOjlhGCVR8sqDVMzj2ZIiLEkB
         u3uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bJMr/b89";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id e128si6749535yba.190.2020.03.13.11.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bJMr/b89";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pry6+pV8fUl3y5exktsH4W1Uxi8wrIUzy2x3T/v2sI4=;
	b=bJMr/b89hup6CnUbsiuH+Za3uwDa3rQgx8Cz/xylaDouz9zBhdFxlVx2h387xxy6/zH5Sa
	Gz1SdLqFOK4magD/t+6wNBf+Yi8+E5h+cw3p4q8RVy8CpNUsNNiIaF50axcePhoWb1fFbY
	96uZMg0w/sE8kFv2bEMm22hDqyzRSqI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-AX4GyOEGNc6fQWsVBTSL4Q-1; Fri, 13 Mar 2020 14:37:32 -0400
X-MC-Unique: AX4GyOEGNc6fQWsVBTSL4Q-1
Received: by mail-wm1-f69.google.com with SMTP id a13so3791513wme.7
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GzR0VTVvQsF/hlsamkIvnRsrC8/9iy2Vlr1dz/V+KBw=;
        b=FC6XOnYlLT+tTy93jtJxD4EXqZmiwAZkQ+jevyuev5z4ZLhTLSA2gMGW5iyHegDPK/
         BoiJwcHhKREpRJ53LPQMdsiIXb7R9Z+R7zDx60SmYZNr+wXOCR24tOsLDoj6J6Ui2pEf
         HhWO45GgHzl59zURAoeaecFVZc6/5ei/vQ1rFpiNokd52V2E4Oiyo70C+cxwV3M9qm8X
         MscjqZSw2VWMVWcvmTOGq3nnoI28s4lk6WGgL+Uenc3rdef7Io9BotcMZF0MdY1X7Onw
         pLFj8o+V686pueCbgbcfCrqIeVh7kjXaYFfWPhS/wM+TOnas1LKdhp+ETj1xi8BW7x8V
         S1JQ==
X-Gm-Message-State: ANhLgQ0NXol1cxnQcij3JegvOg/OEkMHvNldduWkx2kZM1IillgJcOes
	6q0Zdat+Rw6sBKZ1NxzaQGwWlv0c5b/eF/S6UOezP+YqWkmzf7djgaJdEyqSHFFihxgq7pQTXaA
	RQM7tEZiEM8ep8KkY
X-Received: by 2002:a5d:660d:: with SMTP id n13mr18234106wru.383.1584124651687;
        Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
X-Received: by 2002:a5d:660d:: with SMTP id n13mr18234084wru.383.1584124651541;
        Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id p10sm16966938wru.4.2020.03.13.11.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 07/14] target/riscv/cpu: Restrict CPU migration to system-mode
Date: Fri, 13 Mar 2020 19:36:45 +0100
Message-Id: <20200313183652.10258-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: VeqvSh5Zwo1g

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/riscv/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c0b7023100..b59e09209e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -475,10 +475,12 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
=20
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .unmigratable =3D 1,
 };
+#endif
=20
 static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
@@ -534,13 +536,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
     cc->do_transaction_failed =3D riscv_cpu_do_transaction_failed;
     cc->do_unaligned_access =3D riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
+    /* For now, mark unmigratable: */
+    cc->vmsd =3D &vmstate_riscv_cpu;
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_initialize =3D riscv_translate_init;
     cc->tlb_fill =3D riscv_cpu_tlb_fill;
 #endif
-    /* For now, mark unmigratable: */
-    cc->vmsd =3D &vmstate_riscv_cpu;
     device_class_set_props(dc, riscv_cpu_properties);
 }
=20
--=20
2.21.1

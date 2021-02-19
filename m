Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9207583lfc;
        Fri, 19 Feb 2021 09:41:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw82LgSj0GYCAoyxvoLN8qT1xekdLlMvjcI1eF1OyXcY29ZVjS+x/zMK+fGXbTe2vZb5vAl
X-Received: by 2002:a4a:ab8d:: with SMTP id m13mr7831546oon.57.1613756462201;
        Fri, 19 Feb 2021 09:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613756462; cv=none;
        d=google.com; s=arc-20160816;
        b=J/zBCbJO7c7R8QarKiol8fkhSfcQbWUHqFZHlEErLU4iHiq7a4njXBGeeNUE8EsH2S
         Th109e77EOxlKSKKLydCS9iFUPDxK/wn74f2HCpeIJ/P3H2KhT816wXLu6DxeICP5+cS
         SN6Yf280XhqwisxHRhrdZHPm4KMjePzo8GfcfMA3rrtqDUF/aFJIjk+Xr/KhrYImRakw
         t4B9iOlNKz8RaqpNysxLD7kluiKIC/O3MMYhdDly007mP3OEG9r5B7U1kj29aFtmEF/t
         Oom8uaIm8zAl9yRX+247ES3ChBWoxxPFMH7bhzDFVJSs3/LMJcDy+UIi/mDMwFQE2LlS
         yoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=LKRfXZiJfNSqbVRL/SaOx1v+Z64xt5w41cSycQqYFFE=;
        b=bczek0nCgLZRTNT57Btdoa8iWob9Bj6F6CMvfNYXCEEdCvtKfICbCU313Nb4WWYlMO
         jCqGNyKiH/p3k3BBNGJuiFKtwuHR580on53DaaQbt+Sw/Ts/fwVxKHs71TpnLJLXfpcD
         +ci0bjBsQiqdWj9OFhzfYciv3Uu/vsEYEB0BvLSKn1dOfRUx36CXzP7bw6eJM4Vh+TOw
         IQzCBYfH6xvL19hbwBspRYBvbFzJUzFEIyY4aGvVgrdWpL423sBtuS6z7n00PmzJvpo0
         bbbIwPN+68RPgFSx3NmU4YdPpR2Q7+5HVuYbeHLm8UP2BQp3SHkxSmTxQi26b2+p4wys
         /mww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bjmh6fyw;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id h21si5247673oih.263.2021.02.19.09.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:41:02 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bjmh6fyw;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.87045.164068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9l8-000214-L6; Fri, 19 Feb 2021 17:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87045.164068; Fri, 19 Feb 2021 17:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9l8-00020S-Gd; Fri, 19 Feb 2021 17:40:06 +0000
Received: by outflank-mailman (input) for mailman id 87045;
 Fri, 19 Feb 2021 17:40:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9l7-0001FU-0e
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:40:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 93aca1b8-4db5-4802-8025-a8201b57b270;
 Fri, 19 Feb 2021 17:39:58 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-d_bDoTa2MTOYcktTrTGPgA-1; Fri, 19 Feb 2021 12:39:54 -0500
Received: by mail-wr1-f69.google.com with SMTP id o10so2763211wru.11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:54 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm15304999wre.25.2021.02.19.09.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:52 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 93aca1b8-4db5-4802-8025-a8201b57b270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKRfXZiJfNSqbVRL/SaOx1v+Z64xt5w41cSycQqYFFE=;
	b=Bjmh6fywSPPU/REtaHEaRlu05bWrrONLBE99Z0WDU6KkBh5uB5z5oE3Y47iRFrTXGr0SYs
	RFMVwi+f/B1Sayp+X7BK3Ev2Xfu6SQWa4npECu6Uv0w9KmosKUGsRpi6IzY/+TmyC9x82W
	1Hr8PPe5yTIFCaSl849mrAO6sSos6JA=
X-MC-Unique: d_bDoTa2MTOYcktTrTGPgA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKRfXZiJfNSqbVRL/SaOx1v+Z64xt5w41cSycQqYFFE=;
        b=AAL8ZTRHOPlZN0QiZUIc+8QYrfFuC6rdnT8QjHxsoEaapKmH7G7bjGYvTch1DDj1uO
         y8VenlKSel4HewBVKkLDuoTcxacVvRLp9cLVHaArbxl/Sj36fNHAulvQSFkO1yFztyF/
         +7/XQnEuw/U8EmLm7/xUeRyw5xKM+A3Y2igRKJ/r6fvacOmYPUH3xw1VV7u1CTvKTfnj
         RmfjWmI5QBGjeskq/fx46ADaFF3mBDW0hQ0A20yxN7cFiN/ybpNddfSG4jXlA6hyg7Ik
         J0xXH7Srvv9KGVZyi0LZP22lPRyxX+tZzxgru9bLTBoOLYP9Z39AzKKBLtOZE8qPAV1p
         wgbA==
X-Gm-Message-State: AOAM532s7D8XqURdoAUH5lGSMUSBXmC+142X9KyObcxA2I7s409alMKH
	kekEhooBvrzDemK6QJJdaGH+24X/SA9ieZIH3DEcM2lxE/e7KdpUADGi+g/jqF3rEjBsLjQ91Bp
	MHzQM6zyVy+llyBZwRFwxuWisxFg=
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr9342124wmf.82.1613756393453;
        Fri, 19 Feb 2021 09:39:53 -0800 (PST)
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr9342087wmf.82.1613756393314;
        Fri, 19 Feb 2021 09:39:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 11/11] softmmu/vl: Exit gracefully when accelerator is not supported
Date: Fri, 19 Feb 2021 18:38:47 +0100
Message-Id: <20210219173847.2054123-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZEQVih+TF/AY

Before configuring an accelerator, check it is valid for
the current machine. Doing so we can return a simple error
message instead of criptic one.

Before:

  $ qemu-system-arm -M raspi2b -enable-kvm
  qemu-system-arm: /build/qemu-ETIdrs/qemu-4.2/exec.c:865: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

  $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
  qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

After:

  $ qemu-system-arm -M raspi2b -enable-kvm
  qemu-system-aarch64: invalid accelerator 'kvm' for machine raspi2b

  $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
  qemu-system-aarch64: -accel kvm: invalid accelerator 'kvm' for machine xlnx-zcu102

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/vl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f357..f2c4074310b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2133,6 +2133,7 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     const char *acc = qemu_opt_get(opts, "accel");
     AccelClass *ac = accel_find(acc);
     AccelState *accel;
+    MachineClass *mc;
     int ret;
     bool qtest_with_kvm;
 
@@ -2145,6 +2146,12 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         }
         return 0;
     }
+    mc = MACHINE_GET_CLASS(current_machine);
+    if (!qtest_chrdev && !machine_class_valid_for_accelerator(mc, ac->name)) {
+        *p_init_failed = true;
+        error_report("invalid accelerator '%s' for machine %s", acc, mc->name);
+        return 0;
+    }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
     qemu_opt_foreach(opts, accelerator_set_property,
-- 
2.26.2


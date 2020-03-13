Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501940lfc;
        Fri, 13 Mar 2020 11:38:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvkqM+2vef2aBfZFRh7bOU4ofSFRQujntRej9zG6iXepg9J8mppyS1Hy/cuK/z2B7RRa/uX
X-Received: by 2002:a05:6402:688:: with SMTP id f8mr15618352edy.259.1584124682841;
        Fri, 13 Mar 2020 11:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124682; cv=none;
        d=google.com; s=arc-20160816;
        b=R7g8Wb2IEe3URy8bDiTrjn3AM4lSaAkaVKcsxgQYLiXGVGPXPsF0IGik5ZFfJ6dnnE
         bLV+wgwa+8n94KodJi+ZFJcni+LDc6S9Jxngb+XyAGojJ4kwhtt9lHHyUNAVZJM2y1oJ
         arBw/c21gxj7PSvKtgCXSN9YrkcQgsKWWo3tCsc6wF/BsJ8HAhXxxd3HoPo7ODUsBaKc
         B0kO0VEb7XFA79ZrakARC/vQRwtocAXl09wWUnW8ihInQXOdl47ajWTcD314mHiHEN+l
         PilSMKRnq8xB8ok95gjGQUjBUi0aeLqzZNSjFXo3OV9RiTMIzrEZouRtyZxvvv02gJSB
         Kkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JMDYkzt1lBUpYc+oo4cCc5AD+w7GESjUgDgAA86mAF8=;
        b=zoy4oRbLiDt8JlidfxXAU5FWBBoRwIAPmLJ1osHewMpdidGCjZEpB1kLnir3OSOwyC
         3PYqTmwZ16FdRxgPlH1AurZ8DGG8VNHKio1S7OCUI1Oy/FPLOowHPUpUbj1E3UneYpqL
         Pomj1vszu+z1+clBAsEVlZlbASgFrbLt7KHK6KsjFbjWMjFp+1AjBDaKp2BdW/7ic/WU
         qxa1GzhSDm6+GsS9FlyqkhupNJb6pcERyfqGgK5gUn/vwr+3OVOjXOEPJ6aNdu62MYV4
         1t2LTUMDrMNHLa5UA06MKLRLGm6HsQatnwjjHBMEtT/4DBktrq6CKBEtSt/W6f73RTH5
         mbxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QzRMAYqU;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id qc20si5849483ejb.363.2020.03.13.11.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QzRMAYqU;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMDYkzt1lBUpYc+oo4cCc5AD+w7GESjUgDgAA86mAF8=;
	b=QzRMAYqUphl88wwJSOIl+aLxDNzUB3SwMdJUKpA+MJfZC57P0MruDJwD99FXuGfbPu13CY
	x/atYE+rEzSyCgt95PmpOlbP60oENCRkG5YDD8Ob6UdWV5Y2RDNsVeJfLPUvbVqwhILe1M
	so3iNvLWKrCiVr4h+DmAu23E/7z7jug=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-3kavHCNFNgigpc3sSo4sEg-1; Fri, 13 Mar 2020 14:37:57 -0400
X-MC-Unique: 3kavHCNFNgigpc3sSo4sEg-1
Received: by mail-wr1-f70.google.com with SMTP id w6so4703606wrm.16
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUJwu5mIghgObyHS7qfpHw05F+W1fo3IIale5ma1lsg=;
        b=AuVRZBS8fej0hAA9zCVrhufrIKe9iGvTJAYhwcLPWHLij9UfWygfPS2vXSoNOB6MVl
         c56GHsnD3zvO/kykV/+NO7JNz/tKr/qmZMlOa3SL7tgCLZAm/o6BswgkWgzog1Xd246v
         slhgpcM20YCfx9Ex82+7+ZKRX4sHjkDz6rmrTe+0eWFK0nzmgAhunhy+rD54HvnETfQN
         /35LnA70mIy8c2GQIascxA8ytLX3aRRTnX4oFHYmOcaZ7Xzs+Oa2IIBFXipq/RY7rHFa
         EvTmC0AcvpPlm2IqgBDTi5J5SOD7sggyZ+zsQiLKREYLc1Bj9YrNgiBsdpaU1bb3chxd
         Iklg==
X-Gm-Message-State: ANhLgQ3Ko9kETa6AZwx040aEqJvs5mwApnXaYk4WaXSy1kXPIJ9QSJPW
	YIgTAK1b0neXuROqxrV3gq6eTRjTkpwTKU+ColL4F+XD6Zl3CXD3fyNLF5XOcARdMiev8IcrH8U
	vYsk/876QvU9nNDhm
X-Received: by 2002:a05:6000:12d2:: with SMTP id l18mr18412643wrx.240.1584124676640;
        Fri, 13 Mar 2020 11:37:56 -0700 (PDT)
X-Received: by 2002:a05:6000:12d2:: with SMTP id l18mr18412615wrx.240.1584124676447;
        Fri, 13 Mar 2020 11:37:56 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id l18sm10978168wrr.17.2020.03.13.11.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:55 -0700 (PDT)
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
Subject: [PATCH 12/14] target/i386: Restrict CpuClass::get_crash_info() to system-mode
Date: Fri, 13 Mar 2020 19:36:50 +0100
Message-Id: <20200313183652.10258-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OXUH6F8vEPtY

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/i386/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 92fafa2659..a84553e50c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6778,6 +6778,7 @@ static void x86_cpu_register_feature_bit_props(X86CPU=
 *cpu,
     x86_cpu_register_bit_prop(cpu, name, w, bitnr);
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
 {
     X86CPU *cpu =3D X86_CPU(cs);
@@ -6821,6 +6822,7 @@ static void x86_cpu_get_crash_info_qom(Object *obj, V=
isitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif /* !CONFIG_USER_ONLY */
=20
 static void x86_cpu_initfn(Object *obj)
 {
@@ -6866,8 +6868,10 @@ static void x86_cpu_initfn(Object *obj)
                         x86_cpu_get_unavailable_features,
                         NULL, NULL, NULL, &error_abort);
=20
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         x86_cpu_get_crash_info_qom, NULL, NULL, NULL, NULL=
);
+#endif
=20
     for (w =3D 0; w < FEATURE_WORDS; w++) {
         int bitnr;
@@ -7180,7 +7184,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)
     cc->cpu_exec_interrupt =3D x86_cpu_exec_interrupt;
 #endif
     cc->dump_state =3D x86_cpu_dump_state;
-    cc->get_crash_info =3D x86_cpu_get_crash_info;
     cc->set_pc =3D x86_cpu_set_pc;
     cc->synchronize_from_tb =3D x86_cpu_synchronize_from_tb;
     cc->gdb_read_register =3D x86_cpu_gdb_read_register;
@@ -7191,6 +7194,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)
     cc->asidx_from_attrs =3D x86_asidx_from_attrs;
     cc->get_memory_mapping =3D x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug =3D x86_cpu_get_phys_page_attrs_debug;
+    cc->get_crash_info =3D x86_cpu_get_crash_info;
     cc->write_elf64_note =3D x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote =3D x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note =3D x86_cpu_write_elf32_note;
--=20
2.21.1

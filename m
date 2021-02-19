Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8949490lfc;
        Fri, 19 Feb 2021 03:46:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhOVnNHCj320hRiyp8Ip0NTzcQiluEV1jq3uLYKLT+D0FDV/HIXQJx5FL4c5pXDsIuod+l
X-Received: by 2002:a25:6e57:: with SMTP id j84mr14303037ybc.277.1613735193287;
        Fri, 19 Feb 2021 03:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735193; cv=none;
        d=google.com; s=arc-20160816;
        b=AF4YPF+RuNgUkzpQIT/x5Rak0rHZqBu0flpGvvcGytyO/qszy6DzDNYr3lt5iVmllc
         z1n/1Lc36LTyEjlGZ6psjyEgXtj6Ma1iaOlUyuRNCpB4U/DY65oQGHa8s83v823ZsgW+
         UTM83i17t7vjD+90/ziQaEs8zGgFXZBUeusRr+utv1rxIZ6RchKR0xP1iJPDKYouqUTz
         G5kiOoBJuOEA1PS+5A2Wp2aPggUBLFBtWSC+fxgST5H2/eYgTq5fscZFfs1rRUqQIyeJ
         Ge/iO4B0JdLdjecXUZ8TtWLjCIkQLqEdzPr892SC2fL+vR9Olwhg+Hu0fHmYuclLih0z
         HIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0vt/SIQERosIkjtlGwMC0PxcViyxR2oXSsZjlPDjv1Q=;
        b=IBgA13VBb4oOBM8jQk5/2fDjMqnjMfqlqgFYs5n3mPulp9e1WyEHI7jJFutnMiYL+n
         oz3khpGgh0Ma5UzLSIqmwvX9Lf/slV/no0elkACIrtne2w/35RjHewLwGDyY9wfWGRTt
         YsIpIp4ea2x1TOg5GjZpZVu3hzE10P6gf1jjoB5w4T5L047pv34rJ1Y1NkIJ9ed9lhs8
         aPpHwc/vYugL0eyex+cS8XIfsU2WMEjb0sCGGpSOWT+wbwxcOvqa5QJOGWEQBD5uZhyH
         F/dZkzBv/ioN8z7pY+FFBTomFbQ+nsecYfYouNpzB3hq3FCImuGoSFlMJd4yCGkLHuPo
         3pDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GGDmoaS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si9696503ybn.264.2021.02.19.03.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:46:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GGDmoaS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4Ey-0003vx-M7
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DY-0002qe-Ay
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:45:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DS-00022L-T8
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vt/SIQERosIkjtlGwMC0PxcViyxR2oXSsZjlPDjv1Q=;
 b=GGDmoaS9jdLKVppjy3ZKiJqKVoTGa3BMQYPgvR4WUxgT0zhp/2bjwOPmyIdkVComj0cWYk
 Ew05+C0ezgQwifztGT6ImAVeGF6xP2DO3FXu4xLC4XPQ+prY1JA9SLqmDTTwxlM+UdWi2E
 5UBkk2GzfXL5QRFuIhg77S6dTklFZy8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-r89kjDaIMDSvKAYDe2j7nA-1; Fri, 19 Feb 2021 06:44:56 -0500
X-MC-Unique: r89kjDaIMDSvKAYDe2j7nA-1
Received: by mail-wr1-f72.google.com with SMTP id r5so2346809wrw.10
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 03:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vt/SIQERosIkjtlGwMC0PxcViyxR2oXSsZjlPDjv1Q=;
 b=E3JEJp5/1A23VBuQHIDqsJyks3xQQCpXirhRk7UY5+l2i5xsQEZLSHyYwIR/9TrW/E
 qgUtSiz1Bn4IR2GBOkXuj2wHfxqU8o0XyVz4lkiQuULVhBGNtfBndjngnV5WCCSIwqVf
 /M2RbJaUPIXQSLB2e27y9vHDnI582RP53tHM2p4SxHSkZzkf/VBqYYS5NkdSKP5NB69s
 WGhzKEJq82/p0Wdt/si8NUWra1geIdZbyB46zkQvlZYbIes0vQs++gBiOq8SdsukaN+V
 sohuBz7ZlwuvNs+kjSfZMcs1KThEo12sDrvX4QrevU2ADue3ixN0h27jC+UnsagbcK3a
 CCsw==
X-Gm-Message-State: AOAM531jRx+Vlc9JnoUsVqriL3ATfEc/D6bgXO5mrYMvOx7MWnfACeQ/
 ODgC1ovaNdFfZ8qbdKJwBwPH39PCA2j6wewvuEen/F04vCjHZvRHY5WUcM+J1GGCI6Ggw75/v6f
 cfqQyYFrCCu7n
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr7567115wmo.183.1613735095190; 
 Fri, 19 Feb 2021 03:44:55 -0800 (PST)
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr7567079wmo.183.1613735095017; 
 Fri, 19 Feb 2021 03:44:55 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y62sm13962465wmy.9.2021.02.19.03.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] hw/mips: Set kvm_supported for KVM-compatible machines
Date: Fri, 19 Feb 2021 12:44:25 +0100
Message-Id: <20210219114428.1936109-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w6ll2QU7yNdq

The following MIPS machines support KVM:
- malta
- loongson3-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/loongson3_virt.c | 1 +
 hw/mips/malta.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa5367..c5ef44819a7 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -622,6 +622,7 @@ static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = LOONGSON_MAX_VCPUS;
     mc->default_ram_id = "loongson3.highram";
     mc->default_ram_size = 1600 * MiB;
+    mc->kvm_supported = true;
     mc->kvm_type = mips_kvm_type;
     mc->minimum_page_bits = 14;
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..f06bd3eff25 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1456,6 +1456,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
     mc->default_ram_id = "mips_malta.ram";
+    mc->kvm_supported = true;
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-- 
2.26.2


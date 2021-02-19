Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9206856lfc;
        Fri, 19 Feb 2021 09:40:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySiNkwYPxgwkD2K4yFuImr/oq3LAgUrGqZv8H6FcXzeVpEykw4ZQr1GSBaWyUU6eEl7NBR
X-Received: by 2002:a25:8143:: with SMTP id j3mr15031135ybm.237.1613756400531;
        Fri, 19 Feb 2021 09:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613756400; cv=none;
        d=google.com; s=arc-20160816;
        b=S6rV+aYXqZ3J/0GeURFvZebp03Ynjx14SJYkcQrbVTum2layB0Zg2x7xhyi8yqsMWF
         kxZ344inRM4NxyjBELFnHBtTnwL1tD919D+BAW0c4jf99MBFAk5h454llbyTFZShBxeX
         wE/8aL7aydEzOYlT4WlsaFsW/4vxxDhmmeojT69HxrxexQ7ohUxyChO2Hq724BvGMWlm
         HhwFpTArFIlOK6DhENdOzzTYcTBRFpaj3LNN6kWBHybeosQdT3jSURBHMmfCw2rGH/gw
         6m+i1D09GXaeyd6qM+gtG4s13mLHNT/F89a7FCMBqk1jLsZWYXEJxLi01oE4Otil9y4C
         peVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
        b=tpno8ZRvymGg9CPfnyI/NEdvPR8bJe/O5eSVE81D/uTTVuLf5sNVAv4e8qUjH0pHV+
         nVh+pt2tRLXgvJhRwLHjSM0hOhJWn8lpuNLAD2nzRUsWKDE0dHb6D92O0KoimTJWahPR
         bmRNC2vJeaXCoIAco1V3uAjRjtgNpMXhcqo79JUphyiBQzfhapZGw6UrBrISmnEQLdgn
         gQ3vEyDDb+28YbN/8GpqiLgwnyWyiZ90TpiRP6QbV8SjznfwfSN9Nx1nQh9k0+2+/rY4
         cR407mxkIrD3tq9A/Zce05pzmAuaMjseFYLXPrJKCVxOMOtZaCittWmbEWPLx9u43rAE
         LUUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Q9/iEHjD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si10359443ybm.402.2021.02.19.09.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 09:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Q9/iEHjD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD9l1-0002wr-OS
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 12:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9k5-0002DP-U4
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 12:39:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9k4-0005PH-2K
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 12:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=Q9/iEHjDqTF80Mo33cOYrt6p2Mpt3KYt2U3Ws869lT0OTof6ZPlwvl5CIILLX0q5dD0TsJ
 GREqXguURm4OuiYckfiL8llnByBBclUng2Ga0xYg7sctKg9dbGPCq2yoHwHUfwCC5Ta4Ih
 L4BjB9lWVIOwISa+z4fduSomV3HSW/o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-D0_YtylHPhyk79a7Lgmg1g-1; Fri, 19 Feb 2021 12:38:57 -0500
X-MC-Unique: D0_YtylHPhyk79a7Lgmg1g-1
Received: by mail-wm1-f72.google.com with SMTP id b201so2768983wmb.9
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 09:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=B4BWNDVJUpN1fPj2vYKRiuE9hhOtau9AfKl4uouWM0FHM21o+UNs+IZmOQBe+R/HD4
 n3WCleYgWoxn63kBGsSKJfG06xsz6OUDODUqE8BeXMFv3j/DIDvKlukOvQxPHDPS1r6s
 demmFc0QYVcMqPVyZSx2sTnlu4dZuAbDboMT5szAOthBoaqJ7K5Y1JTH5dz7BMeQjXcP
 AZFmyEukAoeXBXGg7UvBtwN9UgwT7cs9BdMVQt/dNB+1ntruxuO8v9adbTTuJWCdjx8B
 0xcHjiL1gjN+okpldUsb2K6mLOq3KM0v5WKmtSo4mmtCHLNXFYnwp8iYVCxR0u1xT/u7
 pcqA==
X-Gm-Message-State: AOAM533NHKe6EqHFZSuEXBzjyIRRkxA8Jfwronf5imr9Sx2ZGJubTi9q
 7KMbKcS7GegkEWK0wev/pBocgDTI3EIMTXvh2HrZkpbJJtab/6vD9Ulahr916HIdgW2F44JdAhQ
 g+yvSVJn+R0jf
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10395972wre.83.1613756336823; 
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10395942wre.83.1613756336683; 
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i7sm23525949wmq.2.2021.02.19.09.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:38:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return value
Date: Fri, 19 Feb 2021 18:38:37 +0100
Message-Id: <20210219173847.2054123-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFYn36unHZXk

MachineClass::kvm_type() can return -1 on failure.
Document it, and add a check in kvm_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 3 ++-
 accel/kvm/kvm-all.c | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a6..68d3d10f6b0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -127,7 +127,8 @@ typedef struct {
  *    implement and a stub device is required.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
- *    computed based on other criteria such as the host kernel capabilities.
+ *    computed based on other criteria such as the host kernel capabilities
+ *    (which can't be negative), or -1 on error.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 84c943fcdb2..b069938d881 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
+        if (type < 0) {
+            ret = -EINVAL;
+            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
+                    mc->name);
+            goto err;
+        }
     }
 
     do {
-- 
2.26.2


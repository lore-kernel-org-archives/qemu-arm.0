Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8948531lfc;
        Fri, 19 Feb 2021 03:45:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9FElh8+9UD5mt45YKXa7FwKtngliHyAarNgM6ZzGipDo2+ZnWioVG68FANOtTI0iWXcZ3
X-Received: by 2002:a25:20c2:: with SMTP id g185mr14085991ybg.31.1613735112006;
        Fri, 19 Feb 2021 03:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735112; cv=none;
        d=google.com; s=arc-20160816;
        b=rdWcgjYMSgG7N8VivBN8Tq8hJvbaT66nsv6Xr7WLKMd8ZOIaBO7D/b6ksLNNULHbSm
         cUubIQtMba487FUwpgeDAOQzPdhj3KNCBC4mguIsU/n1K8Yo6siUWKLR5P0ewJTO+1Gk
         k5OF99kGB0CiP3q6voHH1gzpBVOQBiRBlCaAmPvNSyb+rFM2B6f/bmvI0n2ah5CBPVWX
         X2Se8uwUY6xA9gVfxmTWUR7v+9P1drGMLdiumxk+J8nMA451ckd+m1wPy57BFlQpmBcY
         Pg3vRMAaPm/YnX90kkqgLJEJ34drJSS8qjx5JJ6B/Hrw3eKsz2K+xEyDIXauJNtkWCLU
         k8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
        b=aJKKdoni5yPJdNBZuqw4W6CeAPdvlFKpG4Pw++SOgbza6lXJ0F7792n/+OG+UNgRhE
         JvWkeFC6mXZei871q7uo0vZt9oR7yRvi1z9juXQwmKnoKIAIPYqBZLTNOV32mkHPpa6O
         Ihl9/wUBthlRThfjuJoMbVLJ/B5VTulBA2YRx8HijdDL6u0ltJreTPDflHlzhaFajm2z
         lWDjhpAt5/wFEiSNxWJdbHgHuWBpX/QMXfTJNKEzXGGidCaPfwL4XbDnvDm0EGLdgWgG
         OnVDy2KsRtWkoVCFx5WkpCc8CKhsRx3R/KdVLm7gIkmafdRIeyLyk1lCXgmFZbj2BDKr
         dPAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NtMesX1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si8713183ybp.204.2021.02.19.03.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:45:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NtMesX1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4Df-0002Zp-9S
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DC-0002Xn-OI
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:44:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DA-0001v2-VD
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=NtMesX1+Zeqvpm9/jZNRgi1h4EN5bIYdcec9PvD9MpsI067OC7+Ra5jscK2053LG5ADn02
 ekJcpy94Oj5PTsbjMqUN8nO2Z96s9GddyUWYUK98lpmDGPq69H171LQ6jT+YtPC1Z8K52z
 4GSvGFKhHf+SvH375bFUqbRhSelBBow=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-adID8lJnMH-Onlj6xJZvlA-1; Fri, 19 Feb 2021 06:44:38 -0500
X-MC-Unique: adID8lJnMH-Onlj6xJZvlA-1
Received: by mail-wr1-f69.google.com with SMTP id f5so2347101wro.7
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 03:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98X4DsBNdk1BN09KWcHx0mE3/gzzTZdKxOLSGajyIeI=;
 b=jdrS48MC8tfPhztKq7BM4fAm9zATxLbVunHAChMtrQA9Zawr4LxFw0wbiffKlcWU/5
 pqjCPHX49ngEqX4jY6X7kje9fwaDjBmlXflk/dttcTS9DXIGtkICZCqyg5aHMVtslegj
 AXJuvAF0LOg/QzOfEg3u078tXsmk0JlU3cDEQl8f007M/tlXLqdEGaI/61r8VQRv8L0W
 4cDlYFgol1hm4Y5hvO2UlFj7Zt+11RauGjvUdEPeAH4UhWCh+Z4WrBBGdlghjiW0iXcc
 ciDnFV7rseCEqIM+68dQBkbu40fXTN5yTQYT3I5oRECJBMIuPvH+GZBj62hvd2INe3js
 8AIA==
X-Gm-Message-State: AOAM532NRWzyMsinT5XGUNR+f8xwTsxYz3h2vBS9/sHnRb8WK0FwkKvH
 U5zyT3naNUYqTPskTUXymfiIh4OoptFejU/ysO/l/XaaSA04HzQdJut2vzu3eTjce1EnHYyX6a/
 f3HENUGOELQXc
X-Received: by 2002:adf:b357:: with SMTP id k23mr8694391wrd.354.1613735077466; 
 Fri, 19 Feb 2021 03:44:37 -0800 (PST)
X-Received: by 2002:adf:b357:: with SMTP id k23mr8694350wrd.354.1613735077292; 
 Fri, 19 Feb 2021 03:44:37 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w81sm11424135wmb.3.2021.02.19.03.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] accel/kvm: Check MachineClass kvm_type() return value
Date: Fri, 19 Feb 2021 12:44:22 +0100
Message-Id: <20210219114428.1936109-2-philmd@redhat.com>
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
X-TUID: e7kqAA5uFI8l

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


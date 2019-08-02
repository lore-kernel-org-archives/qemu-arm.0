Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782372wrv;
        Fri, 2 Aug 2019 05:26:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz513nRDAyCvnO/hIphAp3QNDQ4Rw1KB/aGfkbVU0Zf9x8ne5yA0gr3Rdlh1ZNHJCcDWyiP
X-Received: by 2002:ae9:f107:: with SMTP id k7mr25988013qkg.215.1564748787529;
        Fri, 02 Aug 2019 05:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748787; cv=none;
        d=google.com; s=arc-20160816;
        b=QjdWdhOD4fVLtS4x7LYQQr0TEo8NMRgrMKwxoInati7HNt1u4M2f0sIR6RnXcf8Z5K
         SZboui9XqtwfcmnTnnpZP1x4YI71tyQqlyFDJUFRGnAxL+71quZCcp8N1pxiQP7W/SFX
         BsPfyMMYrLy/qnjla6i+FWWW7TFwcBbF+fT0eGSnTepAF8FEIhyQ5VRKaIaImgJq2Wr+
         5lg+RNhFrARbrV4+wKJlcvU+YcIakQTpDPMxEDb/hyKiJVw6mcO85txrGxiCA47Wh4va
         vg6nZz/O/kwJmF1Jsqg0tcPE39p7Xm+RErDzHqbVRBV3GVGGQnHqCcIld/P0jJ7j4qxf
         m90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=pgHiK7DEHHk3v+qW70skVqe8GRsRq9TWnwwai2Y33wI=;
        b=o05JSA/5BIFEG3sSwHErT5VhqgaRuAgG3PE8fTl4bZiPZ2x8slJDpJqC8Wv/O9qb2N
         dCV9DYxSPqPceCDAQ+Dd4RNA0Vu/xxJ45gLmnql767eSeGEVYMnvdSUYrpCvhSJU4Z5F
         MIoYd6Zhw5C2yAqxayP4ueRxFGUXogrUrbfKAqP6JWHRkh8MevrrcwPaERxi7AnIFws2
         qtnNcBBJDi2ziJIrPBYOP0GITGhUOZS1UbLmaG0z7k/EytcQp2pCO11BHK66S0ptwQlE
         rDNO+vEEjY1ir3JS7JeOsydu99H20QwSynaCvCS6Ak9JCQpUnRPp5G8QTDzsaEPIJCuK
         K1EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b10si35785828qkl.371.2019.08.02.05.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD4AE300BC74;
	Fri,  2 Aug 2019 12:26:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 528B85C205;
	Fri,  2 Aug 2019 12:26:22 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v3 09/15] target/arm/kvm64: Fix error returns
Date: Fri,  2 Aug 2019 14:25:34 +0200
Message-Id: <20190802122540.26385-10-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 02 Aug 2019 12:26:26 +0000 (UTC)
X-TUID: hdRxQZgmaByO

A couple return -EINVAL's forgot their '-'s.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3d91846beb8f..ddde6268b9d0 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -854,7 +854,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
-        return EINVAL;
+        return -EINVAL;
     }
 
     kvm_arm_sync_mpstate_to_kvm(cpu);
@@ -995,7 +995,7 @@ int kvm_arch_get_registers(CPUState *cs)
     }
 
     if (!write_kvmstate_to_list(cpu)) {
-        return EINVAL;
+        return -EINVAL;
     }
     /* Note that it's OK to have registers which aren't in CPUState,
      * so we can ignore a failure return here.
-- 
2.20.1

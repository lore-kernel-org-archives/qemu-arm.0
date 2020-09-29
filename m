Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986304lfq;
        Tue, 29 Sep 2020 15:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ+fG+NbI+I8DejhK32eKEOJDZfK/Z/+BhhYJg4dGCTjCWRBEkRPgWFFUeGQK6fId7Mqb/
X-Received: by 2002:a17:907:aa9:: with SMTP id bz9mr5910256ejc.421.1601419479851;
        Tue, 29 Sep 2020 15:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419479; cv=none;
        d=google.com; s=arc-20160816;
        b=oIvTz5yMcdKRRUVgezRmNIgECNLsh+eKSH0XhLzA/YEmglSqvr3v5JmhiSKWRfqrDe
         sKdvphj0uTI2ANumXTAARTibyoTj9Y/vjpWUHXb97leHNVpacYRvHaqfnyNJFw3qMQXl
         ROVKPrVKWxmsTGVCnkNMftVFhve6j9kdIsbM5numBMVokPRAXjKBrJA7MjfZ4qmZ4ca5
         rr46YVXCj4VyZDFWnA+e3Ux7wV/xaVHPPg93cnzAeijwuGgmqRB/wQbhT/dQWoIc4eWV
         GiIxgmH5gu6FveeytW/OTJ/k2zybbONcNnmsxj7KyEHNmrH/eCn9TOCCcpatfcZjB0OJ
         KE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O2ptRm8f/lOeml0jS1cRqmJHNlSkXaKtAQigKfi/TLU=;
        b=Qg80csIzCqoafOC6XgScyFIgLsgsaNn39gRT+94V7MRDgCtQCUPE37iUHRhu6a/Krp
         3oO71vgRbVaPDYW6NiIlQLOPCZxVqslFYG171rdmbzBm31b+CFxLZZFJFfIUcJqE7Uka
         bmkX7PlZhNfkIvAbOTB+O62czFsIGN2qW2+zsZg3hi05rSmfab2FNtiylW9eQmphH1Ei
         NAZdvCOj5n6815VWK6DCa3NKk13ItToXIHZQO2yvvYCox/HCGFD44vV1HCSvCg4qAWYi
         74EWnTOhuI6Q5+zB9+qeUanKHE5yrcrMmKslmn5Wgimm4wrSTccsLymk0pTkJGOrgHnh
         vlVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aWZBjCBO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x2si3518672eju.153.2020.09.29.15.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aWZBjCBO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2ptRm8f/lOeml0jS1cRqmJHNlSkXaKtAQigKfi/TLU=;
	b=aWZBjCBO87iSv+zMdp4m5OZ5aG04YCqBszF0AWk8tOze0plZcdK7WR++UhsQ9+/WTA7zxn
	L9comcff5iaFGZuLpYYsbup0oeu6/8eWlNqFJ8T5MbOa+p+muYOxsyxH4SiaFDKovrO6sN
	95pHyV2HooH4mkdXjDHJ/8fv/PltwBI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-fWRfr4FCMrCxoY7RHP_QNg-1; Tue, 29 Sep 2020 18:44:35 -0400
X-MC-Unique: fWRfr4FCMrCxoY7RHP_QNg-1
Received: by mail-wr1-f72.google.com with SMTP id l9so2330552wrq.20
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2ptRm8f/lOeml0jS1cRqmJHNlSkXaKtAQigKfi/TLU=;
        b=DPdAQ2cLk+yQm1wMbAfgVFyh892KDyUbI/ceacS+u1ixel6lKGs5lbV4j0k277IrH2
         Tg9O8rdnz/tf78phgtg42BprsqAoEYtHjn97lGKdYi7+dz2O8NxJbDuqjoYQsk9hpMcZ
         +D3bjoqYZYvK5Wv6DF9dXsc82bPGILDOijt+pbBOE2Se7HawlH1vZY/YT1TZ4QC2r83S
         CuY7B3hN/kx0dQwCgqz8aYE4jA0usMVXY5oZiyqnMWZHMxteNHosULbHLhOVcNt8GvEu
         an2IYcRldGmc5sO/gIc5QH7liDxlkZ6PaJt2fruaLyFUKE8ZJpG64oP74bx3P1tRV89M
         Ih9g==
X-Gm-Message-State: AOAM532TTmtvFBGcYwXkQPU1GXhC0IQLgMl6vv9+9emICDTgFKyT9qTW
	VEqvqIN51XJwGEDJ2cR0lnvOsXCjlXrzZkOqN3d5J3fv3BDj/p3d0ryux9xZuyOFc8FBvGAqhau
	/MQK1qnR7Clwa+0K+
X-Received: by 2002:a5d:444b:: with SMTP id x11mr6634814wrr.402.1601419473912;
        Tue, 29 Sep 2020 15:44:33 -0700 (PDT)
X-Received: by 2002:a5d:444b:: with SMTP id x11mr6634802wrr.402.1601419473707;
        Tue, 29 Sep 2020 15:44:33 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id m10sm7056524wmi.9.2020.09.29.15.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 07/12] target/arm: Restrict ARMv7 R-profile cpus to TCG accel
Date: Wed, 30 Sep 2020 00:43:50 +0200
Message-Id: <20200929224355.1224017-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: C1r7hmJwgNGk

A KVM-only build won't be able to run R-profile cpus.

Only enable the following ARMv7 R-Profile CPUs when TCG is available:

  - Cortex-R5
  - Cortex-R5F

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e01eb55bc0..7f19872722 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -10,6 +10,10 @@ config ARM_V6
     bool
     select TCG
 
+config ARM_V7R
+    bool
+    select TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -358,6 +362,7 @@ config XLNX_ZYNQMP_ARM
     bool
     select AHCI
     select ARM_GIC
+    select ARM_V7R
     select CADENCE
     select DDC
     select DPCD
-- 
2.26.2

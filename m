Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232524ejc;
        Fri, 27 Jan 2023 07:16:01 -0800 (PST)
X-Received: by 2002:a05:600c:3b86:b0:3dc:19d1:3c13 with SMTP id n6-20020a05600c3b8600b003dc19d13c13mr10876325wms.12.1674832561744;
        Fri, 27 Jan 2023 07:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832561; cv=none;
        d=google.com; s=arc-20160816;
        b=j5vVEJn8al+l5uuN4Dg0+GJdDJ5G7ztgkfL4RENN6e0P4Wr92+Q+Eh/8mu1jxJGZ8o
         8SfeFNuvSg9IO2RPu2RBkHqsulEKDkR5nwyHVk28rdPXRQHzg4W96UNJRB64+4mLixgT
         q3BcXE6P/hOqtg1ZOcaCbdl7u6LS4GkMCrv8pmEfVZVn2O7GcJmhU4TX+22zpihrU88X
         9T4JOuS5r+cIQmxSCbcFs/FFgNolljA0rV6gaS0Xf08C72VTl/nQBDHXWV4guHhZ3zb/
         5MWF59COIRbcbPS073SR9DifEdNVVJQDezOJZYI+EBS7agbTTsbr8dWIuP84uS6Rrx6/
         BF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6ywqj05UIg3deHK3wVqj9WoSaWiZ3oE7Ec+4/n7JA1s=;
        b=nUW9E82R9B44lHN6eyAlguQ8gVSSafruAmqDSzxxYtgrdIE3VH7sBdrs0vVtiJd2p0
         l5ihLJ6psfE6z+wP6zUUCvSv9u/S1KED0yInSDzu66tjBEi0bCE/j8ZYM0tM/w6+uaoK
         l+h4TDfpJfzbZH9SwD/rOy/T+ivCZGcNpzf9JqwnI9/qYySxr4rLh+2EH9xIFf2fr68e
         eKOxWNiLbckLejzuy1j+YPYLQck3ZhLyIS2lFNxkI/Nlz1wgO6+Ork6Z9EcJc4gBm07d
         lbwpPyDEozRtv+L8M8erI90VnkXlVMSAwB6vPWU5+Xj1La1MVCZ+B6RpdEfYeOlwXUAr
         CRnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mp/VxvNb";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6-20020a1cf706000000b003d9ae6cfd40sor2964924wmh.0.2023.01.27.07.16.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mp/VxvNb";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ywqj05UIg3deHK3wVqj9WoSaWiZ3oE7Ec+4/n7JA1s=;
        b=Mp/VxvNbrTud0uPK6XiOgp1O24LiHNx5JpZvdntYF19EZ7D05iBgsRocJF6rvnltu/
         IQO6+pZA7hr+JWnqCx+HH3ZcNYK1bnaH+lwPDWxXMdyW2Xa6ET5q9VVHFNdZjSr5gHWk
         FuPjLNnF2G4CMVVxEy8MgHfd20xfLLDFzkcSvBX74icFfiewHa55DZiojFlSGvhbZyvY
         NZV9e1SYdFSWjLmbWchV/LcvCG9sihrwNgBqwyKp+efwndyoeTbVGlFSRKeJy5SLn5FC
         MCBsaGp85SUjIW7AReu7omNLaJlSk8oFsd6LynejNFIDBxWPkSI9OLulG3SglLLZZxio
         Fg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ywqj05UIg3deHK3wVqj9WoSaWiZ3oE7Ec+4/n7JA1s=;
        b=oiHDBoa3FkQDJ3vYMt9ndW4NFCdkuQEkyShx7qq6Qt6A8jaWzFpMSvFCtmBnjJJ7b+
         A0Q1/lsxiIb4ifPJ8ZzsMs0p2kHho2wuXjSLazkHvWqai/LbpA4qnHu7qR7PdGfTx/L4
         /dUYBcLzjhbFuGXMhCKKBGVFQNOoyyBHCUELzYdGgaozTYb1Vz2Oie/76M7Us+D1FpiC
         DijvYMNCsyCIy+fJ4r3FDyoWT1DoNiJNSqnXWCeQQhR1TR/G27eDYH8D8W9jSSzwiftP
         vBrC1YYbQfPPB3aywa/FcxWk89h8/Wc8EeD1/iRjrBakLPzDf9vUJ+JoVHJ0AgQeEBmR
         KAXw==
X-Gm-Message-State: AFqh2kpc90Kcgkt5mGrYWC7JCHSPG5xFUhxYECPog5+Z3Wj8fEYR9VxU
	HB9mcjboaxVfzIkN4zrj20RsxAkE
X-Google-Smtp-Source: AMrXdXtWCmF4+HftbHumXFJQdxVCrhlup0cBDuG202o2que5J8DyWfdH9HYh4ojM++qs44GxNW1hzw==
X-Received: by 2002:a05:600c:1c9d:b0:3da:db4:6105 with SMTP id k29-20020a05600c1c9d00b003da0db46105mr40540319wms.37.1674832561473;
        Fri, 27 Jan 2023 07:16:01 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:01 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 07/16] target/arm/kvm: Select RME VM type for the scratch VM
Date: Fri, 27 Jan 2023 15:07:20 +0000
Message-Id: <20230127150727.612594-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /eqxK+PfOvfk

Although the VM type does not affect values probed from the scratch vCPU
at the moment, it could later. Ensure we specify the right type when
creating the temporary VM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Does the PA size need changing as well?
---
 target/arm/kvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index fcddead4fe..d8655d9041 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -70,6 +70,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
     int max_vm_pa_size;
+    int vm_type;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -79,8 +80,10 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
+
+    vm_type = kvm_arm_rme_vm_type(MACHINE(qdev_get_machine()));
     do {
-        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, vm_type | max_vm_pa_size);
     } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         goto err;
-- 
2.39.0

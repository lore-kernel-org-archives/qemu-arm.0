Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1658040ocs;
        Fri, 30 Sep 2022 04:39:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM75d3eEzb4G5Yoo++QcgMPNo70jbBxB0akpLdxlT/3RMSJ373pRORguGDRCMcq/I1BpfPVO
X-Received: by 2002:a05:620a:4729:b0:6ce:e55:b6ab with SMTP id bs41-20020a05620a472900b006ce0e55b6abmr5539668qkb.36.1664537952649;
        Fri, 30 Sep 2022 04:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664537952; cv=none;
        d=google.com; s=arc-20160816;
        b=x+tPQEw1P11oSxIZVmTgAeqQvZcJ2XMK8HTrkBHiM8+ZU4c+3jdj4smia1dp9DepUq
         glT1PJsugteJRNUEyYpJcp4TfT81SuWQb93FMS3NMeO9hPBZMjn3We6nwuSggg60x8uK
         TNajafPFc+IB9zIQWj6qTXqQflunsW89runIdeEyqKbbYaxk8EpHVgcZtdapsviLDm7M
         Exhb7MhbCjREsPRh/MQX3yX9AlO3+Ujf2y80dqxQ3NXT4lWfg0mSxOrhX2/pEO/nx6cj
         qCRe6SoXlDWIAHwjju/WSspAax9oHApCw0ZQV2RIhHIsIkB4BQwnkJ4D1bbwE2GmFjmg
         AJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+4aLiqQ8KIdEY41na51qPEkuVYOkht+mGBrTF+/kit8=;
        b=e/ZKMbJEwJ+71f1HmX423YsViZvIHdtlUzRxwURFl0hsgD+ulTr78FFOzF6u2RYYcz
         nRqmbNQF1iHyd4cT08QzK7OScX8RUdkBu9AjHgpUuGU9W7fuu69q/Tn3E5wV9kgoPYNC
         v7spV7w0fTbdjs0I3nSiMmxdXOVgiNz/BEJ/2zxMK85Otg7tQY5UyTngrk2Cvy+RDMGP
         XeaqOEzWKf6AmR4Xe/BZLgkOe0y/SnadvUqVvHYoneUtE4eUGJ6RnseTyYkKWe3C6Mt0
         uk8SMCDtqvx+kiYp/DGfTFoF+q8f7UDLhOhJJ6kFoM0G5SxUiCkXIv1V1wVtb0sk/7Gm
         L/xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vRRh/bEA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05620a454c00b006ce275f9bbdsi1152477qkp.552.2022.09.30.04.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 04:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vRRh/bEA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeEMJ-0002IV-Sf
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 07:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeELf-0002Gy-O3
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 07:38:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeELd-0002kE-Hf
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 07:38:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f11so3751420wrm.6
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+4aLiqQ8KIdEY41na51qPEkuVYOkht+mGBrTF+/kit8=;
 b=vRRh/bEAqiVtM18ZODiv3g6JpS1zfJwcjGOo06AuehB4ry1q17OUfSChfoow7Pejn0
 lP3N0PCxCDNe2ucj7ZCrQ0zHVIEXwzpGjBPqRmg0iR8sEJer3qWU25DJLKMrhq7PIc++
 f/BMacGnWdHziSEFT1RsTC27y4ZHnvTrXEmA+RCVBUtdQcyya30SaEPtlN+wKWhkzYJ0
 WbKUdHnN63ZegrG+eA4GHxTLYRF1Mb8BxkBohrup4KI/Jnn0KLso6FSptP72XoI9fDwV
 OLEmb1VD8PFNklasHYZY12yhpGYbYFi8c6B6rJpZWjbxSBQfw9Th1tfvpJrt0mHeYu3m
 JN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+4aLiqQ8KIdEY41na51qPEkuVYOkht+mGBrTF+/kit8=;
 b=MQdiBorJCu6I3RC72WTu5Ib50dUXorXsFDVGd+LTfZEdZR3h4wODNxHP4hFFdgzRWM
 T3GC7Ew0avz02DdbMp971NPp3iPgTACm/UTfK3vazRCFYsqfrONkQIR9cqcEjMoB51I6
 JHGcWdkVwnkYek1bpoOQE1hKArjhzctUuSnYfQXF8NKoeb+DNXKFt7B8Vd40YR4f7PwU
 sWk45TOnp2jBG1AdUWOZNdPmAsm0Pr59K+enknlSCiUtmiHqqQ0UYbDk8aeLifWdQS06
 E3ymWjKqgokHCqNbnUWVo2Aa/9oGAgdkKl3vHeB4tOfiPTZtV7h/iaGalRq8wCzJlDOj
 X36A==
X-Gm-Message-State: ACrzQf0S1/O5kKtae17eVOKCbJFZ0COSxTvDVev7WBobaES3yWCtOqX2
 +xX7YQXL5JVhUTwKgw/1Bfo6rh2QpqvmoQ==
X-Received: by 2002:a5d:584e:0:b0:22b:724:11c0 with SMTP id
 i14-20020a5d584e000000b0022b072411c0mr5287048wrf.225.1664537907088; 
 Fri, 30 Sep 2022 04:38:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4ac9000000b0021badf3cb26sm2150008wrs.63.2022.09.30.04.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 04:38:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Date: Fri, 30 Sep 2022 12:38:24 +0100
Message-Id: <20220930113824.1933293-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v3tgqDjOP0jc

Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
there is no pending signal to be taken. In commit 94ccff13382055
we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
generic KVM code. Adopt the same approach for the use of the
ioctl in the Arm-specific KVM code (where we use it to create a
scratch VM for probing for various things).

For more information, see the mailing list thread:
https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/

Reported-by: Vitaly Chikunov <vt@altlinux.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The view in the thread seems to be that this is a kernel bug (because
in QEMU's case there shouldn't be a signal to be delivered at this
point because of our signal handling strategy); so I've adopted the
same "just retry-on-EINTR for this specific ioctl" approach that
commit 94ccff13 did, rather than, for instance, something wider like
"make kvm_ioctl() and friends always retry on EINTR".

v2: correctly check for -1 and errno is EINTR...
v3: really correctly check errno. This time for sure!
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d29..1e4de9b42e3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    do {
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.25.1


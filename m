Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp668655ejb;
        Sat, 22 Jul 2023 00:53:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHKK5rF9OMJDwKCfsYSjHtJPcmO93LhkbKpWiCCzudALcLBxNa/9Y7O5/oTKuAURWjYF1LU
X-Received: by 2002:a05:6a20:549e:b0:12e:7ff9:b612 with SMTP id i30-20020a056a20549e00b0012e7ff9b612mr5376355pzk.45.1690012402330;
        Sat, 22 Jul 2023 00:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690012402; cv=none;
        d=google.com; s=arc-20160816;
        b=frFz3ucEV166Q14yRfS19cTIMZwQfg9Z9Rv/xFJff4zSeg7nGKgKx/2uWLZA5lWr7+
         j5RYBnoHcG3tiGpv0H2YURKQ2dzPbscTLrzMVYRNZgalJeXZ37oAWtxSFd8GivSkHxXS
         ZlcgmW1pBk+WDNqNs7QDQnXH3i9OYxdrbpAKacawcF6Y7pNiT9V1lQAk/fgbo0wAH5d6
         FbykXRW9f+mU/PE1h58/WQ0w69RFWmewxq3mF9kD+5Y9OOI5u8YdChBtU3baQbkKoie3
         1jqCai10mJeUcfui1PwWf///9HeKd0fp3QqZHr0sV9ZTmplbTYvQdPwrfvUAQM2mxwW/
         Q5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:to:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:from
         :dkim-signature;
        bh=aiO61RFWQc576A2x8jBmto7Eq50nA+0j/FFgWXdA55I=;
        fh=mJ5OFdie2M3iVyZL5TpDz8DAfFZC9/SE7DnU60sOZu0=;
        b=pzRMxnV92p9qWYpGb/aD4i66jeiU/zsoGAjdOT85lyf5rq9LsRBFQTkUTPTjGNYOI6
         aGTyirPSBSSHl/kSqgQRhWucCERhplu3p0kDF6wzsGARubb1OY0XZryPfVxkBpZe9UGf
         xiOraTfmHk+BaqitVXE7c0LDfooLYLN9xgCwY3W3EJZjEsqTPN1ru8TS+x7HTT8UByh2
         dqtilr633u8F0aEeg032qb/jB46i4bwF9/0Mj8eJAW6E9KzZ3BISt5bYjr4v0vNDwBdB
         XTA60q7q4pIpkT0KSZhsZ4t+UYV7m03fQ47QmmUx4ToIHsrNa5phQNW1b/cBJ7yqjCzH
         OXAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=V7HDO7h9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id g7-20020a63e607000000b005575b3902c1si4687456pgh.346.2023.07.22.00.53.22;
        Sat, 22 Jul 2023 00:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=V7HDO7h9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjGVHxU (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Sat, 22 Jul 2023 03:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbjGVHxT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 22 Jul 2023 03:53:19 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFF22708
        for <kvm@vger.kernel.org>; Sat, 22 Jul 2023 00:53:18 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bb1baf55f5so20598375ad.0
        for <kvm@vger.kernel.org>; Sat, 22 Jul 2023 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690012398; x=1690617198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiO61RFWQc576A2x8jBmto7Eq50nA+0j/FFgWXdA55I=;
        b=V7HDO7h9cMJQuoPaix0ohqhZbGjhwfcE21W7k9j8a9RL0z4OSklK3Ozp1/pF/2D5Ze
         wHNnIBVHARgb9QZGB2Q6IlSnZfLGP8GZiHrn+nGZNrR2P3oibMTlrfeKZ4WjqciR4e8P
         /Ggu3omGCX/RjZeJdiFvz7mlZjl8FY+URnd1rEh/kdE+S4I0A/TGjQBPjl2kQIo9S+zi
         eVkh4FJsbOH8ityr79518E4fKiy2YFOIbajqIh6vCNw2GFoGi0KPnlp800B4oLYL00Zh
         D21ndlGqCOPoqc1A3lECbEpJSGRsNsDnGyCWmO2Bv7jokmk7L2hcOurnqcgQZRb62SpI
         JNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690012398; x=1690617198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiO61RFWQc576A2x8jBmto7Eq50nA+0j/FFgWXdA55I=;
        b=jsdZV5QRozblbGXw+UezkNMc/9UXp91P4PiXQT7fcDlq6Z918vG0P5DzlyzcLWbYhA
         nsEY1dF3TEMBPy7i7+TKSC/5hjiTPtAM0nrwrkxYWRnVRI3Pxeiba6zL5yoRBT5IkfX2
         3DZk0m8/qsceOPapkKScN7DEmYcqGc6LeSDpcuKNLD2Om3bSLs+1ZdqQqOKklRW0OX9P
         7cbSQoBGT+cfJwWP/0ieGWVKOAthire/h7rh0nX90rBLRsh/ABH2LvK8D7BVmx+Rb46y
         yjkLZH0YangjP375ZrbPIcKOsr9wAaA7NTR0ZmUZtaxY9H2yE5XYrdch0JZKfBx9K2QK
         ayzA==
X-Gm-Message-State: ABy/qLaY53E1Igse5GZFPXrLzhIuGBbsAKp4PfX7zDMRfHZ/WwVRvAHD
        1PfYfG3OuAHqpoUs1glLdh2bjA==
X-Received: by 2002:a17:902:d512:b0:1b6:c229:c350 with SMTP id b18-20020a170902d51200b001b6c229c350mr5599213plg.18.1690012398241;
        Sat, 22 Jul 2023 00:53:18 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090332d100b001b86dd825e7sm4753119plr.108.2023.07.22.00.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 00:53:17 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 2/2] accel/kvm: Specify default IPA size for arm64
Date:   Sat, 22 Jul 2023 16:53:06 +0900
Message-ID: <20230722075308.26560-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230722075308.26560-1-akihiko.odaki@daynix.com>
References: <20230722075308.26560-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: GAOiHTnMOkTa

Before this change, the default KVM type, which is used for non-virt
machine models, was 0.

The kernel documentation says:
> On arm64, the physical address size for a VM (IPA Size limit) is
> limited to 40bits by default. The limit can be configured if the host
> supports the extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
> KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
> identifier, where IPA_Bits is the maximum width of any physical
> address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
> machine type identifier.
>
> e.g, to configure a guest to use 48bit physical address size::
>
>     vm_fd = ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(48));
>
> The requested size (IPA_Bits) must be:
>
>  ==   =========================================================
>   0   Implies default size, 40bits (for backward compatibility)
>   N   Implies N bits, where N is a positive integer such that,
>       32 <= N <= Host_IPA_Limit
>  ==   =========================================================

> Host_IPA_Limit is the maximum possible value for IPA_Bits on the host
> and is dependent on the CPU capability and the kernel configuration.
> The limit can be retrieved using KVM_CAP_ARM_VM_IPA_SIZE of the
> KVM_CHECK_EXTENSION ioctl() at run-time.
>
> Creation of the VM will fail if the requested IPA size (whether it is
> implicit or explicit) is unsupported on the host.
https://docs.kernel.org/virt/kvm/api.html#kvm-create-vm

So if Host_IPA_Limit < 40, specifying 0 as the type will fail. This
actually confused libvirt, which uses "none" machine model to probe the
KVM availability, on M2 MacBook Air.

Fix this by using Host_IPA_Limit as the default type when
KVM_CAP_ARM_VM_IPA_SIZE is available.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 40f577bfd5..23aeb09949 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -249,7 +249,9 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
 
 int kvm_arch_get_default_type(MachineState *ms)
 {
-    return 0;
+    bool fixed_ipa;
+    int size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
+    return fixed_ipa ? 0 : size;
 }
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
-- 
2.41.0

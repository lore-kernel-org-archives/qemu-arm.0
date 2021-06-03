Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp418433lfa;
        Thu, 3 Jun 2021 10:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysTCmKdXs5AM7C3+OhsziwOfoMnKhEJGJ2EcZ9rQp1CbDIFdtFB9ZWlNo5apXLKFl6FNFc
X-Received: by 2002:a67:cb9d:: with SMTP id h29mr363159vsl.2.1622740527554;
        Thu, 03 Jun 2021 10:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622740527; cv=none;
        d=google.com; s=arc-20160816;
        b=RrI0oCYmLhybBjKEg/RlHtgZF/hXX6TA93zMM86pxZxz7EGft0bAd1cWh20D0MwHif
         YL3xUFx76l3vhD8Y8PYGxpsHY8yZATfchCD4pPvy5/hMyEod1zSLaCc5Ml/vqY3pgTx0
         fGMDI0yliVU8jHtARkdav2rBQAF5nXP2tic14bMkiDPB0jGgLC83vrzFTx2oDouWasxv
         zrp8nIJAjU7UssEEqa7hxYpgu85ym5r3cirfaBiy+o/SlRBd9sjgWe+EA74bbVYRQg1s
         Ep5AA2VqDFYZjPeyk3W29dCX+dvIr4vuvMckltZFd586FNAKvQ5+UYrSOKa59VuOYqBp
         Y52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HH81j5I+nn0sGSIPvlymA5OV7omrfdBZUURJAJAqCcY=;
        b=0E6BettOtVLT4Lm0Nx4LxqYnO8r17AFZ/i/26cevRLEW2R/FVbsK2vLYEwz/i1nDTI
         ZvBjvwWqSU3KaS5zFOmEZ9s7R21J4pp6FmlUkldvbMyYK+PZXJlEGCuUurTHbD5CQmk3
         a1Vzr/KLqp/Cx0ovvO0oVKSFC5ZpcKlOzDTcYvWKYivJEG9s+WypzS/J9ogYPaLy7eFr
         KYzlE3B1wklr5NFC2xvsyNwvbmAWie3SGfz5O4SJcTeYUkI4j3JsJ1k3Ns0wvvwkLJkg
         nf1tHJgs7oJYZGWxILdowPYNfouORbVbdwiGoFRnIVYMhxZkYCHHnyvx5ui7ORo3kzUw
         dGDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oW8xtR9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25si1138192vsl.151.2021.06.03.10.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 10:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oW8xtR9V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loqwI-0007Zl-Qp
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 13:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu2-0002EK-Vs
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu1-0005Rs-7g
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id y7so1978019wrh.7
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HH81j5I+nn0sGSIPvlymA5OV7omrfdBZUURJAJAqCcY=;
 b=oW8xtR9VBrPztk/cTN4LLXbGDhSGom+DFMne+lBwg8QM2t2FcjXYYd6VL4VDMUV4Mu
 MFuRHBirPPf0FvRCUzxtJQOUeNs3NK5imQxEhXap5oO/iUrNZM2bqcvxSDzIIFdi1FDp
 5WSCB+zd+AJgKcNBFfrjErlmxkYpjU/iU93uN5dGB5UFdPFGN0198yabRA6dKjJ7wwn8
 Zno0cyTVj6+U65yBefbZPfAzj3sAWgK8grT6XBeMkk6eKRnWL3mhZnjX7OQ6rhXi/Yuq
 BxhPoOzq9mmfQ+ojK8vt+OVPaFoZzgmrOjkSzegZvBKYaNAafTzQVk9XY3M31NWwciUl
 krBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HH81j5I+nn0sGSIPvlymA5OV7omrfdBZUURJAJAqCcY=;
 b=YH5d1KE5j3ECSF3vWIm3gJjNoynSLRDpgs1fxwyd7BE1T9f9ofiVV61ina/PYFk6c2
 gs/OSVIw+9f+s8eW+uaYNcsUxL2GygZDa88UQebSRtaWxrda/z65kCS9HVQV1PCYiIX7
 GmVfiwZ5MuhnthJ3nnL5jFSyliN6B0C/Wkto9TNmFkDepwLsJrSzxC6I0GXAVRavgx39
 YttnRiz1mE9u/alEgbIvCGbFru0ILN3rWYBjCcG8+nTXTSzJW2Oa2plyyccvEAnJfFPD
 1xfYEwWfBWmJ+Tsi0yA2lLWsY6Eww5hIrdi92QwwJfIxVrjLDDjDHXVWjhIBNnjFGGCV
 TVZg==
X-Gm-Message-State: AOAM5332917DE6p5VUupE9ZbCed4S2yj1JdCkm0IVgTEjZVmweV2x75M
 3hgRwXKm8wVj/SUc1BN8W3VQ+trGKI2CnVDN
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr13659wrc.273.1622740383960;
 Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Use acpi_ghes_present() to see if we report
 ACPI memory errors
Date: Thu,  3 Jun 2021 18:12:59 +0100
Message-Id: <20210603171259.27962-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
References: <20210603171259.27962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WQnpglbI/r2T

The virt_is_acpi_enabled() function is specific to the virt board, as
is the check for its 'ras' property.  Use the new acpi_ghes_present()
function to check whether we should report memory errors via
acpi_ghes_record_errors().

This avoids a link error if QEMU was built without support for the
virt board, and provides a mechanism that can be used by any future
board models that want to add ACPI memory error reporting support
(they only need to call acpi_ghes_add_fw_cfg()).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 37ceadd9a9d..59982d470d3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1410,14 +1410,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
     hwaddr paddr;
-    Object *obj = qdev_get_machine();
-    VirtMachineState *vms = VIRT_MACHINE(obj);
-    bool acpi_enabled = virt_is_acpi_enabled(vms);
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
-    if (acpi_enabled && addr &&
-            object_property_get_bool(obj, "ras", NULL)) {
+    if (acpi_ghes_present() && addr) {
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
-- 
2.20.1


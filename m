Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1100103ejb;
        Thu, 27 Jul 2023 00:40:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG1UaCUGMP/cx/MczOjRawQzeF8Oq1mBt4UD4ElUUyYr2glRUzz+n4d+U73m8HQbLb1Fb90
X-Received: by 2002:a05:6808:2195:b0:3a0:492b:f07b with SMTP id be21-20020a056808219500b003a0492bf07bmr3083323oib.26.1690443606213;
        Thu, 27 Jul 2023 00:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690443606; cv=none;
        d=google.com; s=arc-20160816;
        b=tc6QxfXZUoLzxf7F2dUgpJw52EG0rKrThj2yuttzoduc9sUKHexQxa2k5A4T4lylAZ
         6/YeUx8F+G8yTLWMhG/vzkWOEfuPFxEp9xsWgk03KAujgTmKR3dwFFpl316Tv1dyU3iG
         YhN3RSiYQhUBA6n8AoXi0c2RQtDYuhIPGbalB5OT1kEy2wronuXE6IW+0s4xOjXShV6O
         scfQecIrXetGZ3ZU9fbKSIazHpcxLMpI+CJrzpVCyAPdQnciEuZmJhSdgBAt5txnxUq0
         3hlI9AA/e24RCvKAMAYLZBWBMAddNvoaLuDR8V9BKhSj3m6WjA+QAUJYNbW0m1XWajyd
         LgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:to:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:from
         :dkim-signature;
        bh=WUXy3jNQsy5PFGPCh7DZInihQgiJWpSfcmP70S5aNLc=;
        fh=mJ5OFdie2M3iVyZL5TpDz8DAfFZC9/SE7DnU60sOZu0=;
        b=HP9nZZvG/esGzz+ON4YHEF0dSRTDs7I1g7kwGn9CE0g7XRZ20xoKM2uI++D56sk70S
         d/wv20kiWg4J9cjHq1EdN1OFoZLhJmaFJMkH1bDUNv+jC/IlxMkz/LjJiLbTRJeHzigC
         k7n3hGz10XS6DRBxuGIalDoKDj78Na55nd5Q8HD4I62E7fwrBc7v/I+gbJvQNW5YX/Oo
         8fqfsVBSRK39SvCMTN6Ob5ELLstnln8u2p9p9Dklb0GCqoF/4+okvGnsP3iofjm17iEF
         0FYqVQOu6MLS2S9CNEkdAcO5DbsBiRRvLkkfzhep8KUfs2W1Lgx/r+1eh8HqvpPChfD1
         NScw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=ErRkuXID;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id e24-20020a635458000000b00553854417e2si848058pgm.244.2023.07.27.00.40.05;
        Thu, 27 Jul 2023 00:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=ErRkuXID;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjG0HkE (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 27 Jul 2023 03:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjG0Hjm (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 27 Jul 2023 03:39:42 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0567D3C21
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 00:31:55 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-56584266c41so505797eaf.2
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690443113; x=1691047913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUXy3jNQsy5PFGPCh7DZInihQgiJWpSfcmP70S5aNLc=;
        b=ErRkuXIDzI8EHN9RJalhLqdArv/g31OAVXPGZTxhgwm4bIExhwd4UPvDSRIJztk0ij
         8dWy86F8eEhs10cJ1ENhkeakq42mIoofDOZdQOKp1dEds0/JRCqiJ6HhOsJMRH/UQnvu
         XZ3bA41tzhxdLnEh+dDQKRh2JsZUz6k7Ciz62r5xlvsrQU86dTcuykBVsw2e58Qcwso8
         oeC7DWP3Eel+hhwJofaR9D77yQAaLpOYeISbfXP02vDpcNchsJN0ZtkS9B/TzAEhitnB
         vv0Vtdgo+pg0o+ZyyM+7Ds0RSgM1M0+ZdxfW0PJGJ0PUhPfSAH1XNeC+9zU3Pp0HHl/8
         hjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690443113; x=1691047913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUXy3jNQsy5PFGPCh7DZInihQgiJWpSfcmP70S5aNLc=;
        b=lVPdrmr7+KxOVbs9cmGPbov09roP9fdL4s60nShCfv63jcOv15Lfov6u4qU7bNdmOW
         7R2tTZWLKE1x7suhCmTfjtTmFsc/QvevpedJmb3yek3o/s2ZrckxaZDpZMnV3jLeqU1z
         Xk5dkGQRrlkdL7ohYwDwjfWmKynMfjyj0egjEjv+vOP9mtl0ePA/ONg5AOJGIMmSdXov
         PTJZk8dgzVFJhp36psBApAjxiEbap4U0gxrXL+2Yh4Q+eJmjVwkSws1GzcbT45UPTjo+
         Gz38tTiHLNsjBTTwT9tzb/Gw9QgOjN9kIC6urqr8is2UAzWStBWncDV7wwWHCBYDOVdF
         kCuw==
X-Gm-Message-State: ABy/qLZYXkN6MGnKdCnBP95CnCJEf1eZtTg8dRtu8EVI27Krp+p/+gfa
        2yKfd1Z3w5ZsGZpGlqd50E8GMA==
X-Received: by 2002:a05:6358:e4a7:b0:135:a52c:1d93 with SMTP id by39-20020a056358e4a700b00135a52c1d93mr1995699rwb.28.1690443113170;
        Thu, 27 Jul 2023 00:31:53 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id d9-20020aa78689000000b0064fa2fdfa9esm802002pfo.81.2023.07.27.00.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 00:31:52 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 4/6] accel/kvm: Use negative KVM type for error propagation
Date:   Thu, 27 Jul 2023 16:31:29 +0900
Message-ID: <20230727073134.134102-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727073134.134102-1-akihiko.odaki@daynix.com>
References: <20230727073134.134102-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: iOsr7uk0rYF7

On MIPS, kvm_arch_get_default_type() returns a negative value when an
error occurred so handle the case. Also, let other machines return
negative values when errors occur and declare returning a negative
value as the correct way to propagate an error that happened when
determining KVM type.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 accel/kvm/kvm-all.c | 5 +++++
 hw/arm/virt.c       | 2 +-
 hw/ppc/spapr.c      | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index d591b5079c..94a62efa3c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2527,6 +2527,11 @@ static int kvm_init(MachineState *ms)
         type = kvm_arch_get_default_type(ms);
     }
 
+    if (type < 0) {
+        ret = -EINVAL;
+        goto err;
+    }
+
     do {
         ret = kvm_ioctl(s, KVM_CREATE_VM, type);
     } while (ret == -EINTR);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8a4c663735..161f3ffbf7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2977,7 +2977,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
                      "require an IPA range (%d bits) larger than "
                      "the one supported by the host (%d bits)",
                      requested_pa_size, max_vm_pa_size);
-        exit(1);
+        return -1;
     }
     /*
      * We return the requested PA log size, unless KVM only supports
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 54dbfd7fe9..1b522e8e40 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3104,7 +3104,7 @@ static int spapr_kvm_type(MachineState *machine, const char *vm_type)
     }
 
     error_report("Unknown kvm-type specified '%s'", vm_type);
-    exit(1);
+    return -1;
 }
 
 /*
-- 
2.41.0

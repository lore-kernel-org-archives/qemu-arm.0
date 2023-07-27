Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1100134ejb;
        Thu, 27 Jul 2023 00:40:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmBMEDXzmEzL2UvLugyBEtEj0V/NcJHHrG59s5fRanDyO1WFJmYi9FhiM/imLT37IXJZto
X-Received: by 2002:a05:6a00:9a0:b0:686:baf2:35f4 with SMTP id u32-20020a056a0009a000b00686baf235f4mr4947331pfg.29.1690443609679;
        Thu, 27 Jul 2023 00:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690443609; cv=none;
        d=google.com; s=arc-20160816;
        b=s/I0614kvPcqkFNtyB38CDl6jlRgwXiDpDWOQRJ0NVzZh5leFLBC5VDf+wJFnSCXDx
         tpcCv6pIB7NoSVan4w1AL4BNJuwYQwsggLDNxFbGFuyceypmT3ZraPhnKO+xFHFOvxu7
         ayNQUYGwVuL6CvaWg7uLWIMxUvxUmoZy3b4G7yVUWgsm5yUcDTZ+6LDXg2yvZxc0Vo4H
         alN8PGAXYCylo52pybsygEtVY2dBAkMYQMB2j6JzLrmhARLiT68mLoiXbPHMqZ3Oru83
         UIXWhlNBoc7GohV3ija3NdZfjProSmA6PYHRGUg75QCiWEqUPRVRT6HyOXXqXcknJTP7
         3YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:to:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:from
         :dkim-signature;
        bh=KryCFoTvBP3nIdEsg77nTIkWzqmuMWTWodPXHjNoS7w=;
        fh=mJ5OFdie2M3iVyZL5TpDz8DAfFZC9/SE7DnU60sOZu0=;
        b=J3BeBYjL52yvnkJ61Y7ZPfIUMa4nMZrMKBwjudHxfPHYi9Ffn9YTfFCPeMEFdiIm1N
         Mv/KDD/n3Lx5ze1ghQeuCtBDhYuRlT4PyA6Ingxy11BM4ZfUaEgGpc8okIonSk3nnAUc
         wUSHPsr5aKjnA+S/xnfavJPFH6N6w6A1oMwqe3o8gvF8kJVQQxROtS0Hed/v4mfGbtFl
         ItaBBE3ixI1abf3TRdrkD1yLvRNHqkz8aMggmSycSisYhZKgcRTCQyr0UiBYx+Izr7C/
         ZpR2rUhchSU5/85Tid5fB/ZclDLGeqFC4/MoQG6KWegmfOOhcqHrUomBhprrTH72TkFV
         pCaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=sT7eY9uW;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id e24-20020a635458000000b00553854417e2si848058pgm.244.2023.07.27.00.40.09;
        Thu, 27 Jul 2023 00:40:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=sT7eY9uW;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbjG0HkH (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 27 Jul 2023 03:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjG0Hjm (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 27 Jul 2023 03:39:42 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D376B116
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 00:31:57 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686b91c2744so527009b3a.0
        for <kvm@vger.kernel.org>; Thu, 27 Jul 2023 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690443117; x=1691047917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KryCFoTvBP3nIdEsg77nTIkWzqmuMWTWodPXHjNoS7w=;
        b=sT7eY9uWJvO3BMx6lFVxseP9F1PeovS6Qw2urWg1NPKLVRcu28M/oqgLlLGgrpFyTY
         1vwQMtWatcerVjfj2BlQVAOCUoNwR3trS/c72W+2MlMSsV0b1SRJ/hNchg3RtkC4MjBI
         LhHpdeolCx+g0bz21dokX19IdvNXpMNexhbpVAzG9xhFpD/dnUGuRD6/BBwVxZmgLBu3
         ftOlzh/5Z0t49+mijXRwEpCB0a4JJkbr+fFG4Q0KsX3EzJG6cdbx4bnfnnj1IcT6kVjr
         g3anDuem2i5j0Wxo1P875QPwoecKOhkEmjx85WmYodu52vj5jhygb3Hp0UzHRHwyaCzs
         /ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690443117; x=1691047917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KryCFoTvBP3nIdEsg77nTIkWzqmuMWTWodPXHjNoS7w=;
        b=DuiQnAjEpGOlh17cEH272EiZEy5p6waLu1/3lfxlBqQgKKuseBxts8N6sPLqS8sfUy
         +MTynYIRHmm+pwPbqAOY6foCgvwtoVidTGGHwUs+LRDc4l8C3om7n01KiA0TUkrmakDQ
         txqohTlqlff5c8LWTBIi7ry/3qpWead1H0AmUuKxcS9o+GiEbVw+CxZwLlTG1Deww4V4
         K8ZUL1bPTy1wGO/+aCo1XHfljoVVyHakE9pZ9T9UmgmqS/r8aBsL81QmVv/LwFrcrHHB
         lLqPQW94PJhCGVj82pMhyDgklVKdIvGbFrChkFwODREX+5O47gbS0mGsLi09HAW2Oyru
         FXNA==
X-Gm-Message-State: ABy/qLa/t4Gscq9GKwwkJifSYZbNlk5FBZlKmiCst9R6ZOyURFjr+KOC
        JwYaudTEV2dcwAWRRR6ZsVmT5w==
X-Received: by 2002:a05:6a00:139c:b0:66b:8d48:8e64 with SMTP id t28-20020a056a00139c00b0066b8d488e64mr4516779pfg.12.1690443117393;
        Thu, 27 Jul 2023 00:31:57 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id d9-20020aa78689000000b0064fa2fdfa9esm802002pfo.81.2023.07.27.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 00:31:57 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 6/6] accel/kvm: Make kvm_dirty_ring_reaper_init() void
Date:   Thu, 27 Jul 2023 16:31:31 +0900
Message-ID: <20230727073134.134102-7-akihiko.odaki@daynix.com>
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
X-TUID: rJSSw0J2CbxU

The returned value was always zero and had no meaning.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 accel/kvm/kvm-all.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4591669d78..a4a1b4e05d 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1454,15 +1454,13 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
     return NULL;
 }
 
-static int kvm_dirty_ring_reaper_init(KVMState *s)
+static void kvm_dirty_ring_reaper_init(KVMState *s)
 {
     struct KVMDirtyRingReaper *r = &s->reaper;
 
     qemu_thread_create(&r->reaper_thr, "kvm-reaper",
                        kvm_dirty_ring_reaper_thread,
                        s, QEMU_THREAD_JOINABLE);
-
-    return 0;
 }
 
 static int kvm_dirty_ring_init(KVMState *s)
@@ -2744,10 +2742,7 @@ static int kvm_init(MachineState *ms)
     }
 
     if (s->kvm_dirty_ring_size) {
-        ret = kvm_dirty_ring_reaper_init(s);
-        if (ret) {
-            goto err;
-        }
+        kvm_dirty_ring_reaper_init(s);
     }
 
     if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
-- 
2.41.0

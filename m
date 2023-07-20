Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7629519eje;
        Thu, 20 Jul 2023 00:29:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEDA8s6txF+fyNViLf72rAjJee3kErop2lu5jdUDWDHt8Gt5KQ+/+M4YZKfq6TNEkug4xuA
X-Received: by 2002:a05:6402:32e:b0:51d:f0fd:bc80 with SMTP id q14-20020a056402032e00b0051df0fdbc80mr4849744edw.17.1689838168950;
        Thu, 20 Jul 2023 00:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689838168; cv=none;
        d=google.com; s=arc-20160816;
        b=t5mfIHTHICYl4Kc3tqDuiDmV0WTtNSFMwdtUngQcmHpVAr+4mtbxywuwYs2BDJwdhj
         4dR5zMniU4INoKs14UShixfntFvFvQxa7ScMKCpM4X/Jkbh6xsg0GEeALP+AZu9ve9sm
         GIwYUmcZeY08B3HkOZIuuIoC4YO4NPYcoilNtxn2wZkeEhJVRiBfUW5hOR53B5OC3Usq
         U1e/VWlw5pK56XfQzdLf+nBtdB9H1w1cWi0i9WqiYlteaUMrYTg7feRf0vzlDQcrkK+F
         BRtjV4kcKRtEvyY8GK6N+Fa8WmavnW3rP5FBN+O3N0bYqjTFBT+2CvTLe2sn/aaCgold
         k9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:to:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:from:dkim-signature;
        bh=Zu0o/wcEkbfTyvDOhAFRVRnQlN6I6R0hj4RBolX2hdg=;
        fh=mJ5OFdie2M3iVyZL5TpDz8DAfFZC9/SE7DnU60sOZu0=;
        b=gJHucVr70O+wMdcjN51j79cpMr/3hflgO2eaSjky5qSNtORCfIzSO7MjugJEAnzZQx
         80aP1ziSwQOTSQwuihflwpvNQtsMOH7a3xBZtmseFw8SCa/MqWUhxkdB99rvYb6okUPs
         Z/Asc9B8+/YcACVTD0DyLGUvGRxfMqqxI6sAdaIG1Z/Fub1FeOa1VCypU6TkDxIeTTAo
         mNR3b9pKaLhkbB/hZ9uAn+OD8brgSP007HZHGARCmY6aOmz/K3TfepV9OG39DNddhwYd
         nXZR2RdyHTlqt1St1q8toStRqhJ+AmFRabIl59uVyNGmJVYGEUPa5TpoJeGs9qPTyryh
         FesA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=oVH5QTZb;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id f7-20020a056402068700b0051be9317ccasi414748edy.508.2023.07.20.00.29.28;
        Thu, 20 Jul 2023 00:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=oVH5QTZb;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjGTH31 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 20 Jul 2023 03:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGTH3Z (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Jul 2023 03:29:25 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C162107
        for <kvm@vger.kernel.org>; Thu, 20 Jul 2023 00:29:24 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b895a06484so2897585ad.1
        for <kvm@vger.kernel.org>; Thu, 20 Jul 2023 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1689838164; x=1690442964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu0o/wcEkbfTyvDOhAFRVRnQlN6I6R0hj4RBolX2hdg=;
        b=oVH5QTZbrvnHyydotdMaw7OEyZnGgENiFoLjcYkF94dYXXrP5cCqtMYTXhtgwnqgtU
         1laKHVI6VGEr6FAFlMN6eCvT87ouu1pt/yFRJ+HeiTET0IsHJeWKomR5VOcrFpYla+1a
         jkveSDT7ASJdJ9zykl1PY+3ByvNl2O5gcHPqXgUP//cd40PUzYI3GoDX2oDfAsDk2RD2
         z2vGArKL7EXDROz/73thV/lkO9tEGscXjjc1EhPW9FGRX4+AYPnUjSfcTonBmPgPNo0z
         wWaBza1jE6vXrOs1I2SOiTdnE4em5RZ4a0SxZWsk7P6iWAGK3W8lTWrARYT3G2OJfmWH
         FuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689838164; x=1690442964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu0o/wcEkbfTyvDOhAFRVRnQlN6I6R0hj4RBolX2hdg=;
        b=OKW0YtrWrwER67jJFvlr1uIfpb7F3wMfhMf46e65yDLhr0KaG831JhhXeiI52i0Tt6
         sFAs/2nETyOSIvlNRRw4uJC005lR29PozaOldA9b9EW15aszFGXg1o0qozzwMt8CmQxq
         EPiES2Kfh/yPopKWToaLMSYcdNmHtg+k55wnORLzhtWrxLQksYxDD2/T0cLI2st29f28
         a2DMzIb3PQqhte7GvJGm42oK257lo3EremJbHrfIjjDTj83uYN6bet2FfDMazdNQ1p2O
         Flx+fPevzafQUMORm4RXm5oJ/BDz2o2EBEZ3P0a0ycjBbIyObdFq+SidMzrM3OOuKsXa
         aP5A==
X-Gm-Message-State: ABy/qLaq78Aqn1XAyxunggPGJ5JBBswXCv1pv6sxrR1EsFSH8kR7zyZY
        jB5bHJQ+lZM5VF1F3tyS/qhxxQ==
X-Received: by 2002:a17:902:ab57:b0:1b8:59f0:c748 with SMTP id ij23-20020a170902ab5700b001b859f0c748mr1160084plb.2.1689838163988;
        Thu, 20 Jul 2023 00:29:23 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b001bb3beb2bc6sm548433plb.65.2023.07.20.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:29:23 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH RESEND] accel/kvm: Specify default IPA size for arm64
Date:   Thu, 20 Jul 2023 16:29:01 +0900
Message-ID: <20230720072903.21390-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
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
X-TUID: lzXbztQujzSL

libvirt uses "none" machine type to test KVM availability. Before this
change, QEMU used to pass 0 as machine type when calling KVM_CREATE_VM.

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

So if Host_IPA_Limit < 40, such KVM_CREATE_VM will fail, and libvirt
incorrectly thinks KVM is not available. This actually happened on M2
MacBook Air.

Fix this by specifying 32 for IPA_Bits as any arm64 system should
support the value according to the documentation.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Resending due to inactivity.

 accel/kvm/kvm-all.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 373d876c05..3bd362e346 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2458,7 +2458,11 @@ static int kvm_init(MachineState *ms)
     KVMState *s;
     const KVMCapabilityInfo *missing_cap;
     int ret;
+#ifdef TARGET_AARCH64
+    int type = 32;
+#else
     int type = 0;
+#endif
     uint64_t dirty_log_manual_caps;
 
     qemu_mutex_init(&kml_slots_lock);
-- 
2.41.0

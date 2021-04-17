Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1150588lfr;
        Sat, 17 Apr 2021 03:37:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz931UfcMEpIKVTryN8SvbqAkNIBrgwSpGucLv8i6ig1iIaP3BYtnt9MAmwp7NQNKysFpW0
X-Received: by 2002:a25:3789:: with SMTP id e131mr4531521yba.354.1618655870580;
        Sat, 17 Apr 2021 03:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618655870; cv=none;
        d=google.com; s=arc-20160816;
        b=HWYL+RLQzwJ/+gCMVDTLibyz6CfRa/GkYaZT0FLyG4KaWfweiAwj2vVrZVb8O6aMGm
         ArWzxC7Xzp54Z31gD26ARgYo0SrkpHclIwPCv56qyBjP4ZnqyDlgIBIFAI73g74chVsX
         3qHyIqmFLgvUnRdjzL2R8tqsASkZRXD1/034VOo05Eq8CndK/hF7L8QkptZLw8B3Touf
         uLWNxeD8i+XdHUOjb/nPOmxmqxuxJLWhJHOPVYZLy4ZsrX429LugacUOj0BL8dBayTyN
         amaU+BFzUwoEolJPc3clOK/Nwo0pUDCsj8YnYGWtM84Itn2eDWqmBR3cKNeC92WZIKNg
         dcvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GuQcix62yOxi2GAeMBvDGe0wgnFu8eqZ7dkSeHfqLw0=;
        b=laCDOK4fdEdqzvAGgyoJaNbCksZyHscylfEXTaVmo2sGGxw94KXhc+7mFfyWvSSio7
         ux6txdDCDSvpW9cRKUN5Czv2iped8JjAFDOpsLNEQvh8K5Os4oHbaP7+HCouHclyWcIe
         SyZ9grjiYOEld2zNcjEgd5A7Fzstmj1HZTVz3Vgxi2J0pTARdc9pi4w5vbY3yyXoAlvv
         a8T4BDNj2NgOT5RI2iKQgrJ5WLohLCrQtSAj61d4I99IYawmrGzgW2E87vfLJlnqAbcS
         vQagAMgaOnTiD2RO8lG4puDKQZ+vObhk2nPxkmq7tWqMIGW8NHFdf+AdX97q9acCiaeI
         dMvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ntha4+cB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si8054129ybp.397.2021.04.17.03.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 03:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ntha4+cB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXiKj-0002Si-Se
	for alex.bennee@linaro.org; Sat, 17 Apr 2021 06:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEY-0002GO-Eg; Sat, 17 Apr 2021 06:31:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEW-0001Bq-Us; Sat, 17 Apr 2021 06:31:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id e7so20051457wrs.11;
 Sat, 17 Apr 2021 03:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GuQcix62yOxi2GAeMBvDGe0wgnFu8eqZ7dkSeHfqLw0=;
 b=ntha4+cB1beVYLQnUCS8Wgj495JCB/z4VRNAfEG1eDoLRcn85ncmkg7e9qlkt7UKRq
 HTRZWPj++lPAy7KvRTWfqn/uQNxwxiAzF3yx5Bu1HiZY1ts2Rkxp74MXAQAlji60sRTo
 r1Lc4XSBzjouk+7HE7ErQ+qQwOD1a9bSQ7GcwkAohvw+24l25uqDMTxvA6x7ZHRoWLua
 l5q+BRtzvpxd7VYozqtsOgmjUFK2nZ/gyVs7VV3b8ky/KRXdRgI82gmqzHq8LqTCw53l
 HOyzjMUoOw1edItCEClP7LpBzrR+uB9//Kzfrydg1Z1TXfhGept51g1lEilnbpsIlqpI
 JsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GuQcix62yOxi2GAeMBvDGe0wgnFu8eqZ7dkSeHfqLw0=;
 b=GAOhVwXd9paSpB0M0qcxFojJ6iivb6hXf0PlIxNsQKL55DPnkuLmdnh1ZxhO4rY4HC
 VNfOwRVNUlOOKpT7eac573ZTN7i2kjIDV5aUd+c0LpT5+qZCg9fLQ28+27gYlYRlPjxO
 5CgR2WToSGn5taSLtTKEVTLH7I0OI3wUSrejkaAfO1xZXn54KJYiOQNETgbwEqC/+8Lm
 regqTZIsTEXfh70HkZbHiT4KxV/mPdCB9paiNV8lrNI8pUbJ7W2P5IclnfW7LN0AcnwK
 oXqPyl37vjMIdBc4NfPd1kuAg1/9jhxvDy1BqKQO3biAVs72kHQoB9h+x2BsjBiti98S
 gVdA==
X-Gm-Message-State: AOAM532jafwoV/Ezzpf1uJnLw7S6Y6MCB2/rOPzu0gw2txSKbOmRs+Wa
 Y2wBHBmZez/QW4ChAfGSIftnaWpKhyI=
X-Received: by 2002:a5d:4584:: with SMTP id p4mr3591191wrq.383.1618655482669; 
 Sat, 17 Apr 2021 03:31:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v7sm14384268wrs.2.2021.04.17.03.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] memory: Make sure root MR won't be added as subregion
Date: Sat, 17 Apr 2021 12:30:27 +0200
Message-Id: <20210417103028.601124-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7lxDj2ryLC9f

From: Peter Xu <peterx@redhat.com>

Add a bool for MR to mark whether this MR is a root MR of an AS.  We bail out
asap if this MR is added as a subregion of another MR.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 1 +
 softmmu/memory.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27..83ac86525b2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -477,6 +477,7 @@ struct MemoryRegion {
     bool ram_device;
     bool enabled;
     bool warning_printed; /* For reservations */
+    bool is_root_mr;
     uint8_t vga_logging_count;
     MemoryRegion *alias;
     hwaddr alias_offset;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e43..409bcaec7f5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2443,6 +2443,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
                                                MemoryRegion *subregion)
 {
     assert(!subregion->container);
+    assert(!subregion->is_root_mr);
     subregion->container = mr;
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
@@ -2820,6 +2821,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
 {
     memory_region_ref(root);
     as->root = root;
+    root->is_root_mr = true;
     as->current_map = NULL;
     as->ioeventfd_nb = 0;
     as->ioeventfds = NULL;
-- 
2.26.3


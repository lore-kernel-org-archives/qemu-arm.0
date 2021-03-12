Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1483959lfg;
        Fri, 12 Mar 2021 10:30:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSwWrQUq9DZ2iALX8Wu1k6X1YF8oDuKBnoUZ3pcskorJ76tknXVZ+4cTPgwA0ydVenGbq+
X-Received: by 2002:a92:c709:: with SMTP id a9mr3732102ilp.272.1615573812602;
        Fri, 12 Mar 2021 10:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615573812; cv=none;
        d=google.com; s=arc-20160816;
        b=dA9tsIpyEOnHXHt+vO9fnT81O4a1kMO3yj4VBudvYd/yAL4ne2+Cw0VV6Ffnnte6Kh
         t6QgtIsDijUX+ev+kyu5otb6NapDX4792IJvOyBkHuZugdiRjO5r72TWuf7u6SrFN4vs
         WbxP1rTEYiW0gHiiIVxjWjM061Tfe6TZzCcdEXYf8FpQoMoRIuG16+qNDgs2mg7P27wV
         avx2x/lqLxlx5QkOF+u46ibHnyiotowWg7Dw4QYjCXqS+hL5hlrUHETRALjIdLvou26Y
         D87kCBf/+2RWThALFVeCXBN9klwqQ5H/MJIDQ0qkpM/6DCFzNKYWY+oCu+l9igTq5czp
         Sd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FdVDED8kKnbt0t9rcpUoiyt06STJfiA/Zd4Bwc57Y8s=;
        b=PFEuWhjuqOwwJN/BJKBcmWJD8fki3CPwY+N4USAaQVM2XXen1CzRtdzLXIZkYcMWVb
         g43gUBvhvvRsqnuflehqZdZaF/VOPLQ6ySs4RNHbEAS4zmtZfNCWmCO79KYGiyVAD1Jp
         JRs/wUizVpBw6ePytKH9BLcUbDEdNerbtbhcSWMamKP10UPwSmsFBya99BYbBDT4n1mG
         dRPSNjP4Oh0ry/JMSnJQOFOuNUjz38T6xu9dq4x6nnES4gTAKyO/pnOj54LWumDihF23
         795V+PfJBY7Sqex8uBfmrX2D5ykF9tvc/2P40fNXQu94ML7i7rpfUb0AKPrmx5rHYzeK
         G7fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hFY6aiFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si5816376jav.10.2021.03.12.10.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 10:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hFY6aiFV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKmY7-0007Zj-Oh
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 13:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbf-0005R8-KY
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 12:29:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbb-0002g1-Gb
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 12:29:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so12671404wmj.2
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 09:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FdVDED8kKnbt0t9rcpUoiyt06STJfiA/Zd4Bwc57Y8s=;
 b=hFY6aiFV596TJ8mRkE54kxP7Hq8Bne2Gl5B/yE5QkwiYbMPtyTSHGDBSWRDdMSDhk/
 IK0YleMIff7FjwcHCa5bVHX97jK7kIUcUtTQ8sbdoUA+1tGNc91wYqcmTfFSFcQCq4e3
 +ir0U4uqctisXEKMA8YjOzVMmegfbLY5rXmERkvVS+qtfS+qE/oIWMpaCiI790t5vseI
 rliQsMmSWthDenmoaEpMIYEH16PYnw52enyAdoEuhCkVoI+8MCgq8khHKZc7LaN403lz
 kQyOMJwNm2rXJWUiuP8QAT0W0Ob2uuc52k1rgjEdGthezZEmIy4KcQp52QmErur7yuD/
 r75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FdVDED8kKnbt0t9rcpUoiyt06STJfiA/Zd4Bwc57Y8s=;
 b=DTfJHo2iidv5Dkpucuqj6LYAtpS78l8k7yCF4E4pNlAhx3JhZYw6DpUknkfZRUGLqF
 q1U65Yxboiem3r+DsnxUNzbeWmEa8pG6kB0q/5wWunBXipEi9NcI+21HR0Vdi/up1KCY
 W0G8IFcQRDX3+Wq7MIeDize/wASI3MA8hjP9+8lGx8sTpNQtZ7CnR823dsEj4uzq0Y6K
 VWvSaY1AW4b8GgOngmq6nx3+5gATtZDxGTxudMzYcuxamCYHe3nG+HVFXHRKi1v56EJ8
 5qyvbfdSqe9l/C09lq42YbI864K5SgrIZgINNRmzrKqvAzyLyVJ080JoLk2UiMpKszKH
 CdNA==
X-Gm-Message-State: AOAM530B1mWugX7KoAbfdQIqhpJEszSRPF0Svc6vzdbsRpeEwPR6PqB/
 eckIVY3ry/9yko6JTdLURpGm+i9RaB06B0+3
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr14101898wma.92.1615570182187; 
 Fri, 12 Mar 2021 09:29:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm2679001wmf.45.2021.03.12.09.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:29:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] memory: Add offset_in_region to flatview_cb
 arguments
Date: Fri, 12 Mar 2021 17:29:38 +0000
Message-Id: <20210312172939.695-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172939.695-1-peter.maydell@linaro.org>
References: <20210312172939.695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: auwZn4wwCCAd

The function flatview_for_each_range() calls a callback for each
range in a FlatView.  Currently the callback gets the start and
length of the range and the MemoryRegion involved, but not the offset
within the MemoryRegion.  Add this to the callback's arguments; we're
going to want it for a new use in the next commit.

While we're editing the flatview_cb typedef, add names for the
arguments that were missing names.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h           | 4 +++-
 softmmu/memory.c                | 3 ++-
 tests/qtest/fuzz/generic_fuzz.c | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 54ccf1a5f09..0c3ddf2bb9a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -778,7 +778,9 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
 
 typedef int (*flatview_cb)(Int128 start,
                            Int128 len,
-                           const MemoryRegion*, void*);
+                           const MemoryRegion *mr,
+                           hwaddr offset_in_region,
+                           void *opaque);
 
 void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque);
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9db47b7db6b..3cc78862c79 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -671,7 +671,8 @@ void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque)
     assert(cb);
 
     FOR_EACH_FLAT_RANGE(fr, fv) {
-        if (cb(fr->addr.start, fr->addr.size, fr->mr, opaque))
+        if (cb(fr->addr.start, fr->addr.size, fr->mr,
+               fr->offset_in_region, opaque))
             break;
     }
 }
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c4..c10a19316f5 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -96,7 +96,9 @@ struct get_io_cb_info {
 };
 
 static int get_io_address_cb(Int128 start, Int128 size,
-                          const MemoryRegion *mr, void *opaque) {
+                             const MemoryRegion *mr,
+                             hwaddr offset_in_region,
+                             void *opaque) {
     struct get_io_cb_info *info = opaque;
     if (g_hash_table_lookup(fuzzable_memoryregions, mr)) {
         if (info->index == 0) {
-- 
2.20.1


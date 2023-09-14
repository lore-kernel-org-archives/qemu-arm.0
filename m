Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp577108ejb;
        Thu, 14 Sep 2023 07:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB+AmOuY8EO10kUXrxA00q7BMUTC//EZN5w+oevm8CrkjVFxLufJGPStu5De8UjjwWZWEF
X-Received: by 2002:a05:6808:9ba:b0:3a7:2d26:9456 with SMTP id e26-20020a05680809ba00b003a72d269456mr5398003oig.57.1694703484308;
        Thu, 14 Sep 2023 07:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694703484; cv=none;
        d=google.com; s=arc-20160816;
        b=A/LFwVz/21FbbLa6alNmjzh65TryAfxN8hdLJzOCepcgtSerfV34r1lfZAmT6HYiJN
         ZGxdJMgwDUawWBrIcGAyJwlLcCAuLrxeN/B9MrcFvB5gpNTN8y8AXDmbPnxT4z/Ds9tE
         oqxG2qCDRebF48GYOGutd75i6ZUHMmyFCpCRKihnvDnXkLddfKuLyxAPCe+KYp7GWKkP
         CZD6fjRqFB538pJftpR3XeD5lGKOH8Q6ptlfE8Tjmf1Bsz2IqvRDCFismtDBjUWqrQlM
         5P9bF1Vz4s23JRYmuwUfEN9kGXBRxUoFni2/qXuRQt1+gLynHHUGgIVPxTTOC+12IUte
         Cccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MZb7UPVv9vYl+ixEjhnMDHgoC3lxCKqKktEldyauho4=;
        fh=NY6IStX7ee+XRQ7VxbbREYpTmmSHrTCVjRm7wDQyZLI=;
        b=SQA+bncCxl35zUN1r2b483xPzgURIXSRgK3KFyc6cinZbVd7JJCbenymD05nVtMBuw
         j2s64wLZSQpd6CNccjhygNwTYXWQMIBSzmxpNHCYLrJT/ImTePt/3U9mH1W+Yi/pMg40
         8RRe8hON+5UT4PnEmorRBfsI4n99mAzrTOL6PBT98XLaGYtrgBwB96md5FQKY/55zCAI
         /Iu7VrjaxDCEe5Pd7AMyboWdtce8+sPIs3f/IfUy86Mtbeom3Zqa3KtQunGt9B+62HtB
         jk5Wao2qFZt7CK+nBdHiCGjyte5B9vVSqiThniLvE47LaL6CnnoItwHrbqmPty2x1/EJ
         ueQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zx5JJ86o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b00403a5f909a1si988848qtx.781.2023.09.14.07.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 07:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zx5JJ86o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qgnmP-00018P-Lg; Thu, 14 Sep 2023 10:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qgnmO-00016e-95
 for qemu-devel@nongnu.org; Thu, 14 Sep 2023 10:57:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qgnmJ-0004O9-D9
 for qemu-devel@nongnu.org; Thu, 14 Sep 2023 10:57:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-403012f276dso11371565e9.0
 for <qemu-devel@nongnu.org>; Thu, 14 Sep 2023 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694703430; x=1695308230; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZb7UPVv9vYl+ixEjhnMDHgoC3lxCKqKktEldyauho4=;
 b=Zx5JJ86oF8q3sv6ybm/XZZ7okSP4hfQ9VzNvmKA43yA85RkoarwSrkWCRiJkismeyy
 KiGFUOWu1rFSRWY6cqZ9uxUHw+m+uIPttDZLHCrpfjeHizi967OV8wKpYH6xLKnP9Ls0
 lYCx6rHy5RD04uCtIXJgk17SudiVIDS3Q2bqDNYoORGjyZUqAYxRZBvI5tf0JnjgxAeG
 orQAEktbKeS9yIJydNvTuTa8ZrusDTHmaJZ7tHpM3TFhQ3LhGRqaH+U42NwsDT/A/uS/
 E8WILFyym0bo0KnJVj8iMDK8AXWjBoU7ywmMq/Eva4VhMKmf2aj/5kAzs1MltRHRxnXO
 nPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703430; x=1695308230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZb7UPVv9vYl+ixEjhnMDHgoC3lxCKqKktEldyauho4=;
 b=ild/N4ZJrqJ7D3P6clNRkcOjBAhJidKpxkTchyRBktEvzliidTF2xOCUUqujvmE6wl
 3Vy2Ct426yQsPwpJcAc/hbIgyX1mz1IWPKXUf5n/FGObtIftxmevS7gqMbXPmMBSzEii
 u5e4VXr6D/iIgCbDjnJKuX8do55rQor1ICdPltxQEryIwmuAS+6j6k1Kqxb7vjQAYCWA
 EZ8fVOeHb7I67Wdf5/qK0gXTfUO2UBC5CLiJY6sazZ6Zvjs4kuGhv1/340shniqQGj/j
 zwi/Fp1zJ87m/UkwtMnWdjgCbbBgZ8GtBeQMj2/yLTMG7mKS8WHxR4YmV6s8EuetdZ4V
 ocPw==
X-Gm-Message-State: AOJu0YwtuZcZbSMvNHHDsnd24g1mw/E8Qhpr5IO0aq/zbqtAkyO1w8cY
 0EygNayeU5jGa6axUQSw93C0yg==
X-Received: by 2002:a1c:f717:0:b0:401:bcb4:f128 with SMTP id
 v23-20020a1cf717000000b00401bcb4f128mr4940859wmh.35.1694703429725; 
 Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a5d470f000000b0031981c500aasm1978483wrq.25.2023.09.14.07.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 3/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature
Date: Thu, 14 Sep 2023 15:57:05 +0100
Message-Id: <20230914145705.1648377-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914145705.1648377-1-peter.maydell@linaro.org>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JgY32wbFScXL

The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
supported, so we should theoretically have implemented it as part of
the recent S2P work.  Fortunately, for us the implementation is a
no-op.

This feature is about interpretation of the stage 2 page table
descriptor XN bits, which control execute permissions.

For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
IOMMUAccessFlags) only indicate read and write; we do not distinguish
data reads from instruction reads outside the CPU proper.  In the
SMMU architecture's terms, our interconnect between the client device
and the SMMU doesn't have the ability to convey the INST attribute,
and we therefore use the default value of "data" for this attribute.

We also do not support the bits in the Stream Table Entry that can
override the on-the-bus transaction attribute permissions (we do not
set SMMU_IDR1.ATTR_PERMS_OVR=1).

These two things together mean that for our implementation, it never
has to deal with transactions with the INST attribute, and so it can
correctly ignore the XN bits entirely.  So we already implement
FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
that we need to.

Advertise the presence of the feature in SMMU_IDR3.XNX.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 94d388fc950..d9e639f7c41 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -279,6 +279,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
 
-- 
2.34.1


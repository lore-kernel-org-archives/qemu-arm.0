Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2026244ejb;
        Fri, 10 Feb 2023 08:39:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/Xw+LPWGyuYPCh+JHWh+SYc9w7k/FHunEj51WCUx/VOto3+vpSv0PnFvl2prwXUOJJmuqx
X-Received: by 2002:a05:6214:12dd:b0:56e:982c:30 with SMTP id s29-20020a05621412dd00b0056e982c0030mr2163188qvv.16.1676047196494;
        Fri, 10 Feb 2023 08:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676047196; cv=none;
        d=google.com; s=arc-20160816;
        b=kZPA0HhdLtmuTHj0ycegnZWhGEhQmwG2u5KRNBXhb+oz4KfEhsfhN2uPLethQy7dkK
         NcqMV/kD3Eeh9kWeG9nigSGlcTTyi3XlURNtdH1bNb9P45pVw12pgST9WFA/bc5n44a+
         Fi5rgtbQdTUSgt9PcMVtvZwVac5akRqkG6bNV/xAyMAWSnKvk96v1gGj7+WWP5ksYiWq
         fEYzRqj3JHa6S5IIy8eeV9lBzdodyA4mdrExsN8dI14ruSceF4E0UFcK1dct0+1sc7gq
         wqvz0W5n1ZGxmtsTFphO6BNqM70s7OfciaFDmQVVjKE4jsuYM9kHNV3o6otaHJQ6nHv9
         Y5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9MhaVPxfxbtAezcy2vU3U8mTUUFFbUwtf08uGYyb7ms=;
        b=N4dfdfEkIaw371ZR5qaDcLCmX7mlo6mW7+afqAbHS8v+cUNSRijTrjD/y/it1DZHNy
         DWSff9An6L7nfvIl9oKZCfTM4YmdA/sXGBKw77PsJlEyz6M0PIBShUwcjjxcPciAh2/i
         kQz6ZqfcShjAHWPnXi0HgsUe1PgFqmPwJCDVG6mZagNKpTJOKdI2D7xLOIWSsSy96m5C
         PJrJevEWz4dWF+osCOTZxeL7ZpMArDekpJy+v0ptogHEBHafX8fE+oajyL28U26EYc5l
         lEKCkImwOiDsdegGU4PjLexjl0cZL23dcIfK/FSrSERVBwSYBqfwACMtnQujqLptyuEo
         S3aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=otyrgvzX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs16-20020a05620a471000b00733ab1b8056si4387772qkb.568.2023.02.10.08.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 08:39:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=otyrgvzX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQWRE-0007BD-Ec; Fri, 10 Feb 2023 11:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR7-0006g9-Cm
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR4-0000UQ-6K
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so4473551wmb.5
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MhaVPxfxbtAezcy2vU3U8mTUUFFbUwtf08uGYyb7ms=;
 b=otyrgvzX0nzYp0hPREsp3SRaiNgXtH2xnusVJKtkJrv8noEsduLcB5nrPJxs21RYZ1
 i8ilO2l4J/GDuFixWoXAkdDZdnXLmTJta2AOx61hBalpZQvv8fI+FxcQ2TWDdHY2paMJ
 VtvVxtFjOPDffsZ2KT4TMwKw8vaKVi/mVWoCJhs1YbjPgQTfGi7jTRAg97bW1SbIaifn
 SqT9VNlLr0NmZ0MSAzMJZJv2yREEmze+9PVxN0TS8wNN1Rrh/JxTo9jch/F2ZAHZA1bY
 T+6vLoJNloJkdPNPTODetQVE8EiRdUq1OmzU93+BOzEKcLt1MATOmPYEk81e49y0Aiu2
 6exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MhaVPxfxbtAezcy2vU3U8mTUUFFbUwtf08uGYyb7ms=;
 b=Malvdukuzg632DtQdYtQgbz93em5qLlu70myR/rGwNwTM5kkoP1Am2FJrNnr3WUaV4
 MFrgvAn2IGJEAib0eZZ73cMknGPV4XxsePYIRzkRanMEPZrPbp/0GYXz0dO/BLMAEnnV
 SOBkwHow6JTo6jN6mwFZHpDPNjAIq16i0wRoY5T3Rey0MWQLRVLGd1D9dbcabbDsjH31
 3atJfxHr7BL4D2N+AJOQdZ/Lm97uUYLw9TdqF5k1aiLY4VBAnyhOsP2Pwp6+70auaZ1a
 F1AOqBGghngaGKy5FQsbY6Vh8w1MBn0B+sx+oRmZCG4N88yr+KZxNn7TKT142BjzkqZD
 a45A==
X-Gm-Message-State: AO0yUKWj3lGK43/XFx4bXW2VZbXv0TUYHitrB3RrBRySgktairDnHkfq
 a+tViJndBJsvjX8nyHw1mfsvoQ==
X-Received: by 2002:a05:600c:318a:b0:3df:94c3:46f2 with SMTP id
 s10-20020a05600c318a00b003df94c346f2mr13577402wmp.23.1676047179597; 
 Fri, 10 Feb 2023 08:39:39 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm6312144wmq.5.2023.02.10.08.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:39:38 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 1/2] hw/arm/smmu-common: Support 64-bit addresses
Date: Fri, 10 Feb 2023 16:37:31 +0000
Message-Id: <20230210163731.970130-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210163731.970130-1-jean-philippe@linaro.org>
References: <20230210163731.970130-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eSX7pmQWyJPv

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set. Ensure the IOMMU region covers all 64 bits.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 733c964778..2b8c67b9a1 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -439,7 +439,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
 
         memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
                                  s->mrtypename,
-                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
+                                 OBJECT(s), name, UINT64_MAX);
         address_space_init(&sdev->as,
                            MEMORY_REGION(&sdev->iommu), name);
         trace_smmu_add_mr(name);
-- 
2.39.0


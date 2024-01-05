Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796729ejo;
        Fri, 5 Jan 2024 07:53:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1JdpiMr+CIJD3oiyNz2NnzMJe69PgRiaj83eeaBOAO8S2wtCmglbvf8LGruIx5iE64h+F
X-Received: by 2002:ac8:5746:0:b0:429:7bfc:4b85 with SMTP id 6-20020ac85746000000b004297bfc4b85mr678236qtx.128.1704469989577;
        Fri, 05 Jan 2024 07:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469989; cv=none;
        d=google.com; s=arc-20160816;
        b=iDTUWBfgO8wx13oGVKAlHOkDs9BVRqRgCdKzTNPjCMmOfH6PryI6y+nj5Y12+RJS9x
         XS2Mzvi6YU3oG9zb2iH4ztMozqgDiDG6OXBk2yamHyjLuulUwWjVtHnChfOui3DBgQ9L
         YCBrgg4te+UrV4KVtCilWxGxMSexfg/PFKEkHudo9wUxdXTX4l8MILCR/U33mqia/lA6
         4iUEAVM5mfvv5CtiopuNI+/9iykXXQMKVZQxsXQb2qogJ981w90I1/zPg1j25m0F7cqi
         6Ju8sTtK3xuivEfpkbPG70qoFr4TZIjn18gHceecAnR330pqL0rX0nKw9PE/LjALa5Is
         PTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fJr6Vags3Wq7daq7HscgC4QLRNTQj0/WuTPsCBO9nBw=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=de/I4yQ2oRCXTWpJ0lm4pzQCSVhH4s+78u7cZMObiM+IWz3ZJEZmRla2SONjyVg33N
         X53gMQ+8KWgSbYLvcaB29uEocsk5jEUbuHq9s7q/sW6AIEvOTVge8/srnynMesnFC9+8
         oGYe2MMfojxxTAYezGhAz5GRHxrdoJPW5okTScjFbJdebrz6Uma7sEmvzAeWdU4cyIbG
         pfQdwBab6KqPn2GeWMMd+vVZgG09YLqaQcgYXLj5QRKe3DEFV8zVtShB7fcmkHbjh9dG
         r+CnQBDOvvnq8z5S/i3xnosYrZJ339qMW/e4NxV/fKIHPGdawHED3PD1kuRfCRten5N7
         jDzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoeHDscv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ac87d11000000b00429761e86e5si1986990qtb.78.2024.01.05.07.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WoeHDscv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmRO-0004tK-Nn; Fri, 05 Jan 2024 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQr-0000qZ-CV
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQo-0005LP-2U
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:25 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3367f8f8cb0so1469989f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469699; x=1705074499; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJr6Vags3Wq7daq7HscgC4QLRNTQj0/WuTPsCBO9nBw=;
 b=WoeHDscvOsCNm8ZzhcJciSxyZwtp5X+4nI8BdIL/hVQ2ZWtP89Eb/0JA89zYRHFVJN
 UJBFOL44qkYyWQnPJR4Q0b41yrsyyzug+6yHw/sSNiH/k2eg5HVict6ApyGL1f7yzf+U
 hf64CvyjvDNV8vpEfAw0es5IBEt4N1x1jzXxeHpM2anYQmDQYpRXNNwDEuP/jEbQISVw
 p0C8IlfFH6itkvXhQjb2tzGCEMYRjP5fZWPz4oiQAoTLsN85l9GUXzKumWS3fGYNdj/H
 gv31cK8mFKsNVlja+Z7ZYKkHTJi/tCiHRJfS5WRd4zkXa1TkOQkBosY8yk4YX6DPZ0p6
 pU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469699; x=1705074499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJr6Vags3Wq7daq7HscgC4QLRNTQj0/WuTPsCBO9nBw=;
 b=iTxJgJrE5SrQgiM3xAgPIvohJ5hBe2tZtiprd4NiGoYbgy2aazWDTJOLoYGxM7Syby
 eACB67dGKFP0IVn+ds0FI3vzRnGwj92tD0HRyhd5dKo++IsgxAsN6KyFrS+5OdyG4g1e
 ovRJXH2RUHfojTzeiEYQbdpZ0ePMNPwHYCkM56m6+Z2mDi585joYfB9Ftow6jcxVrLQy
 ZBFY2LSw6qoixA5an+FMN3lfJRDkFHYbP1wcHLDT1y7unXonYT87KKT38COec3yQRegU
 gRScylX7g+lX/pYKGRWrCJiT67IbxQSxhp0Lel2HVZsrrdWOiTwgyBbMBOo7jFOYcVBN
 7gSw==
X-Gm-Message-State: AOJu0YwbDdYfOmzjOzXkEbNsbV/UhKNor0Zh2yIdTzzCyHFOLRUlS2Fh
 EtnRirjJX8YHNWNCfRyTqAPEogiQidhEPRlLltpbif8QdPA=
X-Received: by 2002:a5d:4489:0:b0:337:2b76:30fe with SMTP id
 j9-20020a5d4489000000b003372b7630femr1274977wrq.37.1704469699264; 
 Fri, 05 Jan 2024 07:48:19 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 h8-20020adfa4c8000000b003375083ff8esm1626753wrb.32.2024.01.05.07.48.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 49/71] memory: Have memory_region_init_ram() handler return a
 boolean
Date: Fri,  5 Jan 2024 16:42:42 +0100
Message-ID: <20240105154307.21385-50-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XlomiXVaTkqa

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_ram()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-7-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f3a4a76817..b2dce73e7f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1582,8 +1582,10 @@ void memory_region_init_iommu(void *_iommu_mr,
  * give the RAM block a unique name for migration purposes.
  * We should lift this restriction and allow arbitrary Objects.
  * If you pass a non-NULL non-device @owner then we will assert.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram(MemoryRegion *mr,
+bool memory_region_init_ram(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
                             uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index c1374e9968..45ce6fd6c1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3570,7 +3570,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
     }
 }
 
-void memory_region_init_ram(MemoryRegion *mr,
+bool memory_region_init_ram(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
                             uint64_t size,
@@ -3579,7 +3579,7 @@ void memory_region_init_ram(MemoryRegion *mr,
     DeviceState *owner_dev;
 
     if (!memory_region_init_ram_nomigrate(mr, owner, name, size, errp)) {
-        return;
+        return false;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
      * We only want the owner here for the purposes of defining a
@@ -3589,6 +3589,8 @@ void memory_region_init_ram(MemoryRegion *mr,
      */
     owner_dev = DEVICE(owner);
     vmstate_register_ram(mr, owner_dev);
+
+    return true;
 }
 
 void memory_region_init_rom(MemoryRegion *mr,
-- 
2.41.0


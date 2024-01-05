Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795716ejo;
        Fri, 5 Jan 2024 07:51:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHclFyGdG3RfW+Jtz+C6lqWplFRinHfA5XFFVqWcDromm6QXBZFmXmCHWV55xDpdMm5JZvB
X-Received: by 2002:a05:620a:13ce:b0:781:aea9:34f3 with SMTP id g14-20020a05620a13ce00b00781aea934f3mr2295581qkl.147.1704469874175;
        Fri, 05 Jan 2024 07:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469874; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNulC5Unh/gVWpqp/4+QanYc+2sIj/GiKr2SI9U2v2MJPX79sTLBvrpXnmyt/r05B0
         BvwNKdjkajoIC5hPCZ+GALKY8VP9jNwKEJzeXwW4LzwGDpAcRdviJGhdtUwzW91vcsvT
         AEhjhaiKSDhF7syvsD2rgwVBvS62H74Q5QoadVTp+Ave0fwCAOOy2b3VCv3z+bHBPHVI
         da3bPwNJ+6FkQQ4HG5fNT5MTOp9lSr7VIoCGM5FQ7mRNGdtUfBbLFPekU+Vr8ryh0MRq
         mOgqUdwczp1TuEWE1srKjmpiT3CKv5qH0a2RUGW2gwyvLZ++ZBflolawzXUUE7ZJ6Tg7
         y0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pxeB5JHPsloAIkHe9tjmngVFFPhZ7Tzq56PtI31mi5A=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=b/NBVQLsg7UHUCTUL4mx3tGxda9JPUxNCVZ/PLHvuFlc/mhqyuTf6OjQz3lMBJqt/M
         Nn+1u6vzM31t7hECMag/U1WcK8AhTaOf0jWDxVw95LA0mA+8wR8h9tExVjIWBOFiNkpT
         CLbDojQbC/lj4w9EjkBTAsmodDfzoVc267/UKCHVbH1S1Hvp3HQOUaPc1miPB7lXp+SI
         YN2ZMcTmwN1ph67s3TsrOhwi0BQzLEmHOS2thguDVzY0HK6SQMBvDvg/52OJofKfon+h
         de/IjMs0x6r+19xtWS0iUqCJLY2FZgoFivVtTtVBHqo2tH03PD6MArBNWWWEIndB21Y3
         pxJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/UI2DJI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05620a0e1000b00783077ce82bsi1888989qkm.755.2024.01.05.07.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/UI2DJI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmS8-0007rY-Dc; Fri, 05 Jan 2024 10:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmR1-0002Ao-Qa
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:35 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQy-0005lH-Tt
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d88fff7faso14889715e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469710; x=1705074510; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxeB5JHPsloAIkHe9tjmngVFFPhZ7Tzq56PtI31mi5A=;
 b=r/UI2DJI7ZXzSJoq9WxifR9U6Q0kDtzHeIEO4eFalKxCvKsetcZBrrG8C8Xl1PvAxY
 PkLUOCC9Qxh4DZP5ekaR1OmqNthHK4ujNKtyYYp8SNRJm6e5dtXkgixgO06obNkEXpKt
 GvdzOvgv8W+O82NNCcKBNI+msaac663by9A/Su3gweaAyWPpWMKSwYCGfpLOQmJ6DSxx
 g6hJUUm2LbuVn76IuCAC96y2FJ0/bE1qDaJYRQ9w/cBDFxBxF0dAOkUYZe3xEXaFITZa
 KCSC9j9tQgirrP3mMA8O2shq5PWonkQMgLLKmc4Tj7Thnq3U9UHsiVT9gD1hHd30aUXJ
 kUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469710; x=1705074510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxeB5JHPsloAIkHe9tjmngVFFPhZ7Tzq56PtI31mi5A=;
 b=Onw97iZpnUcBt1eY7D6QumBR4UgUuTVxtUsSkSkYl8prU7fXWCIbcM1bhvTk+KFsl9
 nMV6UwC7lMPdbfjbvkvG9PlczLMfxpf6tWYVaevBq51FfpEoj9FuljPB8SWV1PRzLE7d
 8DD9zGa08KIqhz5Iu7AxlzuOZeOW8Vf5RmV6ldXDSmDZrTB1Jm2SwWb8sCPG68AT6RD2
 49ZYDAk6xuinKJhgSSF+YKfDy6TuhaLh0XOlUt+69rh6Stqz3kRlT0VIbwk7ql3iah31
 3zdbkKENQOGdW/ar8XQJb24Imtef5vYLzHn1J9ADsqLvV2BR/aN734/RFSrU7J8dMkQH
 lLwA==
X-Gm-Message-State: AOJu0YwJS8Pcl8//aOjQsQ3ArPxXeMtEvJDW5ucMcxNnEQR/VveZPMvf
 le6m0NDmzfje03SEw0UT/RtLhxGi7OdvRw==
X-Received: by 2002:a05:600c:34c1:b0:40d:880f:4876 with SMTP id
 d1-20020a05600c34c100b0040d880f4876mr630692wmq.152.1704469710540; 
 Fri, 05 Jan 2024 07:48:30 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c4e4900b0040e38859c47sm1959505wmq.16.2024.01.05.07.48.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 51/71] memory: Have memory_region_init_rom_device_nomigrate()
 return a boolean
Date: Fri,  5 Jan 2024 16:42:44 +0100
Message-ID: <20240105154307.21385-52-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fy3ThHQnmQk4

Following the example documented since commit e3fe3988d7
("error: Document Error API usage rules"), have
memory_region_init_rom_device_nomigrate() return a boolean
indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-9-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9f54bc4af8..6d7b49b735 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1523,8 +1523,10 @@ bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
diff --git a/system/memory.c b/system/memory.c
index 069aa5ee08..8db271c19e 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1716,7 +1716,7 @@ bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
@@ -1737,7 +1737,9 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 void memory_region_init_iommu(void *_iommu_mr,
-- 
2.41.0


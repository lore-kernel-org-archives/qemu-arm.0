Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4669171ejc;
        Wed, 18 Oct 2023 07:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2loEeq9R7gMj9jTvFVCqijQUxFEXEDwAv4Ui8htSvq5DpayWx3NM4ny1jiOo02W0O/cYn
X-Received: by 2002:ac8:5a95:0:b0:41b:41a1:88a6 with SMTP id c21-20020ac85a95000000b0041b41a188a6mr6882353qtc.11.1697638418114;
        Wed, 18 Oct 2023 07:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638418; cv=none;
        d=google.com; s=arc-20160816;
        b=r6gUedDgF++cyHfOO3vp/X+ewTVmkN/M2GYcawu7vL8OhuazndHCsXqoeWhPepatyX
         Vqk5YKIOKwLvn9UmXsrrCRFGQppgg8nzNPX9oqCNUm9qzJd3aYGqHqkW94C1Y+ZRCDjX
         +es0bbf5NmGZhAXE1tDZpKYXzHGrIEYw5cwc/bkqs848B0Mn5AssXezdMV26GUihv4YJ
         FBaoDJY/vQXNTUmI3ORzF4brzG21hZHgsV1XRgwg/JL/ofu1owWtAVrdHs6I6gCfdm7l
         ozczAfTfKVYE8TyXdkyDs8Ods0ASo2i2rD7amA4waJxhHJiXqADCje1YGLOGUAMIxZ7V
         YyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H6bLxBklXqCA6pp1eqkZHUbqa8cn5QQGHgcnGcbF5xE=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=Qe6mmc12+U+uPprXcxxeTa/0+COhtvwec4MwYWG1ew4w52+D1QWRlAHpNoIWk9FvrJ
         A3/rW1P1tOlqggzm6Vs6pmdSbp7Gsj3iW3y2fJhmpFVHcBCFOi1Ms+y92Gc/j7tToMD6
         4ItT8XY3Zi9AEaWHYmBefZ/ftzzMFkSsyqIjVyfmpIpZtRPCg1+8sR1pkPTVIKo3A2f0
         m132LHjOnleyFpfjIshrEL8b4yQIN6WsAIgyDAUqjramqxacZOc4dXXyGvtihleu6Khb
         2vbDB/85ammRs86e1QcaTsaqX4o3iwVEXLRU35urxMbtPJhZDoFg9Xjb+CJpzfTdC7P+
         3dOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pr7rXlRz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05622a018300b00417d9251452si2853240qtw.770.2023.10.18.07.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pr7rXlRz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7Ie-0001z3-9h; Wed, 18 Oct 2023 10:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Id-0001nS-2y
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:13:27 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7Ib-0004xF-4k
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:13:26 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9c5b313b3ffso348101766b.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638403; x=1698243203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6bLxBklXqCA6pp1eqkZHUbqa8cn5QQGHgcnGcbF5xE=;
 b=pr7rXlRzw/5V1Q8g12Xg/OAdV/9ZNftxz898sD/B9jJ7X6WoLormgH5nXixN+UsR6Z
 GIvO3XGw/YhZR5cCwhLFYMtPx3lYPsf5Ea8NYLNiz1lH2UTBpJmeRR2MaQkW7GdRWByl
 nv+e01OmDT9zDQa3br6Za8NN9ZT8NNK+MouAvsfQ7n5xQrS7UnjtBuuH1iuwY0epRMCE
 KNV7elM11EfAlp4vzL0dq3oyiZqz/XB9RZALSCKzOTQ3Jida1xZAjeVvSdJX6Kbcpx9Y
 gZW8QrgX1t8koH+ME19XZlQSCkTW7fvI20ZR1kBNQxpaWXp+POe73fh6TLigakgzygR/
 GQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638403; x=1698243203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6bLxBklXqCA6pp1eqkZHUbqa8cn5QQGHgcnGcbF5xE=;
 b=ISwWRiuggMz/w+zNLUPTBohVQNSrftTqoTSk0eHe/k/+9otoIwUb4tN5HeNc/u/Xb3
 k9NgJS/kpr25+iJ1bajwdtCpXMuw3iWEPdFKj8rK/xQrxAPp5C3VlJl9KFGVGBlhCZeU
 SX4Sc5kdkvDGhKnJ/VQtGhKmgERnvSFpWd5tP27Bumh3DxowIxEH/sFr7VJRG+1G1koz
 GIcVMtkUzgdcstLFz1h0PVvTzoGMpkl6jGIc6EgqIa1G2pEUpewINuoSjLqszLdxDbmp
 4k84lzw7c/TQTHw357uNs1S3p4I86tuAYP9vtknDTTwE4BUzIg6zqtPkIt1jxEy8GE1m
 St1g==
X-Gm-Message-State: AOJu0YxhUgXtsmEHqI+mThzWq14qG9yAIGcbOtw33XbvYP2oboIxtosz
 SMv+1lotWPTD50Wn9EW3r+XTtA==
X-Received: by 2002:a17:907:968c:b0:9bf:30e8:5bfd with SMTP id
 hd12-20020a170907968c00b009bf30e85bfdmr4613711ejc.48.1697638403486; 
 Wed, 18 Oct 2023 07:13:23 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 j14-20020a170906104e00b009c5c5c2c5a4sm1738187ejj.219.2023.10.18.07.13.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:13:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 11/12] hw/sysbus: Ensure device is not realized before adding
 MMIO region
Date: Wed, 18 Oct 2023 16:11:49 +0200
Message-ID: <20231018141151.87466-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: 7I4bWE0sIt2t

sysbus_init_mmio() should not be called on realized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 35f902b582..ce54e2c416 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -192,6 +192,11 @@ void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
     int n;
 
     assert(dev->num_mmio < QDEV_MAX_MMIO);
+    if (DEVICE(dev)->realized) {
+        error_report("sysbus_init_mmio(type:%s) but object is realized",
+                     object_get_typename(OBJECT(dev)));
+        abort();
+    }
     n = dev->num_mmio++;
     dev->mmio[n].addr = -1;
     dev->mmio[n].memory = memory;
-- 
2.41.0


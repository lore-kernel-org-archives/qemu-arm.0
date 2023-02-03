Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1643994ejb;
        Fri, 3 Feb 2023 10:12:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+g6eeo9w4sdV0XLceJrQOtvNokwoaXqtrIR6PSpD1hwd3XBBLjETI2LEcit+qOD54Dm7a2
X-Received: by 2002:a0c:9a46:0:b0:537:916d:d9c4 with SMTP id q6-20020a0c9a46000000b00537916dd9c4mr15685126qvd.39.1675447924321;
        Fri, 03 Feb 2023 10:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447924; cv=none;
        d=google.com; s=arc-20160816;
        b=X5CPG+m4JaunchYP9pnVdHeEPou4pcSWs98hh4IxFK2F2i8TlbhV9QBtoMF+GsXnmU
         ldUeXPH7Bl5Bw1NWQcwG9UKWT3C31bFtYEhrvVKFy+1AApnBfD0NTgyogRDQpihnXRd4
         +PsNt9WMDun6Nzgg2b+QRGd8pDQm0CPNtcNm+Lw0tmDcc23k0z/UDmZdIa9A/RURYQDI
         nQXn6oP6/ZnTuU3WdXsmQdM+GUkUX+dUO9vlsc5ZpxnVIdNymZGD8FSuiQoXgjzeGFku
         B1SkJ5OdGNhVb7stWhTK0z8wrUkGCLg8m8GVD1XzTPHH3mIrCEejmAZXpofNlV7Mrm/k
         I9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i7hpzOoatAaR1sv90A1kGZcFCN2UpEoRoocI+6JRu0E=;
        b=KMqhmtHIRTPiCp2xFAjdnZ8Uz8mDwbfQFg3BWUSLxae2EgS396T4/j14wA4fub/Moz
         f6dmI1DJ6ykG4RQkvD4xJ8phUFbT2cQZ/h3qz0NWgraqSdKjJ6HEa3E6VN6F5dc2NZap
         UxBBWu1UHti1TjVLo6AcUBH+GCJVrNujVz0wB6nL6eSZRmM+bj8ROzpModd3DgHps0Qj
         zL1gDMp9mVbY8udiev9Om/4S2LaYRKl+72wH5lr4B4EP7LNZhnPZgZhpzp5yhTkgPAyy
         ANCWWW+JLcrebZjSQipL3Kmi6NiVRqOeE0wDhikUbX+SXHJboRMb7885mMD8JDM84iYx
         tAfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6eTEeWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65-20020a37d244000000b00706a08d2316si2127041qkj.558.2023.02.03.10.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:12:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6eTEeWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0VO-000793-1d; Fri, 03 Feb 2023 13:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VM-00078B-FC
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VK-0008Aa-UF
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so5373260wrb.11
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7hpzOoatAaR1sv90A1kGZcFCN2UpEoRoocI+6JRu0E=;
 b=z6eTEeWHfQXgqllooKcV4N3zoNYO15jzWZdtIsI/zQXKfW4kKTCVtgnUybmZOXl1gw
 sB7bBMD5AcXW7wkfOyQNIJVWUR8/n8BSUvffXvYyH0yGiS5/axnZ2hCz+gkySmfTrdPZ
 S2hs6bu03Nq2hTPEmCqqVEbP1bgaXvk1NxfSaf//6Hs8E9ZTrHJewvdHsKuIQwUtNWTG
 PEdkuQyhc+7LritXI3ro0aO4hUQXNrfjkmJ+cqKEO05cjLQZN4sXmdQ0y8B0k5ndkJSE
 YVZO2yPPE1bHW1tofInIfuiT5KTWWpBhceySQSjmnBr76EuR8CDCn07FsVIYaCEE+nbE
 Qh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7hpzOoatAaR1sv90A1kGZcFCN2UpEoRoocI+6JRu0E=;
 b=MVhSkelvYQJ6trBsjf8s5AO/BVTC8/F1QNPjvnWL8gQpGh+9XsCH5mynIsRayUnDIM
 WJt4Jn04853bIBYdOoL96SDqbm6GE6odpxP76JgM/ISuclNok9kzqYs5u01xu3SCA7Ey
 8O/XHBbSfX8Qr17PU6VkYD84aoovb89acR8QMSa86+LkENk08YkRb4hilWblLI5LlwNB
 7EkiIyX5RlIsiQ8lP0CfUfDWav0EkCCSUZJBblgBOCxtRFXTZP8lX/jh5DJDPLjm31Gk
 rSYoyLxc3B5mE7v6y9tn5KZhouwBkhnzVxXeV7IFwUPKDiXN6ZBeaNXWbMFjpIKTl5J7
 nJSg==
X-Gm-Message-State: AO0yUKXQCSopxHwucarFUYbfIGMk4qRy2n98j2SKmdQ0utcDSwAP7Nab
 jxysUKNBWUY/v6auN3meoTFRug==
X-Received: by 2002:adf:fc88:0:b0:2bf:d940:29b6 with SMTP id
 g8-20020adffc88000000b002bfd94029b6mr9838575wrr.54.1675447782284; 
 Fri, 03 Feb 2023 10:09:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d65cf000000b002bfc0558ecdsm2513920wrw.113.2023.02.03.10.09.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC PATCH 05/19] hw/core/numa: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:00 +0100
Message-Id: <20230203180914.49112-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
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
X-TUID: U6iluft/sfca

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d8..9b6f9848e3 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -34,6 +34,7 @@
 #include "qapi/opts-visitor.h"
 #include "qapi/qapi-visit-machine.h"
 #include "sysemu/qtest.h"
+#include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "hw/mem/pc-dimm.h"
 #include "migration/vmstate.h"
@@ -740,8 +741,7 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
         /* due to bug in libvirt, it doesn't pass node-id from props on
          * device_add as expected, so we have to fix it up here */
         if (slot->props.has_node_id) {
-            object_property_set_int(OBJECT(dev), "node-id",
-                                    slot->props.node_id, errp);
+            qdev_prop_set_int32(dev, "node-id", slot->props.node_id);
         }
     } else if (node_id != slot->props.node_id) {
         error_setg(errp, "invalid node-id, must be %"PRId64,
-- 
2.38.1


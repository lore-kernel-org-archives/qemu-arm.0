Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3989731ejv;
        Tue, 2 Apr 2024 07:26:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnsKLKqP17mh8HZ1LdWClNdbdlo9ZLA+QGHMG3r9KDgvYXps178A0uC7wr2nOsodIePVejEhdYeiau6m9+vqarHePsGezX
X-Google-Smtp-Source: AGHT+IEvvGWO4m7+H2uXduDiAmU2j/91066F1/iZqHbA+4p0oO08SRXU1Gth6/WiWvUswRlg8SkD
X-Received: by 2002:a05:6122:a05:b0:4d4:2931:7d4d with SMTP id 5-20020a0561220a0500b004d429317d4dmr11008704vkn.5.1712067963558;
        Tue, 02 Apr 2024 07:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712067963; cv=none;
        d=google.com; s=arc-20160816;
        b=TW8M/iU8MeXZ8FbxzFPp/JjPIwdaQrYDPhRnrAYniFRa5+khnojFM4ee//hqodLY3/
         LTKWBHfRkkZg3SXpAjnHF10sQ6qy0ht4Mt7UkWaSnkUGCgkq0Akl65MUyfV27pJlp2/t
         +0O9Pt2oOdLzySs3XJL1zcm1ED44Q0BcS/dklF0of+qNlMQqNF5dwPSLcRTsEOW5NFix
         zPk1VJTY4dNzGddSSbaum98tciTt0LW/3IalWHspV9Y3SBtzv4djnLrSuizAclSTZX1t
         uFvKPOesQvgtnXm/kR4xImm15P4XUlFrO/EEbUKRVgeGCxEmJiF4dWQo6k9xQ2i6i9NR
         P1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kQNXAA1wuI9r1xEVFBSvxjPye1eCu2fvaop4AIt2tLo=;
        fh=C4fMUwqqidazUuZ8kB3EOhHKSjdukascfGMz7Oetwxs=;
        b=WIQ+Xyh8IgTBLbZRLQvAoSyTZESsNeMXY5FdH9kOfNhD0XWjo0H2rDX51TdKe2wqvh
         XDNv1XLfXRQAaiNp+tmukvTju1235mrlapVfFNmsV5maQPMbKktClYeQsqmqSzVL5eaY
         Fnn3WNPt22hx039uUw4EfiBuXPgE1XYAlBbIlLbUDTIe/k+r9jZqcn6XEHgDIPwI1EAr
         mg120RCRCBi/bHPAfEYWj4R8MQRE5MGYNYmTlZUpdInFad5XPw8wtJ5dFb0JQH2xCTLu
         8usYpVzLXUsa2jpRRYYz9tUgHFAk5gWfL5ZVvWOciuMQwRxi9KL1oAHgRlW4aDrwhMCi
         Xksg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yt9ERwCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24-20020a056122105800b004d88ff4e2b2si1520485vkn.243.2024.04.02.07.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yt9ERwCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf52-0001bw-Sg; Tue, 02 Apr 2024 10:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf51-0001ZU-FB
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf4y-0008Nn-7x
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4156684ee9cso14166485e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067934; x=1712672734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQNXAA1wuI9r1xEVFBSvxjPye1eCu2fvaop4AIt2tLo=;
 b=Yt9ERwCRY5n/jJ7PAk7SKe2GNicxXTUNdVu62EJbua+QF+NjOzSHslPVKm+rldTdJp
 8xIhRr8/Vj3JJOeC+dgCHhMhUcuoMyQzrKUjz9GVl83Vm/O2HQPV0eZoDMrHc4PECsOL
 pZxY6UNRA9A30TPz+9EJfhRvCZYaWFBCcAg2h4FTGwqtFC66z+5kGk7A+JHCbUdqjaQq
 qMrroyjV9UqqfxErd6+otvCPDGke79DgJdJFEQWyT7wCIluqRzzD9pekMOkSGuoN9gl7
 TasMGYVH5Tu2OjZnJ3aKDMHxoSAyJQAwxcIh3qDH3cgbS0pgBdiulyGCvz7lUGQLueKF
 T/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067934; x=1712672734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQNXAA1wuI9r1xEVFBSvxjPye1eCu2fvaop4AIt2tLo=;
 b=q6xkqli+VabpKykoCLX9HuaAEDXvMf9iH3ceO+qQV6KviPI2V8dsVv9lZbXRdDdR1N
 xVtSvP+aj492vc5XRXkgPi71yYCotftUhoIlZT8zMJqZbGLdIH00cK8SC9b/4b2xSoNn
 EkWJVCZYzkcXy3+MutfXkcFNu/7aFlR3x5PE/fpwee6V00Qxpqde1lbai9QhYOtj3MQ0
 qjWoZNO2UQRdIyJlIn17IBfhNjO36dF0SnCGb7KDxfr018byv+59CEoc7WL3dTfC3IgL
 5sqsHfiMFNHQODLPAjgaKB1zc2kZa6Rj+aYdvNeRuqJLxgrw5qEhkj5n+5zvWfBHBeOF
 NJeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU5/5iML/fsEq+9iDfGiZaZVxX4i3ZGsKzzylryyH5Ln/uU11nL+ef6q3qhJE7GOOyTiMpJemjZA8k61sQXwoFbDBu
X-Gm-Message-State: AOJu0YyBBz0BAklsvrUpr6+qyDdD/PcIPoO6ECcCOWOjxMaofVjmCLeR
 RkihX0WJ7IW+4wB1LKvKUopI/sZg589F+I7uIgY9dB/2Y+cjfrunWweqrYwSKZk=
X-Received: by 2002:a1c:4b04:0:b0:415:f755:5a1f with SMTP id
 y4-20020a1c4b04000000b00415f7555a1fmr1630323wma.29.1712067934343; 
 Tue, 02 Apr 2024 07:25:34 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b00413eb5aa694sm18186167wmo.38.2024.04.02.07.25.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:25:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 09/15] hw/i386/pc: Restrict CXL to PCI-based machines
Date: Tue,  2 Apr 2024 16:24:24 +0200
Message-ID: <20240402142431.70700-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: Quia1p7eJ8hv

CXL is based on PCIe. In is pointless to initialize
its context on non-PCI machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-ID: <20240327161642.33574-1-philmd@linaro.org>
---
 hw/i386/pc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e80f02bef4..5c21b0c4db 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1738,7 +1738,9 @@ static void pc_machine_initfn(Object *obj)
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_add_alias(OBJECT(pcms), "pcspk-audiodev",
                               OBJECT(pcms->pcspk), "audiodev");
-    cxl_machine_init(obj, &pcms->cxl_devices_state);
+    if (pcmc->pci_enabled) {
+        cxl_machine_init(obj, &pcms->cxl_devices_state);
+    }
 
     pcms->machine_done.notify = pc_machine_done;
     qemu_add_machine_init_done_notifier(&pcms->machine_done);
-- 
2.41.0


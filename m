Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A33CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:23:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNNN-0003YG-Ad; Fri, 24 Oct 2025 15:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNNL-0003Ww-DO
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:22:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNNI-00008s-Jb
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:22:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47114a40161so24984085e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333775; x=1761938575; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGrNlmgEfDKog95M9ZVss58H7CcoVe9WzE/h57EW+cY=;
 b=ZYYHRzQRN9trJu+hSBH8YxTGwPyraba9RNqX/F7K1jNkXnwdUMYQWrkImmjmaFIlBu
 L7twyGf0WHstuoq2UqvxvImEc5b/GRJg/2hRB86ITnXvZOBHairAxILiFeCVasEHzFlI
 pg6YuKqpxMSk3eERK5Ojvyg/azrB1G4TOhTRp3msA5oW5K6qsA5C5btgm/3Wa3JIh5vS
 pHVhTPROn9VaeZ/e8n9zSr1TB9W+q8ZdxwQUkPRewWsT3z8nmE1gK59PteP8oyolcQds
 coUgqMpIw/ZAwz56jFOKmtqDPnh48WCm/vgpCkMtteKgd88fyaL3XyECILy8PUVbvJce
 kyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333775; x=1761938575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGrNlmgEfDKog95M9ZVss58H7CcoVe9WzE/h57EW+cY=;
 b=qDaMB9OTwl43ISBnWDmuaJ23qf8+XARJJaKaIWJsVMF81xbUc7JI0KkJ4axmNA1jA4
 IPhUAW/YbOliGGaOGndwq79J3CmQOVX2dLRjFhOjG4CCGHj+vX1nkrbON55oOz4DQ+AF
 410KTt23sST99sdBmQRKgBiuSKgimq4SD8ob393db+FflRVh5WrjmKQEbRhwQa0uDBow
 SuviTxtQKbtWJeR3FP7khKNXFYoQjXiB0ltv9c9KJsjuBgljjNV210mgBNrYHbkHzGir
 oTrrgNIFv1hLi0pVc6iwFzTEtpu/5N+wpijBSbT44zgIdYhpyLGx7GuKlMIlC3uX1W97
 FgIQ==
X-Gm-Message-State: AOJu0YyyA/+0XbVk8IddGSKQ97QAuNphKzT1SypzFitT6Gt0VBS+Vj6+
 DuzBzDpr7bQKO9gerIj0VuuxHP/PeP1vjo7sVB1+7Wysjm0BRX6YBkpf3hUUNSDoDx0X/2o/nIF
 iaZcq+lE=
X-Gm-Gg: ASbGncsnATLNy5EJjfHleFOrBB0dPqp7lLZC0aFPh3mMVJIHPUhxC1bS5qTALVvgqMz
 JcVEVsjrpxpPj65CpJhdUAYGk2DmRY4RCvovrGAoGXhmikXnQTO26tW3OTVzxT9m+ChEL7cGNZS
 uBYfsgN9Df8YAEyCV2N9aJ9prH8oyrofpaDt+uRmeWBH2qG4zAucIz/81aTXrRqNkYS5Mhm4jya
 D9cewsNv8PhYJ6WT7rzdbMMx3OOagTD0zThfEiAwgc8vI+KVX4o9jWwWBDQ9qLq0chHMnSlVhDl
 g6Ni9cgiMSKO6CLiEBokagRkv/IBAq3A3UJPLc1/0Nx9rzmdUMXfi2JOp0+C1m3M1yToq+uytT8
 0rECrju6qDMZ9lkByWFXZE2+IaXWTx11qAcMWBGqInkGKs3gNX+nUB9Q6zFKJ7R+IlmH29iY/0B
 UGShLaPi/a8JfeAARa79TiYrG61azKPVTteVr2gptrR9QafR41tlibdSR++5Pj
X-Google-Smtp-Source: AGHT+IEFnDI3ledJ0LfrIPwH2sO4YMX3+BMmj6jZc8PUQduOy7lvc4bZAI4a4cAswh095gb5WNfapQ==
X-Received: by 2002:a05:600c:548d:b0:46e:436c:2191 with SMTP id
 5b1f17b1804b1-47117903f96mr228552875e9.25.1761333774875; 
 Fri, 24 Oct 2025 12:22:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57d9sm11118596f8f.20.2025.10.24.12.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:22:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Ani Sinha <anisinha@redhat.com>
Subject: [PATCH 12/27] hw/misc/empty_slot: Include missing 'system/memory.h'
 header
Date: Fri, 24 Oct 2025 21:03:59 +0200
Message-ID: <20251024190416.8803-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  hw/misc/empty_slot.c:26:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     26 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/empty_slot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/empty_slot.c b/hw/misc/empty_slot.c
index 239d7603207..1cc3bcd9050 100644
--- a/hw/misc/empty_slot.c
+++ b/hw/misc/empty_slot.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define TYPE_EMPTY_SLOT "empty_slot"
 OBJECT_DECLARE_SIMPLE_TYPE(EmptySlot, EMPTY_SLOT)
-- 
2.51.0



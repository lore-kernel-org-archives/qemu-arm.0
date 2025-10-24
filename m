Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19980CCF9E0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNOz-0004IU-L8; Fri, 24 Oct 2025 15:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNOp-0004H4-K5
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:24:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNOn-0000PJ-Nh
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:24:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so1655324f8f.2
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333868; x=1761938668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBOD7zGmQL29Jy5BKEW2FN23f31HLnybiZZBlEWgQZg=;
 b=EH2uyZOtmt7YgXLFdQo8cLTw0uLQnhobHBCpz9r1+syW/aMOJ+nAW+mLMf/EXR/Bfw
 3IofXU7b58P/a9wX1r4/H005Lcvl1cOChs6hnFZbbglmTHOoy711kjkqzJR1D47D5xHd
 7224CNMqUZE28hJBo0hykI5Q+GAx4Pcp/cBBUyu54gRY/4bJ5N/8WLBy70VzyJIEBgDQ
 zA2CrVSuC4IdhbO0BalvrVTWsp4iYlevz+KYYxOKCcOJyMn80kkup5PDA+gyB8jRmC1w
 Y5SpdilaSvQaKb5TMVcOiQWBrzZXR4KzlBenlDMEpFr9l7cXwC5j/elIez79kIeThjSg
 CBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333868; x=1761938668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBOD7zGmQL29Jy5BKEW2FN23f31HLnybiZZBlEWgQZg=;
 b=VVvxwBZfBOja6g/teEhVtT1sraRhh5Y/keqZNjKl/dm2ydgvg52/cX9bhmwF09Hb9W
 EiNw3k0roWIDaVfdKkeQNrvapoMi3s0pVPvneeOiTaq2z36zbH9952PkyCd7SsQ4NgAR
 4Lqplq+kC5x/RlP7WbwMuEzvNvTvPA/Jjt+gwRJ4uyUz25No8K+UidsAEsrOoycGPcKX
 g73t3FhWRWFmdhhRC3F/cTfpzADblyQ+tyKHoxrzhz/y8ed470smXrjAhQGoO9beahaK
 it6hoipnLZCvCSLVWe0+gfiMMMGJjJJc01oXj4GsBi2WmFV25RbmfjfsXVsg4rhM6pDv
 7m6g==
X-Gm-Message-State: AOJu0YzlXCuZi4X/TiVMhu0xVEYnsTHsmhnF/mKxZoy0ZDoSxyw3SbHp
 mapfgyZ6lJfSfmrj7dV7TO9pcNbBpl6NIFk1RHQdM1DC2FUdpSTPNwvcnvUKInnOk1c=
X-Gm-Gg: ASbGncsjxLgMOVE4CJEN6bWIFSngJQy+mcSnJZ2fOHD381hMPcJg5oG+6HWY//k2wim
 8QMJAbJr6WFUYZFscSnmQ03fK5Pa7Va79DvlP5NFBBai1dvGLKVf/VUGXPeif0AwSHMJxxAhz6S
 Ndy/6dgUmMsABeNSF8KXV/xPvO+i/iIcJFQKuoJVW01n/46Jx3UwtQxNACfgJl1gntGA3h5rnJC
 LV1jw8FAVI9dTQA2tordriRHeyeSp/Bmrt26ITYbSKJqoMgy05+YSnowMjd89e2esfwrA3LnSNu
 qM+cy4lyvvu6dNGUL0nrj9gEeMzIwWBErl8nFdg8so7hj/qnsrME2fDMZQ7ajlvip5/bSs9Iydm
 BNpA/Y8kwY1nJuSAb0HEs7mMH1uG25x0+lym/VUFeSCj9edpVjAkovPJsOgWpPpiRU04qqRGCj+
 JAycgajEKHt9IVt+kEqmsfYNDZsiJu4ocT91U0/eWTJ7N3iKl/i0WcV9Jl4XMc
X-Google-Smtp-Source: AGHT+IFmUFD3XEAIRtQ58ZOAzfKO3Ya/wsE5mgEQg5gxBdVm52AB3hHpG0XlML3dRK7B4iX1QQVuYA==
X-Received: by 2002:a05:6000:1789:b0:426:d54a:67e with SMTP id
 ffacd0b85a97d-4298a0bd14amr5540308f8f.44.1761333867766; 
 Fri, 24 Oct 2025 12:24:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e76b8sm11104208f8f.1.2025.10.24.12.24.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:24:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 13/27] hw/uefi: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:00 +0200
Message-ID: <20251024190416.8803-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  include/hw/uefi/var-service.h:50:39: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     50 |     MemoryRegion                      mr;
        |                                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/uefi/var-service.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/uefi/var-service.h b/include/hw/uefi/var-service.h
index f7ceac4ce24..91fb4a20918 100644
--- a/include/hw/uefi/var-service.h
+++ b/include/hw/uefi/var-service.h
@@ -9,6 +9,7 @@
 #include "qemu/uuid.h"
 #include "qemu/queue.h"
 
+#include "system/memory.h"
 #include "hw/uefi/var-service-edk2.h"
 
 #define MAX_BUFFER_SIZE (64 * 1024)
-- 
2.51.0



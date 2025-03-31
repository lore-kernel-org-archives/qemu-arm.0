Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2182440njd;
        Mon, 31 Mar 2025 08:21:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8/B5v17TgkHNxVPnJOd3oYWYTNQ7883nBcpESKu7hg/OEPlPQgcra3dEsJ1kNcApZ5MPNIr8YPCyfpw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVAntss34dTzjAK3Ddg752JYWCEpWBTtAT2QkErMjuLXqLX/DTd+SZRHkNI01cLLf2naAh
X-Received: by 2002:ad4:4ee3:0:b0:6e8:fee2:aadb with SMTP id 6a1803df08f44-6eed6260a8dmr163551326d6.27.1743434461899;
        Mon, 31 Mar 2025 08:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743434461; cv=none;
        d=google.com; s=arc-20240605;
        b=Gh2phSbrVqFSihRRzQP6gl83oQUg2f4+A0/Ajf3AlbUcNQUtivcsqSZPpi2m8C2jNJ
         U28p3Oa3oAEDR7USzD7y8ImmnsdkH33pZQE4kG8uUE7UhgeH/yajT5Dv8Ckb/lpfZ6MR
         ThU2usyRVa0RYQrz2JvRb0jcHNNGAklsnnRSaBYQEgugWKt7FRv9uUCn8Lhsn0iho0z0
         EbEU3G75XqFP2e7fSExZfHugE88xNGxEPhDKlUXe2on7USymKKf6R4wOuGL1AQm1haCQ
         HPgyoSHOrTxF/BAU5iBIWzDiCBNt/iJtnn6F41BBnXvNnMTOq79etG/4W7lEAen5LSyu
         aO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tHDVcIHyei1/5z2v4ais2OKqYJbZicKYgClVfwcyY94=;
        fh=HMrEZRLdpl6lxLTNESsbR/O745YkHCPPR/11hkvJJnc=;
        b=c7i4EhR440ylOE+PIyBkH3RNoOVTycRy3qPnPiWu9rFgBfIA9owFC78Z2rNX/QgY3t
         5r4K6vRt70lsCxj0igpJy7i68N37liC9nGOZJwvNCr1gvGoOrHhbktCoLUW0wBsXIBZJ
         GwGWnFu0XKhEtAAPBUu/HVAbgfR924xy+S/OrfsGr1WlA0M0GPBkvX4fG8xBjxENxKHT
         EqoY+gm1CRiU9Bg+h+72k3U3V5onXCUjj+cpQLs+FFo3HuJh6EbgDFyJj3iv0BCCThFP
         tpclEAPbYW3dnmn1oRIHLw4goTnrtBYoZt9ThTKOa+mVTe5HqqBeaTY8qRXYlShW3rE3
         Bk/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t+wR9wa7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec9659ac0si69331336d6.138.2025.03.31.08.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 08:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t+wR9wa7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzGwY-0007DA-FJ; Mon, 31 Mar 2025 11:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzGwV-0007BP-Of
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 11:20:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzGwU-0007Oh-36
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 11:20:51 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so29490915e9.0
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 08:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743434448; x=1744039248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHDVcIHyei1/5z2v4ais2OKqYJbZicKYgClVfwcyY94=;
 b=t+wR9wa7ZiGNA5yHpWw3ooleDvDbDBaT90hVLmD1vfPmw3pFkhyVlo6jcSmFum3VEP
 Yg6NhlXLKUT4e3FlDQBUlQvwTTifg6lmEvtWDT5EKn/nDZLEJwh5v4vICcgdPAy2YXkM
 vnWag8i1lIuyAvgDeDyGhyU6fCYWncbB5PTnW2cmAIj83Wi4XI2NnqZuFgI4KfMnzESj
 i9I0/HlXaiykjV4WjhhrIWvT3msToD5KVuvlR8N0IJjI3wsYG/ogOLvyuFi6Z3YrgOfb
 PEK2xxJ99sIxlEH9k6r9dNSG6hvV+UKfTL7wNccpv1u1yr0Y9A9BiRpfIUWRhBxytR+d
 WlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743434448; x=1744039248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHDVcIHyei1/5z2v4ais2OKqYJbZicKYgClVfwcyY94=;
 b=lNR8F6FO6mmZSJxR8aq2Jyo76pg/e1kYMpFVC0IGHvqEfzjU7agchZVPRRl6DDBaSG
 gJeCaHZNyRsp3hGnz7QCxC9cF3LwtkKCy65X92w6c54sOGlryE3z/amabpHDbCPJ+HLu
 eSLxSop3yeJBeNJ31f4rFvHkhhQpj4AtWGkiMYqxrI+HP+ZP/vv5TYb1d20OE4Z2yAe9
 gx9ab8+AwQr3h2j9ynLSAkhrccg2Fe/VuomqSTW2k9DVu987j0eYWoW918Crg32a4HsA
 bMD8qH1tXvq9OQzzZ8DlUDMb1a5PUShLk+NakaEnW+ZezmUMKf/sVwMVkyywhtOz/39S
 3/vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX60ctEBfH6T7/grMotyJ+SC/QDmtyU0G1bEVxZ/ZQ3fjLDDlZACbAbWLQh4LMDQDI1ldCiN9NlOg==@nongnu.org
X-Gm-Message-State: AOJu0YygAhtcu8sk+uXrGaitFuWiGXfBqdOZ8LI0ZoKykGCAJoLtEFSg
 Eu/3lwtBplKz4mq9BsiyOVUbIq+oqKwREasdB3uI+fL7RFarDgQGwDjUCNaBYKC58OpxqH7Dvfm
 0
X-Gm-Gg: ASbGncttNp6dmIRfLx5VgIy8w+W0LsTUzei/e8QNmAQwg/++ZEy/3AqhnphnhfR1vc0
 cblj5fzxsgqMladE9tJW/QeOLgl55qL8HFocz5LKFZEpwBD708KTgE4xxopqAIL5o/48j517dNO
 B5tvz8aEn1pkXlMmA04ZYSBkAIhcms0f48VaRztHPul0EOEioqqNaPtjein+VWrQu+7vYXdZjgH
 c2vxabG2NRkxqAtN2Lawyx0N2wR4VM8kU6fFySOYICMe008hgNM8LMihDh3sz9iZ2DrRCFxjYVD
 NWJbDr+O0KZVx3Jv4AvZeR1JzP7ScE/+yGvoK1rVENAJ+bgUdfkin7MuM+j/LwOb0pX35vshWuf
 iq0LKPPNoscance50De0=
X-Received: by 2002:a05:600c:34d0:b0:43c:f5e4:895e with SMTP id
 5b1f17b1804b1-43db61d7785mr73395325e9.1.1743434448530; 
 Mon, 31 Mar 2025 08:20:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d914f1561sm82919785e9.1.2025.03.31.08.20.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 08:20:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>, Joey <jeundery@gmail.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH-for-10.0 1/2] hw/pci-host/designware: Fix access to
 ATU_UPPER_TARGET register
Date: Mon, 31 Mar 2025 17:20:40 +0200
Message-ID: <20250331152041.74533-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250331152041.74533-1-philmd@linaro.org>
References: <20250331152041.74533-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: 5KLjIXPZvFsx

Fix copy/paste error writing to the ATU_UPPER_TARGET
register, we want to update the upper 32 bits.

Cc: qemu-stable@nongnu.org
Reported-by: Joey <jeundery@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2861
Fixes: d64e5eabc4c ("pci: Add support for Designware IP block")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/designware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index c07740bfaa4..5598d18f478 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -371,7 +371,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
 
     case DESIGNWARE_PCIE_ATU_UPPER_TARGET:
         viewport->target &= 0x00000000FFFFFFFFULL;
-        viewport->target |= val;
+        viewport->target |= (uint64_t)val << 32;
         break;
 
     case DESIGNWARE_PCIE_ATU_LIMIT:
-- 
2.47.1


Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp740365ejb;
        Thu, 15 Feb 2024 10:05:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnXHVCJfGII8wwOlbK8CgGAb3RXfhkjGT0Whvshf1BDKa4VOw+oHyAa/wnBveJMsSs/uj9BNindrO7cnNxtAjeCZwWI6xn
X-Google-Smtp-Source: AGHT+IHu8gvTsl82ji5eQe4AWOzLqlRWQBQCTgBQh860hFVUL8KYferUMlIPuayo1O7NzpVyXhEu
X-Received: by 2002:a05:6870:64a1:b0:218:d445:78f8 with SMTP id cz33-20020a05687064a100b00218d44578f8mr2472438oab.9.1708020326348;
        Thu, 15 Feb 2024 10:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020326; cv=none;
        d=google.com; s=arc-20160816;
        b=MJAPaek2sP2ka9vuDw6NJv6kouozJj8FAjL6ie1NZi9L6G862IhkNKZMC4r+oigdN0
         mXyDMm6gJpjKEPG5lwJZIEwNGtkYRGuKRjlCwQ0Lwl1PURBGnem/ZOSK05F7JU3szCTI
         99kUA6wPCNkMhsTPy/lOU6OuCWLT9skkLXlRy7NDLzaLMHnIb5XDj2BB/YLQWgWMDpW3
         rv3jLbkT7ojrzzZpgCbaywxN0ehwsqKM/Ctp8rOaIivK++17kznsDLArowjcxL8yz89m
         evmbqkFDV644owU21031fM1AHvAoAIoyJ3cOkmyydCHfME/OtB7NU7/oKU1s0YYWmsA/
         nGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xfCkJEQkL13uYlKC8WYjGFkI0aspDHRkh5m4W/eac1U=;
        fh=RnY3BkcA5+JvuWZkU8e2LOihW+vbjuMZ8X6rJsvoWdI=;
        b=yhPS+1KTml4PGYPdSBgasQcND44SnuRBF//pBQruFjQ+I1b9g8eltwiXEbMxJjJYGZ
         XS4ECOKOi6iljPdX+d9buBKy/ygrF/D+7RgnltFvBLJpNAYSiP3gyfEHGZMK1YzBq0ek
         gvGA04gEQVvuEBBbxd9nbgNx9YohXVkm6o9nzaqTAwrcU2mTQGI+5+WtOo8A11gUHArZ
         kq1c/zQRTXQaQiyuRG3Sy9NdVJKN5V/Qt+rxunxU/r4p19XvuUfeJiSPbB352hX+ym+m
         8zUiYu0Y3VZYr/O1pmngYlejm8txRHKli2wLwl7PfuVLcAsn2DfXlWZh/f9c7ts4TPek
         4tVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdTLLq3z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ep15-20020a056122390f00b004bd6f2d6ffdsi426069vkb.278.2024.02.15.10.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdTLLq3z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag5U-0002O7-TA; Thu, 15 Feb 2024 13:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5L-0001wn-Ho
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:03:48 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5J-0003CR-3C
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:03:47 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3d6ea28d46so263027966b.1
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 10:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020223; x=1708625023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfCkJEQkL13uYlKC8WYjGFkI0aspDHRkh5m4W/eac1U=;
 b=DdTLLq3zRc2SElnLLqfSZBeBKHVyNTskJqyIQQ6LEIeMyycTPQIlvPtefsgXEuhS29
 2wKkEPp7fh85sxwNsGDYtTveoxUGw1oU72d9Q2LuVU2smoUKLNKXNB+yMKNsLX9Zjln0
 mk1TCdx/hSG/ppzdSiOv5nY35d2Ujf+lKwj+Miw7dZy0Xrucz8NDc/IenvZlRr1a1q2U
 ASfVkJgHAZ4+Nj9fJ3vuTeblqJkrej2W926ovZWO9n2onrVxhBdGuPKiybeFcK+9PUFl
 oJIuRBh+ERNFjWcRf6+prwjs4HxPbtXAhFr86SA2md4kuQmOoiTt0gpvsiEzt+w3/OcC
 qRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020223; x=1708625023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfCkJEQkL13uYlKC8WYjGFkI0aspDHRkh5m4W/eac1U=;
 b=bf3NyEyr8jCDHscCxwr6CzMj2W/CHL62LwrR45XHP3svFG7DdS+oK7CfgYZx0hrHUi
 2bm5HKhUWUaUoHS+ZOTIO0EwK52etjGRxxqDEsrKhzS/Wzbc6E8moPtl82vDRfuJTjmH
 yhauTnpqucNRYGlURjmRB1F6U0rdJXmgOGsYVp5uzKl62PHuTofD9UUIXdXm7XqZTwCj
 si+gElDB18NFLSmn22oqSA6vEQWRQfyNNHGGWPksvrnKjIORAAba1Z7J7IXFD72t6cn8
 diI06V+BuV7rARibCJI/RGLJ9/MkkDga4m+PvEc/mbbh2pHNaPALHXEOzCGH97hXZ9Jb
 YMMg==
X-Gm-Message-State: AOJu0YyoC4sIytJWr7ADlLDxI+llrGy8I35Mivc7vtjhqkHk5VuD9oR+
 u8DP3arGxEQXkwDXI/NEEsvucRS1EZ9O6r6PLLVg+zp/dkIubHQq3aTJtnapbJovzfXJIXH36dm
 aRS4=
X-Received: by 2002:a17:906:bc4e:b0:a3c:a545:5fd8 with SMTP id
 s14-20020a170906bc4e00b00a3ca5455fd8mr2480206ejv.26.1708020223279; 
 Thu, 15 Feb 2024 10:03:43 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a1709066c8d00b00a38936aa08dsm791978ejr.32.2024.02.15.10.03.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:03:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 52/56] hw/ide/ahci: Convert AHCIState::ports to unsigned
Date: Thu, 15 Feb 2024 18:57:46 +0100
Message-ID: <20240215175752.82828-53-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: GzfK0qH79wW8

AHCIState::ports should be unsigned. Besides, we never
check it for negative value. It is unlikely it was ever
used with more than INT32_MAX ports, so it is safe to
convert it to unsigned.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213081201.78951-7-philmd@linaro.org>
---
 include/hw/ide/ahci.h | 2 +-
 hw/ide/ahci.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 8cd55b1333..604d3a0994 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -46,7 +46,7 @@ typedef struct AHCIState {
     MemoryRegion idp;       /* Index-Data Pair I/O port space */
     unsigned idp_offset;    /* Offset of index in I/O port space */
     uint32_t idp_index;     /* Current IDP index */
-    int32_t ports;
+    uint32_t ports;
     qemu_irq irq;
     AddressSpace *as;
 } AHCIState;
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index bac1871a31..2c3306dae4 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1819,7 +1819,7 @@ const VMStateDescription vmstate_ahci = {
     .version_id = 1,
     .post_load = ahci_state_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_STRUCT_VARRAY_POINTER_INT32(dev, AHCIState, ports,
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(dev, AHCIState, ports,
                                      vmstate_ahci_device, AHCIDevice),
         VMSTATE_UINT32(control_regs.cap, AHCIState),
         VMSTATE_UINT32(control_regs.ghc, AHCIState),
@@ -1827,7 +1827,7 @@ const VMStateDescription vmstate_ahci = {
         VMSTATE_UINT32(control_regs.impl, AHCIState),
         VMSTATE_UINT32(control_regs.version, AHCIState),
         VMSTATE_UINT32(idp_index, AHCIState),
-        VMSTATE_INT32_EQUAL(ports, AHCIState, NULL),
+        VMSTATE_UINT32_EQUAL(ports, AHCIState, NULL),
         VMSTATE_END_OF_LIST()
     },
 };
-- 
2.41.0


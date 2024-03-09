Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp367912ejc;
        Sat, 9 Mar 2024 11:23:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYZ5xL7L4JeV89nQYUapsHQfo42MmVxHvrd4rzJoY3UUva+LH0T5/D8gdTq6vsxQxhA9mEIaZSqD+EJIr44+JpZoEIwXAE
X-Google-Smtp-Source: AGHT+IGl6djapJXPxH9Khv3gErcMIOnK4CCW53CYRGW7dQwdfZOue3ozrlsFnxJxZME1iFXl13ZM
X-Received: by 2002:ac8:7f03:0:b0:42f:2127:a72f with SMTP id f3-20020ac87f03000000b0042f2127a72fmr3411299qtk.54.1710012219796;
        Sat, 09 Mar 2024 11:23:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012219; cv=none;
        d=google.com; s=arc-20160816;
        b=yig84dqrUtQP9Jgp6Z+FmKP2T3ISwCjjrvMbsQWxytjbM57WxWhJ9PaF432w9KnpKH
         I8iAmM46ScDe6alb7+anHJI2/pOMHPapyJywRX62HaGBY9mXBHOMMbD1nrJ00R98BuCX
         zMU+L/k3867gLLs/dygcmt4iWS2ecLKBETQ+MJ6Q35UKKxlaGwOrpAIxDIXiDWT03ksH
         kZGPHvVteoz2qj6dzANiOx1oicuG+Ea0lzViZMj87KsQfOHsTM0T1cyUlEepLEnIgb9V
         h9uxIsX5qjvXkTxvpac9DbKWYDK367AQ2u/4LIwaGTKqIa6Wx5YjNvzaVy98qrvB1AEm
         dV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=9v68VdV/ZTxTWOB82N2ZE0IksCha8mce59bQC7Dz3io=;
        fh=+PP1EqSLQsyuiAWe4qw4CDqu4VmVC8CsRSUDajE/Rro=;
        b=BbeCc+6bqIC7zCI28kVJhD0Y/hFpPE/pcY19ZeJU+A0RHWFZC4YZsb9h+MBToPDcnY
         z03u/80+iqdhcMxsuUD89NqIoAzuYyVQ3Am3fyy9d20xZcTCJiZD8uv2LuP2Km6wMxnh
         taLrI6GRy4aVk1Tblv76tFAZJru0zOzLbQj2zAlabkGhr3z+4icCPouklTWGlZ/1HhQW
         nB3/5IX7YNOC29hYVVFMMsm+UIHnbwZJ/pvculhjF1TsUD9S91a8BuoK70nObO6hp9zC
         crdJ2TLwqv92P+aFz2FGBgiWptxpIBWWNLLpU+l8aaJf5ATvmFGkBkE7/R4Q00quZraE
         jQ2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEpkwDrD;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id n17-20020a05622a041100b0042ef635b836si2121020qtx.694.2024.03.09.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:23:39 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yEpkwDrD;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.690968.1076655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2H9-0000M3-V7; Sat, 09 Mar 2024 19:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690968.1076655; Sat, 09 Mar 2024 19:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2H9-0000Lw-SP; Sat, 09 Mar 2024 19:22:31 +0000
Received: by outflank-mailman (input) for mailman id 690968;
 Sat, 09 Mar 2024 19:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2H8-0000Lp-A2
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:22:30 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dcb3ae4-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:22:27 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so48590471fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:22:27 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a170906399b00b00a3ce60b003asm1185569eje.176.2024.03.09.11.22.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5dcb3ae4-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012147; x=1710616947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v68VdV/ZTxTWOB82N2ZE0IksCha8mce59bQC7Dz3io=;
        b=yEpkwDrDEK9gaMVwUMhBTD2iC76eIDs4c3mmaukr5E31sU94xeMu6QaKLxJfSo2t1j
         MJxXYh7ad+g/qkJJ2G632FiB2zEeYc9/djsaoD2L6mZDAwcXB1KOiOoMoYXf1lG6qj7F
         QBVqbi71bp1j5WJYA9bkVYdxuIzXlQ8azJgEIjI6XoLJYlsfb1+o+rMDXK1Ynf4RyNmB
         RUUmdea/ApF5S8CAx67ZzRuOb+uSy2pPMdTcKVV5B5+QOTWALZBJ1Fm/ER56RUyAE7sk
         r0qL1Mx7Rb+7AtvtX2jbf7Z85hdvoGVmmpRcwSaJ/ZHX1Fq2eFrcvd4HZmKOFEHeVKmI
         lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012147; x=1710616947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9v68VdV/ZTxTWOB82N2ZE0IksCha8mce59bQC7Dz3io=;
        b=e6chuYUxQtZjAVvFqDUEObICxKFHeyC/U1b8GXjOGP5BYVqd0VAQ8sFIuU+BY6EcHD
         /c0rSwOXcm0XWFzbzma1XlU0SrgmhKzqPGKrWd285viywcZCk377ShZ3M9UNA2E9k3JP
         hAAI8DqjGRvpUGxFj027UOx2hsyO27l1UBC4unA0EKeFx0PqDZpbaqPsIBosiuuU7Rqu
         ZqG2LR/2dzMxtE+hi+gAAZBR7PwGPJnT2UCGy7XgG3WI7DoOERcZ3P3zBcLoRuAZKLA5
         3wlTlhZWLW7InP4j07PcTzHuoJXiSI4l9DX5kTLILqjycRhg2grudI/uaU7DifZNtEVd
         NV1g==
X-Forwarded-Encrypted: i=1; AJvYcCU2pc9OGjGA3nygowsQAUHrmwABysQdyWat600LL82lOF1/SghAzy9IUFRqt224IK6lTU8w9D0XCsMXyL5y2cqTp8L8/uEO9iEcE2HkKKY=
X-Gm-Message-State: AOJu0YxeXDDNM4clBePbZtuZ0W5fYCLRA3jvmipHELd1ykNy1/xM11F2
	2IGkGqymFu8RoRNK7LXp1gVyhHyFWQ5zjzpElkP5BALBSGM0liwAEN1mdcCx/H0=
X-Received: by 2002:ac2:43d2:0:b0:513:486a:57af with SMTP id u18-20020ac243d2000000b00513486a57afmr1542144lfl.7.1710012147310;
        Sat, 09 Mar 2024 11:22:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 02/43] sysemu/xen: Forbid using Xen headers in user emulation
Date: Sat,  9 Mar 2024 20:21:29 +0100
Message-ID: <20240309192213.23420-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 39hT683JBPLA

Xen is a system specific accelerator, it makes no sense
to include its headers in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-3-philmd@linaro.org>
---
 include/sysemu/xen.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index bc13ad5692..a9f591f26d 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -10,6 +10,10 @@
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu/xen.h from user emulation
+#endif
+
 #include "exec/cpu-common.h"
 
 #ifdef NEED_CPU_H
@@ -26,16 +30,13 @@ extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
 
-#ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
-#endif
 
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
-#ifndef CONFIG_USER_ONLY
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     /* nothing */
@@ -45,7 +46,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 {
     g_assert_not_reached();
 }
-#endif
 
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
-- 
2.41.0


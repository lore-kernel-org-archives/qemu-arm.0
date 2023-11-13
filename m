Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408446ejc;
        Mon, 13 Nov 2023 07:22:01 -0800 (PST)
X-Received: by 2002:a05:6512:3183:b0:50a:77c5:12b0 with SMTP id i3-20020a056512318300b0050a77c512b0mr6263719lfe.5.1699888921606;
        Mon, 13 Nov 2023 07:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888921; cv=none;
        d=google.com; s=arc-20160816;
        b=O0tNdhAYgUlPtF4kWRIE68AfsUdOEnBONMkaM1xHwnh6T/BsWVmcU3vamHtoPgq0ja
         nGqlPlo8N8d1tXdXpYhCDCRr5l4ZuYY8o+Xqx1C4/rkAJPhM4WxxEs8JDI7dXuxw2oGC
         12XjlOE95mmJy6xzoInXTn2Tqj934wcDbzhEFUIip/r4cFQI3YisC8C3wC5DcBGjc3wU
         cff5PwniYeCjPIjCRD6ZoHPsBVgI+3MtIbE6tLmAz8Ye43weehPONa1R6acSiBwQ977T
         E3rL3pZ2fkscSSr/RKooOKNLFAFDiz5O+N4ts70/9TVN4BIa6JJuMJgsspnAetVP40Dt
         pAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=24ML07HsEvOYl+DuxzoZlUZnhAFy4fscEFWSzx7VWys=;
        fh=E0jvqUTVnbyPitMGLtsCjS/srUbMS2WTNKk9XEDC2rY=;
        b=Acc8VPRheA01q8saJPch5VdA+FRV0aOs8hBuJmXIbjfmApOoKbvvtiCnuQgJdWT+gw
         nahL8hue4fZ2+tL+qf2JsCi3SYB0XatP6GQ+M34RPjP5uKoJTMJJCZSgYazL/y+o4H3b
         HbgQ+qqILcz6UuWnPUo8qw6TTZwSTz8jPAIgtXwprC9bjO6QQU4ltt30+VaoKMzJAK9l
         1DX0wFg6UrAEcwVowpVB53Ii69JR3i/WqYDKT/nqtt20LDN5hzIQdRqqi0+4b6Jj/maI
         jYoNbCUDoCa3g4PSPGTdfIPGzakU7CDM4Jq5X70RFzFXn8qfq3A6OaBqi2LgXoiq4Dn6
         A+TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqXxufn0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u23-20020a170906109700b009e3b1971a2asor1219090eju.5.2023.11.13.07.22.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:22:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqXxufn0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888921; x=1700493721; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24ML07HsEvOYl+DuxzoZlUZnhAFy4fscEFWSzx7VWys=;
        b=dqXxufn09MLnTDZGfFZOCQouQO9rfqalb3uO14kbH87YT4GIZRAnbtjYh6dtW8qd3M
         AGE70Dn5T5sANX+UysEZZBMNC6EZB9Bebh0iJxxDrBjnSt/JeDqaUkzyAfZhnE09QxB/
         acRaNy90J69nSAsmdNwfS2Jx1Mr7dHD7aa/ItCD2fx5rxJ2tgcRA3Pqh0sxquWt8PpDq
         JRFuZskoBhAMQtrU3mNwwiAcsZ6vvL2l2rYo5uhRtEFt9Rmt/FXIphdGfMR5Yez79Wa+
         8KQftxPHSju/ZFi6nqoBZylFQfLLrOZ05j29j4h1GIn2COwAfLSn7mokHK+ABMZOMtHa
         iMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888921; x=1700493721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24ML07HsEvOYl+DuxzoZlUZnhAFy4fscEFWSzx7VWys=;
        b=J2hxV/06a/jUODUwqrpk6KBVOt/11Glfgyr4+Sah94hALGB7C5bhP4QeYfbLiWtmQV
         5nVxOMtDSA4iXxmbaJMkakr/NhPIWxlxVO13MzqKKMY1sMDXvu3GUGy2zd6c//O03GpA
         ApqdSLl/qmrRLLG4V6jEc8CXi47AXetKfY9I4TtAki2zC1Rm0htU+ad4Dn0jhoLb1rju
         YkNnZd9/dlvvYgLdGy9puol7OBA/6/8y8X6jouWiFofq+C0mddaP2vi4XIb+/GOT91h4
         mld+GZun9NV4PtMJdXL9fzpIbEvJ9vFn8yAZprtRhkXnX+ajuqoYNWyeYssZUAOLVI8u
         OiXw==
X-Gm-Message-State: AOJu0Yz39a1MwhIwdPA4MOQfXp9BpEVe4wTpusgp0sPijYTyNm/RmwEa
	PagCk4fSt0jI8U/xu5OCVmwoMfnE7aisXbBN05YysQ==
X-Google-Smtp-Source: AGHT+IH+PnzXWjrgKP+WWXsdazo2lewjVqkzA92vUb1Slw8L1D+s00HazVDZsJw73hj51Hyp7Aw3PQ==
X-Received: by 2002:a17:906:5fc6:b0:9e6:5132:43e5 with SMTP id k6-20020a1709065fc600b009e6513243e5mr4860965ejv.16.1699888921215;
        Mon, 13 Nov 2023 07:22:01 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id s10-20020a1709066c8a00b009dbe08bc793sm4269124ejr.18.2023.11.13.07.21.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:22:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 07/10] sysemu/xen-mapcache: Check Xen availability with CONFIG_XEN_IS_POSSIBLE
Date: Mon, 13 Nov 2023 16:21:10 +0100
Message-ID: <20231113152114.47916-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lJIdX4VEl8z2

"sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
version of CONFIG_XEN. Use it in order to use "sysemu/xen-mapcache.h"
in target-agnostic files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/xen-mapcache.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index c8e7c2f6cf..10c2e3082a 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -10,10 +10,11 @@
 #define XEN_MAPCACHE_H
 
 #include "exec/cpu-common.h"
+#include "sysemu/xen.h"
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
-#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_IS_POSSIBLE
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-- 
2.41.0

Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408023ejc;
        Mon, 13 Nov 2023 07:21:24 -0800 (PST)
X-Received: by 2002:a17:906:2416:b0:9be:21dc:8a9a with SMTP id z22-20020a170906241600b009be21dc8a9amr5297261eja.39.1699888884276;
        Mon, 13 Nov 2023 07:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888884; cv=none;
        d=google.com; s=arc-20160816;
        b=XtHsrtgw2rlWBPiT+x98GTnxNvEqBbQfD1qypFQFpfOxK9eXPOMjK9wC5hDYFnLINd
         oSxSoepK/jud0hLz3ZMjF7UvjA2b/qJSPRUnSOJRPczo5stoyFG2YujTMi2v+CKOOl/u
         aEGqpBhV3iQIvwPNhDP+ys2SkWHmyufu+Yc+ee1CeiSi1B6roP80jKtuZhu8WaMTCkg5
         PVS40aX8Rtn+mVFFnqgg359bTmGcdYVxdj8cwYft2KJt7cecGifQQw5TShmRbAELKz2e
         uk1rQIVIvIWjXnSGg6oXzthBreQWRV/xWy0QZgPg3Iod8IMYfiOMf0Braqs73CB46oZB
         zRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R0n+efnCwqYZSgvX5xA6BN1n520F2bZNMKVl3gVhASA=;
        fh=E0jvqUTVnbyPitMGLtsCjS/srUbMS2WTNKk9XEDC2rY=;
        b=oCyaUA3vmC5y3fr8sv594SzKIx1665zunwkPg58116cR7/bz6HGGAsYng6sen9KbZV
         lUMpcB/6MuOUCWSjWz6cP2R4v3GgVcawd0wUgiKJIX70mlcXKaK5bVznvV0Qto7UsJWf
         +7hJ0+mQ/YZDGn9NyxJQsI5BFBjlPU9Ap5Nscr6Vl4pOhQhYZ9F+tChumXhx9oz+YRp7
         l9nIzo/SMXupYELLHAqkMDsahh3nRkc8cHxkClRPaWpCFeD8n9y3Plx36T8RTCYnhcPi
         TB4rYhJa861UzAD0NlDCa/mIe0ZaUJzqXPNNWQE/jV/1dI2xkTpBxWqpumfwR0q3n5lS
         v0wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Nm/b7wvt";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j12-20020a170906104c00b009e42aa0e87bsor1220957ejj.18.2023.11.13.07.21.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Nm/b7wvt";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888884; x=1700493684; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0n+efnCwqYZSgvX5xA6BN1n520F2bZNMKVl3gVhASA=;
        b=Nm/b7wvtv5/WBRd5Te2goF4uIBD7VnGH7Kc40PMCKN3OnMI0bw66GXGmwD38Pac+Fw
         BwJHn+XFK4bX1E+IvsyaHQbcaN2aMkQmIN3D0IsMiQjv7uTRG9fCELWPnY8uCPngMezk
         hGFTUbzm7IgTpb9zQW9bvnkfsA8u1B3ueyF2jdoPFNezxI3iRRpjb++aHyVgha+0MQOb
         ksXh5/wfs3+WHmNzbV257fidSY3QrbPRhb/MdH1O25BcyWC+eoBwtcDZza3n5i+B2dL7
         9fppe7xwkDfAjNmj0ok8iqGeex0ZvbaYzp/e18ku4r03uI8Ftf0wecqi0cpv8bRkuTe/
         H82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888884; x=1700493684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0n+efnCwqYZSgvX5xA6BN1n520F2bZNMKVl3gVhASA=;
        b=wSIPPuiDjf0FmNOyj8sGZtmGnIZwCVguvcsg+9iCqBfhqK3IlZOV0Qjb/zVdXUnxkL
         33lIql6dV++g0AQQfuMPViJysChQjuQ9jwRvB/OobEcs4+CA+P7MkZPhxonX65orOOf/
         Ok2Lcc77mxOcJrzu4dH1RxkV9GoxUh64AXnaZN9xMrNApFE4TrG7fRnhhDhOqDkHaXHr
         rzIFx6rmcQcbuaYoTO9wZx6Ku0lddLUbzmj3oTqfOF3pG47p1wLblfBtnyHPK2qXCyvv
         wdHqBpDgpjr7lk4x9TA9pNJrEmfEsDkT7/tm2mX6KnZ+3VVSKmbC0xe0K6yTWQuxXzRB
         Ji7A==
X-Gm-Message-State: AOJu0YzYwJQoOGWEDgP7QTckZ6Vy2GCk/7g6KJgjTzVOrkNrMGkWIqD5
	1ZpTCdpPMXePOXY2v/NCBFAFHNB3
X-Google-Smtp-Source: AGHT+IH6xxb8oSsdvX/Qxe7SX73ROr6di4a0tnTAF45WIy9EC8KmTSkElWDjJsGSvtz6GSstCFLdyw==
X-Received: by 2002:a17:906:4c84:b0:9cb:5a8a:b19d with SMTP id q4-20020a1709064c8400b009cb5a8ab19dmr4350360eju.5.1699888883852;
        Mon, 13 Nov 2023 07:21:23 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id dx15-20020a170906a84f00b009adcb6c0f0esm4204593ejb.193.2023.11.13.07.21.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:23 -0800 (PST)
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
Subject: [PATCH-for-9.0 01/10] sysemu/xen: Forbid using Xen headers in user emulation
Date: Mon, 13 Nov 2023 16:21:04 +0100
Message-ID: <20231113152114.47916-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WpL8kssQ3O+3

Xen is a system specific accelerator, it makes no sense
to include its headers in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

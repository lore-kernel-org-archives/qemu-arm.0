Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082513ejc;
        Tue, 14 Nov 2023 06:38:41 -0800 (PST)
X-Received: by 2002:a17:906:4e08:b0:9dd:cc3d:7ba7 with SMTP id z8-20020a1709064e0800b009ddcc3d7ba7mr6766517eju.29.1699972720772;
        Tue, 14 Nov 2023 06:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972720; cv=none;
        d=google.com; s=arc-20160816;
        b=rXbLL9U5QYlcK7blLQagPvWgksAwQZzjfvvYd8vdemjRh6NKyBh55Y3CgqQkgmrSkO
         zDzvTNGgllD858ZIG0uBe1PL1XR/3Jxc2ndUDiW++gCXVOMA5Uj+TLcDTpjQK4xkBxoM
         xvnc4t9uzdZr01oOB25g5qhrvyo4WxFmNeqNSaRoH3yfEr4sshH1cORAeAxITSISv/Fh
         nYQkwMG3AQ1d0iI5ueH9Wsp01uiiV0B2S4z/gryTYp8zusBRekLoV2nL/idOfr/32UJz
         rCLZ5pIgMc03qDnya9zuISPq+mBWs7JpZ6Bdm8IivhX2UBCsG3xuJcWEvJF8G0SJKTzV
         BgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kBdIXHGvx5/0R2xC8Q+GilhuZtCQOtnJ9hpGFyppJEE=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=ACawW5EFbFLjEMwU7rh4jf+nmuAEniYJ6aj//GbNCjQ4bTjfdEAHmvRHS3PZKnfDpe
         UBH8Vc5ZU20BD6ZksaEyl32ZYt0EiSr6j1RMa8XuAx8AC7rI+L8jCLxv1pu2ojCBceO7
         Ap3e4iHllN9pGt8iWcx8raEZyeeJ4hZFLhe7rytIUsJfIORC1nG5XR8XfaheF0mnpOSw
         6m+kFtJrbSJxhw+X1zfkwqMj5BCEo3eJHAUMr1bA0iTA2e6axxGgvQJCCanZDX9iS4uC
         G0v52DeHbghGMBl/IOE98YmtDFIlptf/xTtpdo3jSDWDa1+jZsz0pGQBZGQ9Xckt1fnZ
         yC0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2F7Ewuy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m38-20020a17090659a600b009ae61969480sor364715ejs.12.2023.11.14.06.38.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2F7Ewuy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972720; x=1700577520; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBdIXHGvx5/0R2xC8Q+GilhuZtCQOtnJ9hpGFyppJEE=;
        b=u2F7EwuyLeJPnFeDkYtHlJ3bcswE4tsAPUCAiWilJxDFxjiRTxO1RfpiApBL//bgZC
         2JrpFdxHH0rAznFGDWOyf0Q4MM/KwTWIIIOYvDXRfFPHkUwfddb6UhDyGJxxnjb7XTmF
         yRerN9E2fI1hI0XaWrR7LQzSL4t85MsJ5ngVj8n7y91IGEiGDfV2m07YyHfcKa7OPjS2
         ttI7D5Vw4ltUukDKV4z5oSAChwm+GeH7syZ84WzFLGKbY0M1BJRnQJvfhR4+UzpBohy3
         cA4s5UKopMfAC0R0E7lN1E+7LGjtOhLjwCRmWSISOc7DMFhfrNVMP0PGTuHJWKyrM0o0
         MYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972720; x=1700577520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBdIXHGvx5/0R2xC8Q+GilhuZtCQOtnJ9hpGFyppJEE=;
        b=CgOsyVUs2K4GnezUVMdbBQZXFQSEjPWqCWAQCQKquSztiW5i1NcjNT6lQjgCHVMAAA
         qTl+Bsz69zvBshnBqunGVnpmF80FzBbz+xQ4Mq16li/CIjqZbscIiJ/AspuYNreKBT6n
         AI4GIs3teIqQXtZUMju+36BHZalPUaoxKu612ksRuIt0MsdpHy1ywEHOBY5+AfarzLSK
         HFljmztGkM8EJqyTEwXMz2A8qWh6VTfSUFUxJmgeVaJWuCq9dnvN5AYXIIbMIfycvOW8
         YrMpHmcl088aJowc3OBQI18kmd/eyIGnShRTow/YqkOUcwXfPd/ZSBBS/3CbJ3gKRAzm
         yCXQ==
X-Gm-Message-State: AOJu0YxYBf8ztJKZ1SkfLNOrsjbSMGggH/ptT4gT/6k3t140i4sByg+f
	M+5Cf/pxF6rP7Qz19rg5IWL0w7OB
X-Google-Smtp-Source: AGHT+IFii/vTCRNAFXoxhgp7tKdZ5NzaA4D0hMTO7kCC4hnZ5p3PauJ+Zda1OHH5OQndb4HCu48Kbw==
X-Received: by 2002:a17:906:6b97:b0:9d2:e2f6:45b2 with SMTP id l23-20020a1709066b9700b009d2e2f645b2mr7411114ejr.71.1699972720502;
        Tue, 14 Nov 2023 06:38:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id j2-20020a170906094200b009ad7fc17b2asm5613097ejd.224.2023.11.14.06.38.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:38:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 03/19] sysemu/xen-mapcache: Check Xen availability with CONFIG_XEN_IS_POSSIBLE
Date: Tue, 14 Nov 2023 15:37:59 +0100
Message-ID: <20231114143816.71079-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +IHfbb8ZAToD

"sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
version of CONFIG_XEN accelerator.
Use it in order to use "sysemu/xen-mapcache.h" in target-agnostic files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
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

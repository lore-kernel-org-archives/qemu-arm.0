Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3157663lfb;
        Mon, 18 May 2020 08:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcDpJFF6fQ7MgxYsl0evSoaP53AxIj+14qtx6pjhu5Yxj1FUIyPzQguAiP7LEmCW6NBThL
X-Received: by 2002:a17:906:da0c:: with SMTP id fi12mr15022849ejb.254.1589817201684;
        Mon, 18 May 2020 08:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589817201; cv=none;
        d=google.com; s=arc-20160816;
        b=m7baSRRvp2wRG187oERDXn7Y6K7Y0ILKfBt9jEDTmuIm2A7Ul7pzbCBBHVDzipvEjF
         OwpwL5kxjYr88OeInT3HFjnq1lHNtssA5xv5fLNIB6sSYnMJqsCNrZMH8ENHyG8yS7b+
         9SF5UwdAYnSXWpzG/rf+amoXN8hkZTc4tDWifJfchocwghZRg95m7SAEqZSM0gLNQsWw
         KGQwxzPOfDgUYSGgZ5CEDg4WLHIaMuWpVXNjt7sUT5HhD9T5850eslkCou5HL6h/aWvp
         uMHMyY/b3aaR5z6FGGJWZVHOOvagAH1Khzie4bmOuN/EsPgtDgxgQ8pRDlLQ6JbpnMM8
         8hqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=AnPjL1oCKd4/b0PMNN6nSj2GzQNIyIXoJD4PkkEccRM=;
        b=Xg/5mM6ZfMSiof7718gpYf/me/9bcTR3Tf+5MZ7Bi0jygJ5napRIJBboewtdMYZTvz
         vFOeew2QQbmWcKmYkunhezSOVCOowWHbX+YnEZlHLcQ47WGm2cRmA7Rb471xOuUqaZQx
         qOCQfLxjoe58fN4RyXoQjoR9pRiu3zu0KKHBzV0SSd/+PbtM8nU/FuUOyWDx57CGCr4n
         VM/xWxNvqytgV6BZrHqBgEe5crzwp+gMw2/vvgGt31sU79SK1BxOClA/z4Dk5p/j6o/a
         OfsV7D4BX5L+vwESGCNWR6L29AwTHKcJmlOOzUkhSSWuG0xE6xYjZOWYoi0EwduQ/1cW
         827w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Flh1kB0g;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id do11si8281395ejc.450.2020.05.18.08.53.21;
        Mon, 18 May 2020 08:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Flh1kB0g;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgERPxU (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 18 May 2020 11:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgERPxS (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 18 May 2020 11:53:18 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841D3C05BD09
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 08:53:18 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z4so27452wmi.2
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AnPjL1oCKd4/b0PMNN6nSj2GzQNIyIXoJD4PkkEccRM=;
        b=Flh1kB0guv4yAbKeDYrp5crvlMR5ihhTkgC4sUeRwuaqgo7GD0MKjJWTUa6Hw2L8xS
         CIsyCqO5AvcZ8OwqPdLT8OmZa/ij6U5deh3S8uaWtf/VidtkoeX+VHIABeeardCArTHX
         XNSnRdTy+EpyBchdo7vAMIvPG9o1VFjX+MkOHh1KL+C8pX1vZ0yVTp7rYBokW9sBGV7p
         uaLB7O6eaQG+1utdhsPZlItO485bABIknYR8tYuO+twhZvT1wOLhGP6aF/ija6iTfvyZ
         QkiXHLZ+FGIYWRNLOIOko72PY6W/2aVr6hJAQD/zFfc6NyNFkhqADfHmd5GIQxeXeG49
         +otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=AnPjL1oCKd4/b0PMNN6nSj2GzQNIyIXoJD4PkkEccRM=;
        b=BG5RaTet72lIkDFxtuVH9WQA0WJ+1pEuMpgYFRzHyxYbp2FxJINZVcy/X0P1mCWSiT
         Z0JescQusG+wzAOKfTUUdSu7RS4/EphvpIn+JxxeY9RbKdYA/mxz/cWEjltCfRBnG2Sj
         LgcOvhjWcjc/qXYaULPOErjth0qfK8z6VCUPwdv6tx4IWemQLcEyUTy5aC4//1XtWnKM
         5SkbQWYFXJ204udx8h04k8CAcVOjaw2Ydk40pixXinjfP/tGHvZWJxrOT8M+wLWiYoqC
         P0+GQh31oWbkZoOeX6UEDa1o+R3kF1d5M3l0ISI4rcNmIq5Q9oqKeF87/6gsgKv4MN8d
         j4tg==
X-Gm-Message-State: AOAM532qu3bDthAzZfvOhUpDJlqvlvlo1T9vhKkeVsEw86TPGDIrr/oC
        dyhtVjbIovUvyW40ErQqyr8=
X-Received: by 2002:a1c:3187:: with SMTP id x129mr24994wmx.27.1589817196118;
        Mon, 18 May 2020 08:53:16 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id 7sm17647462wra.50.2020.05.18.08.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 08:53:15 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 5/7] hw/arm/boot: Abort if set_kernel_args() fails
Date:   Mon, 18 May 2020 17:53:06 +0200
Message-Id: <20200518155308.15851-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518155308.15851-1-f4bug@amsat.org>
References: <20200518155308.15851-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: FoKs+s65+FkI

If a address_space_write() fails while calling
set_kernel_args(), the guest kernel will boot
using crap data. Avoid that by aborting if this
ever occurs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/boot.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index fef4072db1..7cc271034c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -291,7 +291,8 @@ static inline bool have_dtb(const struct arm_boot_info *info)
 
 #define WRITE_WORD(p, value) do { \
     address_space_stl_notdirty(as, p, value, \
-                               MEMTXATTRS_UNSPECIFIED, NULL);  \
+                               MEMTXATTRS_UNSPECIFIED, &result); \
+    assert(result == MEMTX_OK); \
     p += 4;                       \
 } while (0)
 
@@ -300,6 +301,7 @@ static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
     int initrd_size = info->initrd_size;
     hwaddr base = info->loader_start;
     hwaddr p;
+    MemTxResult result;
 
     p = base + KERNEL_ARGS_ADDR;
     /* ATAG_CORE */
@@ -326,8 +328,9 @@ static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
         int cmdline_size;
 
         cmdline_size = strlen(info->kernel_cmdline);
-        address_space_write(as, p + 8, MEMTXATTRS_UNSPECIFIED,
-                            info->kernel_cmdline, cmdline_size + 1);
+        result = address_space_write(as, p + 8, MEMTXATTRS_UNSPECIFIED,
+                                     info->kernel_cmdline, cmdline_size + 1);
+        assert(result == MEMTX_OK);
         cmdline_size = (cmdline_size >> 2) + 1;
         WRITE_WORD(p, cmdline_size + 2);
         WRITE_WORD(p, 0x54410009);
@@ -341,8 +344,9 @@ static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
         atag_board_len = (info->atag_board(info, atag_board_buf) + 3) & ~3;
         WRITE_WORD(p, (atag_board_len + 8) >> 2);
         WRITE_WORD(p, 0x414f4d50);
-        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
-                            atag_board_buf, atag_board_len);
+        result = address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                                     atag_board_buf, atag_board_len);
+        assert(result == MEMTX_OK);
         p += atag_board_len;
     }
     /* ATAG_END */
@@ -357,6 +361,7 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
     const char *s;
     int initrd_size = info->initrd_size;
     hwaddr base = info->loader_start;
+    MemTxResult result;
 
     /* see linux/include/asm-arm/setup.h */
     p = base + KERNEL_ARGS_ADDR;
@@ -419,7 +424,9 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
     }
     s = info->kernel_cmdline;
     if (s) {
-        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED, s, strlen(s) + 1);
+        result = address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                                     s, strlen(s) + 1);
+        assert(result == MEMTX_OK);
     } else {
         WRITE_WORD(p, 0);
     }
-- 
2.21.3

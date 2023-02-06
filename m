Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4230886ejb;
        Mon, 6 Feb 2023 06:12:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9mA4VsWV61p6QVqxxYKOIAmEgHARrX7uQh8r8wWl88pUBnr31hxl9btNj4pZOFPW7pTPmr
X-Received: by 2002:ac8:5886:0:b0:3ba:1348:16da with SMTP id t6-20020ac85886000000b003ba134816damr13125049qta.59.1675692756805;
        Mon, 06 Feb 2023 06:12:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675692756; cv=none;
        d=google.com; s=arc-20160816;
        b=k4DYCAx7Yo0MnkVX/vGp7VMDDwBDdNJTYUroDIEgk7tA7HONCL1YkeD0eKB0GZ/Hdh
         5HFoE3q0pR7n+Qp5m2ncu0ndHwue3QTatVfB4S3ZcfUfouqwa3xF0JJVLSMkMGrk2EQ1
         2GMPrTAR9cYkLJmgYUHj3PD9UKJZBrv+1Z8X0U4jFE7UTCVVEf8BiVpnjLBuyHdKXXDl
         fY5YZsfcSAshVqMOiWVVTX8zwNBZBVxb9JKLru8VJBTRb+y4BTpjHcINESO4PCScrYcX
         kxSmyp/ewjyvunS0JnK+Lzp4VRVaQUR4GzsCGYN6Cbg7KTid8MVtJmKtx7Lh4+uRp+9r
         6dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=Lp4o1O8f765MbOnRuP5UY6glSkqkwGjbVkLqSoECOQI=;
        b=oEflknPv1GzG3kv5qqbSDrQwkeWig8VtseSX6/70QcSZWQEfPKWsnBaHST3wjUBbyr
         hwvT3mnZtW60gJB+XbsT59aYGs0ZQmRC0YvKI+xY+8fJDEaJuSPM8psRQ1qJgQ+KJbbN
         sYL1Z3DuPOECk02hpa67ObEyFb1V0k8y4O3iADT/rNUXyDvLiIf6rrHz60xqL+Pf1pEe
         AswZdhW7JvIulYxYwDWVJAwsfTNqMslP6k2UlXi4acgEtnZw/bHK4uA2jc7wPa9pmtGN
         L9Td3GENg0t0LnY8D7f0y0Ter2qZpSC/ytn5+bBjhjEMrp06Kxj2hdWoQXstzhiUPdB8
         GKCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ppeVkGJL;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v128-20020a372f86000000b00733e2e55dcdsi1653494qkh.594.2023.02.06.06.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ppeVkGJL;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Cw-000695-9h; Mon, 06 Feb 2023 09:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cj-00066c-Uv; Mon, 06 Feb 2023 09:10:46 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ci-0002gG-FA; Mon, 06 Feb 2023 09:10:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD85233CF9;
 Mon,  6 Feb 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp4o1O8f765MbOnRuP5UY6glSkqkwGjbVkLqSoECOQI=;
 b=ppeVkGJLN7wTtutOd6i4/98cAPqW4C6ImEaBa2ZbVdeZ2UPmgIUoWOaHmfjLL2xG3pOziN
 GKySULC2Yb8O5hs4fFtfoIUfHny0TKQqf3QvRkoa82+0WGF5f/Fv231+Mg8/RbTO8DTN6t
 HIgbK3FxOQis/cMdvJOvuX9tz6hyZx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp4o1O8f765MbOnRuP5UY6glSkqkwGjbVkLqSoECOQI=;
 b=teOz5c/9zyHdz0sN8mxrayyQ5mhXqNrd5YPx5iJtNR5z8RbErNhqDFEFaaX+QJ0StZVz39
 iAFaUKxzuoQvqoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72C04138E7;
 Mon,  6 Feb 2023 14:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IDu+DmEK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 07/10] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
Date: Mon,  6 Feb 2023 11:08:06 -0300
Message-Id: <20230206140809.26028-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Fa/3VFE2nnfK

This machine hardcodes initialization of the USB device, so select the
corresponding Kconfig. It is not enough to have it as "default y if
XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
disables the default selection resulting in:

$ ./qemu-system-aarch64 -M xlnx-zcu102
qemu-system-aarch64: missing object type 'usb_dwc3'
Aborted (core dumped)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 296d4f5176..552e3d04ee 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -405,6 +405,7 @@ config XLNX_VERSAL
     select OR_IRQ
     select XLNX_BBRAM
     select XLNX_EFUSE_VERSAL
+    select XLNX_USB_SUBSYS
 
 config NPCM7XX
     bool
-- 
2.35.3


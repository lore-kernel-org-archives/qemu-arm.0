Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp367979ejc;
        Sat, 9 Mar 2024 11:23:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVh6RpM5NNMPl9VJNwZ4GVL0ioxcgmVDbTHosKxp95BSAp9WA/a4BbZn3kviNKtQsoDN12PNeWXV2UIyKVPfr2FdQpNGMuc
X-Google-Smtp-Source: AGHT+IH7xCHpwaltfvvd8r1IeT6GXXHjRFOlaalwXaQVKaaveAANAbHt4cB7rQIJakYXwlx+M8+f
X-Received: by 2002:a05:622a:1715:b0:42e:ecca:c8ee with SMTP id h21-20020a05622a171500b0042eeccac8eemr3929692qtk.16.1710012232518;
        Sat, 09 Mar 2024 11:23:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012232; cv=none;
        d=google.com; s=arc-20160816;
        b=eHG5aE9kKnDtSF/zSrrgs0hFDH+ft/3MbvJXUme813qDDUt7OoCnammqYO5E9u1YOa
         jmxtC8rS5J9m/PqiM5owyYCyCj62Alys0fn9ztw6IiSJGVpfEcX/UwUve+/0QyhpYRUg
         royko37sONQY/7ZVx88flOcgWGN8vYPJkYFRtWvQ+72mmjFCDA4CVtIJW0soD7hPbtSY
         njgt911jHwzio1OIurhNG+Nt9n4MdUf0e/7QUlyxqfG6IWtRApN3Pl4h886H/D3nOxV0
         MRNbnygHfezeae929JNLFbiS3pj5VqP/5QZerBser3euXAcRrkuUXXYUwI44hCUtw/Xb
         xs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=9jsjeEWjsUkRHeCpOh+pko9UBxzZs1OaWzN0fIY08/s=;
        fh=02CHeA/yMhB6UJb154Z5TXMf4mJ/8eSXAAyDn05GEXI=;
        b=FKsJlTZOTc2wMHgvrSurM64R1Yz7BK8z2rFVVekOSmq9pCb7n1ZXSOJZFlpwboAGiC
         sFedqGdhppXe36oaYCnMsChvmbnjCgfCgD+/orgpmXcrKkmIqIlGliYOM+Tm+RSxc7Kq
         wPiuAie7OLRzM/YC/uMj5zpGfWGq+YnRe2SsL40DVFuK9kpGCYHs3A00n6XkrB9whPSi
         O1WW9WUWt7avQVp2QVYXCsGSHdID1wPCJxyV2/tNl/f0ezmeeRHivtgrWWmZf0/YXCFY
         sTfueoUV5VkxzU+H6d827et+hlvBP9qjMs0ilrLiO90FT2PRhA3OyF/v1JnnM7tKGtZi
         gSxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbFeCqtc;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id w11-20020ac87e8b000000b0042efb9e64dbsi2192211qtj.222.2024.03.09.11.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:23:52 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbFeCqtc;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.690973.1076705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hn-0002BR-6Q; Sat, 09 Mar 2024 19:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690973.1076705; Sat, 09 Mar 2024 19:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hn-0002BK-3K; Sat, 09 Mar 2024 19:23:11 +0000
Received: by outflank-mailman (input) for mailman id 690973;
 Sat, 09 Mar 2024 19:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2Hl-0001PG-Ih
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:09 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7663cc5e-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:09 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so27055951fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:09 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 fg3-20020a056402548300b005656bbb5b3fsm1153256edb.63.2024.03.09.11.23.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:08 -0800 (PST)
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
X-Inumbo-ID: 7663cc5e-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012189; x=1710616989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jsjeEWjsUkRHeCpOh+pko9UBxzZs1OaWzN0fIY08/s=;
        b=kbFeCqtcxyu0ZMoPR+81vtw2gCiXdwtkkXHsZzeNQfQEPGLzFwf/LZo9US35DRqPi9
         JbEoUIWP087d8hLPW7k44KNXjZyvT01OHjdrulF4fybUEOJMmc/CfmQ8yYvvisOazcgB
         w9jjQBbeY4rl7epZ9gGoY7eXW7IQya1GX6Mrs8S/8pgHWVh/X3mUmrIUXv6T/a+lMGsy
         rgdcZ2KrTBWS9i8T6ByiCAXFX2eO7tCWO6Nh5uY2+4RRW1GRXqG0YE13kjp0J5RqIApD
         kv9CqtNIahDBdaceKpZRbn+0LbJX1rs8QWlkduoLuGe3SXMWIGX39Q9YtKfo+AYIdXQ5
         DMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012189; x=1710616989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jsjeEWjsUkRHeCpOh+pko9UBxzZs1OaWzN0fIY08/s=;
        b=O2T7JIMRJ66WLMyNTih1ZIB7A19BwTmODmD4ecSbYejcxD7OHERIsVcHFEC460dTiP
         F5fn6S6oxUnHkskPrSyxcWcAesz9WHCXyS8wsyBm9r13wGPSzVJ0ighJ+YwccMMjnEJZ
         wFLX7beuAkLqeEC5bd46gauYs586pqqptYAvHbc9SlmcXjwNCjT4L52icN+bJaposCwA
         namym6zBrezQ1x0BY/tmmg9FxM472EuzhGwAWgHyH4aOQ6bAaPESr7D0dzKcc7CrS9Kk
         HHFtW9XO5K/+mgP5ed4gAGWageQQCGsE4v5VBRscszT0UnCuY4/j704EiEp7vh6pmnBO
         JHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/90gRVbTQvoQ3JSErjilhFs79tm0+Rlo5i1itc55bJ+pFrBNwPiXA6wqWBpz8PRhHriifPPtGpnmsdbfPzQtJpTho5iQftFF50M9ywM=
X-Gm-Message-State: AOJu0Yzs7cMbCFh5+rb+nbu8SBvYIEXRaU83usxcUX8eFt8MES8nQlxX
	Fc2YtMzEkeCIljbbY5kvjfmxlopeQodnYC5VifSZIDlMBwX8MfurKQciXhzJsWk=
X-Received: by 2002:a05:651c:61f:b0:2d4:22b6:e6a4 with SMTP id k31-20020a05651c061f00b002d422b6e6a4mr1215415lje.30.1710012188800;
        Sat, 09 Mar 2024 11:23:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 09/43] hw/xen/xen_pt: Add missing license
Date: Sat,  9 Mar 2024 20:21:36 +0100
Message-ID: <20240309192213.23420-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Qb8RtpM/lZrN

Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
introduced both xen_pt.[ch], but only added the license to
xen_pt.c. Use the same license for xen_pt.h.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-17-philmd@linaro.org>
---
 hw/xen/xen_pt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 31bcfdf705..d3180bb134 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -1,3 +1,13 @@
+/*
+ * Copyright (c) 2007, Neocleus Corporation.
+ * Copyright (c) 2007, Intel Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Alex Novik <alex@neocleus.com>
+ * Allen Kay <allen.m.kay@intel.com>
+ * Guy Zana <guy@neocleus.com>
+ */
 #ifndef XEN_PT_H
 #define XEN_PT_H
 
-- 
2.41.0


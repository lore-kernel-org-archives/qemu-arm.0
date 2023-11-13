Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408506ejc;
        Mon, 13 Nov 2023 07:22:08 -0800 (PST)
X-Received: by 2002:a05:6512:220a:b0:507:ce2f:8f0c with SMTP id h10-20020a056512220a00b00507ce2f8f0cmr5009638lfu.35.1699888927683;
        Mon, 13 Nov 2023 07:22:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888927; cv=none;
        d=google.com; s=arc-20160816;
        b=YktOp4bfWoz3km7bJUh+iv6GIe7LI5asktKSLn9UxHVINgIpKgWApqmwSU4MYtsBTG
         jGXaUb42qt5f18bMIkcRL2OVc5JQGOQjs/YmDbNmsyOV1jMW24SsgpiX+G+JLcpxfstM
         361njILkUnz3fMpIOiCCOo+a3U9AOfyaqwH0q+OUroWgrSitRa1Ck0Ws7I8xu80Wg4lu
         1UIW3HVbHexFKM+fliragdhwz6zmcDZuZDIPJHkNObMkTt9m439rBSE5x06nzgfio/yG
         oUMU3eWq+q9iqlncwU136QoauuF+aASoSdURAKR8VyT23YTGxoT04wz0jMN1Uu8ZXP2F
         z+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M3IanRET4oRDB/554uZaBMmk8ZcCL79rxTcGgU2jVuI=;
        fh=GiBYw8tXOCcndxW9R737jZrIBncGjjApaby5duidRsc=;
        b=MZsFQf6Cv7Zk82ttOpdG29xCr8j/GvaApOzJWoYgdeMu0Gji0GvqV7JQcne0iFtO39
         K8RoACPhHkCONyatXtAyUVVHyWD+Ascoso46MtHjT109PFPO8uaBBKO/5yrHmj0Pl3qE
         39vI7YfCqMwQmFcgaPH1BjZOU0UFfpIGt2ztpi3GRO0ytY/vkVclw10lHhK3HUMmdkTn
         O72xaxSx9ylmMmwlCqBDvjveS5k3q57m68iC8XJo4Oerz2jR02vUJdfA5EV4W6Gnbgw7
         7WZSFChAW32kIofLB5bDAWRejtwfcuzo5/2BfOr7xXyobpURuCn+A6nf28pI1WrFQYvx
         v1KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L59biPg3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4-20020a199144000000b005079a131fd3sor1083725lfj.21.2023.11.13.07.22.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:22:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L59biPg3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888927; x=1700493727; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3IanRET4oRDB/554uZaBMmk8ZcCL79rxTcGgU2jVuI=;
        b=L59biPg3u7faSyh++zI1VcXmzNWYv3fo/LI7SBzqeh/IuaTvGGpegrtXlxCHdqCQPN
         bOvqLFBIxeDPFEDLaN87+VHCDZpvVyXnmTib1ozq7Fh++6Wse9rnSzLY7kgq3Hv2oUBf
         lnboqCyfhc6fBg2e7z4OA61Aal8uu/dcOKZV7+WhgJZto8zmsgUzzUQkj43pC8akmeQB
         K0xkRiRdxhUCeB/cLyi36DROAulqRAIlBGInxoI9ms2ifOOAEFhP0S4JkkTIEdbpv+bM
         EnhGqr75SNdlgWhTLL4c60kvaCYgSnx2MRjrIwsZVGY0oY69Si/ZAP0HmxX2uCIFGyiy
         lFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888927; x=1700493727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3IanRET4oRDB/554uZaBMmk8ZcCL79rxTcGgU2jVuI=;
        b=aEAGFRwOAo+HJzcDlGS6pVBv6jqtwYH+M2fKkdfvAjiJ0JK9Q5qRcpKJeJkWzhtgcz
         i6e5PwymI76iLWMGvFIjcwrJDn3zX6LzKcKDS0d/BiEsESpOZNEO6PPEToB6v35ww+MY
         prnT6GYeowuBoH/+19UvYr7RAW9k4XlRQ3L4hfSPhyjOnByqFRjvzbLWGGsbIH9/hxSb
         ACRUiPt/6uptDXZ9wwpz9Jgv5cVGJqS1LARbYHni9TQ5TwKFvm1xJqaFLrntKmtIWQ/H
         60kqXlhqvPGoTpw0KfLk/fClWS9fich3y6oX8VfWZDdqHieNTVTe91s5hgGGvPBQvMSq
         jLVA==
X-Gm-Message-State: AOJu0YyuXsvxpjm3mvLSDaaZSfirH+gcXkIqneQMGcc8334MycYYnATP
	o64M0dqBpbcohIsSpNTBjXJ6sexCNk8pJCtq8xoZ0A==
X-Google-Smtp-Source: AGHT+IGrSDy3wD9q51MX9RzmoZqMhawPjp2jB+lPSAfi/Dv8LmkQCpZSU6Ww+isXzJecNCmpib4vPw==
X-Received: by 2002:ac2:5e6f:0:b0:502:a4f4:ced9 with SMTP id a15-20020ac25e6f000000b00502a4f4ced9mr4406770lfr.62.1699888927362;
        Mon, 13 Nov 2023 07:22:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id a9-20020a17090640c900b009e5ce1acb01sm4126763ejk.103.2023.11.13.07.22.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:22:07 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH-for-9.0 08/10] system/physmem: Only include 'hw/xen/xen.h' when Xen is available
Date: Mon, 13 Nov 2023 16:21:11 +0100
Message-ID: <20231113152114.47916-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bazALolNjjXG

"hw/xen/xen.h" contains declarations for Xen hardware. There is
no point including it when Xen is not available. When Xen is not
available, we have enough with declarations of "sysemu/xen.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/system/physmem.c b/system/physmem.c
index fc2b0fee01..fa667437da 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -35,9 +35,9 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
-#include "hw/xen/xen.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
+#include "sysemu/xen.h"
 #include "sysemu/qtest.h"
 #include "qemu/timer.h"
 #include "qemu/config-file.h"
@@ -51,6 +51,9 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/xen-mapcache.h"
+#ifdef CONFIG_XEN
+#include "hw/xen/xen.h"
+#endif
 #include "trace/trace-root.h"
 
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
-- 
2.41.0

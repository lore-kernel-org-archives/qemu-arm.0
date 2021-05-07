Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451158lfg;
        Fri, 7 May 2021 07:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD3Nz7WzA3pg8+r1AlGizSWm4HZMcG1HfhP1183RA3h7pbmATYI3cQfQiW8LZqhC02MHvf
X-Received: by 2002:aa7:d390:: with SMTP id x16mr11530912edq.172.1620398625115;
        Fri, 07 May 2021 07:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398625; cv=none;
        d=google.com; s=arc-20160816;
        b=y/U8DZetzapCkRsvbdncWtj4qeWLqWugXOuSYA+H/Qcbb8Tv+OtL04KJwY6fV7/VKf
         NOf9Va2P6rI/GW+EyPp4M6+oMZPcTxCdrXPqTOQVr5+Uw4osxX14FCj1C4klU3r5h+QC
         W+Z91vAp8H+lt8K3SSdltl4bIiVxZUpriu+44uwMj2K4X+BBVpYN4PJtRLE1f+ZjB+qN
         bj6PiSVvPrNLbMspwT5Czlw8y5HB/pPhFMsz8qFuBJZi1o5UJEHV4IhRGNlcdN0ZQ5Tl
         J/KJQbGFSgHh6oMIQq1xtAKUNCDtVZPGQwN844a3eT+qEn9TeNZJ9NStLgFGsju6Zidd
         2yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0Q+1JmkmHePwynNhULjY5tlZHv+f3d17hAW4SIJc660=;
        b=onWDCbDRqQ/3Uf74Lza8m8L+W0LVP4K+b7mOrnduaj7UMjnBRSdOFnFNzYOKm1rzEN
         ZLBIUxheF/UntoEMrmEvFOOkjFtblmkxlwhYVvsJ+WS8KVFRJz4pwEVxhS9rIFxJQomo
         CLiDh7kynyrQ+hYlj1Sa4wk1b28YiZU/66/pibkaL2FwPUIpzbBHnOg7MA+XJlQhPGkQ
         +KOJbkPPerG4mM2LXnKIEPwRzArCp5nzkCPSRtsMofcpjERJjvsqpcaKVrxXy0sKld2g
         BHBBB44zfx+/uxfAowNKInS+A27jYXdHs7WM76pVi7Nv29NnAQeDhXwIriGl9L4ASuAo
         wodw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T4RiVvDI;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s24si5300592ejz.169.2021.05.07.07.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T4RiVvDI;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Q+1JmkmHePwynNhULjY5tlZHv+f3d17hAW4SIJc660=;
	b=T4RiVvDIsugnH8QYf7EtaNA6TDsGSgyjnEhDhhIe6sXlCOL/k+zkJwt+Rxhq20rM8PR3ko
	gJyP35CVkwehN5RfafacaQhNg6tR8RPMlXMN+Q4rQIS6C+FAI084drmPNP64PgSnqMJOF4
	EGUA2uQh+U7oPfTuKYux0OTT+uWZGUM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-4rHiT5eON22tT3_fMUKLOA-1; Fri, 07 May 2021 10:43:42 -0400
X-MC-Unique: 4rHiT5eON22tT3_fMUKLOA-1
Received: by mail-wr1-f72.google.com with SMTP id r12-20020adfc10c0000b029010d83323601so3662921wre.22
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Q+1JmkmHePwynNhULjY5tlZHv+f3d17hAW4SIJc660=;
        b=SAzBYPAeJxkm0sAZ++9crcfD0x25Ci+qx8gk8FVde/FsT1mEYvBxa4j0dPr5QhkEaP
         2XLuBojaRWWr7AoSw3Ia0i+wUW/c6igxHu4O0ZddfWUmh4Qan1l35pY0/8qsAws1XuxM
         zkYdHcRrbiJKhN9EnXx5LH2YuD7pQ+mrvwb+UuNG3TyKQjsVG/VqAf0yYSwAetFpNIwC
         tu/Sok+2BP4NKIl7tdNg7pKzj1Ifn/5Ya4tTAU2PjhwraxfOIpm6hloztoqrmZjN4iNE
         ZsdwUQwYlKIbb4tWbU/FH3Lj6OJlGTMf0I04DyZYNmJn6BM3y52et4zCOAKnzltfMPeJ
         4CGA==
X-Gm-Message-State: AOAM532fPnpkJyha5wDO6mPSQUAB0FGvgFoR0PtXiAFHPcmSPy+PGzaC
	ykz5k4XajX6clfIK5W3/rsFwuwe0+AkL3xjXbpOWrnncN04n40pd1dTl6lHJLSUA0kb7873Xpt8
	gMAyjNVb6x8IdLTdB
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr12745249wri.366.1620398621516;
        Fri, 07 May 2021 07:43:41 -0700 (PDT)
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr12745233wri.366.1620398621414;
        Fri, 07 May 2021 07:43:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id i2sm10411140wro.0.2021.05.07.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 05/17] linux-user: Replace alloca() by g_try_new() in ppoll() syscall
Date: Fri,  7 May 2021 16:43:03 +0200
Message-Id: <20210507144315.1994337-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MTB2VyUnO68C

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2fa6b89b3de..0bf4273fc7a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1605,11 +1605,10 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
 {
     struct target_pollfd *target_pfd;
     unsigned int nfds = arg2;
-    struct pollfd *pfd;
+    g_autofree struct pollfd *pfd = NULL;
     unsigned int i;
     abi_long ret;
 
-    pfd = NULL;
     target_pfd = NULL;
     if (nfds) {
         if (nfds > (INT_MAX / sizeof(struct target_pollfd))) {
@@ -1621,7 +1620,10 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
             return -TARGET_EFAULT;
         }
 
-        pfd = alloca(sizeof(struct pollfd) * nfds);
+        pfd = g_try_new(struct pollfd, nfds);
+        if (!pfd) {
+            return -TARGET_ENOMEM;
+        }
         for (i = 0; i < nfds; i++) {
             pfd[i].fd = tswap32(target_pfd[i].fd);
             pfd[i].events = tswap16(target_pfd[i].events);
-- 
2.26.3

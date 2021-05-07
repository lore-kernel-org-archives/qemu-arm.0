Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451273lfg;
        Fri, 7 May 2021 07:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH6R4ZmX2s/x/95M5FvyU+mEQIJXBE/uu6IdHEN/kZepTVE/tE26nWO2ntmLBcawHN+UCg
X-Received: by 2002:a05:6402:1357:: with SMTP id y23mr12339550edw.235.1620398635791;
        Fri, 07 May 2021 07:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398635; cv=none;
        d=google.com; s=arc-20160816;
        b=vpfubXWC47MHBxwgYTbzMjuRGBIe3lwrjjo/M+gqx4spwmNKVxHxlynXhrRdYjffD8
         5q98esjp3s0+H2QHYLATXHD8NGd6sFIQ6yOgNvX+5HlCZxmJlvMAJs4Yto4GNV5rfVfe
         FynT1YcSOQsy/TMkRf3HTWS+fPTYZHpWtNnVcantqpQ+0oGrHccrV9tWSw98T+uQ27ZS
         iOuNjnyygwljaBgxzi7iVhQeZlxehSoM+kGZCil5BkJV6zktlkQnLh366naop+T0sfNf
         i74yn4Llshm65MYWKpnnSLDV2r5Akl4MW8HhhUJ7Yuxqsh30HgKDfKxISJV+Uq0EBzUc
         m+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9UwtNiSXhDRvxxEBq2bA0+BsvH/APBPHI+6JmS4Uqh4=;
        b=z4RyCrWX5LpRm+W1G2OhSi1gx5waHGRc4awdRxqUi7r0xQL+waDkeRMKnky4SEIsHp
         rPf5DVhtlRrHfHy46WL0ic5YuauoxiC55MQsp7zOVhYTaLhUGZ0bSvHv5HuvRRN9GHmy
         fTBhIZEtjKTzsQtR48EI7wyLtFL1O/5ZcSv2WyqvZy/saUEI8kd30fhBTJ3qzRC7+SxL
         UH38layr48kMTu+NnT1LGtX1NHxR/1iYFdH35xzyd2uoOuJrrYECjrwIJi1vY+YGvSo8
         XnhBrjkszH/LHX4SCs+JwxOvANGK4GmF4PijgrS7yc+ZwC71LbMy2JPjM5ueo9gDXjwb
         v+dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ba0pIw39;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n13si5191365ejk.5.2021.05.07.07.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ba0pIw39;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UwtNiSXhDRvxxEBq2bA0+BsvH/APBPHI+6JmS4Uqh4=;
	b=ba0pIw39FsH2AzeV8xuN5DnIEiSYjJyNvPT2mgy/9e+WQYps0UUhjxUReMAFiXuqikIJtg
	br/WpRct94ZKK9GXQVZM7VzOfpU4JR5SpTtkYNhtdOulbCufUAhvx7TB3vgiJlyH9zKx7Y
	UqrfEzVM63odubiq13gR4zmZa2OXkjs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-Anfa_sK3O8qjHnjMk-krnA-1; Fri, 07 May 2021 10:43:52 -0400
X-MC-Unique: Anfa_sK3O8qjHnjMk-krnA-1
Received: by mail-wm1-f70.google.com with SMTP id s66-20020a1ca9450000b0290149fce15f03so3986475wme.9
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9UwtNiSXhDRvxxEBq2bA0+BsvH/APBPHI+6JmS4Uqh4=;
        b=Edt63cmoVsONT8wvrtczvPEzjR6Xw7CBJlWTmHMse3QzZF7zQ5NjOfMS7auAS0EgCX
         GCKZDoNYsbhIH3cKRv2p1a0UXryOmCpX7ez32ibDLIvXNXCTf36Ue6luZ5jvuuKbEt7n
         I9MRonOQC5Z8rHY3XdSluexqzf19EmX2ikQpiE8N7viVRpos8r1zCeW/hzZo0RYEwaqV
         wY/TpXFWysPZPcqoJua9DRU3qZ89RkuNp7QyCt0rRTXazcXUOjDdfVZ8vF4kgDzfsco9
         wJ2JHsh7TKdQ3JEuDJpxD++EojTp13/eC60MDJ6rM77LLcuTCnF0ip4ps6BbFUM4I7St
         4lkQ==
X-Gm-Message-State: AOAM532vYLiyr+zNRHRJGTM2Dj9bpb/vwF6B0FRToBPsrusdLDWHUbR5
	6QGg3VaaMKlAdezUJYeTFTVwbNaCIdqm2+kCAvF38G/WLP2Y2pKzuCH3x59yVZ1qa6k7WzIyvSd
	vV/EllXHWG/BB6ypz
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr12640286wrs.233.1620398631054;
        Fri, 07 May 2021 07:43:51 -0700 (PDT)
X-Received: by 2002:a5d:4acc:: with SMTP id y12mr12640261wrs.233.1620398630869;
        Fri, 07 May 2021 07:43:50 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id d3sm8221624wri.75.2021.05.07.07.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:50 -0700 (PDT)
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
Subject: [PATCH v3 07/17] linux-user: Replace alloca() by g_try_malloc() in various socket syscall
Date: Fri,  7 May 2021 16:43:05 +0200
Message-Id: <20210507144315.1994337-8-philmd@redhat.com>
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
X-TUID: ey6i0c/2jrg8

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 50 +++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a263aea85ff..7c5c821f48d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3307,14 +3307,17 @@ static abi_long do_socket(int domain, int type, int protocol)
 static abi_long do_bind(int sockfd, abi_ulong target_addr,
                         socklen_t addrlen)
 {
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if ((int)addrlen < 0) {
         return -TARGET_EINVAL;
     }
 
-    addr = alloca(addrlen+1);
+    addr = g_try_malloc(addrlen + 1);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret = target_to_host_sockaddr(sockfd, addr, target_addr, addrlen);
     if (ret)
@@ -3327,14 +3330,17 @@ static abi_long do_bind(int sockfd, abi_ulong target_addr,
 static abi_long do_connect(int sockfd, abi_ulong target_addr,
                            socklen_t addrlen)
 {
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if ((int)addrlen < 0) {
         return -TARGET_EINVAL;
     }
 
-    addr = alloca(addrlen+1);
+    addr = g_try_malloc(addrlen + 1);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret = target_to_host_sockaddr(sockfd, addr, target_addr, addrlen);
     if (ret)
@@ -3519,7 +3525,7 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
                            abi_ulong target_addrlen_addr, int flags)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
     int host_flags;
 
@@ -3541,7 +3547,10 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
         return -TARGET_EFAULT;
     }
 
-    addr = alloca(addrlen);
+    addr = g_try_malloc(addrlen);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret_addrlen = addrlen;
     ret = get_errno(safe_accept4(fd, addr, &ret_addrlen, host_flags));
@@ -3559,7 +3568,7 @@ static abi_long do_getpeername(int fd, abi_ulong target_addr,
                                abi_ulong target_addrlen_addr)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if (get_user_u32(addrlen, target_addrlen_addr))
@@ -3573,7 +3582,10 @@ static abi_long do_getpeername(int fd, abi_ulong target_addr,
         return -TARGET_EFAULT;
     }
 
-    addr = alloca(addrlen);
+    addr = g_try_malloc(addrlen);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret_addrlen = addrlen;
     ret = get_errno(getpeername(fd, addr, &ret_addrlen));
@@ -3591,7 +3603,7 @@ static abi_long do_getsockname(int fd, abi_ulong target_addr,
                                abi_ulong target_addrlen_addr)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     abi_long ret;
 
     if (get_user_u32(addrlen, target_addrlen_addr))
@@ -3605,7 +3617,10 @@ static abi_long do_getsockname(int fd, abi_ulong target_addr,
         return -TARGET_EFAULT;
     }
 
-    addr = alloca(addrlen);
+    addr = g_try_malloc(addrlen);
+    if (!addr) {
+        return -TARGET_ENOMEM;
+    }
 
     ret_addrlen = addrlen;
     ret = get_errno(getsockname(fd, addr, &ret_addrlen));
@@ -3640,7 +3655,6 @@ static abi_long do_socketpair(int domain, int type, int protocol,
 static abi_long do_sendto(int fd, abi_ulong msg, size_t len, int flags,
                           abi_ulong target_addr, socklen_t addrlen)
 {
-    void *addr;
     void *host_msg;
     void *copy_msg = NULL;
     abi_long ret;
@@ -3662,7 +3676,11 @@ static abi_long do_sendto(int fd, abi_ulong msg, size_t len, int flags,
         }
     }
     if (target_addr) {
-        addr = alloca(addrlen+1);
+        g_autofree void *addr = g_try_malloc(addrlen + 1);
+
+        if (!addr) {
+            return -TARGET_ENOMEM;
+        }
         ret = target_to_host_sockaddr(fd, addr, target_addr, addrlen);
         if (ret) {
             goto fail;
@@ -3686,7 +3704,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
                             abi_ulong target_addrlen)
 {
     socklen_t addrlen, ret_addrlen;
-    void *addr;
+    g_autofree void *addr = NULL;
     void *host_msg;
     abi_long ret;
 
@@ -3707,12 +3725,14 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
             ret = -TARGET_EINVAL;
             goto fail;
         }
-        addr = alloca(addrlen);
+        addr = g_try_malloc(addrlen);
+        if (!addr) {
+            return -TARGET_ENOMEM;
+        }
         ret_addrlen = addrlen;
         ret = get_errno(safe_recvfrom(fd, host_msg, len, flags,
                                       addr, &ret_addrlen));
     } else {
-        addr = NULL; /* To keep compiler quiet.  */
         addrlen = 0; /* To keep compiler quiet.  */
         ret = get_errno(safe_recvfrom(fd, host_msg, len, flags, NULL, 0));
     }
-- 
2.26.3

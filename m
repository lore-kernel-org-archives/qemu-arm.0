Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451405lfg;
        Fri, 7 May 2021 07:44:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHuJPbWxpaEg7aEDwOJAgeGHOLhHVit8iEpFxk3eWMut2LaaFEfmDOmkhH3BfxwEJF0OpO
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr10553988ejs.522.1620398646566;
        Fri, 07 May 2021 07:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398646; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMDKZjf/7SCxmu7E+dTw/9jTFvNN1BMJdf1LdWJMwBiPG7OJh0SQPL8LWLm69z+wjd
         pvDgvtNe87qR2PqghjmqvrQXhB8LIE5MK4Izw9xq8n0JWkcHlH5bnCLdn6LzSP7EYdKp
         lfioBCMIwgOAjO4e4Ir+BYbWKa9j/X8zUB4nXY5a+uYygz5ftJrHxFf/dt+PDj3sXvuA
         IibYCAhMUbePATHiU8Fmc3IU/UIM8iDbeyNF4li2iPU+V2Yj8iebi5ADkpJm6lxn2uhC
         JAKM/BjBXlF5GLQBx3cPMIEu0NXPD5R9vrLKJX+Y6UTcVsNcaZyIfVWdaRuFxGiguw2A
         ArPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VXb/SdsglaW/QeR809+FkWbDDukXToeT9LG+jBzD2Ak=;
        b=jKTeNQw4ft3NnMpoWWJ5M/ReAm1CN8GpGhPPbmXJgYMEDy7Ewm2k9pEDKRDTXvlCYk
         6AZe2ccv67cIBGV9MHkPbYZBVK5j4iTqrF+ibg4inis9igh+NWmRQXRw7GnLDDmiyx3P
         7IhsWzhB9L32VRpW78Y1f/6mXm69i91xRoto0ZPvYrCRb65NfjYPVJkzxNeRUWlPkuTG
         8rvEg/VMi8cDT3WAdliUgJqM307Lg5SbPyY+DIC3dPFpAV1y342jwHX60b+pX1dKb0Ca
         E6GNnMvk5xCrA7HPMpAD5wwbNN2r3ddXzkkILDFRriViZKBEV6fpYc8pa+6bBlAewqE0
         laNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DBD/Pent";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id jz27si370656ejc.541.2021.05.07.07.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DBD/Pent";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VXb/SdsglaW/QeR809+FkWbDDukXToeT9LG+jBzD2Ak=;
	b=DBD/PentXDB9kYFVmt/b39n0lQ6T3ODmnJpfRk0iPANeO2BQbZhYk1GP5X3sz1qbIbCX5T
	DQRfldFqAU1VkdbuYO9/FMtNyG01aZrsf6rwg4y2bzWzW6cAPovx9+vTuGlz0j6fMLmxH3
	/O4pusTcxUA6rii6dz8pYhYZj+6Ur9Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-ivUdI11WNBGIV4n-z_B1sw-1; Fri, 07 May 2021 10:44:01 -0400
X-MC-Unique: ivUdI11WNBGIV4n-z_B1sw-1
Received: by mail-wm1-f71.google.com with SMTP id y193-20020a1c32ca0000b029014cbf30c3f2so3952484wmy.1
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXb/SdsglaW/QeR809+FkWbDDukXToeT9LG+jBzD2Ak=;
        b=oesHo2dRg99C9QCqwQnA2Jrq3NBtrzDCy/c98kZXIQLFZr1VC05zwsHJrQOz8s8HMu
         xdo2MJvLKV4zMww7DS80v8UGGNrLgtprg8QHMUl6dhuRJZ40I2yafGQVgi00fv5n8n/V
         nWiKLr9zaKAmM6KwW+h8/q6T0rwI1rEgtKLxr5Q27V6boKtkRKCrM80/0GuTY4u6MGut
         WKko8Jtid8xFEajbeh7hfioGcN5ZsDbbeLFsfvFTWGmnZDGPMb+IR0FXNSktHAS7lKu5
         qQ1dNvEhComc7huzTgWqPpBA/v0Kgqc6W8Ng+jvNNf4yN89ytoQZXGFnCyL+2sP4WCHJ
         OmXg==
X-Gm-Message-State: AOAM5300onlDTFi5fFxnqz3RrwDpCHlzhSb8F+MpL7Xj9M+O07WGdBvw
	dgz3Ld4hrtSRpA3ZC1cuBdSLJFiITkgpDLaFWXrpXyBq0vPy5IMw7ISr1NQcW2QemQmPii0R8xU
	JlO/MMNsRKkhAK+AP
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr13450296wrp.338.1620398640705;
        Fri, 07 May 2021 07:44:00 -0700 (PDT)
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr13450277wrp.338.1620398640536;
        Fri, 07 May 2021 07:44:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id v13sm8883864wrt.65.2021.05.07.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:00 -0700 (PDT)
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
Subject: [PATCH v3 09/17] linux-user/syscall: Replace alloca() by GLib alloc() in sendrecvmsg
Date: Fri,  7 May 2021 16:43:07 +0200
Message-Id: <20210507144315.1994337-10-philmd@redhat.com>
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
X-TUID: sbQ2GH7SFYMa

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 593241362a9..c88e240ff93 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3358,13 +3358,19 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
     abi_ulong count;
     struct iovec *vec;
     abi_ulong target_vec;
+    g_autofree void *msg_control = NULL;
 
     if (msgp->msg_name) {
         msg.msg_namelen = tswap32(msgp->msg_namelen);
-        msg.msg_name = alloca(msg.msg_namelen+1);
+        msg.msg_name = g_try_malloc(msg.msg_namelen + 1);
+        if (!msg.msg_name) {
+            ret = -TARGET_ENOMEM;
+            goto out2;
+        }
         ret = target_to_host_sockaddr(fd, msg.msg_name,
                                       tswapal(msgp->msg_name),
                                       msg.msg_namelen);
+        g_free(msg.msg_name);
         if (ret == -TARGET_EFAULT) {
             /* For connected sockets msg_name and msg_namelen must
              * be ignored, so returning EFAULT immediately is wrong.
@@ -3401,8 +3407,7 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
     msg.msg_iov = vec;
     msg.msg_flags = tswap32(msgp->msg_flags);
     msg.msg_controllen = 2 * tswapal(msgp->msg_controllen);
-    msg.msg_control = alloca(msg.msg_controllen);
-    memset(msg.msg_control, 0, msg.msg_controllen);
+    msg.msg_control = msg_control = g_malloc0(msg.msg_controllen);
 
     if (send) {
         if (fd_trans_target_to_host_data(fd)) {
-- 
2.26.3

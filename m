Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451329lfg;
        Fri, 7 May 2021 07:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK9yToH/mQania0H56qreKhGFoVEd4RQ3FkdP8rbQfGLgQSRC06puVhcgTRQ38oecOKkaD
X-Received: by 2002:a17:907:c1c:: with SMTP id ga28mr10505378ejc.122.1620398641502;
        Fri, 07 May 2021 07:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398641; cv=none;
        d=google.com; s=arc-20160816;
        b=ksTnTay4EtJk47riJiw+2xPuf2FZ3Uwo5nv9ZU5u7higlOjOnjuu5MqiWLVskFGXX+
         F12Y4pZiNuutQ04Us6tB5MRt7HvC5OUWoFCqkAXcWWHMeRY1fk5cXTRR2FPqiQDqswHU
         bgtETrFh5yg+YS6pZRqvcuHIQnc7lzPuxvGBtvgsIP7TVSyWbxNCrMz25Addy2JeFcHb
         nBA2UZwPjo4v6df2iSQloCw8gMlBAy1FNisDy5KmiQGU8nLsrafxYkqHJP64ncjVmfDh
         DXnKAlqOT1MCo5t8MYdhO+y2+6Z+/iez/BK8/wRaclTt7kvWEMUBcM+vHDdNH4lfjhtg
         3S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0aEFCYf2HLWMKyL3vu/hasMYJfVES1sketKqALkOn8E=;
        b=gbBGCcfXjorxMakiWLECeaFxYQ5W0kVmFhUtRkFuLmZ9S+IadoczXP65zpcQ95r4x+
         VoM5DhZxRYYA6Y9eh0/yj5CijblVjwGYHxOdmpwxP4X/q3IB+W2FwFc/JPqbulAkiSoh
         5SJaBU8yAaGmCUcmQaHUf7P1dPrsY/MWz9Ecnq7CIvigwmQdwgL2y/4MUFngUfC/urHj
         RUz6sRzF4Bn9o00y4vvKOU1783aV2JeOZrBtLgVXhZRiCIHSNE2w/DMTv8x6vuDEDtsR
         CqnfUwKvT3C+iy95bEKqtn8vAI2shVm8sUizLWuCf90fN2O2T9tvnJzEMNhVbx1WHSY3
         HHAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FRnr4im3;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y9si5251754edq.93.2021.05.07.07.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FRnr4im3;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aEFCYf2HLWMKyL3vu/hasMYJfVES1sketKqALkOn8E=;
	b=FRnr4im3S2xBtHFd49O9DhNEsMYlkEOzBgA/MsRyX3ulC0BD30mdDMHR5uaafLvAkNJmqL
	AeJIcs1/mb8l/Pw2kezoDDnZo/xmWllroTpauu8OyYcob2TbRgHFX7KFw3nlj9RtNDxt4l
	l6bNwuE4K6wc4aAdpYZlKCBo3i4xzi4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-MUECVFTqMN-MGuBG6y95fw-1; Fri, 07 May 2021 10:43:57 -0400
X-MC-Unique: MUECVFTqMN-MGuBG6y95fw-1
Received: by mail-wr1-f72.google.com with SMTP id i102-20020adf90ef0000b029010dfcfc46c0so3707677wri.1
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0aEFCYf2HLWMKyL3vu/hasMYJfVES1sketKqALkOn8E=;
        b=pmO09u8r/52VISuoxSDQaIVzYuhfZReEEoWhYbCGnS8rq5cvJtmV3YKKs8yXJ1L68N
         U567Np06IA5i6EbX/V4Mnfp0hf5HMJKKK88jCujanrYv7lAjS0d74cEJ/nOgSRQkYbg2
         6Ri1svcNrIRN60Alm4bTQZ0rtclmF6omHkWBPfCpwRg1zv3l9C5chs4wB8goN4tw9puZ
         xhunwdVWoMCDlirNyrGD/4qUxtc3yAbPH2KE2Gn4oDwphTU2trQjNUCO0AIsjZwYreQp
         DC3rAWJmwaTspF1alcCbXTY3TVvc4gJGzOP1k2hZ/YMwklpxxNbY+oBEelrBWZjg0csz
         xhfA==
X-Gm-Message-State: AOAM5309kbzb305ZFgOIz/ZwcMkdSXO1/e0Z0JzIMR441riR/xAONMUM
	TEAmZ4cxLlPSvbQXPHtGaRHh7Oz83+5wxxzqF+l5kgRXJdn/GkyA7wXGPh2b09THH+ziIYOT8Iv
	WIZu+JJNXsSk8kHgV
X-Received: by 2002:a1c:e912:: with SMTP id q18mr21780860wmc.59.1620398635880;
        Fri, 07 May 2021 07:43:55 -0700 (PDT)
X-Received: by 2002:a1c:e912:: with SMTP id q18mr21780843wmc.59.1620398635604;
        Fri, 07 May 2021 07:43:55 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id q12sm9079882wrx.17.2021.05.07.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:55 -0700 (PDT)
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
Subject: [PATCH v3 08/17] linux-user/syscall: Move code around in do_sendrecvmsg_locked()
Date: Fri,  7 May 2021 16:43:06 +0200
Message-Id: <20210507144315.1994337-9-philmd@redhat.com>
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
X-TUID: efSP93uma8yD

Avoid initializing variables too early, since there is
2 possible failure points before they get used. Move them
after the lock_iovec() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7c5c821f48d..593241362a9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3379,15 +3379,8 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
         msg.msg_name = NULL;
         msg.msg_namelen = 0;
     }
-    msg.msg_controllen = 2 * tswapal(msgp->msg_controllen);
-    msg.msg_control = alloca(msg.msg_controllen);
-    memset(msg.msg_control, 0, msg.msg_controllen);
-
-    msg.msg_flags = tswap32(msgp->msg_flags);
 
     count = tswapal(msgp->msg_iovlen);
-    target_vec = tswapal(msgp->msg_iov);
-
     if (count > IOV_MAX) {
         /* sendrcvmsg returns a different errno for this condition than
          * readv/writev, so we must catch it here before lock_iovec() does.
@@ -3396,14 +3389,20 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
         goto out2;
     }
 
+    target_vec = tswapal(msgp->msg_iov);
     vec = lock_iovec(send ? VERIFY_READ : VERIFY_WRITE,
                      target_vec, count, send);
     if (vec == NULL) {
         ret = -host_to_target_errno(errno);
         goto out2;
     }
+
     msg.msg_iovlen = count;
     msg.msg_iov = vec;
+    msg.msg_flags = tswap32(msgp->msg_flags);
+    msg.msg_controllen = 2 * tswapal(msgp->msg_controllen);
+    msg.msg_control = alloca(msg.msg_controllen);
+    memset(msg.msg_control, 0, msg.msg_controllen);
 
     if (send) {
         if (fd_trans_target_to_host_data(fd)) {
-- 
2.26.3

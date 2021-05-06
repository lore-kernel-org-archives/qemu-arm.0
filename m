Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1271994lfg;
        Thu, 6 May 2021 06:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMKBSNzDMlqVI9SnQrfZ7OfXX0bR8pblwRFLYpQ8mzp+8mL6VrIkU0FGEOdqGoFyl91WQh
X-Received: by 2002:aa7:c150:: with SMTP id r16mr5155600edp.82.1620308304506;
        Thu, 06 May 2021 06:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308304; cv=none;
        d=google.com; s=arc-20160816;
        b=etuUvA0Yzc+lW+4F37AMW2vKc60VWMP7JCIsjHG68r3DMkZJJHk1wPLOC0bHO2tQrJ
         vbklbLam721XLlQQaJHah8empBtN4zjAOUWz6xRBhsCANr0q6Bjx+Xn9Z1PjvDL2X+GY
         RtyUwj1OCwHsxKPDGbyn/AZQ2y7ciqM1/ykneywmfgAfEDNxW+w68b/lHIGWwzUDqdPV
         fHiGCmaN74NiNizo7TtqyfN5v8hBWEeWTnHm06uBgPQSitNy9id+loKtssdoC935V71I
         sp16rRSXicJfIGXSN2XCLtb3BrNoow5LjLfNYlNL+bpAJo8cQWRjFyD8Bru9wHQsBu35
         O54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
        b=Hg0GQg18dZMSl/+iv6XH5lWYNFvbnpXwzbFJoK8ZWCMtMp+wU9taWMh1FWG6NSEUf9
         w2QB7H78jffJi6lSK9tpSQgPCLQd50EG3u/P0uZIHIki6obIYWjGNVy1e1drFrwmkaPt
         YWapjMqWNXicQiqxGnyLQyMMW3Hphf53Z/fDtFQ0kD5FCzm1CFv+Hhvimg8Kts9kZEo5
         O8jF3yTr4mkYHqVFVWZevpRtqJZcPl3+dWP6NqWH9AuxaHs/3SsEMFMKRrYX2iU4bM5c
         QGDBPZcNmcumbxfSnk5Xd9kATgANu31kv09nVFfZIXU3VAN4ftOvlTTpePph5SU1TB2v
         5smA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKv9W8c+;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id w3si2352993edr.107.2021.05.06.06.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKv9W8c+;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
	b=JKv9W8c+otDIvMW9Oi/K6hh1/LN1J8HTiWiB6+ieI6YmLwQx8dQbplkh1Abm3HXcDFTgoK
	uTKS194Q+rWv/VnJgnLqCGIFOH5UhKE8rxTCSC1DKlMTq1neWUWlIZDFxl4iiTUPH6tIrM
	MkouantzdCkNwMdL90eeys5y6KamHPI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-dh93u49kNlyjsdrCTYvz-Q-1; Thu, 06 May 2021 09:38:21 -0400
X-MC-Unique: dh93u49kNlyjsdrCTYvz-Q-1
Received: by mail-wr1-f69.google.com with SMTP id 65-20020adf82c70000b0290107593a42c3so2222067wrc.5
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
        b=Yb4AFMPQKV8SOKZnB9LIomJqwn9qdy5CDJ7lo/fR4tHEz3ymKNPEeikDSRXFALQXNC
         qoV6TzZb364ffDxdit7zx8olG+BthmoCezGr17ehDaVB4dOY8E+W0GJ7mKIpQ8L3RkRJ
         xcIyzWs52GdokBHPzZ9HKPcf44IgIiyf5Fyjh43a9nwuiwbt+WPOvZ2OsZ9d+9QA12xn
         yz8QwkW2F6E+v4Z9J+hyFrbiOkFhXxDX2iR/wMOL5XbIoUFitzm+0lJXTMA0i/sNylRI
         5RLRCkmb+sgmdYCSAgYaGRYi9nCoi56yMG35VVpRnzFPebFG/+KwJor2rrLYS7P99XGs
         OB1w==
X-Gm-Message-State: AOAM530yoh9ptTd86IZ4qDF8qKBXx1M62T/f8nub4NGzdrvo0YysidQ4
	ToDGm88DFNgYuiorzq57kgz5GjXKCKMZcRlkniqScAvf80ZA3GVcmttpe/FaX7Lg+jDfu5WyqI2
	DSzqOfTOVpb1Ex+45
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr5147670wrv.239.1620308299896;
        Thu, 06 May 2021 06:38:19 -0700 (PDT)
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr5147655wrv.239.1620308299780;
        Thu, 06 May 2021 06:38:19 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id m13sm4432533wrw.86.2021.05.06.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
Date: Thu,  6 May 2021 15:37:53 +0200
Message-Id: <20210506133758.1749233-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D0nvnC7rnP9v

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_new() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 bsd-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 4abff796c76..dbee0385ceb 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_FREEBSD_NR_writev:
         {
             int count = arg3;
-            struct iovec *vec;
+            g_autofree struct iovec *vec = g_new(struct iovec, count);
 
-            vec = alloca(count * sizeof(struct iovec));
             if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
                 goto efault;
             ret = get_errno(writev(arg1, vec, count));
-- 
2.26.3

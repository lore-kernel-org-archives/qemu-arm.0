Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp450940lfg;
        Fri, 7 May 2021 07:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUh+/wHessYg0iEElGNH6yA1GF/hgL4+Nrccc7Myh8iMQPlbmanp8sHF70sAF9CuNyAZ0u
X-Received: by 2002:a17:907:75d5:: with SMTP id jl21mr10554945ejc.280.1620398606584;
        Fri, 07 May 2021 07:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398606; cv=none;
        d=google.com; s=arc-20160816;
        b=ikeRgF9jbqNGBzxIoEVm11nF2bAATLs+rQUWj3xfZNfHSE1f4XOHWrqP5IcbNOaSLi
         X62f2PiWl3ycEyRBNWNxV37LnJpHVBI43wEETOZ9fXUaKVNj/Oha3L1GW+oWWWHK+moY
         bAYQ6bfNTiS99gt9R0SOzoap6c+3HnwKewpSc3rX9F3ZCaL6vzh2tDCeXXjwpEAKtZme
         QxQZ56/3+cSKyk0186whc8xNYYsUkDpYFqmxDJOu4AyLiM2dTAnzDFa6xo3kU388lWGB
         1v+6n9ewBDl12qsS4ZVBN3b6gFzov4VjGf6ZtLIr4JfmALyCLVishA72a1sbilSBIyrg
         FH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TX2Xz11Yxqn3cVVJ/gzPo0vFUN0FblHfQJn4P/Y+Hk0=;
        b=XXhOhiFwCUWYqQf6BCpLrFrA/X/QQtA2b3NuxbVC2jKqC+i2q9t+PlV8Fa/Xv+3/Hg
         qz8iiiwFo3EiUWxKhxNGxQaGl6NOIXU8M0WTS2HWovTme4ki9V6qw2aYd1vL/cbK0t9W
         t3a7Ic94/WT9mP+GY5nfPGn3LS5jD2J7W4Qv6xZWxZ6fDTn4cfpajyTO0d0ZCS0jPr6r
         W7vVq7cACMiD0HuF5xDkxS1XD3xjkMPkhZw5M9wtJFNsluD6pHSoXLHygwTdEId5gYKs
         Ge2Ep5l/9HTbeyCLzU8gRRcLxFt5alQyAqCNUpRmfw59tsfjfCfNlxi0CwJKJmm6kPaB
         nghw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VRIbKc9x;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dk3si5099977edb.73.2021.05.07.07.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VRIbKc9x;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TX2Xz11Yxqn3cVVJ/gzPo0vFUN0FblHfQJn4P/Y+Hk0=;
	b=VRIbKc9xeT5EBBykfg3piVaJ+oJ5DyKaIqsujgchXmbpiDkBeSdW/iBc8b+uFx1sgZbuD8
	2x31q6pT3dnlYns6oqWMr/jdVyfZY4QRZ6zofFv+Zl/obaOF2HJJMDVWJlww+l7+TKo2Wx
	Ia/XmI7fINKbMWld8Up4Df8HOuikmno=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-VCmh3RptOBuC5rH_f7doSg-1; Fri, 07 May 2021 10:43:24 -0400
X-MC-Unique: VCmh3RptOBuC5rH_f7doSg-1
Received: by mail-wr1-f71.google.com with SMTP id n2-20020adfb7420000b029010e47b59f31so1014604wre.9
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TX2Xz11Yxqn3cVVJ/gzPo0vFUN0FblHfQJn4P/Y+Hk0=;
        b=j0eI1rl2/6oCU2pFjH8WAOJxBr1GC0RV+Lii8Zr1btomtVoIJ54/MsfYPZogGAGV/F
         z3ZQOTyp9r5R1gllk+jjNalIQg+bae1Z5v5+I+OTdZ7RMImE/v7rEc8+u0uGKJ/REeof
         1MM8Wl8uelGhhWukdkTqpDDv0bkkvSA8RM5mlexqSaDiGxa1SqcnIP+ue1gbxdI7/ABt
         R0cmEsMDMKEhcQv34eY6i5RywtBRprie/4xVYb8xfs/8Vb6+spYn4l/iY2fwmxB7aZL4
         FOu/9C/427fwb8LtOOFH6JmH3mCWnXiISOJjP4yHj0cpwkERyxr4vDZ1B8Jp8xBGx7nO
         J88Q==
X-Gm-Message-State: AOAM530bxHLZMYEiYHkUH3r7Xxnfzx7grsvYDC2YF6/iirUoejUGfCcb
	o/RyreKkfqxXPHrXeL49QH7zE4/k+5s6dGmGE6bMwWYQv2NhBqkHiL6uv6Xq4HJj5c0QuteSbap
	UQaXsmZiS9P04o8sB
X-Received: by 2002:a5d:4810:: with SMTP id l16mr12459993wrq.44.1620398602685;
        Fri, 07 May 2021 07:43:22 -0700 (PDT)
X-Received: by 2002:a5d:4810:: with SMTP id l16mr12459975wrq.44.1620398602565;
        Fri, 07 May 2021 07:43:22 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id i14sm23099111wmq.1.2021.05.07.07.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v3 01/17] bsd-user/syscall: Replace alloca() by g_try_new()
Date: Fri,  7 May 2021 16:42:59 +0200
Message-Id: <20210507144315.1994337-2-philmd@redhat.com>
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
X-TUID: 6PvowMtZRDr6

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 bsd-user/syscall.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 4abff796c76..6db05988f1b 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -355,9 +355,12 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_FREEBSD_NR_writev:
         {
             int count = arg3;
-            struct iovec *vec;
+            g_autofree struct iovec *vec = g_try_new(struct iovec, count);
 
-            vec = alloca(count * sizeof(struct iovec));
+            if (!vec) {
+                ret = -TARGET_ENOMEM;
+                goto fail;
+            }
             if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
                 goto efault;
             ret = get_errno(writev(arg1, vec, count));
-- 
2.26.3

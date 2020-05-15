Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp678944lfb;
        Fri, 15 May 2020 10:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6zvPMjNwXBFf3lCebuwfrA3fuWYfcwA7fWafNPJ1Z9GgX7T62+WlNmZ9unkBikqVqizrI
X-Received: by 2002:a17:906:4749:: with SMTP id j9mr3812791ejs.23.1589562498809;
        Fri, 15 May 2020 10:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562498; cv=none;
        d=google.com; s=arc-20160816;
        b=MufdfdCR5gvZg/sHFXyKfiu/M8C8HZ2wfrBjLbEXoj2CY5L+Xv/ysflsat63g0JhKT
         PFiDDwMs8sG4WtDzwVl3zzk3d5kMkac83mahmkHGPNE3UJOSR/o+pWOOuP63Ti73AunG
         6Ugzmw43LQMm+FndEbktIuPT8BqDSNgVxinYIamtFm9uh9AF8R15OVdHlPC96nreHyjK
         UV/crD0NifKsZPQw0EzLo1CqwwGTeq6bOmXsd9KtAnDL2O3CcbEoEfOxR/rDk70kEUUz
         NanYWJo+HE8o+ehpWe3oDrD7Lg8PgsRE/KkjGDiCbL5Ax5Ph4RIBigTyX4ZBRAyTGnK0
         vNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1LWNrIr5sPkmnUIPfYOIlIROnAtcVQlofpnnefmhg9k=;
        b=Dv45uHIncuT7Fz6dlQiKyHp3VILAaW5i5YQPCotk+o5/Tsz3L7SHgIhBd4E/yN/Ksg
         GCy9nooQU3bJYlrft3o7pJt6idjwE+JwdkjcMUum/BQg38RuHNxNWDv0k6WY1YMRZhV4
         mRUao/xlms2QTxCxScVunexPRK9D1mOijCQzKLLsSteyP6FXiDALDUueVoyoW+6vqyCO
         XplfOy1uqUUrF8fiGnNlQ0HvILmFe6mPP/7+mRnYpyJt+IFAg6NHRkuW8J3La5Avk0l7
         yn4t/tko9C9UCUDp5xTPud3SMlJcxMAZNDsmMcDGVOsjo8DTPxa9xdE9cchxDyicXgzH
         GlZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xb3KNAmQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id dh10si345441edb.311.2020.05.15.10.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xb3KNAmQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LWNrIr5sPkmnUIPfYOIlIROnAtcVQlofpnnefmhg9k=;
	b=Xb3KNAmQQVsZ6eqabOyJiAyz1BgvNAreX74HcCC513GZlfJMsp/PchSwJa31bw+TXJ88OL
	fBIcJu7WfL6DqmMYEVAxqqcYnZFXdY8Gel2nG8bIPgVqvXE8ppoDPN1S5QMs1lLtBuHwPY
	UhUbbsCMwArn9DpaZs6uH9gvDCY6Xqc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-SlTdVrDoNqWrVHtaY2tn3Q-1; Fri, 15 May 2020 13:08:14 -0400
X-MC-Unique: SlTdVrDoNqWrVHtaY2tn3Q-1
Received: by mail-wr1-f71.google.com with SMTP id p8so1481119wrj.5
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1LWNrIr5sPkmnUIPfYOIlIROnAtcVQlofpnnefmhg9k=;
        b=sFMXIwdrpxDWr0xHJeF1Ew7G26WlthTSLMyp2d+SA6y42jqOJxv6b4tIZKuO/XTlKf
         QXYRryOUeJfIvyzBXY6oRg/Wom7MR1mnBK2Tj89ME6MtIZPo8WAMjEu0/J1evpW5Hi4K
         Qq+MDM7igTZ8epxU6+GdAN08AK6/i9CmzGCIhEH50v8VrqC9UNnMdqZkb3QjqCHdwsYw
         ZNoKjjZ07T+bylINHKdzEJK0nZH5+nQK7amtlCeHy8G2IaXC5SRv2WJJnIbYYZ7TGRDy
         KbkErKVoZyzXcM6dJ91jaWOMsERB8fD27u0hBahp6Wm1r2DPTpy4XJY9MK50f6lxvLRy
         F+tw==
X-Gm-Message-State: AOAM5330KIIy+3RfgjujhU8EfX9XmSNwt+aJsh9UP4PlOSZso72fOLJt
	pnwRyJiZiYp6KJFbUb8ySoOnMagVu+uETeRBpWzc5Ek6oK31CBcTqv/UVSQtKFcH5r1BSt3Vbh9
	VjH9i2naLHhacnMSW
X-Received: by 2002:adf:94c2:: with SMTP id 60mr5228986wrr.366.1589562492972;
        Fri, 15 May 2020 10:08:12 -0700 (PDT)
X-Received: by 2002:adf:94c2:: with SMTP id 60mr5228966wrr.366.1589562492758;
        Fri, 15 May 2020 10:08:12 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id e22sm4742390wrc.41.2020.05.15.10.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/10] MAINTAINERS: Fix KVM path expansion glob
Date: Fri, 15 May 2020 19:07:55 +0200
Message-Id: <20200515170804.5707-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: +jt8SMtk/llG

The KVM files has been moved from target-ARCH to the target/ARCH/
folder in commit fcf5ef2a. Fix the pathname expansion.

Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47ef3139e6..fd88a3de49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -361,7 +361,7 @@ Overall KVM CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: */kvm.*
+F: */*/kvm*
 F: accel/kvm/
 F: accel/stubs/kvm-stub.c
 F: include/hw/kvm/
-- 
2.21.3

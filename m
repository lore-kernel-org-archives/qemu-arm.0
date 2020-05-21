Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1887918lfb;
        Thu, 21 May 2020 12:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydSMcUhD9sA5v0CUpXSETsa2MvKI0AeCA/t0rmfC7+XBXQNdf6IHqccjLyJIxjom4pkRgB
X-Received: by 2002:a05:6902:504:: with SMTP id x4mr17781630ybs.42.1590091176165;
        Thu, 21 May 2020 12:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091176; cv=none;
        d=google.com; s=arc-20160816;
        b=zWfK5jV8ZD7tHq7j/3CDzGKIxh9f67VjZYI5WlMcFQrcGlHDukUc6pXXrGUnqPvxJy
         wglWH2XQnPinPPQyFHUEEdL4afl370Pdf0pNqwlOt6jUMKmPkZIWm9fAoJXRwbhM4S/A
         +alECABrkH3Q769tM4W5T99njLYE0rmmXZh2cMVAjCakdeG+SrcPijqCxQl8H1/FuuEw
         bm9evgGIiVmKTKTPsN4rRpec1kEIPbm/PKyaM5lek9O6YuYATb03GMnUA97iO7hXnmNR
         bgWSdnqgN9VELFJnAVpkxST/fntflCAzAYAkCcvQ4SVCxeqAxSnOVOvJEGKUXNRr/nj0
         p4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8n0YFO+GkTAJ70YrDyCWQHFcQ3B2rpDJ3HMzik7tebk=;
        b=oHtPDUWzvMV9ipDY0fuj5+HBBA+PfEEJmAJlJ9ON2KH5FzpYXvzQT+ElOCrjyRNHBe
         utqn0N8BTq0uPFGw2EO7z7C1RpJHzLRoCDHeqDb3UaEaZ+4jj8GHZE7ail0DSOozoXE9
         Kp0WYkmc8eb+jGQ65RPz3D4adBelXcpi+KiRz5ZXf8dpfu2D3Wq8XXSkKZxmRotovFBe
         3/iJgOwDWPA/omkRCvhMtSXPasquCfR7a1fCgzBcUuT4bcFrJ5J5NlB0A7OqQaUU73MX
         ss/DB6A3oCVelKfD65771T83d3JB61ROuI2HiApX+0ns4XsNL5IZPknjYLIDj7PCWxqJ
         fPrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uj1W2BQy;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 124si5579297ybc.332.2020.05.21.12.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uj1W2BQy;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8n0YFO+GkTAJ70YrDyCWQHFcQ3B2rpDJ3HMzik7tebk=;
	b=Uj1W2BQyeDPBnEBpdOkXFgwDZEd1B40cv2pszsyece0cQBB4CymXSkY2MoEb1NqS1uv8rV
	3gMdUWDcWHj7INW8Lzpv9OOFEyFrYhtz0zDJpOnuVSwuEFQFad6m9C/FKE9VFDEjpkuoTv
	AZdjGAbf3XE08zs+4P0f4vMCFvWJqpk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-LL0r7VmwNYKX21rPsAuH4A-1; Thu, 21 May 2020 15:59:31 -0400
X-MC-Unique: LL0r7VmwNYKX21rPsAuH4A-1
Received: by mail-wr1-f70.google.com with SMTP id r14so3353793wrw.8
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8n0YFO+GkTAJ70YrDyCWQHFcQ3B2rpDJ3HMzik7tebk=;
        b=ldRiWv/nx7YkhK9gCFoyZfCH2ofn0LEsiHscI338wg3kOdQF1MbDNx8fAbbUCLzhTt
         sSFIYDkmO2bAyVBdHHAbThKBX6AxzSlebC4fSNp/SEG92+WUNGpstrRZbci7hGkO48Mf
         56d8p4h65cAmXJDO0fQUDR4RpGwv+YjeOdnfhjgWOA7ycSKh70zPIh4strzmPek3ykl8
         Ju3HJPsungl+Rh45rOr3YYUQ/W9g4FmJo1K/re17frbZwS0cSUX6WjfxGAhB7Q9xV+Kg
         TXam6lkKFth1dS8iSLhSQ16ANV5faldFlqeZIopuUGY+XEJ7SsoYzhby73DQGCCEE7pk
         CjVQ==
X-Gm-Message-State: AOAM53070dFjvxdSmiTOuk5wPH0uMmDFQAm2l+tPLP8ZJQF2OO7oYzF2
	UlM7hgv3erLZhL+zAo3z3BKiJOJS6VQKwUZ6Gwr23eIr7qNEaGkQiu0bnxxO2b8CBRI2Ovf4k2t
	X4RKOcQEZj1oiUHoy
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr9536027wmj.146.1590091170782;
        Thu, 21 May 2020 12:59:30 -0700 (PDT)
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr9535989wmj.146.1590091170602;
        Thu, 21 May 2020 12:59:30 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m3sm7370853wrn.96.2020.05.21.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>,
	Vincent Palatin <vpalatin@chromium.org>,
	Yu Ning <yu.ning@intel.com>,
	Tao Wu <lepton@google.com>,
	haxm-team@intel.com,
	Colin Xu <colin.xu@intel.com>,
	Hang Yuan <hang.yuan@intel.com>,
	David Chou <david.j.chou@intel.com>,
	Wenchao Wang <wenchao.wang@intel.com>
Subject: [PATCH v3 03/11] MAINTAINERS: Add an entry for the HAX accelerator
Date: Thu, 21 May 2020 21:59:03 +0200
Message-Id: <20200521195911.19685-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: DnEiZ6gelVb3

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
Cc: Vincent Palatin <vpalatin@chromium.org>
Cc: Yu Ning <yu.ning@intel.com>
Cc: Tao Wu <lepton@google.com>
Cc: haxm-team@intel.com
Cc: Colin Xu <colin.xu@intel.com>
Cc: Hang Yuan <hang.yuan@intel.com>
Cc: David Chou <david.j.chou@intel.com>
Cc: Wenchao Wang <wenchao.wang@intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7b98f9878..0f76dc330b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,6 +426,12 @@ F: accel/accel.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 
+HAX Accelerator
+S: Orphan
+F: accel/stubs/hax-stub.c
+F: target/i386/hax-all.c
+F: include/sysemu/hax.h
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3

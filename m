Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp1645372qvb;
        Thu, 15 Apr 2021 05:27:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznC/3ho0TK8NLRbbcriUeS1b2dakik3rZRLEDlPOSPnkl0tSM62863+0mWKe+xbiHHXus0
X-Received: by 2002:a17:906:8407:: with SMTP id n7mr3083152ejx.264.1618489631915;
        Thu, 15 Apr 2021 05:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618489631; cv=none;
        d=google.com; s=arc-20160816;
        b=qkZHvaMv/juXGWeoNvSI7fzuHy5ihNuTpRIZZsb3Bbs2d9u66AR7Wcfm/yusABHIDp
         eiQYemvmwz8HH+ISkbqrGyeirjNnYebl0aiXoAeuX/rm4HjOgTTuQcFvVRUjH5M8oUCd
         72eO1h8923tgNmDmZSZtd0PxGwCgIh1dYHxFPf0ekpMWygmOVs3b9UxEGYsxyvzCNMXE
         bm1cFAg/mu9wWMo9oAphMyGwaGsG1crSC3YghWtBRczQWGSFRPOMneEDpWK6nUkF5IIG
         cfY9Y6J7uB6Unn71OhVN5XorifHIFQ7xlQig/RC+JyD9l0wEhUUD4rL/YuHobhYJFBQP
         J8mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
        b=ECu1/S9dWJdVG+VC780nc1KLWTPv+6vm5yV99Afsf0+ot1AmKeO1pCdk24KZ4ePHaB
         /tuCZViJSQWu+KriQcvRfDslro/9Kl6xV/Ul2vL0G+rxNLvm1TWBqqRiMYYPEEjPEgZI
         M1oduT94VPhQxCHtPEWBisFJG0TzXkgVTf0JhOM7GPeglNkvqaODqfRv56QfnwbyeGES
         eWQHEKFqvcW8T7SoCPNEKF/tJaOyTqLzJcmPXwCkUACw4QfMBVuzqz0C2eu3yvyIGrAJ
         Dh9898ChPMR7u5JrvspUl3deZXtBRygFnL62y1M1GI/mkmkYfnY09fowtBXOoWNkyt8d
         L6qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AfRz/DCP";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id k7si1947798ejr.625.2021.04.15.05.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Apr 2021 05:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AfRz/DCP";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618489630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
	b=AfRz/DCPCaBzJWAD1IZY8Z69tYVE4ZpxKMHxCRtlWoG8b+PcfHEZJ6S0MH1JjrAFBd+nqi
	C86Pw58eIRZzj8NhJoskEM+VFEbJwa3KJsGIgyKBNOoZ02trrkqpZEpowPXjoTrIrGdN9/
	dQO61NfsBapX81Z8zm1u5DeSbIIkKpk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Zud5V6kvMtGs7StqLCVMBA-1; Thu, 15 Apr 2021 08:27:08 -0400
X-MC-Unique: Zud5V6kvMtGs7StqLCVMBA-1
Received: by mail-wr1-f69.google.com with SMTP id p10-20020a5d68ca0000b0290102982b78eeso2693906wrw.16
        for <alex.bennee@linaro.org>; Thu, 15 Apr 2021 05:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
        b=pBLAzRD4+LkZ9kp6yOUZHNwHFnLXwWl0W2/KkutEg/4BuC15UJsuvjl31m6ZyHgbbi
         iK/lhKwzn0CHQGq/DxYYyw6T3NZQIgwDe+gouZSozWhI7Os4Fp2syDWkBQVp58lKefhW
         BEMahwOpUuZB1X62QgimxxdiafG7sBvAu9lmt7p6FtHkphXi/vQGQHqSKrWJH5wB29Oz
         OV/bQtTT0E0Nx807eqEHZ75OCcGUbUv53JKbPhwb7lSR0j1RMyqYZI+3rqIz5vUtMsB+
         J/VyyE7lWUHivG1GY8P6pOOU0QUO9s/TnSMzp6PkTIIRj7iTU3Z69vCY1GHvb3TJd+hS
         gaCw==
X-Gm-Message-State: AOAM532F1ZH27T0PefoGLjjFnI91v5I8UyieSbqbBCZ0xl7OFrTg4JhN
	hTVLxNntVuYwtYc5/rwYxms9lm6XWqn5WSvbv6jgjfvjIvO2rPICAK5K+gffW5jdzeGoZqng3wb
	CuGqR8OhMw3RUFDKV
X-Received: by 2002:a05:6000:1564:: with SMTP id 4mr1781786wrz.197.1618489627064;
        Thu, 15 Apr 2021 05:27:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1564:: with SMTP id 4mr1781763wrz.197.1618489626954;
        Thu, 15 Apr 2021 05:27:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id q5sm3014005wrv.17.2021.04.15.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 05:27:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>
Subject: [PATCH v3 6/6] tests/meson: Only build softfloat objects if TCG is selected
Date: Thu, 15 Apr 2021 14:26:33 +0200
Message-Id: <20210415122633.4054644-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lUJHsXuWdJNg

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The previous attempt (commit f77147cd4de) doesn't work as
expected, as we still have CONFIG_TCG=1 when using:

  configure --disable-system --disable-user

Now than we have removed the use of CONFIG_TCG from target-dependent
files in tests/qtest/, we can remove the unconditional definition of
CONFIG_TCG in config_host.

This avoid to build a bunch of unrequired objects when building with
--disable-tcg (in particular the softfloat tests):

Before:

  $ make
  [1/812] Generating trace-qom.h with a custom command
  ...

After:

  $ make
  [1/349] Generating trace-qom.h with a custom command
  ...

A difference of 463 objects...

Reported-by: Claudio Fontana <cfontana@suse.de>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Include Paolo's feedback:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
therefore o not include Alex's R-b tag.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Emilio G. Cota <cota@braap.org>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e8..623cbe50685 100644
--- a/meson.build
+++ b/meson.build
@@ -262,7 +262,6 @@
                         language: ['c', 'cpp', 'objc'])
 
   accelerators += 'CONFIG_TCG'
-  config_host += { 'CONFIG_TCG': 'y' }
 endif
 
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
-- 
2.26.3

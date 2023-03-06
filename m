Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4393297ejc;
        Mon, 6 Mar 2023 00:47:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/qKzn2gDUYJhZvsXnKTiPhzKPucP0ABSTNWf9Xmaa7IY4KW2zgIW2zGxogCBLDWXncF5/a
X-Received: by 2002:ac8:5952:0:b0:3bf:ba58:52aa with SMTP id 18-20020ac85952000000b003bfba5852aamr16778927qtz.15.1678092439320;
        Mon, 06 Mar 2023 00:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092439; cv=none;
        d=google.com; s=arc-20160816;
        b=gJpc8poGaZ1EYfeoD+O6MfCaDpuWos2UlHVHSyFdjGAHLVxKnVummNhWdH+xXG0jWP
         rrilWdgs288YhcWIZxeKaaXYovIHRwAkHQg0MueW/AFNeS3feoiD9bYt9wKHyAt4Ac5J
         zCOE+3F7Ml/qJgGVelHOFTjUdmk0MMg16B9X2w7gx6C0EVDgmsLwpfcvQsWSydlhvXX0
         hh5ZztfRV+GzU4fZY5qFW8tfRNcoEtF8AYwiY80obeAiDmo1xZyBXaB5sF/5P09DHiG3
         45NTfusq5rlCRlVCh0n8jQyxs6JHcuWpiM8+eIeQl3rq2jDa8icnZfZilOk7uoejTNJG
         iMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4T9cplH6CcELavmnQDL+WvQDU+eNL+kdMeEtlFvM8H4=;
        b=AG3XhtSCUSOVOeJw8TKrTMmtOOsxSeWlq4lGQlt7fevSpSh2ERygiaUkDtizXHduwF
         vPrVPcoKHTtA0W8H/cFLmpmcb/T0jqxLd+OI0F+zlaliP+8ckoAle0npepkrobmD3zz5
         LsqHo1Zf9siXJajMCnWLfwpgpC5bVJudp/ndPhSb785TMiu6Z2GgaYlYzJkHjwFigDHx
         0Zj14/O2e1bRkubKxD0T+1KPpimzgWU2FurYE22dKAVwws33EXiZ8dbEi1RumEXMNTLO
         S1ZMDNj/GMafVFFENCM6tbdtbhgy1I1C+4y3xMMKGLpty0I+4eGzFSbeIUS/zp+FJMer
         u9Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgCOPi+n;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s12-20020a05622a178c00b003b86b2773f1si6883202qtk.330.2023.03.06.00.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgCOPi+n;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T9cplH6CcELavmnQDL+WvQDU+eNL+kdMeEtlFvM8H4=;
	b=MgCOPi+nOnUEBZzKS5X6I2BCMIVhZ+2Ku3A/RUeLFb7L9fsR7/z5kSGbL2uFDCjHMhvpyE
	YxqGaZgF2wvYZ99pRF43OFINYURJKa6OF1o38qcJJe3/A6YZtDIe5Z1iMN26fwkrUoakKE
	iV3UqnDcX2BLepGp5Xkx5hy0GeeKbh4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-DmKCntfRM1qxeZT9MJ-5Eg-1; Mon, 06 Mar 2023 03:47:16 -0500
X-MC-Unique: DmKCntfRM1qxeZT9MJ-5Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 188F43813F2F;
	Mon,  6 Mar 2023 08:47:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92FC3175AD;
	Mon,  6 Mar 2023 08:47:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 5/5] gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
Date: Mon,  6 Mar 2023 09:46:58 +0100
Message-Id: <20230306084658.29709-6-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: SvyISXw/NHbW

Hardly anybody still uses 32-bit arm environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index a25cb87ae4..61b8ac86ee 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,13 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
-cross-armel-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armel-debian-cross-container
-  variables:
-    IMAGE: debian-armel-cross
-
 cross-armel-user:
   extends: .cross_user_build_job
   needs:
@@ -15,13 +8,6 @@ cross-armel-user:
   variables:
     IMAGE: debian-armel-cross
 
-cross-armhf-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armhf-debian-cross-container
-  variables:
-    IMAGE: debian-armhf-cross
-
 cross-armhf-user:
   extends: .cross_user_build_job
   needs:
-- 
2.31.1

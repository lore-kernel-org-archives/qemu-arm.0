Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1106771lfg;
        Fri, 5 Aug 2022 08:20:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4F1cJC58+zHxgIQEg2OvX3CFwNDi0oqxQYrB8anciGlK1di4kdc0WfeCrzCYHk8ljDGI6y
X-Received: by 2002:a05:6402:2753:b0:43a:d6f2:9839 with SMTP id z19-20020a056402275300b0043ad6f29839mr6828425edd.73.1659712830586;
        Fri, 05 Aug 2022 08:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712830; cv=none;
        d=google.com; s=arc-20160816;
        b=GK2l4PhU32oGyCA7veSrFQPTfP+/ePXmMhebC/u/rnyoA8MrgNxIVxymqyA92E60w5
         b/9U+93zltvXXEZf3YP/A/US5Pp9S97E6k1+ef4ideI9CmZJ9C/5nhD0yDkv/1cdN34M
         oD5/j2jiiTGV+h2xhSP67x6BV1qIzoL5cKEC3DAHnEsLHimRNrHt010+FGU/upGUA9q6
         vXTChq2jH3LsHAI7HS1vFGTT96Wn1Yq34vC7CnVqEZkKnsg7g5c4Hl04HGMbyIvD7WhC
         ovQF7hkcaDF249YQupZ61sYp58IgSNM0XdxGEq8ZIHXhArWHYTN0ibyHAZDOe5KbWOz7
         pu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4tbOtoX+okfrNQpn+JtCKcqsZHP3f6wk1WRWkOWk6Cs=;
        b=onI8LZ6/tfIc+9mIIcHZHs3G6fI5iCUV2ypom+Rp3sNt1jSuA2/9ncK40rFzqHsTMO
         QyxnGotbGGuFlGI+0Ajn4Mz+rwTqNrH0CgmcjSy/ea2Vgc0h2pPR6G0rmOjhwTLYTN/q
         fhGfOGM52nXH0KXd5gZ8d7xfbZkx/oEybmiytjVSP7vx6aHP9mWpH7xAIYFaqeIZ/MEU
         IZOVJQiBybORZYadDPqALOb90/PQF4PgSFktvQ0OS3DO7iE5Ct17O0EQNnVtw9At9M0Y
         KULIXyYvJQZm7bImmp4c5NFxTlTIiBl5lvooXno+O+gD0DGXQteTMeEukEy84Z2yo2yB
         ZNCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ejeEFG/0";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cs14-20020a170906dc8e00b0072b8311a17dsi1937317ejc.310.2022.08.05.08.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ejeEFG/0";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tbOtoX+okfrNQpn+JtCKcqsZHP3f6wk1WRWkOWk6Cs=;
	b=ejeEFG/0PtraZNBfq5XLyDf02Z45R3Uo0YqfM+wuBARI3NiIrWti/loga4L1eK1XQIeI2Q
	1PE1wtAWlBY57ckYoY7eOzkz2rIGcwZ4DdGPaARAv+GqxpYYJZbCfQa4yMVfVdjutCHdot
	B32uuunXvs4m6dDqJo2LM4e5WNRChts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-m06YNuqTOc-EoHGLVZ7PNg-1; Fri, 05 Aug 2022 11:20:26 -0400
X-MC-Unique: m06YNuqTOc-EoHGLVZ7PNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB39D101A58D;
	Fri,  5 Aug 2022 15:20:25 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8D532026D4C;
	Fri,  5 Aug 2022 15:20:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 1/6] docs: build-platforms: Clarify stance on minor releases and backports
Date: Fri,  5 Aug 2022 16:20:09 +0100
Message-Id: <20220805152014.135768-2-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: qTNXpkGeTUUL

From: Andrea Bolognani <abologna@redhat.com>

These changes match those made in the following libvirt commits:

  2ac78307af docs: Clarify our stance on backported packages
  78cffd450a docs: Spell out our policy concerning minor releases

Since QEMU's platform support policy is based on libvirt's, it
makes sense to mirror these recent changes made to the latter.

The policy is not altered significantly - we're simply spelling
out some rules that were likely already being implicitly
enforced.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/build-platforms.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 6b8496c430..26028756d0 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -71,7 +71,10 @@ The project aims to support the most recent major version at all times. Support
 for the previous major version will be dropped 2 years after the new major
 version is released or when the vendor itself drops support, whichever comes
 first. In this context, third-party efforts to extend the lifetime of a distro
-are not considered, even when they are endorsed by the vendor (eg. Debian LTS).
+are not considered, even when they are endorsed by the vendor (eg. Debian LTS);
+the same is true of repositories that contain packages backported from later
+releases (e.g. Debian backports). Within each major release, only the most
+recent minor release is considered.
 
 For the purposes of identifying supported software versions available on Linux,
 the project will look at CentOS, Debian, Fedora, openSUSE, RHEL, SLES and
-- 
2.37.1

Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2245120ejx;
        Tue, 12 Sep 2023 11:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBN7ZlSdirmslG9CXn9zhvci1SaA4oiDsD9jbAxa7o/urSmUFAZMvIjWepYaLPIfnFmCQ3
X-Received: by 2002:a05:622a:296:b0:403:ca55:6ac5 with SMTP id z22-20020a05622a029600b00403ca556ac5mr108813qtw.18.1694544105048;
        Tue, 12 Sep 2023 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694544105; cv=none;
        d=google.com; s=arc-20160816;
        b=PSq9iSJDwn8HH+tRl3284B/kET8izyyYiTYWICz12zqq3NMqnR0rG857VXAfPPSN5z
         ka05CFQsi/ZxWlc6Gq+LUzNHmdo6QgUs2LCAEDq03a+Ta19AfAgOo4YneIZR9quK0PJv
         LZxUzSmN0RaW0UEvaCbhW7s5BwGRhKo7j8WgDfNpL6oa5FRJhgJ0+C/WR9j5Q73hkHgG
         spk1UVjbH6/lhcfZeMHtinljYpZmaO1ew7gMIL8s0Y814A+DOvW5nk5OaWsE79FTfELu
         ACvwPaPLUarMT3rohBB0yYPDg3JXhO5MaGpAnpexqy3gI6GGje++L5EPfjfTpIaehxrj
         f4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vrKTV5q71INoyKwvAjiPZ+w9+kylVYW0lrRSYUV0Cfw=;
        fh=7i2B42VHusWKsnJOPWSYnjvVgBurff/6q9zEPTejEek=;
        b=Y3l6mL8vDYtoeZlbLd6VB1cag2lt3NSi3Q627jCi6xg+mMw7+GNrblThUyU7lsCMed
         HQjPp0+PkLL1uv9R5WPZcbUBd68xy6evy3cmbEZTqdzIoCUl9iCmYPXiDBPlQPNESUab
         XtLNOyABq0RleONDGrRR9+aI1HC+OgzoDnIIQMMPqlFYLkOj5z4sKXfbhZjVkUpyf/ru
         V+0dv7mEcjDeQsSm3qjclexTYxeN1DJC4KWknD1RTuzsY1qxHJsB0XZaAFrVtHZloNeS
         G5FtZOfeJC4/rZOwziuevNLqImWWchHuAxaBR4IGOtk3jT3GeIX0kxg2gAp5umLIyqu5
         FlTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fanx6iSB;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s15-20020a05622a018f00b00410a39d766dsi6879056qtw.161.2023.09.12.11.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fanx6iSB;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694544104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vrKTV5q71INoyKwvAjiPZ+w9+kylVYW0lrRSYUV0Cfw=;
	b=Fanx6iSBbvd+IvDrOThH+OVZFUbY+6P3guyXa/tlFnIgrTLByLB6uyfFkTqxfilFsWzK2j
	v+etkNTlkEPJiJg9xuS35YBy6+UPS8xfNY7HH09WPKj9BGWsTWB17CqHV69H3adVHPgu9i
	YrriOdgQYps91+nTF/D8VRh3zpQJomQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-nHacdlGFPt6vjqe_z6T_xg-1; Tue, 12 Sep 2023 14:41:41 -0400
X-MC-Unique: nHacdlGFPt6vjqe_z6T_xg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB74D8564EF;
	Tue, 12 Sep 2023 18:41:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E05A7B62;
	Tue, 12 Sep 2023 18:41:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/4] gitlab: make Cirrus CI jobs gating
Date: Tue, 12 Sep 2023 19:41:30 +0100
Message-ID: <20230912184130.3056054-5-berrange@redhat.com>
In-Reply-To: <20230912184130.3056054-1-berrange@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: GlmDEYBeWdhW

The Cirrus CI jobs have been non-gating for a while to let us build
confidence in their reliability. Aside from periodic dependancy
problems when FreeBSD Ports switches to be based on a new FreeBSD
image version, the jobs have been reliable. It is thus worth making
them gating to prevent build failures being missed during merges.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 816d89cc2a..e7f1f83c2c 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -19,7 +19,6 @@
   # as there's often a 5-10 minute delay before Cirrus CI
   # actually starts the task
   timeout: 80m
-  allow_failure: true
   script:
     - source .gitlab-ci.d/cirrus/$NAME.vars
     - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
-- 
2.41.0

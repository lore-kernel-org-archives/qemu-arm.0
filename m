Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2245096ejx;
        Tue, 12 Sep 2023 11:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnl4UtiE9XBEzpDXlhyB5Hb4obpqejlqn2nXFQTlN8eZiiUN1I8TZSXlDlV79dbsnTT55h
X-Received: by 2002:a05:620a:4627:b0:768:a183:a8e2 with SMTP id br39-20020a05620a462700b00768a183a8e2mr314380qkb.50.1694544103006;
        Tue, 12 Sep 2023 11:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694544102; cv=none;
        d=google.com; s=arc-20160816;
        b=0WgjVeMNBut6ZlIEhEs/VTwrNByIDvYYdqh3LjDgupPTOB+0j1B0b9/Tn6loeDJeDk
         lD+vVoCtEAK7+ORgLbE2m0WppvnvsNjTB+zJfHRzAudQYrPP9k8F6jJ25LpIqcZoem/+
         fMRaa8wMGhM0roDk+SjJAMq7VQKjAsNLaefrLgw35HEguIw+fSkM8+Qr3yR/vmPrx/km
         icpzSUX7FxrOGDk1VKm7+r07iO5dUohd1P4agI0/Cl7QCtsHEBo7yApEUAQk9BUZi9gx
         ZZaor76RAxW1USBVzp40X/PVolIWGMPvOQ9+NyUNsU9fHz9x5CI8xyyiKvwTL+IHGnso
         wcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iSs2QBVfpISQpVZYsjcitJoFfqKja+Hxwecaxyub818=;
        fh=7i2B42VHusWKsnJOPWSYnjvVgBurff/6q9zEPTejEek=;
        b=L9uUmhiYfrE7TY5Lij3oHAVPBPVHhsBjjb47NWyuWDKty5RujF1l4zVllaFOBwQwer
         z72t7IVwbZeZIdLZHh0qh8/3pGzlfHixi/zdhVb3Z0J7nMeNZBiHUuzKUnP467tj9v4m
         OyjZZDKHeaoIdUoaAO6Gusc0OLVItS8w+6hs4SVBXMkbatx7SZskiHuM2ptHuJXC9X4G
         Hs07G42H5jxTmdMgOurj2CBjzADwYEHk1024FuM11MJaDcSDRDuXrXd5iwSVPaDLPhp3
         KU6TxSS53P0XkmppHbFikK6k3WJHSEGJ3WiP67jOAmNtgIFbpXiyvCkkQJZAOLruwu51
         W3VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWhC9nVl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f6-20020a05620a408600b007684220a090si7049141qko.318.2023.09.12.11.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HWhC9nVl;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694544102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iSs2QBVfpISQpVZYsjcitJoFfqKja+Hxwecaxyub818=;
	b=HWhC9nVltV86XNGnwxIIOTGtms7Xj/p9EGjBmyWfm7VnT+3PgXF08kO828QBOb5YM/HBqo
	6cigPGbPsXFEDkww4Bpyu+SfUyPtTSGJq6o5IfVXxkEnySGWpWIbhD7FCltAsDydfRnFOO
	cxWR7MVkgynAtrrEnqjdNGVuVJ1IGA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-kTih-M9sNDKBb90aD0gAFg-1; Tue, 12 Sep 2023 14:41:39 -0400
X-MC-Unique: kTih-M9sNDKBb90aD0gAFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E40018945E5;
	Tue, 12 Sep 2023 18:41:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57C237B62;
	Tue, 12 Sep 2023 18:41:37 +0000 (UTC)
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
Subject: [PATCH 3/4] gitlab: make Cirrus CI timeout explicit
Date: Tue, 12 Sep 2023 19:41:29 +0100
Message-ID: <20230912184130.3056054-4-berrange@redhat.com>
In-Reply-To: <20230912184130.3056054-1-berrange@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: heh7/P0dVP+3

On the GitLab side we're invoking the Cirrus CI job using the
cirrus-run tool which speaks to the Cirrus REST API. Cirrus
sometimes tasks 5-10 minutes to actually schedule the task,
and thus the execution time of 'cirrus-run' inside GitLab will
be slightly longer than the execution time of the Cirrus CI
task.

Setting the timeout in the GitLab CI job should thus be done
in relation to the timeout set for the Cirrus CI job. While
Cirrus CI defaults to 60 minutes, it is better to set this
explicitly, and make the relationship between the jobs
explicit

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus.yml       | 3 +++
 .gitlab-ci.d/cirrus/build.yml | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 41d64d6680..816d89cc2a 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -15,6 +15,9 @@
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
+  # 20 mins larger than "timeout_in" in cirrus/build.yml
+  # as there's often a 5-10 minute delay before Cirrus CI
+  # actually starts the task
   timeout: 80m
   allow_failure: true
   script:
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index a9444902ec..29d55c4aa3 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -16,6 +16,8 @@ env:
   TEST_TARGETS: "@TEST_TARGETS@"
 
 build_task:
+  # A little shorter than GitLab timeout in ../cirrus.yml
+  timeout_in: 60m
   install_script:
     - @UPDATE_COMMAND@
     - @INSTALL_COMMAND@ @PKGS@
-- 
2.41.0

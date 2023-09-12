Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2245040ejx;
        Tue, 12 Sep 2023 11:41:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvqr/fOo2leX7xMLWNN5VgkDfyT299+S0dYtmcmoaAGH+zgH5mgKLxtx7Ivl1RB/EFWTX5
X-Received: by 2002:a67:eb85:0:b0:443:6deb:2b4 with SMTP id e5-20020a67eb85000000b004436deb02b4mr181430vso.2.1694544097654;
        Tue, 12 Sep 2023 11:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694544097; cv=none;
        d=google.com; s=arc-20160816;
        b=OUQ/Bp/2CTiD6BS7aM38D6gRN4PUU6PxyU55wVYRslgjWGMB70eIV997TA5Ai6n66v
         EooXqv8nSI8Yd1W4Wx/Z62aV+kVVttJqSFzXr2nVAALY1wSOEZVjLKM0LdFH1Rs5q2M+
         qA2jEye/SlXISxjshxWX5IUwnOhYW41c6F37tzX2q3hl49KVd2pFKcWIEy1GJ8ZjZ0NF
         9H5Vv5kCEfGS6LK4oE1s6vGFH2OJFqg+vMEOEIuh3g74WWK+jOq/kCg0tApQstKIjp7P
         UgqjTCfwWAH3t3KLcrbQwTZgt3hE+BChueo1uFkGAVgp9YHc0oMfuncXd+WTxk9GkvMz
         r7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bo9Uiv1EmC7M8BwF7hgw+6ty93Fh7YrMdKE9xud24qo=;
        fh=7i2B42VHusWKsnJOPWSYnjvVgBurff/6q9zEPTejEek=;
        b=hetJE+cKn4eEAwnWtnGzetMAg9LDq9y0iSjSjuctcvU91hnZuenja21JpWH0TIMKMv
         1JyfGmV0EVb1EbfqBCTZ0Utb/15Gapj1oOsswXeE7bg8xV6bO4d2rYAicbcLP3PwCefd
         caxF3NwpUj3W6XNY9xanRcDHznxsAcy7EgRMMuhetb2ztOFzsC2u4cg3oZemk6kET/Gm
         N7UZ2mmIhuTuQjiQlnEt+KAT/nFOmo/PGmaAhQ8f+WbvwdylJrigu3mTfBNAaijdW5JZ
         FowOMzDyaG1Vje5HyRwaHoiOTrFbsV4EcwYlgfFP+bMYuaupX4ZYyhCARmekw6pf2E+T
         YhwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PwgCdjlE;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bq18-20020a05620a469200b0076d9eba01absi6888166qkb.399.2023.09.12.11.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PwgCdjlE;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694544097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bo9Uiv1EmC7M8BwF7hgw+6ty93Fh7YrMdKE9xud24qo=;
	b=PwgCdjlEARrTtcrfCBsgu8GBQhpEXWhwstsaem05RrIBR/2vBs6K6S2VtIJEsGMGmNKi3Z
	yHspsjqSIEG059e2aGaxMJG0aAuyR2/srpRr7/SHwH/x6Ow83AFsQvh8T+P+etPgRQY4m1
	CFDSM3iyB5WmiWBTuZq0qSyI7KT6o8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-Y2vsYIVyNMaCZomFngDC0g-1; Tue, 12 Sep 2023 14:41:34 -0400
X-MC-Unique: Y2vsYIVyNMaCZomFngDC0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73DE0805F6B;
	Tue, 12 Sep 2023 18:41:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C00D563F9D;
	Tue, 12 Sep 2023 18:41:31 +0000 (UTC)
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
Subject: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
Date: Tue, 12 Sep 2023 19:41:26 +0100
Message-ID: <20230912184130.3056054-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: hNWk0oDjDu6z

This addresses

  https://gitlab.com/qemu-project/qemu/-/issues/1882

Which turned out to be a genuine flaw which we missed during merge
as the patch hitting master co-incided with the FreeBSD CI job
having an temporary outage due to changed release image version.

Daniel P. Berrangé (4):
  microbit: add missing qtest_quit() call
  qtest: kill orphaned qtest QEMU processes on FreeBSD
  gitlab: make Cirrus CI timeout explicit
  gitlab: make Cirrus CI jobs gating

 .gitlab-ci.d/cirrus.yml       | 4 +++-
 .gitlab-ci.d/cirrus/build.yml | 2 ++
 tests/qtest/libqtest.c        | 7 +++++++
 tests/qtest/microbit-test.c   | 2 ++
 4 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.41.0

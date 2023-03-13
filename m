Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp170041ejb;
        Mon, 13 Mar 2023 04:45:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set/hK1nmEtBH/0cmWOl9+xQn7lUgXioNCC5CNiFyZ5OZQSDu5DO1jZ3nHeAHxZaPgVQHNmeP
X-Received: by 2002:a05:622a:58e:b0:3b9:bf7f:66ff with SMTP id c14-20020a05622a058e00b003b9bf7f66ffmr55651494qtb.67.1678707908236;
        Mon, 13 Mar 2023 04:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707908; cv=none;
        d=google.com; s=arc-20160816;
        b=qvqQqOFXDfFy4oK9ZyRh59JMx+FvVNW21XtYV544f1ur/VCeCealIw1SA0K/il1/ue
         DT2S3XsgTbrRBJLkR4wbluU2joxNS7HPnJeKXb+IN6lnWkkTrw8Q4onOxQcxl1KxLqDI
         HTYMauSr9QfpFStMIEg0gmj7oKGw+i6AFqTLudw83Ig5O8oOE0iJzpJ7xY03UHxqrbtg
         hUn2tHcJhXPSoNKNup0oxtGsCnnK5kGg2qjIDXmThC5kOMwEoYoifco/uCk9tFWI4Tl/
         sgSuESeQSCFMcStt30jLOxIJCQL4yEOJWLudgFTLuCQfgGxnjx8Jh2mpvpfEss+iCwxd
         9ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QZYS21+hNTFE8tMKucJRzMuigz/ZedT2zkBrAltxQo4=;
        b=AyNuUoWcRoHSrHmrovthIeYsFYU7NgXPsVdgZmQoClfoc9yqbVBkV9H1ptC5rgC4bd
         e5p7ckOYsX4XQs0IqKzCdzYWa2mTUR5Sdx694fNpjhQXd/q2A0nFxuNGXI26IPi7LzPM
         XyLM6j70nA55n/sTlkbmAJJFn/6agHowMr6SrrCeyZSmd9FIhgOkzpF09WYTyoC0tN08
         90Fwu4N2inyWMpjbTKv7hfvfMnY+E2duDVCltndUUdrH9hYcZmd+Z42aKIqk8H7PlQk+
         9LHyWbSV+1Ag/SwjFUQqJE+0sLpagHRVqDdwRhgjkRRrgiI/StUB6zuLQ0ajk1I6TIzB
         fOpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MScpjjC7;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f5-20020ac80145000000b003b9ba906cb4si4761276qtg.538.2023.03.13.04.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MScpjjC7;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZYS21+hNTFE8tMKucJRzMuigz/ZedT2zkBrAltxQo4=;
	b=MScpjjC7usfBW3DMxM6LMd+lxqd8pG2P1gOpKlpjwbp5T5AZblzrDnxY4yfPrSJu7mFrc0
	Xm0on63dLnQZreXlUAXFgnE8YjrO5WBxkgHoK3ohQdLy3ln/C0zgAlmY0n/Nh7ethc514d
	hOe5e7WUkDCWdgyytbNhDot8JKjd5vc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-aORot--wMna6Ri3DH7P2gA-1; Mon, 13 Mar 2023 07:45:04 -0400
X-MC-Unique: aORot--wMna6Ri3DH7P2gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28E8A299E758;
	Mon, 13 Mar 2023 11:45:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E07A34042AC0;
	Mon, 13 Mar 2023 11:45:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 18/25] tests/docker: fix a win32 error due to portability
Date: Mon, 13 Mar 2023 15:43:28 +0400
Message-Id: <20230313114335.424093-19-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: dRVh/70QSg8X

From: Marc-André Lureau <marcandre.lureau@redhat.com>

docker.py is run during configure, and produces an error: No module
named 'pwd'.

Use a more portable and recommended alternative to lookup the user
"login name".

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230306122751.2355515-4-marcandre.lureau@redhat.com>
---
 tests/docker/docker.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 3a1ed7cb18..688ef62989 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -23,10 +23,10 @@
 import tempfile
 import re
 import signal
+import getpass
 from tarfile import TarFile, TarInfo
 from io import StringIO, BytesIO
 from shutil import copy, rmtree
-from pwd import getpwuid
 from datetime import datetime, timedelta
 
 
@@ -316,7 +316,7 @@ def build_image(self, tag, docker_dir, dockerfile,
 
         if user:
             uid = os.getuid()
-            uname = getpwuid(uid).pw_name
+            uname = getpass.getuser()
             tmp_df.write("\n")
             tmp_df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
                          (uname, uid, uname))
@@ -570,7 +570,7 @@ def run(self, args, argv):
 
         if args.user:
             uid = os.getuid()
-            uname = getpwuid(uid).pw_name
+            uname = getpass.getuser()
             df.write("\n")
             df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
                      (uname, uid, uname))
-- 
2.39.2

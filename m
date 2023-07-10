Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1234780eje;
        Mon, 10 Jul 2023 07:43:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGROrIbr3mEu4m1P4SgO1tLL/eg3yaJTN86TiEpvmhGSC20CqrmnXkx8RwNeSH7ZCwv+bcr
X-Received: by 2002:a05:651c:120e:b0:2b6:364:c153 with SMTP id i14-20020a05651c120e00b002b60364c153mr10172272lja.14.1689000239193;
        Mon, 10 Jul 2023 07:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689000239; cv=none;
        d=google.com; s=arc-20160816;
        b=X9KtcSxWip0ZLZNR/nO3xUDOiceS6SeoCDu5SK9sozLdVYlMSH191bEd2TyADUfi1r
         rEvdFuGBk+Ig4TrG78ggfWcirHrZxes7CZ0fPcw5ACuFBcs3aKz+LrpDR9DJBj+6+7kD
         /Lm7sjZvF2KL9QxxYLaOqJDzLQxvnWNEQ+5XmdlCc5wq3pnNnnh+EiNACwBwUkIMfBuH
         sAxcWS+rl4w8rdWdkmSV/SmNntAiwsKXucF0ZD6aDli0fa3if3lix6bZofjRCwqR5byB
         VqnJE01tPvRHA0lrXiYR8R93dqcP/ms9VJXE2mJXyEGALN0cSpxlpdH4pTVPVox3uLhP
         k4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=G9CUH/m+5jlDaSFhHEKdWJHdVH3B8QyEjDC+cZwzD2s=;
        fh=OVEh+urGVizzbIt239QAwBs4Ae3sQ66TQvb6MmztEd0=;
        b=uQUPSpmdi+znxcVa5I7EKnXWrnG0FF0S3G/Tkp4A5xWrtUwDWdIFyFOH6VeuEjmZ6g
         H+KteAAmMASDz7Ma7xv6PNUGOF4gjLnc3vH3PrGhUxNNmAVbuxvO4AC0o2xbOw2NgsWZ
         06rIgPZnX7WOlyf/MHI4o31SF8ZoyPg/9GgWYWdjeHnnX23d6OvQunbyuIP/I4xG2EzC
         BrNK85AJxwjLi388PXb64M80PP38Ufn+hn+Blbjvh8+v1Ap7b+pXgcrR0SXs4nrSZT5i
         wW7d0gGQEzHXPAGKvQN078GgivgIZN0KE0d2j0Ad6DYG5S3GAEKfVpsNL+sbVcfne3db
         9UUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BauxZN/R";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dx5-20020a170906a84500b00993321873fesi9923408ejb.665.2023.07.10.07.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 07:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BauxZN/R";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689000237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G9CUH/m+5jlDaSFhHEKdWJHdVH3B8QyEjDC+cZwzD2s=;
	b=BauxZN/RP9HkBKyjC0vA1cOpDLuJRaUC8PqIQLgUI02zUPPmpLOhxNCHvKi86WJhPgmNuz
	TMfAuPsNp2Oghk3D37p2KPG1nfc0FRqF84BYh6eHgiF5N7AeBhIrPfMHLZ28M3+yF+IUj1
	j8ZlWr7c8iA9H6DtxfrbHzREnKYB3vk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-pMJMDJDUPzCcJrVQoHyJ4Q-1; Mon, 10 Jul 2023 10:43:54 -0400
X-MC-Unique: pMJMDJDUPzCcJrVQoHyJ4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22DC81C05140;
	Mon, 10 Jul 2023 14:43:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93BE340C2070;
	Mon, 10 Jul 2023 14:43:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>
Cc: Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests/avocado: Disable the test_sbsaref_edk2_firmware in the gitlab-CI
Date: Mon, 10 Jul 2023 16:43:48 +0200
Message-Id: <20230710144348.239441-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: GaVkid/BGjNA

The test fails occasionally, see e.g.:

 https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489
 https://gitlab.com/thuth/qemu/-/jobs/4623296271#L290

Disable it at least in the gitlab-CI to avoid failing CI
pipelines due to this problem.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index cce6ef9f65..dbd364b537 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -8,8 +8,7 @@
 
 import os
 
-from avocado import skip
-from avocado import skipUnless
+from avocado import skipIf
 from avocado.utils import archive
 
 from avocado_qemu import QemuSystemTest
@@ -76,6 +75,7 @@ def fetch_firmware(self):
             "sbsa-ref",
         )
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Test does not work reliably')
     def test_sbsaref_edk2_firmware(self):
         """
         :avocado: tags=cpu:cortex-a57
-- 
2.39.3

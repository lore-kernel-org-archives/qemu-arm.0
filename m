Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1028032qvs;
        Tue, 13 Jul 2021 14:22:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLCTbzlBqdJoqV599LXWbe9Px48+r5nlyVdkKlUdUOdKnp88MhkyYGs+pswmZsBkmSi10y
X-Received: by 2002:a05:6402:53:: with SMTP id f19mr8441101edu.200.1626211344253;
        Tue, 13 Jul 2021 14:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211344; cv=none;
        d=google.com; s=arc-20160816;
        b=FdCwrPlymfqHVrSfeqiYL27OETyJJA0rylBMDMfIX3xuJLx+rCJsbNIj78hOrlQG8h
         3UDcqmgKw6SKeJhr2HJiGzF3XNciArkiTOkdGP1+t6wqkjrPvr3b6rmijA5sB9UFkf4E
         3ZhzJWULoIcYIyq50EloyTa4c3l09dkwAHJWO/BNVDbHGAoFMhoDrKKsSB3yi2iXAsv+
         1g06/NYizA2E44QTVD8znpxVIGwdfIJnD3gq7yDCdaqF83B9WCa0ZiHjKGvWn2HXL87f
         XtYrKLlvCcTlsvbzR1xZpfcPyYiRZFTCt6uL+RgMrDj8O0wEPrSXcJTf22NvOtkpss2T
         AScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OE0RXGHiytwQOy8y8co9KIBkuupfuxKbiZAGpPKU0pk=;
        b=D8wicZg3l5SFX/4NE/HdJU3ea/B7cBW5xbDkCRjiRRO2SjxlWc7wqed+1A12vziG1g
         w/yQhPwF4RClsc207nr4Je7JM8gYpbkdbX5TjTHA91/2ppGvoZpNuxx8WSTJk2huF/Mn
         j81RivosF4+vze1WXGJn1bW9WFcoAODAC5lNgMJ1AR9BIBmNbGawYUfiMIHGlYjavDdL
         YQ0k9upLIlr4A2uYVXq3/ByuS/3RWPtMdQB1lI2pGO3uZ8S+SSKN/cIX/E96oJDr0I0f
         NpN2Ke1fExOo4/P6SiqWjFoiFcJ+q9qBqb+GT5j9J36xwPzAXGzaWtoHXFtfHthXtaG2
         inew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P42DE2dy;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z1si16991865edd.187.2021.07.13.14.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P42DE2dy;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OE0RXGHiytwQOy8y8co9KIBkuupfuxKbiZAGpPKU0pk=;
	b=P42DE2dyzzi21cJTvpIC86HSIyrFCXwlAk0il/FNRxHsbYryvZeGhTphnr3LqoVLUPltIr
	0xGU0Ioy4RGouHaxKO4fGM7DCHwK+FYyPAwfGyrr/83mcj9rk0RVod3rl7hARiPaE2zMxP
	ABcOIZu2IiAjwb3Gzu1T9BzlqBJjGII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-SId_0mjvMMmD8Kj80f83yg-1; Tue, 13 Jul 2021 17:22:20 -0400
X-MC-Unique: SId_0mjvMMmD8Kj80f83yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D114100B3AE;
	Tue, 13 Jul 2021 21:22:18 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B32F19C45;
	Tue, 13 Jul 2021 21:22:16 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 23/23] tests/acceptance/cpu_queries.py: use the proper logging channels
Date: Tue, 13 Jul 2021 17:19:23 -0400
Message-Id: <20210713211923.3809241-24-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: k3YfCKy3c8kJ

The test contains methods for the proper log of test related
information.  Let's use that and remove the print and the unused
logging import.

Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/avocado.html#avocado.Test.log
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210415215141.1865467-6-crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/cpu_queries.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
index 293dccb89a..cc9e380cc7 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -8,8 +8,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-import logging
-
 from avocado_qemu import Test
 
 class QueryCPUModelExpansion(Test):
@@ -27,7 +25,7 @@ def test(self):
 
         cpus = self.vm.command('query-cpu-definitions')
         for c in cpus:
-            print(repr(c))
+            self.log.info("Checking CPU: %s", c)
             self.assertNotIn('', c['unavailable-features'], c['name'])
 
         for c in cpus:
-- 
2.31.1

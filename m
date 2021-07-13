Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027754qvs;
        Tue, 13 Jul 2021 14:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVFC5vA9CH8uRtuEq1a5LOVdn+xY8Ss1iSB+pou9tmNW9SEjgtU1SLwoUyL7qB7ySaXYsZ
X-Received: by 2002:a05:6402:18c4:: with SMTP id x4mr8432979edy.350.1626211318284;
        Tue, 13 Jul 2021 14:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211318; cv=none;
        d=google.com; s=arc-20160816;
        b=IjgChnHMV5SS8vMs4nXyu5woKI/Zx8GR3RDEddG73PEjsE0huMTHvO7d1Mvla3r3/G
         xIS61ROKZt4iOZq1hTE1f2yAM6gFyb5vbshhDAnHe+Orkz8GpOQEoluE+vSj2hdfaSXD
         lZIpjV1boSE4Xa9V/bply698G647SCqSG2aq9M6GGVKdS+rnoks/94zKjfZG3TIWc/am
         WsYYSpqoPay0RkfNCKqyiUOqeGP4eB+gFxB82uQ0mbAtn9qlMrBvUIKHoIfrWIC3jLQ/
         mcSQy30otnSjDAHhbKHlk9+xqEjYOuPC/K1pO4CGamwM4Ui2pLwRUy+qM0lPzcXuRgBm
         9B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lMX7ki4cnbCXlmpVeEr19Jl9NrQG84YK8sEiItrl4SU=;
        b=zjJ+Vi0aobw0jIDQKR/NBYDMlybnMZmc2WSjg10huk3qtjlVmNqG2uMK3ezjtULhsx
         sFl8HG+7JUCZF/Z0t/PE3aCNW708uXBZQ9tO0bCkDyx/te3bxdXSMUEy7kzCTlEHG/pz
         QMqfEIGOJiW+6qTvMSEAaSofU1bKidFW5bGRn+KBBshQ0nOAyS7eyaWt35y1zoEEW8Tj
         1lzDYhtsFUbybaHjYqg3UDbBJfdQFusSEiL6p5UHcPkrFz9cm7KyFCOSNB0ZJtSPRArj
         q7AcLQaH6DqnIATx8IMH8IlXmyHnmNdY25ri7QELSUq8+BhpmqWLRuj+WZqQXoGLstLx
         bwZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Dl/IGe1N";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id i17si8116352ejx.581.2021.07.13.14.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Dl/IGe1N";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lMX7ki4cnbCXlmpVeEr19Jl9NrQG84YK8sEiItrl4SU=;
	b=Dl/IGe1Nk7G8TeFdChLt2u2unzAdWTGLKozOhvJZR6jdElMUHnpGS9WSvCXRDnRyRp8GDf
	pAvslP47mpbs78Rnwzc1rOuBcV9zd1tnPV0q8TQ96WLf73ECQ2zDL42kaGn0Gh8j1o8I9x
	fB3hTfS9LdLns3ndwzyWIxsiJHEizGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-scmEGFtzO_uDP9e8vNDNPg-1; Tue, 13 Jul 2021 17:21:55 -0400
X-MC-Unique: scmEGFtzO_uDP9e8vNDNPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC081084F4B;
	Tue, 13 Jul 2021 21:21:53 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9203E19C44;
	Tue, 13 Jul 2021 21:21:39 +0000 (UTC)
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
Subject: [PULL 17/23] python/qemu: Add args property to the QEMUMachine class
Date: Tue, 13 Jul 2021 17:19:17 -0400
Message-Id: <20210713211923.3809241-18-crosa@redhat.com>
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
X-TUID: VIY488gHKrdf

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

This added the args property to QEMUMachine so that users of the class
can access and handle the list of arguments to be given to the QEMU
binary.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-6-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 94846dd71b..971ed7e8c6 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -316,6 +316,11 @@ def _base_args(self) -> List[str]:
                 args.extend(['-device', device])
         return args
 
+    @property
+    def args(self) -> List[str]:
+        """Returns the list of arguments given to the QEMU binary."""
+        return self._args
+
     def _pre_launch(self) -> None:
         if self._console_set:
             self._remove_files.append(self._console_address)
-- 
2.31.1

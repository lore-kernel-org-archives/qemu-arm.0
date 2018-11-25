Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4706158wrt;
        Sun, 25 Nov 2018 12:50:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5ebuDln0RWKj7cKeCpPgBjpPtJ1J9+0eLhyYnRPYMwkF2z7Q60Q9uoEDxzC+vi6uoTEQkkL
X-Received: by 2002:ac8:34cb:: with SMTP id x11mr22894519qtb.115.1543179049276;
        Sun, 25 Nov 2018 12:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543179049; cv=none;
        d=google.com; s=arc-20160816;
        b=lWOOe3fVuxRtUFM3j4kH94HAhA1yXlmYp0TN36n48MQFnB4GeUbyyWbXSjuBlBvkHY
         s3etqvuakId4YWhbggDZUx7PSXWbcCB3Y14GJJFNvxuyUh/h40aWDGW0bzZyo+YgoSgD
         EkQ2HGnV8sXF1jd9/Df/06RsQ9f5FW+bSSKGjWt5CUzkXRPs9dpER7qY4qbaOmu8qdpQ
         USR707KkHI9InL8HSNAalrlWeQAQ1EwJ9eAoBdr6UaialdceopkOl+6/wOCR/0y5VaMk
         V7QxKtap8fgFinm/kTMDSkI9UKvPArU+c4QLkAiwWOtim2ql8+/eEzkm901NunyGth7O
         MaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=AnTxmE++ESJ/Rj3Ct8vpNRTIkZ1jRx2Qc5XcC1Yopw0=;
        b=ae6LzvyQyHK3Cjm4mDD2gnuOj/LM3So25UlBQScY3L4JcUA/Q/2iz1L+3OKshw6IDn
         FTQ5TWypSyA71GrOthJCoQQMlaLM1E78ZTKjzQ6sTte9B4YpYTP/aDzm+lNDt88G4iUt
         f93LJMpvpcx9XWaFAG+egljkfuTHzBF5H2OeIT/B3opkg78uZhnz47/cLemxN+jPN7cm
         V0sp+tPhj+XPIT5pwLFTX/CNBN/RRmuDUfilXtI33RPtExcGKptGP0ouwVF4MmezZOja
         qm0xN/OmMgPSPBbypNZ7wqh0tgnPaNCHRMGalzgYwIrZfL5Y0nclefh8bkGjlROvAhD8
         6xSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k8si12589850qvp.96.2018.11.25.12.50.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Nov 2018 12:50:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C98DE85550;
	Sun, 25 Nov 2018 20:50:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20A2F5C1B2;
	Sun, 25 Nov 2018 20:50:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Stefan Markovic <smarkovic@wavecomp.com>,
	Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH for-3.1 00/25] MAINTAINERS: Add various missing entries
Date: Sun, 25 Nov 2018 21:49:35 +0100
Message-Id: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Sun, 25 Nov 2018 20:50:48 +0000 (UTC)
X-TUID: L/udHczb7xjy

Hi,

This cleanup effort is inspired by Markus "Full list of unmaintained files"
from the "MAINTAINERS leaves too many files uncovered" thread:
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04270.html

Regards,

Phil.

Philippe Mathieu-Daudé (25):
  MAINTAINERS: Fix ACPI tests data files path
  MAINTAINERS: Add a missing entry to the SPARC CPU
  MAINTAINERS: Add missing entries to the X86 section (AMD SEV)
  MAINTAINERS: Add missing entries for the Xilinx ZynqMP machine
  MAINTAINERS: Add missing entries for the Jazz machine
  MAINTAINERS: Add a missing entry for the Xilinx S3A-DSP 1800 machine
  MAINTAINERS: Add a missing entry for the Fulong 2E machine
  MAINTAINERS: Add a missing entry for the Old World machines
  MAINTAINERS: Add a missing entry for the sun4m machines
  MAINTAINERS: Add missing entries for the sun4u machines
  MAINTAINERS: Add missing entries for the PC machines
  MAINTAINERS: Add missing entries to the PC Chipset section
  MAINTAINERS: Add missing entries to VFIO
  MAINTAINERS: Add missing entries to the vhost section
  MAINTAINERS: Add missing entries for the Canon DIGIC machine
  MAINTAINERS: Add missing entries for the MPS2 machine
  MAINTAINERS: Add a missing entry to SPICE
  MAINTAINERS: Add missing entries for the QObject section
  MAINTAINERS: Add a missing entry to the QMP section
  MAINTAINERS: Add missing test entries to the Cryptography section
  MAINTAINERS: Add a missing entry for the NVDIMM device
  MAINTAINERS: Add a missing entry to the New World machines
  MAINTAINERS: Add an entry for the Dino machine
  MAINTAINERS: Use my work email to review Build and test automation patches
  MAINTAINERS: Remove duplicate entries of qemu-devel@nongnu.org

 MAINTAINERS | 69 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 52 insertions(+), 17 deletions(-)

-- 
2.17.2

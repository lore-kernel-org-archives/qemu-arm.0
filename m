Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880964wro;
        Fri, 26 Oct 2018 08:32:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dKDymSJWsX1gRHSQX5cwVbww8a4LkbRYc/jhGXPt7k0jgBylQ+f0yaRL2o+saNboPcDjI6
X-Received: by 2002:a1c:ac05:: with SMTP id v5-v6mr1444826wme.144.1540567922794;
        Fri, 26 Oct 2018 08:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567922; cv=none;
        d=google.com; s=arc-20160816;
        b=TeMUNb81HLCvYPj+kWdKo8RgxHhUR8b+pLB5PpQmnUb1a1o1bhLrSN2eQ5iWlnvAod
         4Cwu90UPaJLZGyBLmtRhxQ8n02j0/O2HukjfvTjn8iw241DZ3qe1oD5sumcTwNY+01fO
         qfI7gEegEZ3xct/7iHcuxeNjgKUzLT3U3k+HzAvkLTSQBvillzZU57yMoVR1Wy9H+zby
         tfvcW4oIUtGxicNgVbOUD7db3BAUe5DZikuLqsex41QcKgEggGmc1XBtmr6rc8VCas9Z
         4my3IvaWZVz9TYrVFj6/HqRjgy72NFCfUUHMF6kpxBz3Ku8EghJIjgBVPliskTUO7Cm+
         jybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=CdEUwtbFvTwY4SjUy/9oI1GE3pSfAg7oELF9Mang8fU=;
        b=tJ8b7u+ViMiOw2aejFM+VdqN66YnILAK4k6AzL5zqXi28YM4vMCfIU3TSXADHw5TR7
         V8Ku3OqiSxeWHJw+N+4YU6FTXvZt5Fd9lStx5Obj6DSF75Qzu5uPHy0PGf6An/NK4201
         S6mN92EytbdEGw5jR272xH3QDqbeuxTGry3TNbD5zpIauVTSciwhoEcW/B4mZTm2UuYS
         fg4ba5d+K1DGyYGLwieKkn2gl6+e9eu19yk0N8D1u7PKAYYxnL/vIfjEnxHJq3BvNcC/
         oqYEK6gFCuluC2qowHPRbZImYDOrYBYsoq9Jl1GEonGUOR4ECqK3sT/efO3LtAFJhDZj
         SCSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id m188-v6si3607261wme.147.2018.10.26.08.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:02 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N0Ip5-1fLKm73INL-00xLUq; Fri, 26 Oct 2018 17:31:53 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N0Ip5-1fLKm73INL-00xLUq; Fri, 26 Oct 2018 17:31:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 06/20] docs/devel/testing.rst: add missing newlines after code block
Date: Fri, 26 Oct 2018 17:31:11 +0200
Message-Id: <20181026153125.24738-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:2+1lzwmIIdattnKA+t5WqCfOHMufIsowG/DvIeGG3ALda4ts/4l
 vg/56BnLUH4llLRRRXwxyQHqDIY8mXRkjp058XeF2z6YiLzJlxY8PSM/JDoY84qU1I5yp+X
 R/QG7DOWUGBWRE8Jys9SPwbpJeLtrrrCKcNhnK/tppJoFHsNUmrh+C7gQ4MNFSjDYteJOTs
 2+WczfZcTVkfhI4HDIEHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:PKURthrx+Nw=:JmorG/7/AkZafoiTBWgSxi
 Sy7o0uJeBRLST8ZpLbIBjLALNpXZTH7HKZVGnt5OXwuz9kcax+XcdRtKIS/N5ZJNtWu2kr0LL
 3jfLMx4xhQgj+66H3WT7rrISJxDtZnnBFq2DKOiME2Fg2K6gIKccWtjI9zOnhcxq9yvJnHG5i
 GEuZwrA6XojC49Eb4RiHwrHA0y2DDpLS/ni4ens9A3naoHSFqFZ3dtP86qAnwXZ/YelNa3JfB
 gJQQcVxsqM1z9Y+0+ylx6H7Jb1Uw2YTveK0vWBNy7GNjpoSF+K85hNh3mOpLtkGVd9KU/i7it
 XuPRiJTN/qA1hnDCc0L3BVaXTDtwt+V/WcQQDGCnc04kpxo1Elg1MHi4lpvFyueJBbMgm22Hn
 EK78WDk+UvL0OLBPwaPrDfm1jGLJu3sUbedRgNhzvbOD8mSx2nj39k5QEOzPYnbjGtKks7AOu
 WqFZq+P1yYlrArloVDaVfPFMsCvqK3RARRLWP7XYinmWzuhNVcJOJgoiQRjyJJkUfwkqJihNv
 +5QYwQhXmbd0PxplIIW6hHL1hFOLdsVVgGp2zZ8biKpwCIx99SzYtIbmCQP2654M0eCfbfMl2
 jiY8iONR9fvq7UtTYJSEFQwvSDIEpy4KUAV8f6lbpjpF6td+o8XVmWQOeHgV1jiJrB0/JV4SY
 3FbNWdvqpgjMf0UzrcTlExxTQVJkcoNtnGUSBQEG0cc7ILZO/kld5t3JIS3mAmvyfT+c=
X-TUID: IiIPmM02LRYr

From: Cleber Rosa <crosa@redhat.com>

The line immediate following a ".. code::" block is considered
to contains arguments to the "code directive".  The lack of a
new line gives me during at parse time:

   testing.rst:63: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-unit V=1

   testing.rst:120: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-qtest V=1

Let's add the missing newlines, both for consistency and to
avoid the parsing errors.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20181004161852.11673-6-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fcfad87614..a227754f86 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -59,6 +59,7 @@ variable (which affects memory reclamation and catches invalid pointers better)
 and gtester options. If necessary, you can run
 
 .. code::
+
   make check-unit V=1
 
 and copy the actual command line which executes the unit test, then run
@@ -116,6 +117,7 @@ and using gdb on the test is still simple to do: find out the actual command
 from the output of
 
 .. code::
+
   make check-qtest V=1
 
 which you can run manually.
-- 
2.17.2

Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440163wro;
        Tue, 30 Oct 2018 04:24:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cRcCSIAPTUHtuIKr9a5sOvAdWH5FtRO0LPR+aAVwa6oZKYk3aYDoi7KtV8SRWt4qX0WiR+
X-Received: by 2002:adf:e50f:: with SMTP id j15-v6mr18154610wrm.94.1540898642450;
        Tue, 30 Oct 2018 04:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898642; cv=none;
        d=google.com; s=arc-20160816;
        b=K46uxEQbOL0wll/bF1fZUeYactVxFgkVwipjHQ7ciyaS+XULPlqk6gN6egBU5qL1AZ
         Wpcz5D+tQW2h2GCnJ+Mod3PMZ4wkxiS9MbMG+fBawkKtpXKDWn3/NEV08MkWctyYctso
         WOh2nsaIutpSZXCRZhn8ZticlwiyQNryhP6jwrRuEZCCD+tn2VuarDbSdfsuURoBKqiy
         47bhUgA5oOIt9OfOMzEPeXciklioqq0evWQ7zPYUDGT2OdiQ3jaJnIsgBUdnr23qHkiS
         8Xn4WbxH8Yn6zVQab+hOEp9o/QsnpD2m0YLo0tgL2cilzKUBPNfyH/GTz5v+O70AhbAH
         UMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=CdEUwtbFvTwY4SjUy/9oI1GE3pSfAg7oELF9Mang8fU=;
        b=hMrSyCzZB6Ur9C/HbTg9gdvv2/nJuSFGwJU8WhNjIizohWDfp+nCYj50iKizTfYeUC
         WxOEPfDq7mxUlJCQdw+mn7vFKiI/8M3QNn2LjYJibnyv3v01kJTQaDkS1mpTK+3ie3i8
         mGyVn1t/prWt6JA7HuuRdKdKL0mp+jaX2+0eU2lEPgmpl4fuZJyBhWIx6nt3BygQ9K1J
         y0RziQCOk7WsuFGB4/1SLXD+7D+T/nwWGG2/W2GMqO+4Q6ky5wVwtCqmR5VZ6p3rd6p5
         /kQ59bN5A/KbTjrqekfdgj3P82FC5Qj+TMvCgKpT797fMG85fQtcBTO7QNYoaC4E1frk
         Ob8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id u1-v6si2086343wre.217.2018.10.30.04.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:02 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTzrW-1g9EeF45MQ-00QyF6; Tue, 30 Oct 2018 12:23:58 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTzrW-1g9EeF45MQ-00QyF6; Tue, 30 Oct 2018 12:23:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 06/20] docs/devel/testing.rst: add missing newlines after code block
Date: Tue, 30 Oct 2018 12:23:23 +0100
Message-Id: <20181030112337.17973-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:JX1TAk6usLYJXFNrVTIYoQHw5D9Chnj+I/UQBtTU0G9hdMQz7Jy
 b5rAuOIuqcjCYOcSjc93W2rIyZdRwOjXgsFjjXcV4J8C9Jq3WWtP7cUTe+T3iyy57t1E3Mi
 dAsR0lZrFzkxht8M9XMYKWNd8SkohNvcycql/Zr1iVXcpFG2zDdS4hQM3mO6SDlL+E6/HBP
 kQSYMaMPIO/8Wm0OmhPbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:WBgrBvfitp8=:57AUDuSR2bNYzP4Is4oH6a
 i3OZdim+pZaYSnKtxVH9SGrC2vbdg16XfHS6QDf/3yW1krjxpGcrxc0xFf0wrhO2T+k8gRFWE
 OnW8Hv4+HcYlc6+IQCwlqqmnfXr4mAI1xG4wyuaKTwRwGvvcUIXB0OgH34ObBDajQuR4zhQrA
 0niK2WEXNLVlL3blMoP+I9Xlnuo9KQ+BknzvaypRIZcjp8Fjtl2/QiTm8fq/zho2ROrqrgPiH
 V1AxzRiIBG9BIGsUqsHFW+bLStUDoF6HUOmIcgvNZgcU6NpAH2yiAfUUnFXYxDFoycc0PyshI
 /0BCOB3+Fp5FgzGv4g5MsLQmdDVEzZ82IcwwYka2W8FYqyqn6RhAJy3desNtagsF6/O/r536S
 eTqAEEEiUH5mQcuE3555yyt4nyJkPUVGRGnYf4gbGtq78PmdqGYwIeoav6oFvJ4ZfuF4x0qUR
 q4XJIh75DxWHeHgnD9BB4VdPy0Al9gWLLIXxXUAGMbWwfw3Aci0ortws0kh9sr5E/YUD2r3Bf
 DJim/JwUCMss27qVQbajjDjpFtT0MdXfa1P4A97HKtzrmGBF+MrD6v9vkuYObSOeKODiy4T+7
 g73ZlkTPR2/HRVO92SBW88yaxhBksi9C8HaXepAtMv/dzR2kVHEj0QwmtbuBebcgnu0Ru4PHC
 qlndKISTtt/EBtT7S80sdKC53duA+XHWIGSEKhJSW6ie4MjZTUeF2xCkYrU6fOhSodf7P/y/O
 dkzQBZd/E/Ik+QESooEDPrGI2KVapdzGLi2FTzWquVSyumS8+56iEiqXDjnAtKT1aza6VGvfX
 gZlc+FeSaS3ZpKJpfjhTQvDnqh1Uzu7/V/9uVUyZ3ELgyxBVCXB4ir3dQBsH04zBs0lxa6zlf
 KLwTJeYH5RXuKN1jn4L+N2FeoS6wg+2tu3I9DNxRM=
X-TUID: xLoHbAyzfk4a

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

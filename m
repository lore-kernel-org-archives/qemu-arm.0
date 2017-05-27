Received: by 10.25.0.6 with SMTP id 6csp766062lfa;
        Sat, 27 May 2017 09:18:41 -0700 (PDT)
X-Received: by 10.202.234.70 with SMTP id i67mr2995162oih.142.1495901921836;
        Sat, 27 May 2017 09:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495901921; cv=none;
        d=google.com; s=arc-20160816;
        b=SsiXwkq8ttt+w3/7ktlzIswg9tGE92M/bjk+V5jycCXDD3HDsRpbY4R0u+Fdooh42K
         4v703S3mqhWPrwu7iuE7cXSfokRC44ZfyghbBg+QVrIb8usA1iSmGS0osakRpiPVTsOP
         eVktP8Mfgh6frvqI4WOfU+HuzX+WUSNna32l1mxnqNtJunFCs1dHipkLW4v848FlGJk5
         pUkPQpbAFXDFvse72UsvA/WV/241fJqY7+RvDK1e5YehQq/puYyxtrgensMkYrSSPFe/
         WGJwE3uVaOr0ku0UIJlQh+UBQVO0i3cBuVphC1waaKlL6rnMHxGna2zcJaKhtD6JbftL
         h+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=ynoPM1xg0NdogXCZoNg5KOH9hIqSa+9Rx+kdtXU2xbk=;
        b=qhWHesi95AExflEjN7fqfo2R2I2xN753Tr02J+JR4W2/XmREoyW2wHRpEDYduXPly0
         A2wt7ep89G6TgEgMuxix94P7AWkHkRpuz0DSwN3FXk7x96SiNwgk92qF2KNE+vM7IYx1
         zOMetORztzVLMwBFFP+a2CiLGK2e+nCu4/9tcfY/X7z/1kCbqmNrT+D9VIow4PQdYFN/
         yFy4dZi2zp5FcczQcszDOysV0tabFiBTu6TZBExFDMeohp5k/uB/fZM1Ks5OtNcHDZXW
         jppqHe5gy0aYju/yfdePv12DvRm7gKvw2h5PufjEvOMf2h+EHh9Jx8LrweJWoX5K9SV3
         aZOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id d21si1171338otd.216.2017.05.27.09.18.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x242.google.com with SMTP id w10so6038934oif.1;
        Sat, 27 May 2017 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ynoPM1xg0NdogXCZoNg5KOH9hIqSa+9Rx+kdtXU2xbk=;
        b=DWygCdDJvXP+2UmDZYk3EAXe8rjvaNLVFWFzjWkgGx7WQ+Fg/W83eV6SXFXcxvaGzy
         3kCkEbH7Y6Qs8acgL4rvlWGaLgmHeSpqIU5lHl1dfn68SKrR8x9M/TyAZ2gbxFu6sKqw
         tTp0ArsEafgT3WHSEsv/rnCYgE64KhFL43uMhUMOzcGuXgtAf1+zWSTbU3jSjIxGaWxt
         9PMfd1RdILBibeBGRgXGYJoVVl/Imuc5xOM7xnDNPrAO+Ey+W3KEFSnMj7+3Da3R2hCk
         ypJy77RfimeieFQbJv0oKeFZeICZ7nQCcJIdTiA3boA4N6UmTQkKXIL25K0WW1Gfvx0A
         KX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ynoPM1xg0NdogXCZoNg5KOH9hIqSa+9Rx+kdtXU2xbk=;
        b=Za0lSp3eef8agSDWte68mX//nMJI8FAs/w3VeIluvU2V5N2oVK47ZFi6IFzNlAPsnu
         o37TR5RF839oCI9ZjB3i/ekPoVeZYA7sGiTZo55ULpKQuIYAqXdNtZ4L2bKiEnDxXCAh
         zNoRbua4CkuIkxEFO1+epsLM+WAZyZ1jmpdKh8DPVUb2M7jADcjBPprVexjvnaPL4g6g
         CoxnTex7zgat9A34ulNz/XR8dqB8+icMpINkePZTkx7stndEfIAHB2jfs2A+XtG+MyeJ
         g09P0YZLgmKgG1Y6qP2rGPK8ISl8zkx3BNv+PkPIqUxDqbZqf/mixRzebQD4EIenOA5h
         RGlg==
X-Gm-Message-State: AODbwcD3g+DbgaJFaRMki79Rqwb5u/RYUTcpIr+dea8G3r+FwU3rgyj2
	BZ+xB6pjpPJy8Q==
X-Received: by 10.157.50.163 with SMTP id u32mr3423599otb.188.1495901921401;
        Sat, 27 May 2017 09:18:41 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id i32sm1953113otd.43.2017.05.27.09.18.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 09/24] docker: use eatmydata in debian armhf image
Date: Sat, 27 May 2017 13:17:40 -0300
Message-Id: <20170527161755.7761-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170527161755.7761-1-f4bug@amsat.org>
References: <20170527161755.7761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ODhLOYDuoXai

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-armhf-cross.docker | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 668d60aeb3..ba8d5a5167 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -8,8 +8,11 @@ FROM qemu:debian
 # Add the foreign architecture we want and install dependencies
 RUN dpkg --add-architecture armhf
 RUN apt update
-RUN apt install -yy crossbuild-essential-armhf
-RUN apt-get build-dep -yy -a armhf qemu
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        crossbuild-essential-armhf
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get build-dep -yy -a armhf qemu
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
-- 
2.11.0

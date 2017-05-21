Received: by 10.103.124.15 with SMTP id x15csp882351vsc;
        Sat, 20 May 2017 20:30:37 -0700 (PDT)
X-Received: by 10.157.20.250 with SMTP id r55mr8723258otr.28.1495337437024;
        Sat, 20 May 2017 20:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495337437; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9z1xOvZuSz3jIKXVE4VoMn1sLP0Dz8UkEDCX4b6/S81MtG+m3mQsLgBg27tsaaUSh
         o2EPjqDTtM0RrCevmhRZy653HTALg/kQ0V239elYPpAUEAv3pse1atmc2EuVNBwaki0f
         eQbVlHYYcUC9lobhXpSXWVGK1whiTPI3rOw0qUuXG+me8YSULSYDD+zpOab1c/fupayv
         OM1PhYIwqcTLv7qE4te9zOjvf3AsHw3PQYnmWKZpxe/SZ2cZfQm/vZwZKh9r3aibgzo+
         BmykPXBZzz1DB0Z/p9X6ycAISB0QW5xQAMN/mw0y8V+c1RajNwg9PjkCCUuRTY+SvaqO
         Vwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=A86V0m0PAH3SLFhTdheIBXbsyOaA8sSRBG0r+ZarDsM=;
        b=Za1k0diOBowSOu5Q3SRmmXQXtXxi6nwBVfdKGjV2bJlkAR4OB4rVBvinPKOkRs+XdG
         GnDRLdSGYn7PSQMUUwmhccNd8KVVIoYjOfujDeiUM+/d9EEMI1v8jrPQ3HE3mhhikIJQ
         LVpovuUHprplBLfyQtf9uIYkbSnpBJ9bLASjoNU3s7g6aQunFyfkkj2UP/JAPKyTCt+k
         BzqWn47DYqWSOhM4K5wzPiTmTc9PBTKZyp4OEgFZO3krSDd2LYlzDnhp8BymPv1MV95p
         lvR3mV1TqiaWEOLxg+offvTf0qO9v78bgIYsOOG4Wj/yCm/3oAe68ZoUbS6GnlL6il+Y
         TgHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id y130si5505914oiy.334.2017.05.20.20.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x244.google.com with SMTP id m17so18049117oik.2;
        Sat, 20 May 2017 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A86V0m0PAH3SLFhTdheIBXbsyOaA8sSRBG0r+ZarDsM=;
        b=U5rUxjCTYj7NAA33ye59y/CKSbPd48RPFCO2BcbTFICyHPX3SGocXIKFn24Yc0KpAR
         ue+MNlumqkAmw3EyAzQhIoozGLLzqSSkv0x9UatHOHMKljjl1fLw67rX/DawgzXX2UeO
         M+3RiJuNWQxNcN8ifVjAoo/CX9BrflxI30mcakz2guVVAfWJch1jV3MaS5Vfds4cyr0s
         wVuhaxRYrhFmIqXroxWnVJPSMxZyXJUEYSh/GmZGDVqq+IXM1FxaNGPg5Lvbklqmz7r7
         ++/PcmTWWmnErABjbGJ47mrQzR0HkmjOMtsZVW0ZPXy2m4eQvLaaoFSnwGmoIQ2jwNFt
         oCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=A86V0m0PAH3SLFhTdheIBXbsyOaA8sSRBG0r+ZarDsM=;
        b=QmzPDwBoSW9+vyUsKg0hqy1dflWVHwotuq/V1Rf3VaN6tijysb9eilTFgiam0Oce8O
         FcXf+8fZWhxJjZQTWpKe2S4f7tNRGA9XKN+CHaxuRoQgzQqBfq/9FnWtFGumiZgKVS/J
         78vvRuS+R5YSDAMjDzxftWj2fyzlj8fgxtbW87W0OvR8nO3G4x2/fcSKXOl1+F/UvzQZ
         GQVUGHxQewO9N8eK+VJD0CKBLJMRLIQG4/ENQWp1hHPCOjM3lSmuQV9p3lm9+iCCuH+J
         7UIyG5htSEqVJ6hJ+pG8XOlmWTwqK31eRISWU9E4AaI2IDLT6+Md4ztCEieia5IWNLOD
         6ykA==
X-Gm-Message-State: AODbwcDCFWL0WLSHCuUlGXWU6ws4FfMPbPUM/oZRn2xbR1RHiSpox6wM
	ahUva2SZ/aQVUA==
X-Received: by 10.157.89.213 with SMTP id u21mr8370178otg.95.1495337431817;
        Sat, 20 May 2017 20:30:31 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id u23sm6499219otg.31.2017.05.20.20.30.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 11/24] docker: add extra libs to armhf target to extend codebase coverage
Date: Sun, 21 May 2017 00:29:43 -0300
Message-Id: <20170521032956.27446-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170521032956.27446-1-f4bug@amsat.org>
References: <20170521032956.27446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: v5kE+SNWe2ue

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-armhf-cross.docker | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index ba8d5a5167..e67dfdccc5 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -16,3 +16,14 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        glusterfs-common:armhf \
+        libbz2-dev:armhf \
+        liblzo2-dev:armhf \
+        libncursesw5-dev:armhf \
+        libnfs-dev:armhf \
+        librdmacm-dev:armhf \
+        libsnappy-dev:armhf \
+        libxen-dev:armhf
-- 
2.11.0

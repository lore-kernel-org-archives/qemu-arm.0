Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1719182lfc;
        Wed, 20 Nov 2019 01:11:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVM4kwbi7j9TVV1AtwOGEk7JFjX68g0ubfSoJjc0V7IBwweZHOBd3yodYELrYg8s2zVHrO
X-Received: by 2002:a05:6214:5c8:: with SMTP id t8mr1553817qvz.231.1574241061721;
        Wed, 20 Nov 2019 01:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574241061; cv=none;
        d=google.com; s=arc-20160816;
        b=kVQ4oC7xTh3ZJt8XITxRn0xYmupX93fFejmCkIl5rA+aJuU4pVVHFwp1z7y1HjryWG
         S2d6Cay+cRsQ0023uUCSZME6EG0IqHncqY+RXBgu2eHW1uaRfig+rHVJ2Tv0pTv0zFdk
         vry6rDJRTTcS2U0IPm/8rr4nefhXTu6QqEC7lvaCagYGgYDuJfLsPHfCTf8mE/HRm+3f
         g+iOLo24O5iurIIvYyDxVQVjmHPX8a2rXIlRoZdxUZW5WNDpjyrKrZQPdpdDDqNJ1sRt
         limixJVivL6U2KIP8zPdASHuNP52inuSTO3sJvvqUYKfcPvylScga+uEX4qympLYNRuW
         rXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=f85FTNN9sITlVPII4AJxGY/EU9pXznh3IJDKH4G7MEk=;
        b=rSOzMWjXvPbbbLKNaQjbf5Zy0yz003xlh05h2SCq9ryn/fgqC10d3sgLPCdiLKVmuv
         VCLTx/APHPdX4wMF/GX1taUFfaqBAFMuFXgpWEaVc4wQoUl2vF9Qr30lh/T0BNFxjCQF
         UJX9TQZ84ZZ4LMB0tDoAbI3ZYEwLmpU4oUvDHgq5Pr/eoHQU3ndzTWqzekyXlXX20BSN
         2lI+guLgG99ltEL1IXRaY6eSuUfE51nMoRBEqJw0yCRfdUqmCQ52bnio14U9qlfeZ1mM
         hLg6vrHDBnNC20QkmdFwkv/lGtkrh4HJ5QKJkPHWu0nE8VWZ5hut5v+rQyDflTRhBwXf
         jZ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I39Rvjhf;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id g3si14174421qtv.201.2019.11.20.01.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I39Rvjhf;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574241061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f85FTNN9sITlVPII4AJxGY/EU9pXznh3IJDKH4G7MEk=;
	b=I39Rvjhft7chDfcdbsfZrAfe0vCIjUVKJmPf7UvJ0g6S216StlVMVkTpacXxj6nFsnsIJC
	OhSdBtI2vYrkr4ayKdawEn20rUga7eAJfqlKsRyvJXDBU9tfaZcXZg3oovmk9z+PYkwIY3
	Jks4JTdIRgi2wCpGs2qcmuNPItCAimQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-yI5TY9YdOGOTyZrWX6S8zw-1; Wed, 20 Nov 2019 04:10:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F8AE80268C;
	Wed, 20 Nov 2019 09:10:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8087260BAA;
	Wed, 20 Nov 2019 09:10:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org,
	libvir-list@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-5.0 4/4] Remove libbluetooth / bluez from the CI tests
Date: Wed, 20 Nov 2019 10:10:14 +0100
Message-Id: <20191120091014.16883-5-thuth@redhat.com>
In-Reply-To: <20191120091014.16883-1-thuth@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: yI5TY9YdOGOTyZrWX6S8zw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: HgfIND1HcfBU

Since the bluetooth code has been removed, we don't need to test
with this library anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml                             | 2 +-
 tests/docker/dockerfiles/fedora.docker     | 1 -
 tests/docker/dockerfiles/ubuntu.docker     | 1 -
 tests/docker/dockerfiles/ubuntu1804.docker | 1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index be57c6a454..a28e389794 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -36,7 +36,7 @@ build-disabled:
=20
 build-tcg-disabled:
  script:
- - apt-get install -y -qq clang libgtk-3-dev libbluetooth-dev libusb-dev
+ - apt-get install -y -qq clang libgtk-3-dev libusb-dev
  - ./configure --cc=3Dclang --enable-werror --disable-tcg --audio-drv-list=
=3D""
  - make -j2
  - make check-unit
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfi=
les/fedora.docker
index 4ddc7dd112..f143b26cf3 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,7 +2,6 @@ FROM fedora:30
 ENV PACKAGES \
     bc \
     bison \
-    bluez-libs-devel \
     brlapi-devel \
     bzip2 \
     bzip2-devel \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfi=
les/ubuntu.docker
index f486492224..1b3b2693d2 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -19,7 +19,6 @@ ENV PACKAGES flex bison \
     glusterfs-common \
     libaio-dev \
     libattr1-dev \
-    libbluetooth-dev \
     libbrlapi-dev \
     libbz2-dev \
     libcacard-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dock=
erfiles/ubuntu1804.docker
index 3cc4f492c4..21a5f2c45c 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -8,7 +8,6 @@ ENV PACKAGES flex bison \
     glusterfs-common \
     libaio-dev \
     libattr1-dev \
-    libbluetooth-dev \
     libbrlapi-dev \
     libbz2-dev \
     libcacard-dev \
--=20
2.23.0

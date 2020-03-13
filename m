Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2500984lfc;
        Fri, 13 Mar 2020 11:37:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vssu24aiNsegUPpeOdiNRwSccJGIHVP9ccTIkCPn9z1RSbyRCLVc9q9R9+TnbTJtIeX8dGd
X-Received: by 2002:a17:906:cc93:: with SMTP id oq19mr12324306ejb.173.1584124624562;
        Fri, 13 Mar 2020 11:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124624; cv=none;
        d=google.com; s=arc-20160816;
        b=eipe7FNv8qh/oytM+EAeWNSbFKDLNFXqrkaYninKBGOdEY1qXldO6IXwJqE5JLAfbH
         pszfNVr+Dtr213hPuewf5RK968a0eJ7Lo95T9rSSIaToO2Zat8+XoVkKJ/TWrPwE/3WG
         qTMj4CAOWUOoTjMbx/w5vpy7VzhPOKUGiex9EOlDgpa/wI/xH6yC4gfulNX04El160f3
         IW04cr6nl93Kx0crlPsOQc/SvHcIw2RYiE7ox2T/x2jAMSayHGVHRqQPjiJ5HE41vt+K
         tLYwwlSuX4V5JNiIEY67se/aTBjdE9uYitOsCdovRFSfYoLT2GMsNJJWBlwj8XOjmVf3
         OJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iLgNrlwyJy7v8dAuschP4PozhwWEQ5HJ4QmdriYy9Wk=;
        b=BkKEzg9fNIvrwML16zX01329agbpDVyybf8Nw/3isNgu4eH8mvwMeFzFNQJQ6ZC7LY
         VL8No41BAv86YVw2HKi8NTGjPYF7cp63jvehut6HZBYSsEHeZrhY4YudwLHKPE4qjVnW
         oiV5WMM/BSQ+9dbnMJyib1T6wZmkBhe7jhJnCNVM1+RBD6EVkOv5jh3zPk1WuMptrCJF
         c6zxCfe0h78gOX/EnfYW4QEtG5dh+quI/0UDXaCDu/t+h72MQREMTJAde/6HznNPKF7n
         JzkXSyXJP23VlRbLrT8H93B5jaruJnRj2nBEZoGXW/REgjwhOAmlj6y4i7xN3P9wS2ft
         ZztQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bQMb23M2;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id a7si6698157edq.561.2020.03.13.11.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bQMb23M2;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLgNrlwyJy7v8dAuschP4PozhwWEQ5HJ4QmdriYy9Wk=;
	b=bQMb23M207hIcpVi5QiqHVvpE0xEBc7ll30X/Rcq36qj+a1YFIaRoppEIlRxaB8IktYjIl
	HP8NHthelRkMBeJdQVbE/A0gscKbRsDAnNkz1SRU9d3Z5uMWCJ5JT5Um+VwyYIUmq8TyK/
	U7W+JzBmrY+vwOaJPoQ5O0n9ohV98nY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-BfwxYHUCNzqgQp3YWEKnQw-1; Fri, 13 Mar 2020 14:37:01 -0400
X-MC-Unique: BfwxYHUCNzqgQp3YWEKnQw-1
Received: by mail-wr1-f72.google.com with SMTP id 94so25503wrr.3
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moZeqK0xvieWMnbLXAu30p4QSLVxENxO9B1zIYBPdN0=;
        b=k7wq5EmS3G3S6Qw1ad3HhgatrpgMwGyCfrLHDWA6x0j/fnkoLtouaw2WSkeWR+gPua
         1MIqNsrwh0FfHwn+iSqB+Ai9LMP9tYTo/JAO3E9HgasWp8i6Z9hADIQLFfleSwHRnDLY
         rJETGbbPcKq9A8tXtQ5+ovKs43fnEhjcyy/FbMtCllskvQTQPC6RTUANnaMJEVVMoGzt
         OD2iriG1lhb58/OhOptd1s7qzFIDgqqpg3Xe/QEYCMhBRztIG07JxpjuK/awgiI55at/
         TEvIUt3g3KnqmO2ht0gf4eDXIjrMy+g9mThD28T7OqDaUtG7XBMrs78cijoyk9qH+8ZT
         qpQg==
X-Gm-Message-State: ANhLgQ1QgdFN3ANujaempGrw59m+Bj8PEWXh1uVqnsufzmAaPLQRsKrO
	T5fw7W29StsiDsGZMz1YJ92DY6G+La+4hzABIKLdGTLg3X+61vFJbG3GudCFs9HRqdQfD6G8Bfx
	FvSThW0QJPXPf0cKq
X-Received: by 2002:adf:9364:: with SMTP id 91mr18691355wro.223.1584124620545;
        Fri, 13 Mar 2020 11:37:00 -0700 (PDT)
X-Received: by 2002:adf:9364:: with SMTP id 91mr18691318wro.223.1584124620383;
        Fri, 13 Mar 2020 11:37:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id g12sm6334174wrm.87.2020.03.13.11.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:36:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 01/14] Makefile: Only build virtiofsd if system-mode is enabled
Date: Fri, 13 Mar 2020 19:36:39 +0100
Message-Id: <20200313183652.10258-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xxjBj2YVdP06

Do not build the virtiofsd helper when configured with
--disable-system.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7df22fcc5d..ed77b6e50b 100644
--- a/Makefile
+++ b/Makefile
@@ -346,8 +346,8 @@ vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-g=
pu.json
 endif
=20
 ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
-HELPERS-y +=3D virtiofsd$(EXESUF)
-vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
+HELPERS-$(CONFIG_SOFTMMU) +=3D virtiofsd$(EXESUF)
+vhost-user-json-$(CONFIG_SOFTMMU) +=3D tools/virtiofsd/50-qemu-virtiofsd.j=
son
 endif
=20
 # Sphinx does not allow building manuals into the same directory as
--=20
2.21.1

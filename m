Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501248lfc;
        Fri, 13 Mar 2020 11:37:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvPa3Z5rRreqnJR7QvtUj/Q/d9TwlZ9h6OoJNX3Z89Es2F0Ol1p5+MPeNY/+fVW7t5vg8Q/
X-Received: by 2002:a50:9f6e:: with SMTP id b101mr14783404edf.372.1584124642792;
        Fri, 13 Mar 2020 11:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124642; cv=none;
        d=google.com; s=arc-20160816;
        b=rmS42cdANW2ZZC4VYXc6jofcJDPahniukeGXJiNuB2eBKVw9zM1hM8PURLT3ZUGphw
         qUHYUXStcvbPiFUG86qKyIQDKQsvJNO6LRl4tfvkAYZcwUZ+iOwaxxZrdimwxcdIE5lO
         /MTMZoL5vejJ89ygDBDuF+mux1FjyRW/SSxtNGiht8AZko4NNLi9NPKjyTgtzmx6TnS+
         QKielIrszNyC66lp1Xp+XUld1HEyln5z0QTU//hQdID13OyFdSoiPnmfy324UrtYBta/
         C+0b06UCIT2+pwsc7ikw9R7a3cllRjYs4UOJPqQGBwsNpDoG2AKfesnDmuiZ9Wwejy1l
         lojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8aoJLCXCrlxs+uxn6Eno2ayGO83+rkYY4ustjsPF1ac=;
        b=zVwP3geUrFSsYwmAuEw3QbCaSnx+qd6q8z/lTf/rZtHBvCoK/YQXqSzxudr5wP9GxA
         2bUiTTGxEuhj3aNXVrPeskySnsOkWRGgokWXZa2d6t5Sf6xb2v4g8XZFbcVj2sIx8R4J
         z0XrxfAIaWmgGNp+kc5xLrRgwr6yzA8d65cBtjQkfQrHhPEAXKvIcxcCx+hzBMb5aflO
         w11tlpc/Y19Dvds4CQaj+p9tb4OeaYWeLqwgHA9rdI0Nz6lFox5VevDmgwVggNNqBqe7
         XMhE+8pKtje0WAB8AJm3J/8HaoWJNGbkok9yJapo7+PAfVAwRajPD5b9uXl5o9r0tbMD
         TBMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RHl3Lqgv;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id sb10si1657907ejb.205.2020.03.13.11.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RHl3Lqgv;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aoJLCXCrlxs+uxn6Eno2ayGO83+rkYY4ustjsPF1ac=;
	b=RHl3LqgvYTstlaKMHCsj4H4+RkYw0yDnpIyJTrCGTjY9Fe1AerEFr7C1IhdN7eJj5zislO
	T0uTbRqDayxuW5KdYYXDU9igTr2dqKI9jEbi0gtnSzhgn8wKNoiBO0bAl0IY9QqtnT3qD4
	oKo7MRWem+VDH6KZ7qgb6ndfLOqnui8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-NSPPcLHGP1S4IdU0qGEFMw-1; Fri, 13 Mar 2020 14:37:17 -0400
X-MC-Unique: NSPPcLHGP1S4IdU0qGEFMw-1
Received: by mail-wr1-f70.google.com with SMTP id w11so4707272wrp.20
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yX3/yxF6EHlmvUP2BbzjjZIQps3yYgRSbpFFIqc8F/E=;
        b=JRZjs8zmdvGuTtQje66foL0NhT4VY9IxZ0uLDRwKbm0jOcnTlhDMEp+VNFN/oJFYlf
         nVTv7RJeAJb4DnMfMdavfxTOeIVwtUErGo/xLpyJ+XN3Qe4em6EG2A+9rbtEnN1rMcQm
         HnJfFhRoqHhvktTSFG1z79yS/14pQYTXsnRsyh/spaLGgAEuSvdCoWaSHc0gmPNYVJDM
         SM8kuUAypaxT6ptwlkB/gSXy0hKjMXFSYzNsxj9/vriimL6rn0N9lv2Bs4XXoofH6mZT
         +JRwFkCfJ7jaHws7QZQZtAxMplc4aWWk5gzX7LdRJB4N6C8/yO4qHHGbBJJpNTZXIZjU
         xf/g==
X-Gm-Message-State: ANhLgQ1zKtcbkyHHbhmNYY2KOgTlI2/DTggTJhZwoxprX+l6u8ijBb6x
	CsBSmAz9TZ9Rx+hOfPp8uDjf1cj0ZbPGnOR2rF3mYdd6mn9wAiqbm+W/lXpxY0hjX6Zx24KR/Kw
	D14axU7qQAhFdW/cF
X-Received: by 2002:adf:f58f:: with SMTP id f15mr20039038wro.16.1584124636775;
        Fri, 13 Mar 2020 11:37:16 -0700 (PDT)
X-Received: by 2002:adf:f58f:: with SMTP id f15mr20038999wro.16.1584124636423;
        Fri, 13 Mar 2020 11:37:16 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id m11sm33980849wrn.92.2020.03.13.11.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:15 -0700 (PDT)
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
Subject: [PATCH 04/14] tests/Makefile: Restrict some softmmu-only tests
Date: Fri, 13 Mar 2020 19:36:42 +0100
Message-Id: <20200313183652.10258-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5UsU9HzPewMm

These tests fails when configured with --disable-system.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 99db5eb3e0..bf11f765c3 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -64,14 +64,14 @@ check-unit-y +=3D tests/check-qlit$(EXESUF)
 check-unit-y +=3D tests/test-qobject-output-visitor$(EXESUF)
 check-unit-y +=3D tests/test-clone-visitor$(EXESUF)
 check-unit-y +=3D tests/test-qobject-input-visitor$(EXESUF)
-check-unit-y +=3D tests/test-qmp-cmds$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-qmp-cmds$(EXESUF)
 check-unit-y +=3D tests/test-string-input-visitor$(EXESUF)
 check-unit-y +=3D tests/test-string-output-visitor$(EXESUF)
 check-unit-y +=3D tests/test-qmp-event$(EXESUF)
 check-unit-y +=3D tests/test-opts-visitor$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-coroutine$(EXESUF)
 check-unit-y +=3D tests/test-visitor-serialization$(EXESUF)
-check-unit-y +=3D tests/test-iov$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-iov$(EXESUF)
 check-unit-y +=3D tests/test-bitmap$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-aio$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-aio-multithread$(EXESUF)
@@ -106,7 +106,7 @@ check-unit-y +=3D tests/test-qht$(EXESUF)
 check-unit-y +=3D tests/test-qht-par$(EXESUF)
 check-unit-y +=3D tests/test-bitops$(EXESUF)
 check-unit-y +=3D tests/test-bitcnt$(EXESUF)
-check-unit-y +=3D tests/test-qdev-global-props$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-qdev-global-props$(EXESUF)
 check-unit-y +=3D tests/check-qom-interface$(EXESUF)
 check-unit-y +=3D tests/check-qom-proplist$(EXESUF)
 check-unit-y +=3D tests/test-qemu-opts$(EXESUF)
@@ -124,9 +124,9 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)=
) +=3D tests/test-crypto-tl
 ifneq (,$(findstring qemu-ga,$(TOOLS)))
 check-unit-$(call land,$(CONFIG_LINUX),$(CONFIG_VIRTIO_SERIAL)) +=3D tests=
/test-qga$(EXESUF)
 endif
-check-unit-y +=3D tests/test-timed-average$(EXESUF)
-check-unit-$(CONFIG_INOTIFY1) +=3D tests/test-util-filemonitor$(EXESUF)
-check-unit-y +=3D tests/test-util-sockets$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-timed-average$(EXESUF)
+check-unit-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_INOTIFY1)) +=3D tests/te=
st-util-filemonitor$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-util-sockets$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-authz-simple$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-authz-list$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-authz-listfile$(EXESUF)
@@ -137,7 +137,7 @@ check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-f=
ile$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)) +=3D tests/test-i=
o-channel-tls$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-command$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-io-channel-buffer$(EXESUF)
-check-unit-y +=3D tests/test-base64$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-base64$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(if $(CONFIG_NETTLE),y,$(CONFIG_GC=
RYPT))) +=3D tests/test-crypto-pbkdf$(EXESUF)
 check-unit-$(CONFIG_BLOCK) +=3D tests/test-crypto-ivgen$(EXESUF)
 check-unit-$(CONFIG_BLOCK)  +=3D tests/test-crypto-afsplit$(EXESUF)
@@ -145,7 +145,7 @@ check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_QEMU_PR=
IVATE_XTS)) +=3D tests/test
 check-unit-$(CONFIG_BLOCK)  +=3D tests/test-crypto-block$(EXESUF)
 check-unit-y +=3D tests/test-logging$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_REPLICATION)) +=3D tests/t=
est-replication$(EXESUF)
-check-unit-y +=3D tests/test-bufferiszero$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) +=3D tests/test-bufferiszero$(EXESUF)
 check-unit-y +=3D tests/test-uuid$(EXESUF)
 check-unit-y +=3D tests/ptimer-test$(EXESUF)
 check-unit-y +=3D tests/test-qapi-util$(EXESUF)
--=20
2.21.1

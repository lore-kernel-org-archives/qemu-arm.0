Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501423lfc;
        Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtxewOP9u2mv253+tCi0evYW2xXK6DdZjns3Bw2AmGnXS0/3QMVEkqG2o/N4TotuV7YsCI9
X-Received: by 2002:a05:6402:b3c:: with SMTP id bo28mr14715732edb.284.1584124651031;
        Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124651; cv=none;
        d=google.com; s=arc-20160816;
        b=AFfzXer4uWWLJ+UrVOSXKew2e+kJ5B7bLxj0+FRe+i0j0xcyOPaq6UltgktvYcGJU9
         UnZAAnjzAYW14xpr9DSfzH/xA8YJgKaRphfE6apBzQf9XE+edMRSHv2sKhdHeWUzndoP
         5tFLh1UpaspO0A8N90LH9ZHwzMUb21cSp9yw5UPMcKOd+SxTOHTf4TbpMaNJd9Xv9E/4
         AMa5AoMK7kXx+h8szTq8f/AAsAUDhxX9b6oneShyH+sac+yJd6S3Fme8t5+e0RlGylnn
         PTOU10u1DQ4oagx9kASNw2tWTDWlKbCviwBfD3Ji1b7JSJTiXsZ/HtI3JnH3AcNtChmM
         325Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xgDberYaZDed20sm6tRRJ30h81E1DyL3M/u30/cftuw=;
        b=SxTozI/qjrNtndgpzn1PlaN90RWS21vq8pipSJ23BFn2fkWJNJf2lZmkUY0+gh6eXm
         1b1AnrWQ5OKIHA9bKYsDW1CLmbXAT+XZiQLWcrLuPgeBvRsNUyzHsf8BDT6A3xYTbduz
         3GSFkfQaAv+oL1Xq++5pZOwNskb+IwSlkbDWJQPLk5IGMOtC0Zjg4hGXR5ck16ffsXYK
         37O14yE90NtVfvkQF6XbDFwO413zojvAcfeU/i1IAO41qHvwLub/7GjxO/d3ywzYkjPa
         kPSadgCs/B8H+ABl4rSExbNKu6YchYi0Z4VuTELhSb03eVFvuRb4t/vHhejCUSNytDst
         mafg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pyfzp0tN;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id u6si5657394ejr.511.2020.03.13.11.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pyfzp0tN;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xgDberYaZDed20sm6tRRJ30h81E1DyL3M/u30/cftuw=;
	b=Pyfzp0tNPKVRFACmam/XzJVRLsNPSzeTB4ypHediykxYarDvlOCTHS5r/F4am3IHl7/oOg
	tlJly0wiPbs+XgGkOaLZW11SlgZyG3y/NjbS1gjUdKgY1a56IYDRkkG8+FJl+vq0U9p8z8
	kCKqMqevPAc87FBsb+N+kyYYt8YpcX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-RA2ub9tKP5m7FEATaGkgXA-1; Fri, 13 Mar 2020 14:37:27 -0400
X-MC-Unique: RA2ub9tKP5m7FEATaGkgXA-1
Received: by mail-wm1-f72.google.com with SMTP id f9so1725406wme.7
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RC71PykOebGOXBV3Avk2avLieaYMFi0EYKRjpxiFXHU=;
        b=qkTK1J2VP94RjimnDLdYcBHk9NvrDrnNdIsCUb1OQVVwQ09IjmxVUYzEnL14HzqeMl
         8n+qqz7UsC26N1gaubVvOmW7wGNKadvy6OjLfV4pdC4fCDlcFhCIxVG7G08/yhD1wJVr
         SM+Hp8lwnWJ5BTCM/C/MmgMnxMJ9fdUBT2OFuO2zNTRwuekHWeKc8uSwwVzj+qSNu+GZ
         V2wiVk6BRfSnz00V5QWXhlwnx1dKrn7BCSpxWHMFMNsOXP+MrzS4BFRDjT03bvELs8zu
         g0FsjVtmrYiJz1yCDZvhF/8K+yetH8kkXacHTwITdLjzmh4D/U9833CrE5gizgQVysDF
         iEfQ==
X-Gm-Message-State: ANhLgQ1NB6Pq75uz43WeQ/29f92G9GHfuKGyHL6JFa2hrEEv3gTEI8A0
	ZphZ1uWJW4FXLNFFRMifuIdulbrwCn8e2uRqCWwZguGS/xVhEHn/2KZgPd/8DMT/DwpyC4lyKlK
	eHfDyDWLGmao5J1nV
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr18665489wrm.305.1584124646871;
        Fri, 13 Mar 2020 11:37:26 -0700 (PDT)
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr18665462wrm.305.1584124646657;
        Fri, 13 Mar 2020 11:37:26 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id w81sm17726166wmg.19.2020.03.13.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:26 -0700 (PDT)
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
Subject: [PATCH 06/14] util/Makefile: Reduce the user-mode object list
Date: Fri, 13 Mar 2020 19:36:44 +0100
Message-Id: <20200313183652.10258-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Et7VOzqb0Zb8

These stubs are not required when configured with --disable-system.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 util/Makefile.objs | 59 +++++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/util/Makefile.objs b/util/Makefile.objs
index 6718a38b61..24ae2e4dfa 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -1,8 +1,4 @@
 util-obj-y =3D osdep.o cutils.o unicode.o qemu-timer-common.o
-util-obj-y +=3D bufferiszero.o
-util-obj-y +=3D lockcnt.o
-util-obj-y +=3D aiocb.o async.o aio-wait.o thread-pool.o qemu-timer.o
-util-obj-y +=3D main-loop.o
 util-obj-$(call lnot,$(CONFIG_ATOMIC64)) +=3D atomic64.o
 util-obj-$(CONFIG_POSIX) +=3D aio-posix.o
 util-obj-$(CONFIG_POSIX) +=3D fdmon-poll.o
@@ -21,31 +17,20 @@ util-obj-$(CONFIG_WIN32) +=3D oslib-win32.o
 util-obj-$(CONFIG_WIN32) +=3D qemu-thread-win32.o
 util-obj-y +=3D envlist.o path.o module.o
 util-obj-y +=3D host-utils.o
-util-obj-y +=3D bitmap.o bitops.o hbitmap.o
+util-obj-y +=3D bitmap.o bitops.o
 util-obj-y +=3D fifo8.o
-util-obj-y +=3D nvdimm-utils.o
 util-obj-y +=3D cacheinfo.o
 util-obj-y +=3D error.o qemu-error.o
 util-obj-y +=3D qemu-print.o
 util-obj-y +=3D id.o
-util-obj-y +=3D iov.o qemu-config.o qemu-sockets.o uri.o notify.o
+util-obj-y +=3D qemu-config.o notify.o
 util-obj-y +=3D qemu-option.o qemu-progress.o
 util-obj-y +=3D keyval.o
-util-obj-y +=3D hexdump.o
 util-obj-y +=3D crc32c.o
 util-obj-y +=3D uuid.o
-util-obj-y +=3D throttle.o
 util-obj-y +=3D getauxval.o
-util-obj-y +=3D readline.o
 util-obj-y +=3D rcu.o
 util-obj-$(CONFIG_MEMBARRIER) +=3D sys_membarrier.o
-util-obj-y +=3D qemu-coroutine.o qemu-coroutine-lock.o qemu-coroutine-io.o
-util-obj-y +=3D qemu-coroutine-sleep.o
-util-obj-y +=3D qemu-co-shared-resource.o
-util-obj-y +=3D coroutine-$(CONFIG_COROUTINE_BACKEND).o
-util-obj-y +=3D buffer.o
-util-obj-y +=3D timed-average.o
-util-obj-y +=3D base64.o
 util-obj-y +=3D log.o
 util-obj-y +=3D pagesize.o
 util-obj-y +=3D qdist.o
@@ -54,12 +39,44 @@ util-obj-y +=3D qsp.o
 util-obj-y +=3D range.o
 util-obj-y +=3D stats64.o
 util-obj-y +=3D systemd.o
-util-obj-y +=3D iova-tree.o
-util-obj-$(CONFIG_INOTIFY1) +=3D filemonitor-inotify.o
-util-obj-$(call lnot,$(CONFIG_INOTIFY1)) +=3D filemonitor-stub.o
-util-obj-$(CONFIG_LINUX) +=3D vfio-helpers.o
 util-obj-$(CONFIG_POSIX) +=3D drm.o
 util-obj-y +=3D guest-random.o
 util-obj-$(CONFIG_GIO) +=3D dbus.o
 dbus.o-cflags =3D $(GIO_CFLAGS)
 dbus.o-libs =3D $(GIO_LIBS)
+
+#######################################################################
+# code used by both qemu system emulation and qemu-img
+
+ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
+
+util-obj-y +=3D aio-wait.o
+util-obj-y +=3D aiocb.o
+util-obj-y +=3D async.o
+util-obj-y +=3D base64.o
+util-obj-y +=3D buffer.o
+util-obj-y +=3D bufferiszero.o
+util-obj-y +=3D coroutine-$(CONFIG_COROUTINE_BACKEND).o
+util-obj-y +=3D hexdump.o
+util-obj-y +=3D lockcnt.o
+util-obj-y +=3D iov.o
+util-obj-y +=3D iova-tree.o
+util-obj-y +=3D hbitmap.o
+util-obj-y +=3D main-loop.o
+util-obj-y +=3D nvdimm-utils.o
+util-obj-y +=3D qemu-coroutine.o qemu-coroutine-lock.o qemu-coroutine-io.o
+util-obj-y +=3D qemu-coroutine-sleep.o
+util-obj-y +=3D qemu-co-shared-resource.o
+util-obj-y +=3D qemu-sockets.o
+util-obj-y +=3D qemu-timer.o
+util-obj-y +=3D thread-pool.o
+util-obj-y +=3D throttle.o
+util-obj-y +=3D timed-average.o
+util-obj-y +=3D uri.o
+
+util-obj-$(CONFIG_LINUX) +=3D vfio-helpers.o
+util-obj-$(CONFIG_INOTIFY1) +=3D filemonitor-inotify.o
+util-obj-$(call lnot,$(CONFIG_INOTIFY1)) +=3D filemonitor-stub.o
+util-obj-$(CONFIG_BLOCK) +=3D readline.o
+
+endif # CONFIG_SOFTMMU || CONFIG_TOOLS
--=20
2.21.1

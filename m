Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1718793lfc;
        Wed, 20 Nov 2019 01:10:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNdOcrpa9/I0DRTkTinPRuaPFgYRLoYRUcVPlvnBl/U4SfMcMdZqAKunUy4GAsEbmKZy3x
X-Received: by 2002:a17:906:258a:: with SMTP id m10mr3947355ejb.304.1574241037695;
        Wed, 20 Nov 2019 01:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574241037; cv=none;
        d=google.com; s=arc-20160816;
        b=bCOorLckwTbAKhCELbjtwR5HZ7EjM2wozStLNNRBJpI5ssz2ytzYNAm6vsLipe3/6r
         uxC67SEIRqAuhkXV+JNJ4X6KMuYVWHMxQF3xkbhD5q1maLEyklXW350+2KAveH/eptP9
         G9XYgUCw+gp0uNgMi3NeAJb7NbSb5FItrGZ061k/hMObdlhIpfyvTtI3OHeDs+RZ2rJx
         GlPpTleYD6HSAtxXnimmrLk2FBzPVomF7IBOtiyVjPLQ6YppUc71GbFIsnr5fICeanUt
         Zj1lSmRgl4NvA8K4bvlvjvsDeY0gZ9DvLtXxjWPlb0qsnWH8eQMcAjN0SLPmsiNxkCZ9
         7UGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=vBIdHboBy7XLGKhKEx3+s1cWdLSAHcdjyZy2BY7Fk34=;
        b=YNGdEKqpuoId+xXXpqOiYSu4uue/rWsHFpUG9k/1T/CcFghV7ob0vq11DlZeTfXKQw
         KXbpG2pw/jtdzDWtGnel2wmIjSwUmlzSEn0wtKT5qkcvoU0tpI3PLyRuXQO1ZcpqpOjh
         KByDmn5yJAH5K/y+miNPVegzCQzQOos0XspwoQyx6oYfEAyn7FnMgBdo7C8s8UfRHBeV
         8RYgEXPjrizDWkRu7YHVODGnTIpgxi3btgCgcG+ApIKpy9h8g6MgqeCdUP5b/Le6kdTP
         7e4PsNQOzUuC74MXyI779vDiGV9RqiKctMig8UrpuZqo+f2hs0cKfNdFxEPx+H9kcjda
         ADmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VEEV0y92;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id z5si15417310ejm.51.2019.11.20.01.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VEEV0y92;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574241036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vBIdHboBy7XLGKhKEx3+s1cWdLSAHcdjyZy2BY7Fk34=;
	b=VEEV0y92mjKJEgWwHldUeBraA9+qBHN311oAGESqHxtXHM+8/c+EghOQ9qLo/sNtfVFxLn
	Xb5LTBwj5/fFjOpb3FRlWSBSZ9tZmVs3+yp1BlxbM3Q7z6BtbT1bvjmDr342tPkXM8c//3
	9tuZSElVYY8Zg+fvSIWo/eQAQzQYT7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-E4UftHt-OXCycQAORiqjUg-1; Wed, 20 Nov 2019 04:10:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3501A107ACC4;
	Wed, 20 Nov 2019 09:10:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A37BE60BAB;
	Wed, 20 Nov 2019 09:10:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org,
	libvir-list@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-5.0 0/4] Remove the deprecated bluetooth subsystem
Date: Wed, 20 Nov 2019 10:10:10 +0100
Message-Id: <20191120091014.16883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: E4UftHt-OXCycQAORiqjUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: XXtmLkC18NwC

This patch series removes the bitrotten bluetooth subsystem. See
the patch description of the third patch for the rationale.

Thomas Huth (4):
  hw/arm/nseries: Replace the bluetooth chardev with a "null" chardev
  hw/usb: Remove the USB bluetooth dongle device
  Remove the core bluetooth code
  Remove libbluetooth / bluez from the CI tests

 .gitlab-ci.yml                             |    2 +-
 Makefile.objs                              |    2 -
 bt-host.c                                  |  198 --
 bt-vhci.c                                  |  167 --
 configure                                  |   31 -
 hw/Kconfig                                 |    1 -
 hw/Makefile.objs                           |    1 -
 hw/arm/nseries.c                           |   16 +-
 hw/bt/Kconfig                              |    2 -
 hw/bt/Makefile.objs                        |    3 -
 hw/bt/core.c                               |  143 --
 hw/bt/hci-csr.c                            |  512 -----
 hw/bt/hci.c                                | 2263 --------------------
 hw/bt/hid.c                                |  553 -----
 hw/bt/l2cap.c                              | 1367 ------------
 hw/bt/sdp.c                                |  989 ---------
 hw/usb/Kconfig                             |    5 -
 hw/usb/Makefile.objs                       |    1 -
 hw/usb/dev-bluetooth.c                     |  581 -----
 include/hw/bt.h                            | 2177 -------------------
 include/sysemu/bt.h                        |   20 -
 qemu-deprecated.texi                       |    7 -
 qemu-doc.texi                              |   17 -
 qemu-options.hx                            |   79 -
 tests/docker/dockerfiles/fedora.docker     |    1 -
 tests/docker/dockerfiles/ubuntu.docker     |    1 -
 tests/docker/dockerfiles/ubuntu1804.docker |    1 -
 vl.c                                       |  136 --
 28 files changed, 8 insertions(+), 9268 deletions(-)
 delete mode 100644 bt-host.c
 delete mode 100644 bt-vhci.c
 delete mode 100644 hw/bt/Kconfig
 delete mode 100644 hw/bt/Makefile.objs
 delete mode 100644 hw/bt/core.c
 delete mode 100644 hw/bt/hci-csr.c
 delete mode 100644 hw/bt/hci.c
 delete mode 100644 hw/bt/hid.c
 delete mode 100644 hw/bt/l2cap.c
 delete mode 100644 hw/bt/sdp.c
 delete mode 100644 hw/usb/dev-bluetooth.c
 delete mode 100644 include/hw/bt.h
 delete mode 100644 include/sysemu/bt.h

--=20
2.23.0

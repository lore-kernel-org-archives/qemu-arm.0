Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2763130lfq;
        Mon, 11 Jan 2021 07:20:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9yC7UGMxk9AiQmadKfkSQlO/sVrJ0iSOKhDlw7YRRzaeUSCxt0N4J9LSbAZBz7v9eYe64
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr14439850edw.303.1610378428095;
        Mon, 11 Jan 2021 07:20:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610378428; cv=none;
        d=google.com; s=arc-20160816;
        b=pAN8Z0ekFlAZapdyNpHx7JHIWynZerBGDbaqxoMGV6ZqWzbQ8ExCYC/0RtEyia2+br
         jHrlsDf/+HzMmp8kK2P5MpW7f5Y4ma+1dQkrqxPigpfrbYBstF1Q22rAQ/XGiVSrcIUi
         NqGnP8Vfew3xDcHBZYqBBW1HQPlFEcd+d1XzgjjybbGR/Q778vb5ZOcNgsh6CeM6LZbz
         fDp3tgtbpdrLu4O78RM7bumTTfoBIXV+I+s257/ZO49U3sulv9K4p5z3uE0P01UhWwB/
         QK7EZZebTqtyLWuMVOyfU/9cawkM6xadbKK2cuBUaYXzMRUGtcYyQn6wTDv6RhqkSm4j
         2C9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LM7AeLfQEqrU558zvQoXSQweJ4vkeUX1kaefzrhoJho=;
        b=KuYFXFShNO7l44sU+HGdhewhBJdBaEl5Ag3OD/1yf3E33WRFk7HutIqkdsH3vc5XHi
         O9nFL/RJE1rQY741H9oFsQ5oAmhiQQu44YgxXHP2mnN0e4cno7Q6s/UXSHWqB2OAji8x
         OqzGiCIzWXtelgS8miQcN9N48bkdJa36SaW9RxIXztQFNYEmCEa2gxcNISCKMyp4MxJE
         ItD2QSHv5IvOfK/z4Oei8p7edFnsxh5MTmvxhahSt44ZvWDEaGTcgzRetzEmeqQcyFsP
         ho0jOvIk2nhySWPtoND1/trpwd3zJlWPGqqn09jew7j6H3kUtvmWhVNhf4OSQo9W8xnC
         c8rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQqX9eyi;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p10si6676986eji.254.2021.01.11.07.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:20:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQqX9eyi;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610378427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LM7AeLfQEqrU558zvQoXSQweJ4vkeUX1kaefzrhoJho=;
	b=KQqX9eyiCU3TeauEIutAIqglmCw7fPNWuVuRZv70PfPRCvxLfkxRKik4M9cNsFX0RnJFD4
	9gYTs4hJuhCTq3B9WAolj5y5egdICv2NC5eZFClnyTEhXE4cdrU+WcyLUNNezwYZpd4lZ5
	L5eymDy3MHneEQIBle9ItXgBw7H/Wt8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-8fXULJ8zNJCs-5szMz2jxw-1; Mon, 11 Jan 2021 10:20:25 -0500
X-MC-Unique: 8fXULJ8zNJCs-5szMz2jxw-1
Received: by mail-ej1-f70.google.com with SMTP id ny19so36899ejb.10
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2021 07:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ucd06r2eJPcCIqt9QCTk/uw4j4Vi5AVfWPojlXh2MWo=;
        b=kTJelFtWhvIQOBZn1VtQz0d97CTRm3zFL3BRWM/rR6eGrWugWKzX+QcYrvscJgSLZy
         jg/g98BdApdeImn4bF80rJ0ua7Sw7R0ji/SvBQR2VOQNemNa5DjA1JPB26aPb+uwFZ7z
         dp4HKUHFSP8um2Bdne+/9GBfkt6mc+Wc7+j3VBAD6L9PFA5AfkwfOLNxV3IjYIshSo01
         9H6WcY+54HNTPFJ+Bq195Yit31Hj9sZZD0WMR4E3TRXMBRhliQtNIA366tcV/ZPDaxJZ
         xrOz8t34hCwAVB9SvTIEvr8eITfBgED4EoWE1GzqJPPBL47GGqKQIjiZc1XGW1m9HyOy
         BJ3g==
X-Gm-Message-State: AOAM533kU+h+upVsfnwfJGCmvcMiBk9KUhv3UwIULxtLClzf46VTTg0u
	AOYaQiBRcRp23o3x6WxKI8mXqKBUTzJgjCFS6LW6mKnjqoWEiKpjy2YzxdUAUFg6bSrQlaWBiIi
	Rwg2x9QGB5zR451Tk
X-Received: by 2002:a17:907:e9e:: with SMTP id ho30mr11282834ejc.529.1610378424338;
        Mon, 11 Jan 2021 07:20:24 -0800 (PST)
X-Received: by 2002:a17:907:e9e:: with SMTP id ho30mr11282789ejc.529.1610378424080;
        Mon, 11 Jan 2021 07:20:24 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net. [88.21.205.129])
        by smtp.gmail.com with ESMTPSA id y17sm7157263ejj.84.2021.01.11.07.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 07:20:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kurz <groug@kaod.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org,
	Amit Shah <amit@kernel.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-block@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean 'running'
 argument
Date: Mon, 11 Jan 2021 16:20:18 +0100
Message-Id: <20210111152020.1422021-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fA98lLny5S1j

Trivial prototype change to clarify the use of the 'running'=0D
argument of VMChangeStateHandler.=0D
=0D
Green CI:=0D
https://gitlab.com/philmd/qemu/-/pipelines/239497352=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  sysemu/runstate: Let runstate_is_running() return bool=0D
  sysemu: Let VMChangeStateHandler take boolean 'running' argument=0D
=0D
 include/sysemu/runstate.h   | 12 +++++++++---=0D
 target/arm/kvm_arm.h        |  2 +-=0D
 target/ppc/cpu-qom.h        |  2 +-=0D
 accel/xen/xen-all.c         |  2 +-=0D
 audio/audio.c               |  2 +-=0D
 block/block-backend.c       |  2 +-=0D
 gdbstub.c                   |  2 +-=0D
 hw/block/pflash_cfi01.c     |  2 +-=0D
 hw/block/virtio-blk.c       |  2 +-=0D
 hw/display/qxl.c            |  2 +-=0D
 hw/i386/kvm/clock.c         |  2 +-=0D
 hw/i386/kvm/i8254.c         |  2 +-=0D
 hw/i386/kvmvapic.c          |  2 +-=0D
 hw/i386/xen/xen-hvm.c       |  2 +-=0D
 hw/ide/core.c               |  2 +-=0D
 hw/intc/arm_gicv3_its_kvm.c |  2 +-=0D
 hw/intc/arm_gicv3_kvm.c     |  2 +-=0D
 hw/intc/spapr_xive_kvm.c    |  2 +-=0D
 hw/misc/mac_via.c           |  2 +-=0D
 hw/net/e1000e_core.c        |  2 +-=0D
 hw/nvram/spapr_nvram.c      |  2 +-=0D
 hw/ppc/ppc.c                |  2 +-=0D
 hw/ppc/ppc_booke.c          |  2 +-=0D
 hw/s390x/tod-kvm.c          |  2 +-=0D
 hw/scsi/scsi-bus.c          |  2 +-=0D
 hw/usb/hcd-ehci.c           |  2 +-=0D
 hw/usb/host-libusb.c        |  2 +-=0D
 hw/usb/redirect.c           |  2 +-=0D
 hw/vfio/migration.c         |  2 +-=0D
 hw/virtio/virtio-rng.c      |  2 +-=0D
 hw/virtio/virtio.c          |  2 +-=0D
 net/net.c                   |  2 +-=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/runstate.c          |  4 ++--=0D
 target/arm/kvm.c            |  2 +-=0D
 target/i386/kvm/kvm.c       |  2 +-=0D
 target/i386/sev.c           |  2 +-=0D
 target/i386/whpx/whpx-all.c |  2 +-=0D
 target/mips/kvm.c           |  4 ++--=0D
 ui/gtk.c                    |  2 +-=0D
 ui/spice-core.c             |  2 +-=0D
 41 files changed, 51 insertions(+), 45 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D

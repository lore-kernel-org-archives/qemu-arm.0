Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1708830lfy;
        Thu, 20 Aug 2020 14:55:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNK5WaQNcw/JIQZ+i35cUy5GDHR56oYKMXgZb+uIggwfOEuYJ7W4mwH+2iMK+5CugzqH7T
X-Received: by 2002:a25:e049:: with SMTP id x70mr443090ybg.428.1597960559314;
        Thu, 20 Aug 2020 14:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597960559; cv=none;
        d=google.com; s=arc-20160816;
        b=kjTMpcj0lbhCo1BxhP2MtIb2tl44V/9A7wiqwFQVY7TB1sufFOFb8KM8X599Zv3qMo
         236dYZnD6Q9zOHZGxGRjMiPFxIyJ1x7S5y3hungVcFm15tGAEzB6pjhlqZNHt8mtyitz
         KSfbELMRD1m3257Xd+urtZhmgCBjvMeO7+43iv7hmmXC8jYXfPJ0luW9GvMwS8TUwysD
         y+8aWAqhriiVaHIY9l3v9muX3jc3ND4VcFlX/36jwlr3BE482HkZ/oozjWu34b330HaJ
         5rney6tGf+cVdqnLsu4LVWtzEcDRyjVhR5u9pTUNXhbGMBdv6XIAA/08FkB5eJqatbBN
         IRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:message-id:subject:to:from:date:dkim-signature;
        bh=Mua+x27GNP9PoMRmh9desET01GYPNoFzw4YIF8qk/S4=;
        b=ntaE4vJMyQLfAPCxrLEailZEBO/wHcB+sCwA/AM9FbyT64sppdmCSBVKoIfaGV3tpn
         iLS+xx58BlGymy2mNlqkQ2qjOqyqnt59eSv1FiQU1XqtFosRHx+4s7aBaRTogW3C4w9Y
         WDIIycgzDloEGIbc9A1otR3+pcr6K71SuvFaL3MZUWnAyEUgUjkmm/WWaqc6s6Q2zFPw
         c66AKv7OmBKSdbYjDKjiiW+3nsjfJe2Xx+MAlwX8eZN5cqRJlbJj4GgbjETRYOZiqOPW
         wKZ4HdtdhinImn5nVTcZZjK3vv+AjxOCl1Axwd4Bon0la9ND8QkcoAY5w8Zro5wzy9zA
         CWxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EYHnQcA8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si2837217ybm.43.2020.08.20.14.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 14:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EYHnQcA8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8sXO-0007jL-M9
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 17:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8sXG-0007iX-Ik
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 17:55:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23702
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8sXD-0001Hg-VZ
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 17:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597960546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Mua+x27GNP9PoMRmh9desET01GYPNoFzw4YIF8qk/S4=;
 b=EYHnQcA8Nu1A4WNhvWAdaOph8Vrd5SoSKKFJUD8vXh2VIe8OHmAuuz8W8Z2sJimtmorFFE
 s7ZJQEcI8KUEysrfeLmzIaadwGMFb0C0QCk6zrkQ90N/FFdBhjBIoNC2qAy0tvM09snBgm
 3ORwDA7DA11tNOct6JB3Q3Zb3ZtyuDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-2pXW9Ak5Nv2rUFhHShv1Ig-1; Thu, 20 Aug 2020 17:55:45 -0400
X-MC-Unique: 2pXW9Ak5Nv2rUFhHShv1Ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95DEC100CFC0;
 Thu, 20 Aug 2020 21:55:41 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E30371780;
 Thu, 20 Aug 2020 21:55:30 +0000 (UTC)
Date: Thu, 20 Aug 2020 17:55:29 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Suspicious QOM types without instance/class size
Message-ID: <20200820215529.GH642093@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 17:41:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J2RjjEGivzrh

While trying to convert TypeInfo declarations to the new
OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
where instance_size or class_size is not set, despite having type
checker macros that use a specific type.

The ones with "WARNING" are abstract types (maybe not serious if
subclasses set the appropriate sizes).  The ones with "ERROR"
don't seem to be abstract types.

WARNING: hw/arm/armsse.c:1159:1: class_size should be set to sizeof(ARMSSEClass)?
WARNING: hw/audio/hda-codec.c:900:1: instance_size should be set to sizeof(HDAAudioState)?
ERROR: hw/core/register.c:328:1: instance_size should be set to sizeof(RegisterInfo)?
WARNING: hw/input/adb.c:310:1: class_size should be set to sizeof(ADBDeviceClass)?
WARNING: hw/isa/isa-superio.c:181:1: instance_size should be set to sizeof(ISASuperIODevice)?
WARNING: hw/ppc/pnv_lpc.c:771:1: instance_size should be set to sizeof(PnvLpcController)?
ERROR: hw/ppc/spapr_drc.c:771:1: instance_size should be set to sizeof(SpaprDrc)?
WARNING: hw/rtc/m48t59-isa.c:156:1: class_size should be set to sizeof(M48txxISADeviceClass)?
WARNING: hw/rtc/m48t59.c:691:1: class_size should be set to sizeof(M48txxSysBusDeviceClass)?
ERROR: hw/s390x/virtio-ccw.c:1237:1: class_size should be set to sizeof(VirtioCcwBusClass)?
WARNING: hw/ssi/ssi.c:88:1: instance_size should be set to sizeof(SSISlave)?
ERROR: hw/virtio/virtio-pci.c:2101:1: class_size should be set to sizeof(VirtioPCIBusClass)?
WARNING: scsi/pr-manager.c:76:1: instance_size should be set to sizeof(PRManager)?
ERROR: target/i386/hvf/hvf.c:908:1: instance_size should be set to sizeof(HVFState)?

-- 
Eduardo


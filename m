Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8948583lfc;
        Fri, 19 Feb 2021 03:45:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrfRItAfCuq4LcMzM3hziuap9ApC1uNG3VQw0zACQfdK2nbB1zlzaVUNG8izAIM2exWQUY
X-Received: by 2002:a05:6902:72a:: with SMTP id l10mr13440660ybt.350.1613735115529;
        Fri, 19 Feb 2021 03:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735115; cv=none;
        d=google.com; s=arc-20160816;
        b=eJSEnJTL9iJa33e72U3Q4lS9yfzcDPYio38axW96csSsYQBd46+XnMCwiwfCvAvkd0
         eZ7lQ8fdBwWA6ubJBspLXQvHDFtHEdNHgu8dV5iuIlidspi7ilw9obGXnEPkKBwYHT4j
         6tEE9G2xGxstnIGkDrrB2E1LQyRpG0y0Xplmn2GC1pQXNcwgjP398MO4V2PNXF5wxBLi
         a3AUABOI7WeYs/qrTK3gRHt4/sWREYwZ7Fb1LA0gBvdrYCAhMlyN9jhP2vL/aUyzwRQ2
         BQmV1NbseEiK2y6jNLmWoQ1eU3lRJSqGcFX6kz6Z9p4iTF6k7sVtVPeE0YeR2ndgFcXY
         j9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FJeJWkuxPCPnotyt/2IiMsA+rSkp6BRFBHnf/bs7Www=;
        b=l2oPdiyge7ax+Xw2UjSP9vvptYioUsRIxq59rBuqqQ5OIueJUnSJ3FArJkmMlXizTi
         qGiI7EbxG4KzbCVyZF18oWxrOMAnuC31O6XGZSn9iI/nxS9YaVOyzsNW9D25lPA0G2oD
         fGXCuAZaL4lX/PIGgGiUBNfXQVHbHKcg5s9gRulv3S6SBI+Ph6VXEokjOZg5EMPKaZ0F
         4gGwCbMsV8PSUyGM+f9AeMNR1APMmgdYn01gd3KaVAvV2fIjjqjDGQjlJzMN37Pjf+A8
         UQQ3Jtsf+2c//5Msm1kpzoX7uo4SySs3gX1XcCvWX5nSkIZ1J4uq7UTemKJch75qe3L/
         c9Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnJjkb8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si8579934ybr.488.2021.02.19.03.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:45:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnJjkb8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4Di-0002hX-Ne
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4D8-0002RF-Uc
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4D7-0001tV-9d
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FJeJWkuxPCPnotyt/2IiMsA+rSkp6BRFBHnf/bs7Www=;
 b=YnJjkb8eZEdX91mOIKAOl6jRxpGBVOnNzuwlZjVe+7qdr0e1KyFYVybnBSPE4qK7Zzn2Km
 qEUhyUn0qO9pQT9tHxk1dPuH0HPsQDeNKk3VMc8Lrj+s2GP0I86p5uAHs0+sFcIscHkXeu
 mOu9pBg75i8ukKV6WZbTZspYIHV9ZfU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-abOuHY-1PjOJUGCaTO5g4Q-1; Fri, 19 Feb 2021 06:44:32 -0500
X-MC-Unique: abOuHY-1PjOJUGCaTO5g4Q-1
Received: by mail-wr1-f72.google.com with SMTP id d10so2309341wrq.17
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 03:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBiPAh6j0La2jswV89eyq5qlhizmmpayYHhAIblEKKQ=;
 b=U4X/Wot6CdhUNdigwpqVz1xXCHZ4EFHCz6kgDQUGeJAMQCglzdifj/teJioAduYEow
 OijWzI1Yhng2cRoqyZgYFFcfgKbw0P4/j32Cdg762VdFK6s2t1XX/IeCP8dasCek4E94
 UiyG9alcFrSGnRb0I0z9avjxR0zwiJ4YaXkyyiLZ1tz2W9edj2fyotUcSqzJ7S5gX6xc
 MIn9qL2W/lBG/yLNE2qOsrMTce/Eq97dKiEGXvvKwbhEbDg3VTB0RBXSZPZWoVQ7iDGS
 cRK6IOhI2v2EqySA/KBsvCvt/XQIGFZ6PoJnOu2iCmhvX5ahTwVZ1K2HDxQsvU8A4fc7
 5wYQ==
X-Gm-Message-State: AOAM530JZRyIW8haL6eRl5ImSERqzVxKy6QPY2MaHlojDQawaGMYEIe0
 OJ4D6RmxV8Q2wOquLVK9Yvw72shxm8mW68V6/hc3/QA6duXFdLF/LNxH3wMmuNbcGvt4Qrk4WFK
 ujyZdetXY55sE
X-Received: by 2002:a05:600c:8a2:: with SMTP id
 l34mr7983455wmp.4.1613735071624; 
 Fri, 19 Feb 2021 03:44:31 -0800 (PST)
X-Received: by 2002:a05:600c:8a2:: with SMTP id
 l34mr7983425wmp.4.1613735071474; 
 Fri, 19 Feb 2021 03:44:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l17sm1537098wmq.46.2021.02.19.03.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
Date: Fri, 19 Feb 2021 12:44:21 +0100
Message-Id: <20210219114428.1936109-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j7SCQvF/CqJo

Hi,=0D
=0D
This series aims to improve user experience by providing=0D
a better error message when the user tries to enable KVM=0D
on machines not supporting it.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  accel/kvm: Check MachineClass kvm_type() return value=0D
  hw/boards: Introduce 'kvm_supported' field to MachineClass=0D
  hw/arm: Set kvm_supported for KVM-compatible machines=0D
  hw/mips: Set kvm_supported for KVM-compatible machines=0D
  hw/ppc: Set kvm_supported for KVM-compatible machines=0D
  hw/s390x: Set kvm_supported to s390-ccw-virtio machines=0D
  accel/kvm: Exit gracefully when KVM is not supported=0D
=0D
 include/hw/boards.h        |  6 +++++-=0D
 accel/kvm/kvm-all.c        | 12 ++++++++++++=0D
 hw/arm/sbsa-ref.c          |  1 +=0D
 hw/arm/virt.c              |  1 +=0D
 hw/arm/xlnx-versal-virt.c  |  1 +=0D
 hw/mips/loongson3_virt.c   |  1 +=0D
 hw/mips/malta.c            |  1 +=0D
 hw/ppc/e500plat.c          |  1 +=0D
 hw/ppc/mac_newworld.c      |  1 +=0D
 hw/ppc/mac_oldworld.c      |  1 +=0D
 hw/ppc/mpc8544ds.c         |  1 +=0D
 hw/ppc/ppc440_bamboo.c     |  1 +=0D
 hw/ppc/prep.c              |  1 +=0D
 hw/ppc/sam460ex.c          |  1 +=0D
 hw/ppc/spapr.c             |  1 +=0D
 hw/s390x/s390-virtio-ccw.c |  1 +=0D
 16 files changed, 31 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


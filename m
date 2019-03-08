Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8680775wrx;
        Fri, 8 Mar 2019 10:21:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqziDyepbD78mOB+MWP7sRJ2ICWhgXtf4aBwR4Ur4X13DLoXkvHqTyUruuGL9GPNC+8K+LGN
X-Received: by 2002:a0d:d4c4:: with SMTP id w187mr15881815ywd.41.1552069280054;
        Fri, 08 Mar 2019 10:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552069280; cv=none;
        d=google.com; s=arc-20160816;
        b=xeYD8w4UY8QnooG+6OqsgKFnlsnsaJ8qFLhIskhHt+HnAfR5tNefdGMom4t8jaJ9aS
         H9Y3H8AUkghssGTUXFIy4J1KehsNDWxKtymirkru5hpeajKzIZR0oElWwl1PlyDKzonA
         Cwh1IJoxq51lW+cSlDNWz+RkmvpIQS+jk/SEAaiTvRvFbmUxGuP3Zyzjbe5in8dbEsbr
         1ruYPFgvne3krtCQ12xrkF4nclE+vQDyEHVQf2wwzt+bGbpveVk0gfwIw37/2xybSSfM
         +LKUttasFNCReNzFHqFqbBJuibQG1qRaob7zEEWoA0/Dgds7KIoCPBte5FYbiNdQwShb
         X4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=6WqZQqk8gp5T6w2DJcRLmJ7ZkHDzmEj/G0oGquxvOPE=;
        b=F/JcPpbJC+/3AqQECrPNwJjYrewR4dnDhvPVVyQtgNO6K3xaghiQz5IY5Pf75uGcjw
         jLsj4+GnM16vxJR37juap+r1c4/24A2VMmbpaVBVolqL0uS64B3TIuLkbKJjms8HlIbp
         xsEDPdTFhXL4r+qPdQ8qxGeJ2PpnMBNyscyN6QPScOPCEIHYQaUrStOO2rUuZbCXRrbJ
         nSgetqz1ijJ6/N1wwdoTGNHQXu7fdcY8BhjIHBbVHGd/VhA1l8+8/nF1r1wqiEd67XzE
         vgloJuul01l+r2TfDe4eXa/GkzyIHfXEXwrh7o4IfsspW9Ta6cuO8+FRhyvxPsuEZEPs
         4dZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si1510964ybt.368.2019.03.08.10.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 10:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2K7T-0000QD-Gl
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 13:21:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2K7M-0000Px-Bd
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:21:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2K7K-00089j-3E
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 13:21:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2K7I-00088U-Hl; Fri, 08 Mar 2019 13:21:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 494363091752;
	Fri,  8 Mar 2019 18:21:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7EE15D787;
	Fri,  8 Mar 2019 18:20:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
	david@redhat.com, pbonzini@redhat.com, ehabkost@redhat.com,
	richard.henderson@linaro.org, sbhat@linux.ibm.com, philmd@redhat.com
Date: Fri,  8 Mar 2019 19:20:51 +0100
Message-Id: <20190308182053.5487-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 08 Mar 2019 18:21:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 0/2] machine: Move nvdimms state into struct
 MachineState
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vl03L6BTx22Z

As NVDIMM support is looming for ARM and SPAPR, let's
move the acpi_nvdimm_state to the generic machine struct
instead of duplicating the same code in several machines.

nvdimm and nvdimm-persistence become generic machine options.
They become guarded by a nvdimm_supported machine class member.

Best regards

Eric

https://github.com/eauger/qemu/tree/nvdimms_state_v4

Eric Auger (2):
  nvdimm: Rename AcpiNVDIMMState into NVDIMMState
  machine: Move nvdimms state into struct MachineState

 hw/acpi/nvdimm.c        | 18 ++++++------
 hw/core/machine.c       | 65 +++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c    |  6 ++--
 hw/i386/pc.c            | 57 ++++--------------------------------
 hw/i386/pc_piix.c       |  4 +--
 hw/i386/pc_q35.c        |  4 +--
 include/hw/boards.h     |  2 ++
 include/hw/i386/pc.h    |  4 ---
 include/hw/mem/nvdimm.h | 10 +++----
 9 files changed, 93 insertions(+), 77 deletions(-)

--=20
2.20.1


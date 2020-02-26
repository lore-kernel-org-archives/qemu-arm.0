Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3313875lfg;
        Wed, 26 Feb 2020 09:05:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6mQrUjG4aIy+c5mc9nFh57zknoq6LVpsLBIBNsjDu/t/eNJhEgKKJXhnxpGdzTJi7KaK/
X-Received: by 2002:ad4:4f90:: with SMTP id em16mr88263qvb.38.1582736744049;
        Wed, 26 Feb 2020 09:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582736744; cv=none;
        d=google.com; s=arc-20160816;
        b=DzmR/Hdswxk/jJ4oTHT4j3KVEC1tjiBIgrtzniE5GMOoFut6HtJG1O4i1HeE3X4M+z
         0wc/xROpmSxrtoAv+FSStF6XV/ga/TUP6Qap3DsKO6CH5KCMxv+7RiBYf1wuJSVaEi7e
         GRBpLnXmc1hYyPB0J+fWQzNMwGL/6az1G4q+JrdHSkQda+qGWeTjKwPsrkMBSrxh+VVa
         zYfctZsmJ44sJz5JWrRALvyKwAV6BhhhJk/6gbkg7EnR4gVDDahaK/gzj1gHSDGGQCLf
         zxDrTgjxzFbhKrVvWHvoKPL4QOdRqMxs4684lpBYi8FqlxoJ90XHU0tGt1cvqQKN0ltk
         IgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Q2FBRF2GnFjWJL/ZPum6bV29UkLuQo6IIE5h/kxtwqM=;
        b=Ep9T+c+qHz9aZr5Ky6r+kxYOr5+Mv2qpcTG/MPHBxPxU8veiyagIukUYq/7TVx4zoc
         YUI07ryQnpEiih5oBGC1MKHBa97ozhPKnIY5PqHCvN0uIzjgedtThb3ZRmtZic/m2nWq
         kY+38vNNZIfGn9X44h+KH3GBEDUG6tn4OLiX55WiRrpgXlBcXoeGIV1jPnBfXnBgzLQl
         OfFGnEwyzrSk79BiQZ8unTanW6vmE1X7/Qi+7+9XgvUAcc5bgqwLfvP1q+PifPnLtvLB
         Wqdgk+fKYKA3eBPw76tgjcpIPYOchh7KFbxz92LsQp4TqPGu8hiqVnj/WVC8VTYKGEid
         QjKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gO2aWafY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si13407qte.281.2020.02.26.09.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gO2aWafY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j707z-00051T-DL
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j707b-0004z9-8v
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j707Z-0002b0-Mo
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:05:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43583
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j707Z-0002VO-HZ
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582736716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q2FBRF2GnFjWJL/ZPum6bV29UkLuQo6IIE5h/kxtwqM=;
 b=gO2aWafY5AQfeDUOM9ibL7GLrWDy7y2DUZ/lrIi+ebnNkteiTAUOKdsclX+1LTZAs+1EYG
 QWIq1Fw52CCRZOi90N8cBrwYs2Z24y/3lh/ktoZwa7p80chau4B1guROHqwFCuTAXoCtw0
 7w+3dljD9eLaN+lsbClahpOCmajzTKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-9qGOtC0vMpSUnUlEKR1t6w-1; Wed, 26 Feb 2020 12:05:15 -0500
X-MC-Unique: 9qGOtC0vMpSUnUlEKR1t6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA13D8010F8;
 Wed, 26 Feb 2020 17:05:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB76760C63;
 Wed, 26 Feb 2020 17:05:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [RFC 0/2] hw/arm/virt: kvm: allow gicv3 by default if host does not
 support v2
Date: Wed, 26 Feb 2020 18:04:58 +0100
Message-Id: <20200226170500.17028-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KlPVhzLfOf6s

At the moment if the end-user does not specify the gic-version along
with KVM acceleration, v2 is set by default. However most of the
systems now have GICv3 and sometimes they do not support GICv2
compatibility. In that case we end up with this error:

qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
qemu-system-aarch64: failed to set irq for PMU
and qemu aborts.

This patch keeps the default v2 selection in all cases except
in the KVM accelerated mode when the host does not support v2.
This case did not work anyway so we do not break any compatibility.
Now we get v3 selected in such a case. Also if the end-user explicitly
sets v2 whereas this latter is not supported, we also are
informed that v2 is not selected by thos host instead of getting the
above PMU related message.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/gic_version_rfc_v1


Eric Auger (2):
  target/arm/kvm: Let kvm_arm_vgic_probe() return a bitmap
  hw/arm/virt: kvm: allow gicv3 by default if host does not support v2

 hw/arm/virt.c         | 41 +++++++++++++++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 target/arm/kvm.c      | 14 ++++++++------
 target/arm/kvm_arm.h  |  3 +++
 4 files changed, 51 insertions(+), 8 deletions(-)

--=20
2.20.1


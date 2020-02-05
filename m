Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6533547lfp;
        Wed, 5 Feb 2020 03:06:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGtUjULlJxKQ4ZhwbXN3Y/46DfN+moYduL8I5GNQf3AnTuIxFGFd5rxHdtF5LhHCbGR6PV
X-Received: by 2002:a05:6214:10c1:: with SMTP id r1mr31747756qvs.70.1580900815926;
        Wed, 05 Feb 2020 03:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580900815; cv=none;
        d=google.com; s=arc-20160816;
        b=OxEp0g5S/6lqjyhlEkg6eDIgtOe3WSK+09xGtBfKna/WCetSUFdq6VDHSM3ehtF6Lr
         u1PXqGJALEnOHTQ7LPLPiuGFRmtOx0aM9ek9cbyKbRCJiKGtY/KfDOtoiaIHJL43kPj/
         /niHV0RtjVJoiDSaDZUQiVw6yz89e6Frf60bdvLsrMGxxVJ1do0iMcG47FG1hsPkM95g
         IxxDBL0DUmrPuHcqhrq4OHoKEm6iuwAcNT8WhtUwNY/1y57bC4jv2u1IbUEArzpTlpFL
         DTf99btvp1Cg3iKKik1r09nm3RJGlkjxCwCMoPECdLvOMyfAxt8v6qS0hzSsN7XPXURz
         4S3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qh2lAYN9mfnlZ3ypiOWt9zSlEsUPgnszltHhu5G8D08=;
        b=prnfhTQ9CfZiro2UdiwGb2Dx9jKz3IJlhVKSC7l60vdIY/01d4m5OcLyoMjsGu+7HC
         s8nk6bqPl0OoiU5W1ddejAkh8Pwmd/VisfMUL5s1IVK7SJOLjaq0kYiy51lraIputyxL
         FCwQd2eI7LxyA4x+s2JwqokZf+p9Ir/xWKqf17Tu6MRBwyztA6uBpd2/9+CKcMR5JQNr
         CCO4LiLOnX7hOaZVj122mWS5ODrlhEFGbXq/PTEOF93XMBmQib9PcSaYZOnHSY+vA47D
         Emw75hynHtEzB/celiviRctNSPwIWOxMB8egnaWf7Kn0yG7YorAo8ysa53aW8bTs3s9q
         PdRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WYl6UivP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si4962182qki.29.2020.02.05.03.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 03:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WYl6UivP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izIWF-0000XT-BB
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 06:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1izIVM-0008P5-Me
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1izIVL-0005tj-I2
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:06:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38561
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1izIVL-0005s2-Dh
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qh2lAYN9mfnlZ3ypiOWt9zSlEsUPgnszltHhu5G8D08=;
 b=WYl6UivPNoETyERrAmWMBR0qqcbff9M8SVhoFr896OZl5kZm3jx9WCazuZIsQSb9lNtUdf
 oGEvO24xT8FfhAKZbcy3/tX0LXM7fJ4jpnXq8z16jwsaeYL1Y0zC91mtBYkM6Iz470HbWl
 EDdZ3vTHf5ldqzuFypZM6kmvwxQ7EOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-YsqQFv4sOFe8bLs6_ywzmg-1; Wed, 05 Feb 2020 06:05:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EB55DB25;
 Wed,  5 Feb 2020 11:05:53 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-31.bne.redhat.com
 [10.64.54.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92A5790C0;
 Wed,  5 Feb 2020 11:05:46 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RESEND RFC PATCH v2 0/2] Support NMI Injection
Date: Wed,  5 Feb 2020 22:05:39 +1100
Message-Id: <20200205110541.37811-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: YsqQFv4sOFe8bLs6_ywzmg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wRWGNEEBN81S

This intends to support HMP/QMP "nmi" command. When it's issued, the
SError interrupt is injected to the guest. The guest is expected to
crash with it. The behavior is similar to x86: NMI is injected to
guest as error indication. The guest possiblly crashes and reboots
with the injected NMI. Note that the functionality is currently
supported on "virt" machine and {"host", "max"} CPU models only.

PATCH[1/2] allows to inject SError interrupt, which will be used by
the subsequent patch. PATH[2/2] injects SError interrupt when "nmi"
command is issued. With that, the guest is expected to crash and
possiblly reboot.

Testing
=3D=3D=3D=3D=3D=3D=3D
Start linux 5.5 guest with "virt"+"host", or "virt"+"max". The
guest crashes and reboot if "/proc/sys/core/panic" had been configured
properly, after "nmi" command is issued. The following error message
is given on "virt"+"cortext-a72": "Error: NMI injection not supported"

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
v2:
   * Redesigned to fully exploit SError interrupt

Gavin Shan (2):
  target/arm: Allow to inject SError interrupt
  target/arm: Support NMI injection

 hw/arm/virt.c          | 18 +++++++++++++
 target/arm/cpu-qom.h   |  1 +
 target/arm/cpu.c       | 59 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h       | 12 ++++++---
 target/arm/cpu64.c     | 25 +++++++++++++++---
 target/arm/helper.c    |  4 +++
 target/arm/internals.h |  8 ++++++
 7 files changed, 120 insertions(+), 7 deletions(-)

--=20
2.23.0


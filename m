Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp477672wrg;
        Mon, 20 May 2019 11:11:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1WIxYsJOVRR8lWGKtp+SVQx8C+FtOuZ7TJXFrp9gkalzN/Q9q+Dz9FoD9C2Dl581Ni8Kk
X-Received: by 2002:a50:ba6e:: with SMTP id 43mr76315296eds.201.1558375908282;
        Mon, 20 May 2019 11:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558375908; cv=none;
        d=google.com; s=arc-20160816;
        b=Hv071W4y+PFgZdUvTi/xtmmnwlWCcW5b+iFKG2llYD5upPY5UvZuSajKk7o/XzdxR4
         HSnVf/OOdtASqw3tlcgxhgzpZNYJDbl4qOtx0o8eAmdo+QxcrwS7rDNaSam9yF++4+RO
         ahl/V0zsd5QH/jB7KGTHorGNINEab0Y3ERz5FggENsnHVZMuWcNdkUFD2qWg4K5eskK5
         fxoyq/6uBxQ2WO20zLvfAjyzOyAQN/m3XZLUabRK9IKq0h9yVJ6Sp/WqluJx4Q28aVcl
         9/4LXPGZgIj4m/60cIhvDm6fT/jiDRzfF8SCbVFB+V1mvtD8K1MKzZ7uJwGKg9RwdIGa
         AkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=c7pDZ4+31NG82JYBMTohg2ef4aTGu5k8+VqpOQD04Ps=;
        b=V/pv0WB1iDw879+LWMhi2l0Z4w/uEQL4JZHyHdsSU814r/hdqh1ZkFKwfSF5zelGkN
         Y+ztRM+JkCD9F+TgRQ+2umMs8G8UuqnghsXkM9M+RKmM3XSUIHOJWtfDjVCKzHTOEmFC
         uv9diEc/sI1JPqvVTE+sRSGi4PlNk/SbgfnQnc+8R9rUD0XdvxLen89gxvwvLhZ6TFZa
         RaJ2c6mjJKEezCbwchLMJ/YwDzS2IyAfK7L8ZF0NI8MwE23UrEJIUXckigiazWm+KgUD
         C8mLLAiKqUcMe2jNBCNpJCQ5gIyZwUTE7fw5KPmRCcAmqWUDAoGjPzoNEhuSTTG4Z3M2
         bw4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si13431149eda.158.2019.05.20.11.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 11:11:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:39985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSmlH-0004rB-0h
	for alex.bennee@linaro.org; Mon, 20 May 2019 14:11:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSml1-0004iK-LJ
	for qemu-arm@nongnu.org; Mon, 20 May 2019 14:11:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hSml0-0003Z6-0p
	for qemu-arm@nongnu.org; Mon, 20 May 2019 14:11:31 -0400
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:45392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hSmky-0003XK-8B
	for qemu-arm@nongnu.org; Mon, 20 May 2019 14:11:28 -0400
Received: from player750.ha.ovh.net (unknown [10.108.35.232])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id E969F173CEC
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 20:11:23 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 49B41610F68A;
	Mon, 20 May 2019 18:11:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>
Date: Mon, 20 May 2019 20:11:11 +0200
Message-Id: <20190520181111.20407-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17134789207616162815
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtkedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.108.172
Subject: [Qemu-arm] [PATCH] ftgmac100: do not link to netdev
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Wim Vervoorn <wvervoorn@eltan.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gxUGjBMFUdeW

qdev_set_nic_properties() is already used in the Aspeed SoC level to
bind the ftgmac100 device to the netdev.

This is fixing support for multiple net devices.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 790430346b51..d9986c6baa92 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1016,8 +1016,6 @@ static void ftgmac100_realize(DeviceState *dev, Err=
or **errp)
     sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
=20
-    s->conf.peers.ncs[0] =3D nd_table[0].netdev;
-
     s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
                           object_get_typename(OBJECT(dev)), DEVICE(dev)-=
>id,
                           s);
--=20
2.20.1


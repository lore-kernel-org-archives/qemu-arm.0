Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3203173lfi;
        Thu, 5 Mar 2020 09:59:08 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvXJq8MkP8C+v9Cu1BaePmXA3EGGA1qu1Kpq9ws/yoipU27Xusohwk4REnUb6winFOAdYPx
X-Received: by 2002:ad4:58ea:: with SMTP id di10mr3427354qvb.101.1583431148087;
        Thu, 05 Mar 2020 09:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583431148; cv=none;
        d=google.com; s=arc-20160816;
        b=gcTYK+kIKQ6UFV0GyYdsWX42vDjndb1uwPqxA6zG9Vd/qo47zqefzHVUkzWpbJ6/OV
         +LbvT8O2s0ctET3ZQq1oYd9F9oMD1vsdrKGoJTiYdrSkkuXVPLg0crJ4URzaV9m9J5PJ
         knn+Z/YGO/1x6yvNX9V/lx4+FdFs9LCebFyo29bLa0/RzTuPsBRXVCpQ44cJhhDNqUuW
         14t/9ouKaWLiKucuJYfCHKjdgQyEezS9TbrQyCayI0vDArooq89+FadWMYk9B8emb0fz
         6GFIaJR77cXW+c1/CKuSgFG4qJZYRlKpVgiTs6zU0v4RLQJLS5sbQpjNUge6FAxWv87C
         lMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NGHswVvKeRQxvy0qEQcO1JqCKgI3zH8psI7B4R/7eKQ=;
        b=MUwn5pCAix0RxzRohLQntC2sajbkZ9wCC5VkVIOdGbIApuFP1cv30X0yqeFIPeM/I9
         Ye5vZ6ql8nmTtb/9rbxJYek/j4VS+x+Yfp57a7ypXx19FqAZfWjterU42wBXcdkYXc4W
         1Jcphv8e4+4QSggdxbBEeWtz7+4HenNzGZC/yRyvyc52B3HqaIvoYnnCJRLn6QWvhjib
         mxrch9YXb8NLLe0QnyecdEo0UZ0F4cmvKxVp85LB8tZDouAUrD7FOO2VzSIR9nRImnca
         uKLvbK+yS9CgFyoEEWHkqa4ALCZBKmNbktF/W7Lirb+iuaAZyCrZooeZPkqV+xOA/SD5
         L9fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M5cN9iEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x27si3535269qtm.363.2020.03.05.09.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 09:59:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M5cN9iEO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54377 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9um3-0002Hn-H0
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 12:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9ukC-0007PI-QG
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9ukB-0002pf-Q0
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27839
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9ukB-0002pL-N1
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583431031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGHswVvKeRQxvy0qEQcO1JqCKgI3zH8psI7B4R/7eKQ=;
 b=M5cN9iEOPFcW+N/CiAJk18qybamIA8aJ7osIq7gxBMRpZzshSWf2fUw3YpRgOWv/SerOe5
 Ai6ppMrI8ZwJGprtotP/KLRnd9mhPhkDIrtGUXC/2oq/khUsGl7lPtmEhkHYEM5/5r4vM0
 Wy/nixJZNoV4jreDipHzTxkjQvapwcs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-TrieVVcbNLe9xSfgYmMfzQ-1; Thu, 05 Mar 2020 12:57:09 -0500
X-MC-Unique: TrieVVcbNLe9xSfgYmMfzQ-1
Received: by mail-wm1-f71.google.com with SMTP id r19so2383200wmh.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 09:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60PR0G6qPI4q8UeizT2SJgOmqcakhr9AMbPfUXTnwEg=;
 b=uhecYVqr18dDo4DScslOQIQ5QCFN8P1aYgmF73JJRiIfcGVeSnbkpDr0Mh1SU3tzzw
 3TGxmkxRCwSm1cC1cZOthiHdAofcXMxXsOeycZE0dvGQoIaZsJArS9zqWuyU1gA295J0
 cUlIQM6hdkYpcqu+YEBr7Q1LF9HBCoTNbNHMIk4JUVuXIOIWloYHTTKlVt89mf2rpKeK
 5QENR4ROilDreoiUV1ON7T97eRCr/I903oPKJTeBmgkYCt+m+OJMZsoBW4wekOAZPxfK
 +M8BsYdDVRV1ntpZ6ZBFded7vVrg5Stu3YyVIOZ6x8RZjbfdlrENx3ygdDqIpiNKifMq
 Q7SA==
X-Gm-Message-State: ANhLgQ3DVtX1MRl/ytWbfTRBsBSuBXOcpqD0CFVjSxXqtx4gmyHYS1rm
 j83RADXy8xVxaPCcrWBRtQCdbEj0N/0MAS2LBJsgZMoO4I46czn3olC2l7R/FgzQMdXGUbFd1bC
 6XNEiZzWI4Kwi
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr104568wru.35.1583431028615;
 Thu, 05 Mar 2020 09:57:08 -0800 (PST)
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr104543wru.35.1583431028408;
 Thu, 05 Mar 2020 09:57:08 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id r28sm47991406wra.16.2020.03.05.09.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 09:57:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/net/rtl8139: Simplify if/else statement
Date: Thu,  5 Mar 2020 18:56:47 +0100
Message-Id: <20200305175651.4563-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305175651.4563-1-philmd@redhat.com>
References: <20200305175651.4563-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7v1DeURzZQO

Rewrite:

      if (E) {
          return A;
      } else {
          return B;
      }
      /* EOF */
  }

as:

      if (E) {
          return A;
      }
      return B;
  }

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/rtl8139.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index ae4739bc09..ef3211537f 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -808,11 +808,11 @@ static int rtl8139_can_receive(NetClientState *nc)
         /* ??? Flow control not implemented in c+ mode.
            This is a hack to work around slirp deficiencies anyway.  */
         return 1;
-    } else {
-        avail =3D MOD2(s->RxBufferSize + s->RxBufPtr - s->RxBufAddr,
-                     s->RxBufferSize);
-        return (avail =3D=3D 0 || avail >=3D 1514 || (s->IntrMask & RxOver=
flow));
     }
+
+    avail =3D MOD2(s->RxBufferSize + s->RxBufPtr - s->RxBufAddr,
+                 s->RxBufferSize);
+    return avail =3D=3D 0 || avail >=3D 1514 || (s->IntrMask & RxOverflow)=
;
 }
=20
 static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, =
size_t size_, int do_interrupt)
--=20
2.21.1


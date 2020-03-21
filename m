Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2210338lfe;
        Sat, 21 Mar 2020 07:43:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuEXvdnHT5ncFLiwCSqRDEk0/qqT41Pg33LfdoxmtiBox/mk2sRS4wuVYPs2d35r9vdRd9q
X-Received: by 2002:a37:a749:: with SMTP id q70mr10428035qke.226.1584801829230;
        Sat, 21 Mar 2020 07:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584801829; cv=none;
        d=google.com; s=arc-20160816;
        b=SC4qm/EFgVdmbVfRbYd5r2UYKs2OOJVqFqffvzInqaS1KGHodiAVXPxmdChC3mCDBy
         SA8YVt2lN6lnOgOEeGmneLnuJyEL7vDdsCO7FiHgHdF9Ot86WsXi3+9zh45iurUsfiKo
         Mwb2nt+shdpYWlEifI8i2yHZuL1933NiROPLuO4DF2Py7FBXRb4CANa0ovaTGVmuf3mo
         UfNOqo/LAWokIjHmUpbn+U1oGZFLiBbisvPC5/eGD490kIJZvDRvx92UIek90JcHwgxC
         r3gRN390GINpYHvK/gxiujEpV8/c1F5EUFd9PSC3CcyUcF+seVImUYVGK4oNH3PrhXDY
         9lIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
        b=egk3uFLShFntdpBSJny7QrD9vscRqCekV4wR4tzTjS6wgZuSlSy5S5bZD13N9Wld4Q
         jzFoyUfFJOMYOIw6ZxYAaPf54555yDl3Xc61k34NUaBblOr0RizMEA/KdxxaWC4SWjfk
         AkYpa8L7IFKzE5pNTJbkkSZ5We4llhyCFtoEckDPtSQ4Qcg0egYXv0Zq6AGYOXzyDDM2
         aXxZBxOO6TaZlSJ1GjrxDGs3TpPPvoXD8aaxk0KF8Nwl5L5wIs8XuR5J0wjxQfilP12c
         BQWh9z8yq3vFh6iK4164M2Xv100L43Qi3qo7eBrOuhY1CEFfPchllEnF0sDOXAdLK+eT
         8qTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OcPR5Z8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si5267569qka.114.2020.03.21.07.43.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:43:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OcPR5Z8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfLo-0007dd-J6
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfJb-0004ho-AL
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 10:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfJa-0007H1-7O
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 10:41:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:33211)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfJa-0007GM-3V
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 10:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2U6ARuvMvLKS+fqGTEoijz7r0B3fBwOwTnOOBFQNRAw=;
 b=OcPR5Z8MaC/teIqHLYrkBtvCh/3ixO47hPlR6SsEbjxbANl5zCrQSKJc6neBDahnrxoSGL
 VQSxdpN6BrtgN20EssYpBLC9/Q+R+Kx3E54Q1GAzsYCt9i62Vu1coHFCAoGtqG/m6u+aIT
 klqjpXjuJN/5FAHzS16xpfv2c4X8AYU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-Ta8MsF--PWKq39LolxhfaA-1; Sat, 21 Mar 2020 10:41:28 -0400
X-MC-Unique: Ta8MsF--PWKq39LolxhfaA-1
Received: by mail-wr1-f71.google.com with SMTP id b12so4405662wro.4
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 07:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ez+E9s5mwrT8B9y8nVUYgFPf3iN6ckUcWWVa90evmD4=;
 b=oIbfvpHOtT4+CvVWq1QjXwByxA++YVyEFROpeEbrfnOf4eEMyXTfBGUf02tRP/l6GU
 t6z1lPcJa/gvb/3BfW8h5YD2aMiijm3YnGjxbsf1NeXnJKtcz7VXg6EgMlBBnatK2nrE
 sMwDHcBRQMrvE3yU261+vPDJZedNh6DVTPc8PMIu0gfBP2lA+3kRyuATMfj9mlR0nD28
 9Dr272M+OlmrsynyAyMl6zetRtvKMNRehkHVW9D60DuUR8qYlNr0GC1MjhHr1mSg6S86
 +cpM5nO4OfzTGizUXPkdvNMvOtWeUnIJuM+TVwtwFjZdRhuYd/8xm4S2veEcAdSB8Q39
 NU6A==
X-Gm-Message-State: ANhLgQ0HOkrxculNTpFisulYy+PZM4UeTN31TAh1qA7VMXy+TsDDKZzc
 eEwQFzCzIM/qWuZgGlQX2e8RgRFAc3cLn00cy3hqJByHp5TNF/cb6RYOuoXEB0/YJ1y/oOo2dRe
 7TvT/EA6zz7d7LZg=
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr17944858wrh.359.1584801686947; 
 Sat, 21 Mar 2020 07:41:26 -0700 (PDT)
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr17944810wrh.359.1584801686647; 
 Sat, 21 Mar 2020 07:41:26 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r3sm14054273wrw.76.2020.03.21.07.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 02/11] blockdev: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:01 +0100
Message-Id: <20200321144110.5010-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gGxKW4f71Iv8

Fix warning reported by Clang static code analyzer:

    CC      blockdev.o
  blockdev.c:2744:5: warning: Value stored to 'ret' is never read
      ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index fa8630cb41..6effd5afaa 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2741,7 +2741,7 @@ void qmp_block_resize(bool has_device, const char *de=
vice,
     }
=20
     bdrv_drained_begin(bs);
-    ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
+    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
     bdrv_drained_end(bs);
=20
 out:
--=20
2.21.1


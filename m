Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1069713qvm;
        Tue, 14 Apr 2020 09:41:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKB9+ciqzrNoqkkCPb8HGi4iM3mVgPgApu+vGjvLE4JowZbkIRny2V58fXFD7qcjzc4dfXy
X-Received: by 2002:ac8:582:: with SMTP id a2mr11291217qth.62.1586882481881;
        Tue, 14 Apr 2020 09:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882481; cv=none;
        d=google.com; s=arc-20160816;
        b=KDhxwtyMrDSr+naxmYpsnujuPTD268B0ZhLz26DdudXsMG7YwFT97mS4sBi2bBecGs
         PCeKeNnogKjX1ESZ/tSuNYExfdZW9zHrJxB2KI8E4ddAXOp0eEW5eXp4d5lC7VlwrvOj
         hQJHocGwnLmMsz4JqdAnP7YdC4SgKczlGrlS+6+XvRPhdXoTXU9TlU/YoVUwIYGArSdF
         aiJ4HZuKBexuorl3xSvL38jra7cAbOFoSMkpBOpFo/xmx5ktuhlgSKuFDU/Eiyp8imj3
         pgowtrSVjd3eKZHabeeWN20Rf2eDDcm9qTGhQGyZv79K5yWylGeocQxADUlN3vgly1eH
         pLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sp8SzHLCDmolhv1WuiLlsIvFgsrHTJti0rZsOPUJPyM=;
        b=e3ZV4Uf9VhpIs/xH68VJKVB6znj7BqZY/YpAA2F1fJq8oNgYz+q8MtOEcv3BiOdKj9
         QxFwXag7RJnJTfz5lKde/0aawgmVNYdFX92xZX80bAUdMxybfht+MkyvXMda5UWS4ODE
         Y/rKB6ignzNfQIGrYEUW/hGzQkOleE5ZEVKhTkHQtKhPy/Nitr9OnmcEu3xuxm9QTdKm
         1jz85mToVMk/pNzZN0GSbKFPbC2E/XEfFA9QiyTtRKpXEwq7TxOcpDp3YVsiBndyMjkh
         bmndm3dQPw4LCMmIZxUCNg0Mui+P2ekTFvAZT5RynJtKC8+SlUYQTfqM5CKQAGSlxshG
         Z2Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cQnypWVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u44si7848171qtb.5.2020.04.14.09.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cQnypWVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOcj-0007Xy-C6
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOYT-0007LA-RU
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOYS-0004Cw-Qv
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:36:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50864
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLf9-0008KT-Ju
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp8SzHLCDmolhv1WuiLlsIvFgsrHTJti0rZsOPUJPyM=;
 b=cQnypWVCX0fPjzZRI0wuB3doh8KrrmU06K4SNXKYILrLq1aB4JGQ0kfwtajmwfQO3VRoO4
 0vKcgUJEOV6cXSSH2TVezUF3pTNWE3oekfEOYzrisnGYqrVLp4peKFczX0GCJr8Ca//ajZ
 Ag9JUENus5G6h8bpngnK8ozcTJYMOk4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-_snEm8tYN8uVMlwAkCOa2w-1; Tue, 14 Apr 2020 09:31:37 -0400
X-MC-Unique: _snEm8tYN8uVMlwAkCOa2w-1
Received: by mail-wr1-f71.google.com with SMTP id m15so8743724wrb.0
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tNX3//qXDnRxcPpWRn8QtDnslzojVakNKy5THztVse4=;
 b=DNd19TbuWtymqMNyaYAYjHVC8I5+hP8ELT6H0tSglXYi5/sSB6jMPbpP/yJAry0mAE
 s2Iq3MH1NOOgqsyfWH2ZvOwC0ksv8WZsSQfId8zMaMrfAQAk4jhVG7pJd6116AE7+nMg
 Wm0uipl8oZ+KEoDKAyneQufQExPKXBYXiIADF4pMdZ0zTeooC0XmcNDjzocF673ZJiPk
 cctPRZRP0lvSLmlFY8yHeHQc8m0jlLJ93a54iAm8ocCVike/VGquEZYBipn+fn+Q3WCd
 33j1UzvZPea9vIaNuIWWgjW2Qc441X47JGMkf5nwqJn9qws31bAYLlUGGl363cJjLzhF
 e94Q==
X-Gm-Message-State: AGi0PuZd6lpfA7NSBoOsmikpKJ+lyIGFykP8mX3MSfbKLWgz6H/nTShL
 V1ixK1mh3jawg7Hk9UG5ociez+MfCVdeBajJ5ZpYnsSBm1l7qTvZUhbJ6GU8fMh7RPpkA9cj5pL
 TXyzta/KwX1i+
X-Received: by 2002:a5d:460b:: with SMTP id t11mr21176980wrq.319.1586871096166; 
 Tue, 14 Apr 2020 06:31:36 -0700 (PDT)
X-Received: by 2002:a5d:460b:: with SMTP id t11mr21176965wrq.319.1586871095937; 
 Tue, 14 Apr 2020 06:31:35 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id t13sm2952131wre.70.2020.04.14.06.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 08/12] hw/misc/grlib_ahb_apb_pnp: Fix AHB PnP 8-bit
 accesses
Date: Tue, 14 Apr 2020 15:30:48 +0200
Message-Id: <20200414133052.13712-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckzVCe5qW7Hm

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The Plug & Play region of the AHB/APB bridge can be accessed
by various word size, however the implementation is clearly
restricted to 32-bit:

  static uint64_t grlib_ahb_pnp_read(void *opaque, hwaddr offset, unsigned =
size)
  {
      AHBPnp *ahb_pnp =3D GRLIB_AHB_PNP(opaque);

      return ahb_pnp->regs[offset >> 2];
  }

Similarly to commit 0fbe394a64 with the APB PnP registers,
set the MemoryRegionOps::impl min/max fields to 32-bit, so
memory.c::access_with_adjusted_size() can adjust when the
access is not 32-bit.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20200331105048.27989-4-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/grlib_ahb_apb_pnp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 72a8764776..d22ed00206 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -146,6 +146,10 @@ static const MemoryRegionOps grlib_ahb_pnp_ops =3D {
     .read       =3D grlib_ahb_pnp_read,
     .write      =3D grlib_ahb_pnp_write,
     .endianness =3D DEVICE_BIG_ENDIAN,
+    .impl =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    },
 };
=20
 static void grlib_ahb_pnp_realize(DeviceState *dev, Error **errp)
--=20
2.21.1


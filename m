Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1064549qvm;
        Tue, 14 Apr 2020 09:35:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypIJUeDwcNREluFe7OfBk/8dFFWzJwYeClzWj88kheJDQfFcrVZfdV/Cos2zy6ep53rRtTq3
X-Received: by 2002:ac8:5290:: with SMTP id s16mr17207353qtn.120.1586882130986;
        Tue, 14 Apr 2020 09:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882130; cv=none;
        d=google.com; s=arc-20160816;
        b=l9QVNnquH1fIrxNE6qoSA+hKLcuNzTbVI/27YjB5Sn0qD1EOT61UsTxxa35YbxJUqp
         2wRuYOoNf4C0wSxaxRlhAjZsaPFaBwNzNJKQ0ljZ6PO2HsFjExs1gstM9k01HmryEOzl
         I6mbb2OLgTLLAwNxK1JnDMDE32Ug8lL01z2mPiEV0bl5W2PbgRnImzfe8MHwABUTMPFU
         qCvE127Q0TNzQt3NIn7unjGLltGjTuZEWNHKFb+Gbo2Yc+6dKulfD+rRZITiRwemmcPK
         zGNCPt6DreV2jXFMnlEDxbbconwTWzwiTcbNoDPaURsVyziUCNbbsP1Gw+oEP4YWqwQO
         8Jyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YAfEGA4pShKXRTklWkYx1xXMbd4XoGQUU9RSc9eismw=;
        b=PmcWUagQA+UUzQgw6pKIqFgEZMKpcX50qegMk4LkZvfleVNAPeMYAwVdRCGg7/Q4ck
         lAhHPWC0XGRPxKHQypnIkAbwjLj9Z+BNVLAXRqBsEVcqGEfb+nAUNaMzg9duN7gWdvf3
         6JTYx8i35L1kE4JukKA93H7g4pE9N8fmHazq7lxLftT2E7UG+kKEgLLmbN+IrEcENHce
         qxHVtTzlnScntlGNX7mVsEvOS6Mcwrg5JfJ7W27APzUUPLVV3d7ZKnU3lTq+juh6oKHS
         qmtmDeDmUpN0gGxodPzm3F6eLk+Jxrc/II2fZE9U4ZTSBnuByd+6BUxFu29uHV358Pav
         bH7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T4MethA7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28si3977390qkm.241.2020.04.14.09.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T4MethA7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOX4-0003iE-FL
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOS6-0005Gu-Mk
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOS4-0000dX-Ex
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:30:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37296
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLf4-0008JT-In
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAfEGA4pShKXRTklWkYx1xXMbd4XoGQUU9RSc9eismw=;
 b=T4MethA7voJWKGjKKYvNPmXRgHLi+tJZ8tSDIvQ4IRKhp6qwvmoBL8dQ/XUL7TGzIivUOS
 aoie3BKTXd9A31DezrNxGYKBmiMyr32nA+pq9dLat11N7PGahgWvMGDV+j5cH2JQUto0wP
 Ns2X408AXii0E/QyMt0/iOGLcrg6KcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-EgdhwhkWOzyD8oAqmnu0OA-1; Tue, 14 Apr 2020 09:31:32 -0400
X-MC-Unique: EgdhwhkWOzyD8oAqmnu0OA-1
Received: by mail-wr1-f69.google.com with SMTP id m5so5561897wru.15
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 06:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R16ilq50Jn1I1kGv3Dmicd9P1j+Zk5asckFlP1ZiX90=;
 b=BBX2+9wwK7a+doBbpBbwWeT+jZaqV/XZlobUYEqV9wWcqBj87wvM/MpqXxfK4QFdAy
 sy2gnmGYMp22XBNWnkN3tC7m2eMzynAMwFMn4c/HqGmc+tqjdez1BWRB7fawcBiw46EA
 cWB3lN9pEFXG1wL5lpldbjkD9fCpG6FJvczFyz5SANMFIECi8ib5MU8YjEqBFi+qnv+J
 JbGNgbSYSo6WkavhNG4262p5GlPvaAZIwFDokeP7TzxYD96hOOTNzee8er0Okm+PFoba
 5jaSHwMfxh1wsQbBfqPfI4JQHI3QvMzDNTlTW9Odj+jRPsgAnshwpNxGvx3am13zU26L
 3h5Q==
X-Gm-Message-State: AGi0PuYxCQfcoq/DnNRQw8Vzgdxr5EL3wzlCAkdyYGUc+kbIQCXRZHLd
 b/w540cSIpmCZDtxMgqNBwB0kOk4Xj6L6GldkjPQbBIegwUuiIewAEBUBzQV2g2xcgYl2lC24uG
 RLgjAam3YrOpPf90=
X-Received: by 2002:a1c:2b06:: with SMTP id r6mr25127865wmr.25.1586871091259; 
 Tue, 14 Apr 2020 06:31:31 -0700 (PDT)
X-Received: by 2002:a1c:2b06:: with SMTP id r6mr25127835wmr.25.1586871091004; 
 Tue, 14 Apr 2020 06:31:31 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id b11sm19174133wrq.26.2020.04.14.06.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 07/12] hw/misc/grlib_ahb_apb_pnp: Avoid crash when
 writing to AHB PnP registers
Date: Tue, 14 Apr 2020 15:30:47 +0200
Message-Id: <20200414133052.13712-8-philmd@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iU7QrP7LPlIV

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Similarly to commit 158b659451 with the APB PnP registers, guests
can crash QEMU when writting to the AHB PnP registers:

  $ echo 'writeb 0xfffff042 69' | qemu-system-sparc -M leon3_generic -S -bi=
os /etc/magic -qtest stdio
  [I 1571938309.932255] OPENED
  [R +0.063474] writeb 0xfffff042 69
  Segmentation fault (core dumped)

  (gdb) bt
  #0  0x0000000000000000 in  ()
  #1  0x0000562999110df4 in memory_region_write_with_attrs_accessor
      (mr=3Dmr@entry=3D0x56299aa28ea0, addr=3D66, value=3Dvalue@entry=3D0x7=
fff6abe13b8, size=3Dsize@entry=3D1, shift=3D<optimized out>, mask=3Dmask@en=
try=3D255, attrs=3D...) at memory.c:503
  #2  0x000056299911095e in access_with_adjusted_size
      (addr=3Daddr@entry=3D66, value=3Dvalue@entry=3D0x7fff6abe13b8, size=
=3Dsize@entry=3D1, access_size_min=3D<optimized out>, access_size_max=3D<op=
timized out>, access_fn=3Daccess_fn@entry=3D
      0x562999110d70 <memory_region_write_with_attrs_accessor>, mr=3D0x5629=
9aa28ea0, attrs=3D...) at memory.c:539
  #3  0x0000562999114fba in memory_region_dispatch_write (mr=3Dmr@entry=3D0=
x56299aa28ea0, addr=3D66, data=3D<optimized out>, op=3D<optimized out>, att=
rs=3Dattrs@entry=3D...) at memory.c:1482
  #4  0x00005629990c0860 in flatview_write_continue
      (fv=3Dfv@entry=3D0x56299aa7d8a0, addr=3Daddr@entry=3D4294963266, attr=
s=3D..., ptr=3Dptr@entry=3D0x7fff6abe1540, len=3Dlen@entry=3D1, addr1=3D<op=
timized out>, l=3D<optimized out>, mr=3D0x56299aa28ea0)
      at include/qemu/host-utils.h:164
  #5  0x00005629990c0a76 in flatview_write (fv=3D0x56299aa7d8a0, addr=3D429=
4963266, attrs=3D..., buf=3D0x7fff6abe1540, len=3D1) at exec.c:3165
  #6  0x00005629990c4c1b in address_space_write (as=3D<optimized out>, addr=
=3D<optimized out>, attrs=3D..., attrs@entry=3D..., buf=3Dbuf@entry=3D0x7ff=
f6abe1540, len=3Dlen@entry=3D1) at exec.c:3256
  #7  0x000056299910f807 in qtest_process_command (chr=3Dchr@entry=3D0x5629=
995ee920 <qtest_chr>, words=3Dwords@entry=3D0x56299acfcfa0) at qtest.c:437

Instead of crashing, log the access as unimplemented.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20200331105048.27989-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/grlib_ahb_apb_pnp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index e230e25363..72a8764776 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -136,8 +136,15 @@ static uint64_t grlib_ahb_pnp_read(void *opaque, hwadd=
r offset, unsigned size)
     return ahb_pnp->regs[offset >> 2];
 }
=20
+static void grlib_ahb_pnp_write(void *opaque, hwaddr addr,
+                                uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+}
+
 static const MemoryRegionOps grlib_ahb_pnp_ops =3D {
     .read       =3D grlib_ahb_pnp_read,
+    .write      =3D grlib_ahb_pnp_write,
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
--=20
2.21.1


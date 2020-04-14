Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5173704lfm;
        Tue, 14 Apr 2020 09:24:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypI6frFiDTMNFujdxlJS4RZVf2z2ayFMwLQ+I3V+9ZcExGH4iG24CyxnPdvOznSidbsfnmVm
X-Received: by 2002:ac8:1bd4:: with SMTP id m20mr14259174qtk.79.1586881450960;
        Tue, 14 Apr 2020 09:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586881450; cv=none;
        d=google.com; s=arc-20160816;
        b=0rUQ4FINIPRRjrI8GZavacKaXlzHzXnCpzgm+ucTGtz9C9BfDUOf9xfE9xumDLICCg
         /BC4x9AcTFnQL7+TAEOXU7xa7Cxi8uL0lsdWrb6LADouSLNhCsU9fpkWr3Bp49uKvmO2
         eHaYEI+1gUdjU1FXgulx1VvzNPYh3sDdcfTWRfs1BE0oqGzNb4maGe8BoYyPrcdsEdPs
         7sAtJW1gjfLZgoKwDO1HSLv99rPQHk8sAYDNWaM0It1oGNtUUy9Wkc5Ja0zGkKzrLFYe
         J8Mik4xxWxi04BgL0KmCmuH63D2hn+F+j3AWYJPTeP/25lGu/5bvEXyAxT9TbxBlLFlP
         QEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5F5VGUrhvJ/6dwp4oORH6NykPEQT94CUfCEwFf8jKAI=;
        b=I7S1KqSXaCZ9JmdqAtoj5rGEXq/kT5JfeL2l0JA3jm1KLQl/IVqQnwr9QHEXHXALSj
         /v4bMqwgxkzdqeiMyKhU4omumMx06ikehVoRn0Q3H415svjXL1YovIAoGgy/IqSR5QFU
         IQGBUBDyPyVaaVNvBPx4ZHlKmz7woyq5FNgXmPrLU1ml672a+SKUraJfm6UKtgwGvmcp
         GcSCx4epoqyqtpc+t6JQckLIiqm5MNLrVqaSqbBawjR20WEgsEpNiIm/G2ivdAIknjUb
         CD0ceGTGrNLw0FGIm0Pk8v6mzqfaKRxNDbucFGPt6h5CjLeyGww1eAQ5vU76/eQbOpy+
         uLbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eq7Cdi3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si7593607qtv.181.2020.04.14.09.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eq7Cdi3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOM6-0003BZ-DB
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOIe-0007hD-5a
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOIY-0005JH-8O
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:20:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20418
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLfF-0008LP-1h
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5F5VGUrhvJ/6dwp4oORH6NykPEQT94CUfCEwFf8jKAI=;
 b=eq7Cdi3x4mcELTN85NJpVjw67t1AH6ZQrPUnyLVKhjtJmxvYd5ytKZjfBy6MRA3oH3PQXQ
 2IfVfpC25gl5iMNTyZmyUeYm0as6GBYkcF/DGFH/SCa8xdGveKdIg6g92Y6o0HNzT2HvY3
 h//hsW+F8Jq4jSWb8PiggeZIbQH5qg0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-MeOO873oPGS1PmYJKhJElQ-1; Tue, 14 Apr 2020 09:31:42 -0400
X-MC-Unique: MeOO873oPGS1PmYJKhJElQ-1
Received: by mail-wr1-f71.google.com with SMTP id q10so2143749wrv.10
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyZlA8S5K4aOaRBq4xW9gDApmrrmteGX4XubxYmsTLk=;
 b=KqhWYJtGmiWQUSXjzNOXCrOYwsQLyoikWU7zrNgpSjYjj2VDuxoJpFMxwJSc88kkU2
 uze2DP444lxIRu+n5RLO9JZ1fgj1aK0viJSKmA1aEeF+joj1O4rdv0QfW3KnLUslIAdX
 J2eeyYzxdstjJ5NmFJ1v3lsLkS4jLWgaBJk3dnLcG0wk8sCvtsKhjMV2Qr0Rd0IJgp1y
 gWAdDyGoa44D8JAdScydJL84aaUxdzrWbDK4lJfZbmOELYqQlaotbf79c9+VHKDHA/pk
 A44ZbcU/asxAdSHk5kBhNnbrq/VHC0dBTV66bjRF3El+M6NF8qT5EAbhbdKECSnwTU3C
 zLLw==
X-Gm-Message-State: AGi0Pub49O/Jtg4sABLPen7dkazWljKiLKPTLfhSfKQY/GusFA90jBAd
 /82KE+jUcMpR1ukmeuvQa5KD5Rgr9Tg2vTgqxTT85JRVFhNRtaGVlwoeKjL/FvlH54i0LcgixnN
 u6yymUCModeST
X-Received: by 2002:adf:f1c2:: with SMTP id z2mr25296881wro.40.1586871101512; 
 Tue, 14 Apr 2020 06:31:41 -0700 (PDT)
X-Received: by 2002:adf:f1c2:: with SMTP id z2mr25296846wro.40.1586871101209; 
 Tue, 14 Apr 2020 06:31:41 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id j68sm19680265wrj.32.2020.04.14.06.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 09/12] hw/display/sm501: Avoid heap overflow in
 sm501_2d_operation()
Date: Tue, 14 Apr 2020 15:30:49 +0200
Message-Id: <20200414133052.13712-10-philmd@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Zhang Zi Ming <1015138407@qq.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hVpoOx/zTpZf

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Zhang Zi Ming reported a heap overflow in the Drawing Engine of
the SM501 companion chip model, in particular in the COPY_AREA()
macro in sm501_2d_operation().

Add a simple check to avoid the heap overflow.

This fixes:

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D20518=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address=
 0x7f6f4c3fffff at pc 0x55b1e1d358f0 bp 0x7ffce464dfb0 sp 0x7ffce464dfa8
  READ of size 1 at 0x7f6f4c3fffff thread T0
      #0 0x55b1e1d358ef in sm501_2d_operation hw/display/sm501.c:788:13
      #1 0x55b1e1d32c38 in sm501_2d_engine_write hw/display/sm501.c:1466:13
      #2 0x55b1e0cd19d8 in memory_region_write_accessor memory.c:483:5
      #3 0x55b1e0cd1404 in access_with_adjusted_size memory.c:544:18
      #4 0x55b1e0ccfb9d in memory_region_dispatch_write memory.c:1476:16
      #5 0x55b1e0ae55a8 in flatview_write_continue exec.c:3125:23
      #6 0x55b1e0ad3e87 in flatview_write exec.c:3165:14
      #7 0x55b1e0ad3a24 in address_space_write exec.c:3256:18

  0x7f6f4c3fffff is located 4194303 bytes to the right of 4194304-byte regi=
on [0x7f6f4bc00000,0x7f6f4c000000)
  allocated by thread T0 here:
      #0 0x55b1e0a6e715 in __interceptor_posix_memalign (ppc64-softmmu/qemu=
-system-ppc64+0x19c0715)
      #1 0x55b1e31c1482 in qemu_try_memalign util/oslib-posix.c:189:11
      #2 0x55b1e31c168c in qemu_memalign util/oslib-posix.c:205:27
      #3 0x55b1e11a00b3 in spapr_reallocate_hpt hw/ppc/spapr.c:1560:23
      #4 0x55b1e11a0ce4 in spapr_setup_hpt hw/ppc/spapr.c:1593:5
      #5 0x55b1e11c2fba in spapr_machine_reset hw/ppc/spapr.c:1644:9
      #6 0x55b1e1368b01 in qemu_system_reset softmmu/vl.c:1391:9
      #7 0x55b1e1375af3 in qemu_init softmmu/vl.c:4436:5
      #8 0x55b1e2fc8a59 in main softmmu/main.c:48:5
      #9 0x7f6f8150bf42 in __libc_start_main (/lib64/libc.so.6+0x23f42)

  SUMMARY: AddressSanitizer: heap-buffer-overflow hw/display/sm501.c:788:13=
 in sm501_2d_operation
  Shadow bytes around the buggy address:
    0x0fee69877fa0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0fee69877fb0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0fee69877fc0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0fee69877fd0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0fee69877fe0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  =3D>0x0fee69877ff0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa[fa]
    0x0fee69878000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0fee69878010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0fee69878020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0fee69878030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0fee69878040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Partially addressable: 01 02 03 04 05 06 07
    Heap left redzone:       fa
    Freed heap region:       fd
    Poisoned by user:        f7
    ASan internal:           fe
  =3D=3D20518=3D=3DABORTING

Cc: qemu-stable@nongnu.org
Fixes: 07d8a50cb0e ("sm501: add 2D engine copyrect support")
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786026
Reported-by: Zhang Zi Ming <1015138407@qq.com>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20200413220100.18628-1-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/sm501.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index de0ab9d977..902acb3875 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -726,6 +726,12 @@ static void sm501_2d_operation(SM501State *s)
     int crt =3D (s->dc_crt_control & SM501_DC_CRT_CONTROL_SEL) ? 1 : 0;
     int fb_len =3D get_width(s, crt) * get_height(s, crt) * get_bpp(s, crt=
);
=20
+    if (rtl && (src_x < operation_width || src_y < operation_height)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "sm501: Illegal RTL address (%i, %i=
)\n",
+                      src_x, src_y);
+        return;
+    }
+
     if (addressing !=3D 0x0) {
         printf("%s: only XY addressing is supported.\n", __func__);
         abort();
--=20
2.21.1


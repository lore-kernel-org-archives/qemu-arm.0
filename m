Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7045881wrv;
        Mon, 22 Jul 2019 08:52:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyskjlBtA1ToMhlGV0u7MfRghBnmGS5n3UAH32wTdcmlhvjnismUeWgKAn6l/brDxcFeJxR
X-Received: by 2002:a1f:7c8e:: with SMTP id x136mr26090721vkc.27.1563810727987;
        Mon, 22 Jul 2019 08:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563810727; cv=none;
        d=google.com; s=arc-20160816;
        b=e8KhXOYGAa1+rdMXXpBwNCRJ3wmXgBs1UIvGQqbl4SRyTZYBJPYp5GCtnyxT3lLNlU
         5XvMEvn0FmLhwycxp3rTnl+B+kmYdeDtKo1e9jzR+be1mHzD1fmZevtAMBBDjPBCEIHG
         /AlXd78D5LQjKwSriXyAmGDt0vY+kjziI+ate3tSgZEJ9a9h2O2VMbbhPdXOonJ8xo55
         bDEy3gIPHwVp7BnouRkpXSbDdu9gn0OuIhneepwfxQjhQqJ1Km5V7OyOJLsg6WOuCutM
         p1ueZRyf1/mpOjO9E6ib20oBymMjPVK63SCJyZ47v+5mHAdn4r4pTGq/hdEGNqehYRoq
         uRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=hrWDfdO3JmBVY/ms5azQbemBc338l6BsryrdevTGs4g=;
        b=qNUfGQ3hgAeeeiX9fp0ce0ps04XoFF5I5VkKGTdeXNzEFuIdyj8bvhRdAp5UlT9Uqs
         8Tg95Mqs7qVnxwoVMwp7urfEJIyuzor1lIusMljSzEyist2N/Pc7IUdTXF8H86UE1XyM
         figh4luwY2ckfZ5RnyAUriBhAU+biLK5YRTy0ajGUasNlxb0uqCh0aL2BD+xIPPNoK1U
         AiTofISK/jV/E32Wk7y+Ccx7mPlncWPo6ohhSdx+pTQyoazv2E8dvf2Ax1KAd4gbpz4l
         XEi+kYwOcT38LrxxuY33FvXhiZIC9nhu4YAHdmoL4htkQFE8sPpYBbQ5IbDwpj9fW5ul
         czZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si9266503vsj.417.2019.07.22.08.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpabf-0004ho-As
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpabb-0004g0-A3
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaba-0002Le-3e
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:52:03 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:8997)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpabX-0002Gw-9U; Mon, 22 Jul 2019 11:51:59 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:51:42 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:51:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:51:56 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 17/20] cpu: TLB_FLAGS_MASK bit to force
 memory slow path
Thread-Index: AQHVQKVjDC9KxC3sRk6QAmZwUx7EEw==
Date: Mon, 22 Jul 2019 15:51:56 +0000
Message-ID: <1563810716254.18886@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381071625418886btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
Subject: [Qemu-arm] [Qemu-devel] [PATCH v2 17/20] cpu: TLB_FLAGS_MASK bit to
 force memory slow path
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K4ElHjYLK0YI

--_000_156381071625418886btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The fast path is taken when TLB_FLAGS_MASK is all zero.

TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,
there are no other side effects.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-all.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 536ea58..e496f99 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -331,12 +331,18 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS - 3))
 /* Set if TLB entry must have MMU lookup repeated for every access */
 #define TLB_RECHECK         (1 << (TARGET_PAGE_BITS - 4))
+/* Set if TLB entry must take the slow path.  */
+#define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS - 5))

 /* Use this mask to check interception with an alignment mask
  * in a TCG backend.
  */
-#define TLB_FLAGS_MASK  (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
-                         | TLB_RECHECK)
+#define TLB_FLAGS_MASK \
+    (TLB_INVALID_MASK  \
+     | TLB_NOTDIRTY    \
+     | TLB_MMIO        \
+     | TLB_RECHECK     \
+     | TLB_FORCE_SLOW)

 /**
  * tlb_hit_page: return true if page aligned @addr is a hit against the
--
1.8.3.1




--_000_156381071625418886btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">The fast path is taken when TLB_FLAGS=
_MASK is all zero.</span><br>
</div>
<div><br>
</div>
<div>TLB_FORCE_SLOW is simply a TLB_FLAGS_MASK bit to force the slow path,<=
/div>
<div>there are no other side effects.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/cpu-all.h | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;--</div>
<div>&nbsp;1 file changed, 8 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h</div>
<div>index 536ea58..e496f99 100644</div>
<div>--- a/include/exec/cpu-all.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-all.h</div>
<div>@@ -331,12 &#43;331,18 @@ CPUArchState *cpu_copy(CPUArchState *env);</=
div>
<div>&nbsp;#define TLB_MMIO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt=
;&lt; (TARGET_PAGE_BITS - 3))</div>
<div>&nbsp;/* Set if TLB entry must have MMU lookup repeated for every acce=
ss */</div>
<div>&nbsp;#define TLB_RECHECK &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; (TAR=
GET_PAGE_BITS - 4))</div>
<div>&#43;/* Set if TLB entry must take the slow path. &nbsp;*/</div>
<div>&#43;#define TLB_FORCE_SLOW &nbsp; &nbsp; &nbsp;(1 &lt;&lt; (TARGET_PA=
GE_BITS - 5))</div>
<div>&nbsp;</div>
<div>&nbsp;/* Use this mask to check interception with an alignment mask</d=
iv>
<div>&nbsp; * in a TCG backend.</div>
<div>&nbsp; */</div>
<div>-#define TLB_FLAGS_MASK &nbsp;(TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_M=
MIO \</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; | TLB_RECHECK)</div>
<div>&#43;#define TLB_FLAGS_MASK \</div>
<div>&#43; &nbsp; &nbsp;(TLB_INVALID_MASK &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; | TLB_NOTDIRTY &nbsp; &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; | TLB_MMIO &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; | TLB_RECHECK &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp; | TLB_FORCE_SLOW)</div>
<div>&nbsp;</div>
<div>&nbsp;/**</div>
<div>&nbsp; * tlb_hit_page: return true if page aligned @addr is a hit agai=
nst the</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381071625418886btcom_--

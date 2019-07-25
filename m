Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10424753wrv;
        Thu, 25 Jul 2019 02:56:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIA3mT/OOoA3T/jr0TwzJ/jfdNtfsQKytga7ylUZx8rDpbe/1Q1aY8Rvpl3xIfeZATWuwh
X-Received: by 2002:a50:a3f5:: with SMTP id t50mr75732959edb.273.1564048579498;
        Thu, 25 Jul 2019 02:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564048579; cv=none;
        d=google.com; s=arc-20160816;
        b=CEJvxx+UY702OLj3/tMDiOnEVgpHDuibyHUHuWaNiZ6LBX+4FNyLO36YxKfeNrq0HO
         5FKPrysLOizZFWrt8SyFX0uXE2gPAHh4Cey6kl9QAUR071SbZpmxo6HXtJcVnB5Eb5R2
         voznYAHKGN/UhRv8wkrOVQkXHU8UBFw+Oj7ViJGcn36bw43M4JZnqz4wx7HOVW2xwEO6
         oAzFkNLhRDQ3Rrq/dcUws9fXn8G51rugGaIyQq/jHHQi1PJHjwt8+t8g09eSq3wfKiNY
         HZLxCfq7Efalc4YESXTK3DbTat71MbtbbNPiugP1UgIY6cl0yGVkYNSnd7vECelqnliN
         bHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=4LKhjJHHfBYaNQYRupKjgmfQ8aK7ai85cYO9pR6UoJQ=;
        b=abXA6cKMret24O/V2Dd2Sbpw4+TFvO0jl2yAA3zsgtt+owFNqyuAe9MjBERuwDIqQz
         h2y5z0f1OTnmntlil2EiIfRqutyAol/nCTAwlrFFTZjFUQh86YfOsEL2ZX2sOsUFSaVG
         TIkdnb/FNLjncqQhk47sQbO1tIg2olyWF0ZV+BWY+FM2uRKSFiAceSI+bpJdxBoXRace
         SAwPPbQw4WP2S/Tp8IbI1krWGzsOJUZW1ezxWUo2NSOs+uzC34LrbtojMuH3/UXnFZjO
         CZOXWbg8r1WcVYo0ltiHhxwH3KB8WwS+rx7mXIBelTAdYCt3jqDDV3jFinz/FQ9eW2DD
         am0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l31si12190949edc.248.2019.07.25.02.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 02:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqaTy-0007U7-Jn
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 05:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaTv-0007SQ-6x
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 05:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaTu-0001VU-2p
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 05:56:15 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:35214)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaTl-0001Kt-H0; Thu, 25 Jul 2019 05:56:07 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 10:55:57 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:55:59 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:55:59 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 10/15] memory: Access MemoryRegion with
 MemOp semantics
Thread-Index: AQHVQs8px7kJYyCpkkqn1mCQ3wVnbg==
Date: Thu, 25 Jul 2019 09:55:59 +0000
Message-ID: <1564048559228.36766@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156404855922836766btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: [Qemu-arm] [Qemu-devel] [PATCH v4 10/15] memory: Access
 MemoryRegion with MemOp semantics
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xjVUMoiiRCc6

--_000_156404855922836766btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To convert interfaces of MemoryRegion access, MEMOP_SIZE and
SIZE_MEMOP no-op stubs were introduced to change syntax while keeping
the existing semantics.

Now with interfaces converted, we fill the stubs and use MemOp
semantics.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/memop.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 09c8d20..f2847e8 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -106,8 +106,7 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

-/* No-op while memory_region_dispatch_[read|write] is converted to MemOp *=
/
-#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
-#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
+#define MEMOP_SIZE(op)  (1 << ((op) & MO_SIZE)) /* MemOp to size.  */
+#define SIZE_MEMOP(ul)  (ctzl(ul))              /* Size to MemOp.  */

 #endif
--
1.8.3.1




--_000_156404855922836766btcom_
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
<div><span style=3D"font-size: 12pt;">To convert interfaces of MemoryRegion=
 access, MEMOP_SIZE and</span><br>
</div>
<div>SIZE_MEMOP no-op stubs were introduced to change syntax while keeping<=
/div>
<div>the existing semantics.</div>
<div><br>
</div>
<div>Now with interfaces converted, we fill the stubs and use MemOp</div>
<div>semantics.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/memop.h | 5 &#43;&#43;---</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 3 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 09c8d20..f2847e8 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -106,8 &#43;106,7 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>-/* No-op while memory_region_dispatch_[read|write] is converted to Me=
mOp */</div>
<div>-#define MEMOP_SIZE(op) &nbsp;(op) &nbsp; &nbsp;/* MemOp to size. &nbs=
p;*/</div>
<div>-#define SIZE_MEMOP(ul) &nbsp;(ul) &nbsp; &nbsp;/* Size to MemOp. &nbs=
p;*/</div>
<div>&#43;#define MEMOP_SIZE(op) &nbsp;(1 &lt;&lt; ((op) &amp; MO_SIZE)) /*=
 MemOp to size. &nbsp;*/</div>
<div>&#43;#define SIZE_MEMOP(ul) &nbsp;(ctzl(ul)) &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;/* Size to MemOp. &nbsp;*/</div>
<div>&nbsp;</div>
<div>&nbsp;#endif</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156404855922836766btcom_--

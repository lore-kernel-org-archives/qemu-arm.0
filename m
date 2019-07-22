Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7045113wrv;
        Mon, 22 Jul 2019 08:51:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxA/3WFmWFujvSsUcshCVKgUfrnpzkDiVLI8pd9aXqpox0CtDP1nCRV6h8ncE7IVHoWo2C4
X-Received: by 2002:a17:906:5c4e:: with SMTP id c14mr52067727ejr.73.1563810672991;
        Mon, 22 Jul 2019 08:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563810672; cv=none;
        d=google.com; s=arc-20160816;
        b=hJNn9epsqONas48xw9ptP7OX5HIUvkbK7b+ZISjvCaet0nexrOhGX+hmYHs7FEfYbo
         fhovUY7hVtQWcPQZYla6gRefzhYUpBFQgyV40xQMu+7qJkJ5tgZPr39D+x7riWQGHsoh
         8LcK+DzrG5/43GsewBstLfziBKAF8f/u9IL+hBStLP7cqvASB4lsJpm9Az9SGcdlQtDi
         EyvFHWbaBTi3lzG7+uGrUwO4eUcA94XiwIDdptwUoNinWR1gC5pjP1bNZIjH5Or8R0Wf
         BczICsVOI1WokGLYjcSBXE17D3RuSSqn4mfJ2CjvpK/FYgSDuwReNz9DQfmqNQVHGZhD
         i1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=0nov/qSVZRi2a7w1J4sbF+6PylhSZBIF3N4TcS45qU4=;
        b=K+qO+T+M0xhEdPx0uRB64jqNehm2m4RrywfoYYF7lceBJBSsm8Gw7vALKiWY94V5OP
         RlggYMgROdkpFDLoP6OcPEcya/KneJ5w2pjPzZ0KuwpT+P8VMFBTVo3N98Ge8LTl6KDI
         +47D2sT50q4g01o1eKGtZcYt9fKm446eEkp3kl+MQZZ8K5NbpblVC0QmdtPhqnS2hYJA
         Ft9R+ugYI799aidbJAKMQF7kKrHqgoK0bYbwhPjEmzbXCPVzMpoNNH2E8BXx3BmN3dM/
         bVH1vE+up7A7tvSks2YOFb+NuHlrHJm9oCNO/SoYzzFWk9filWiq+xkOu+1vH+a5FxDk
         1KkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m32si4853989edm.415.2019.07.22.08.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpaal-0003Ca-Q7
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaae-00036m-Do
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaac-0001VJ-Bx
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:51:04 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.77]:35425)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaaJ-00015w-Se; Mon, 22 Jul 2019 11:50:44 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926082.bt.com (10.36.82.113) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:50:40 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:50:41 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:50:41 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 15/20] memory: Access MemoryRegion with
 MemOp semantics
Thread-Index: AQHVQKU2j1nfQh7y3km4doLaBYdpEw==
Date: Mon, 22 Jul 2019 15:50:41 +0000
Message-ID: <1563810640556.47123@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381064055647123btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.77
Subject: [Qemu-arm] [Qemu-devel] [PATCH v2 15/20] memory: Access
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
X-TUID: PQUGI/vxNysn

--_000_156381064055647123btcom_
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
index 73f1bf7..dff6da2 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -24,8 +24,7 @@ typedef enum MemOp {
     MO_BSWAP =3D 8,   /* Host reverse endian.  */
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




--_000_156381064055647123btcom_
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
 access, MEMOP_SIZE and</span></div>
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
<div>index 73f1bf7..dff6da2 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -24,8 &#43;24,7 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_BSWAP =3D 8, &nbsp; /* Host reverse endian. &nb=
sp;*/</div>
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

--_000_156381064055647123btcom_--

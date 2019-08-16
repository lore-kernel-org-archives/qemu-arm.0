Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp471564wrs;
        Fri, 16 Aug 2019 00:27:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNtEm/HK0iF4iRMXxQbHa6UaIqCNMONIbN5GfvDAWmh2zUbG2IZeu2dJUdb13E7sCUXkZq
X-Received: by 2002:a50:a4ad:: with SMTP id w42mr9208786edb.230.1565940466575;
        Fri, 16 Aug 2019 00:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565940466; cv=none;
        d=google.com; s=arc-20160816;
        b=ghLAQNI2H/PzFpP8G+uOpMttWMPPhtt0hP86gLwTdkoTlGF+nz2SSuEE15zvtD3BhL
         y9btunnsjSqVbZN62uZ004xt0c3xJPm//FEVPCz1wsYOWmw7fYivJNwpxI37gyi38lWv
         oekAzqmKDiB56iWbsY5o08inTwedLCs+MfOD/IqvMT02Bgvt1tWkrMztZ/+tDCfttGvT
         aUFeqbzfkhfBRZ8d49/FlxzFqC2ZYPH1N9OhkLzusIly942Qf3u3eF3/L5gU0XBoHBVr
         4+k4I8hdMUF7oDXHNfW78csXVqDUp2pstevXJxR8wxBuzKQvZfqSLYv3izGgFewOIRKp
         0yHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=zuDu1DTHRFb+kqvyrV895C5f7qwzOC2CBx/rZFVu8M4=;
        b=YP+y3zuo1Dze2Ntp5GBTYsE+jWB9EBJUARA1IdZrnBgPLSdjO3RcUhgZs0NRNhVNV1
         J4xULBe947pq0CPFt2kcAh99QxAgfWx7e75I62Bh4Agwe0oFmhHtZ8uCWpn8MkDD1xml
         gTpqLY+o4tktqj0wSshKazU5FaVFhx1udKAnsYCPcJOBi3BetIsQkMVDuoO4V1jarMUJ
         DCY9+Cnrzu3kWa0vGAxMJdAyv1Xc0h+HTISvoS/rV6eQ47DQTcc1u0ENmjp1n+3t2G//
         NHc2Az3AiDJRQxQIC4ezRSSlwcHcvBfAniT36riqjNC9m9fYjC/AqsS9zMWcHEMiwU9H
         zRvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qq1si2586473ejb.172.2019.08.16.00.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWeH-0000WS-I5
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWe7-0000Qh-A6
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWe5-0006b2-GH
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:27:35 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:1532)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWdv-0006YT-DV; Fri, 16 Aug 2019 03:27:23 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:27:00 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:27:21 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:27:21 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 03/42] memory: Introduce size_memop
Thread-Index: AQHVVAQKaBCA2VrA2kWD20s00rLafg==
Date: Fri, 16 Aug 2019 07:27:21 +0000
Message-ID: <1565940440547.47375@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156594044054747375btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: [Qemu-arm] [Qemu-devel] [PATCH v7 03/42] memory: Introduce
 size_memop
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, balrogg@gmail.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vXK5fRCjdtg8

--_000_156594044054747375btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Introduce no-op size_memop to aid preparatory conversion of
interfaces.

Once interfaces are converted, size_memop will be implemented to
return a MemOp from size in bytes.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 7262ca3..dfd76a1 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -107,4 +107,14 @@ typedef enum MemOp {
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
 } MemOp;

+/* Size in bytes to MemOp.  */
+static inline unsigned size_memop(unsigned size)
+{
+    /*
+     * FIXME: No-op to aid conversion of memory_region_dispatch_{read|writ=
e}
+     * "unsigned size" operand into a "MemOp op".
+     */
+    return size;
+}
+
 #endif
--
1.8.3.1

?


--_000_156594044054747375btcom_
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
<div><span style=3D"font-size: 12pt;">The memory_region_dispatch_{read|writ=
e} operand &quot;unsigned size&quot; is</span><br>
</div>
<div>being converted into a &quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Introduce no-op size_memop to aid preparatory conversion of</div>
<div>interfaces.</div>
<div><br>
</div>
<div>Once interfaces are converted, size_memop will be implemented to</div>
<div>return a MemOp from size in bytes.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>---</div>
<div>&nbsp;include/exec/memop.h | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;</div>
<div>&nbsp;1 file changed, 10 insertions(&#43;)</div>
<div><br>
</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>index 7262ca3..dfd76a1 100644</div>
<div>--- a/include/exec/memop.h</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -107,4 &#43;107,14 @@ typedef enum MemOp {</div>
<div>&nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&nbsp;} MemOp;</div>
<div>&nbsp;</div>
<div>&#43;/* Size in bytes to MemOp. &nbsp;*/</div>
<div>&#43;static inline unsigned size_memop(unsigned size)</div>
<div>&#43;{</div>
<div>&#43; &nbsp; &nbsp;/*</div>
<div>&#43; &nbsp; &nbsp; * FIXME: No-op to aid conversion of memory_region_=
dispatch_{read|write}</div>
<div>&#43; &nbsp; &nbsp; * &quot;unsigned size&quot; operand into a &quot;M=
emOp op&quot;.</div>
<div>&#43; &nbsp; &nbsp; */</div>
<div>&#43; &nbsp; &nbsp;return size;</div>
<div>&#43;}</div>
<div>&#43;</div>
<div>&nbsp;#endif</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594044054747375btcom_--

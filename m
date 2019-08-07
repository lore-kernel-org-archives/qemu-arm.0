Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6254547wrv;
        Wed, 7 Aug 2019 01:34:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxWCEjf+lWPKu4wCvn66RsgeYqc0sYQpGN+JF5E37zOQIoOhm6VVujk3goqj6R5Dbv4w9+
X-Received: by 2002:a50:cd91:: with SMTP id p17mr8481960edi.35.1565166843458;
        Wed, 07 Aug 2019 01:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565166843; cv=none;
        d=google.com; s=arc-20160816;
        b=QOs8crRU70JOQRNgoyMEDmCI6OpSoZgDrngL66KNSCGyxVfsk5KxTQ4l2GWW5EVxZU
         K/7TpyiKpTHuojVLcZcOz/m2jhrgswD5PN/QEP3PaTM1VSz2ECM1ysUd67ssZnqx/8jS
         0EdbUCFutTcxgPZvEGb+Y54f8mU19WZ2lqnK93SBzc3Jd3eo3uQauvcyiCz+USG0MhkV
         iKIACjgIiFcUE6+Md3ke/oN4s7tIQUnob6BXOwGnSWb+2KvpuWTolPx/3k94UlqXMbDK
         vPMmWkJEB+14Vz0x+r7jXmBoDKGUr7V/ufEaI4m+YKU8ddLt8MsziFA0u409D2fzAZQF
         pPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=nPRxtPKwWvDl4V09m0+XPx5Mx9Ub6gNJ8x5DcjFI+M8=;
        b=aJ19y0dlALLFD4vOc7GfA35JJI0sE8YU9UHMsRIQTpiJrVw8Wj1tbwdAysPAfu0S3p
         VcaRCGsDZ2ckPlei3fqLBs7myXdXGCpzekQlDwjMf6x/aYsOUfWRBumFy8WwZN/gMfJn
         reypKNfOBCg9k0gaHLVKmyV550VAHMnu9ylN+b0tgkbuyIBGZ7I6xmfDyu5GdRXUWVAk
         H32HW5opHx95au4AKQ03spRQOtb2ncyBk9u+7v6+ixuXO0L84RukhGxLMPewnqmLRAow
         UFwGjCDn9KJBZy4XF8MJOSnC2L4kLIMo3XOlXP4g+VhxksnbIFW7S50sU07fAbEpkfLO
         oZiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l28si33793491edb.261.2019.08.07.01.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHOU-00045J-7n
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHL9-0005D5-RL
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHL8-0001b3-2x
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:30:35 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:7644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHL4-0001Zg-1S; Wed, 07 Aug 2019 04:30:30 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:30:08 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:30:28 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:30:28 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 13/26] target/mips: Hard code size with
 MO_{8|16|32|64}
Thread-Index: AQHVTPpe3pO2B8oHbkS8tiFNOyPXPg==
Date: Wed, 7 Aug 2019 08:30:28 +0000
Message-ID: <1565166627824.57868@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_156516662782457868btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
Subject: [Qemu-arm] [Qemu-devel] [PATCH v6 13/26] target/mips: Hard code
 size with MO_{8|16|32|64}
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Af0rwpofaRzY

--_000_156516662782457868btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Temporarily no-op size_memop was introduced to aid the conversion of
memory_region_dispatch_{read|write} operand "unsigned size" into
"MemOp op".

Now size_memop is implemented, again hard coded size but with
MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/mips/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 1c72a00..e79f99d 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -4741,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong a=
ddr, uint32_t op)
     if (op =3D=3D 9) {
         /* Index Store Tag */
         memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     size_memop(8), MEMTXATTRS_UNSPECIFIED=
);
+                                     MO_64, MEMTXATTRS_UNSPECIFIED);
     } else if (op =3D=3D 5) {
         /* Index Load Tag */
         memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    size_memop(8), MEMTXATTRS_UNSPECIFIED)=
;
+                                    MO_64, MEMTXATTRS_UNSPECIFIED);
     }
 #endif
 }
--
1.8.3.1

?


--_000_156516662782457868btcom_
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
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">Temporarily no-op size_memop was intr=
oduced to aid the conversion of</span><br>
</div>
<div>memory_region_dispatch_{read|write} operand &quot;unsigned size&quot; =
into</div>
<div>&quot;MemOp op&quot;.</div>
<div><br>
</div>
<div>Now size_memop is implemented, again hard coded size but with</div>
<div>MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.</=
div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/mips/op_helper.c | 4 &#43;&#43;--</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c</div>
<div>index 1c72a00..e79f99d 100644</div>
<div>--- a/target/mips/op_helper.c</div>
<div>&#43;&#43;&#43; b/target/mips/op_helper.c</div>
<div>@@ -4741,11 &#43;4741,11 @@ void helper_cache(CPUMIPSState *env, targe=
t_ulong addr, uint32_t op)</div>
<div>&nbsp; &nbsp; &nbsp;if (op =3D=3D 9) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Store Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_write(env-&gt=
;itc_tag, index, env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_memop(8), ME=
MTXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; MO_64, MEMTXA=
TTRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;} else if (op =3D=3D 5) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Index Load Tag */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memory_region_dispatch_read(env-&gt;=
itc_tag, index, &amp;env-&gt;CP0_TagLo,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_memop(8), MEM=
TXATTRS_UNSPECIFIED);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MO_64, MEMTXAT=
TRS_UNSPECIFIED);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156516662782457868btcom_--

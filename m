Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6254554wrv;
        Wed, 7 Aug 2019 01:34:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeMtVsW8sxm6NZNakNnLMxFUFlx+gsgfyFWiXAVKQZtxnmW768zV2k0Ov4udI+4hzyCAte
X-Received: by 2002:a17:906:710:: with SMTP id y16mr7428063ejb.58.1565166844104;
        Wed, 07 Aug 2019 01:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565166844; cv=none;
        d=google.com; s=arc-20160816;
        b=s72SCluOuliYK7AAGPXLY5PpTOLV5vUjzwTiS+U3kElecGzXc07vKRzMtrTJm++uNn
         J/jlYNdyRYtBaxEMKGB1D2EHsxFpm2iylCKGyLRXgykm4r2fiBk9gQITRscirgBeUJmu
         iTeUExfmKVM6oZ5MKR2CW3DNQE1BG3XiN4dJE+6vqxGeRD23gCem6JyUw6JdfkHRmmrK
         DzVcwjKiEPxxYmdNT/P4mCn/pqEodTTnKNLJCuMhPd3hs0HDer+PAG8SwANEpQO3WEMs
         ppMZ/v/kRYpWBnzoH+i24ENgiN4Po3HkLaPjs1wTeoWqEybPa7CIJUJbjAgXjZIL5k8P
         5OAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=rH2MqoiIYwr/1hiYL+wHAVhnioBSOvHqfTYBPBd6lLU=;
        b=O9/z6tmrCyjGQCbf6BmgH5otTnC+ngraurvgQU62aFMHHf71zsHrmIHmGyxcCmyvhq
         UXQGOXAY533j4I+vcEvlWAlksbVdbL9AOr3DwrV269zK8s+iprKKAtcC1Z67DErslVsS
         L5PaAwQH/1Nyzms3aRuNJMpD6+87AwfKJIdGam2FkR/AZSmKozPRXCz86PiNsd4Stz4m
         Uqq/Mqwz94WLrHkAu3fkLNwGrF2aNuzHISorJhGIaVugGj3GjU/8mNQBy4e2sQljgqwo
         Js8rlh/G0Okw2jvtcx2Qws/sawZmkTjb81ZdTUJhm8w4r5w8m+W1EYkvnCcVwRj5QQTd
         ccPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o47si31862470edc.347.2019.08.07.01.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 01:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvHOV-00047J-0t
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 04:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHNU-0002PG-4S
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hvHNS-0002jd-CB
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 04:33:00 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.71]:21648)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hvHNN-0002fZ-VX; Wed, 07 Aug 2019 04:32:54 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:32:40 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:32:52 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:32:51 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 19/26] exec: Delete DEVICE_HOST_ENDIAN
Thread-Index: AQHVTPqz60CeloaZYkqofdP35k6Cxw==
Date: Wed, 7 Aug 2019 08:32:51 +0000
Message-ID: <1565166771281.2734@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
Content-Type: multipart/alternative; boundary="_000_15651667712812734btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.71
Subject: [Qemu-arm] [Qemu-devel] [PATCH v6 19/26] exec: Delete
 DEVICE_HOST_ENDIAN
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
X-TUID: 7CYqc4qUJn83

--_000_15651667712812734btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

DEVICE_HOST_ENDIAN is conditional upon HOST_WORDS_BIGENDIAN.

Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead
directly conditional upon HOST_WORDS_BIGENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-common.h | 8 --------
 memory.c                  | 6 +++++-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 7eeb78c..b33dc0c 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -16,14 +16,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #if !defined(CONFIG_USER_ONLY)

-#include "exec/memop.h"
-
-#if defined(HOST_WORDS_BIGENDIAN)
-#define DEVICE_HOST_ENDIAN MO_BE
-#else
-#define DEVICE_HOST_ENDIAN MO_LE
-#endif
-
 /* address in the RAM (different from a physical address) */
 #if defined(CONFIG_XEN_BACKEND)
 typedef uint64_t ram_addr_t;
diff --git a/memory.c b/memory.c
index 3cabb52..11db6ec 100644
--- a/memory.c
+++ b/memory.c
@@ -1362,7 +1362,11 @@ static void memory_region_ram_device_write(void *opa=
que, hwaddr addr,
 static const MemoryRegionOps ram_device_mem_ops =3D {
     .read =3D memory_region_ram_device_read,
     .write =3D memory_region_ram_device_write,
-    .endianness =3D DEVICE_HOST_ENDIAN,
+#if defined(HOST_WORDS_BIGENDIAN)
+    .endianness =3D MO_BE,
+#else
+    .endianness =3D MO_LE,
+#endif
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
--
1.8.3.1

?


--_000_15651667712812734btcom_
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
<div><span style=3D"font-size: 10pt;">DEVICE_HOST_ENDIAN is conditional upo=
n HOST_WORDS_BIGENDIAN.</span><br>
</div>
<div><br>
</div>
<div>Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead</di=
v>
<div>directly conditional upon HOST_WORDS_BIGENDIAN.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/cpu-common.h | 8 --------</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| 6 &#43;&#43;&#43;&#43;&#43;-</div>
<div>&nbsp;2 files changed, 5 insertions(&#43;), 9 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index 7eeb78c..b33dc0c 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -16,14 &#43;16,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div>
<div>&nbsp;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp;</div>
<div>-#include &quot;exec/memop.h&quot;</div>
<div>-</div>
<div>-#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>-#define DEVICE_HOST_ENDIAN MO_BE</div>
<div>-#else</div>
<div>-#define DEVICE_HOST_ENDIAN MO_LE</div>
<div>-#endif</div>
<div>-</div>
<div>&nbsp;/* address in the RAM (different from a physical address) */</di=
v>
<div>&nbsp;#if defined(CONFIG_XEN_BACKEND)</div>
<div>&nbsp;typedef uint64_t ram_addr_t;</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 3cabb52..11db6ec 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1362,7 &#43;1362,11 @@ static void memory_region_ram_device_write(=
void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ram_device_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D memory_region_ram_device_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D memory_region_ram_device_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_HOST_ENDIAN,</div>
<div>&#43;#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&#43;#else</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&#43;#endif</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
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

--_000_15651667712812734btcom_--

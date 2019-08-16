Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp689801wrs;
        Fri, 16 Aug 2019 04:37:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5BcuXKxgBA/xAXf1ale4+RA5v1lwBOrmoaqS3RJuDWSmOfruMMl5fIgvxM4WVhuh2+l9Q
X-Received: by 2002:a50:972c:: with SMTP id c41mr10397588edb.153.1565955474356;
        Fri, 16 Aug 2019 04:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565955474; cv=none;
        d=google.com; s=arc-20160816;
        b=aYsb+2EIFIemYZywFASdt+WoLbWgJoI7U87b0yjs4vNDLGeozMvUD/q2nd/DcN99+n
         xgtfzodGRtPYx90Gitw4IuuBU23K4tdn6dCCLXSeeDZu2w/u5ZSkdtfUkEPchr2cjYK2
         2EeVAscqCuK8sP6Wz2i4as5KZHwRfSzM6hrK+KeHqrZ+/MTxkpb3WMqcj4rtjhsZQXqd
         wey3Zc65JoYn75Is+3pm98OwpDDEwKUI+ryHu90MA7h2oxi2IuwNN0Hdiqx+hgb1VsPj
         CP/yD+diNkLYZF4l0EaeRpPtWLQiRQ0rodZVzH3qt0M06YWjWEVWLmSFo1m6E88noZ4P
         b/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=FzXQT7QPSvGRF4G9g2Uk+4yLwpmz4z0ymn+anJaNliw=;
        b=TlQqgxQmD94fonJxDe7QU6CheskBhjQ+zTQ5gH/0OvdioJ8Njp9m9UA70hN+TsooGo
         YRB+giB/kDvb6W2pwHg2lZruAvArvL4k0HT0EGyNJP5jqWOOUJ3PyekdnL9BTbQugBUk
         HQ3P4zQhaf7EPQj7g61Qd0ZS0F4JaE7Mm/jTX6Y/LMiqW17D26cONoH/4RYcckPwE8iM
         GbF53k1JDcsIQBfLitBDWfqGuJlBb/ihUsTybamphPc5mcSu1M0/am3r8T5264tT/sZ1
         y4Nn9iv9dQCG9vWEgsjVnRjl92Ec1oQk0cSucX7bdgPFt6ObDEAkwSqKT6tGH2N6fjYg
         xF2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga14si2852194ejb.297.2019.08.16.04.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 04:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyaYL-0004WK-Bz
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 07:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyaYA-0004Rz-G2
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 07:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyaY9-00040x-3v
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 07:37:42 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.79]:23919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyaXx-0003IB-Ir; Fri, 16 Aug 2019 07:37:29 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 12:37:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 12:37:26 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 12:37:26 +0100
From: <tony.nguyen@bt.com>
To: <philmd@redhat.com>, <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVU/vc8DdfhK3ulkmWv148s0Uozqb9eXeAgAAr/BQ=
Date: Fri, 16 Aug 2019 11:37:26 +0000
Message-ID: <1565955445398.83897@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>,
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
In-Reply-To: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
Content-Type: multipart/alternative; boundary="_000_156595544539883897btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.79
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
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
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, lersek@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: onav+j0GzLhM

--_000_156595544539883897btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Phillippe,

On 8/16/19 7:58 PM, Philippe Mathieu-Daud=E9 wrote:
>On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
>> This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
>>
>> v7:
>[...]
>> - Re-declared many native endian devices as little or big endian. This i=
s why
>>   v7 has +16 patches.
>
>Why are you doing that? What is the rational?

While collapsing the byte swaps, it was suggested in patch #11 of v5 that
consistent use of MemOp simplified endian comparisons. This lead to the
deprecation of enum device_endian by MemOp.

As MO_TE is conditional upon NEED_CPU_H, the s/DEVICE_NATIVE_ENDIAN/MO_TE/
required changing some device object files from common-obj-* to obj-*. In p=
atch
#15 of v6 Paolo noted that most devices should not of been DEVICE_NATIVE_EN=
DIAN
and hinted at a clean up.

The +16 patches in v7 is the clean up effort.

>Anyhow if this not required by your series, you should split it out of
>it, and send it on your principal changes are merged.
>I'm worried because this these new patches involve many subsystems (thus
>maintainers) and reviewing them will now take a fair amount of time.

Yes, lets split these patches out. They are very much a tangent to the seri=
es
purpose.

>> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
>> targets from the set of target/hw/*/device.o.
>>
>> If the set of targets are all little or all big endian, re-declare
>> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
>> respectively.
>
>If only little endian targets use a device, that doesn't mean the device
>is designed in little endian...
>
>Then if a big endian target plan to use this device, it will require
>more work and you might have introduced regressions...
>
>I'm not sure this is a safe move.
>
>> This *naive* deduction may result in genuinely native endian devices
>> being incorrectly declared as little or big endian, but should not
>> introduce regressions for current targets.
>

Roger. Evidently too naive. TBH, most devices I've never heard of...

Regards,
Tony

--_000_156595544539883897btcom_
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
<div>Hi Phillippe,<br>
</div>
<div><br>
</div>
<div>On 8/16/19 7:58 PM, Philippe Mathieu-Daud=E9 wrote:</div>
<div>&gt;On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:</div>
<div>&gt;&gt; This patchset implements the IE (Invert Endian) bit in SPARCv=
9 MMU TTE.</div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; v7:</div>
<div>&gt;[...]</div>
<div>&gt;&gt; - Re-declared many native endian devices as little or big end=
ian. This is why</div>
<div>&gt;&gt; &nbsp; v7 has &#43;16 patches.<br>
</div>
<div>&gt;</div>
<div>&gt;Why are you doing that? What is the rational?</div>
<div><br>
</div>
<div>While collapsing the byte swaps, it was suggested in patch #11 of v5 t=
hat</div>
<div>consistent use of MemOp simplified endian comparisons. This lead to th=
e</div>
<div>deprecation of enum device_endian by MemOp.</div>
<div><br>
</div>
<div>As MO_TE is conditional upon NEED_CPU_H, the s/DEVICE_NATIVE_ENDIAN/MO=
_TE/</div>
<div>required changing some device object files from common-obj-* to obj-*.=
 In patch</div>
<div>#15 of v6 Paolo noted that most devices should not of been DEVICE_NATI=
VE_ENDIAN</div>
<div>and hinted at a clean up.</div>
<div><br>
</div>
<div>The &#43;16 patches in v7 is the clean up effort.<br>
</div>
<div><br>
</div>
<div>&gt;Anyhow if this not required by your series, you should split it ou=
t of</div>
<div>&gt;it, and send it on your principal changes are merged.</div>
<div>&gt;I'm worried because this these new patches involve many subsystems=
 (thus</div>
<div>&gt;maintainers) and reviewing them will now take a fair amount of tim=
e.</div>
<div><br>
</div>
<div>Yes, lets split these patches out. They are very much a tangent to the=
 series<br>
</div>
<div>purpose.<br>
</div>
<div><br>
</div>
<div>&gt;&gt; For each device declared with DEVICE_NATIVE_ENDIAN, find the =
set of</div>
<div>&gt;&gt; targets from the set of target/hw/*/device.o.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; If the set of targets are all little or all big endian, re-de=
clare</div>
<div>&gt;&gt; the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_E=
NDIAN</div>
<div>&gt;&gt; respectively.</div>
<div>&gt;</div>
<div>&gt;If only little endian targets use a device, that doesn't mean the =
device</div>
<div>&gt;is designed in little endian...</div>
<div>&gt;</div>
<div>&gt;Then if a big endian target plan to use this device, it will requi=
re</div>
<div>&gt;more work and you might have introduced regressions...</div>
<div>&gt;</div>
<div>&gt;I'm not sure this is a safe move.</div>
<div>&gt;</div>
<div>&gt;&gt; This *naive* deduction may result in genuinely native endian =
devices<br>
</div>
<div>&gt;&gt; being incorrectly declared as little or big endian, but shoul=
d not</div>
<div>&gt;&gt; introduce regressions for current targets.</div>
<div>&gt;<br>
</div>
<div><br>
</div>
<div>Roger. Evidently too naive. TBH, most devices I've never heard of...</=
div>
<div><br>
Regards,<br>
</div>
<div>Tony<br>
</div>
</body>
</html>

--_000_156595544539883897btcom_--

Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11478691wrv;
        Thu, 25 Jul 2019 23:03:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ/aE50nyZInQKb9z5R0HgfjLDjzlVkwZsdAaXnK2KeS93A59kKDhqcxxfXP8WbY0Zj0dj
X-Received: by 2002:ad4:4373:: with SMTP id u19mr67516757qvt.202.1564121011721;
        Thu, 25 Jul 2019 23:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564121011; cv=none;
        d=google.com; s=arc-20160816;
        b=NHe+Cx1NUwV5qrQLpvmWWTeuPeQMhtHpVb/HqQrFHl5jVWyhDBgw07JJ5VoDGs9HBa
         1ZHY+D4qEFT1yw6/Jrm/UUph8r5D86p1W/4lJAe98yqHNXSlDk9/vLj4PbyOHRTNokAY
         Epx2sBoUAyY/OCyYJ+BYEoeZ2Y+rJT20WjiDCsToqvppiTpELpT4smYSBS3Juu5OMcM0
         MiBp5r/RlbcMUgC9oyVACicv2t3L6GxZhaB6nX4hMLMIpAHwRczA6nRUIjkPfu7d3njg
         RHdd7EkPD4C/0okB32a44pNDapTtmeidgMneaVutHhZtPmeew9yg3VEjYUsBXvhztlfQ
         6koA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=b+p8otFpVNHnyjlC+YMEi0EH9ns+NWALrj2jCIZeXaY=;
        b=A/U+GO+K5RDvn2QQ9dl3EeUwv1KkYmLYDIHS28SVUlw+2ijaDob8NUL8W4i0KHH5uL
         qiVsJkSYI2TJ2pU6VbdQxb9CjYRP8mIY48aqV/L+hEZmfYmYs8r/DvSmvSnf6FEL4v13
         2kkxVBzxwAbfbcv3J8a9naGuv5tdB7VpSjGnbx6TqLIRFJ9SKxsn6EvK3MIY8Yo4uwVk
         1+UiTqleUppsMs0XUdx+2C7rN27ayr86fuahm7qUeWocRdD8QUfrHUcjFsNbAYoCIkQ5
         bJaItV+nbegWJQwENsDm81ql9ZtyfXqmZfsMYeMlTTpYyLPQ3X8wN1fkieSbHc7ORJ92
         leSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t53si33185691qvc.91.2019.07.25.23.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 23:03:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqtKE-0003a7-9r
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 02:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqtK8-0003Yf-Ki
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqtK6-0003Pr-Db
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:03:24 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.71]:57753)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqtJu-0002vb-Gx; Fri, 26 Jul 2019 02:03:10 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 07:03:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 26 Jul 2019 07:03:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 26 Jul
 2019 07:03:05 +0100
From: <tony.nguyen@bt.com>
To: <philmd@redhat.com>, <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 02/15] memory: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQs6us5Ke12ptjEW1c49AzysqcKbbJooAgAE/RY4=
Date: Fri, 26 Jul 2019 06:03:05 +0000
Message-ID: <1564120985317.14967@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048354001.54262@bt.com>, <ee5949da-4457-0560-4525-40e4d4aaef4a@redhat.com>
In-Reply-To: <ee5949da-4457-0560-4525-40e4d4aaef4a@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
Content-Type: multipart/alternative; boundary="_000_156412098531714967btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.71
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 02/15] memory: Access
 MemoryRegion with MemOp
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
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HVprviAaT3RN

--_000_156412098531714967btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 7/25/19 9:45 PM, Philippe Mathieu-Daud=E9 wrote:
>On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:
>> Replacing size with size+sign+endianness (MemOp) will enable us to
>> collapse the two byte swaps, adjust_endianness and handle_bswap, along
>> the I/O path.
>>
>> While interfaces are converted, callers will have existing unsigned
>> size coerced into a MemOp, and the callee will use this MemOp as an
>> unsigned size.
>>
>> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
>> ---
>>  include/exec/memop.h  | 4 ++++
>>  include/exec/memory.h | 9 +++++----
>>  memory.c              | 7 +++++--
>>  3 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/exec/memop.h b/include/exec/memop.h
>> index ac58066..09c8d20 100644
>> --- a/include/exec/memop.h
>> +++ b/include/exec/memop.h
>> @@ -106,4 +106,8 @@ typedef enum MemOp {
>>      MO_SSIZE =3D MO_SIZE | MO_SIGN,
>>  } MemOp;
>>
>> +/* No-op while memory_region_dispatch_[read|write] is converted to MemO=
p */
>> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
>> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
>
>SIZE_MEMOP() is never used until patch #10 "memory: Access MemoryRegion
>with MemOp semantics", it would be clearer to only introduce the
>MEMOP_SIZE() no-op here, and directly introduce the correct SIZE_MEMOP()
>macro in patch #10.

SIZE_MEMOP() is used, and is the main change, in patches #3 to #10. Perhaps=
 you
meant MEMOP_SIZE()?

Either way, you have raised an issue :)

There is a lack of clarity in how the two macros are used to update the
interfaces.?


--_000_156412098531714967btcom_
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
<div>On 7/25/19 9:45 PM, Philippe Mathieu-Daud=E9 wrote:&nbsp;</div>
<div>&gt;On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:</div>
<div>&gt;&gt; Replacing size with size&#43;sign&#43;endianness (MemOp) will=
 enable us to</div>
<div>&gt;&gt; collapse the two byte swaps, adjust_endianness and handle_bsw=
ap, along</div>
<div>&gt;&gt; the I/O path.</div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; While interfaces are converted, callers will have existing un=
signed</div>
<div>&gt;&gt; size coerced into a MemOp, and the callee will use this MemOp=
 as an</div>
<div>&gt;&gt; unsigned size.</div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>&gt;&gt; ---</div>
<div>&gt;&gt; &nbsp;include/exec/memop.h &nbsp;| 4 &#43;&#43;&#43;&#43;</di=
v>
<div>&gt;&gt; &nbsp;include/exec/memory.h | 9 &#43;&#43;&#43;&#43;&#43;----=
</div>
<div>&gt;&gt; &nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| 7 &#43;&#43;&#43;&#43;&#43;--</div>
<div>&gt;&gt; &nbsp;3 files changed, 14 insertions(&#43;), 6 deletions(-)</=
div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; diff --git a/include/exec/memop.h b/include/exec/memop.h</div=
>
<div>&gt;&gt; index ac58066..09c8d20 100644</div>
<div>&gt;&gt; --- a/include/exec/memop.h</div>
<div>&gt;&gt; &#43;&#43;&#43; b/include/exec/memop.h</div>
<div>&gt;&gt; @@ -106,4 &#43;106,8 @@ typedef enum MemOp {</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp;MO_SSIZE =3D MO_SIZE | MO_SIGN,</div>
<div>&gt;&gt; &nbsp;} MemOp;</div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; &#43;/* No-op while memory_region_dispatch_[read|write] is co=
nverted to MemOp */</div>
<div>&gt;&gt; &#43;#define MEMOP_SIZE(op) &nbsp;(op) &nbsp; &nbsp;/* MemOp =
to size. &nbsp;*/</div>
<div>&gt;&gt; &#43;#define SIZE_MEMOP(ul) &nbsp;(ul) &nbsp; &nbsp;/* Size t=
o MemOp. &nbsp;*/</div>
<div>&gt;</div>
<div>&gt;SIZE_MEMOP() is never used until patch #10 &quot;memory: Access Me=
moryRegion</div>
<div>&gt;with MemOp semantics&quot;, it would be clearer to only introduce =
the</div>
<div>&gt;MEMOP_SIZE() no-op here, and directly introduce the correct SIZE_M=
EMOP()</div>
<div>&gt;macro in patch #10.</div>
<div><br>
</div>
<div>SIZE_MEMOP() is used, and is the main change, in patches #3 to #10. Pe=
rhaps you</div>
<div>meant MEMOP_SIZE()?</div>
<div><br>
</div>
<div>Either way, you have raised an issue :)</div>
<div><br>
</div>
<div>There is a lack of clarity in how the two macros are used to update th=
e</div>
<div>interfaces.&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156412098531714967btcom_--

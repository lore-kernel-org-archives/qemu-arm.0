Received: by 10.223.197.9 with SMTP id q9csp5517717wrf;
        Wed, 18 Oct 2017 03:10:29 -0700 (PDT)
X-Received: by 10.200.44.209 with SMTP id 17mr2005900qtx.220.1508321429399;
        Wed, 18 Oct 2017 03:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508321429; cv=none;
        d=google.com; s=arc-20160816;
        b=V6aMoVArnWlEk6hSdQs/pmOXkdDEfs3A67WYozpN5/JFD6d2EetVNJL4QmscsAHa3F
         fZvQ7wVqfIRp9JqzrQHMIXxqFETRXBgxnh2VSvGr63aECquk5ky8jWd1+euX9X4aLjez
         ltxIJgkX8waxcl3yzgOYcPbMTwSsWhV0YKiHw8bS9DLOXilJjimi/2Nw1HqHermo+LEI
         RohevSYyGQj5VfCzkrztrV4XPQGtUWvFZkE3YpX350jkyu/Z/yclpOUyyIRTPQp6BcPd
         45igAfb6CDi34gOLuNiFGXVeUWwFK0t4SeMLEej68zJJnnlUSu+EZc5KPACbrZXgyCk5
         FfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VyVlWf5AeAlo18AqSLEy/is3+XYsVAbJ1A1h6zP71i4=;
        b=Qu3+AW3V4+q1lkMSKQ5ZBk3CFG1CNTNpLAFEMfx6b969Q9oXgGT/EQl9Zmo/07tjAd
         yhnV9Urfiei4FPdqDHGaYTfmmFw9YEwgXBKAU6pKqa6oFmI48ooYauC37c7KbrqZ9eMc
         /zviMtH0Tq904uDh5REbbDzDYfYtJ+7cssjYwoGtBR/+BPVeyqY6fbW9o6VfRCFcQ8FB
         HWmqd7wrIWgATx/jvSCcDO9HddKY6qNZKp2IciD2saTAfux678gSu6cEKbYSRSUcxy0D
         7VeGctaIe1cZLuELuZJKwVinGReJrvWPKLA9DJpSID3cHjJzktyUaLxLCdWwxc0dV/Xk
         W+0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CYnQ6FTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y190si10306186qkc.411.2017.10.18.03.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 03:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CYnQ6FTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4lIx-00007z-3J
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 06:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4lIj-00005C-Jp
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 06:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4lIi-0002ez-31
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 06:10:13 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:54054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e4lIe-0002ZN-Ps; Wed, 18 Oct 2017 06:10:08 -0400
Received: by mail-ua0-x22f.google.com with SMTP id s41so3146033uab.10;
	Wed, 18 Oct 2017 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VyVlWf5AeAlo18AqSLEy/is3+XYsVAbJ1A1h6zP71i4=;
	b=CYnQ6FTrwefexeRG6H9UT66cAyfAxtUfa3b0cjdqTCFq7l7PQj+5UUrQ6vTtpBNbOH
	p+ltp5W/VIwSeZahst7Edkslnlsiy8rReEd11UnVNnf09qDKINz5tOvW0FPy8G9somuO
	CgVbFVYnLwXg1Od4uEBBgNWg+xOqI5MnG/ZOQPJq2+Ky0ZI1nmuUaIvUJhP9UTCydWfS
	7YieE7RppTSFPIlYzBvuUp1Hnp4XgX899sGgZ+mF7KkWe6grKukblQ6Wvomv0Y47r9/A
	RSYHmFcwq5luv3os9iCLveeAs3o/uXET+jPfD4+FbT7LgtkFfh4Sbqq/jTMfuSdrZM4U
	G4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VyVlWf5AeAlo18AqSLEy/is3+XYsVAbJ1A1h6zP71i4=;
	b=dTuncRnpcqAtqfnTPd5Fr7idPsgJr/NfELTD97bR8N76KISzpB/Sr4Jo6Bd4tubQa2
	lW1t4UzDvY0bWI/97OwhraN5MPTbXarn61E0M9x+9RhizCi7G0XOR9zDjgW8A9DGQekh
	pEahka6Mn9h/wRDSa43qcZAXM7JKFQsAKCi62ccoZH/If0ctzFC0BilDLNSNZej+TNo0
	Q9H12Hr/NRRCZ6zendUK+rTGO4n+Hr/MhBlVVGFiWi0PgWxDwIJBZe8D/LPpsum3YGe5
	MucYeZ+YlqxV7TrqvRvTFrwMNKC6niJEO3do5KIqfcHOaON/uI0jXMUCmFC4ZDF/IYy/
	V78A==
X-Gm-Message-State: AMCzsaWZ+DXo+5ghSFHE5iBKP2+gTVUsQyhBkkMI1ZFjakc165nBOsN1
	H4CxoNA4srvD++4krNDyQ032Nr8m73ThyNCoZIc=
X-Google-Smtp-Source: AOwi7QAMsBsFUqMZI2glUvyAmcZPJh0+MMitosXO5q0xDvLkhLlIMnQYoivV7C7gm0D2peViTJVQjInOxEKNKGH7A5o=
X-Received: by 10.159.49.234 with SMTP id w39mr12110638uad.133.1508321408306; 
	Wed, 18 Oct 2017 03:10:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Wed, 18 Oct 2017 03:10:07 -0700 (PDT)
In-Reply-To: <20171018085459.3mt4gynx3s3gndnt@starbug-vm.ie.oracle.com>
References: <1508298038-4156-1-git-send-email-sundeep.lkml@gmail.com>
	<20171018085459.3mt4gynx3s3gndnt@starbug-vm.ie.oracle.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 18 Oct 2017 15:40:07 +0530
Message-ID: <CALHRZuqhHJftwxP3h5Ne_VERxofwzwRgngeCZMP6G9oXi4UuXA@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, darren.kenny@oracle.com
Content-Type: multipart/alternative; boundary="001a114505a6bfd222055bcf712f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu devel v2 PATCH] msf2: Remove dead
 code reported by Coverity
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1h0tL91IcMoA

--001a114505a6bfd222055bcf712f
Content-Type: text/plain; charset="UTF-8"

Hi Darren,

On Wed, Oct 18, 2017 at 2:24 PM, Darren Kenny <darren.kenny@oracle.com>
wrote:

> On Wed, Oct 18, 2017 at 03:40:38AM +0000, Subbaraya Sundeep wrote:
>
>> Fixed incorrect frame size mask, validated maximum frame
>> size in spi_write and removed dead code.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>> v2:
>>         else if -> else in set_fifodepth
>>         log guest error when frame size is more than 32
>>
>> hw/ssi/mss-spi.c | 12 ++++++++----
>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>> index 5a8e308..7fef2c3 100644
>> --- a/hw/ssi/mss-spi.c
>> +++ b/hw/ssi/mss-spi.c
>> @@ -76,9 +76,10 @@
>> #define C_BIGFIFO            (1 << 29)
>> #define C_RESET              (1 << 31)
>>
>> -#define FRAMESZ_MASK         0x1F
>> +#define FRAMESZ_MASK         0x3F
>> #define FMCOUNT_MASK         0x00FFFF00
>> #define FMCOUNT_SHIFT        8
>> +#define FRAMESZ_MAX          32
>>
>> static void txfifo_reset(MSSSpiState *s)
>> {
>> @@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
>>         s->fifo_depth = 32;
>>     } else if (size <= 16) {
>>         s->fifo_depth = 16;
>> -    } else if (size <= 32) {
>> -        s->fifo_depth = 8;
>>     } else {
>> -        s->fifo_depth = 4;
>> +        s->fifo_depth = 8;
>>     }
>> }
>>
>> @@ -301,6 +300,11 @@ static void spi_write(void *opaque, hwaddr addr,
>>         if (s->enabled) {
>>             break;
>>         }
>> +        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Maximum frame size is
>> %d\n",
>> +                         __func__, FRAMESZ_MAX);
>> +            break;
>> +        }
>>         s->regs[R_SPI_DFSIZE] = value;
>>         break;
>>
>
> This test, and subsequent use of value appear to be out of sorts -
> in that while it is testing for the value by ANDing it with
> FRAMESZ_MASK, it is subsequently using the value without that mask
> applied to it, which still has the potential to be larger than
> FRAMESZ_MASK if it contains a value larger than 0x3F.
>
> Is that the expected behaviour? If so, maybe include a comment on
> it?
>

As per docs regarding [31:6]:
Software should not rely on the value of a reserved bit. To provide
compatibility with future products, the value of a reserved bit should be
preserved across a read-modify-write operation.

Hence we do not care about [31:6] and validate only [5:0] for size during
write.
When reading size we AND with FRAMESZ_MASK. In other words we let [31:6]
bits like scratch bits where guest can read and write. I am really not sure
how hardware
behaves if [5:0] is greater than 32 hence guest error and write wont
happen. If this is not
right we can discuss :)


>
> Also, it might be useful to include the incorrect value in the
> logged output too, not just what the maximum is.
>
> Ok I will change.

Thanks,
Sundeep


> Thanks,
>
> Darren.
>
>
>> --
>> 2.5.0
>>
>>
>>

--001a114505a6bfd222055bcf712f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hi Darren,<div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Wed, Oct 18, 2017 at 2:24 PM, Darren Kenny <span dir=3D"lt=
r">&lt;<a href=3D"mailto:darren.kenny@oracle.com" target=3D"_blank">darren.=
kenny@oracle.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Wed=
, Oct 18, 2017 at 03:40:38AM +0000, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Fixed incorrect frame size mask, validated maximum frame<br>
size in spi_write and removed dead code.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
v2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if -&gt; else in set_fifodepth<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 log guest error when frame size is more than 32=
<br>
<br>
hw/ssi/mss-spi.c | 12 ++++++++----<br>
1 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c<br>
index 5a8e308..7fef2c3 100644<br>
--- a/hw/ssi/mss-spi.c<br>
+++ b/hw/ssi/mss-spi.c<br>
@@ -76,9 +76,10 @@<br>
#define C_BIGFIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 29)<=
br>
#define C_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt;=
 31)<br>
<br>
-#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F<br>
+#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3F<br>
#define FMCOUNT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00FFFF00<br>
#define FMCOUNT_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
+#define FRAMESZ_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 32<br>
<br>
static void txfifo_reset(MSSSpiState *s)<br>
{<br>
@@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 32;<br>
=C2=A0 =C2=A0 } else if (size &lt;=3D 16) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 16;<br>
-=C2=A0 =C2=A0 } else if (size &lt;=3D 32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
@@ -301,6 +300,11 @@ static void spi_write(void *opaque, hwaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((value &amp; FRAMESZ_MASK) &gt; FRAMESZ_MA=
X) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot;%s: Maximum frame size is %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, FRAMESZ_MAX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFSIZE] =3D value;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
</blockquote>
<br></div></div>
This test, and subsequent use of value appear to be out of sorts -<br>
in that while it is testing for the value by ANDing it with<br>
FRAMESZ_MASK, it is subsequently using the value without that mask<br>
applied to it, which still has the potential to be larger than<br>
FRAMESZ_MASK if it contains a value larger than 0x3F.<br>
<br>
Is that the expected behaviour? If so, maybe include a comment on<br>
it?<br></blockquote><div><br></div><div>As per docs regarding [31:6]:</div>=
<div><div>Software should not rely on the value of a reserved bit. To provi=
de</div><div>compatibility with future products, the value of a reserved bi=
t should be</div><div>preserved across a read-modify-write operation.</div>=
</div><div><br></div><div>Hence we do not care about [31:6] and validate on=
ly [5:0] for size during write.</div><div>When reading size we AND with FRA=
MESZ_MASK. In other words we let [31:6]<br></div><div>bits like scratch bit=
s where guest can read and write. I am really not sure how hardware</div><d=
iv>behaves if [5:0] is greater than 32 hence guest error and write wont hap=
pen. If this is not</div><div>right we can discuss :)</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also, it might be useful to include the incorrect value in the<br>
logged output too, not just what the maximum is.<br>
<br>
</blockquote><div>Ok I will change.</div><div><br></div><div>Thanks,</div><=
div>Sundeep</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Thanks,<br>
<br>
Darren.<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
2.5.0<br>
<br>
<br>
</blockquote>
</font></span></blockquote></div><br></div></div>

--001a114505a6bfd222055bcf712f--

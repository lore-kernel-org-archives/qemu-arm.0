Received: by 10.25.159.19 with SMTP id i19csp2146587lfe;
        Mon, 18 Jan 2016 13:41:56 -0800 (PST)
X-Received: by 10.55.81.87 with SMTP id f84mr33650308qkb.10.1453153316825;
        Mon, 18 Jan 2016 13:41:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x143si33097229qka.122.2016.01.18.13.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 13:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:33805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLHYi-0000Fu-BJ
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 16:41:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLHYg-0000CH-0d
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 16:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aLHYf-0003yJ-4n
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 16:41:53 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aLHYc-0003w7-UF; Mon, 18 Jan 2016 16:41:51 -0500
Received: by mail-oi0-x242.google.com with SMTP id a202so13625789oib.3;
	Mon, 18 Jan 2016 13:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=pejnBsdEynSxA/gmWSWMF6I8Um+iJtCMWFtTTmrdul0=;
	b=x030CCsQeT52KIgWRYHn7Zh+Xsy9nHx7TD0QQtF547rmj1MRTRiIOKq0/+3Jv1QWfE
	359ydpVyKZDkv6WFNRiwtF5wEppMxyINQKgZh97JhlfrAKznA08G+keBOsQYPFu48kXT
	cd+lZdXdYGzOv5/wQ6gEfC+7xHXiz7c381un2T2YaWmrObh5S2RUab7MjWH5kg+SzlLS
	DUprRsvX3ebwjMPo9Y0HHPvZ8v9R1ZpR2iBEbdYnHudoySIyRVC/Q3SimVx8XzlFVGPw
	aKo+McBFtRT99eRWUXUnXaWmP9KQokkuWggE+nxL3HPA1VWS/r0UuoSJYZHEc/ciJxJy
	69ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=pejnBsdEynSxA/gmWSWMF6I8Um+iJtCMWFtTTmrdul0=;
	b=gIi1EfbWtd+/sXT199Y8OGzZxBPcM0b9NYPsdNwp+T8XdpZWXLxL0c64ralTkcu36Y
	hAZwXbY2G+8roWvhLHMbZSVd48kfoJFCKTf83SrQBVbroHo+Rn6/PcuaBbtrNr9UznI0
	5+nhiFkDKylXg7HoWxWwpHOKi+IJbGZL3F1agDS6d9pAMi+gI1tD3DERdhQmak61ESiq
	HATWqxKOn6WYzFnI6/FtggKAPG5kIbSXbk04AWRJLw0zFZa4HWgXzgVg5kDJ643g4vlv
	yzN/3z0+4oS4jJt537q2/v/KEEl0h9yjD3Ckl6japsozEvuvindHCBLyk80r23QOimQI
	+YxA==
X-Gm-Message-State: ALoCoQkk3WpjQ4OlRa4SYAXGv9qiL/1kZOBB42GIw/l8ywEDWYjQcda5xLRWeAMgjGxgBrdlWeZm9YGgBZgM99x4HSfnrm2SpQ==
X-Received: by 10.202.83.139 with SMTP id h133mr19990136oib.127.1453153310306; 
	Mon, 18 Jan 2016 13:41:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 18 Jan 2016 13:41:20 -0800 (PST)
In-Reply-To: <CAFEAcA-mmYVGqBP9J855Xm20n0XGVMLoWv4Lze61y00EvFBDyw@mail.gmail.com>
References: <861da5c44f261ee3f160607c9d128ce0e9f89e9e.1452277501.git.alistair.francis@xilinx.com>
	<CAFEAcA-mmYVGqBP9J855Xm20n0XGVMLoWv4Lze61y00EvFBDyw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Jan 2016 13:41:20 -0800
X-Google-Sender-Auth: iRItJKvbG49B_owNHfzqD1EuD6U
Message-ID: <CAKmqyKNyc2tU0cmGhGDz2tm17q7fYRzqmML-Yo2fE8Ly4fmtAQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] arm_gic: Include the GIC
 ArchRev in the ICPIDR2 register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9TdqjYq3bp7J

On Mon, Jan 11, 2016 at 5:58 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 8 January 2016 at 18:57, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> The ARM GIC documentation (page 4-119) describes that bits
>> 7 to 4 of the ICPIDR2 register should include the GIC architecture
>> version. This patche ORs the version into the existing return value.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>>
>>  hw/intc/arm_gic.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 13e297d..f47d606 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -688,6 +688,10 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr=
 offset, MemTxAttrs attrs)
>>      } else /* offset >=3D 0xfe0 */ {
>>          if (offset & 3) {
>>              res =3D 0;
>> +        } else if (offset =3D=3D 0xfe8 && s->revision !=3D REV_11MPCORE=
 &&
>> +                                      s->revision !=3D REV_NVIC) {
>> +            /* ICPIDR2 includes the GICv1 or GICv2 version information =
*/
>> +            res =3D gic_id[(offset - 0xfe0) >> 2] | (s->revision << 4);
>>          } else {
>>              res =3D gic_id[(offset - 0xfe0) >> 2];
>>          }
>
> The current implementation of the ID registers seems to be
> simply "like the 11MPCore interrupt controller". I think we
> should get them right more generally if we're going to fix them:
>
>                        fd0 .. fdc     fe0 .. fec      ff0 ... ffc
> 11MPCore               reserved       90 13 04 00     0d f0 05 b1
> ARM GICv1 (eg A9)      04 00 00 00    90 b3 1b 00     0d f0 05 b1
> ARM GICv2 (eg A15)     04 00 00 00    90 b4 2b 00     0d f0 05 b1
>
> Your patch doesn't account for ICPIDR1 also having a field that
> changes between GICv1 and GICv2 (for ARM implementations), and
> we're missing the fd0..fdc bytes.
>
> I think this is probably simplest modelled with several
> gic_id arrays and using the appropriate one for 11MPCore/GICv1/GICv2,
> rather than trying to OR extra values into the 11MPCore ID values.

Ok, just to make sure I am reading this right. You think I should just
create three arrays and then if() the revision to determine which one
to use?

Thanks,

Alistair

>
> For the NVIC these registers don't exist at all, and the
> construction of the memory regions in armv7m_nvic.c ensures
> we can't reach this bit of the function, so we don't need
> to specially handle it. (Also there's a rewrite of the NVIC
> to disentangle it from the GIC which hopefully will land
> some time before 2.6.)
>
> thanks
> -- PMM
>

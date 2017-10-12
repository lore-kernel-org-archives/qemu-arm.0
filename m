Received: by 10.223.197.9 with SMTP id q9csp1975953wrf;
        Thu, 12 Oct 2017 11:58:59 -0700 (PDT)
X-Received: by 10.55.159.133 with SMTP id i127mr1952288qke.157.1507834738943;
        Thu, 12 Oct 2017 11:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507834738; cv=none;
        d=google.com; s=arc-20160816;
        b=YopoW8XeP/xnYnowaQBcAINlbtFprguYyigBJrGEyVFIjkZgrY7aYhRu8bPmGokfgN
         I6+b+25qnncJ4vquBEUkwKx0xHPc8expb9KCVhc75S5YuIPYTYJauwFLdUzE2QXDKCFV
         BvWhJRnwqFDBP64yprq/GrlP1+XKDhH+SUs1bhi1u03jfEpcSQA9jcWLmWXrBqmprWU0
         2BZshmdwwwOTc4UeNHnnOkS2rjGee8mSiPrz10Nye+mFn95CVMSi3k3ewjw8gqIY9Qmr
         li7oTiStDE31nwYzL16OJwCRBq3IITZrWIB4EoWnd4VXj9YFZ/C/njThtNepKbE7xSTi
         A6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TNwqP7nIFAcqgFlz9/1AhpgrLmK255/8eqJXxtxreas=;
        b=RKwcFJtpHKDVySjI94nCQerzDEj6WkeE7tloMFS0zr62rc6Gph5ow/cASfoH7Oaz06
         +RWkzyW8YxdcjpZap7KbuqwipMS+eVBKyswueFlvKc9Z1tj3VZVp02xIn/hhp62tGkki
         4CKg+aMPUzud1fz0eO0iEQC3sMdG/kKU8KuABON5aiGJTdB8Xo+B7izlCW8ElZSijBgu
         hH8vu1xs3KD7HPDhi1ZRfsh+mFHjxhtsgOIaghKMmUcC7xzjoQAXagp0ncHCF2flX8Ks
         KkgfOo0aX/WiFNNhnPrLMxKTKuH6uRAHJRkDiQFkO70LfKx3PDIZvnk+9FFsPdbDuG+/
         qrSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kStlLvuJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si1758694qtb.128.2017.10.12.11.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 11:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kStlLvuJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2ih6-0002SH-PM
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 14:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1e2igz-0002S8-B6
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 14:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1e2igx-0004qy-VG
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 14:58:49 -0400
Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235]:46301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1e2igx-0004oY-IA; Thu, 12 Oct 2017 14:58:47 -0400
Received: by mail-lf0-x235.google.com with SMTP id g70so7014065lfl.3;
	Thu, 12 Oct 2017 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TNwqP7nIFAcqgFlz9/1AhpgrLmK255/8eqJXxtxreas=;
	b=kStlLvuJS8aFU01Y9V6myfyavB/P1PDFzsmwyUjuReuTXTKLqYk17cmOxZnY0lre59
	ZGv/z+UVnTlvUyGW0RhjAVPXcfpjNSADOWmn4L/uYpXwxLMZRIEzaolgwWKf+s/Hpn5z
	nD1PtlZJy3gv2yu4sif0TDsfi+cX1DipU2HKXwvUovMPUgkjtO+fR5hedunvN3X0SGO/
	evayN8AMJOJPtS2NzwtY1+RqWRVPKxfcGzo/wbekfvjGN+HRzdIKYN3AaaLwm1Fc2FA6
	ark4THIxpKm/lSJ+LJw1QyXjMPSjNVXdq5m8yjzuCmj7jKWSXhsaehSLebpmd6+0eag9
	+NYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TNwqP7nIFAcqgFlz9/1AhpgrLmK255/8eqJXxtxreas=;
	b=bA4IPOv/XdugqYNGzBnYcxP7YJqSfF33PhFfD69fvI+B4Re7NZy4arDYHJ7spRyWmd
	9e9MU4BYFqcPyUMvjaZ5D/UunHPAhFQE7SXAQFYugPn4a6T3XV1ED6u1adWTfgzKV5FP
	vPresQZMZPYI/XSnAwUo0zrGAWMGqH1OuzwarANC5STlckcUPbksNvQ7nKFVJDGwCweo
	ECaTUBhLwLarVWrl1e4sqlwNKW2Yeo53vLKFJsg/Dpvw7iEgHV+GctP0cB4o0RvDoJVl
	AaJymymU7kSKWu4lbMMbSwizkcIpUIf8pM0Ds8L2GRtxs79SEHsNkuhLPtqhFrH0eOEg
	kXEA==
X-Gm-Message-State: AMCzsaWMkx+mfdB1JOiLjregqA87Pdt6Igl1MQPSfxCRCjF5R4/cgAtg
	5BIxtGB1d2pTe9T86aiTZxDDc4TIL4n9Py9lOlg=
X-Google-Smtp-Source: ABhQp+TeYptZBPySUKIG4DFBT8qa+ND8wR1js+BH9zLuT1darBPgOMpMRXNTmGbnvO88S0neskT4DgAPnf7JxHjL9Vc=
X-Received: by 10.25.221.196 with SMTP id w65mr949216lfi.89.1507834724615;
	Thu, 12 Oct 2017 11:58:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.220 with HTTP; Thu, 12 Oct 2017 11:58:43 -0700 (PDT)
Received: by 10.25.83.220 with HTTP; Thu, 12 Oct 2017 11:58:43 -0700 (PDT)
In-Reply-To: <CAKmqyKMTqZA+t77XV3s2aicsbHHbF8h96w=dmWO9VHJkE0Uw8w@mail.gmail.com>
References: <cover.1505929556.git.alistair.francis@xilinx.com>
	<20171008222029.GA29979@toto>
	<CAKmqyKMEbQ3JbqMxeeOTBV92ixRVDfw1wFi57xNKGyF82DSC_Q@mail.gmail.com>
	<20171010144834.GC5553@toto>
	<CAKmqyKMTqZA+t77XV3s2aicsbHHbF8h96w=dmWO9VHJkE0Uw8w@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 12 Oct 2017 20:58:43 +0200
Message-ID: <CAJy5ezogexkDJzFp-YyvHqFPhJWrKhEZstwaBsN4njTB9qC=mw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: multipart/alternative; boundary="94eb2c0c884a240aee055b5e21e8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/8] Add the ZynqMP PMU and
 IPI
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: An+tdX++hU+I

--94eb2c0c884a240aee055b5e21e8
Content-Type: text/plain; charset="UTF-8"

On Oct 10, 2017 7:59 PM, "Alistair Francis" <alistair.francis@xilinx.com>
wrote:

On Tue, Oct 10, 2017 at 7:48 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Mon, Oct 09, 2017 at 05:12:39PM -0700, Alistair Francis wrote:
>> On Sun, Oct 8, 2017 at 3:20 PM, Edgar E. Iglesias
>> <edgar.iglesias@xilinx.com> wrote:
>> > On Wed, Sep 20, 2017 at 03:01:31PM -0700, Alistair Francis wrote:
>> >>
>> >> This series adds the ZynqMP Power Management Unit (PMU) machine with
basic
>> >> functionality.
>> >>
>> >> The machine only has the
>> >>  - CPU
>> >>  - Memory
>> >>  - Interrupt controller
>> >>  - IPI device
>> >>
>> >> connected, but that is enough to run some of the ROM and firmware
>> >> code on the machine
>> >>
>> >> The series also adds the IPI device and connects it to the ZynqMP ARM
>> >> side and the ZynqMP PMU. These IPI devices don't connect between the
ARM
>> >> and MicroBlaze instances though.
>> >>
>> >> v3:
>> >>  - Add the interrupt controller
>> >>  - Replace some of the error_fatals with errp
>> >>  - Fix the PMU CPU name
>> >
>> > Hi Alistair,
>> >
>> >
>> > Sorry for the super long delay...
>> >
>> > I think this mostly looks good but I was wondering if we really need
>> > to have a board specific (zcu102) PMU?
>>
>> It doesn't have to be board specific. What I wanted though was an SoC
>> and a machine so that maybe one day we could add the PMU SoC to the
>> ARM ZCU102 machine. After that it was hard to think of a name to
>> differentiate the SoC and the machine. Do you have a recommendation on
>> names?
>
>
> Hi Alistair,
>
> Yes, I agree with your approach but I got a little confused by the names.
>
> I think all the stuff that is inside the PMU subsystem architecture-wise
> should have generic PMU names (no ZCU102). I.e the ROM, the RAM, the
IOModule,
> interrupt controller etc.

Ok I can rename them to the ZynqMP PMU (the machine/board) and the
ZynqMP PMU SoC. Does that work?

>
> The IPI block can be outside of the PMU module and be instantiated by the
> board or perhaps better if we could reuse some of the ZynqMP modules
> instantiated by the ZCU102 machine to get a CPU-less PS for the PMU
> to interact with. Or something along those lines.
> How does that sound?>

I'm a little unclear what you mean here.

Thanks,
Alistair

> Best regards,
> Edgar
>


Hi Alistair,

To clarify, if you create a pmu object, try to only put stuff in that
object that belong to the pmu subsystem. The IPI block for example doesn't,
it belongs outside of the pmu object allthough you will want to instate an
ipi instance in the pmu machine.

Hope that helps
Edgar

Sent from my phone

--94eb2c0c884a240aee055b5e21e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Oct 10, 2017 7:59 PM, &quot;Alistair Francis&quot; &lt;<a href=
=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xilinx.com</a>&gt;=
 wrote:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"elid=
ed-text">On Tue, Oct 10, 2017 at 7:48 AM, Edgar E. Iglesias<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com">edgar.iglesias@gmail.com</a=
>&gt; wrote:<br>
&gt; On Mon, Oct 09, 2017 at 05:12:39PM -0700, Alistair Francis wrote:<br>
&gt;&gt; On Sun, Oct 8, 2017 at 3:20 PM, Edgar E. Iglesias<br>
&gt;&gt; &lt;<a href=3D"mailto:edgar.iglesias@xilinx.com">edgar.iglesias@xi=
linx.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On Wed, Sep 20, 2017 at 03:01:31PM -0700, Alistair Francis wr=
ote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This series adds the ZynqMP Power Management Unit (PMU) m=
achine with basic<br>
&gt;&gt; &gt;&gt; functionality.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The machine only has the<br>
&gt;&gt; &gt;&gt;=C2=A0 - CPU<br>
&gt;&gt; &gt;&gt;=C2=A0 - Memory<br>
&gt;&gt; &gt;&gt;=C2=A0 - Interrupt controller<br>
&gt;&gt; &gt;&gt;=C2=A0 - IPI device<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; connected, but that is enough to run some of the ROM and =
firmware<br>
&gt;&gt; &gt;&gt; code on the machine<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The series also adds the IPI device and connects it to th=
e ZynqMP ARM<br>
&gt;&gt; &gt;&gt; side and the ZynqMP PMU. These IPI devices don&#39;t conn=
ect between the ARM<br>
&gt;&gt; &gt;&gt; and MicroBlaze instances though.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; v3:<br>
&gt;&gt; &gt;&gt;=C2=A0 - Add the interrupt controller<br>
&gt;&gt; &gt;&gt;=C2=A0 - Replace some of the error_fatals with errp<br>
&gt;&gt; &gt;&gt;=C2=A0 - Fix the PMU CPU name<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Alistair,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Sorry for the super long delay...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I think this mostly looks good but I was wondering if we real=
ly need<br>
&gt;&gt; &gt; to have a board specific (zcu102) PMU?<br>
&gt;&gt;<br>
&gt;&gt; It doesn&#39;t have to be board specific. What I wanted though was=
 an SoC<br>
&gt;&gt; and a machine so that maybe one day we could add the PMU SoC to th=
e<br>
&gt;&gt; ARM ZCU102 machine. After that it was hard to think of a name to<b=
r>
&gt;&gt; differentiate the SoC and the machine. Do you have a recommendatio=
n on<br>
&gt;&gt; names?<br>
&gt;<br>
&gt;<br>
&gt; Hi Alistair,<br>
&gt;<br>
&gt; Yes, I agree with your approach but I got a little confused by the nam=
es.<br>
&gt;<br>
&gt; I think all the stuff that is inside the PMU subsystem architecture-wi=
se<br>
&gt; should have generic PMU names (no ZCU102). I.e the ROM, the RAM, the I=
OModule,<br>
&gt; interrupt controller etc.<br>
<br>
</div>Ok I can rename them to the ZynqMP PMU (the machine/board) and the<br=
>
ZynqMP PMU SoC. Does that work?<br>
<div class=3D"quoted-text"><br>
&gt;<br>
&gt; The IPI block can be outside of the PMU module and be instantiated by =
the<br>
&gt; board or perhaps better if we could reuse some of the ZynqMP modules<b=
r>
&gt; instantiated by the ZCU102 machine to get a CPU-less PS for the PMU<br=
>
&gt; to interact with. Or something along those lines.<br>
&gt; How does that sound?&gt;<br>
<br>
</div>I&#39;m a little unclear what you mean here.<br>
<div class=3D"elided-text"><br>
Thanks,<br>
Alistair<br>
<br>
&gt; Best regards,<br>
&gt; Edgar<br>
&gt;<br></div></blockquote></div></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Hi Alistair,=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">To clarify, if you create a pmu object, try to only put stuff in=
 that object that belong to the pmu subsystem. The IPI block for example do=
esn&#39;t, it belongs outside of the pmu object allthough you will want to =
instate an ipi instance in the pmu machine.=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Hope that helps</div><div dir=3D"auto">Edgar=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sent from my phone=
=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div class=3D"elided-text">
</div></blockquote></div><br></div></div></div>

--94eb2c0c884a240aee055b5e21e8--

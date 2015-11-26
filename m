Received: by 10.182.158.201 with SMTP id ww9csp826571obb;
        Thu, 26 Nov 2015 11:38:52 -0800 (PST)
X-Received: by 10.140.41.234 with SMTP id z97mr8041710qgz.64.1448566732573;
        Thu, 26 Nov 2015 11:38:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j141si27612675qhc.86.2015.11.26.11.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 11:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a22NY-0005H1-6o
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 14:38:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a22NV-0005Cm-9V
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 14:38:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a22NU-0006sB-94
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 14:38:49 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a22NS-0006rE-7U; Thu, 26 Nov 2015 14:38:46 -0500
Received: by wmec201 with SMTP id c201so33903392wme.1;
	Thu, 26 Nov 2015 11:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=3UTm3CgyJ2n9VeJkIX5MhF0zsWuNNggfM8zYqywzKWM=;
	b=kuPtZxrBWWVdFO62xZexXxsOhtabCr8SLGkd8EKkJL+eNu8poyUBowrODjj38AWQUg
	lo3Muh05bZJ96tvQGJLjj4hzOVjYUmhrj0pvg/T7oV9Cg+XvCLuUJDT62nYFpQMuen77
	hbtnNEp5VvWe+YWiuTMT5CzvQ7zJgW4vsVmoX6mZJ6FSFvQHs/s4b9hmT5FoNGV8pqXd
	wEIfUMeKzqzgAAlwVZVHD3/7KDml2ENoyA0AgAHHJcBqIIUdl6gjMUhXn1HpDtPS1lgZ
	R+S0SjD8n7zVsU4AywHgk8Mr4TBlLf4ySxaGuUXd2wSym9zBGURCByujF1QFl1McPqSl
	S8Tw==
MIME-Version: 1.0
X-Received: by 10.194.114.105 with SMTP id jf9mr49991077wjb.102.1448566725326; 
	Thu, 26 Nov 2015 11:38:45 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Thu, 26 Nov 2015 11:38:45 -0800 (PST)
In-Reply-To: <BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Thu, 26 Nov 2015 11:38:45 -0800
Message-ID: <CAPokK=p61hGYhB0rMxsuJdfbhB1bgciC-w0Fg=m4Bwa-J2Am9Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::233
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] RFC: raspberry pi / pi2 /
	Windows-on-ARM support
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
X-TUID: Ne7cbRXvFHtW

On Wed, Nov 18, 2015 at 10:16 AM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter,
>
> Thanks for your feedback!
>
> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> Sent: Tuesday, 17 November 2015 23:51
>> I haven't looked beyond the diffstat yet, but a top level
>> architectural comment, I only see the one file in hw/arm. We are
>> promoting the split of board and SoC now as two separate objects. Each
>> of the patch series linked above demonstrates this. The BCM SoC would
>> be an object in its own right, then the board instantiates the SoC as
>> a composite device.
>
> I understand the rationale here, but is there much value pursuing this fo=
r the Pi? As far as I know, the Pi1/2 SOCs (bcm2835 and 2836) are one-off d=
esigns used only in the Pi. Moreover, the 2836 is basically a copy of the 2=
835 with the addition of a new block for a multi-core interrupt controller =
and mailboxes, so trying to split those out into two separate SOC definitio=
n files would require either lots of duplication, or a tight coupling betwe=
en the two. Finally, there is basically nothing on the board besides the So=
C and RAM (just a USB-Ethernet adapter), so the actual board definition fil=
es would be almost empty. As it is, I've already factored out all the commo=
n devices within hw/arm/raspi.c -- my feeling is that this is a cleaner way=
 to do it for the Pi.
>

So I am looking at some recent news, and there is the RPi Zero which
reuses the bcm2835 as a different board. Can't find the schematic yet,
but from what I can see, this is a raw SoC (no USB ethernet). With
your SoC/board split we should be able pickup the Zero board quite
cheaply as follow up work.

Regards,
Peter

>> It is big. Work of this magnitude is generally better managed as
>> multiple series (each of multiple patches). A general approach with
>> new ARM boards is the first series is the bare minimum needed to get a

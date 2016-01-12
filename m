Received: by 10.25.159.19 with SMTP id i19csp786534lfe;
        Tue, 12 Jan 2016 15:14:59 -0800 (PST)
X-Received: by 10.55.81.87 with SMTP id f84mr72531962qkb.10.1452640499117;
        Tue, 12 Jan 2016 15:14:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8si49149503qhb.19.2016.01.12.15.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 15:14:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ89S-0001Pb-GE
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 18:14:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJ898-00018f-Sm
	for qemu-devel@nongnu.org; Tue, 12 Jan 2016 18:14:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJ897-0007In-VF
	for qemu-devel@nongnu.org; Tue, 12 Jan 2016 18:14:38 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aJ897-0007Ij-My; Tue, 12 Jan 2016 18:14:37 -0500
Received: by mail-wm0-x244.google.com with SMTP id u188so33775147wmu.0;
	Tue, 12 Jan 2016 15:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GDiMAXu/kNhxAPeNeP6mbmLq5N53KWxNmb4n1GqUW+A=;
	b=LHV5lP+e31m0Q3UrO8FjbRcz6JcHZTCy+9hD0ibrdw8FtWjucSJMSBWSwkkOon4QcL
	oh17wqjRo85teP+rAOlLM2YcNErWyq//MSKQeGcCd+/tkltHRxD8i34Vhu5XKs4yfPN1
	a2VeL8nM7f8luZVju9SVHaB0mnbR7GR0u0ZMMD1nWi1d9sszUMsM2tBPFptHjgTJQBkj
	I6FZ1XGKTGQwW8u6ePOwrWVwgWH9FbEQLBthiC3QzD32AbkS4X9xvhoDAGQB2lyAOCh/
	mZsRLTuX3z1JX5lV+JBt5oRBEpSCx/1l9mR4w9tTqhKa/0N/+kM+mX1Yv/6Qa00blsw7
	GSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=GDiMAXu/kNhxAPeNeP6mbmLq5N53KWxNmb4n1GqUW+A=;
	b=Eg2pY4XmBrk4GSvF8BcnOeyqqw2S+pBEwF33H6F6euNVKYM45BUH7+Ha/T1NCW+Flt
	cspZQ21wU422warCuPnYvi2GLFG6Ri6xRXp3EFUvUNfTe96C99fkNRTDtW5fBERvikuO
	OP62QaKu+YcKa8lSeEohHRXxuk7bjLoc3pM3BTiM41pKERX5csVT5XCQ7QmP+QBSgBqX
	6Rjd7fQdQvANlMZkg/JbKfyvQz8WuMF6q9YkXN/va5g7AOPpo85Hj6NQVWWLnTmixT7y
	tE0mnjIVDzdQnnVW9eoZhgMGeynlcqzDLIigc0uuKEM41H1voRcVNZHvZZ+71u+fj/2m
	nhqA==
X-Gm-Message-State: ALoCoQkNNcaJ++VroahSXHm2H1J24Wkg2AtGLuXzyN+q8sV9ddD6Xvta2Gh+0qxbltrrWobPOnRG9z1OA4f6Gzp7Ewf5FhhAdw==
MIME-Version: 1.0
X-Received: by 10.28.217.83 with SMTP id q80mr21180143wmg.15.1452640476786;
	Tue, 12 Jan 2016 15:14:36 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Tue, 12 Jan 2016 15:14:36 -0800 (PST)
In-Reply-To: <BLUPR0301MB20349F632BDD3C52631961259ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-7-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035645.GC3308@pcrost-box>
	<BLUPR0301MB20349F632BDD3C52631961259ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 12 Jan 2016 15:14:36 -0800
Message-ID: <CAPokK=rT2LcLQk0JwpXrBNJ-v418asBZjzz+zjS_OzwhfONVZw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 6/7] bcm2836: add bcm2836 soc device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bJ/QEie4IND/

On Tue, Jan 12, 2016 at 2:56 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter,
>
> Thanks again for the reviews.
>
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Monday, 11 January 2016 19:57
>> On Thu, Dec 31, 2015 at 04:31:33PM -0800, Andrew Baumann wrote:
>> > +    /* TODO: probably shouldn't be using smp_cpus here */
>>
>> I agree. I have started ignoring smp_cpus completely for new ARM SoCs,
>> as if you change the number of CPUs for a SoC, it is not that SoC
>> anymore. The virt platform is suitable for CPU scalability, whereas
>> with ARM SoCs, cpu # variation is invalid.
>>
>> > +    assert(smp_cpus <=3D BCM2836_NCPUS);
>> > +    for (n =3D 0; n < smp_cpus; n++) {
>>
>> So can we just use BCM2836_NCPUS here as the loop bound? Any
>> conditionals out there check the existance of CPUs can be removed or
>> promoted to assert() as a BCM2836 must always have 4 CPUs.
>
> I'd love to do that, but there's at least one good reason to respect the =
-smp parameter and not start all the CPUs: with full-system emulation, qemu=
 is noticeably faster emulating a single-core target than multi-core. E.g.,=
 Linux boots fine with -smp 1 (it fails to start the other CPUs but proceed=
s with just one), and many users will be better off running it this way, so=
 I definitely don't want to break that.
>

What are the secondary CPUs doing in this case? In most systems they
end up penning on a WFI/WFE. Is Linux actually trying to do the SMP
bringup - are you are getting a secondary entry point?

If not and it is just a busy wait killing perf, start-powered-off
property might help. Is the firmware responsible for secondary-penning
an actual busy-wait or does it involve power-control periphs etc?

Regards,
Peter

> I tried always initing all 4 CPUs in bcm2836_init, and only starting a co=
nfigurable number (based on a property) in realize. However, arm cpu_exec_i=
nit already adds the cpu to the global list of all CPUs, and if you try to =
start the system in this state it quickly segfaults on uninitialized state =
in the CPU, so it seems we shouldn't even init CPUs that won't later be sta=
rted. However, I can't refer to properties in the _init method, which is wh=
y I'm stuck using the smp_cpus global.
>
> If you have a better suggestion, I'm all ears :) Would it make sense to d=
efer calling init() until the realize method, when we can access a property=
?
>
> Cheers,
> Andrew

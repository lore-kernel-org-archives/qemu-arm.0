Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2011332wrt;
        Thu, 18 Oct 2018 02:39:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63Ny0g1OB7XpnJ/xltXsmnyiMIgrOCEVex/o7VEoRZFr1Q2YOgYmCsyOiPDqkS2EWsmMBWz
X-Received: by 2002:ac8:2bb9:: with SMTP id m54-v6mr28185555qtm.36.1539855555663;
        Thu, 18 Oct 2018 02:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539855555; cv=none;
        d=google.com; s=arc-20160816;
        b=pSrIL8rhm2OMVb1MicKQNvCsZpa+/frja9tpRXGANpebIRdcwlxBqXbf1W2KRdB0Ys
         51eE+jC/sPGMk/Us9iwZxzc547lRKPC2cvktlCsOZhSiUo8HRChXmgEjWaedpIYvLbYd
         8AFK6raU8Aq40XxVDnBRe/dmbpLJQVGh8308UIRxc5bNfV+8hPvZybE/67f1iIZbPnEq
         S3kJx+TJZrufENfsIOfUNrSs2gkJsgzCzLXIZMSlrf1RoSB/AelUbBFFCoK2lrnxjipA
         Gq8GZ/BGvT7WlGTLVhKQ/GxjRMJCTjQUQmr6VDuwI6oo9tteeQE91XT4Ta7j5TBAd3q8
         7xuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:date
         :thread-index:thread-topic:to:from:message-id;
        bh=uJgCJZz4dShu+kX90Gy/L/G/laLREKKGuLUL98rzUUc=;
        b=zFvjexQtGXtFclcl3OEiRgB7dUCPnyEhcefVktG+Nb+CJyu6fdqHzslwMF4GEB+3eo
         TksY5flXb87C96C17F5dmZQchePfFDtxtAze3joS8CUtDapaMrEkeEOrrenm2tJaatuE
         47LhM/kavcP9EWOlmbg/2JjGNrn3YcJhgEFVzEOYTb1r3bqqo1BP45niVWDzRcU/SPRf
         rF3xcUPZSYkcx8827so6sqjRwjS5ZO5z3rgPx2Gl9jIlPXdhVwihwgvE2S+vpOw30apu
         Aj0Ae/uMqCd8K+R4Ue1doFRdGvhK4Lyq63JMyfVJg0nu+odlYvJ1LKy8bxf7zmzHg/qA
         Do/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p31-v6si10422635qtp.114.2018.10.18.02.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 02:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Message-ID: <5bc854c3.1c69fb81.68978.0d20SMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: 9239E1F2-6FF6-4C64-9A3E-C71F0D9F5479
Received: from localhost ([::1]:41281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD4lv-0003I4-4O
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 05:39:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1gD4lj-0003Hv-9v
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 05:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1gD4lf-0007xh-9t
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 05:39:03 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2285 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1gD4le-0007vC-44; Thu, 18 Oct 2018 05:38:59 -0400
Received: from DGGEMA403-HUB.china.huawei.com (unknown [172.30.72.57])
	by Forcepoint Email with ESMTP id 82AFE6D6A223B;
	Thu, 18 Oct 2018 17:38:45 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.214]) by
	DGGEMA403-HUB.china.huawei.com ([10.3.20.44]) with mapi id
	14.03.0399.000; Thu, 18 Oct 2018 17:38:41 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH RFC v11 0/2] add support for VCPU event states
Thread-Index: AQHUZU/pyQ+uVrGW0k2ivbQr6T/c16UkwhND
Date: Thu, 18 Oct 2018 09:38:40 +0000
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>,
	<CAFEAcA97eSpOzU_xJZLFgFBZUCW1Z8mYDMzYsdpK99S5WiPf=A@mail.gmail.com>
In-Reply-To: <CAFEAcA97eSpOzU_xJZLFgFBZUCW1Z8mYDMzYsdpK99S5WiPf=A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
	boundary="_000_9239E1F26FF64C649A3EC71F0D9F5479_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.189
Subject: Re: [Qemu-arm] [PATCH RFC v11 0/2] add support for VCPU event states
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
Cc: "zhengxiang \(A\)" <zhengxiang9@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CGDd6wowWaTP

--_000_9239E1F26FF64C649A3EC71F0D9F5479_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi peter,

    Thanks very much for this comments and very sorry for my late response =
due to business trave.

     Yes, the reason that tag the patchset to RFC is that it just  hasn't b=
een tested on 32-bit. if someone else can test it on 32-bit platform, it wi=
ll be great.

    I do not have 32-bit environment, so only tested it on 64-bit.


On 27 September 2018 at 17:55, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Support KVM_GET/SET_VCPU_EVENTS to get/set the SError exception state, an=
d
> support the state migration.
>
> Now the VCPU event only includes the SError exception status, it can be
> extended if needed. When do migration, If source machine has serror pendi=
ng,
> the target machine is also needed to pend this serror regardless of wheth=
er
> target machine can support to set the serror syndrome.
>
> Note: Because I do not have arm32 environment, I only this patch in the K=
VM64,
> not test it in the KVM32. So I need someone else test it in the 32 bit KV=
M platform.
> Thanks.

Hi; could you clarify why this patchset is tagged RFC, please?
Is it just that it hasn't been tested on 32-bit ?

thanks
-- PMM

--_000_9239E1F26FF64C649A3EC71F0D9F5479_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</mata><style type=3D"text/css">=0A=
* {box-sizing:border-box;}=0A=
body {font-family: Calibri;}=0A=
</style>
</head>
<body>
<div>Hi peter,<br>
<br>
&nbsp;&nbsp;&nbsp; Thanks very much for this comments and very sorry for my=
 late response due to business trave.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; Yes, the reason that tag the patchset to RFC is th=
at it just&nbsp; hasn't been tested on 32-bit. if someone else can test it =
on 32-bit platform, it will be great.<br>
&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; I do not have 32-bit environment, so only tested it on 6=
4-bit.</div>
<div></div>
<div name=3D"AnyOffice-Background-Image" style=3D"border-top:1px solid #B5C=
4DF;padding:8px; background-image:url(data:image/png;base64,iVBORw0KGgoAAAA=
NSUhEUgAAAAEAAABBCAYAAAAQTc7lAAAACXBIWXMAAAsTAAALEwEAmpwYAAAABGdBTUEAALGOfP=
tRkwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2&#43;SX8VGAAAAN0lEQ=
VR42mJ48u7PfyYGBoZ/cOIvKgsb8QeVhZ/4jYX7GwsXpxh&#43;gghTcLoFJ4HmS2wEUlgBBgAj=
PkNRQlGPfAAAAABJRU5ErkJggg=3D=3D); background-repeat: repeat-x;">
<div style=3D"word-break:break-all;"><br>
</div>
<div><br>
</div>
</div>
<div><!DOCTYPE html><div&nbsp;name=3D"mail_hist_content"&nbsp;style=3D"word=
-wrap:break-word;">On&nbsp;27&nbsp;September&nbsp;2018&nbsp;at&nbsp;17:55,&=
nbsp;Dongjiu&nbsp;Geng&nbsp;&lt;gengdongjiu@huawei.com&gt;&nbsp;wrote:<br>
&gt;&nbsp;Support&nbsp;KVM_GET/SET_VCPU_EVENTS&nbsp;to&nbsp;get/set&nbsp;th=
e&nbsp;SError&nbsp;exception&nbsp;state,&nbsp;and<br>
&gt;&nbsp;support&nbsp;the&nbsp;state&nbsp;migration.<br>
&gt;<br>
&gt;&nbsp;Now&nbsp;the&nbsp;VCPU&nbsp;event&nbsp;only&nbsp;includes&nbsp;th=
e&nbsp;SError&nbsp;exception&nbsp;status,&nbsp;it&nbsp;can&nbsp;be<br>
&gt;&nbsp;extended&nbsp;if&nbsp;needed.&nbsp;When&nbsp;do&nbsp;migration,&n=
bsp;If&nbsp;source&nbsp;machine&nbsp;has&nbsp;serror&nbsp;pending,<br>
&gt;&nbsp;the&nbsp;target&nbsp;machine&nbsp;is&nbsp;also&nbsp;needed&nbsp;t=
o&nbsp;pend&nbsp;this&nbsp;serror&nbsp;regardless&nbsp;of&nbsp;whether<br>
&gt;&nbsp;target&nbsp;machine&nbsp;can&nbsp;support&nbsp;to&nbsp;set&nbsp;t=
he&nbsp;serror&nbsp;syndrome.<br>
&gt;<br>
&gt;&nbsp;Note:&nbsp;Because&nbsp;I&nbsp;do&nbsp;not&nbsp;have&nbsp;arm32&n=
bsp;environment,&nbsp;I&nbsp;only&nbsp;this&nbsp;patch&nbsp;in&nbsp;the&nbs=
p;KVM64,<br>
&gt;&nbsp;not&nbsp;test&nbsp;it&nbsp;in&nbsp;the&nbsp;KVM32.&nbsp;So&nbsp;I=
&nbsp;need&nbsp;someone&nbsp;else&nbsp;test&nbsp;it&nbsp;in&nbsp;the&nbsp;3=
2&nbsp;bit&nbsp;KVM&nbsp;platform.<br>
&gt;&nbsp;Thanks.<br>
<br>
Hi;&nbsp;could&nbsp;you&nbsp;clarify&nbsp;why&nbsp;this&nbsp;patchset&nbsp;=
is&nbsp;tagged&nbsp;RFC,&nbsp;please?<br>
Is&nbsp;it&nbsp;just&nbsp;that&nbsp;it&nbsp;hasn't&nbsp;been&nbsp;tested&nb=
sp;on&nbsp;32-bit&nbsp;?<br>
<br>
thanks<br>
--&nbsp;PMM<br>
</div>
<div></div>
</body>
</html>

--_000_9239E1F26FF64C649A3EC71F0D9F5479_--

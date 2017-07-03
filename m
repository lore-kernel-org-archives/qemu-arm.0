Received: by 10.25.227.6 with SMTP id a6csp1807652lfh;
        Sun, 2 Jul 2017 21:50:14 -0700 (PDT)
X-Received: by 10.55.92.130 with SMTP id q124mr41212717qkb.205.1499057414768;
        Sun, 02 Jul 2017 21:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499057414; cv=none;
        d=google.com; s=arc-20160816;
        b=GR1oG+q353GFXQ9guZfmDY8OT1VbeNNZ+h6r+DLI+Ueyt60s+OhM8mbCM4qKXsrDP0
         mheE//zv5Qcg3rD4Of6EiAqa0pl+s9EJ/jX03d4hWqlg76ITSL2civ7nQFbVig/kRhNu
         +0zKq5zx9HZS5pkx4Mn/mzoFzuCCPPgP0U/Y+02O2Pxyc/zvlDLobRa5G7mCwbAeDb4v
         b6cdQLTWXRwR6OcSkah/c/tTESTqZGjRy7oplXAt9C6430FEgzalW1CQBjywKH44CKjY
         +4j+RabTTqADfXAsKesaGXYG1rzZMBf0p4Ryh3guPyCJR2QrpyIGilxjNmAHdYBYkfPR
         PD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9EPZfAthUQ3E15wGyyprH8EFf+lw9ePoWoOHRlqplH0=;
        b=YYV5boVkdDB1chT9Rl5sFFBEVn/5WLE2b0FKqSrCOGYkO0G0dvH7Zda+jSN3BO3aTh
         VD7jgPNsjzEHoh0pWqNgz4Vsp3rt4FiYk7MOCsBD+lHiTMIQnDzpL/Az3gIsYku/wQiY
         YgMvVH3ctcxxqXjyF0Xtu56IeiC3+ZgMSuzbAyWAjUPJNpdjRb8/j5RLySIGJzIO0hsh
         6WELuCym+zzK3jY+KL7HcPx9fTAp7EnIkAI3JoqNLYNqGcQZFer0kLmVU92bKET85WaC
         ns6yrEUiJsrHQXchqxmhV7Zt7uRnqtx7lv4NIhF5ZY1khFPQsPXSFbw3T7NKNzEzXh9S
         M2zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fs0rOqAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si4442547qkd.101.2017.07.02.21.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 21:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=fs0rOqAY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRtJM-000382-9S
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 00:50:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtG9-0000I9-1J
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 00:46:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtG8-0001iB-69
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 00:46:53 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:36791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dRtG5-0001bU-LV; Mon, 03 Jul 2017 00:46:49 -0400
Received: by mail-yw0-x243.google.com with SMTP id l21so8232973ywb.3;
	Sun, 02 Jul 2017 21:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9EPZfAthUQ3E15wGyyprH8EFf+lw9ePoWoOHRlqplH0=;
	b=fs0rOqAYj3ylX9fKlhGoDSN0/X74k0/ADOtI3CSjc2JE3GtUxQcHs/+FvKNUq+rcEQ
	df/un7kxFgNr8wRJilp6VjSjNDdSlO5KSSS1iv0U7jdxsuULBN27x2Qzi3l5WMlEAjjv
	fA5PlZB4CmcSPmDW/MPpWVgjwuNXrylcMaNj8O5fsKy+6U7Pi9gn05J4Ixy4PoQ+a6I/
	+LXcnQDe2ZnuhDJzDTftVLV7wMP5odcXcLBniTSbQRu8peg48AfDtoPCuT47EjigqZw1
	8iCptG4Bqsl3OUUXuK0wcBgyNK4/YhpHoyOJvI/h+3sBwN32nYQwnoboLohFcLnRbmnG
	RFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9EPZfAthUQ3E15wGyyprH8EFf+lw9ePoWoOHRlqplH0=;
	b=nSuv5JY7k3/WKHCVOlxDfM5olnloogRM1uBVSj95ySolM0GF7AHvkqFhkOUlmsitdm
	u2keED1BUSQDeqtS55vu7a7vUaqt+Hk/FezPasRRyRzvNxdCcaUbEcZGLggR7hjCMa+e
	4KkV1JPjw/GpsV/8q59ifct/NrxRHMjGh31zbWc3nr+V+Ze4ziStvPG0bJbdlCWQw6Q9
	hrPqreiaiIPwXM6iV6grZMNmrHroTXadC2OKUonleH8NSWGCB0zoH/EzHoaMsRQ8T2VM
	oLeRPYpSznqqdp197A/gFBU1PP8v2qqCGwABUiqXgMRaNG/EoFqwTlUMw18YrjzjOK36
	8oiw==
X-Gm-Message-State: AKS2vOzzB2oV61v/Z4vHMA9Mj7VJWWuXzAwSC8jQt1U38n0ZIKi2fPs1
	AgY/BnUAceJZLlX3Q1VRs/Ia+dQmWA==
X-Received: by 10.129.90.131 with SMTP id o125mr10949495ywb.61.1499057208991; 
	Sun, 02 Jul 2017 21:46:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.233.5 with HTTP; Sun, 2 Jul 2017 21:46:48 -0700 (PDT)
In-Reply-To: <CAFEAcA8zxjMJN0Uv4L+vM5S8yw93GDbAh9xQxmrOESAxeAS_Rg@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
	<CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
	<648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
	<CALHRZuoihb2Oiu9adm=2gPUf-LFdkBR9qw1iV+ohL6kp0t5d=A@mail.gmail.com>
	<CALHRZuoFU6vmnEBobVEqesApB6qm6cmNQfm9oVMG2RaooNEh7Q@mail.gmail.com>
	<CALHRZuosbYEcBYgjRu+45RZD6e7VWL5hQErAB7rJNEQ7ZdPguA@mail.gmail.com>
	<CAFEAcA8zxjMJN0Uv4L+vM5S8yw93GDbAh9xQxmrOESAxeAS_Rg@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 3 Jul 2017 10:16:48 +0530
Message-ID: <CALHRZur+Kg8fsUG6Ct=4SUgaAZ+ge3Zf-R9gn=Y1G29eQ1FHFQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a11491bbc70a6b005536274b1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::243
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 0/5] Add support for
 Smartfusion2 SoC
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q0I5byHDuLvW

--001a11491bbc70a6b005536274b1
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Mon, Jul 3, 2017 at 2:30 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 2 July 2017 at 18:39, sundeep subbaraya <sundeep.lkml@gmail.com> wrote:
> > I figured out that systick uses cpu clock as clock source and
> > system_clock_scale
> > need to be set in msf2-soc.c. There is a bug in u-boot where it uses cpu
> > clock as
> > systick input but configures systick in external clock mode. I have
> tested
> > the modified
> > u-boot on real hardware too and it works fine. I am calculating
> > system_clock_scale
> > as below:
> > If CPU clock is X MHz then system_clock_scale = (1 / X) * 1000
> >
> > Tested with different frequencies and they are yielding same results.
>
> If you calculate it like that you'll probably get rounding
> errors. Better is
>   system_clock_scale = NANOSECONDS_PER_SECOND / freq_in_hz;
>
> (Our systick implementation hardwires the external clock
> frequency at 1MHz, but this is not really correct, it
> depends on the SoC.)
>

Ok. Modified as per your comment.

Thanks,
Sundeep

>
> thanks
> -- PMM
>

--001a11491bbc70a6b005536274b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Mon, Jul 3, 2017 at 2:30 AM, Peter Maydell <span dir=3D"ltr=
">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On 2 July 2017 at 18:39, sundeep subbaraya &lt;<a href=3D"m=
ailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt; wrote:<br>
&gt; I figured out that systick uses cpu clock as clock source and<br>
&gt; system_clock_scale<br>
&gt; need to be set in msf2-soc.c. There is a bug in u-boot where it uses c=
pu<br>
&gt; clock as<br>
&gt; systick input but configures systick in external clock mode. I have te=
sted<br>
&gt; the modified<br>
&gt; u-boot on real hardware too and it works fine. I am calculating<br>
&gt; system_clock_scale<br>
&gt; as below:<br>
&gt; If CPU clock is X MHz then system_clock_scale =3D (1 / X) * 1000<br>
&gt;<br>
&gt; Tested with different frequencies and they are yielding same results.<=
br>
<br>
</span>If you calculate it like that you&#39;ll probably get rounding<br>
errors. Better is<br>
=C2=A0 system_clock_scale =3D NANOSECONDS_PER_SECOND / freq_in_hz;<br>
<br>
(Our systick implementation hardwires the external clock<br>
frequency at 1MHz, but this is not really correct, it<br>
depends on the SoC.)<br></blockquote><div><br></div><div>Ok. Modified as pe=
r your comment.<br><br></div><div>Thanks,<br></div><div>Sundeep<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--001a11491bbc70a6b005536274b1--

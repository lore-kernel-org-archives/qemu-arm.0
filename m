Received: by 10.25.190.12 with SMTP id o12csp295047lff;
        Thu, 19 Jan 2017 05:02:31 -0800 (PST)
X-Received: by 10.200.57.27 with SMTP id s27mr7048130qtb.230.1484830951536;
        Thu, 19 Jan 2017 05:02:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h39si2563546qtc.171.2017.01.19.05.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jan 2017 05:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUCMG-0004nh-Nt
	for alex.bennee@linaro.org; Thu, 19 Jan 2017 08:02:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cUCM5-0004h9-Es
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 08:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cUCM4-0003Hk-Lz
	for qemu-arm@nongnu.org; Thu, 19 Jan 2017 08:02:17 -0500
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:36752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cUCM4-0003Ee-Io; Thu, 19 Jan 2017 08:02:16 -0500
Received: by mail-yb0-x242.google.com with SMTP id l23so2178771ybj.3;
	Thu, 19 Jan 2017 05:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=97IWTvAVbE7EujscncD/T+u/NR5e4cDvpXJnDHgTS70=;
	b=mFPywFWZAwrCJjm7lkFHV7AMNstUZqvDIycdQ4CXMePhuLJ42/0uMhEo8IDWNeDLEn
	UU9bPgE6q6iWZ7atoIpaQdcStsJJE/RpwuUZBMCnry1KSh89wBog0ImGdwPM2fbR5L/l
	qimpwunkYI5ho9Ho/LqUAuMgbhVij5+/HJoTdT8MIjB49VTVPZOMf69KNGh+koqRcgeg
	PFPMDAeHuGa5oXX5YcFhho/g6O0wPR+1bD4hBoxunoq9uP4vQXzi0XdiTGybYmmD0xKA
	aw10F9g8NGyy7Ya5FEFsh//o5p/D/PiRCCtZ9qhvzFXp+7YewMX62NGTR3Qt48E+Ejbr
	ZVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=97IWTvAVbE7EujscncD/T+u/NR5e4cDvpXJnDHgTS70=;
	b=rJp3u5CyAV/NgIEub3TLNdOPTPBc+9jL1nL/BdfHbQ65XLCowOE/QkZW+kkVBu2LyZ
	5LutHJ4gXA40jnq76EgNDR/zUX3c7+/cE/2XFYPyf4xQjLRB1czJPShB3VlSIjEXDC//
	zavR9EAtV3OSXDU0BFPryn2OBVSY6RkfyoHEQZSXMkuBeDDssUPa84Ubz0NotIgp95ie
	Encz2hnkNwyslTZ6nlkJyLZuPqA+n+sIYc+cOK4q076kLgQrA2IzOZSaMMBkX5C6irxp
	EpE7s26S7to99amA7lHvbA649jw4Rgv5AwreAhp3TRN1YOmm2crBttSlFu0iDHASR8Z+
	E18A==
X-Gm-Message-State: AIkVDXKXCzJUwCDt6Oih/ojRKmv2d5WXE8Lqn5AuYF8WQAE3B5QliTtaLwQejObLJFdumTEluioDWfSbpw7cEw==
X-Received: by 10.37.104.193 with SMTP id d184mr6477176ybc.148.1484830934476; 
	Thu, 19 Jan 2017 05:02:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.32.198 with HTTP; Thu, 19 Jan 2017 05:02:13 -0800 (PST)
Received: by 10.129.32.198 with HTTP; Thu, 19 Jan 2017 05:02:13 -0800 (PST)
In-Reply-To: <CAFEAcA_vpCFVGF6M27E8DK-phs2EvXKXr3k+h5ZXmERayL8jhg@mail.gmail.com>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
	<CAJy5ezpYPaEdWG_4JQaQTL56EZYDT-TCYLaFtrKzpZUcu9DKHg@mail.gmail.com>
	<CAFEAcA_vpCFVGF6M27E8DK-phs2EvXKXr3k+h5ZXmERayL8jhg@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 19 Jan 2017 14:02:13 +0100
Message-ID: <CAJy5ezrSHXMoiP5M3nBjP0BPqCwk898JR3zc955O91S4B+nW3w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=f403045c03b266ab3705467224f8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
Subject: Re: [Qemu-arm] [PATCH v2 00/18] arm: Add virtualization to GICv3,
 and enable EL2 on 64-bit CPUs
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xy1yo1eJ/YKu

--f403045c03b266ab3705467224f8
Content-Type: text/plain; charset=UTF-8

Nah, if I find something we can always fix it with follow up patches...

Cheers,
Edgar

On Jan 19, 2017 1:59 PM, "Peter Maydell" <peter.maydell@linaro.org> wrote:

> On 18 January 2017 at 09:17, Edgar E. Iglesias <edgar.iglesias@gmail.com>
> wrote:
> > Hi Peter,  I'm on holidays and won't have time to review for a couple of
> > weeks at least...
>
> Do you want me to hold off on committing the GICv3 patches
> until you get back and have had a chance to review?
>
> thanks
> -- PMM
>

--f403045c03b266ab3705467224f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Nah, if I find something we can always fix it with follow=
 up patches...<div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><d=
iv dir=3D"auto">Edgar</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Jan 19, 2017 1:59 PM, &quot;Peter Maydell&quot; &lt;<a =
href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; w=
rote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 18 January =
2017 at 09:17, Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gmail=
.com">edgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt; Hi Peter,=C2=A0 I&#39;m on holidays and won&#39;t have time to review =
for a couple of<br>
&gt; weeks at least...<br>
<br>
Do you want me to hold off on committing the GICv3 patches<br>
until you get back and have had a chance to review?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--f403045c03b266ab3705467224f8--

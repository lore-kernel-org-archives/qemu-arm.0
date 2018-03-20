Received: by 10.28.91.67 with SMTP id p64csp3208069wmb;
        Mon, 19 Mar 2018 17:18:27 -0700 (PDT)
X-Google-Smtp-Source: AG47ELup1m2kVM4i76vf6uhDX4a9Q9wfFJFZSFKCo+mSHH3qTurnNMP+/DEDAPwR9Iz90ui8xCgX
X-Received: by 10.55.196.1 with SMTP id d1mr20720108qki.247.1521505107355;
        Mon, 19 Mar 2018 17:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521505107; cv=none;
        d=google.com; s=arc-20160816;
        b=kv8pUF6gYpB+yw/d4reIDlqI94ECilCUvAqAqOYc2D79jktHMnbta0smzu2UGnPySM
         UGyszrJ9U1l7d0vY39GAxxaB+YPx79JqBEehSCZ98zuUt/JhDMslBD7xun75airlgM0+
         UN9xXQicFohgS2ilqsM/hxIGafYp0NJloy2R2dH1vQDlQp+5Pj7OSjETGd+S6uPydjxh
         kuq4nQf/ev0NZ6AzvfmpzXfy6CsBWlDFkDuZIvndelykScx4McKGwUjr1Aphw9fbxXPB
         9ba/PU7rhrEZUpRhJtdQtgFD3IT8TScb+AFEkg4aenhDLjNqBiDhnpQFxUgZVKz5LMfw
         sV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NIbEN3vK4hTjESnl30kOR+Q4WpHaWBR3i0dWlfjMRQs=;
        b=UlxdcKHkGrz3u1a7t3xva8V/AXtCUqvpdBt5kw6NOdJvilKEks3D2Q0emmg4vEmF2O
         RXylHJnlFi/MXnE0jTZSCL/eXYTrf9CbyCZCa5wLxVZ1dnqjK0oWQkdwBMjDVgrx/r3q
         jhY8MfAIcR/pTe0Aa+e+AOiAAeEq2qec2raRWwAOq27cz6Bk3Oe2LhWkreuoLdOkTnei
         bnQ1Do26qXJTQIrVvAk+1hGs9OgNhRGQBcDiBtfo27vPFJhzL3XoaNNeU1VKkRErtL5w
         MUGv7mNtRLw4bfuqI9peOoUXiCnnHb4p2nP/n/JLp7i7bCEfl0Bg8DOUgrS8W4siTBBf
         AaLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iDnkDOSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n29si516886qtl.369.2018.03.19.17.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 17:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iDnkDOSQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey4yw-0001j8-Qf
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 20:18:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ey4yn-0001ij-IY
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 20:18:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ey4ym-0007ov-AR
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 20:18:17 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ey4ym-0007o3-05; Mon, 19 Mar 2018 20:18:16 -0400
Received: by mail-lf0-x244.google.com with SMTP id y19-v6so28131869lfd.4;
	Mon, 19 Mar 2018 17:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NIbEN3vK4hTjESnl30kOR+Q4WpHaWBR3i0dWlfjMRQs=;
	b=iDnkDOSQoV2k3T0iV3SAGJPEcfMktlwMhUGhqynCYwl87OtZaDrkIJFAWk5b56oGgN
	aljMcMcEojLLEWpILYypvukJMjfUREGw98B50+dSXqKBkN+NLw2xeWlgZDpzvxccC+x4
	4l+ShQ2NhS9ITs/aYQVBdTEFAS1D8pL83YZ4j3POaM7KMFf801zONSQ1f2gfytOt392B
	IzeopI07RA1Z4BJPHSzrtmKa/ygMfg7lUvr+57nI6xEJJXsiHs+tE2gE3q4VTJ7segRU
	0aIyTmxWrQPRg6DgPX2Frbpa74qsDJXK/qz86zokl6IJWtlb6SLx0uMjIHiRU0mSe+d1
	14EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NIbEN3vK4hTjESnl30kOR+Q4WpHaWBR3i0dWlfjMRQs=;
	b=GcnX7aPDEsp3d1RJl7fSo2mIPpeHs7olWz7sSt35cKHGNLF4fv4+l7drm40rCadlL1
	9A9YZobg1xQPHHwLLmbwMbK0t8U7OvnEbTjkz0qzfzav7yC9CbGbIfYc0CLsAZj89mRb
	yShCx7NjQpywH4sBBSTFXt4emMxSJTCtOFQG+zqvKorO4JnuLD55tzgtm8om3hVLLCfX
	RIujlyve4NFGczMZkiHw9nfIH9wIAyHKWuAM/VTBTjFO3TIBkiOM07p8dPJScGab8W5b
	okJb43Vbf4w5UhhGfbxlXVBaMKOzRQD+3Yj3uo3ssN2VSovGj4HJBd2f3tlWnvl9JqZu
	eDKg==
X-Gm-Message-State: AElRT7HzFZ3oFa1GBfk5EpD0KlZqfcpqRumXx0EOzNcoLomHsFh07Xzi
	7Bp7QRMCQ0+1RsKGSj/O7Uhy29f/SzBJtfk7ihw=
X-Received: by 10.46.15.26 with SMTP id 26mr9833818ljp.147.1521505094212; Mon,
	19 Mar 2018 17:18:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.154.88 with HTTP; Mon, 19 Mar 2018 17:17:43 -0700 (PDT)
In-Reply-To: <20180319110215.16755-1-peter.maydell@linaro.org>
References: <20180319110215.16755-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Mar 2018 10:17:43 +1000
Message-ID: <CAKmqyKOO8AJooAj4V8zyuAOA-w76kFoMLee4Q6_knCTwtCCpEQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/arm/bcm2836: Use
 the Cortex-A7 instead of Cortex-A15
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
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOWkT41l7yXD

n Mon, Mar 19, 2018 at 9:02 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The BCM2836 uses a Cortex-A7, not a Cortex-A15. Update the device to
> use the correct CPU.
> https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
>
> When the BCM2836 was introduced (bad5623690b) the Cortex-A7 was not
> available, so the very similar Cortex-A15 was used. Since dcf578ed8ce
> we can model the correct core.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
> This was originally done by a patch from Alistair:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg00311.html
>
> The refactor of bcm2836 means the code is different, but I'm using
> the same commit message.
>
> Based-on: <20180313153458.26822-1-peter.maydell@linaro.org>
>
> ---
>  hw/arm/bcm2836.c | 2 +-
>  hw/arm/raspi.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 25e74b67d9..8c1e707d9c 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -32,7 +32,7 @@ struct BCM283XInfo {
>  static const BCM283XInfo bcm283x_socs[] = {
>      {
>          .name = TYPE_BCM2836,
> -        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a7"),
>          .clusterid = 0xf,
>      },
>      {
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 06f1e08ca9..955a7c4e80 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -226,7 +226,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> --
> 2.16.2
>
>

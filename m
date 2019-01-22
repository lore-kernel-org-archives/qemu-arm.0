Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7026965wrt;
        Tue, 22 Jan 2019 01:54:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5zknGsowG4jOngod7XE5z71htoQOYurMDRKBOK9xOohvFdIRPjR3/ND587m3ToC7+Kiz2x
X-Received: by 2002:adf:f449:: with SMTP id f9mr32591113wrp.40.1548150877837;
        Tue, 22 Jan 2019 01:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548150877; cv=none;
        d=google.com; s=arc-20160816;
        b=PQYzeX+7cTb+vigTE12FPZB6oVvzD4GzdiLx9E3rFPZ0ojOdLyOAztrZ1wlAlFCdfn
         nrJoayLrVxEbNgVjvPOeMpZy9UDbyjDflNuGntytXZcHmx0BJnNUnY67sItZg4bUd8u8
         GvBREv80KuTutxg0LrJRgs3GUfNtPPKAtAGk2JGRFtC9o5yrTIWhEV2U3lPzITTwvbvb
         /cB51n6pQCJAvSp53CqcexfAyfW7udqqKi7DHjUQftrF+31K9rbvWIiN/k9BO/7OwDkj
         u9jMuFhvCQVdwF/xPH0ZVj6+YULMG/GKBC4EydrB6QUsvX7eLXDhSLu8LkQswMbTwWhh
         kjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=plS6RYjuR4ETWUUyhWCrOUITpkCBmz1voGmAiCh3ojI=;
        b=NORMszD2Ba3mbmgoCr0YmWZHakK9gUlf+vfBb66qtSTmLS44ozVGwp4NnkEg3NKYkO
         dKpliahpsQMsRyFz6IO4kLGTi1Qa+eFAdWgNH2WpDqnihFQrk2j7otHMcaAefABfPIc5
         +fTl9f4qCpeAB0JZEuKG3nAH7cx9vTCm6FyECDGNR9vSFI7WO3WK7xuz5AHaaUfCk2oY
         gp2pa/UENbWq+654rJHFzuSGGqLPfc6ve21V/evYByXDJFSBIJI3eJmgzSiGWgOGgOWw
         eOYePCH/3qzx+Xzlq4sw03wyElCRGErERUohIcjz10xAY+1wljU+Omte82x4KQdSw2zN
         LHjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arOIFf+9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si64336022wru.170.2019.01.22.01.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Jan 2019 01:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arOIFf+9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:41797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glslQ-0002LW-TD
	for alex.bennee@linaro.org; Tue, 22 Jan 2019 04:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glsVu-0006AI-Kx
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:38:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glsMn-0004Cd-Vh
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:29:10 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glsMn-0004Bz-QH
	for qemu-devel@nongnu.org; Tue, 22 Jan 2019 04:29:09 -0500
Received: by mail-oi1-x244.google.com with SMTP id y23so16840065oia.4
	for <qemu-devel@nongnu.org>; Tue, 22 Jan 2019 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=plS6RYjuR4ETWUUyhWCrOUITpkCBmz1voGmAiCh3ojI=;
	b=arOIFf+9z2j/5eYi+D4wGRJTOUYoL7yzZ+0MWfC6VlHplLEycoGhmYaPGgzbIkqCHO
	bJPE4D26tZaSADvNfLMc9mjhSwVcy8ZblbQDxtrZQU1TzfpaDSAg8sYMxKsGQkcz9khi
	vTpDyT/zIoU7MAp2eqlQVOc9n+H87FekpAOQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=plS6RYjuR4ETWUUyhWCrOUITpkCBmz1voGmAiCh3ojI=;
	b=WxPxk4+GEcwGCIJ8SuwXKm2POGN9PLAvbnkavNqzTVGedu0n3B6lM2FWZ5BWPMXIF0
	bgl5ujhxIFokHh4IC+tlJhKBz/McUV7vN7Kwr4KyU90rOZIrLKy5rA3BjLZr+csp6Elj
	IOUD8yKIffQ1PXeocKlEo5CESe5wPsX5HEEaVwis9jiUFKVN9jOMz9T8lV3UFHl8Kw9g
	dtABPFjRikDP4hEaYfo8IUtxBRQGwrclyxM0mB3AkmbVF+/iyZFjbsdT8CdC7KsRyHFv
	LgWCKYARfGpE0rmwkWOvrOeZvzbGWa4yRrc9UAwjckc3HemqwU3+ipqpG9du3SSNwYUZ
	bM8A==
X-Gm-Message-State: AJcUukcNo0bN7jMsD90GNgSttjTAdKR/eiVGNebuColbHE7VhPub6AEn
	d+OlKavrdpI18HV/lvDZFMN8yHZ/9fGncXrKeSijTw==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr8146449oic.332.1548149348057; 
	Tue, 22 Jan 2019 01:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20190121184314.14311-1-peter.maydell@linaro.org>
	<383fd07d-9c2a-a7b2-5b88-f9a411c8b91a@redhat.com>
In-Reply-To: <383fd07d-9c2a-a7b2-5b88-f9a411c8b91a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jan 2019 09:28:56 +0000
Message-ID: <CAFEAcA9G7CuZ3wSO9YLs-OH4m1zQ7s73yWp8rwsDBSyUZokyGg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH] xlnx-zynqmp: Don't create rpu-cluster if
 there are no RPUs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FxEZElQGOCBq

On Mon, 21 Jan 2019 at 20:12, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 1/21/19 7:43 PM, Peter Maydell wrote:
> > If we aren't going to create any RPUs, then don't create the
> > rpu-cluster unit. This allows us to add an assertion to the
> > cluster object that it contains at least one CPU, which helps
> > to avoid bugs in creating clusters and putting CPUs in them.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This is a preparatory patch that is necessary for the series
> > "[PATCH v3 0/4] tcg: support heterogenous CPU clusters"
> > (20190121152218.9592-1-peter.maydell@linaro.org)
> > in order to avoid the xlnx-zcu102 board asserting if started with
> > fewer than 5 CPUs.
> >
> >  hw/arm/xlnx-zynqmp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 370b0e44a38..16cba433cb7 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -178,6 +178,11 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState=
 *s, const char *boot_cpu,
> >      int i;
> >      int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYN=
QMP_NUM_RPU_CPUS);
>
> Not related to this patch, but this check seems dangerous, i.e. using
> "-smp 2" we get num_rpus=3D-2 which luckyly doesn't enter the for() loop.
>
> >
> > +    if (num_rpus =3D=3D 0) {
>
> With the current codebase, you'd have to check for "num_rpus <=3D 0", ...

Oops, nice catch.

> What about this instead?
>
> -- >8 --
> @@ -451,10 +451,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev,
> Error **errp)
>                      "RPUs just use -smp 6.");
>      }
>
> -    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> +    if (smp_cpus > XLNX_ZYNQMP_NUM_APU_CPUS) {
> +        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>      }

Yeah, that would work too. I think I would just go for
using "if (num_rpus <=3D 0)" in the function, though.

thanks
-- PMM

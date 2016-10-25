Received: by 10.80.166.35 with SMTP id d32csp3153008edc;
        Tue, 25 Oct 2016 05:12:56 -0700 (PDT)
X-Received: by 10.200.46.43 with SMTP id r40mr19921572qta.145.1477397576010;
        Tue, 25 Oct 2016 05:12:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w50si13346524qtc.38.2016.10.25.05.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 05:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz0b5-0005WM-Ce
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 08:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz0aw-0005V0-HR
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 08:12:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz0as-0002QX-G4
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 08:12:42 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:34688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz0as-0002QP-CM
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 08:12:38 -0400
Received: by mail-ua0-x231.google.com with SMTP id m26so56827978uaa.1
	for <qemu-arm@nongnu.org>; Tue, 25 Oct 2016 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LQDvWlqaJc4iF7TW8hltx0JvPJpX6r4nSl6Wr6d2coQ=;
	b=cs6S4SJeV/t7NkaFBZ87b1hQFALbZdM7+xb9Q2TerxcLUW+mGp14q3YS84xv60r551
	OYwLG8cxg3hc3WXsnyPZDCYpy0BVDFJFy4x4C1WsXnKNmNPCjY2ESPn8Y+YfzPda98P7
	wG5k8QuXKUdmlGheeIGdGHIqqWXdPX0zIwPGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LQDvWlqaJc4iF7TW8hltx0JvPJpX6r4nSl6Wr6d2coQ=;
	b=CyBq8mZTSrsnfk1UPfko+BJ1D0Dutjg4qOA2ReNQJYDQFW7WkNkFAP8BWOje3G1qUB
	n4BXxvPxpAqz2CdBazIvddQ+C/LbG5g67MhiI2E5tlPqtId6k4rCpEMtZLfV62lmKWvJ
	UOO6Nk4XLCEKcLa3GhvVqDQCdubwEYfv/CsHHB+ibnG3CwNonpTadB37kZv0ar3Xrane
	FZVq6xAQ45zeh7Dtr/so0Dda5WdNoqEf6I+3kM4lX2Ka6prcgyE23JOfhKTRkWZup8L2
	XGwSPXBp0xTKHXCu7OMmm6jsJVCvy/5TosJ9Ggn0f+0ahXsYhoZq0vlmGFikI32fToUh
	shfw==
X-Gm-Message-State: ABUngvfpml+VQfkVxP6sS//BaXg+W45iOb4gXSiqUTvOfRwTmCpFRizlyeu1Zuz5ThGrONYzoAi6WcS2LQ/DvERz
X-Received: by 10.176.3.237 with SMTP id 100mr2763577uau.120.1477397557735;
	Tue, 25 Oct 2016 05:12:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 05:12:17 -0700 (PDT)
In-Reply-To: <20161025093711.17407-1-jcd@tribudubois.net>
References: <20161025093711.17407-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 13:12:17 +0100
Message-ID: <CAFEAcA-j5gisXFovTbLiBQTL4wKd0KRD1HjcZCdSorpWj7aEtA@mail.gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [PATCH] Versatile memory should not exceed 256MB.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SySxneR+Gy7W

On 25 October 2016 at 10:37, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
> For now Qemu accpet a memory size greater than 256 MB but it would
> crash afterward.
>
> Versatile devices are starting at 256 MB bondary.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>  hw/arm/versatilepb.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index 8ae5392..7f11651 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -198,6 +198,14 @@ static void versatile_init(MachineState *machine, int board_id)
>      int done_smc = 0;
>      DriveInfo *dinfo;
>
> +    if (machine->ram_size > 0x10000000) {
> +        /* devices are starting at address 0x10000000,
> +         * Memory cannot overlap with devices.
> +         */
> +        fprintf(stderr, "Memory size cannot exceed 256MB\n");
> +        exit(1);
> +    }
> +
>      if (!machine->cpu_model) {
>          machine->cpu_model = "arm926";
>      }
> --

Ah, this is a long-standing bug. (I think I first tried to fix it
five years or so back but that ran aground on people not liking a
general approach where the MachineState indicated the maximum
limit for the board.) In any case we seem to have ended up with
each board model doing by-hand checks on the RAM size, so this
is better than doing nothing.

I've applied this to target-arm.next, but I've switched it to
use error_report() rather than fprintf(). I also took the liberty
of tidying up the commit message and comment text a bit.

thanks
-- PMM

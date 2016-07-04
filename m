Received: by 10.25.21.96 with SMTP id l93csp1624895lfi;
        Mon, 4 Jul 2016 10:28:50 -0700 (PDT)
X-Received: by 10.55.155.22 with SMTP id d22mr12186090qke.103.1467653330173;
        Mon, 04 Jul 2016 10:28:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n67si2664238qka.89.2016.07.04.10.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 10:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK7ft-0004Dy-IQ
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 13:28:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1bK7Gb-0002tO-3J
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 13:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1bK7GY-0004uT-T1
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 13:02:40 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35463)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1bK7GY-0004uO-Nh; Mon, 04 Jul 2016 13:02:38 -0400
Received: by mail-oi0-x244.google.com with SMTP id d132so24020839oig.2;
	Mon, 04 Jul 2016 10:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4YTPD3KGfpvJ6pKWn49CvnL/Y2sDUVinGMH7aW948ig=;
	b=Fv67bdWkKZKuFfkDpjDrYBhogRymLs3AcMmAIW/FHsERDoIjO6ieuFmfdLCnBoa88j
	PknXRio8MHGQCs4rHMDJluJUrmhrxxzl5WYLn5uujW9dMCPppBsQHl+i+ZnwtRzF/SXB
	WQWywnvRZ2QPlCXPohriQTx84mEMiWoqCvuuyX3xLZRKuIktgN2ck1+9pA6Pp9lQHmO9
	XW9UNBh8Y2g28NxCPkgonHejUahDms6JXn87jrH8n0LZ4idnAU7iHC9XJNyo4dI5CDHp
	1iW6WTWmWTkhNa9j1fCTiF6Z3XI6BT6tdw4Nw20Z/deneetHVFxUMYayktxuziPuunHE
	Bb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4YTPD3KGfpvJ6pKWn49CvnL/Y2sDUVinGMH7aW948ig=;
	b=KhYW52Ju3x2r8PMSlgxvINGqUDKDKwzc9A20wU0vMPioCLpHfgv45tNH0R6GG/gfGI
	w3UCqmz4f+ifxaMalYoVoLEB0pUZn0Yux27OSDW05lIf7LIO710cUO0sCB2Fluug8fy7
	nt6ZsRh0f46vpWA+oMMYQJ5I38kfnCVA4YPDhs5K29iH4WVwpBCAv60XLG5LJPusYaf8
	yKeOdaeMnLqmTNPXkzGPE011F75P8/MYMpeRzhpBCSxr5jsuFMCeWk8EDbe00nCuZdyw
	nNlbwB59Wq5tWu1X3RyRsWaFGQjo7e5CRQHVRZYT689lepz34NbbF7GyIaGhFLES6zuU
	UVRA==
X-Gm-Message-State: ALyK8tK4JSH942B/FjZPhVb7/TnuOv85POH/+M1grLKD9eelOaGJwodwAWpVlWRf0Aa87Vt5vu67M0rlK26EBw==
X-Received: by 10.157.3.239 with SMTP id f102mr2194301otf.144.1467651757954;
	Mon, 04 Jul 2016 10:02:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.161 with HTTP; Mon, 4 Jul 2016 10:02:37 -0700 (PDT)
In-Reply-To: <1467650942-28706-1-git-send-email-peter.maydell@linaro.org>
References: <1467650942-28706-1-git-send-email-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 4 Jul 2016 19:02:37 +0200
Message-ID: <CABoDooNPvMBu8CcCEAaiu1Qiej1ECsXbS7U3p4q2Lj203mfDSw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] target-arm/arm-semi.c: In SYS_HEAPINFO use
 correct type for 'limit'
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dwpiVoHqrT+c

On Mon, Jul 4, 2016 at 6:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> In commit f5666418c4 most of the SYS_HEAPINFO implementation was
> fixed to use target_ulong rather than uint32_t, but the 'limit'
> variable was not changed.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
> This was actually pointed out in code review for the original
> patch, but I accidentally forgot to make the change when I
> applied the patch to the target-arm queue :-(
> ---
>  target-arm/arm-semi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
> index d50726f..7cac873 100644
> --- a/target-arm/arm-semi.c
> +++ b/target-arm/arm-semi.c
> @@ -565,7 +565,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>      case TARGET_SYS_HEAPINFO:
>          {
>              target_ulong retvals[4];
> -            uint32_t limit;
> +            target_ulong limit;
>              int i;
>
>              GET_ARG(0);
> --
> 1.9.1
>

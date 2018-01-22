Received: by 10.28.71.27 with SMTP id u27csp2921627wma;
        Mon, 22 Jan 2018 07:19:46 -0800 (PST)
X-Google-Smtp-Source: AH8x225Jlz6Yk333xEorQPR/uA+FMrhgpJAt2qYitFVx2utmY7hKwefRTJYqreiey3RjaoQgXVy+
X-Received: by 10.129.159.199 with SMTP id w190mr8099948ywg.302.1516634386336;
        Mon, 22 Jan 2018 07:19:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516634386; cv=none;
        d=google.com; s=arc-20160816;
        b=gGCcWHlcSkF+Cb1G6hd69+44QNHiN7XS9AKq8pV8Wsy/D0bvVgRZUXkeTSGbTMQ9ft
         8DYG9r/rh010ueItjvtdrLCdLavPO7srwDnytgD3XZmelJ07MPa0UPZ9jfNj0sWV3FjQ
         SxHO3cNNawjcKEI+CREj8mKE2JtdsFQKpb4L+ej/Q6OulnGCF0Hh8bPapSYTx5kCoggM
         7TSV48/JEn92tAytSeVAb50TShrWt1qGGXZbXxDjR2oju2qnAu4jhoUQvUGrJF+kw079
         lu7E4jvJQoN/r5is+qaCwAmlCqUzBlzDixRPjsCmHxiIBJnXoEKKvgUi1rv53YN0ecv4
         L83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dvaOP/FfoirsgQbidjQg9bd9ZWxBd8OnArRnL/HlYig=;
        b=w/76UMP2soz13LxsvrJwfxiJ9tm12nJou4ZJ8KQW+J7vgXmr08soKxCHW/P04c5Q2e
         Qmv9ODEMqKAlUp5tJxMWpCpQulDMtKPT7RMvPnO1i0qF9oiNnOcE6sYA8JnZ+iI6EPM0
         UhujME+89+HRI2inhCVh3gf07vdRWNCEjLFiNnosNjzm8u5k4RDpcLdtcWYy3Xy1/ZGm
         6gK8590u3KRKu8FVCZkQxdpsNpBxpDSJNxNdi8oqlAhKbVq9qXh745/CsNWwARzV+gBv
         PBYdIMNIL1enKpXKEenbxcKR45dNsnZ4gcZ71xDM/LC8Rrltr3v1V3KHhLdcOaLBDQC5
         A4Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BY3KrhBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si230931ybe.801.2018.01.22.07.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 07:19:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BY3KrhBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eddsv-0004VO-O0
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 10:19:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eddsd-0004Ul-QK
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:19:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eddsc-0005m9-JM
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:19:27 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eddsc-0005kx-9j
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:19:26 -0500
Received: by mail-oi0-x241.google.com with SMTP id k15so3494614oib.1
	for <qemu-arm@nongnu.org>; Mon, 22 Jan 2018 07:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dvaOP/FfoirsgQbidjQg9bd9ZWxBd8OnArRnL/HlYig=;
	b=BY3KrhBi6THeXQrQJpDpEUPcGBsh8RdtZyR9IwWyK5OTBCqYRfbpHUz/3KZ+ulrJ6b
	UOCSSl8Ywczur+oHhcHThWZLy9W5Jvpmdb7qp7o7k5Nhby2GqBoRDsBdKIWHswXmRwW5
	3OWWOfOulhIrrd1pykujHbstV5VCiPDu/Y6SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dvaOP/FfoirsgQbidjQg9bd9ZWxBd8OnArRnL/HlYig=;
	b=RJNBRdigXcHr6xYupZ1Fle0FnC2Zk+A3c+PXSoh8ConBpGVWxiwLWAvNgKXC/T5NBp
	P7Y0cLqpc2AtryP7I7zW/OaYE2MJuSPrEVQXuM1w8LTfcEuFzbtOhOOP6Fpw0kjVB4TR
	ZHk10d2s9XrVFHG0okAxXz36i8qTzDBOAdOul4v9zqUE3CV7C0XOQET/tBcggESrEdWP
	1NL4pAf7Y7ID5pdLJ2TsCT5+r55Af0aieLsefF4af36FHUetvN5Lqw96tnM13Ij7pUCt
	FU6UThGxMGv4AYgVEgDWwPSIWJ/3aKZoSWSVJR4E/yV3UmHB8gGfLP0zSoR9d4YOW28g
	T5GQ==
X-Gm-Message-State: AKwxyteblEji9HcBfRzuh2S2Zh26zHPv6eH0quGVyXbWOUpaWQU0RUJd
	0+UKfqvS1P4JnHVttzLDDNQOw8SsUtv+xOnei4RKkg==
X-Received: by 10.202.173.84 with SMTP id w81mr4083790oie.299.1516634365412;
	Mon, 22 Jan 2018 07:19:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 07:19:05 -0800 (PST)
In-Reply-To: <20180119145756.7629-6-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
	<20180119145756.7629-6-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 15:19:05 +0000
Message-ID: <CAFEAcA8VJAfksRenr_CJauTc2wpfN1fUchixrfGbvjBkeoR-Vg@mail.gmail.com>
To: luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 4/4] hw/intc/arm_gic: Fix the NS view of
 C_BPR when C_CTRL.CBPR is 1
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2jQyXT5gbDYg

On 19 January 2018 at 14:57,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@git.antfield.fr>
>
> When C_CTRL.CBPR is 1, the Non-Secure view of C_BPR is altered:
>   - A Non-Secure read of C_BPR should return the BPR value plus 1,
>   saturated to 7,
>   - A Non-Secure write should be ignored.
>
> Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
> ---
>  hw/intc/arm_gic.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index d0a41a89ae..7418b7a082 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1211,8 +1211,13 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>          break;
>      case 0x08: /* Binary Point */
>          if (s->security_extn && !attrs.secure) {
> -            /* BPR is banked. Non-secure copy stored in ABPR. */
> -            *data = s->abpr[cpu];
> +            if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
> +                /* NS view of BPR when CBPR is 1 */
> +                *data = MIN(s->bpr[cpu] + 1, 7);
> +            } else {
> +                /* BPR is banked. Non-secure copy stored in ABPR. */
> +                *data = s->abpr[cpu];
> +            }
>          } else {
>              *data = s->bpr[cpu];
>          }
> @@ -1285,7 +1290,12 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          break;
>      case 0x08: /* Binary Point */
>          if (s->security_extn && !attrs.secure) {
> -            s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
> +            if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
> +                /* WI when CTLR is 1 */

should be "CBPR", yes?

> +                return MEMTX_OK;
> +            } else {
> +                s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
> +            }
>          } else {
>              s->bpr[cpu] = MAX(value & 0x7, GIC_MIN_BPR);
>          }
> --

thanks
-- PMM

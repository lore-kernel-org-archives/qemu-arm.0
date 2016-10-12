Received: by 10.80.166.35 with SMTP id d32csp502175edc;
        Wed, 12 Oct 2016 05:22:57 -0700 (PDT)
X-Received: by 10.55.170.83 with SMTP id t80mr747686qke.15.1476274977446;
        Wed, 12 Oct 2016 05:22:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si1293990qkd.75.2016.10.12.05.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 05:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buIYi-0006Mf-Ec
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 08:22:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIXW-0005Zc-9l
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIXU-000147-88
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:21:41 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIXT-00013u-Sy
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:21:40 -0400
Received: by mail-vk0-x229.google.com with SMTP id 83so21672354vkd.0
	for <qemu-arm@nongnu.org>; Wed, 12 Oct 2016 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0od9g+efgFNeht/n6yXQDgPmoAC9m+VHQjsLA6SykIw=;
	b=T0vi7Mxo1k9vx5WpDykKKWnc6iWsMy03Go50ANEOtLMsr6KdtoQ/HWchkaD0WAlq/U
	wUd4X/VMM/2HYSi4tAHLdHwJjjSfACeMUxOlvJo3sWaa6ldvKoZ/vU8I0ZGSKAgD8voA
	G+pfsdrikofsdfpS7VOXcyDXr5BcsW91UPrNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0od9g+efgFNeht/n6yXQDgPmoAC9m+VHQjsLA6SykIw=;
	b=WWGYSiWQzJWaxMrXF0Rnsr+Giyeh2ChMWcr0P2WZsZP3z4qwVSL4Jrqi2mQmvTsyCV
	dg1QtWrt4Glp2PvYtrU3v/urs+1xkAtsoblfn1mEboFv67JzjrjaVSgv5S6xvD32DPL9
	QS3dr890j5YnUwBLZOGcBaREpiWncAw/q00zmSdclHyLGOXAYpKhYtGe3oIvG78dpzf3
	A9UhFbjkS3gpAvPtj0IXwQADy/TWDzitwYdRb0P7xedNJGkNVFzfUSbw99IsnxvmmTK2
	DbWZtYx5M5H8T/XQhjqigwQ5Nr6J3WzF7diD4+jITQ08Rho1eIolO4PKeMLawGAbup9C
	/+5w==
X-Gm-Message-State: AA6/9RnZWygwEdLnGkvBVZJRWlxkrXMDWwyRaIP97vjm4yHP/ticGngTvN3NjWl1WuGLlDaCZQNMlyAnNdhdbRkR
X-Received: by 10.31.165.74 with SMTP id o71mr361692vke.95.1476274899267; Wed,
	12 Oct 2016 05:21:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 05:21:18 -0700 (PDT)
In-Reply-To: <1476274451-26567-1-git-send-email-thuth@redhat.com>
References: <1476274451-26567-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 13:21:18 +0100
Message-ID: <CAFEAcA-mDapA6cjdA2A=RwzsNTatO56yM2xazZyiObV=otnJVA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [PATCH] hw/dma/pl080: Fix bad bit mask
 (PL080_CONF_M1 | PL080_CONF_M1)
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
X-TUID: HRac+Tt9UqrJ

On 12 October 2016 at 13:14, Thomas Huth <thuth@redhat.com> wrote:
> The M1 and M2 bits are both used for configuring the endianness
> of the AHB master interfaces, so the second PL080_CONF_M1 should
> be PL080_CONF_M2 instead.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1631773
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/dma/pl080.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index 3bed5c3..7724c93 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -351,7 +351,7 @@ static void pl080_write(void *opaque, hwaddr offset,
>          break;
>      case 12: /* Configuration */
>          s->conf = value;
> -        if (s->conf & (PL080_CONF_M1 | PL080_CONF_M1)) {
> +        if (s->conf & (PL080_CONF_M1 | PL080_CONF_M2)) {
>              qemu_log_mask(LOG_UNIMP,
>                            "pl080_write: Big-endian DMA not implemented\n");
>          }
> --



Applied to target-arm.next, thanks.

-- PMM

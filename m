Received: by 10.182.158.201 with SMTP id ww9csp1900744obb;
        Sat, 19 Dec 2015 13:33:59 -0800 (PST)
X-Received: by 10.140.93.77 with SMTP id c71mr15270991qge.46.1450560839585;
        Sat, 19 Dec 2015 13:33:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h65si22875212qge.46.2015.12.19.13.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:33:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAP8Z-0005ob-8y
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:33:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAP8W-0005lb-HR
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:33:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAP8V-0008PT-Ms
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:33:56 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:34641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAP8R-0008P5-7J; Sat, 19 Dec 2015 16:33:51 -0500
Received: by mail-pf0-x22b.google.com with SMTP id u7so20654262pfb.1;
	Sat, 19 Dec 2015 13:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HsZjlEUzbLVIuYO8QAxcppmZMtxezHlYaum63eCsxT8=;
	b=UeCdBlDkyY1fcjrCtww58FS3MuprhTWOn5ajGdzOMDEbuHHeM9ZgQ3DKSxf0B60EKK
	jd3cYP0XMTvya/AuBwemCRsryDVkJxW0/Xpnd/p0LtlDA8c5fd2dYlKLjD1BgQ0aUFdh
	yZdFrJbniU+ISDH7vyuDt1+3wD/V3QkaveWYzBKNz9Qr5vDm8JiClQaIpd4tUBGlIshe
	xFtWfulYTWpr3reW3mAg5AFf296qEhvRpzNUCKNTnU/G9NLabGTsxWEkLdrba0vPmJ6/
	I1vejA+3IUYvN6HlrSFFwoglBuADfEdK3DU8Q/G48c3I9IX6BA33bTQVriwWQQ5im3Cp
	EphA==
X-Received: by 10.98.0.195 with SMTP id 186mr15909053pfa.84.1450560830595;
	Sat, 19 Dec 2015 13:33:50 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	sv8sm30119825pab.13.2015.12.19.13.33.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:33:49 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:33:41 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219213341.GB4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22b
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	patches@linaro.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 01/10] hw/sd/sdhci.c: Remove x-drive property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MYLRdfspk0Fr

On Fri, Dec 11, 2015 at 04:37:02PM +0000, Peter Maydell wrote:
> The following commits will remove support for the old sdhci-pci
> command line syntax using the x-drive property:
>  -device sdhci-pci,x-drive=mydrive -drive id=mydrive,[...]
> and replace it with an explicit sd device:
>  -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive
> 
> (This is OK because x-drive is experimental.)
> 
> This commit removes the x-drive property so that old style
> command lines will fail with a reasonable error message:
>   -device sdhci-pci,x-drive=mydrive: Property '.x-drive' not found
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/sd/sdhci.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 8612760..991c9b5 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1221,12 +1221,6 @@ const VMStateDescription sdhci_vmstate = {
>  /* Capabilities registers provide information on supported features of this
>   * specific host controller implementation */
>  static Property sdhci_pci_properties[] = {
> -    /*
> -     * We currently fuse controller and card into a single device
> -     * model, but we intend to separate them.  For that purpose, the
> -     * properties that belong to the card are marked as experimental.
> -     */
> -    DEFINE_PROP_DRIVE("x-drive", SDHCIState, blk),
>      DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
>              SDHC_CAPAB_REG_DEFAULT),
>      DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
> -- 
> 1.9.1
> 

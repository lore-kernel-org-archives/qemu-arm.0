Received: by 10.182.158.201 with SMTP id ww9csp602089obb;
        Thu, 17 Dec 2015 11:37:27 -0800 (PST)
X-Received: by 10.140.229.72 with SMTP id z69mr39404237qhb.104.1450381047574;
        Thu, 17 Dec 2015 11:37:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a141si12678576qkb.16.2015.12.17.11.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:56633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9eMh-00074a-7C
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:37:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9eEL-00026m-As
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 14:28:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9eEK-0000C2-9L
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 14:28:49 -0500
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e]:35477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1a9eEK-0000By-4x; Thu, 17 Dec 2015 14:28:48 -0500
Received: by mail-ob0-x22e.google.com with SMTP id 18so64382372obc.2;
	Thu, 17 Dec 2015 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=A5H56cnfcpi4Dje6mQZBLViaVbx1WGfIjmy6m9Fq61Y=;
	b=UtfnquC8M3EGIC58Q3Sjf7RuLOt39cF94yxjVjhEgOC+RR/nUuJ6PRbVgmpZXvNzBL
	k3UiaZ4fJnnvU59F1WwCpTuK7DaetxgdxivKhSggN0UBKD3trfSe9FB+krWEUMcry6DC
	9OqJqdwPsruJ6iC7h/TVPLrkAtuvAuHdEPZ9XwZcIhVQqkAInuR97jyGo675J5UULqlm
	kLmMQH5aHFRyX3gCL8VSlZc+lHO3/a+sXMJQVVFGActfwWyohcjOpvAGa1QYRiqnAiwT
	TFm1tYCchC1comaqXx/brnQWklrdQkLkNMxOD6qy8jt5rPikKXswCVYIpqudlmoQurYN
	onLw==
X-Received: by 10.182.28.66 with SMTP id z2mr29477302obg.32.1450380527450;
	Thu, 17 Dec 2015 11:28:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Thu, 17 Dec 2015 11:28:18 -0800 (PST)
In-Reply-To: <1449851831-4966-2-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 17 Dec 2015 11:28:18 -0800
X-Google-Sender-Auth: hqTH5i1UmFuMVnob82KFnpAaUKI
Message-ID: <CAKmqyKPmM0k2iQ4qLu9cXmF5Q0o8xS61DLHx6DY15AkJ=nAdxg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22e
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 01/10] hw/sd/sdhci.c: Remove x-drive
	property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k377wc+m1EYz

On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
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

I agree with the way you have split up the patches. I don't think it
is worth maintaining compatibility over the series.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

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
>

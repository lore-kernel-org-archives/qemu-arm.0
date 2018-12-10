Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3790191wrt;
        Mon, 10 Dec 2018 08:20:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Ut/vbAMf0P31l8Wg3d4Z1wJURXw4y6rr6tXMJkjOaw/WF0VTAE6+Q/3tz7E917NlV8XRt+
X-Received: by 2002:a0c:8aa8:: with SMTP id 37mr12155032qvv.23.1544458817114;
        Mon, 10 Dec 2018 08:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544458817; cv=none;
        d=google.com; s=arc-20160816;
        b=Law3nT92YHbzzZabxec2RP5Wi3stMl/YwIST/+ZVrqB0aD98NM8mmEtxLHZ2ZT/HoD
         S8WTEmST2YGOD/v7WAl/9r+niuNzq5wdGt4GT4fMuM4kkMfE8jmGApwuZ7YKvWr7AB8J
         uncNKNArZ/ZqcJzW9IJun1JGeUizlyWXxCh+qhIalA3I/CgpQCFNL2RCl+YE+mWVFkOG
         jq+gIzovsz4C/krYIzK1LxXHbLN+/XX8VRUXR1yzZ4ztODFZoT6gbGR3lxALuqX5nAjg
         IF3Tu5aQdDap0ZbtC6Alwk2SoLEGVvft5gAnJrqEPghthgUknMokfSZhQh5PXCdFYkNH
         6uWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ZlULeoe4E8dEpsVUT1U0Nq0ZF+ugWQqaGE4iH4fEdnU=;
        b=Cio11kxqENChcDgfXbgHvlFyypCShy6ujfnvNGMrAIkp2UuoAkgfqE9FgET40HoJPU
         k0j7cQGxg3OmNcIHhpuYk4c6m6LodxuVsbZf7Sha/iwVa80YjK2IpgWzSIqKl0eWF8+f
         9Mn3q9A2Vvh+ZXBWx9ktlkHhkV7MGauxq+3gEC5xwiRe9KQIT7DKONaF80zXGLIkTtcf
         PbiNq+YiNMs8zE0iQsHSBawebv5OA5RYC3VgfyTitHUzQ5u29nN5vJF7px58Wh53seJw
         kf4+2JkhWLMlBpPrLKBBZutKPnQwpR7zpa0vFN1EpCdbAaFBfOmNaAplhhZmWeFFuROU
         o4IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m93si815209qtd.270.2018.12.10.08.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 08:20:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWOI4-00040I-I5
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 11:20:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gWOHf-0003km-7K
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 11:19:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gWOHc-0004GS-1B
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 11:19:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gWOHb-0004Eu-Gq; Mon, 10 Dec 2018 11:19:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37767368E7;
	Mon, 10 Dec 2018 16:19:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7795D5C1B4;
	Mon, 10 Dec 2018 16:19:37 +0000 (UTC)
Date: Mon, 10 Dec 2018 17:19:34 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181210161934.5zmat6tjtx4utmzh@kamzik.brq.redhat.com>
References: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
	<1544095560-70807-6-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544095560-70807-6-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 10 Dec 2018 16:19:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] pvpanic : update pvpanic
 document
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ATHU/r9OanH

On Thu, Dec 06, 2018 at 07:26:00PM +0800, Peng Hao wrote:
> Add mmio mode as a pci device support info in docs/specs/pvpanic.txt.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  docs/specs/pvpanic.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index c7bbacc..6d62d72 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,7 +1,7 @@
>  PVPANIC DEVICE
>  ==============
>  
> -pvpanic device is a simulated ISA device, through which a guest panic
> +pvpanic device is a simulated device, through which a guest panic
>  event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>  
> @@ -9,6 +9,10 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>  
> +The pvpanic device can be implemented as an ISA device (using IOPORT),
> +or, since qemu 4.0, as a PCI device (using MMIO address space of pci
> +device).

I'd drop the part in (). Just end with 'as a PCI device.' The MMIO stuff
is described below in the "PCI Interface" section.

> +
>  ISA Interface
>  -------------
>  
> @@ -19,6 +23,13 @@ Software should set only bits both itself and the device recognize.
>  Currently, only bit 0 is recognized, setting it indicates a guest panic
>  has happened.
>  
> +PCI Interface
> +-------------
> +
> +The PCI interface is similar to the ISA interface except that it uses
> +MMIO.

uses an MMIO address space provided by its BAR0.

Should describe that the MMIO address is two bytes in size here as well.


> For example, the arm virt machine could enable pvpanic-pci device 
> +according to adding "-device pvpanic-pci" in qemu command.

For example, the arm virt machine may enable a pvpanic device by
adding '-device pvpanic-pci' to the command line.

> +
>  ACPI Interface
>  --------------
>  
> -- 
> 1.8.3.1
> 
>

Thanks,
drew 

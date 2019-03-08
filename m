Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8393242wrx;
        Fri, 8 Mar 2019 05:49:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMpFM823jlmuzD+cyiZ2PhviwkPm2PjSa/WkG1nGmNvkgONcnmckUajI/wP0xMcbgDyC/2
X-Received: by 2002:a25:5089:: with SMTP id e131mr15541052ybb.477.1552052946932;
        Fri, 08 Mar 2019 05:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552052946; cv=none;
        d=google.com; s=arc-20160816;
        b=l7T7h1WhVxe6vBWHRYNzgIkd1Pk0OOVRVkOzlwxkyr1c65y/XJFXhbFD6hQq6LFkkT
         s1Vtm/pzBdzb4IwYS9hFbwA8c2iBK1Nc2hdOGIbzI8z2d6BBiHOfe4VIFhqmNlskavt9
         bU+HRYTsIPsYVXdglV4EwE09Hr2FGGVSzq1Ao/fZdtOJ9zLxHwtEKPUv+0f5DrlbrSEd
         4e+oEj6BBV9EZdbGGZuNkwrTJ6DKNzPmT9XrsTKdK5zqFVlWl9eSGdKfcb72pKFGk11F
         6nl1iRUsNPM+M1vF9qabpfWX1RiKh1VU9aIpIdfaOOY/qyryJMG3NcQH+3mQJl2neEvP
         OZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=iAB6rvKCidREX7VrCIugHkgUzNSgP9ol0zsyRwBuwKc=;
        b=Y2V6OdraeEHwfQcM46yNViZ4zM84SizqhsMZ9vuK+R6mwUglb0gYLEsNHqzmywTw6p
         KnVZCLvEdkskWpwnoA1u+mETl8UcUKOLlykqMP0j4+msAIU3hWmGR670C3G/8FElw0hh
         jGqOAOqH6nphOJEVV1caTMvIu/vWgRHmiimyvlV/YG+qT109raa6wuTiuPFmCTVM2NqY
         y7/tD6zjMeABGHf26hGtiHpHvgjZCF28NIg4dOqr/M6m7fpteaL7g+24u/sa1HMSTHL7
         QYRHA3X8AQpfxuckpnuU0MMWoONHYF4JyzHAuNXtbmUHRppRB/DVKx4bJCA8c+7QIdYF
         GufA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si4601814ybg.275.2019.03.08.05.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 05:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Fs1-0007mY-80
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 08:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h2Fri-0007kN-QR
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 08:48:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1h2Frf-0006hY-Mw
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 08:48:45 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1h2Fre-0006QF-89
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 08:48:43 -0500
Received: by mail-qt1-f195.google.com with SMTP id o6so21198737qtk.6
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 05:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=iAB6rvKCidREX7VrCIugHkgUzNSgP9ol0zsyRwBuwKc=;
	b=fBBnX5hv8/ocz+FU0ozehgBuEoy6vM40rmlkPYbvpYnI4+e+2cOtltKTyCUAk7u8OW
	3SIYd/tYbyDNCadumJhQZ5stns5B3pvQOdtpXudKDYIdR5jbSkRu0g+x22sDvvGNUXbp
	zmtx9V93LmvrOyak2hqSqbiBAVjxCSpamHG69R2t4I6hME759/8MXckVpqB0TDGXp3Xf
	f8fkRecPatFatafdKAs+IPEh2e/UWzcBT93V9f9qdImnX8eKf6DFPoUFSPZSfEc2uRdj
	Q4p4Q4JCSb2GkAZpkSqSlF8m2ovkTBS1LFAeGqNT1ZB2RDUXWFySuPuq1HAQQfFddReB
	syGg==
X-Gm-Message-State: APjAAAWFG0/WPNnOi4ExZlauANj0NsfGFydG3cJqm5DMjmJKYt5pDdsd
	VDzIuOXTwXxiledhy/KhN7OXHQ==
X-Received: by 2002:aed:2a6d:: with SMTP id k42mr15288166qtf.390.1552052918965;
	Fri, 08 Mar 2019 05:48:38 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	p35sm4902529qte.83.2019.03.08.05.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Mar 2019 05:48:38 -0800 (PST)
Date: Fri, 8 Mar 2019 08:48:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190308084438-mutt-send-email-mst@kernel.org>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-11-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190308013222.12524-11-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.195
Subject: Re: [Qemu-arm] [PATCH v2 10/18] hw/nvram/fw_cfg: Add reboot_timeout
 to FWCfgState
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Laszlo Ersek <lersek@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EHg40q2vG+LC

On Fri, Mar 08, 2019 at 02:32:14AM +0100, Philippe Mathieu-Daudé wrote:
> Due to the contract interface of fw_cfg_add_file(), the
> 'reboot_timeout' data has to be valid for the lifetime of the
> FwCfg object. For this reason it is copied on the heap with
> memdup().
> 
> The object state, 'FWCfgState', is also meant to be valid during the
> lifetime of the object.
> Move the 'reboot_timeout' in FWCfgState to achieve the same purpose.
> Doing so we avoid a memory leak.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I don't like adding random per-file state to fw cfg at all.

I don't see a leak. Please add more explanation about this.
And maybe split from this series.

> ---
>  hw/nvram/fw_cfg.c         | 4 +++-
>  include/hw/nvram/fw_cfg.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index b73a591eff..182d27f59a 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -250,7 +250,9 @@ static void fw_cfg_reboot(FWCfgState *s)
>          }
>      }
>  
> -    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_val, 4), 4);
> +    s->reboot_timeout = rt_val;
> +    fw_cfg_add_file(s, "etc/boot-fail-wait",
> +                    &s->reboot_timeout, sizeof(s->reboot_timeout));
>  }
>  
>  static void fw_cfg_write(FWCfgState *s, uint8_t value)
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 828ad9dedc..99f6fafcaa 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -53,6 +53,8 @@ struct FWCfgState {
>      dma_addr_t dma_addr;
>      AddressSpace *dma_as;
>      MemoryRegion dma_iomem;
> +
> +    uint32_t reboot_timeout;
>  };
>  
>  struct FWCfgIoState {
> -- 
> 2.20.1

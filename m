Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp442210wrd;
        Wed, 19 Sep 2018 02:34:55 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY6/e21YypzE9kZd+wn3E7kyqi84+uV+VkIsYhYhSm4S9JjLBkgaJNnVNfenrGDu5fuzdqR
X-Received: by 2002:a37:6306:: with SMTP id x6-v6mr929444qkb.118.1537349695743;
        Wed, 19 Sep 2018 02:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537349695; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjEM/c5wqJ/TeXL0wj56zg1rRJxk0YcPwKTNuDYBFTLbQbi1sLsNwTkrCi4vQjYPSH
         r594F6lOAuLgqnJekMS0Y4BUzCCjN8R2KjKA1RTrK7gdI7DMmNuXeY+364CrxCNnbv8O
         3FFzgnrlvo2TdUt1MPGBH2Pt4tkUeyYpIYl1+gwxbjCVHtF5c396Vh+/n8lqzfruF4QJ
         3it566STZ8CUQ2xthdyfupehepptSQ5RMpaoT/A6EYj34d9Ay9ur5qiuj8fHQkLESsj6
         rGWtdfFOFaDcgsaE7uWUqqAJ7sGk9yp0Pox0bzhBHSjO1GQMdxw3PX1Ql8J8tsy1U5yl
         mt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AVRTx2HPJnH5q3YxBl2H849Ik84xo433cMWt3s9eoeo=;
        b=Ec/U+kwBS28eW9aqMYc7+mg7pb6ffj1I4pyprkD5BpwcP9scahLW8jWoTorRa18S9P
         muRUAZ9Z1RxC6WqtRDFtkr2f1VUfFwSh0AYAUc+O7lepkmRxTKVys7odu8t2onzZlRF3
         l7uT6ChV1goZNExYNuew0GoPMk6IIlIejKtWfArD6ek36VuodCOFs77X7+Y1esdiexup
         zhGk5hn2sDZTHk4Bl6r86baoel7lp2L60YHy9p9LuenWkGQ550El6Rp3h5FVcr2NluuZ
         szKxihiQwlkMRD6/NfGaXv++4QRb2WGdBLU3GagC9OkpQZzPgKHN8hzrkQJ8GiTOdO/l
         RItg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5-v6si431268qkb.28.2018.09.19.02.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 02:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2Ysp-0006CV-5s
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 05:34:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g2YsZ-0006AW-PR
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 05:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g2YsY-00005X-Rt
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 05:34:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g2YsY-0008Vf-JX; Wed, 19 Sep 2018 05:34:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 628D930820E7;
	Wed, 19 Sep 2018 09:34:36 +0000 (UTC)
Received: from [10.36.116.241] (ovpn-116-241.ams2.redhat.com [10.36.116.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A144E5C886;
	Wed, 19 Sep 2018 09:34:28 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180913154458.23939-1-geert+renesas@glider.be>
	<20180913154458.23939-4-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f8fe722d-8abb-c674-7a92-49375586d8c7@redhat.com>
Date: Wed, 19 Sep 2018 11:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180913154458.23939-4-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 19 Sep 2018 09:34:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 3/3] hw/arm/virt: Allow dynamic
 vfio-platform devices again
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZScbgX9euAoN

Hi Geert,

On 9/13/18 5:44 PM, Geert Uytterhoeven wrote:
> Allow the instantation of generic dynamic vfio-platform devices again,
> without the need to create a new device-specific vfio type.
> 
> This is more or less a partial revert of commit 6f2062b9758ebc64
> ("hw/arm/virt: Allow only supported dynamic sysbus devices").
nit: his last sentence is arguable as before we allowed any sysbus
device dynamic instantiation. I would simply remove it.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - s/sysbus/vfio-platform/ in patch description,
> 
> v3:
>   - Drop RFC state,
> 
> v2:
>   - Restrict from TYPE_SYS_BUS_DEVICE to TYPE_VFIO_PLATFORM, as
>     suggested by Eric Auger.
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0b57f87abcbfd54b..e33f7776c72fa9d0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1758,6 +1758,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> 

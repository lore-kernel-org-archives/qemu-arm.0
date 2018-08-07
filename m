Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4263078wru;
        Tue, 7 Aug 2018 07:21:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcn7qd5Fr5fiKcufpaezKHhhe9i1qpoE4va18IKdCjZSvVyWrnsSdpRnNOLU8w55X22U8fk
X-Received: by 2002:ac8:1b49:: with SMTP id p9-v6mr5004097qtk.132.1533651711691;
        Tue, 07 Aug 2018 07:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533651711; cv=none;
        d=google.com; s=arc-20160816;
        b=sKWZg+ytL+i7eBxC8ChL2qXowFUCGETxFFhci50w1OW4Amk4kWnsE/yJAEOVfBSLBm
         TmlT36WZGfNHfByTDsHAmHFPTMbOGlmQN8gH4oU2afEyYJsOPSBkL9/Ne9t0xUbngtgZ
         okFMHeLAH6Q6vB55ENq3rImLQ4UE1wM0sTMo3RL2DeGhym+KXuQKs6FafWew5vLe8Zxs
         haeU/bxIUogWZAbRnr7EAb73BRgcSuCz2LuaxE7nYQqkTjC/uVpiKpUhBLVMXFcowR0f
         qx7V4rV6fzxYt+MOc5k9XsKPF1MtSUdi8NF9i04yBGFN3WjknitYnWY7gTwEw8kCW9YG
         AlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=OHJ1/d06emeydQEoWAkCBbUWFTOljmxOrwbS+hudB/4=;
        b=gLPYfftJHa5Db/UxnqHRYw49mL2lV7hE41yDLwjMA+QBKE72hQYSMc5pjFB33At/fC
         nW+ScQ4klMYzDO0mw7WcbVlzTcJCwGLqoq1tzHnrASrPjjx4uuFgg7ewooNGEVJsfAF+
         4yqZjnHcOEe7gQ+1gMlY+CgkX9wp9nweEUkqeILAKDvvX+QvSpRk57vW3bLQ58EqWUME
         E3xs3mTMxdDBFQzI0qZr3xe1+kV9fkq72OqcoWnM/Hes/yfEPTwM5kNqFXz0Uupu3OSb
         w1C9ruZW8k4p5ZYJ8D0YduIIgSMqIJpjzjutgEC45eT4ZZddanm31gJjcZNMHbmYJUWF
         GFUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si1423513qtc.255.2018.08.07.07.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn2rv-0003Xo-48
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:21:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2pG-0000zX-N5
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:19:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2pE-0002JH-3R
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:19:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42164 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fn2pD-0002J7-TZ; Tue, 07 Aug 2018 10:19:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C24C40201C4;
	Tue,  7 Aug 2018 14:19:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D31C1C671;
	Tue,  7 Aug 2018 14:19:00 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-4-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2d36dfa2-744b-1570-d2c2-51352ce98e23@redhat.com>
Date: Tue, 7 Aug 2018 16:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180725143413.9728-4-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 07 Aug 2018 14:19:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 07 Aug 2018 14:19:03 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3 3/4] hw/arm/virt: Allow dynamic sysbus
 devices again
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
X-TUID: DO55VJAaey57

Hi Geert,

On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> Allow the instantation of generic dynamic sysbus devices again, without
> the need to create a new device-specific vfio type.
The patch title and commit message need to be updated as we allow the
dynamic instantiation of VFIO PLATFORM devices.

Thanks

Eric
> 
> This is more or less a partial revert of commit 6f2062b9758ebc64
> ("hw/arm/virt: Allow only supported dynamic sysbus devices").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
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
> index 281ddcdf6e26236d..24c1d8e28c7c4285 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1724,6 +1724,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> 

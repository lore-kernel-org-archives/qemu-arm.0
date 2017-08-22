Received: by 10.223.188.70 with SMTP id a6csp5269625wrh;
        Tue, 22 Aug 2017 11:16:02 -0700 (PDT)
X-Received: by 10.200.49.230 with SMTP id i35mr16177qte.113.1503425762485;
        Tue, 22 Aug 2017 11:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503425762; cv=none;
        d=google.com; s=arc-20160816;
        b=QD7l4aTWENTScGch060QP04T+h1o+wuQyJen+Mumna2o/LhF4bKVl8Ymd8h6iClZAP
         QEacfBkh8VnVPu62OonkphCmmVF3c4ENmyW/R30cHrd1N7e7IpJnUnZlUrxlLiq6KDE7
         dnjg1ijGbYauzG7OpIDHeUVrviSC9dxC6GqjTsstF0AIlM4T2eK4yU9bj65VsJ1LnBVq
         87mOeiTA28OVPXueU+n+sjMivz95LaylrPwsck/nf1zcW1Zq0XOJgVQhNjI/IIMKS69H
         xLJunlTbmaj+9K1A0G8NICk1qsJj+uK3RZPwAd2dNNU5OnXMTz+SrVXgxymZJk45Z+AA
         fK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=k2TfHfMgK4gbbxMOMwtGJu3Zme11MV2ssn68ofrTg3s=;
        b=hmytuKK4tYC9MqMa6kbrwvorn3aOVXDlh+ifM0GfX+QcpD0lEvOGcH5DeS8BRXS/e4
         wWDM0Rgj4vAIn4y+FdYXPY1QciVhhPcBGeRtlIOR0qJXIp/RowNdq8OHVZSLRGh6lqqh
         Jhc2JOBqLiqXGldI6g/NADnSTTFGOfEpiGMr5x6aWvMjJUMfCNZuaq8QpTrcKoFavg6M
         KGeKZjBmRedxJ2TzUQi+GLhKUBas0fSrba/FD6OwzfdMQwVpsJ1VpOBbvP7TLQdCShwY
         E/cHNa/PaV9mQiZqjZw6cs7V3XF5ObAEBs0nkDAOjVMSyxBan33gBfmoW6wvuNYUOPSv
         CT3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i62si13704266qtd.377.2017.08.22.11.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 11:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkDia-0004YY-56
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 14:16:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dkDiO-0004Wv-Or
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 14:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dkDiK-0005Qu-OS
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 14:15:48 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:49198
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1dkDiK-0005NE-Hz; Tue, 22 Aug 2017 14:15:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 3496D82422;
	Tue, 22 Aug 2017 20:15:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULt-5F_Qv4_9; Tue, 22 Aug 2017 20:15:43 +0200 (CEST)
Received: from localhost.localdomain (182667ea.cst.lightpath.net
	[24.38.103.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 1B3C6822CE;
	Tue, 22 Aug 2017 20:15:42 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
Date: Tue, 22 Aug 2017 20:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414375-21009-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-arm] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPN24+w6zmbe

Hi Thomas,

Looking to this seems there is a second issue:
The aux-to-i2c-bridge device should connect on a TYPE_AUX_BUS.

I don't think there isn't any on integratorcp..

Anyway the patch you sent fix this issue indirectly and as far as
I remember I wasn't able to make this I2C bridge an
TYPE_AUX_DEVICE as it's a special device and it is internal (only 
instantiated at the bus creation).

Thanks,
Fred

On 08/22/2017 05:06 PM, Thomas Huth wrote:
> QEMU currently aborts if the user tries to do something like this:
> 
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add aux-to-i2c-bridge,id=x
> (qemu) device_del x
> **
> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
> Aborted (core dumped)
> 
> Looks like the device is not hot-pluggable, so let's mark it
> accordingly.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/misc/auxbus.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 8a90ddd..2c62515 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
>       return bridge->i2c_bus;
>   }
>   
> +static void aux_bridge_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->hotpluggable = false;
> +}
> +
>   static const TypeInfo aux_to_i2c_type_info = {
>       .name = TYPE_AUXTOI2C,
>       .parent = TYPE_DEVICE,
> +    .class_init = aux_bridge_class_init,
>       .instance_size = sizeof(AUXTOI2CState),
>       .instance_init = aux_bridge_init
>   };
> 

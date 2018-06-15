Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1070574wrq;
        Fri, 15 Jun 2018 09:51:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLMaWP3U8J9ryMw2JtoX9snhSl2kjm+qA6NE7W+DJjdDiGdRvg8quRNdOK572JOl/AvgtvM
X-Received: by 2002:a37:2150:: with SMTP id h77-v6mr2077431qkh.424.1529081508307;
        Fri, 15 Jun 2018 09:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529081508; cv=none;
        d=google.com; s=arc-20160816;
        b=Hhhp2oVtZBelzsO0Q1OE4JUN3oAteHuc9TSwdvVs/buqYRttNbxGVZlrvkaPFSMVgi
         SW0WKjHCLqhSD/BhSWKaxy2qFU4t0T19A2qwFHCwV9YtN7JGNOPcl1YpibAodYZ/V7cT
         SyuhOpIwQkLRGNQIrZeMRFk8okxa7SHzsTTaW7WUTw5vZ1I0e+y148W9hwcfRu4dU8pH
         b2rp4BO2sfpQKhg/Xg5uTisM/c+zqb6zb3JKWvHsQhR4cHd1/QibzppITzBg7i/Lg86B
         sd4CmzdzVp40l/6lFWiO/iCPivnaFjOpLZvmbmLMrJLPDccoy8tW26yhb/o950TjbBkN
         NKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=DNy7Gw1RBkxxgS3juhibd18scg4VDLIVjqHU76bMSQk=;
        b=u7foPpNnaXCf3Ydu+ZnQEGihSv/aGAYqtDsaxKaNWVNk784vzN9vDzJ/7/lNXxh1PK
         fuGGE+81fhslzpE+Y72LdOXcNRVJ5/bYrGK1T1/YYOeJGmd9yHGRfBM05JM7rygE44ol
         1KI789Wmg/RiNKtg2SoyGK5PWI10utKso+wdTf86BdpaGMYtXAh1gAecFqwakhseqnsN
         GAE3l+Y856hG2G8PgJUh9kMA1IQ6TfZeYI4tvzkqb6yvAZntH0rmMCXurc0taNb78Kki
         QCl5WfoDDMz+gzSAvy8UkUybdzmHfLec46E6pcBuV7r+O0Ht9YR6znx0s+ELRVx7n7nO
         zk9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b29-v6si761692qvf.283.2018.06.15.09.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTrwx-0008Ay-Nv
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:51:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTrwi-00089F-Gf
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 12:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTrwf-0007hv-Dm
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 12:51:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51358 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fTrwf-0007h7-96; Fri, 15 Jun 2018 12:51:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA8BA7D858;
	Fri, 15 Jun 2018 16:51:27 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-39.rdu2.redhat.com
	[10.10.120.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23E4D2166BB2;
	Fri, 15 Jun 2018 16:51:26 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180613122948.18149-1-kraxel@redhat.com>
	<20180613122948.18149-5-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8451099d-52d0-741c-4810-12829b4b5927@redhat.com>
Date: Fri, 15 Jun 2018 18:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180613122948.18149-5-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 15 Jun 2018 16:51:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 15 Jun 2018 16:51:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 4/4] Add ramfb MAINTAINERS
 entry
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xuKHm3uV66JV

On 06/13/18 14:29, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a94517e9e..2401028766 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1331,6 +1331,12 @@ F: hw/display/bochs-display.c
>  F: include/hw/display/vga.h
>  F: include/hw/display/bochs-vbe.h
>  
> +ramfb
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Maintained
> +F: hw/display/ramfb*.c
> +F: include/hw/display/ramfb.h
> +
>  virtio-gpu
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  S: Maintained
> 

I wonder if we should have a separate "display" section in this text
file, or some such.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

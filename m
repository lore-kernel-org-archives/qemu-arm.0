Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2485689wrt;
        Fri, 14 Dec 2018 12:16:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UP62Y31c+/HUZFPrpvY35QKwVdrienmtlFV7s+VBhtMYVi2zUEx0KWriV199qwL53Rdg1C
X-Received: by 2002:a37:b405:: with SMTP id d5mr3994770qkf.162.1544818614610;
        Fri, 14 Dec 2018 12:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544818614; cv=none;
        d=google.com; s=arc-20160816;
        b=VXTVmU3brDrsK8o4taUTewhu5F+KLl9sqVWH68fyZtLy/d4wWjCp2aNDXEYeG8vUbm
         2DRDgqxH3qMdojgWajWNO/qRNrd3FJYc4ZSAZbEapyE3FbT+ED1jdtF0IpV6CkDkK38j
         1jFB/Xn6Zu8vkPVEwusCYdA2di/FfciHFTMwYOyjCfCl1yueuauphcdOHKwoIZ/LkzNq
         iuPt6+TOT9wsXDLCGHg7QTs2O560dgZl8Zt/GsZEnjr0nY0TxGhuXSCEhab3eCnP1tWN
         VkyOswA+vcKIlgDg2xBZycgJ8VTlkR2cZVS3YQy0TpPzedQA1QUFbvd2W6wBjkVRqqtB
         UrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:cc:to
         :subject;
        bh=jKFutRUu/8LWLPVnfiHYq/J3bwEfnfvvnRWC/V953Sk=;
        b=ld+R9CfVnhIIlf/WLAku4Pgj6YwuIs0s0FAVG29LQnRbru5CxpR1WhlTkCK+yLkBzj
         PqS4HfJOh1pto1V24TOXNvXXl4ezhjtbm36j1sFttpZTsJ0h+0dgXxYAPj9Vl5A07YqZ
         hg+4cme4pRa7RAObrXy0kW9hiJMl85PMKAuNy7XHmfFWl5KZoxQaft2c4NECjspuAXdo
         nD3mkGyWotk2fIAxP9hK/JeqzxCYqfvaLWx0eoyFqDixg6a+B9pgNE9knbCzeE99yNU2
         j8ABmjI98zh6dWeHfIrqzLUC9ARbiP4Z80iQiwmf2SjWdB1Zp1ZMmO05KZosfHElOMj2
         x2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eblake@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 63si578057qkr.108.2018.12.14.12.16.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 12:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eblake@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7A258E666;
	Fri, 14 Dec 2018 20:16:52 +0000 (UTC)
Received: from [10.10.122.76] (ovpn-122-76.rdu2.redhat.com [10.10.122.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5316F4C4AB;
	Fri, 14 Dec 2018 20:16:29 +0000 (UTC)
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a few
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Amit Shah <amit@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Stefan Markovic <smarkovic@wavecomp.com>, Jason Wang <jasowang@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Fam Zheng <famz@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:bochs" <qemu-block@nongnu.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9eb33910-7afc-42c8-6e07-713f3fb023c0@redhat.com>
Date: Fri, 14 Dec 2018 14:16:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 14 Dec 2018 20:16:53 +0000 (UTC)
X-TUID: BjvxS75Sn2un

On 12/13/18 4:37 PM, Paolo Bonzini wrote:
> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
> 
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.
> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.
> 

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

>   nbd/client.c                               |  2 +-

NBD part:
Acked-by: Eric Blake <eblake@redhat.com>

but I have patches that remove the line in question entirely as part of 
adding 'qemu-nbd --list'.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

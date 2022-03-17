Received: by 2002:a05:6214:21e7:0:0:0:0 with SMTP id p7csp529165qvj;
        Thu, 17 Mar 2022 04:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6z76EA3AMrzsUeij86LcHWbI0DK8o6IQ259ardGtHasS4qeLEAIDu8NjO4VkuTM/1D+Gq
X-Received: by 2002:a05:622a:1350:b0:2e1:b7ec:bed4 with SMTP id w16-20020a05622a135000b002e1b7ecbed4mr3179397qtk.413.1647516889919;
        Thu, 17 Mar 2022 04:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647516889; cv=none;
        d=google.com; s=arc-20160816;
        b=AEZ5LairBh0wpdG7DUFfyJc6CgfLUpxSxc1vzysOWNn/YQCBFoy5jnT4B2N7kNSOY1
         R2Th7V/jLSV+Zn8rcEXWtjsbrbJ+os9TELxnXN9g0Sw6GjFvtbL8u1z+HfHYdEDWpU+3
         ZMQ+0Xl4/AhFeQbwtUOPE6HftNoxwSSmgN0YeXVlzhiFWf8WQaOKXcEgjHULBOm1rpGr
         A5IuE0jvuHeaTmaJQDTjVHvQstfZo23mf/hppG3UGd0z6VWelXS9tpNOfrZiXS5DCP2y
         XV1X4lL+0TFt8vZldk42EfyrKrOFYNQELN0y+rgXU6OK39547DeEdCb22AbjfyHh+meM
         /fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=gNljhz4zr0tKkeC7Bz1ndALgXIgMcobYDtbYI7LUKH8=;
        b=UZ/o9bhwZnxTtoQksuVwDx3qJZqK23Vy8U2bRJaxEoAnZpUdZLpu1i/5Bec6kh7hMr
         yyHC/2MG71BcnErpLFM7gL1hxQ74fo2+Hcu7SEUTWcyNDfSGWVNJ6wXwmauWntyp5Tz7
         9zQOYPEdrPfEPJdaPkQvdwzNdF9f/nayFazF+BHZ6V0+jmye8dTD8IZfmIIjzbdZUzl8
         uRXvixYTRFoF2NtBzfk/jOdp6lMkvJcw1qPS6KOuJerRat8axW0ZLTT8XB+LyguQRc+s
         fwiZiOlqtTbdnmcuY/BesLJ4GKRxWYUfPWaioxiQ67hPkOfztPZKmR4nQKTV0beGw6la
         QTaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020ac85ec2000000b002d19f25a0a3si1080974qtx.143.2022.03.17.04.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Mar 2022 04:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUoP3-0008El-I2
	for alex.bennee@linaro.org; Thu, 17 Mar 2022 07:34:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nUoOn-0008Ce-HW; Thu, 17 Mar 2022 07:34:33 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:34801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nUoOl-0001dD-SZ; Thu, 17 Mar 2022 07:34:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2F4C7EB32ADE;
 Thu, 17 Mar 2022 12:34:30 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 17 Mar
 2022 12:34:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004743e4a88-96c0-4705-b28d-da4260fd0a3b,
 0530BE337510AE92842F4B01C4CA167143738EB5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d583735f-3d7a-6773-831a-1bba1e98b1a8@kaod.org>
Date: Thu, 17 Mar 2022 12:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH for-7.1] hw: Add compat machines for 7.1
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
References: <20220316145521.1224083-1-cohuck@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220316145521.1224083-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d3b612b1-83b1-4946-8903-021f40ccc794
X-Ovh-Tracer-Id: 2073344680142146390
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hn1ibCqaREor

On 3/16/22 15:55, Cornelia Huck wrote:
> Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)

For the PPC part:

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

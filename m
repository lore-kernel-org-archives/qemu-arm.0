Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2856166ejm;
        Wed, 3 May 2023 07:00:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xG025OZm4fVSchELakGQZMjZoV3Lv2XslvK8GTnQyK+EiTvxSKN+/AwGo0dwl+P/mRee+
X-Received: by 2002:ad4:4ea6:0:b0:5ea:d52:7042 with SMTP id ed6-20020ad44ea6000000b005ea0d527042mr12940951qvb.31.1683122410517;
        Wed, 03 May 2023 07:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683122410; cv=none;
        d=google.com; s=arc-20160816;
        b=nfONQo+IsLX9oV26/yQirT/ep0eeVXdxn1S+49y8MfjQWzosM6D2NV0zgyMSXtRvG+
         S0ZoOaPRa++FxWjZb69DcxKFycnFwDLh69PcjySQYgRkgaC4Qo2SIfFlth8IM/kgqP8R
         Lo53KSaBYmAPwDWOIm65WoB1fsM+RHGa71dJBnhk+v9pDSbTgiaBWrcwMslbV3XN5EiE
         EpF4pGT5KbdIRD+Ho/gG40cpCAPGSL8lXeEMDdOwvWLdVo+LPVuxB78rpS5MlU8h6ErD
         ndY9PqB2SLNJIHuEMAQzpWB5kKKhf91TzFXw0w4tJBOt7AdfyI8xQeM8Pytd8u09y9XE
         Sbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HOBbTf1/8uzx6hsI22/vF2PdNdjNeNEmYqHVxNPekFo=;
        b=CeuBrkVDduh/S/IImD7VDBM/8/ilV59GUc5uWnP7OEKNFcJwYEXRr8jpX8aDpPX1+R
         5p+6KXDGYs+hCiQbkU+5MPwJLujvGkYzo00wf3+6bV+rIQhzpnuLrpnCXoiyHUAjFyRP
         j1hSd8SvqumfP7InuNfPgasU5EZX0oOXb4dX1iV5pPlkD/hDUdRttdFzRp750GoA5DmS
         u0bzP4+2ekwknZ84nxkaJ1lJrc8BGRAHXLkEKI8o9z0/HmMMngLASpN7ScCI+iFHNH/z
         C7JpatSKXeEx0MWpUyWO+rUtSbYBxq5z4dMvgmbv2msznXwk/HH0uDW22JEYKmtJxKtc
         dEMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMo3ZKbA;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r15-20020a056214212f00b0056f079ac110si18809701qvc.124.2023.05.03.07.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMo3ZKbA;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683122410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOBbTf1/8uzx6hsI22/vF2PdNdjNeNEmYqHVxNPekFo=;
	b=FMo3ZKbA07F/Zax7NEsXcpIwz+WZWNLHaH+xSj3gr6FbJlDhUt/rDNbG0mb6oDvJEzvP8C
	Mn4MLpGvIFtmfRp8plL6gF0oeJWbkCdBACHVtrDWRJ0afZKcTqk2Dm5o5c3OOcfy59EeEL
	UaEmBiM3sQkqECptc9EF+c1jY3XsaDE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-YkQQpmMIMW2wjDSh5CEgDg-1; Wed, 03 May 2023 10:00:07 -0400
X-MC-Unique: YkQQpmMIMW2wjDSh5CEgDg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-506a7b4f141so6282755a12.2
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 07:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683122406; x=1685714406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOBbTf1/8uzx6hsI22/vF2PdNdjNeNEmYqHVxNPekFo=;
        b=aOcVfQduVmYK3si7GtQO1OEhzg43plkSmpzoiaf0uindW79j8yiTQnF3uXkVag+2vZ
         Gc5u+5+CZSkQ4eOcOXmw8pql1tH2CjH2VhwCl6Agss0VKQAE3TDf8T2Xe5QFZRmGM380
         diRVT7ygBAZsouj/lF/IBLIfk9QpBlp3vHComLkhEGqNx3qMOJlNfbVL7nbvc/zWe6Gh
         pYMlO+LGptrX4iyY5KAzX6qlg3ddCcZr4b1ukR4Anqn0Ns68Cy/SzpxJNu0GxdIEJIyC
         /3UvCGQi9LAb8u+ui1K1Rx5bOZ7aH+EB2pV/X0IYUcUI0c1Ehjpi0st9MPxIyUb0YJa9
         xhsg==
X-Gm-Message-State: AC+VfDyBnkelINiSNT1KmiT2lhnQDjGHAVCE2NUhbijxX9Yz1M68pxTE
	uS44v2jYUTBcgVXUnORAYgn8+9nw2AmF3Mv3CZJrJO6pGdEwR+Br6kMou12cWoRwnfHLJ6TLySw
	YIGHfK+uhw/QlG96ZFG040rpGBqEiyCPr3is+lMSpv11dPYCRt075UIvta8aXcrTBGyhcr+awqL
	pO
X-Received: by 2002:aa7:db9a:0:b0:506:9984:9236 with SMTP id u26-20020aa7db9a000000b0050699849236mr10267852edt.15.1683122406032;
        Wed, 03 May 2023 07:00:06 -0700 (PDT)
X-Received: by 2002:aa7:db9a:0:b0:506:9984:9236 with SMTP id u26-20020aa7db9a000000b0050699849236mr10267790edt.15.1683122405611;
        Wed, 03 May 2023 07:00:05 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id j14-20020a50ed0e000000b0050bc4600d38sm727153eds.79.2023.05.03.07.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 07:00:04 -0700 (PDT)
Message-ID: <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
Date: Wed, 3 May 2023 16:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ju9owzMuEeis

On 5/3/23 11:12, Alex Bennée wrote:
> From: Fabiano Rosas <farosas@suse.de>
> 
> The 'virt' machine uses virtio-net-pci as a fallback when no other
> network driver has been selected via command line. Select VIRTIO_NET
> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
> (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci

With respect to patches 5-17, very few devices need to be present when 
configuring --without-default-devices, and thus need to be "select"ed by 
Kconfig.  You should select a device only if you cannot even start the 
machine without --nodefaults.

Anything else should be added by hand to configs/ if you use 
--nodefaults.  In particular, failures of "make check" when configured 
--without-default-devices are *test* bugs, not configuration bugs.

I didn't check if _all_ of the patches in this set should be dropped, 
but most probably do.

Paolo

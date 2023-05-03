Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2984701ejm;
        Wed, 3 May 2023 10:19:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7R3Y/Fu6c/mOBucs4hwfSzVtXzUWwDR4Q/NqDVVUIX3z4Bl6KA7BDU6n+ou6YhRbGoKukO
X-Received: by 2002:a05:622a:1702:b0:3e2:1005:c6b with SMTP id h2-20020a05622a170200b003e210050c6bmr969116qtk.22.1683134340610;
        Wed, 03 May 2023 10:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134340; cv=none;
        d=google.com; s=arc-20160816;
        b=mHTcvy4W+Bycadfp2GxfFGE1jXPB6uG7cBKIyS5wwFGwKWzfDKjFmeqhFIwn48v7s6
         0usFC5kIuPPZLyBpE1yOtql8n+JXX5EPMJzsstuG4paqn5h4kftxm1tgMs3pGbYR48wG
         fZGGTx0z3VJXeB9x1vF5FWLypO8HG0W8gvoFBdKza/tGjCE8g/OU1cAVkJfjc9CSjUk7
         5IGVU9R/0Kp/PzO76qnNK4+GyYVLCo7rwk7Xyh6FtTDRsH1yCtll6CwjbYB2aobFyRn6
         BzTn57+WT6+wNOvihc9ht+f5ZF0A9k0S8iCs2SejG0PpT+tiJ+IkJDrhx3pl+sF8/RrI
         7yYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fphXzwhs7pSTOqa+5xPNLSnrwd39TLSdaiyQVlcItcA=;
        b=cyudZwUX8vkwCpbKP78+z+ctclgMmnWYwWG6LYn+kXx7vjsE9ZRUsFaOxE8QXVOSwS
         uMMIpyh/1HvULCol6wDjj8OGgNfKSCYR4sTLQYXPne8hTtoE68knIDru/YnMvGWYGp5v
         +2JRiXfr3PFN3vNhry2Paylgwf71RWdCrPTPoU8nY2F814IkowC0ejoTYR41YvCd8aUq
         VuXoZ3StHceqVHFuXmKjVpYjsm7cCZIMkorO5K/5PNpiR7lsV2IKow9XXLtgoJPfOx1Z
         oEA3XjKzf6w0cctL94wQc38Ck93QK9ODuhaKlQtEB+hNaPZDMgLzBuqNWl/dz492rALF
         Ur0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PAXzKfbq;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u9-20020a05622a010900b003ef2ffb9611si18946669qtw.466.2023.05.03.10.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PAXzKfbq;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fphXzwhs7pSTOqa+5xPNLSnrwd39TLSdaiyQVlcItcA=;
	b=PAXzKfbqvs8ZfEjfvYo8L1/atcamV0xICj8ZTqFDnibzGDx10nWbIMEJoZYVr96K0TbdJg
	7sv0E69Evuo1Zco6UBHOezWjcvWG2BCfIw0pnGmdvBoba5Lbm1AqVuzgTLNFgLNy9JeMC+
	jPurBd1oBPoT0fYkv7ghM3qg/dnb8+w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-DNl5RkAMPOa8TS8D6e3kcA-1; Wed, 03 May 2023 13:18:59 -0400
X-MC-Unique: DNl5RkAMPOa8TS8D6e3kcA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bc1a01cffso4356783a12.3
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134337; x=1685726337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fphXzwhs7pSTOqa+5xPNLSnrwd39TLSdaiyQVlcItcA=;
        b=REJjtIZLRqCwf/TETIbdsunZ2RTk5tqCmxLb3XUqOfslbICkzvroYAvmsAcl/QGv/T
         Rdnb3K5PCXHp4l01wnaETp1q3doLac+veg66lZkLWoXsUfXokl+TE5hjsPNHarSNUeXb
         ePGPAGwybKoZ9zlCXJtyD36e+sOFbu74EON9E2C8lp5C9FAHjVZeSasLjmcCQkUMJc62
         qYPwifSpwqkAgBmcFOJYfNV1k9kbkri01t3MAyGIlub5WcQ+OVFAjhAF+RRwi6rMDZfv
         OnMe6VDNXCNcEBjvO774J9dQxhdgKJVB9Sua3ilmT+Ptvzhsl8MJFzuP4J/zMH3Ur773
         po0g==
X-Gm-Message-State: AC+VfDyyKnQA2Xc+RUhralhRSiT31TRl8JJvc9dKkuoFvDoiWm/BbRUs
	a0SMgILYLcwtKFtYmojAV7zS2NoIoRDRT347NRZ0ZJ7FsBjtL6jJtf353z7BMU4O0u1EKr1yd75
	GH7wj2Cmq7c9FTpq9slCqOHfKAg0rvG1SgmajW5m+iq7u8/te5PjDxkPyzxSv8K04LLxs5qZkud
	MX
X-Received: by 2002:aa7:c743:0:b0:50b:ca1b:adeb with SMTP id c3-20020aa7c743000000b0050bca1badebmr7618365eds.0.1683134337083;
        Wed, 03 May 2023 10:18:57 -0700 (PDT)
X-Received: by 2002:aa7:c743:0:b0:50b:ca1b:adeb with SMTP id c3-20020aa7c743000000b0050bca1badebmr7618307eds.0.1683134336640;
        Wed, 03 May 2023 10:18:56 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id i10-20020a05640200ca00b0050bd9d3ddf3sm897974edu.42.2023.05.03.10.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:18:56 -0700 (PDT)
Message-ID: <0f247f08-c025-9574-940b-668d1203a73b@redhat.com>
Date: Wed, 3 May 2023 19:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 14/22] hw/loongarch: add VIRTIO as a dependency for
 LOONGARCH_VIRT
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-15-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-15-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NrH66gXDiRvc

On 5/3/23 11:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>

Also not needed:

bus: main-system-bus
   type System
   dev: platform-bus-device, id "platform-bus-device"
   dev: acpi-ged, id ""
   dev: ls7a_rtc, id ""
   dev: unimplemented-device, id ""
   dev: serial-mm, id ""
   dev: gpex-pcihost, id ""
     bus: pcie.0
       type PCIE
       dev: gpex-root, id ""
   dev: loongarch_pch_msi, id ""
   dev: loongarch_pch_pic, id ""
   dev: loongarch.extioi, id ""
   dev: loongarch_ipi, id ""
   dev: fw_cfg_mem, id ""


Paolo

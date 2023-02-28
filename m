Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5486288ejc;
        Mon, 27 Feb 2023 23:49:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+o5u7jOIuw2iODNw7FDLYcD7hQ9jFmnHNSUGiJa1sU2J0mceGT/a6G5tWh6o+MzHJq2vB2
X-Received: by 2002:a05:622a:1015:b0:3bf:c178:587b with SMTP id d21-20020a05622a101500b003bfc178587bmr3450552qte.47.1677570554894;
        Mon, 27 Feb 2023 23:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677570554; cv=none;
        d=google.com; s=arc-20160816;
        b=Hdo3rQaBo4JA/UFFvo1JzFKEca19dKQhVCFG3LFZ5cJdoHlCfMutkW+2KPr93OEBTx
         HPpCg2recy1yEyU6zNOjxyHlKwga18LWUiaMsEGz3fIvW5XCg0qnYsgJIKLyxR0/WEoO
         WnfbamClUcJ92dbCXKnPISV1tWvoTYSN2pLXFHq1H6IapkyxBjJROgyoclvj4hGKdqL3
         KYZCIAdbFSJ1PqPE8OdL2G0H3GSMO1udD0qsTO6AXnI0pmr4Yc5MH58DOqtDQ6MS4taB
         JJ3cmu7bG37d554zmuy6Cs7KrwRVVvdX87T+N1bJvbOlJ2c9ICFC38giKAtkE1yhGS7P
         +VxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
        b=0Djj3AT1F9KCgmd7dPw4M2EbvXlVITw6GdbuuEeKRjb70pIl/Y7dJ30RRGg4uwyx/u
         cRaDv7BnZRW1yq3QmTTSmePv6/+NhfYsAuCWZWCKCbh9iBTwIj5nfXNDjRJpLrCzb/LD
         /Gf2S5NiCOPvS/FIIhhPhuXjmIdv9uff7rxyPKfR6b/bbfx9gpVktjOgylKHoGxsGB9C
         yUaTIKW0+dsgRCR0txaK9e2x6ImQkRXYKjeaLT04ql5tIl/2F2VMLZM4EZYRplRVN7/9
         yEc3oba1tiZZku9gZGE5kQcFdGmWKPSaxi/DdLLUrtkELl1hOmhHK373yWJn4n12fOm8
         kmmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AqMs+jXA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s5-20020a05622a018500b003bd0ad1047esi8391089qtw.375.2023.02.27.23.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:49:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AqMs+jXA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677570554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
	b=AqMs+jXASDuvRsYLsm9vBqXOpqG+VFdEHzoQWsyAx9ppo20el6MZPJi2oqcm5zOHvklxTJ
	JR1DwG/YdOGeblzPz+bTZG8Tr7ioz5y6C4unb237VaoNBsqbmwDJ121XAsUpX3b2brnbQi
	yOp/YY9d1h7FLuQVvueYPO3CVNHHqYE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-YwQTs8AWMMOPQms0zZWpUQ-1; Tue, 28 Feb 2023 02:49:12 -0500
X-MC-Unique: YwQTs8AWMMOPQms0zZWpUQ-1
Received: by mail-wm1-f72.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso6543782wmc.3
        for <alex.bennee@linaro.org>; Mon, 27 Feb 2023 23:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
        b=EiTGIXK6t164mkzz5o7NR7erclt40+xH9Z+17LS9SLp9MFclkopSEs4UOoPJlEN5mh
         LduPM+OdULfrmrQwBrcrSWX02oGBW5v9eY5aRoimlnpUdffRwt6QPmnb40efTUaV2PuX
         DGmqCidh9p9UQlldy+p9qRuGHvqkph0kHCcNuaNP5bPFy599ObavsOgwFVrYpHscgo9u
         iZ8KDs/+4+WS+QThVyTGwWomh37VhdvptJ1bojDn2bXeWSs3MULJyGcA4UmcLKk8uQWu
         CojvhDX5MQ4urVse5D50Yv3k2qG09yoWOZf0bBDUEN/QIDwAlI+mAJn9R/3HDCLI2yWb
         d7GQ==
X-Gm-Message-State: AO0yUKWLdgllkNgpZO5/a+G62FT7KJ5xzR9T3hvRZpg9Pr4LJFOj2rTz
	IxwX67oeXIEboYZpcSERhV5MKRJDz6x/NclWdgUJu5upbKBK1aBAYky5VzeW5tH8YLlQoS4O5aa
	mTiojtSNXCrdWlhP4
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id m38-20020a05600c3b2600b003eaf05b50ccmr1675993wms.8.1677570551834;
        Mon, 27 Feb 2023 23:49:11 -0800 (PST)
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id m38-20020a05600c3b2600b003eaf05b50ccmr1675985wms.8.1677570551536;
        Mon, 27 Feb 2023 23:49:11 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de. [109.43.177.75])
        by smtp.gmail.com with ESMTPSA id l16-20020a5d6690000000b002c559626a50sm8844011wru.13.2023.02.27.23.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:49:10 -0800 (PST)
Message-ID: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
Date: Tue, 28 Feb 2023 08:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x3vnQTOC37IL

On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.
> 
> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.

Note: We're talking about 32-bit *x86* hosts here. Do you really think that 
someone is still using QEMU usermode emulation
to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!

> In fact, keeping this support around forces correct use of
> posix APIs such as e.g. PRIx64 which makes the code base
> more future-proof.

If you're concerned about PRIx64 and friends: We still continue to do 
compile testing with 32-bit MIPS cross-compilers and Windows 32-bit 
cross-compilers for now. The only thing we'd lose is the 32-bit "make check" 
run in the CI.

  Thomas

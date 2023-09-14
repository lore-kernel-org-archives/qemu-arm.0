Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp628989ejb;
        Thu, 14 Sep 2023 09:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Lc7ian8WkoqiV3vh3GALp2AMF+5jWMs9UAiiar+Sgi1lXBP34gag47njtF/uqk3hV2iI
X-Received: by 2002:a05:622a:253:b0:412:206b:92e6 with SMTP id c19-20020a05622a025300b00412206b92e6mr6522498qtx.16.1694707827331;
        Thu, 14 Sep 2023 09:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694707827; cv=none;
        d=google.com; s=arc-20160816;
        b=IZ0FCPaKeZFRAu6MuH2ot/ewLmUlGmK59CczhezIeXtDQ9qAHtMPixSdwFUTTKv9Zk
         1JuP7ctOjyG3KPoq+bBwTB7MASF9RUn/LhWnVoArP6RGWDVjPv687CTb5dmvacZUzxaj
         fEg4LVas5+eDTPRmqUhWkqmVytWIn1Kt6ushG+U7QRz+GUgmw6B/quxfxh9L6DhYzoBd
         rj1Ywr3f0uQV187agXJF93zWurtDMBRgOcf6PIbZkRP+OXsqewTjGgPA4o/4vnRShRto
         kB39ZwFYB1SMM5jG2/HehdGt8tOmCNY9syWkKMNaFLoPI/vzvolk5xDbJevNUbcj2clZ
         9ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YYnwQm6o9VtmknL+4X1Q0U1hzeJNypIOW9L9vbJFV4I=;
        fh=VWwRjF1mPJFQ+Gjn4Pw3tyjgI+BVToY363u4XklkreM=;
        b=stiNl+5mKf7IvCEF0zq3mpdcjdL5Rhhs4pjFuqVGcgBapRqi1ugnT6WVCsVWPUelWA
         dsRJe6mt2yzNJatNnTPkO9f7igzfcXQmqBIOGezDbX7BkGpUcfibIF28l/UAk7IxPoDj
         3R/Eb0WeWrjqKJhdxdj+0/Bf0PwsfMkhhCJeLYQwZNPBi+SHWYY7r56drZMzUch3AqTC
         G8Qv7qj9wcYvXqwpdJqm7V95B5Yu2mlgpwjIr7d7DTPhsjxiK57po5WsisZOKSql4cNY
         IqIPunkDdsMhnYA9rwCOkfOUfo9piOxof8fTNbbu3D8Z1Z5dfNke/JdAg4CMrCFI8Kbl
         5l/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hwonlfby;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u21-20020a05622a011500b00411fa31de8bsi1080411qtw.200.2023.09.14.09.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 09:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hwonlfby;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694707826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYnwQm6o9VtmknL+4X1Q0U1hzeJNypIOW9L9vbJFV4I=;
	b=HwonlfbyNv43apdcKpHKrlQ4535ebqBK9StDiD0lz85sNbcPBfeGy6OVg+F+ugVFyvGe3J
	00RJ55ooRkCUES8UA4An/Z8tSScK/koacj3eqrRn12ohwUwPnsPzLTjndVKAD8oAgWlla0
	gABDtaUQI3StIYrhECRxIE0lUQ5OxDk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-TPC2EeX6Nriuiap_XZez4g-1; Thu, 14 Sep 2023 12:10:25 -0400
X-MC-Unique: TPC2EeX6Nriuiap_XZez4g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so8850415e9.3
        for <alex.bennee@linaro.org>; Thu, 14 Sep 2023 09:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694707823; x=1695312623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYnwQm6o9VtmknL+4X1Q0U1hzeJNypIOW9L9vbJFV4I=;
        b=MOycU8u84lu8I6da4QgypHH0f68ORihAy52WTRA7IRCjYE6GqfSQEBUV4SVFfGqpTv
         DyJf4Uj3NFNgDUI6A5zSTJI1hme2aFGdvPoqnY3GdaNGwuRlB6AGVFrjeBgftRZwwnuB
         XCBaB54gLty8Fy+vuezrdUl1f+yL02rYN0yB4FkBkehndz7rdDx3LwWx69gCcRq/YREO
         oHATfzn0+cdzYbBQUvPd6dasPNAOJj0lLuSU1F+GhPOe9+zTFC9Q/D9YraIUx9tF5u6o
         omTkU8wmCIyQknFiOFH+QxGsCC7687bnwMbmx2Q3S66VFVqmJIWhO35p0GzRoK3dUcXB
         SLqw==
X-Gm-Message-State: AOJu0YwthZEIbPcHr+gbms/iDejjjzTDwapCFO4ZGn6OwxNSvaiEhJKn
	/MjuuqZjRT69Hb1l0EBvrGG2wNiKfvUsPnAACzv11rhbeXLMZJr6p88ze9P/tcUAldSnY0zTD3d
	bmxYJWwIGOB29QAFCjYJ2+Ne24Ss5K9+tnUITz5/zazizmdPouSpG6vySSknEivi2wX+OkEkaUe
	A=
X-Received: by 2002:a05:600c:2159:b0:402:f503:6d1b with SMTP id v25-20020a05600c215900b00402f5036d1bmr5146692wml.0.1694707823438;
        Thu, 14 Sep 2023 09:10:23 -0700 (PDT)
X-Received: by 2002:a05:600c:2159:b0:402:f503:6d1b with SMTP id v25-20020a05600c215900b00402f5036d1bmr5146658wml.0.1694707823079;
        Thu, 14 Sep 2023 09:10:23 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-28.web.vodafone.de. [109.43.179.28])
        by smtp.gmail.com with ESMTPSA id l12-20020a1ced0c000000b003fed4fa0c19sm5208550wmh.5.2023.09.14.09.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 09:10:22 -0700 (PDT)
Message-ID: <00b3aa99-8ad6-27e2-2002-208805ee0196@redhat.com>
Date: Thu, 14 Sep 2023 18:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/9] tests: update Debian images to Bookworm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230914155422.426639-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x/hJ0s+t66Jy

On 14/09/2023 17.54, Alex Bennée wrote:
> Bookworm has been out a while now. Time to update our containers to
> the current stable. This requires the latest lcitool repo so update
> the sub-module too.
> 
> For some reason the MIPs containers won't build so skip those for now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../dockerfiles/debian-amd64-cross.docker      | 10 +++-------
>   tests/docker/dockerfiles/debian-amd64.docker   | 10 +++-------
>   .../dockerfiles/debian-arm64-cross.docker      | 10 +++-------
>   .../dockerfiles/debian-armel-cross.docker      | 10 +++-------
>   .../dockerfiles/debian-armhf-cross.docker      | 10 +++-------
>   .../dockerfiles/debian-ppc64el-cross.docker    | 10 +++-------
>   .../dockerfiles/debian-s390x-cross.docker      | 10 +++-------
>   tests/docker/dockerfiles/ubuntu2004.docker     |  2 +-
>   tests/docker/dockerfiles/ubuntu2204.docker     |  2 +-
>   tests/lcitool/libvirt-ci                       |  2 +-
>   tests/lcitool/refresh                          | 18 +++++++++---------
>   11 files changed, 33 insertions(+), 61 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3496702lfa;
        Mon, 7 Jun 2021 06:33:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFkE5Uw0aMs7wJZta43OfJGPWzZPC4W1JMy2o19yg3EXmfh4mk7uhJk7mwAWiiIvs7AlIp
X-Received: by 2002:aa7:d305:: with SMTP id p5mr14261226edq.167.1623072795481;
        Mon, 07 Jun 2021 06:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623072795; cv=none;
        d=google.com; s=arc-20160816;
        b=Ok/EVVo5f62h+vcaeviQ+ylKaD80Embvxl96z5qSrU6eYWmhPMiZ9Ei9Swk7F7a91h
         bwqZ76U7J3oj4f/bcr2t6+DeDfIVowX6S4dn1TaV8AqqawpAo/WStvn/RkTeLj390OdD
         3VCPrri4CC3F80n+7yBg9HRwvWrRKX7iiaEnOYp3UXkInDjlwvK6YzbYqpvgWxIzy7ZG
         UvpSjKH/OYIgTplOWBED/iveIF1/RtMhuKbwRUmnX/1Bjpvp9gq9vPPW1Nwyx2haszsO
         Dh29er250xqKDVGXfBVRZdLZHEBxHLcDs/GyMQFeTWmkWwKki9n8J8Zyzg0Ts4gs2Dbn
         JKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=bH1VJmI0r7CrFal2IOQrlbioO4h3kMcx1mOQjEXrGns=;
        b=YUwLVCy98Cv2656Z9J6aAIM5de5MgdCyRFvTnH/nOPv+SaGOZxOMg00aOBw/CIaVPI
         9E0T2sVTmMsRS3nd9xYYyImxzobHpnynF6Q96fyOPbr6WVEWNngpgK9mK9DENsqZb25f
         zBlHC0+v+/Y+MTM3qEC8orgvg3KhKwR4KFFxR6CWDIlADbGp12svDvMlg8xqAqVHLujC
         p3fuXZiDhG2RNBTjTXbaojn+sEAnQIsaHPym2QsFJaVAxCWyeTdP3PyrGwWnY5ZgI6wD
         4jJjBDJKmpEKB69/0cSsq39IZTEQZzCIO/QemLZaaBeJ9gIcYTzP39MiDhgGmRZ7HLMg
         myhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zmdsj3rR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k13si12164219ejb.687.2021.06.07.06.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:33:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zmdsj3rR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623072794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bH1VJmI0r7CrFal2IOQrlbioO4h3kMcx1mOQjEXrGns=;
	b=Zmdsj3rRpVhMgqLSWFj0liaWsBKH3M5uumN1AgdEKCm2O4YKd58V3WXXfq0yTAzyGX1tdf
	hYKl+4fhI1cNu1Qz9j4lH8dNiIbZIY9sno4CAAyT8/ZhizOnSW6GCRixCrIKMorU8hS+HR
	12tOD+eSOSu8MdxTTnl+Nfz4R7h/ucQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-IRipdDK4My6WQWbX8uVjiQ-1; Mon, 07 Jun 2021 09:33:13 -0400
X-MC-Unique: IRipdDK4My6WQWbX8uVjiQ-1
Received: by mail-wm1-f69.google.com with SMTP id o14-20020a1c4d0e0000b029019a2085ba40so2341932wmh.1
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bH1VJmI0r7CrFal2IOQrlbioO4h3kMcx1mOQjEXrGns=;
        b=tTljanWqNk+Vzy5l9ufx+5E8NCGoHJVg/vDXyRXgJ8k6oSr6sntM6WXyhDgLrZp8Rn
         zCLxZNuNx1SNuqFN22NS0YfQRzuk3ANtlTjsVjbk8+8oE19hSd9Y0Np6xLloLvEwGN6C
         IZ+rsmwxiMVYET84nRt7ABOh610XPzwTZu9jM66gxRtY29ou8Be44vNO0ejhyzCxNTOZ
         iWSlzwCrdlKX15YVFAkQfV1cMg/9gSvxP9TFfq64awsAPevFMNBQy7o6SU6TelWQiQna
         MvN4vZoHm/ZuGBBQ3KRVnqTmIDJgchOh1H0RjpDqibZya3rZ2MJQCLtQi/7Yc87ftTqE
         hSlg==
X-Gm-Message-State: AOAM530SG2L4cP2qXKxFTiAjAfP5Tfdi9DAxNLcd8tHn4Ll7zCahJSoC
	xsdgmUGEjvUWkCrRPOqI/j96iE1VEEAlNQe2EV1qOpe3bfFM9N83XfshvT3OAGB31QhAidk8ktB
	2h0yzYWOWhtmRgnLv
X-Received: by 2002:a5d:618f:: with SMTP id j15mr12283397wru.348.1623072792169;
        Mon, 07 Jun 2021 06:33:12 -0700 (PDT)
X-Received: by 2002:a5d:618f:: with SMTP id j15mr12283378wru.348.1623072792003;
        Mon, 07 Jun 2021 06:33:12 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id m21sm12056334wms.42.2021.06.07.06.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:33:11 -0700 (PDT)
Subject: Re: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Cornelia Huck <cohuck@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6513579d-e6e7-5c20-d016-1d0cccda7c08@redhat.com>
Date: Mon, 7 Jun 2021 15:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-9-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EB9Y9AfX8/7f

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> We might have a s390x/ppc64 QEMU binary built without the KVM
> accelerator (configured with --disable-kvm).
> Checking for /dev/kvm accessibility isn't enough, also check for the
> accelerator in the binary.
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-9-philmd@redhat.com>
> ---
>   tests/qtest/migration-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

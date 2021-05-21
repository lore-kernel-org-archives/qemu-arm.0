Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1352766lfm;
        Fri, 21 May 2021 10:14:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/P2i7hgpaSwsC9dbOxtOCTRdWnl31Gs5dYU6XHbVAKs46B7Xa70RT5FdxH6gm2KZLoYrP
X-Received: by 2002:a50:f385:: with SMTP id g5mr12607858edm.222.1621617280157;
        Fri, 21 May 2021 10:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621617280; cv=none;
        d=google.com; s=arc-20160816;
        b=Xev0zD13riZ74n6LHI2PjMyBetzZ3VM9fbMfy6X0Ad9m2SHctLSkO2gKEHAZIiRfcW
         gohOEDL8lX5R1shyW/GFipQs8LuCxEqT0wFAfKga0IVvM5xADC0MWF3/GrhX+KMVsuRx
         de3Ph5Fu4tFDt1b2XhQZsydAIHAhuxEeif8xf1MvUp/wnaNsttE9zyBaDABWGkxuWBXi
         L+jZX8RPJG1V2oC4G6mGwB0nEaQfXKXfmUpGCqS11Orqo67wGQN61KLT2CLaByDKwkhl
         5UOzPLGK/fVFidQokjTrGrevghsIyBMzloXinAbENT/GLnm73rQiHYeluxc0+RwdvsiB
         CmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+FoosSDU/lSKeNqty24UCT+ac/QMrro7F8FCHLUQHGY=;
        b=MrBZHjhToq7On2JrmgE/ezYGBInw6l2k9LMXXeWXraxvz7tB0ntZpDz4krCIcXsNGG
         GTEDUQcLX2kWGY4+U1xKaiERLUM40kYXoqYSPw39ohZA7ex/T7uiUa2PiQTKQK9US/nY
         /amDyulKThGdtOAhryP5eW4RYheHfI2iDxPMeuPYcelOgyyfN0UGJAphquL/xDIrf9mw
         x3IZbUjsl5WzT31fJhgIdmhTEB45+GVMXNRTpqdLtxAvL9h9nE0zgSDX/tiuAeJwwJuV
         cydTSJPVotFu3nGcfCOxhIhuhY9qwU4iAn9gHfbNxzZmGl0SXuMyx7bEmaw6z9qhbCCr
         B5TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WUYsZKf1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q23si6054333ejd.116.2021.05.21.10.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 10:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WUYsZKf1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621617279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FoosSDU/lSKeNqty24UCT+ac/QMrro7F8FCHLUQHGY=;
	b=WUYsZKf1Kxq6TE0oQQv1rah1vvQC/Ng//VB4h4ehip6TVdlklz1F4uYTGzQZ3C4/61NHbc
	waS7zW+WyazoJNIvgJu8zHVddH4NrOf+0ETiuJsC3OCgvWgrJyFGo7k9f3pAXMje7m5WhX
	7FahHast4xFkI6TJkA34hqu09ORMjgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-JJoj9VMNMdKtvJCr-YEHig-1; Fri, 21 May 2021 13:14:35 -0400
X-MC-Unique: JJoj9VMNMdKtvJCr-YEHig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E86BBEE6;
	Fri, 21 May 2021 17:14:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DDB92B45C;
	Fri, 21 May 2021 17:14:28 +0000 (UTC)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
Date: Fri, 21 May 2021 19:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: C7QsDdYCI3oR

On 21/05/2021 16.29, Peter Maydell wrote:
> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> If you think these tests belong to tests/tcg/, I am OK to put
>> them they, but I don't think adding the Avocado buildsys
>> machinery to the already-complex tests/tcg/ Makefiles is going
>> to help us...
> 
> This does raise the question of what we're actually trying
> to distinguish. It seems to me somewhat that what tests/acceptance/
> actually contains that makes it interestingly different from other
> tests/ stuff is that it's specifically "tests using the Avocado
> framework". On that theory we might name it tests/avocado/.

I think there are two aspects:

1) These tests are using the avocado framework

2) These tests are downloading other stuff from the internet (unlike the 
other tests that we have)

> Or we could just leave it as it is -- is the current naming
> actually confusing anybody? :-)

Yes, I think "acceptance" is rather confusing. So far they haven't been part 
of your PR acceptance tests (well, now they are part of the gitlab-CI, 
though), and it's also not about tests that have been set up by customers, 
which is what you normally think of when hearing "acceptance tests". So a 
different name would be adequate.

I think I'd vote for either "avocado", "avoqado" or "validation".

  Thomas

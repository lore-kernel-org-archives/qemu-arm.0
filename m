Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp861833lfq;
        Thu, 24 Feb 2022 03:39:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGE1JUWCTc7BKmbTMwqu5b7otPS67oj6KEqolrtFMB4JEuNgFGKKhZzUwcytDLhUHVTQCM
X-Received: by 2002:a05:620a:1399:b0:648:af4e:6560 with SMTP id k25-20020a05620a139900b00648af4e6560mr1264840qki.537.1645702765146;
        Thu, 24 Feb 2022 03:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645702765; cv=none;
        d=google.com; s=arc-20160816;
        b=GACHBCO8EOj7uyK49ZobfQ2hc7sIfXsNgSeGJM0UU/n9PEM9WkUNJdyLAUqsfH+VZj
         797BNHlW4yYZQ76ovXtX3fgFrABqpB2ZUYQVefOPMmh3jGgZscu7DxbW/8iN4mXlOvZA
         DUyZ5ihDeWbCka3UPBwXsN+FMcABwN7Zb0g8iwWw6m8we/1P8Pm0346bTs6I05AplqMN
         kpFRSkVwgywQDFb7+6aG/kkC9g4ZxJMofQPTLMs1ywRWq3DMegScaoPQHziHss96z0TK
         22QfCSBKXssoFwHfB3rRVOVy1pYr3MlqDgQl2//QFbF0uQFXPW+ds1AXzH0rGlQzMzYU
         Y8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:cc:to:subject:dkim-signature;
        bh=WPlyPN2IhLvd384IKcTjznOHTrNObUr9DIyQadnQ+EQ=;
        b=I8lI5sZGkSEwtOoJspqhl5kBlxQKaY0UCJUhlz0vNHYNi982Jw4ReaPTw7EVZ3IyHN
         CqZaJvcVRJMu52AMJdBbPoYF9e7LQalpL0uzv+66UUhPDE13bPvavOFbtUQdjOm0zX+f
         DrL5VZKN3ZbL0WPhTPZ/JcGpAvxhaVzF7OMhPA0KRNTHJ1mbIm+SNst1IPLcd5Ug+Zvl
         9vr0739kH0IUj/BWpiwflvVQW/4NFXesX3cw/+Kbnq9YDfLxwFOoQe7qAV/5d1hDW7oz
         BRm6m6F/eYWNSR/V8+yphISgfo3aR+OqfxrYQqnAQdJ/sBXFf+Bdc87p/HpfmRoreNdb
         MMAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d+BfgsGu;
       spf=pass (google.com: domain of lersek@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fv10si1390779qvb.464.2022.02.24.03.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Feb 2022 03:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d+BfgsGu;
       spf=pass (google.com: domain of lersek@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645702764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPlyPN2IhLvd384IKcTjznOHTrNObUr9DIyQadnQ+EQ=;
	b=d+BfgsGuTLbEIFJ0Umrhc49zNInMFz9/UBth8Y9PlVnrOFbBmAofMM7qOuBtj+ndN86nJ2
	gaGG4TyLlV8WU9aZhya7hTosSmN03L8leg1cskkYuUFu9OD3CbRSCj+6qnLK57oohf5YpF
	axDkhoVtAE9vZlp1bT34H2St/LPKniM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-WBQssRukMey5Pr0Bla7O3Q-1; Thu, 24 Feb 2022 06:39:21 -0500
X-MC-Unique: WBQssRukMey5Pr0Bla7O3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19195801AAD;
	Thu, 24 Feb 2022 11:39:20 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.194.86])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07619100687F;
	Thu, 24 Feb 2022 11:39:15 +0000 (UTC)
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <cleber@redhat.com>,
 Oleg Vasilev <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
 <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
 <20220223115042.lvxgrjirr5avzkzw@sirius.home.kraxel.org>
 <20220224101020.2dd35c16@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b1dfae81-6286-9596-fa2d-860b85f37a52@redhat.com>
Date: Thu, 24 Feb 2022 12:39:14 +0100
MIME-Version: 1.0
In-Reply-To: <20220224101020.2dd35c16@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Z13cOTK6PAcA

On 02/24/22 10:10, Igor Mammedov wrote:
> On Wed, 23 Feb 2022 12:50:42 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
>>   Hi,
>>
>>>> Also, "make install" installs these EDK2 images, which doesn't
>>>> seem like the right thing for "this is only for one test case".  
>>>
>>> Well I'd prefer we never had them installed. Today I don't remember
>>> why it ended that way.  
>>
>> Probably to behave simliar to other firmware, which makes sense to me.
>>
>> So maybe do non-debug builds for install and debug builds for the test
>> cases?  Why do the test cases need debug builds btw?
> 
> wrt bios-tables-test, it doesn't need debug version and should work fine
> with non-debug builds.
> (if memory serves me right it's this test case that prompted to add
> uefi images to qemu)

Yes, commit 77db55fc8155 came first, commit 536d2173b2b3 came later.

Thanks
Laszlo

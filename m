Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp62052lfg;
        Wed, 24 Feb 2021 21:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOKqoNvHGDYbTzBoJmjyGvQxJlSv/2sPJCcIopaiI2Wp9K1JbRbSGEVHyVuG+IQzXj6XvG
X-Received: by 2002:a05:6402:2712:: with SMTP id y18mr1229540edd.356.1614230600139;
        Wed, 24 Feb 2021 21:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614230600; cv=none;
        d=google.com; s=arc-20160816;
        b=xZEuhcd+BAu0q6xyufW8ZByp0vTXrRp0BdDZG6Rrrz1wcRYcaXgXc2udwAfTb2evQx
         I7vujz3rH9LonZ7aUqOFuv6RRUpHVReLOC51gyigoSyiq2xpD32MdXd8DzRcuMUMoFr6
         nHi2qV2IHvIYlxwg1ho1uxUQrCfC+C3cRRVQ/i3z3EyAgZDMJDVLFmB6Yo8NT6c2yFQY
         zWOOpq4th0qYpDyEZNXHPSZcNUCY+8kB06PS8UV3sHxfG4etYmgn6tNT2GklF/sjXmdA
         //MtGbRV2c6JrAKsKmEhtgm2vEd1XDiUCs1APGjf9RkrMA/TMiJnTh0NbEh5MeoIDVX6
         sLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :dkim-signature;
        bh=pwBcXHb9E686y+CIs2UBzvu2ZE1D11zfSRqUS/HZL3I=;
        b=giwoNxIaS9E2KXgtm+tzj6UpEWTaL51YJGIjhwLCepznrs740OLVZ78BYp5+zoSosZ
         t3DnxnF5g5epC7wBjG0gun93yGiHBdV2tLRswA9PjmayLHwuH1IOLtGC3uLx/sjoBa8o
         2FrpSwCNwCfVD/FK2jbDDaCvvSC1OD5DvS2ySenCmLbCcc5D5LFsvFc1Inhz9k7pT7zI
         zTeIDThKseRvpF5dlc1fh/VThpZZMENfR446gUEsps/atFP9gCQzyZ8+tYoks//9rVmc
         cRN95Rgy0ITGHCQusjNG8mgljr7F7JPZVxRqf5g3FlMlXStj1gW2tbSjciL5Y/Obir/4
         aY2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KOCjAL5D;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p26si2669123eji.740.2021.02.24.21.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Feb 2021 21:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KOCjAL5D;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614230598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwBcXHb9E686y+CIs2UBzvu2ZE1D11zfSRqUS/HZL3I=;
	b=KOCjAL5DK3O/J0ae0/bca1OcoHH+k8cj7fiefhlfayphejUZGu90ypu1rWPWG+mnQAgsCm
	Nhc+JOTGsGpIX8Bk92NYt1yvokes4Pg2wUVWryXyJ5IrlS9pZIh+dqiRxbupnXYNikUMGm
	ubLjPiELvn4rrau8THpSgFafgmagR7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-z4wusYZJPI6PLOAVPELIxg-1; Thu, 25 Feb 2021 00:23:06 -0500
X-MC-Unique: z4wusYZJPI6PLOAVPELIxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B12801976;
	Thu, 25 Feb 2021 05:23:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A5DF60C5F;
	Thu, 25 Feb 2021 05:22:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
 <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
 <6309e75e-2aa4-5bc1-66be-0b29f408f179@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
Message-ID: <5cd02aba-b76f-d12d-9ea1-ec6b84107f16@redhat.com>
Date: Thu, 25 Feb 2021 06:22:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6309e75e-2aa4-5bc1-66be-0b29f408f179@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8WUETCHYvwWy

On 25/02/2021 00.10, Philippe Mathieu-Daudé wrote:
> +Thomas/Daniel/Alex/Peter/Paolo/Stefan/Markus
> 
> On 2/24/21 9:02 PM, Niek Linnenbank wrote:
>> Hi Philippe, Cleber,
[...]
>> Indeed. Just this morning I received an e-mail from github with the
>> following text:
>>
>> "[GitHub] Git LFS disabled for nieklinnenbank
>>
>> Git LFS has been disabled on your personal account nieklinnenbank
>> because you’ve exceeded your data plan by at least 150%.
>> Please purchase additional data packs to cover your bandwidth and
>> storage usage:
>>
>>    https://github.com/account/billing/data/upgrade
>>
>> Current usage as of 24 Feb 2021 09:49AM UTC:
>>
>>    Bandwidth: 1.55 GB / 1 GB (155%)
>>    Storage: 0.48 GB / 1 GB (48%)"
>>   
>> I wasn't aware of it but it appears that Github has these quota's for
>> the Large File Storage (LFS). I uploaded the files in the git LFS
>> because single files are also limited to 100MiB each on the regular Git
>> repositories.
>>
>> With those strict limits, in my opinion Github isn't really a solution
>> since the bandwidth limit will be reached very quickly. At least for the
>> LFS part that is. I don't know yet if there is any limit for regular access.
>>
>> My current ideas:
>>    - we can try to splitup the larger files into sizes < 100MiB in order
>> to use github regular storage. and then download each part to combine
>> into the final image.
>>      im not really in favour of this but it can work, if github doesnt
>> have any other limit/quota. the cost is that we have to add more
>> complexity to the acceptance test code.

Well, if you want to go down that road (which I don't really like), you 
could also host the binaries on gitlab instead, where our CI is running, so 
the binaries would be hosted in the same network as the CI.

>>    - we can try to just update the URLs to armbian that are working now
>> (with the risk of breaking again in the near future). Ive also found
>> this link, which may be more stable:
>>       https://archive.armbian.com/orangepipc/archive/

I'd give this a try! If we then later have to discover that the links are 
still not stable, we can still reconsider something else.

>>    - or use the server that im hosting - and i don't mind to add the
>> license files on it if needed (should be GPLv2 right?)

You know that you also have to be ready to provide all the source codes to 
the binaries that you host to adhere the conditions of the GPL? That should 
be doable if you originally downloaded them along with the binaries, but 
otherwise finding the sources to such binaries can be hard...

>> I'd be interested to hear your opinion and suggestions.
>>
>> Kind regards,
>> Niek
> 
> Some of the unpractical options I can think of...:
> 
> - do not contribute tests using binary blob

That would be a huge step backward to the times when we did not have the 
"acceptance" tests yet.

> - do not allow test image >100 MiB

Test images should not be too huge anyway, but I don't think we should 
introduce such an artificial limit.

> - contribute tests with sha1 of (big) image but say "if you want
>    the test image contact me off-list" then when the contributor
>    stop responding we remove the test

That does not really scale. And how do you add such a test to the CI? That'd 
mean that everybody has to contribute gitlab runners? I don't think that's 
feasible either.

> - have anyone setup its servers with tests source and images,
>    without committing anything to the repository. Interested
>    maintainers/testers are on their own.
> - testing done behind the scene

That's maybe an option for these tests where the binaries cannot be found in 
the internet anymore.

> TBH I'm a bit hopeless.

C'mon, most of the "acceptance" test are just working fine (from the 
"download" perspective), it's just some few tests that are troubled. I'd say 
let's give it another try with archive.armbian.com and if that does not 
work, we can still consider to simply remove those troubled tests.

  Thomas

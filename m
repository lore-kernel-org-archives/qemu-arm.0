Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1378820lfm;
        Fri, 21 May 2021 10:46:49 -0700 (PDT)
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr10561865wmd.47.1621619208955;
        Fri, 21 May 2021 10:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621619208; cv=none;
        d=google.com; s=arc-20160816;
        b=cBPC9ujURTWMrZHuGtfS/3MmqjHXzY1oePYNw8iuC0rtkXd8lq3WceYEp7YJFTDpAO
         wS5sLr1pmrX6bi71tZdT2zy0Bq/M8ltSlu8XOyUgHTY6YEr7CwIhUw5LZ7VoElEy0/6V
         AfEjRt2/XZH46SxK+wkHKMIlPzpQ3TO0JW02j91NlySC2M+/KGQ8R2BuI9lMvwcrs9mD
         NpAd0bDdTWl1RUrZBzKNxzboo4SssuibRZStjE/pRNe3qLWJHy7EQrtwgAtiF73Bs9WR
         upckFjNTMzKaXZ5PaN712jB+QC1UFmTedOwEnOWLAAyMVeDMVaWuj3n2bzxgU5rwjNJe
         2+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=VbAEiIv2LknR+pAI5WWQcRyeE6G+rY08dxfxzzhlsqo=;
        b=LOigq5ynxVwLg9OxipWciKpZ4PCKhZ6+i1tODdU8azydpelpM7dN4o8fgvPsWwg8kK
         tU3gUBaI9tDFGSJBK32uCUciNs5FHX6B+n92bnS+e7HyBkR3sNsdBZpRqRLjzpRWxWwd
         BInl1kVcxnRGMdVZ91NrtjyNmemt3sfy30qhfUQQIKMuuR/wvaT39zfibDQ8Eq54qIaw
         s+MgUTBkIuw7wPA54dqBnAuYEsIxq78OU/Ronvf4OKbMYjjgaKck2Ru0zRtiToL8W7HW
         Bqffw8HJXFbErBF2fItrBW8Hc1G9+YFrtmbgxJwwqZdfz8xbumvF6MtQcFapdJK1nuf9
         O+7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tC7Noqc+;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q18sor1371073wrs.57.2021.05.21.10.46.48
        (Google Transport Security);
        Fri, 21 May 2021 10:46:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tC7Noqc+;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VbAEiIv2LknR+pAI5WWQcRyeE6G+rY08dxfxzzhlsqo=;
        b=tC7Noqc+PnZ5I6A3U3IDFAK5mYS0aiDvtk/uHrJQamszMfyyYaYYurkctxh3pUKTX+
         e+N5kRYNRxJCkfmshen0lStxgbns3HcZ+atsUIoPzVfMz49A8EUVZ329TLbcChWzTZjK
         hc99MtShTSaKOs4J+Ta2UJZKedidyH9zUmPNPywX1c5JREpvTuEK5yhmvULxPls7L7uf
         N2MqmS1RGJ+4K7Np+dXeaX4wxAy+sP+KuwMurdtr3zj4a7eFSiDxBpwlLP1I6XJo/adX
         umHPga6MIdh/5aHiQpxP57hM5LI8W+fO1x+XyBMPSqKulIRC4N5srQqzUuI5Y+xoH8zK
         Ud4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VbAEiIv2LknR+pAI5WWQcRyeE6G+rY08dxfxzzhlsqo=;
        b=UXjFo3wq0z07OPZD+XTu0dPucuewwmXzLopnqUqncYquKQzBpg6XScwIz+eRa9zVmd
         j+9zy+2j18cZRkbdqb65tmzz9tYNd85GsMavnUBpQYsdWW5M40jq0nKzxL9F237Lz53Q
         SIUXWmJ2jkyF49ZSKJDU7n1vFbPC2cYdSbvY9kmCSUOtECKsr0/DZPcpj4WDjBFbCD0p
         t3jkPSfNQbdgHgrvBfsJqAMFgqebUusurx7uFqlHEGhzuTop9GLf3i8g7aAAktI0PsF0
         nJgqIiiKSEnD3Z/k8KG5AdP2hDnZT8qY2w55Eu3h9NGlP+gsf8sjwcnP/O4crDiyO3Pl
         Bfbg==
X-Gm-Message-State: AOAM532zSzbJkL7ams1UDcFCMUbQa5Mlg0rTQMKo/n53uFEFeKt0nD4o
	peBwYt2d8hDl8MJaKdtNKrVTBkT4/g5Sbw==
X-Google-Smtp-Source: ABdhPJzqz52Xe4e0NZb6Iizrr8pR0GH0kVvcUAuCg2RIaRbDRX+Xh2VCdcMOLNtqXDbYM/NPfjl97A==
X-Received: by 2002:adf:fa45:: with SMTP id y5mr11021449wrr.311.1621619208439;
        Fri, 21 May 2021 10:46:48 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net. [83.51.215.31])
        by smtp.gmail.com with ESMTPSA id o11sm2885546wrq.93.2021.05.21.10.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 10:46:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6815ab09-50b5-825c-d565-8fe1e9ed6c5b@amsat.org>
Date: Fri, 21 May 2021 19:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jN7uI0C2Ubym

On 5/21/21 7:14 PM, Thomas Huth wrote:
> On 21/05/2021 16.29, Peter Maydell wrote:
>> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daudé <f4bug@amsat.org>
>> wrote:
>>> If you think these tests belong to tests/tcg/, I am OK to put
>>> them they, but I don't think adding the Avocado buildsys
>>> machinery to the already-complex tests/tcg/ Makefiles is going
>>> to help us...
>>
>> This does raise the question of what we're actually trying
>> to distinguish. It seems to me somewhat that what tests/acceptance/
>> actually contains that makes it interestingly different from other
>> tests/ stuff is that it's specifically "tests using the Avocado
>> framework". On that theory we might name it tests/avocado/.
> 
> I think there are two aspects:
> 
> 1) These tests are using the avocado framework
> 
> 2) These tests are downloading other stuff from the internet (unlike the
> other tests that we have)
> 
>> Or we could just leave it as it is -- is the current naming
>> actually confusing anybody? :-)
> 
> Yes, I think "acceptance" is rather confusing. So far they haven't been
> part of your PR acceptance tests (well, now they are part of the
> gitlab-CI, though), and it's also not about tests that have been set up
> by customers, which is what you normally think of when hearing
> "acceptance tests". So a different name would be adequate.

IIUC the current "acceptance tests" are the ones Peter runs,
which are *gating* the merge process. They can not fail.

The current tests in tests/acceptance/ use Avocado (as said Thomas,
to easily download artifacts) and shouldn't be considered gating;
they could fail.

This is my confusion so far. It should be OK to add tests using the
Avocado framework which might fail and aren't gating.

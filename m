Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3761409lfg;
        Tue, 4 May 2021 09:13:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZMTdkx4qSR/WoqMeULCEzI6C88X6yP/at3e0KfZP+dtc/EMgkpTyYzSCaC0+lneFzl5Wg
X-Received: by 2002:aa7:d14f:: with SMTP id r15mr26451067edo.71.1620144808658;
        Tue, 04 May 2021 09:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620144808; cv=none;
        d=google.com; s=arc-20160816;
        b=xTuSf2owoKXKh8nJkBJmQ3coGcgdCJooE6SPEC1hIIJIwaBmxdhcjVYob9VbPjNQLc
         ObQZNPHLKvoi3LrWdaBaUrYkpRy3VuPlFyrixMD8eGncl+o43o6wBIVgQh1pHx8e54n5
         n7ssPNfeJMJLT2WHeoj5z9kyMqR3wigCpeuHrkeht1Q+8N35smEp4ZbKSgiHxkuPp3ma
         Y5bOVpfu+457pah+OEueymOzQkwRwWubrdJao9GDr+2D9iKrz5bC+p2tTaXLek2hKWjk
         dFqUbc/MvmwRzkG2eKlBqG7sLT4eI9G1dUo8/Lsc6ly16ygeu7DyPK/e01jC4lURiyTy
         TcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=WDjH8HUsPkhGMMcrdHjqQzQOQEJ2YcdFedYMSf93gzs=;
        b=v8vnnhbsVbtGyBDVKuYVGIGzGZDW3guN6jiR1g0O1VE6tIExEeViG4j7sCFtXK1fL4
         Lc94m1HD6oFWAtL9Z54dhXuXwWzfR3xVt+mwu5BWVzKln1QSF1QGYe97kwdEr7kcUTxp
         omRRJKpJ5Uyc8u94stPUc6GVTPhKvLAX2qPAI0v9qN++6WmOyWQ88gEZUAl1s4EDpatH
         HyKXSimQBvvXfEqllwzQOrRQGPNhftc8i6qHqT9C6e7PhtIyQ9pw1BIHpzUp+SY64fSS
         KqY4LjJRtFsNyQX+hkzwnIA0mMJcPwWue4cjH2dmv1lZ9i3yYMWRa5L+ZUShenrNk1Ok
         QKug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iyBFTTAX;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c14si304525edr.409.2021.05.04.09.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 May 2021 09:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iyBFTTAX;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620144807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDjH8HUsPkhGMMcrdHjqQzQOQEJ2YcdFedYMSf93gzs=;
	b=iyBFTTAXWFXVrvIYGw95/WVLKDa4Bhlkg+IzZNuEuffVpILg0FLT3RKNkaZwSSTogSlExI
	OfHQvfU1/QeuJSnfPqbGBj5szwmV6JwyAYyl27NkwtpvyHAhd4pnzmhPclXtQgycZJvlv5
	S0AXonFggEilFnTxnAgcVq7IleG4UYI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-wEuUV0wLPjOpFupG85bxUQ-1; Tue, 04 May 2021 12:13:26 -0400
X-MC-Unique: wEuUV0wLPjOpFupG85bxUQ-1
Received: by mail-wr1-f72.google.com with SMTP id 4-20020adf80040000b029010cab735fdeso5946015wrk.14
        for <alex.bennee@linaro.org>; Tue, 04 May 2021 09:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WDjH8HUsPkhGMMcrdHjqQzQOQEJ2YcdFedYMSf93gzs=;
        b=LiJ98oCfqAlTvs5FSBHuRwHdrAUQkn5VvppNtTBdPV9i4SgQ2gc3bHjtIeRJYmPlC/
         Leju5si/jDb7QNI5UxPrseSEmytp4F4TEX3gAhYkt61k9F4XrIZs8/wRxS9NlicHeNsU
         jsLCpGxT+Y5AMnI//ypJMkXnIhLf7Y3QV8KHmYygZbshvWkG/BVPmfLENR9G3sr0tkhc
         7CezOt6M9OXBW6dc2e30cdqIXnfrbCdmETbjN+4NkVECt5x/5ohOLL3HVLhPOSim1aCl
         dWTbaFZN8M9CrOxkznWyereXdjFWx2oTop2RiAQ93qGLmFXa93htYnDtWnA5/0z1sB83
         8P6w==
X-Gm-Message-State: AOAM532eQ9Kpc6bAVz5FZvkA1ZYvh3BRBuCbiOTWat11FzqLIDA3OvpQ
	/yVFk9ktbUOSfbQ+VxIIMyQM+AGInHOWaawvvFnv4TzCMjBs75lgcVG9mFizisZcgISZbf9cPd4
	7F4wnvUs/rDN9xoNgMm32xd8zy8LKeqBx/lP+RxT0ewYT7SmmscsAV4uZfMS//uJUug==
X-Received: by 2002:a1c:6646:: with SMTP id a67mr4837517wmc.11.1620144804502;
        Tue, 04 May 2021 09:13:24 -0700 (PDT)
X-Received: by 2002:a1c:6646:: with SMTP id a67mr4837479wmc.11.1620144804127;
        Tue, 04 May 2021 09:13:24 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id s1sm3081836wmj.8.2021.05.04.09.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 09:13:23 -0700 (PDT)
Subject: Re: [PATCH v6 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210503211020.894589-1-philmd@redhat.com>
 <20210503211020.894589-12-philmd@redhat.com>
 <8e675e24-fedc-c4df-22d6-b385142e0e4b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <759a1dfd-371a-7e08-e0cc-15114d5b2b3a@redhat.com>
Date: Tue, 4 May 2021 18:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8e675e24-fedc-c4df-22d6-b385142e0e4b@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QSvuRUQQTvMS

On 5/3/21 11:19 PM, Eric Blake wrote:
> On 5/3/21 4:10 PM, Philippe Mathieu-Daudé wrote:
>> Now than we can probe if the TCG accelerator is available
> 
> that

Oops. I'll wait for Igor review before respinning.

> 
>> at runtime with a QMP command, do it once at the beginning
>> and only register the tests we can run.
>> We can then replace the #ifdef'ry by an assertion.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v5 had:
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> v6 is simplified and keeps the same logic, however since
>> it is different, I'm not keeping the R-b tags.
>> ---
>>  tests/qtest/bios-tables-test.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Phil.

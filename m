Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5635916ejc;
        Tue, 28 Feb 2023 03:12:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9u/79e4zXwPNC7ybfGP129/KeDcM+8yIzO2q5HSI7t1BPkLDiVjTGGGEb+iKrnPH3oxohg
X-Received: by 2002:a05:6214:23c9:b0:56e:a899:1611 with SMTP id hr9-20020a05621423c900b0056ea8991611mr3718168qvb.0.1677582752656;
        Tue, 28 Feb 2023 03:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677582752; cv=none;
        d=google.com; s=arc-20160816;
        b=gF0ls6a6AWdz7V4eVU4/LO1cw4ySs29hvdBGLEXf27vrB1drWLDb/2qQr+wyweFBI4
         lWuEPDO57sbmH3c1Iw3gQ9hyS693wopibhng0bjrPUzkff/hP6vHQMPdfiqm8Pucbep/
         i4nr7yqNugN6201ArORN4qOyn3qmPKivyqRnFUtXKiPvDUV9S4zS3jXWXM1mLsS23Tnm
         GCKeh1jwQ4bZvHfFKtRHUv45/SnhAyJIGnfdSq6WhotqQKek4kDFsbrW1ZizLzymLXVq
         kmzCIzx9PIBGLYnz1euaC/HLYsa6NtYYJY/ODWOFNzbQgI6aQF9rq3TbLz2eAQ5L7UcM
         +5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
        b=lh9xRuKhN7oxBTVhgBlpoRy8jzgo9fNeTigFGv3q8sd9SMealGSloXauqJdwmMBuwC
         4ysrMvsKN3JcUmh5mfLQPjGnHjbTxZMnigAj146dkZWD74HzP3+ED8t7K4HBTSU2OvNk
         KnVdYa6QUPVq1Qw1bVKEx1Y1jcMJKLuYVlXOZgPAdMn2rVCBRwX3QYvI6gdrEsQ+fh4R
         +/1ekWul4BR8oa1TIQgqAX8DfYp6KrSn+tFBXFHU0s4W6zrNL6P5H/keD18qUEQD1hFe
         yBaelc0w2UmLzEeISysD8jOwvjMSY+Hz5LM5V2HDYGYYedkCldybtqPvYC5sFdqV3gcD
         IvWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F6t7KpQn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w1-20020a0cb541000000b0056a56c8a569si7712844qvd.179.2023.02.28.03.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F6t7KpQn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677582752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
	b=F6t7KpQnECisySRDgBCX/Z1BCyqu3ed6TZAJapLDgZiRYRj8SGK6auTes4H/xusNaZG1lN
	9/d37ZLQWOrNWvXfHJ/G5JBGQnNuZm7YLuRZKbqpug/+p1nujw+N+ENU7fCE6UkQUtF5FF
	gS7ABRpeOHW65VfWO7JBsamjgm+3hy4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-cQL4zhI9MzO6S1puz9AMkw-1; Tue, 28 Feb 2023 06:12:31 -0500
X-MC-Unique: cQL4zhI9MzO6S1puz9AMkw-1
Received: by mail-wm1-f70.google.com with SMTP id z6-20020a05600c220600b003e222c9c5f4so3490910wml.4
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 03:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
        b=xe5dvPxupFLTWe6xrXU0Gb3orX+HHiX8+OhaxB4IQAJQyeZ6leoBSBcenQbgrDrq1n
         pXXeneHRJ08ZJOT61lVFKWmdRihBC7BLkxY7DxltnZeNWqo7Kvolp0gYjtVJtej6KZ6d
         ltjcNrgAyZeGwsvGQdyImFILmHEsnetyOnOjIzY0k2OAv0Fcwx672Sy/YDZceSwhLisP
         2rgJzqjx+jziUEqPGE/LLmp+pEgKpvGRebQakI8KdobLJw/cliTHzjEp/++/LOTJxD6F
         oWiMOVtKKgxu2NKhQ0TrzhFqnGRG+bgmAr8xnnSrpiZ/Zs7YHoL2buedLPVMThkPOqsC
         9pSw==
X-Gm-Message-State: AO0yUKVrzfEpIyid5I/f3/NtRcipiCRjtEZMq3gbNqp59muRWxHJY41F
	TnaUaWBmBDW2bhCDe2HEd+N59vPlfpCbh2hqEKzXeR+6lZ66L0/Z7WPo7c3S2RWI3VI31V3W97o
	HbrDnd4JXGJUOoDA7
X-Received: by 2002:a5d:6b0e:0:b0:2c7:a39:6e30 with SMTP id v14-20020a5d6b0e000000b002c70a396e30mr2049937wrw.38.1677582749883;
        Tue, 28 Feb 2023 03:12:29 -0800 (PST)
X-Received: by 2002:a5d:6b0e:0:b0:2c7:a39:6e30 with SMTP id v14-20020a5d6b0e000000b002c70a396e30mr2049919wrw.38.1677582749642;
        Tue, 28 Feb 2023 03:12:29 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de. [109.43.177.75])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c4f9100b003e876122dc1sm16604362wmq.47.2023.02.28.03.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:12:29 -0800 (PST)
Message-ID: <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
Date: Tue, 28 Feb 2023 12:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org> <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com> <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org> <20230228055016-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
In-Reply-To: <20230228055016-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: eN6yvVHYERo3

On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
>> The question to answer: Is 32 bit x86 worth its upkeep?  Two
>> sub-questions: 1. Is it worth the human attention?  2. Is it worth
>> (scarce!) CI minutes?
> 
> 3. Is it worth arguing about?

You are aware of the problems we're currently struggeling with, aren't you? 
Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out 
of CI minutes for the second time this year, and you ask whether it's worth 
arguing about??? You're not serious with this question, are you?

  Thomas

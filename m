Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2941724lfb;
        Wed, 8 Jun 2022 08:51:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSCjchXqGJmqoDv7xdH2uW7UL+Pt1NbpEluIVNkr90+E2GznwG7bkHV/P0GM450aL+7PiY
X-Received: by 2002:a17:907:3f08:b0:711:d61d:e10 with SMTP id hq8-20020a1709073f0800b00711d61d0e10mr13500426ejc.11.1654703514980;
        Wed, 08 Jun 2022 08:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654703514; cv=none;
        d=google.com; s=arc-20160816;
        b=P/en5TtFuSC1vEX5TK24k3lF5seiasm4p50swKDcmSX52m2edU5sdCi4T31UELb0nX
         Sw9BINlNcGfECPVdJ2y82ljQRcGJyYQ2ulkX/nhg0OzsuUzPxNj9RVXZD78AoBt8czFd
         hMDpal85BktW5Y0RnXGf5FfRBSPTcCIOah9Im37T5oQqp3bSwuQY22VCJNIk29+BTNm+
         eP1UjiLzLc7JYTcPfhXGqdoff5HxYWLrRTjKZd1Jgjb4zsIWA0ZW3d44lOoRK/o0iPe7
         OemV8Ml0ssU+g/7If0/ZXmfOEqAseIIFBObDCsbaLzYUbVFQGhUJ8U6DWrnUrC9gfFWG
         lQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LKRLPv86HaCSXVBFMJB9KPcreAytf0aEM85cLJ+gTo0=;
        b=ufzuE2aqGaI3bKZl5j6JlVXE+0Dkaee+hGnyqvuDIwpx/VaQV8wmTxlTN+rn80EYG/
         XJmXqnMHXiClhWhByeUwHTiZKm/Wrdh6zu3qMdIy26UtB/xOOGw7A00sxrwtFOwKdCYI
         clIX/2p4llwkuHScmie3q3e7/v/PjmPrSRPHOmb+JZ71hr/47wGd5ALcblas+Cqkj4m3
         CqZWnZGpEmXaAmlgnZgxr6x+RLGBdTWbWZy+Bnfzjk1TDKg2aQgFanxsWoT3psyM8vQh
         JySMAzTTzszCw1gdbO9GxvsuBCbhFhK3kdu3z/vETjVNrRqGE1Xu5+BweIOx4faULO15
         RRiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEooUCId;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t12-20020a170906a10c00b00702d8adf775si13063922ejy.169.2022.06.08.08.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jun 2022 08:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEooUCId;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654703513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKRLPv86HaCSXVBFMJB9KPcreAytf0aEM85cLJ+gTo0=;
	b=JEooUCIdBkX9iw8tmbiKkjEsZ7v44FWfRFBhMhR3uJLXNEPA+VeGvQyDZUM9EKAwukcU0r
	fdnvT6KZB0QXm4bSNjPmkI0vkqFDFiMuF0JUCiqXSuoOdgrxfv/Zbl08kTaIUVfR34Ww0x
	cNtW9R9yprfjd+e/5C0V2lx19lmF+NU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-apeZ2Z4-OHG-9bYeOQdp9w-1; Wed, 08 Jun 2022 11:51:52 -0400
X-MC-Unique: apeZ2Z4-OHG-9bYeOQdp9w-1
Received: by mail-ed1-f72.google.com with SMTP id m5-20020a056402430500b004319d8ba8afso2427380edc.5
        for <alex.bennee@linaro.org>; Wed, 08 Jun 2022 08:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LKRLPv86HaCSXVBFMJB9KPcreAytf0aEM85cLJ+gTo0=;
        b=lHbx90Qxr3Bx5isItgQe27M8R/3y+m+W4+mSHKVG7b3nJhp/MUoF/YnbFEBgXGDgHa
         VXKOZ4fj6Z9kIKanZ4rfFsBJ3/0CgE2IMeFKFze7lNkEbytb4nSuzfOgcGp2jEtolB+C
         v8kMqVs2J7AUZ9cWIsAJFsAX9Ojm+AemaM6Bd59u1HIZ//AplNRRbirrwOkNLtDY3Aoq
         x+XFsFSA8CWo9NATxin5j0Vd5j8E707Z9OdMP1vjNX2IdxAPegfMnLuGnwgen2XHLmh3
         A3zH9SgUWyLyfP+K5QlDgJXR7wgkpG+ubhXiPnVxmp36h2OVK/Kre3T9pL3JXADR5pZt
         ZnWg==
X-Gm-Message-State: AOAM530xBY0BIcD5jfJ9wCJoPH9j4Zo1qlVfwBpVIG2Zbk1Dm2PRB7gL
	TupiPfwwYHDthaa1d+j973Y8o/Sekd7ulUFsh/RANZJnQ6oJrdueWgp3FVF+4b47cA9jv4PQWxd
	iUDy+o4F5fYNeHYWo
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id hb15-20020a170907160f00b0070fccebd78cmr24314278ejc.247.1654703511639;
        Wed, 08 Jun 2022 08:51:51 -0700 (PDT)
X-Received: by 2002:a17:907:160f:b0:70f:cceb:d78c with SMTP id hb15-20020a170907160f00b0070fccebd78cmr24314261ejc.247.1654703511434;
        Wed, 08 Jun 2022 08:51:51 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id g2-20020a1709063b0200b0070a5ba0669dsm8488865ejf.218.2022.06.08.08.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 08:51:50 -0700 (PDT)
Message-ID: <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
Date: Wed, 8 Jun 2022 17:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
To: Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +aEoTS9hGr5V

On 6/3/22 19:35, Thomas Huth wrote:
> On 03/06/2022 19.26, Claudio Fontana wrote:
>> On 6/3/22 18:42, Thomas Huth wrote:
>>> The disassembly via capstone should be superiour to our old vixl
>>> sources nowadays, so let's finally cut this old disassembler out
>>> of the QEMU source tree.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> agreed, one thought: at the time I added this thing, I had to add C++ 
>> compilation support,
>> maybe something we can now drop if there are no more C++ users?
> 
> I thought about that, too, but we still have disas/nanomips.cpp left and 
> the Windows-related files in qga/vss-win32/* .

That is pure C++ so it does not need the extra complication of "detect 
whether the C and C++ compiler are ABI-compatible" (typically due to 
different libasan/libtsan implementation between gcc and clang).  So 
it's really just nanoMIPS that's left.

> And I think Paolo was 
> considering to use C++ for coroutine fixes - not sure whether that still 
> is planned, though.

No, that was just an experiment.

Paolo

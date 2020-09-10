Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1225218lfq;
        Thu, 10 Sep 2020 04:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4HpnjTnzvXH7UCONLYN8fNdH/bLa2jz+YsoJdrRTwg9SAb27Ha9MKxLHcn0ZDRvxuU6AK
X-Received: by 2002:a25:3891:: with SMTP id f139mr12262687yba.174.1599737768995;
        Thu, 10 Sep 2020 04:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599737768; cv=none;
        d=google.com; s=arc-20160816;
        b=Q83uT0C74+U2Bjz9yNn2vtVTV1xwgZpsGBUpPBbGFMA9thz0vM0LUW9PuPuH3U2I65
         VXzG/Ie9sC4hL4ZzMZb84xOE+PR5QdxK2fTWqjjDMBJs7O94WMUj7ZFs0QtjxmxWMo1A
         4YOd5jVvJzJAq/01k2Hd4fRwgqbUBDxK8BgOjBd843qPUvtgrfewiGgn65SO4TIAB/cO
         CxAfWPaso29w1pi7YRFiIVW7hVLadaGnIG54+v4TcOMYBuF9FtEb4eEfcycEmzaU5hOF
         DaLmDVwo4WcaQuunCLgNmP/IghIYihYcmtd0IEtpe6KRulD5jEQyaGcLkDIzzp/guJ4m
         sMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=g68Ln2Ykm0AsGzDT36RNb3rZ1ltN22ArPGT5SDWCbBk=;
        b=lyg85F/nt0CpdUGxH0VtAlUsJhOfoY6bX6QYNHtS5bibvnGmdEsmo5cSb4dLIHNCCY
         fkTXqtxFd+zb8PM4rSfYOsAx2B+sUZMPiyt4I1SQNJ+XYEWYpARWBV0xwVrM22Y+HBIi
         /oV1aGjdo7pDIt1pGfgWv5Kif/q5+n4IZXHL6QLXH2BQQNMbf4uyrbZuR5REedh5CGgQ
         5skJ3z7s4drPPlelXzI0RXOK4XoKawQNrSZ7pafF6JFQSXkJrF5Waiycc3omBwfiCHNE
         R16u8WUJRWotNC14hD6WAS8rW9EdunRe+quNY7zSez2WFuFotvrlBm3kTSfFfLYBsGiH
         Lkcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FyylzW2a;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 186si4985902ybh.80.2020.09.10.04.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 04:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FyylzW2a;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599737768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g68Ln2Ykm0AsGzDT36RNb3rZ1ltN22ArPGT5SDWCbBk=;
	b=FyylzW2a/0FEqR8XPPuTFe8qeFouGuOmfnOnN3t8EXZcLU+DaTGW5+7JY1J08QaVAGIesF
	qcgU7NkYZcnr1PLGh08YAiAkP/4S4m3p5b7i5otJeA/9kXtDCshou1gNqSId1rHgGJhvc7
	4JTuS+6BX96oODOImJB7WxXd5vXBcUc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-q6qAocYGPreLWOyCB8ZV4g-1; Thu, 10 Sep 2020 07:36:06 -0400
X-MC-Unique: q6qAocYGPreLWOyCB8ZV4g-1
Received: by mail-ej1-f70.google.com with SMTP id rs9so2574071ejb.17
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 04:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g68Ln2Ykm0AsGzDT36RNb3rZ1ltN22ArPGT5SDWCbBk=;
        b=EMejW2cGUjlO9dPuZeTVUZ3cCUEm5uLQnS4tY+8YtUaYndYFO/Fyua8i/ivL8pNhxG
         ak+kErtNip2UFFwk/p8015S2TuugiFkEb5R16OJeGlvEEJfNEYYxkENdwnjwn2Gsj6W2
         CRI0FvOymwKguMrIRJAhAOdlKf2fNYtWJzkwJ1+opmW/CBHo5AznGPqFlHARI3f1dFda
         i+saoG4vubEoigCP7fmbwwKhN85ICaAG6qd+LPU4O5V7NrUzkHhoCyRZ6x7NHDBr10zu
         0E7TO6wtSwyXHA8YTOfB2Etw/c303e54b72cP08Ks6tBry1MMqJflGhEPDHPWuUibYQs
         Cl8g==
X-Gm-Message-State: AOAM530L+3d7Mjqfuc5i1CGCcziidxseNnbehNBtM3tWWgx5rmn+AhcA
	VQDP41wP/vCjp/ml1df1BleWsMYh5s5qFADtI6TKOvzUNeOQ5wFkRaqjE618x+jn90r05q8/GY4
	CTbalt139JwGZhaON
X-Received: by 2002:a05:6402:70f:: with SMTP id w15mr9029417edx.202.1599737765598;
        Thu, 10 Sep 2020 04:36:05 -0700 (PDT)
X-Received: by 2002:a05:6402:70f:: with SMTP id w15mr9029399edx.202.1599737765385;
        Thu, 10 Sep 2020 04:36:05 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:68f6:5b4d:4ee8:10c7? ([2001:b07:6468:f312:68f6:5b4d:4ee8:10c7])
        by smtp.gmail.com with ESMTPSA id m6sm6450319ejb.85.2020.09.10.04.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 04:36:04 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory)
 hole'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-6-philmd@redhat.com>
 <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
 <20200910091454.GE1083348@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6af444a-fb0b-ed98-60df-28ea67d6abe4@redhat.com>
Date: Thu, 10 Sep 2020 13:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910091454.GE1083348@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: MuaZ8sz//3o9

On 10/09/20 11:14, Daniel P. Berrangé wrote:
> On Thu, Sep 10, 2020 at 09:15:02AM +0200, Thomas Huth wrote:
>> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>>> In order to use inclusive terminology, rename "blackhole"
>>> as "(memory)hole".
>>
>> A black hole is a well-known astronomical term, which is simply named
>> that way since it absorbes all light. I doubt that anybody could get
>> upset by this term?
> 
> In this particular case I think the change is the right thing to do
> simply because the astronomical analogy is not adding any value in
> understanding. Calling it a "memoryhole" is more descriptive in what
> is actually is.

Absolutely not.  A memory hole ("memoryhole" is not an English word)
would be easily confused with a hole in the memory map, which this is
not.  For example on x86 systems the "PCI hole" is a hole between the
end of low RAM and the bottom of the ROM that is reserved for memory
mapped devices.  The "PCI hole" is explicitly left free by board code so
that the OS can put PCI BARs in there.

These black hole MemoryRegions, instead, are present in the memory map
and their purpose is to absorbs all writes and only sends back zeros,
hiding the contents of SMRAM and TSEG from the guest.  Just like a black
hole they are "something that exists".

Therefore, both "memory hole" and "hole" as in Philippe's patch are
worse than the astronomical metaphor.

Paolo

>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  include/hw/pci-host/q35.h |  4 ++--
>>>  hw/pci-host/q35.c         | 38 +++++++++++++++++++-------------------
>>>  tests/qtest/q35-test.c    |  2 +-
>>>  3 files changed, 22 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
>>> index 070305f83df..0fb90aca18b 100644
>>> --- a/include/hw/pci-host/q35.h
>>> +++ b/include/hw/pci-host/q35.h
>>> @@ -48,8 +48,8 @@ typedef struct MCHPCIState {
>>>      PAMMemoryRegion pam_regions[13];
>>>      MemoryRegion smram_region, open_high_smram;
>>>      MemoryRegion smram, low_smram, high_smram;
>>> -    MemoryRegion tseg_blackhole, tseg_window;
>>> -    MemoryRegion smbase_blackhole, smbase_window;
>>> +    MemoryRegion tseg_hole, tseg_window;
>>> +    MemoryRegion smbase_hole, smbase_window;
>>
>> Maybe rather use smbase_memhole and tseg_memhole?
>>
>>  Thomas
>>
>>
> 
> Regards,
> Daniel
> 

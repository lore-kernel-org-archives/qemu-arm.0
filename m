Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp352659lfg;
        Thu, 18 Mar 2021 06:14:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdlpSjrsmAN4FCOlDnW39BDpHbx9W9YSIPNm9elrmBQ/988l+PHCNkaZqYLBV+q7CB6cMB
X-Received: by 2002:aa7:de11:: with SMTP id h17mr3466106edv.83.1616073283009;
        Thu, 18 Mar 2021 06:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616073283; cv=none;
        d=google.com; s=arc-20160816;
        b=dtibgPbo5Kewv5LjLXDLBj+M/hbG2tmYBBuhKA3jrP3/+00roiyardcFV6+rTpUwMa
         5d2wtokMrOmaIwgGzVnsb8rCFyu1QJ55vioeLjcVqPFwSwkZ4G/MfF13UxmnXefuLjFb
         qN2fL9uxkyx1yzCcY435p6hbw38mWpHhFc29IF84NB5t/w9std1ktHsewHkASsAGSPhs
         R2tZdvAnZyTCKcU5NKDGu232N2jEwe4bnjcRxJRc44ZjDY/y5ZkVieLgoe6sJ6IzsgQx
         yW/3z8fVWSAbcodOA2aP9ROqqsrQttt9dUujbUfCJV5tua4ytP8KV54osIsSBjdtYdCr
         yc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=BA+uJn4Ntz99Gp12CgG1dlcwx0agf5Wm10r7y0nxsOs=;
        b=a+D9mq4vO/AWaFAptjVAeIGXm3obv+zN/MvB7U6JHGAGMYN9L4aHTHKh0d25cvwTTC
         pi0qEjMxWsHy4hU10eAMxdPGGmIeSV1H/EzPESRdhBZExleT4K/qwozpLHAFWXRdVY18
         Tm+irhBXHUf4SGNG7efP0wpyY/cfCN4mGxmQP/xiJ/qdkWnRffNS3Ae3zXMts9FUtyUK
         yytCaeG2UN7ZIG1ed6Pdl/VL1OHfS8pes0SblfTktcue0++pKXlymsbqKdNzlYcFqPG7
         +mBN+4XoiTRmdz6Zg1rMV+2Qsfox2DsSWiKW3C87KBPBqtp0nstBWA4Pf8VVVDJJsvAk
         UUeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ViJhiISx;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id oz17si1711389ejb.205.2021.03.18.06.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 06:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ViJhiISx;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616073281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BA+uJn4Ntz99Gp12CgG1dlcwx0agf5Wm10r7y0nxsOs=;
	b=ViJhiISxgCeetwX2iciJKBBSk6CSDsfvazRyPLVI4q6xJFx0a0RVtSEQu8WPi3rTZH3O2i
	Etb0s5nm8dpZ17wbJQ4AenIgzXwUq3ls10oqlGlbjcSynJo+Em7et2TawMuGm77b6lCCEy
	PfGAbbg3OIWyn9KGV43xjXLVLh+Tc2g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-cMSFR_mkOMOJV04dCT0qAw-1; Thu, 18 Mar 2021 09:14:40 -0400
X-MC-Unique: cMSFR_mkOMOJV04dCT0qAw-1
Received: by mail-wr1-f70.google.com with SMTP id n16so19042582wro.1
        for <alex.bennee@linaro.org>; Thu, 18 Mar 2021 06:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BA+uJn4Ntz99Gp12CgG1dlcwx0agf5Wm10r7y0nxsOs=;
        b=EZHaN631j8gCY/Grp4JfT9TVpKcMNx2nHwlE2PnFFoEvpjLArgJ1NDtDWsGNicFj98
         mWqjrRMVl7mS+VJKUs74m1veDn09v7YZtgoD4Q0orq+3dBYxlZOq4S6NI/w+ILnvW4CD
         KFlQet2ry1UlFTr6Z152dF4ngqR+ct6jr7O1wMj5HT2k2pL60wbUnE/3cqkG8uzfo8mB
         0JvfN4lcbKqHODoX4h7EjXXnSDUT0b0dZphHnJLrpUmxZXjk/FDV0zeQgbSaSJ3/FyI9
         4d+v6dP373OsXEiX/2rEyd3tLon1KOMUbqhKci+1fF63ipH4DaQszRpDs4AxwgnjWgXn
         QW/A==
X-Gm-Message-State: AOAM531tVBcXkwmVZ20jdDq+LqQYPp/vIht5T1OZc0mTiFyFkICBPiTr
	wc5FID1s+o//CIefQuBtyWSF39wavLYO2emUEdRxRxwV2OahlvdfitLCvCRws6IlFbMyUd8iG+I
	C3CmQLeiyXbeMEaBNpKkpYmPLWdwSTCcYg5SBfjOZOR++Bwu1ycTKjQJED7Zm7BrzlQ==
X-Received: by 2002:adf:b609:: with SMTP id f9mr9329700wre.223.1616073278595;
        Thu, 18 Mar 2021 06:14:38 -0700 (PDT)
X-Received: by 2002:adf:b609:: with SMTP id f9mr9329682wre.223.1616073278436;
        Thu, 18 Mar 2021 06:14:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id j123sm2316078wmb.1.2021.03.18.06.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 06:14:38 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Claudio Fontana <cfontana@suse.de>, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
 <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
 <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
 <f41c34dc-2cad-5929-06d8-6ea098ab5b8a@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cec1eb2b-197f-b3d5-4187-f06b59be1657@redhat.com>
Date: Thu, 18 Mar 2021 14:14:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f41c34dc-2cad-5929-06d8-6ea098ab5b8a@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: b4dLKBxDipN5

On 3/18/21 1:50 PM, Claudio Fontana wrote:
> On 3/18/21 1:37 PM, Andrew Jones wrote:
>> On Thu, Mar 18, 2021 at 11:38:51AM +0000, Peter Maydell wrote:
>>> On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>> I tend to agree. The problem is for the running VMs started before
>>>> 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
>>>> the forks are supposed to do with the running VMs if they want to
>>>> migrate them to newer QEMU (or upgrade the host QEMU).
>>>
>>> Anybody with a Cortex-A15 KVM VM is just going to have to stay
>>> with their pre-existing ancient hardware, their pre-existing
>>> host kernel and their pre-existing QEMU binary. That's what
>>> "we deprecated and then dropped support for this" means:
>>> we no longer support running that kind of VM, so users who
>>> were doing it need to either do something else instead, or
>>> else just keep on going with the old versions they have.
>>>
>>
>> I strongly agree.
>>
>> And, downstream-wise, I can't speak for anything but RHEL, but RHEL
>> cannot have this problem. There are no 32-bit ARM builds for RHEL.

Great then. Sorry for the confusion.

> I don't see a strong issue with this either, there is no 32bit support for KVM ARM.

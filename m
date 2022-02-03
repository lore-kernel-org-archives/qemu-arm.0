Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2132645lfk;
        Thu, 3 Feb 2022 13:31:46 -0800 (PST)
X-Received: by 2002:a17:903:1042:: with SMTP id f2mr38096122plc.115.1643923906511;
        Thu, 03 Feb 2022 13:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643923906; cv=none;
        d=google.com; s=arc-20160816;
        b=l2RC2mRA5VYM3nGOuS0Z4T8V4foEYl5qmyL6qA1KK4F6WZSCyzmjeibWyPl8ONpsJZ
         N53IgCvs+TMYF6pUI5JyKicS5fiWb/GsKdfzlMOrt4x79Qpozyzwf8ctemBSrA5kHle2
         N/DaKG68gXHPpyJUnTzpigocsb8Tvo2MEh+StG5Y473ry93ABJvtv8fJpo33EcJiGkGP
         S73BFB9de2sME/VkXggehnud1rFXmrTeviPgIWI02+rvfL73hNZgifTFaHxpiLIQrEkq
         +L9qNYZvpOfXSCo1GHYRDoUxRXn2YAh2MAQKJI3qJNY7F4tMTiS2wQoNnlVwAeSiupPP
         D0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rXmYbwNl7Kr/ivvsZOena3yb6vA2NKitQcHiSKWGftQ=;
        b=og8DIeLRWUsdgHJooqaT2JjNs95vOVl2tlZYBRv1HHaN2IiDGadIhJttd0rMzGKCrz
         Gysz5i4tZEBfu0tvSZZ36cV5h6jBy8YULx582pALo1ZjuEpVkAdH7c9AbDU2FqpvFXJn
         Kyzk8+2a3Lzy5sqFcnF3/OsnVv9UwIpBK2qnjJj4CJAAofMWutNhO3JwpUGB041m6Fp9
         kZVTH6P6RPHA9xhoQNZcA3kGV9HcCRqTZqK9zykNVcUZTAn0n4t9XWkqbVey277CeEym
         I60Qxx5o5oNYdzMqRtuA4yU33Pm9vOfgM7TZX73+MRkfpwcLNgFuaOwxYx394gwtNdv/
         yawg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyHmITmx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bi8sor10635708plb.126.2022.02.03.13.31.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Feb 2022 13:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyHmITmx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rXmYbwNl7Kr/ivvsZOena3yb6vA2NKitQcHiSKWGftQ=;
        b=dyHmITmx3uoUuzdMAVbFFktcralPR5K2XX2Y7nJP6re9xCcdevIKlATTNrQTJ3QozB
         bWe0RQqLTiUhx4iJL2mJTyS2M3BDzwfA0OU9TiYq6sPFyJ1BixC4TiOq9/kZ+Xg9rHuU
         A0zzZK7KpDcAPrR8EAal02BmPclIa8l4ruWZwOK6G362s473VUysg6onHRPkLa4E/A6u
         N87in5b8wQdlIcdRFzT4LmXT97G5Kj4d28LjgQ8oHJgKVnJ7OLTxsOc3GudLhLY/MqHp
         Bx8nUKnudw76OluXDy4AR0IvER/PrYe6JZbUmBlUoP54DQ15lsegpCneVWlhaH2A3FZG
         WbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rXmYbwNl7Kr/ivvsZOena3yb6vA2NKitQcHiSKWGftQ=;
        b=A5gNWtGUpLAPPJ/ANRCHGyUvu1rSV7PS7Cq6VJBqlMomq8mDzksM1gmiwSK58hvGWd
         XBJJYFbre2Q2epSwnMclHstWfw4eaCy9i/mkgjbXTAj6amxzE1G540WbPQNN8oKolDaL
         FzTDOdyscZJsGYlXkbNpzOnUNYKlTiD9XENxC6hLamxDkZu2BMR8DbMu6/n+coMJab/n
         Nw/PdAjIe1a2a49i7MRAGinkbFrn48oFzJ5Cs/wX6jM100vyWGswNEzwsRMBlINwbexW
         rKB9eEC929r7aT0WEDWQrsTPtNkZr+fWMdaCBVa8oHJoJwbHfo/9jqoUBooq0e3V8C0W
         52Iw==
X-Gm-Message-State: AOAM532aisI7kN97n7eQztVMcU7Fa9qabbjtqZAJvYMMa+Ew2qGptlc0
	g0DCoeqaylDDjfAqVfdfAxZzlQGVSFBHOU8K8tQ=
X-Google-Smtp-Source: ABdhPJw/ZZdMTi92q1eifwVYbfKBo3seLZ5/OmV9XaVW+IajzzWPtzJcubbnLRDD+pEU7mEnfASLAA==
X-Received: by 2002:a17:903:244d:: with SMTP id l13mr36755727pls.142.1643923906022;
        Thu, 03 Feb 2022 13:31:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9? ([2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9])
        by smtp.gmail.com with ESMTPSA id mu13sm12755359pjb.28.2022.02.03.13.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 13:31:45 -0800 (PST)
Message-ID: <b5cfbd97-8f10-c41f-d28d-bf2567585e99@linaro.org>
Date: Fri, 4 Feb 2022 08:31:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "fam@euphon.net"
 <fam@euphon.net>, "berrange@redhat.com" <berrange@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
 <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87h79fsor3.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h79fsor3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hd4FnJ+eDOIT

On 2/4/22 07:00, Alex Bennée wrote:
>>> Does:
>>>
>>>    #if BYTE_ORDER == BIG_ENDIAN
>>>
>>> work for your compiler?
>>
>> No, but this does
>> #if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>>
>> With that change in the source, the tests passes.  Will that work for
>> other targets?
> 
> At least not hppa-linux-user. The joy of having no standard compile time
> way to report byte order in the C standard despite most things needing
> to know one way or another.
> 
> Richard,
> 
> Any ideas?

I see you're not explicitly including <endian.h>.
I would expect that to be of some use.


r~

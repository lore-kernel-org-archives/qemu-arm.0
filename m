Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp836538ejc;
        Thu, 10 Aug 2023 10:33:35 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:1bb:ee1b:3cdf with SMTP id l5-20020a170903244500b001bbee1b3cdfmr3690289pls.67.1691688815361;
        Thu, 10 Aug 2023 10:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691688815; cv=none;
        d=google.com; s=arc-20160816;
        b=D/0l58f1m+hDNCtaDj5pKZfXoXakMeNdUfZNS9lJI9+vSKGBTUbXnNFgV0sFdKbKpB
         cb0AXFnmueLJ3rHzwNCAXtkxuEKnrY1cNVfWOGyO8QAsDFWTZDPR4ukHBvLBm6erYIFk
         dWFI4beEfnybld6vSUqpN38H9GZ2l3riFyWF9xOzla7OB/+BdKFR/ZUu2aepRwe1VZ8u
         cWB3bziA4ktGQOmdQw4UzIVo9bF5e3LuRnldizamVuXxgrQkErY4wd1MYr2+P1/e/MDY
         94SeNcTcKENdKwBxjG2KZo3H04AbWtPFxbnHnkIYph/K3kemUEwR8sB71+y9mNaxovSd
         4Olw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2JnnLrcqUSR/cO44gL/tnfJEOUA8DNDbgFdFPXVws/A=;
        fh=6u86b2/d09c2l5plPjyfBdZnLryRDgLrmlIae32vOyE=;
        b=VuOXAS8d1ICNubS9ZyrBK6cyXn9KDJeVMWL0I15z87EeXCA9KHBMgGrL8THAgQgTQI
         YUuwbZWSEh6DwBRtG8dG9ggON7Dqewimq9egqzwgEdfyj1YpmPGfcabigZ127ega+wDk
         PuevDNYuOkAIRY8GuPxZKFbyXwEhIBvGFgrLVF+xZ+svOWMiQP1zME+W4GuXntIh4eef
         NRVIl8/SoydewAxtp/9pOBuKOPN2XY2KlozkIcg2EsU+euEdLnv8asK3yrK4sA5eKfQU
         j0nDr7BeI1TogfnGmbfy2YEDE/pGi3B/3jYSlhtm13aWZ1tygeVXftrQGlhBcI8qdWH5
         98Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wf/2SgHl";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c20-20020a170902c1d400b001bda1372139sor1034626plc.14.2023.08.10.10.33.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 10:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wf/2SgHl";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691688815; x=1692293615;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JnnLrcqUSR/cO44gL/tnfJEOUA8DNDbgFdFPXVws/A=;
        b=Wf/2SgHl8Dt3WWbbZ3mCqtphG69JUc0lxM+4ajyNW+1zaoTioPuSo/HjzoRAuCWRbC
         ys7FQTrsSywH5o3YtXkYR75E4fT2k2jJC0ZBKfivfJ24WA6LACdOZYVor6vhh855dA/d
         ctux9jkyYFsDq08k0H4t79wn/iiC4W51fh0BtaWQgKwEfmlUvEbnn3ObsOjvJZ125kCs
         X35hrOE4B+6uurxdM7uegYU/eVL9kXbyQBWv0EXw1BFviZxKR2Vsth16jcG8pSXt+9AD
         KzC3A9BAsJokbUIW7aM0irN92vYLWvmiqaSOQIU8oLcobGx2AP9gLYnyZ/aWmtPNg5xG
         KziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691688815; x=1692293615;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JnnLrcqUSR/cO44gL/tnfJEOUA8DNDbgFdFPXVws/A=;
        b=Tvt9AbVSgLHSd+8iIaXyqVg1K6RzwDzF04/OfQeFVK3H8QB9WFKI/z34wG6lz5KySt
         GZR+MzRiGQ9NjmAqX2FW7FnvuqOF1jQ9RNLGggWAs1aUAG2Nrudz7gErnjakAcLddw1H
         dazddhTks4UR+buiJILInxiKk0svh+W77WO3NnR0FzH/sVSUHMGMfP+LoN3lrbdbzStd
         AgYZbgd3NKUVK/urd2nz4ErSBI032Tc7FcFazl8dXIEWI2izDzN2YfpHeyNLKWCNZy+E
         QzzDvXIQWM5EtnmMyecenKIDWuEqs93maiuC65DzKoCaQT6oNxdKFLQkGZQR5rIEiW/f
         pqNA==
X-Gm-Message-State: AOJu0YyhArt5wqWLG0BaGlhxljcF1FKxrCByAi67HnaAwFTAPEKGXOaE
	TYg/aOFBCHOerc5wDeRAplDhrBu1MaSc6nddc7Kcdg==
X-Google-Smtp-Source: AGHT+IE20S2Fu48Rsp1XvuJyFTL2uDROvOry2JFMln4B2jgSUVDitPrW5/5nA5dkAULl87bQrxVjVA==
X-Received: by 2002:a17:902:a9c1:b0:1bb:1523:b311 with SMTP id b1-20020a170902a9c100b001bb1523b311mr2363701plr.41.1691688814878;
        Thu, 10 Aug 2023 10:33:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id jc3-20020a17090325c300b001b86492d724sm2052124plb.223.2023.08.10.10.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 10:33:34 -0700 (PDT)
Message-ID: <e7b03309-aa23-9144-eb01-a117a2d71dde@linaro.org>
Date: Thu, 10 Aug 2023 10:33:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] some testing and gdbstub fixes
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <CAFEAcA9bOS7tJDe_TRKOUGFcCDq_CjUfzAF7dYYRJbZA=5hvqw@mail.gmail.com>
 <87il9m3ld7.fsf@linaro.org> <3fb6e5ac-5887-2947-b431-4a15394c347b@linaro.org>
In-Reply-To: <3fb6e5ac-5887-2947-b431-4a15394c347b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ky7wxD/gJ2UW

On 8/10/23 09:43, Richard Henderson wrote:
> On 8/10/23 09:35, Alex Bennée wrote:
>> So 7 and 8? I would argue for 6 as well given that's a foot gun just
>> waiting to happen.
> 
> Yes, the timing issues with 6 are nasty.

I'm going to queue 6-8 to tcg-next, along with the %x change Phil suggested for logging 
non-ASCII characters.


r~

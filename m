Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp376081ejf;
        Thu, 11 Aug 2022 01:31:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4IZsPBUhwR6sKmDXVP4pKND2pQEv+S0E1Mhq0/xa4h4D022Rt7e+e38+jyjdLiOXJmHES2
X-Received: by 2002:a05:622a:293:b0:343:7d4:e296 with SMTP id z19-20020a05622a029300b0034307d4e296mr10006044qtw.480.1660206692042;
        Thu, 11 Aug 2022 01:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660206692; cv=none;
        d=google.com; s=arc-20160816;
        b=wwvRKgd93OKVcI0lg/yz3YFLrILDDEiQxitkZvnylCIHRBc1JEK4UYlwbG8gN90J7W
         GOKJw8n9oQ/uubca7U3+jYCBXQ4+ZW25BSYPXOJwx7GZTnIX41WKlMYrSOqDkd4alQU7
         lSGAkVhixPB45T9d2QFkSTK60N74+v2rlLrAF9ssKFEQAXkd536UfXXlGIr0p5+M43wy
         BG8G6DZCcTH9zHVHqBCmxjgDlNMi01ckUwEu41dnhqtvA30A6NBKY9BHvSY2tXweIrif
         uLjkIj8Uqi1FTrukYXXqWKBrtdQgXldbN5aqAx4FPkTaW56aaKCkY8uBZJOQD6BeC70a
         peug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Pruk8GX/O8O/wZafBQQvdTJ3okjBM1f1rNgbn3hOweE=;
        b=npUWwiEUbwDoyAzjd8xmvZp81PnBWTNAVWlGvDENcP4G5lVuxwJhEiav+2CIDRbJUO
         o5xHBPQEhTB1DTT9FOA4kD6ejMIR/1mVr+uauoDwKWBdQxtypysLDyibQtkOrSNo0N0P
         01yqpEhQghLK9nLIzpcF+JGeWDOn1dUqVckqrFqCtA6nvtqlhKqhmZZzJk31ajSDx6fw
         jaS1sL6OdW2KFNQOK0lAj+ffFzWy2K+cyhl1gT+cltCXa5fHjgXz3L9uFRpsAwitG78h
         +DpFkrwoDH0gaNRBG5TYGzWu39eyGR2sqh5s6gGrg0lS2/nNfjSBt73NwDS9Oi5vGYHD
         f3Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a056214076400b00476858db2f9si1182522qvz.308.2022.08.11.01.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 01:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oM3bG-0003yV-93
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 04:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oM3ZM-00039t-Jb; Thu, 11 Aug 2022 04:29:32 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oM3ZK-00030X-Sa; Thu, 11 Aug 2022 04:29:32 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MVdUQ-1nuaW62D9I-00RZIR; Thu, 11 Aug 2022 10:29:22 +0200
Message-ID: <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
Date: Thu, 11 Aug 2022 10:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yIOcByJ/zRSpcKijvLEVkmwLmIiy9hgpnT9zmD4+6NTWMM9CjGc
 wi2EJtTQAoC2y8tWYp27ScfVfxsJ+lQ/EsWoZqW2GVVs2+tUJE8VC6HpGEEi+2SNAzp6l8g
 4tQhSngQ4zTfjb0i0cveHAFUsPXvyPUBatXOt0nVt2aXd2zznAgZQWmy8cNuqy43O5DhMau
 /VF1WEG0fV0W9HsJnIKNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cn6Cxc+wqvI=:REg0PD/5XLIpaOPslQvKFw
 iYpLZp2Fai28+EozjmMbbJSVZrst/aMEX164F/9BwPRtSoOlL5QKkQzfOQIyKO4mFXAKlrBOR
 KVR4vYZz+IEvsTNbytS5zu5wbHRuFn/BiRwaiV1OiLBrqp1Ccius/D9Rs01IQ5TvyQmEgrVxr
 UiqIWXKT8cSIP8EB5KPUHHkigOCuQd5PTujAVF06eLwy+l66upPU1oSwsoJrp96PQOTXN+q6E
 IjwbAJeUBaXxE+2fS9K0BBTdGjioevxJbbjB4G+uFQC6cZiYdn1/nzgXDQOcegbS8TEUCj3go
 g1JN69eeL03AWJbk3O4iKzvyh4m6TARlRFK417f9oyPmAks0FbpOv2jtRZjHuXK5sPdrNlDQn
 YhTcbmIJPmF2/4lj4RfI+BOel2LEpwnGuoBzsvy2FYUwLLoectoI+5XaWtdbTIU12iGLetOeA
 rXMo6qgRM4f8cwZmkCymkkyDP0sbFYxK86i/YWG9WdJA6j/nJM87eAMU3NB2qQDZHxttI3MlI
 ZCYSdPsQpYRlCEH7x60QPODh7ODjPuo+cT9gR7OdHm929qXAM/aeyMRkxbE7K8y6xR1o4nqG9
 nzUkfddlxYFrv+I2KmkqZNNEEsXNVDNCnsDnKahpIbWN3eoqeFXqfVZffcucykQJUbOsPz/2r
 Rm7r5csK4NvClF5EOdAMK7MhpJIqYSx290kB5PLcFS8kX6n/i2TnOFuUxGNsM/EKNxE/eW3ZK
 q0zKCYXQ1tt3gR+KjSB3VAdgGdSEDIqid5eykA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qAQO2+YnPJoL

Le 10/08/2022 à 22:47, Richard Henderson a écrit :
> On 8/10/22 13:32, Vitaly Buka wrote:
>> Sorry, I only noticed today that it's not submitted.
>> Version is not critical for us, as we build from masters anyway.
>> Richard, do you know a reason to consider this critical?
>>
>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org 
>> <mailto:peter.maydell@linaro.org>> wrote:
>>
>>     On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>     <mailto:vitalybuka@google.com>> wrote:
>>      >
>>      > How can we land this one?
>>
>>     Pinging it a week ago rather than now would have been a good start :-(
>>     I think it got missed because you didn't cc the linux-user maintainer.
>>
>>     Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
> 
> It's unfortunate that it got missed.  It's not critical, but it would be nice, because support for 
> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
> 
> I'll note there are missing braces for coding style on an IF.
>
> Laurent, do you have an objection to merging this for rc3?
> 

No objection.

Do you want it goes via the arm branch or via the linux-user branch?

If it goes via linux-user I can run the LTP testsuite but it takes 1 day.

Thanks,
Laurent

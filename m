Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp317060ejf;
        Sat, 13 Aug 2022 08:54:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR64CaTpiwdw+X2y4IJaa8xP4OdNLN7ECuybgFIrKSPazGwtJkedE9zXLi45K0/LwJVdPMI1
X-Received: by 2002:a5d:5985:0:b0:222:c827:11d5 with SMTP id n5-20020a5d5985000000b00222c82711d5mr4687364wri.323.1660406079116;
        Sat, 13 Aug 2022 08:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660406079; cv=none;
        d=google.com; s=arc-20160816;
        b=wKoqXMy1hZUW3TPwimhp16TK/HHF3U3HN4TXMrMW8kRmHHVwOCfaVwqnpzWWZ+fL3g
         baCu2u1Mih+DIRpfi4zmQOqZAPUE0zGgiX+hIEIeZR7cvY88VBdc7rIwi5VLYkRhDnuY
         LsuFsA0c5p/+doDlVqwwMYE3i53qNI9GdUBYCItxvZu9242vofdRcDiVmCvM8GfsCh1D
         Aekt6jqI/ApC5hEpiGbEwuBGjOc7z8UnkVt/1mZpHUpiSl+PBd+4hZ1kXpqfdWvF+Arx
         gRqFRX0XOG1Ml4oD8Onbqgk/PBRHpGBT+/Mo+ShqXxjS5lcNSTMu7KdJhtFxK8q/Llt7
         v/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=vmKQeOmtrKcOtGX0100qIBCXUfc5fnQaRCUOdUINaLM=;
        b=w2so2/reCC0apRi18slvO/HHiaYlcVP6sNlVJHpLa5gmI3kYs1sFDD9EN9TdJDRAXH
         Dag5tSqTa8WxRFbNEMQRnYCLCbEuYZwDkXEn4bpJNVumqZxYbDP+NfyARWGqw9Rs2b7c
         rYOCm5VJu7gwFYACji2r4Yu137LSzsJS4rDHmJFoccYaX5Leai1gZtxmJ6XHzw/oV5Uu
         c1E52ey2c1CXznkiQ5zYDoOhn/7HXK7/9fRf2GBNkb+XOwGQdc0sjpq/ptG5ueL7jbwT
         FYTllq15TU/MqI8AS9paxF8oZy2x3RYo7mo5k7LZ4WXxcIjfKzShywTzsE4SR/2nONAL
         zOIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.17.24 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.17.24])
        by mx.google.com with ESMTPS id f14-20020adff98e000000b0021bbace5486si1156630wrr.262.2022.08.13.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 08:54:39 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.17.24 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.17.24;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.17.24 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1whr-1nP2do3yKv-012GCh; Sat, 13 Aug 2022 17:54:38 +0200
Message-ID: <531cdb6a-f660-b671-375c-a3819d90c030@vivier.eu>
Date: Sat, 13 Aug 2022 17:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
 <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu> <87r11miz8i.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87r11miz8i.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8nWnS8Fw0Kbrg56GpVJiYTJk+CQeS/Z3+Ew4Fqsh/reHwORm9Y8
 evLfHpOV/f1uV69kh9LkFrR7gqrhrOUD8ITlbyIulyEbx3BmKOhRMsUZNCA+i6pKEp93qIW
 kRkEraQra69gaRukDi3nPB8Lie6XUJdpDLHlTX0vuII3g0a5h+Rik35qF8nBk8wsMBavcOs
 SjMCQEArE5IEesUxWJ+Ng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DoAKKLWKxgw=:4tpbR/6022nCs4AL25Cvey
 kavUjQo4cl5CKz2L6lUtQFPxqmDRnsWs2ymeYcLC0h6hojHf7s4bcdJu4sikJPQIs/jEn6Rl3
 tzWnSVUN1wJ2ukHfax2oY4L1Iinrlr1ez7lZ/rr7LKseHx6/YPPQuaBnrRFcMDn036ELHrmYk
 0ZcNGavLjzO5kziPikHV2shtoJPbRw2FNUMDyzURJPykVrziJgPw2Kg7oeESiplRNU6eG6B5M
 Z/XyxSxrXsAXmPw+xAlRx9FsPWYr9hOv2Ibsb6gIyeoPOTbwQT6SRmdZtnFja4IXXdqZZZG3i
 It8eKIUOZHeewRiMq2c00W3YCvKtDywcoGgYXm82/NKzuEKTT7XAIUV6C+ZKXKXdx+QNjuEe6
 m4hnnMC1soReNZJKwXnXmwl9imNivZ6f0ON62H2gASRGXG9UI1+1XMeY1JTJTbJ0lqcBffgby
 gHkCrYJ8edCw1Dbvx08uy373kZY1oNQGeckFThvB57yGMdC58Sh0MZy35bh6xGWXs5Brvo/0A
 hdoSxrgjHSY1JAv+UtpfAkWzFC33GvJ7Pg3UCDNaXYDE2XNNnlZqXseFhIZ04EtRqtZUZueqo
 G7AmiERyR78903vbT2w+vz8EFVm4EdG3VKFleRko5VwREIC8LC62dPFMNmSJ/hszlFFXqan4s
 5qQK8lAxqO/v7V9kXyk36vTmrtJPyECBlE/53i8nI6PDYwnHUs/WRu2L4nIR0g1g1i1Lw3lIY
 ScJG/Lrt2AZRd/OwYzDe87OccZyYZABKY9WlEg==
X-TUID: dQ0zQcZb77pG

Le 11/08/2022 à 17:18, Alex Bennée a écrit :
> 
> Laurent Vivier <laurent@vivier.eu> writes:
> 
>> Le 11/08/2022 à 13:54, Peter Maydell a écrit :
>>> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>
>>>> Le 10/08/2022 à 22:47, Richard Henderson a écrit :
>>>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>>>> Sorry, I only noticed today that it's not submitted.
>>>>>> Version is not critical for us, as we build from masters anyway.
>>>>>> Richard, do you know a reason to consider this critical?
>>>>>>
>>>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
>>>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>>>
>>>>>>       On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>>>>>       <mailto:vitalybuka@google.com>> wrote:
>>>>>>        >
>>>>>>        > How can we land this one?
>>>>>>
>>>>>>       Pinging it a week ago rather than now would have been a good start :-(
>>>>>>       I think it got missed because you didn't cc the linux-user maintainer.
>>>>>>
>>>>>>       Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>>>
>>>>> It's unfortunate that it got missed.  It's not critical, but it would be nice, because support for
>>>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>>>
>>>>> I'll note there are missing braces for coding style on an IF.
>>>>>
>>>>> Laurent, do you have an objection to merging this for rc3?
>>>>>
>>>>
>>>> No objection.
>>>>
>>>> Do you want it goes via the arm branch or via the linux-user branch?
>>>>
>>>> If it goes via linux-user I can run the LTP testsuite but it takes 1 day.
>>> I think we should definitely run the LTP testsuite on it, so
>>> taking it via linux-user probably makes more sense.
>>
>> ok, applied to my linux-user-for-7.1 branch.
>>
>> Running tests.
> 
> Any chance you could pick up:
> 
>    Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when closing thread
>    Date: Wed,  3 Aug 2022 14:05:37 +0100
>    Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>
> 
> before you run the tests?
> 

I've tested it, it works fine.

Do you plan to do a PR including it or do you want I do (there will be only this one in mine)?

Thanks,
Laurent

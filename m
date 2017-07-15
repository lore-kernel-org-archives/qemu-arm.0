Received: by 10.25.44.15 with SMTP id s15csp2487851lfs;
        Sat, 15 Jul 2017 10:54:47 -0700 (PDT)
X-Received: by 10.84.128.76 with SMTP id 70mr22450532pla.229.1500141287686;
        Sat, 15 Jul 2017 10:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500141287; cv=none;
        d=google.com; s=arc-20160816;
        b=RO/QEWL4/GfRav9BC0Z91PEVQ+1p+9gGTeWuOqD5qVoWCv3GEU5pOgTA/5CfYol1Wu
         KvH8UiVuQER61i2+mM5akSf75s+IG8LPDVwXqFgwIIIgC8cqoQM0AjYodTbX7ny+aSk3
         sivIH6vV1LuamAm6S+S4mlR91Nom6LojW8Q8jyNMYN5jX5l5OuoVYzNjzi7JcF3tyhVz
         GqFTgpVVtYyOcjXohprOkkfSca/DehUk8X8A7rvzzRSomGePc8qqYZElDej704OwrpZZ
         L/G3aiF62twFn21z1q0AsYqBTjn/v1maS4605xgJiR9D/fxr4BtzlXyTr68YG9KJp03e
         ZwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=zgJQaM3C3VeXFGaz9auMLIhG2wPdI0+ADXJ15Uwy5nU=;
        b=Bm/E2g+yT8AUqisAhl18Cp+ciWqgt1lYMmS6XoxSZI7i9bYvKTq+SBaTU4t4cEeqpN
         z5+rbSlQGoyORK3DomStuH3rFo+3DBS+xQO9V0p1BAGi14ShWtokd5McUhgctBI7JlTF
         zZUAilheLjgNfGLs1urxRdjA303QaD1yk+P8I0/9uWybVbgDTHkasRYcqI7PhP2Hgtgy
         wOwfVVNkMBwbAdc8h/UXUrXjd+SvkAV4grqeV6B8lgMLBkQGZ+ch+rb/ESzOs3q+WiZG
         cru7zSzAkfhuRc9HN/FM2dQ6+p20R8pFZ8068yXKxR2HFITPDE6P5+7cGxFHdCwpYa9H
         /Wrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=E91qZEC4;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::230 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com. [2607:f8b0:400e:c05::230])
        by mx.google.com with ESMTPS id k70si3688129pgc.518.2017.07.15.10.54.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jul 2017 10:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::230 as permitted sender) client-ip=2607:f8b0:400e:c05::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=E91qZEC4;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::230 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x230.google.com with SMTP id v190so1880013pgv.2;
        Sat, 15 Jul 2017 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zgJQaM3C3VeXFGaz9auMLIhG2wPdI0+ADXJ15Uwy5nU=;
        b=E91qZEC42XqMTIxT0qJljX7IOTOFX6miV4z5piisxdLUcXOa6eiymjN953T7QyIeOH
         gtoAFr92Mqu/lUvijIhysGavraqI13eZ1pVo4wdUnXo8eE9P0Rv6mnoTcwrRnd2IKhU7
         jHomhk6EhyDod5csl4Yz5lC8DmQWEVbAinUGMZ0b6WPYthPp9n/wfHeQLGEbrKKu/L43
         eGcKnX7KicLJI1beJuUkO8RuedvAyTwi/AvuBC3VsKbjVjaavmgfMx4b6PnPPuHCogxQ
         YWpGnooM5y633ID50Vw8t1JDxGq7oZIUdVgN+ffYhBC+LUg2xmUh2Ptw53lMY82kAzfz
         UbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zgJQaM3C3VeXFGaz9auMLIhG2wPdI0+ADXJ15Uwy5nU=;
        b=aIIo6Zb8bE6iFhaXM5SRHtpyI1HOw7N774FiMLr98xJBj2El7vtTrTAOFi4zk1OpQU
         Asec4IhoftajGbS/Jzoy6vfeNweRmN2wMwLearfxUBfv/lst5Rxk9zA2bfq1TxjoA8V2
         YmlPshyE2I9x7SQaRzTmjKgEw2vZdbZkZ/A/BuMJAbqGgSoaH5qCOSbGJFDEHexgX6qg
         6qs2ACFkc5+v3r0/qYGh1n+LSBI4lFw1BJr7O6o+7fxySxgitidKJPXBF8hLoFBMf3rO
         ciq/3Ehl4uD0WGKMsrO0Fi4P+o2eXGdEUFKGRqY7OiO4dv+CSQ1tEsP8CUgzv7vFx/X0
         o3zA==
X-Gm-Message-State: AIVw1112CqtXaLXVK0A2fabzTrvef7wk0RSQ3yPHEZw0FbXdmZdJoo+L
	feKlHkU1H2ctfqAYnqw=
X-Received: by 10.98.64.7 with SMTP id n7mr11108799pfa.76.1500141287275;
        Sat, 15 Jul 2017 10:54:47 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id z69sm4900018pgz.42.2017.07.15.10.54.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jul 2017 10:54:46 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v13 22/26] target/arm: [tcg] Port to tb_stop
To: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
 <150002534291.22386.13499916738708680298.stgit@frigg.lan>
 <28a48f7c-930a-389b-b39d-64c43654cd04@twiddle.net> <87a846b0al.fsf@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f2e2da5e-0790-4c30-d398-8937c43c1ec4@twiddle.net>
Date: Sat, 15 Jul 2017 07:54:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87a846b0al.fsf@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uJNfysrnRivC

On 07/14/2017 09:56 PM, Lluís Vilanova wrote:
> Richard Henderson writes:
> 
>> On 07/13/2017 11:42 PM, Lluís Vilanova wrote:
>>> -        dc->base.is_jmp = DISAS_SKIP;
>>> +        dc->base.is_jmp = DISAS_NORETURN;
> 
>> Really should fold this back into the patch that introduced SKIP temporarily.
> 
> Sorry, I don't understand what you mean.

DISAS_SKIP should never exist in the patch set.  You should simply use NORETURN 
in the places that you first used SKIP.


r~

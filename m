Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp39944lfq;
        Wed, 23 Feb 2022 02:53:36 -0800 (PST)
X-Received: by 2002:a17:903:3093:b0:14f:dbfb:167 with SMTP id u19-20020a170903309300b0014fdbfb0167mr7359654plc.115.1645613615969;
        Wed, 23 Feb 2022 02:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645613615; cv=none;
        d=google.com; s=arc-20160816;
        b=UDEkqWWYp76ZqYqZdi3c9XZfTJE+Yj9KStImI0no+Yt87XMhZ5AbTO3B8j+bV/9G0f
         tb8IbyrRim7ZNW4/eYC4Y3/Aw6Sk7eeYSRA9Xlu9Fuy1pAaxV5jXDRERvOTySmdwQyI2
         bFllx8x35vhKUF/87bqN14TI0nouIOmozZU5Plp3jJFY7xHo5S68iAy1IGBVHgS5xLbR
         DUaHob8vM9ZyjfI0W0uxsGWJ5HRnu6DQTayZhTBP/970Y63SWU2sOaEPCsAOJWevsSx8
         nwep2BVWCyFbOaTZl8EMt5dXqn6IcodC5Q5ysor7q6Gk2gkROHTcyVLxsWNBQFVUw3ep
         zDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lZssqJd+n1XnpkVpUFZXahFNvB8fU1LEeANQDXiRB+E=;
        b=fMf0oMQivqLCZN0mY1P4TQDrF+dYrW0tagWrGK2WMtg4xEUyH3ogW+aFjqRiY4uqpl
         okGwPsfoCHMIRrjK+IdArJfeqfNpDGz8Bv+PCBgVDXrmcxJDgip6xMpvGsG+VzIIVjzP
         y2lfCKTJ47oDdX0hSQE8o/gyoPEzsJErmQEiD7zlYcgKeAqmNloB812bEBv2iA6M9z0/
         lICiYK9jDc4uhlPrmZHPOenGS6nz0nnNCgp8O/06o0lZolh/5TgMD3MzFceM9r1lqFZw
         //Xdu5OzWUcyl36QrBlkZGXn6O42qhBb201dtG1i6JgzFCNRB8bmIRfJfxNPu6WRvK9O
         kM6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7nw+Xsq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i15sor181377plg.132.2022.02.23.02.53.35
        (Google Transport Security);
        Wed, 23 Feb 2022 02:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7nw+Xsq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lZssqJd+n1XnpkVpUFZXahFNvB8fU1LEeANQDXiRB+E=;
        b=i7nw+XsqWVwlXqWcciWH859tE8P46VSdYVy3GHT08dXdCG8c9XF5E/fDNtF9M4prPB
         +wx7q7ZzQ1jIE09cuXSa+OQSZb3SceEeUydpdm2jLY+/4KmqVKct17/5tx1QZb4vS4uO
         0w+QHGwJMBjer+8U7FWZzdsF2qXl3stl2/KBQPZXpAvJf0FNl3Xp7a2IZSu0TepJPao1
         p8n3pOlZvgBN8BqhDoNkIoDY9zPE8+6gPEVDjzfAS8iu5OupGAco26qHYHIvYZVthzsz
         WKuhyPRsfHveeTPWaSMNd8Oeh7ZocEo4zTBEIhNKRRbLoyVgIfOwtsdZSffamrKoTSw9
         wTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lZssqJd+n1XnpkVpUFZXahFNvB8fU1LEeANQDXiRB+E=;
        b=SkNgQnrhPB00UVv98bysLidTmWQgmwFvqBO4oU/Al4xXQttabkQjxDaiF6BicvvLmr
         TxNkoWvQKA2CsMB6prPt3w5E3aJlvUgY6tui694h1V2gVqIOFNMZetNmo9iQWtCKBAxN
         aZwwrb7v7c4qaSXCXJD6ExNs2jvG6l5NjeYdENnu202o4aTwM20FEguyE/1xOQkZOiWi
         PSj/xbuzFMaeMqMV199PAiOh2rI/ALI9TVPBSlEVwAB1/HTo+nf6mAK+tkbmOAcefeWM
         D7m7vgxz5IiRJLlpFa+v6Dh/kqaifPe0NlLPKniPEptZYqhVfziXSA9WKuZJd4lpacCm
         zguQ==
X-Gm-Message-State: AOAM533I/BuvaJPiAeI4/1Yp+7m8fgdEjVuWcTNlpHXkOsH3M/HEJXX+
	0TLyuN/aQVcry7PpYba8N13J6pUKPDk=
X-Google-Smtp-Source: ABdhPJyeaZ7QfplSr4IwxWXQHitfH4L2DC+WGFLdEfJNAgT3XJjCMsOZ7CLv+BDooOtUc7pC6aRCjg==
X-Received: by 2002:a17:902:ccca:b0:150:406:6236 with SMTP id z10-20020a170902ccca00b0015004066236mr640967ple.67.1645613615369;
        Wed, 23 Feb 2022 02:53:35 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id q4sm24425046pgn.42.2022.02.23.02.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 02:53:35 -0800 (PST)
Message-ID: <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
Date: Wed, 23 Feb 2022 11:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laszlo Ersek <lersek@redhat.com>, Cleber Rosa <cleber@redhat.com>,
 Oleg Vasilev <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: r9v7c+Z36scZ

On 23/2/22 10:19, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>
>> If you want to boot a guest using EDK2, you should use the images
>> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>> not these images.
> 
> Do we have any other images in pc-bios that are silently
> "do not use these images, they are only for a very specific
> test case and nothing else" ?

I might try to move that to test/. Gerd, are you OK with that?

> Also, "make install" installs these EDK2 images, which doesn't
> seem like the right thing for "this is only for one test case".

Well I'd prefer we never had them installed. Today I don't remember
why it ended that way. Gerd, similarly, are you OK with not installing
these images (after a 2 release deprecation warning)?

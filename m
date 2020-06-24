Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp244382lfm;
        Wed, 24 Jun 2020 01:45:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEqyXXgYUbGIeLE9tov5I2bG54W3fW6O5qAfNxd8uNFaBVhHfaIbWAJrQhpftbGdJRkR/d
X-Received: by 2002:a5d:4910:: with SMTP id x16mr26792345wrq.401.1592988304208;
        Wed, 24 Jun 2020 01:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592988304; cv=none;
        d=google.com; s=arc-20160816;
        b=qtimY9Pj7I69HvAs2/ARtCCr6OZ5gHpZL1SDCIdflW+tCpmk28B5QHwZsqt19LmnVe
         RZjiQemF5E3F3lH6sCliPaCkWZdAq0SgbxL8khzxdLxSiPXIEGlHu3OEE9SoMvek4Lk6
         jDnLnYYF4KtXvEJ0Hi2ERGfk4MG8LYth2xioi+VBT8O5120E8iLAPGpM7YnwztZ/nkMx
         BX4PL5dq9/Wb6zxnAe9jULWQ3qhvbmvJYCfwY8ZUclga0YFT64yv6AxWwjwqC7wUPkR6
         d7qVlLh4RwQJNmkmsUt9SFDGzgSJkjM7Z+5b1t700hIrO64h2JBbxYLWjTXMiDg4SZyr
         R74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CdNxn2zsUDULGDtKBiLogKaGzvkks3808Mqi90L4qak=;
        b=foEk36UnVlHRcQRRI4EfId6YDRTHD0TozO0VCG3DUKj+vFcSAvSyOUeBoseTcKqPo+
         G6PsujGDwreULSpc624me5Efcqc1nCTA8Vr7QC7CvPCFIieA0tmrZumQcaxrj6a0gQUU
         AXbnfq+lVT8J5jK1TWMX8AHp61+4K28dMhTYCMAe+2AoxG/jamStYBUynYuZ9tEmlFCE
         69+5UncVi1oVm4bBERTslArviH8qbxjHR7/2AY66dzpklfZ/0uHBGEbCkyebjrIcsR94
         OBRXmB0gEQXQnmdIxYDla1+sdKdAS+Xt8GCRfxGAWRxiNeuXF0Jv7RGZ2rCl6PejWNb3
         ui7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Return-Path: <v.dupaquis@trusted-objects.com>
Received: from mailex.trusted-objects.com (mailex.trusted-objects.com. [149.202.244.204])
        by mx.google.com with ESMTPS id c19si14578368wrc.320.2020.06.24.01.45.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jun 2020 01:45:04 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) client-ip=149.202.244.204;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Received: from [IPv6:2a01:e35:2e98:43c0:22dc:968f:2590:9879]
 (2a01:e35:2e98:43c0:22dc:968f:2590:9879) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.1913.5; Wed, 24
 Jun 2020 10:45:03 +0200
Subject: Re: Role of qemu-arm
To: Peter Maydell <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm
	<qemu-arm@nongnu.org>
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru>
 <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org> <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org>
 <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
 <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com>
 <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
 <CAFEAcA9RAXmMeHFWX0La8yLL3M4mjC+mpsW6AvJFfsP8aGnfqQ@mail.gmail.com>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <be9893b6-f3c2-2e6c-d00e-9d8ce803b946@trusted-objects.com>
Date: Wed, 24 Jun 2020 10:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9RAXmMeHFWX0La8yLL3M4mjC+mpsW6AvJFfsP8aGnfqQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
Return-Path: v.dupaquis@trusted-objects.com
X-Originating-IP: [2a01:e35:2e98:43c0:22dc:968f:2590:9879]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
X-TUID: x9dkuSIGI/C+

Indeed, for us it has an interest, as we do libraries running on
cortex-Mx cores. We are not linked to any specific board and can run on any.

Currently, we are using a basic board (the netduino2), and do not make
use of any peripherals (that's the goal of our project, being able to be
used on any board, with the right core). We do not even use the IT
controller.

You are right to say that there is no need of having 'plain cpu'
emulation, as long as you can use any existing simulated board model.
So, as long as there is

By the way, my original question was on the usage of qemu-arm, and I
have my response now :) It has no interest for cortex-Mx devices.

Best regards,

Vincent.

Le 22/06/2020 à 15:43, Peter Maydell a écrit :
> On Mon, 22 Jun 2020 at 14:03, vincent Dupaquis
> <v.dupaquis@trusted-objects.com> wrote:
>>     It is a shame, so I suppose I'll have to stay with my emulation
>> using netduino2 or so ...
>>
>>     That was the reason why I tried to use qem-arm, which is probably
>> crashing because what you just suggested.
> qemu-arm is for "I'm a linux userspace binary"; if your code is
> a userspace binary then you can use it...
>
>>     Is there a way of pointing-out the interest for the feature ?
> I'm afraid we don't support or have any plan to support
> "just run a CPU, no peripherals". I don't think there's much
> utility in it -- M-profile needs the interrupt controller,
> almost any setup wants to have a UART for I/O, and you need
> some actual RAM, which then leaves you with the question of
> what address to put the RAM at. At that point you're not
> really "just a CPU", you're "a minimalist board that doesn't
> correspond to any real hardware". We've found from experience
> that emulating things which don't correspond to something
> in the real world is not really maintainable and supportable
> in the long term.
>
> If your code will genuinely run on any M-profile board,
> just pick whichever one seems most useful and ignore
> the devices you don't need to use. (I like the mps2-an385,
> it has a bit more RAM than most.)
>
> thanks
> -- PMM
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert de la Lauzière
13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>

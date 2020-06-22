Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3164989lfm;
        Mon, 22 Jun 2020 06:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrwlx/UoButmU1jbADFWUrYGG7i0Po6KGZPTWYZ4F2bzrPW3MBtARS4vNMti2q6BJA7a+R
X-Received: by 2002:adf:f450:: with SMTP id f16mr19214528wrp.307.1592831006021;
        Mon, 22 Jun 2020 06:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592831006; cv=none;
        d=google.com; s=arc-20160816;
        b=jcVgcA8PR1/kjalM2OMiBjrdQcYNrLK+eYuipFFnurL9hLUh1a0OJcoWq5Zd5nT2eZ
         Mn3qq7QeetmUitUSy8uagVU6Ca3tUsphbF/oQ626jSNPVuJkHKqvAbD8JcJ8H1z3ZM2/
         4yaDxAj3o4L+ymeqdUhL/c+IIn9HRjC+eWCrikfCD5mqfzFLW09bNG1Dej5Dt41Whzpd
         H+Gqd7jVSLQfPN74+d5nFJrEgKvtRL1DJxTE2If9UzmMdO4rJgwA6pB9vz9ws9i+ytRh
         gxF2QIe3iwSvs32qJOhWAp8Z+Xj87P3RJWG16CNTndR1WVPRQcLxdBhnnrt9ttbHVbAn
         I3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+UgBs8BZxfOfE9D8Jp30G0wCK7z3IF21oQOCAMBlGGA=;
        b=BeoktSQ9GUv+QGeE6d19Jbwo3DY4NBbysLtE095QCgIA7y/oU4ReRr/tLR8ggaNb1E
         lB/YGnLRN1ZDK4IywHF8eGhuHdz1hWURDvX0sfLWkl1SmMQVQATErW2ECQ9d3z/MyIXD
         yA1eJEonYs+rFWxYdqTx2Zn7WMV24qXh6oMyNo3NXeFcN01znFe4YUpZUd2xlSvFftae
         bQ/LKpdHGRXd/w0e09ttt0dZJX9AZyyptPQh6WX7xwv+0zr0O0tA3CkgDEAgiTRqKPuq
         V6I7PThvQKlVdD+3/IZ0xVRga11jnkVhiyXohm3DQuOJ5R9zzB1j6QVuv07z3aqNG/Ov
         otww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Return-Path: <v.dupaquis@trusted-objects.com>
Received: from mailex.trusted-objects.com (mailex.trusted-objects.com. [149.202.244.204])
        by mx.google.com with ESMTPS id j25si15825285wre.264.2020.06.22.06.03.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 06:03:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) client-ip=149.202.244.204;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of v.dupaquis@trusted-objects.com designates 149.202.244.204 as permitted sender) smtp.mailfrom=v.dupaquis@trusted-objects.com
Received: from [192.170.0.219] (82.233.132.60) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.1913.5; Mon, 22
 Jun 2020 15:03:24 +0200
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
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <e9ad4bb6-e8c9-55f5-565a-01c3f35aea92@trusted-objects.com>
Date: Mon, 22 Jun 2020 15:03:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
Return-Path: v.dupaquis@trusted-objects.com
X-Originating-IP: [82.233.132.60]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
X-TUID: ErmDNiskOwhm

Peter,

    It is a shame, so I suppose I'll have to stay with my emulation
using netduino2 or so ...

    That was the reason why I tried to use qem-arm, which is probably
crashing because what you just suggested.

    Is there a way of pointing-out the interest for the feature ?

    Best regards,

        Vincent.

Le 22/06/2020 à 14:16, Peter Maydell a écrit :
> On Mon, 22 Jun 2020 at 12:28, vincent Dupaquis
> <v.dupaquis@trusted-objects.com> wrote:
>>     I essentially work on Cortex-M0+/M3 devices and I will have a try to
>> your proposal !
> The 'none' machine can't be used with M-profile CPUs, because
> it doesn't create the NVIC, which is a mandatory device for M-profile.
> You'll get this error message:
> qemu-system-arm: This board cannot be used with Cortex-M CPUs
>
> (or if you're using a really old QEMU, it will crash or misbehave.)
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

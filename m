Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp79485ejb;
        Thu, 30 Nov 2023 01:04:07 -0800 (PST)
X-Received: by 2002:a17:906:194f:b0:a04:3f97:f3f1 with SMTP id b15-20020a170906194f00b00a043f97f3f1mr16050706eje.58.1701335046962;
        Thu, 30 Nov 2023 01:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701335046; cv=none;
        d=google.com; s=arc-20160816;
        b=nKV9HnslNvmDIzYzYj1zgvb2ZEpT1jenR0UvqKWaYs2Ziq9FZ+TE6EFD+H5QajeDna
         h7tISuWG2z0O5/uLfhy/8D1Qxa0vHivtw/zeLdGeyA/K9vQDM6kWIOWTCQAQKbk6DrIk
         8yJEIVY+l2gej042GN6LXetTWjwbwCX/a7Z4Rb6zGu1sbd49Lcju8ABozzrdJUlEoIO0
         5hGN9V923+fxUpSAAGsklPvFMoO56AU7TZ1V4+zi6zF5kkmFeo2iCWjGmUip78wwRKlz
         Uzz7yVOu/v1rUqlQlLoKI8Ty9VZ8DPUFEul00lC+vFcBmC0JUY403qffWe1+S0gbcKWg
         Tldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:dkim-signature;
        bh=rDG0LfrN9KzuY1dutbAJHJsyvk/SVEQtsaapgDeTQgk=;
        fh=6nAzhoAXHalBwI7r8HAtyQCRHjPDlLK1O6MeKCMUP9E=;
        b=eA7lVwXLhCcUiScR8wDix5/LtuVzxcP7K2qEBpr4VqEGfzGwG+kNMWhezIYpKmaf+u
         BQzond3QQ42EZQk1l67J8VkDWkwuHiEHoUZEyZ7ydXT3rimnIKTwZUXWhSGOul4cXTWP
         s9DejXdZR0E1z6hhuRJn09RK5cz9brMEGPxxr7bTpYSaniJ/fXfHsAb3WwTIQ6pKE/o7
         NEbl85dWIO4zNwckhI9Bbn3Iqnvfcm7jHIRTo4L6DcPk7V25AsoJ4NwR9n03D71hUsY0
         IyN8aaJjo7BG6O3Al84KXVxjDWAxRv4bIsEcCdRZ8jn4e8MtoQ091R9NjYdSuuT+U0fd
         yXnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YDeZEk4I;
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <xadimgnik@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e3-20020a170906748300b00a1839fce9c3sor264160ejl.5.2023.11.30.01.04.06
        (Google Transport Security);
        Thu, 30 Nov 2023 01:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YDeZEk4I;
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701335046; x=1701939846; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDG0LfrN9KzuY1dutbAJHJsyvk/SVEQtsaapgDeTQgk=;
        b=YDeZEk4IKSIX2tIOIM8Rfi+cLEaw8lG//vlKGHgoHFlQQkbLF8he7iJiV2k81dXOpU
         vFzJQbydD60EGMdG72g1Z6ah5QVS6MRSovOtJDDCRJLUMIgkjQkyobP5iVfHmxlXVglE
         PovG02xYHxPAYMBwB4F4RouAwghNZ83b04YFcb24uOTqXBLL+ih/SomxDN3q50+48b9I
         nPKK+RoEXAVYd/aeyNxXCnpvq9El7Gft674pPAYprbArE+QtLTiwvtqDG/egHpa7LNtB
         btkqkNyGe1qRf7tXhilaj+0peS4AyuISlFrvpFcoSncfppdvZiXXMtsbOWUSxypSc43o
         X5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701335046; x=1701939846;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDG0LfrN9KzuY1dutbAJHJsyvk/SVEQtsaapgDeTQgk=;
        b=nnaWBqSkrGYjpXokoIxWMmO4j3BKK5v8wNQZndD2Zy3pCknTl32iNME9TtnM5s2foN
         FndYsg4X5zrFE+lI6aNq+Ky6tEyw7gGnLCdaF4o6Lgt85t5g3chaXCHQW/NBQ0TvHcTt
         3CXZou3fioVTf5Uoo+dMt73Z65VItZM+GdPIuJ9LolkQZ2V5COMVE4ZlHQplyhPdXtyr
         vHwTfzcBgUinZxypciskEzueZCeXqCvBKxUbDUXHr9P8a9vOF2/ZL6Aux6+dLP/nmF+l
         8h3NZhwq7BbLeVPsGTCmsBaKv+Tvz5qcrxC+doW6+nKPkLmH9LL5kAiJF+JVe0U/n9x9
         ++lg==
X-Gm-Message-State: AOJu0Yy9p8cB7PjrlFqZkvfIIO6npg26wxp122DMhis6Uz2aeY8mm2dF
	qZkf7zLPMnI59E3jikvSRNc=
X-Google-Smtp-Source: AGHT+IH62q365iHhXfNeCdgPZMilj33GjyyKhNs3sjPFImh+k7bvQx+U/QmZwntDvSzeLzApdBDisw==
X-Received: by 2002:a17:906:197:b0:a02:9987:dc3b with SMTP id 23-20020a170906019700b00a029987dc3bmr14284857ejb.15.1701335046283;
        Thu, 30 Nov 2023 01:04:06 -0800 (PST)
Return-Path: <xadimgnik@gmail.com>
Received: from [192.168.17.21] (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709061cd000b009b2cc87b8c3sm438680ejh.52.2023.11.30.01.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:04:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <67642c0a-4c2d-4f0b-90e8-9b125647af6c@xen.org>
Date: Thu, 30 Nov 2023 09:03:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/6] qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to
 QEMU_BQL_LOCK_GUARD
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-3-stefanha@redhat.com>
Organization: Xen Project
In-Reply-To: <20231129212625.1051502-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Ig2vzqKCn16I

On 29/11/2023 21:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/main-loop.h  | 20 ++++++++++----------
>   hw/i386/kvm/xen_evtchn.c  | 14 +++++++-------
>   hw/i386/kvm/xen_gnttab.c  |  2 +-
>   hw/mips/mips_int.c        |  2 +-
>   hw/ppc/ppc.c              |  2 +-
>   target/i386/kvm/xen-emu.c |  2 +-
>   target/ppc/excp_helper.c  |  2 +-
>   target/ppc/helper_regs.c  |  2 +-
>   target/riscv/cpu_helper.c |  4 ++--
>   9 files changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

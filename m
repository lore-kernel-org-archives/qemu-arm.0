Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp547507ejb;
        Thu, 30 Nov 2023 13:41:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpWL/u3UYVod8Mkkyg9uvfX6PP0Rcv6Uy5uPNcMBVVC4SMc8wD8dRuq3qo3nq/JF0A4nNF
X-Received: by 2002:a05:600c:329b:b0:40b:5f03:b42b with SMTP id t27-20020a05600c329b00b0040b5f03b42bmr5003wmp.333.1701380472260;
        Thu, 30 Nov 2023 13:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701380472; cv=none;
        d=google.com; s=arc-20160816;
        b=DIOz658FJs0VHAyKdzxFVDR+cJ/7NLKa1rKKtr3O0HhBst5MzKk1evoH4HQe+jD8jI
         KMbiuXA5I0qdR1yY9+p64lYB8Lz4QUw04bjm40R+FTK810OFuDG48qsxK1mUSafY2luZ
         NDp4ImndiFETIWBLzI3Lrp/0XJtDc3wYRgxaF/dyGMxsA/nEVVcAfTXcdGwTE2SEuwCt
         2Tsods9pqhQaCs3eNDdbVzRt5MTiMb/T/dhLDZT/p6gV8MXWuCJEH46k/sjD28OJQUKD
         UYHxznRs4MswxgBfKDl0CalfXe3SYxwZ6EQSBzuu+d4hLITxTPacuEQM0yKi8Zb7+Id/
         mWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=I4Bmwzi+n8R7m3xNJd5DSNpSyTsfGWUD6i49w1457sk=;
        fh=+ehQwaUFY27yPnB34ilabSavbtSiVvMwjjxCNbgbIqs=;
        b=sXB1B3xZ2tPj6RcIfg3rtizGuuBNYWZ6JXQylMhykn58kKo6e2N2g+zUC3R3sT5U9N
         0pjfQ7QXH8luXowlF+RlZ48kgmyPoe/YteRScrhFyST9sBKQlXlJjSvKAGtMk+uh2YEd
         /X5omK4PayKrI9pHlPHrH3CqqoYdfGFAg5uaHKcAMQI1XXA6QVTqXcHqcUMxxZRvpZHK
         K9Jp7Typ6npnhiXxi8GsrCt61P0ucd8JJ+yRe2ZfojkwCU62Gj1ar+bvZP3bCof4EQp/
         9M1bNgUYSxzmSBh2DAW/lNl+J6nSJBJvSXWusHRI/zzD3r+EQqZSqtp5suEOKonWz0gh
         sftg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [152.66.115.2])
        by mx.google.com with ESMTPS id x18-20020a05600c2d1200b0040b3d4f7d8asi1119737wmf.67.2023.11.30.13.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) client-ip=152.66.115.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 4629E75A4C4;
	Thu, 30 Nov 2023 22:41:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
	by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
	with ESMTP id wx21V_Q-LTE0; Thu, 30 Nov 2023 22:41:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 4F947756094; Thu, 30 Nov 2023 22:41:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 4B666756066;
	Thu, 30 Nov 2023 22:41:09 +0100 (CET)
Date: Thu, 30 Nov 2023 22:41:09 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Stefan Hajnoczi <stefanha@redhat.com>
cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, 
    Jean-Christophe Dubois <jcd@tribudubois.net>, 
    Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org, 
    Song Gao <gaosong@loongson.cn>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    David Woodhouse <dwmw2@infradead.org>, 
    Andrey Smirnov <andrew.smirnov@gmail.com>, 
    Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>, 
    Ilya Leoshkevich <iii@linux.ibm.com>, 
    Artyom Tarasenko <atar4qemu@gmail.com>, 
    Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
    Max Filippov <jcmvbkbc@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>, 
    Jagannathan Raman <jag.raman@oracle.com>, 
    Juan Quintela <quintela@redhat.com>, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>, 
    Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
    =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
    Aurelien Jarno <aurelien@aurel32.net>, 
    Hailiang Zhang <zhanghailiang@xfusion.com>, 
    Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>, 
    Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, 
    Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
    Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>, 
    David Hildenbrand <david@redhat.com>, 
    Markus Armbruster <armbru@redhat.com>, 
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
    Anthony Perard <anthony.perard@citrix.com>, 
    Harsh Prateek Bora <harshpb@linux.ibm.com>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
    Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Akihiko Odaki <akihiko.odaki@daynix.com>, 
    Leonardo Bras <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
In-Reply-To: <20231130204325.GE1184658@fedora>
Message-ID: <2e5f3da3-958e-fed3-5e15-0e9aa09159e1@eik.bme.hu>
References: <20231129212625.1051502-1-stefanha@redhat.com> <20231129212625.1051502-2-stefanha@redhat.com> <ZWjr0TKxihlpd1jm@x1n> <20231130204325.GE1184658@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: 3j7EVbPOFwCf

On Thu, 30 Nov 2023, Stefan Hajnoczi wrote:

> On Thu, Nov 30, 2023 at 03:08:49PM -0500, Peter Xu wrote:
>> On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
>>> The Big QEMU Lock (BQL) has many names and they are confusing. The
>>> actual QemuMutex variable is called qemu_global_mutex but it's commonly
>>> referred to as the BQL in discussions and some code comments. The
>>> locking APIs, however, are called qemu_mutex_lock_iothread() and
>>> qemu_mutex_unlock_iothread().
>>>
>>> The "iothread" name is historic and comes from when the main thread was
>>> split into into KVM vcpu threads and the "iothread" (now called the main
>>> loop thread). I have contributed to the confusion myself by introducing
>>> a separate --object iothread, a separate concept unrelated to the BQL.
>>>
>>> The "iothread" name is no longer appropriate for the BQL. Rename the
>>> locking APIs to:
>>> - void qemu_bql_lock(void)
>>> - void qemu_bql_unlock(void)
>>> - bool qemu_bql_locked(void)
>>>
>>> There are more APIs with "iothread" in their names. Subsequent patches
>>> will rename them. There are also comments and documentation that will be
>>> updated in later patches.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>
>> Acked-by: Peter Xu <peterx@redhat.com>
>>
>> Two nickpicks:
>>
>>   - BQL contains "QEMU" as the 2nd character, so maybe easier to further
>>     rename qemu_bql into bql_?
>
> Philippe wondered whether the variable name should end with _mutex (or
> _lock is common too), so an alternative might be big_qemu_lock. That's
> imperfect because it doesn't start with the usual qemu_ prefix.
> qemu_big_lock is better in that regard but inconsistent with our BQL
> abbreviation.

BQL isn't very specific for those unfamiliar with the code but it's short 
and already used and known by people so I'm OK with qemu_bql with some 
comments and docs explainig here and there what bql stands for should be 
enough for new people to quickly find out. If we want to be more verbose 
how about "qemu_global_mutex" which is self describing but longer and does 
not resemble BQL so then comments may be needed to explain this is what 
was called BQL as well. I don't mind either way though.

Regards,
BALATON Zoltan

> I don't like putting an underscore at the end. It's unusual and would
> make me wonder what that means.
>
> Naming is hard, but please discuss and I'm open to change to BQL
> variable's name to whatever we all agree on.
>
>>
>>   - Could we keep the full spell of BQL at some places, so people can still
>>     reference it if not familiar?  IIUC most of the BQL helpers will root
>>     back to the major three functions (_lock, _unlock, _locked), perhaps
>>     add a comment of "BQL stands for..." over these three functions as
>>     comment?
>
> Yes, I'll update the doc comments to say "Big QEMU Lock (BQL)" for each
> of these functions.
>
> Stefan
>

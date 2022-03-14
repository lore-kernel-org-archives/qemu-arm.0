Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2272431lfo;
        Mon, 14 Mar 2022 09:41:28 -0700 (PDT)
X-Received: by 2002:a17:902:ecc3:b0:153:5f6a:9fb1 with SMTP id a3-20020a170902ecc300b001535f6a9fb1mr8376170plh.92.1647276088162;
        Mon, 14 Mar 2022 09:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647276088; cv=none;
        d=google.com; s=arc-20160816;
        b=kGbVMuOvf2POfw+/yOi1+CfsxkiVMc86ot/xaVawNxKMQRaksYn5hM7Tub6TSBlm5f
         zBmv86CRHBYKPSZvsp/oywtLxZxGuABSwj7qYrPNjQ7RGysVNFIlz10kmZUPg9lLLPGs
         CbRP1UV5DoT6+JPDpQIQHbUB8IcBgFg053LtGsJrO8xgXEBAs6dPx0DhsMGuUvgUUmYo
         azbxRB7HdBdE6kqd41w8UF9SdhpEof+cg9G7v4wY9nX8DDLNawb/U/OuaE1IVx3LPCrr
         qh18MWFV/xH6ai+bq02Fiwvvw3mWfsLdEhQUgpksaK4L6GQ6spq1CpPV0wYfNA4Vl3AL
         JC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
        b=v1qNHlHRlbQ6SbXQc7rEakWCaQpSBYx2s17uLjc7o+E+npww/9mwKXcFvEd5clha9c
         4G3jS2zvKu2+v+QuSMeveqrYiDG51O8ouU581kBGg9ylUTBSSnuxNlSrAtb4F8J2Ey6G
         XX3gyl8y4bI8uZz6/t5UNcjyGqrxPQYFrgyNIuXivfnIUzaonCGQhab+KFN6d2Y+sj49
         5NBZnw6X7KGlawb/thmB3M2nTCtvGJ7p4c/kYcAJR+kYnGIkzPMnJU4vxGtf3AMPDHsY
         S6VIwq1czvaUelRSaUAaZbBhrZXSq8ih4BKnwuHeLQAXNP/BinmiySjVG3xNHAdZUpQ5
         507w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fmpUDGOi;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pi2-20020a17090b1e4200b001bc924ee468sor5128731pjb.33.2022.03.14.09.41.27
        (Google Transport Security);
        Mon, 14 Mar 2022 09:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fmpUDGOi;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
        b=fmpUDGOi8OZUJgMmHkU4ZiecIW8QqM1a02qsRb5yuKVzZqkKGRd0gAv5AfPJZciLC2
         wyfwXolLcpsITp6G/VgGOl4n+QuCOLQk3Yq16Z7BHeO1D5wgcSAf/IDLm72KrjEXZHV/
         M4BRhf0N2E/JnyG/RHuUFZTe+nWC8OwxMU8ozx661gpkTL/UO2ghlDIt48sBGxo0Msdh
         /YNfia3uEbrZh1oI7H2fo/d1bB9/w6wpunLJALQRD5SqFqrj8TQigLM4Ted+4sWSxOKR
         FPVMqV/tM1261P8Mf1g7qtmMopnyahbNNaai7t7ssi2iWy+HgxXH9dvrAsqdbHKia6V5
         abag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W0zrBM+N0hxFD4HvfoclDpELnmJr/18GN6q0lPZatEw=;
        b=pW28Sulyquxq3qiSSrUluHsxcu2Gr8adMGBTyyVH9wq8f0gzjK27EO3dJej+q4fYc2
         V9LSLgUTsKeZ9xmppNbZ4J0E5RHY/9bFwffPgRDP+dyaLu8bfQPoJ2cA7KfQB0mjxiNI
         9Q9bOGgXG8S0uVPpG4+VyAF1zbSLpYKhAXgiya8IlJxDajqM9s6px7pfFYski0rhWtuJ
         x3cSaeUZ2pzNzrd/7AWKVcfjMBvnVOqcc6cOyH3oWEYHRgyq2QlnnulRPPaX5AjiUm+n
         Kb336Fw6LcNc6/70HRMpWAVhuLXdcCkl/9HIgevC5UHcBApo36Ww5zqp/PITgxqnovT7
         6XyQ==
X-Gm-Message-State: AOAM532IFi8STrGIaO2XG8c/Colz/xcMhn9spYpp+vmwfCs+Ej2GXmZD
	lR5EtR5daYVkAURPUr4/c1M=
X-Google-Smtp-Source: ABdhPJwPi5HHkN9qRkorFbCauI5zttPHA5P4ioPiaxV0wCn1Jl6lXBIv9n8vWOh2Ce6Vb5rH2bPC8Q==
X-Received: by 2002:a17:90a:1b4a:b0:1bf:1112:5ef with SMTP id q68-20020a17090a1b4a00b001bf111205efmr36323pjq.143.1647276087626;
        Mon, 14 Mar 2022 09:41:27 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id s1-20020a056a00178100b004f731a1a952sm22043486pfg.168.2022.03.14.09.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 09:41:27 -0700 (PDT)
Message-ID: <8ac83023-3609-4b24-6ffc-9f93478ce69b@gmail.com>
Date: Mon, 14 Mar 2022 17:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/3] Use g_new() & friends where that makes obvious
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck
 <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 haxm-team@intel.com, qemu-s390x@nongnu.org
References: <20220314160108.1440470-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314160108.1440470-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qKZPVwrlL8r/

On 14/3/22 17:01, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This series only touches allocations with size arguments of the form
> sizeof(T).  It's mechanical, except for a tiny fix in PATCH 2.
> 
> PATCH 1 adds the Coccinelle script.
> 
> PATCH 2 cleans up the virtio-9p subsystem, and fixes a harmless typing
> error uncovered by the cleanup.
> 
> PATCH 3 cleans up everything else.  I started to split it up, but
> splitting is a lot of decisions, and I just can't see the value.
> 
> For instance, MAINTAINERS tells me to split for subsystem "virtio",
> patching
> 
>      hw/char/virtio-serial-bus.c
>      hw/display/virtio-gpu.c
>      hw/net/virtio-net.c
>      hw/virtio/virtio-crypto.c
>      hw/virtio/virtio-iommu.c
>      hw/virtio/virtio.c
> 
> But it also tells me to split for subsystem "Character devices",
> patching
> 
>      hw/char/parallel.c                       |  2 +-
>      hw/char/riscv_htif.c                     |  2 +-
>      hw/char/virtio-serial-bus.c              |  6 +-
> 
> and for subsystem "Network devices", patching
> 
>      hw/net/virtio-net.c
> 
> and for subsystem "virtio-gpu", patching
> 
>      hw/display/virtio-gpu.c
> 
> I guess I'd go with "virtio".  Six files down, 103 to go.  Thanks, but
> no thanks.
> 
> Since the transformation is local to a function call, dropping is
> completely safe.  We can deal with conflicts by dropping conflicting
> hunks, with "git-pull -s recursive -X ours".  Or drop entire files
> with conflicts.
> 
> If you want me to split off certain parts, please tell me exactly what
> you want split off, and I'll gladly do the splitting.  I don't mind
> the splitting part, I do mind the *thinking* part.
> 
> Markus Armbruster (3):
>    scripts/coccinelle: New use-g_new-etc.cocci
>    9pfs: Use g_new() & friends where that makes obvious sense
>    Use g_new() & friends where that makes obvious sense

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

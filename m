Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp234856ejb;
        Thu, 30 Nov 2023 05:47:57 -0800 (PST)
X-Received: by 2002:adf:ec52:0:b0:332:d319:5955 with SMTP id w18-20020adfec52000000b00332d3195955mr14675428wrn.35.1701352077240;
        Thu, 30 Nov 2023 05:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701352077; cv=none;
        d=google.com; s=arc-20160816;
        b=pLpDrU88OxwpBRCnhUB0rUUSmFc/aUZPjEikmfibsD6U8UNZB5CJGzMw/QPvXNNavx
         dnHrjgIUAYTNJMv20CS/LVhCbMcycUhBl7kDqMZpRyMfueWeAzMGb8WooFsF2nfp5jYj
         Xctuk8ydt6749niuGha7ets3e6MeCQQRw9m59DaldH9Ek4W1B6T8rRbd0TdXnRsueE8r
         rKT5GaFDgwUxi1FX6BWCahKv1OjlBzmMt0CUFUE4r+aIv7p09CwBnxX4/oWaqKsAeSSS
         tRZGaVJcEmMNV92ZXEmOMkxmUK56bLZ8+WM1WTkhy39GbQ7vDGq3KXrzABCZRXoS/qw2
         PXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rzryK5Ovxx7DOgDxZdQ36NxzgykTz4w4Mydj5qAA+DE=;
        fh=vq6TxQ5MccBz0KdbaF/bByy5+pn65vn8lyysQZcYMWE=;
        b=VfOlaBJh8BQTMZxZ1DuIHZYDqLmEV1VxJavZhM3W/lvcIoR8rI/0gy8ms7l+TwDVqz
         vQRJ5bc0+K1d/T0AVdNvfIlrX8j4c9kwQfFmDqaK/KyuUkJUpjh6sJMecZ6KOe8gP1Kk
         XqV4VdElbZz3DSi8upYDgPw6puNa6JSUlhdOeZCEu0OiiuiZVzupqyjPJv4o+kPvAL7m
         SyIvnQj1+ws7zcI67Z4VpXkfkpaR0T56MG/cvN9LAuMlhd3byWLcoU2yBFAfaTitzVeE
         Ag1IK1LJDSw7MVwLXLF/UzTeIstPpVSlfybdUu58XNwrQGhXlAtz423sabQPyr58uJSO
         +YeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1gUg2ZE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id je14-20020a05600c1f8e00b00405d99620eesor412093wmb.1.2023.11.30.05.47.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Nov 2023 05:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1gUg2ZE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701352077; x=1701956877; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzryK5Ovxx7DOgDxZdQ36NxzgykTz4w4Mydj5qAA+DE=;
        b=T1gUg2ZE4LpW0ug3oJ2xv/FFTSZY01iqu0VPbQTou4MEVj7ZUxnQcMSm9Dk2sK4C+n
         Z/oZ5bRO/h9SWWpTIZwPbE2ilXYYnrkcS8mIkmF9SZmfZ5vzDSL8eX67WzhR3E6HZPkC
         FAaL/VgbeDXf596mrEPcZWsNiaAfxgzVFZvnLje0Tx6Ls18LhFv0r8fcW2fM8rd9jSRb
         UmNacR7lO/vg8d38z7MubCY6N6R8s8g4XnWYqx5Sr3ENcOfATSGkHLmDFz1dDv/QMQH8
         Xp2t32SIxD5MpD4wMjt/BgFrx6Yp6ppUG83PtH0yQROrcSEbOZ3ScEubpcZwIdKNf9DO
         0BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701352077; x=1701956877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzryK5Ovxx7DOgDxZdQ36NxzgykTz4w4Mydj5qAA+DE=;
        b=amZOmYLJ3o2rn1788cSCegcUpPtUkNQ5c2jUe5309gUuaN0m99zup4GUk+JhvYarrT
         rUFMRVmFNlNhg8mUPjtPCoIZ0aQOC4iAB+J0JgXZCNx8XRTY7+4+oIPFDbN5ITdX2j1A
         lq8PbYX5TCVISNmXQFNwHRWDr1jlSXvX+JveOY66ggOPjJ2D3+vhUFe+yQL1MaLwsLs3
         czeSHdMwdjXzrMUUdfOuyay98uwa3JbwlFDWft12eY1DGotY67OOgIHhbQE4Ta+zrgvB
         8KQPCvhi7o9SD0qsNPbLPI8LtuxaCPWkhoZVzpG541ydS8GnH6iyWZKeCHgN6GYyLH+x
         c7xg==
X-Gm-Message-State: AOJu0Yzlb7w/mFrljGnnEfLK0pct4SiRQ0vIaFMrz4cEc0OpeSM2rnmc
	uXf953AXRWV0rZT42HDkQOnjf+Wy
X-Google-Smtp-Source: AGHT+IEVx+BgPGgvtoGgXlS2ma7+soUtQpvgW6i96U/5dPN3399XP3o/9uLj4S+iHyFoPGNahzok1g==
X-Received: by 2002:a05:600c:3c8a:b0:40b:4da4:b985 with SMTP id bg10-20020a05600c3c8a00b0040b4da4b985mr6336852wmb.38.1701352076590;
        Thu, 30 Nov 2023 05:47:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr. [176.184.17.116])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b0040b34409d43sm2099005wms.11.2023.11.30.05.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 05:47:56 -0800 (PST)
Message-ID: <9c305a84-fd86-42fe-98ae-9297d480acd6@linaro.org>
Date: Thu, 30 Nov 2023 14:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] Replace "iothread lock" with "BQL" in comments
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
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
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
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-6-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bX20q0ACaAES

Hi Stefan,

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The term "iothread lock" is obsolete. The APIs use Big QEMU Lock (BQL)
> in their names. Update the code comments to use "BQL" instead of
> "iothread lock".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/reset.rst             |  2 +-
>   hw/display/qxl.h                 |  2 +-
>   include/exec/cpu-common.h        |  2 +-
>   include/exec/memory.h            |  4 ++--
>   include/exec/ramblock.h          |  2 +-
>   include/migration/register.h     |  8 ++++----
>   target/arm/internals.h           |  4 ++--
>   accel/tcg/cputlb.c               |  4 ++--
>   accel/tcg/tcg-accel-ops-icount.c |  2 +-
>   hw/remote/mpqemu-link.c          |  2 +-
>   migration/block-dirty-bitmap.c   | 10 +++++-----
>   migration/block.c                | 24 ++++++++++++------------
>   migration/colo.c                 |  2 +-
>   migration/migration.c            |  2 +-
>   migration/ram.c                  |  4 ++--
>   system/physmem.c                 |  6 +++---
>   target/arm/helper.c              |  2 +-
>   target/arm/tcg/m_helper.c        |  2 +-
>   ui/spice-core.c                  |  2 +-
>   util/rcu.c                       |  2 +-
>   audio/coreaudio.m                |  4 ++--
>   ui/cocoa.m                       |  6 +++---
>   22 files changed, 49 insertions(+), 49 deletions(-)


> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> index 69c6a53902..a2bc0a345d 100644
> --- a/include/exec/ramblock.h
> +++ b/include/exec/ramblock.h
> @@ -34,7 +34,7 @@ struct RAMBlock {
>       ram_addr_t max_length;
>       void (*resized)(const char*, uint64_t length, void *host);
>       uint32_t flags;
> -    /* Protected by iothread lock.  */
> +    /* Protected by BQL.  */

There is only one single BQL, so preferably:

"by the BQL"

>       char idstr[256];
>       /* RCU-enabled, writes protected by the ramlist lock */
>       QLIST_ENTRY(RAMBlock) next;




> -/* Called with iothread lock taken.  */
> +/* Called with BQL taken.  */

"with the BQL" (other uses)

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   static void dirty_bitmap_do_save_cleanup(DBMSaveState *s)
>   {
>       SaveBitmapState *dbms;
> @@ -479,7 +479,7 @@ static void dirty_bitmap_do_save_cleanup(DBMSaveState *s)
>       }
>   }

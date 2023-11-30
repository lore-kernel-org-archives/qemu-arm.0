Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp227597ejb;
        Thu, 30 Nov 2023 05:36:53 -0800 (PST)
X-Received: by 2002:a05:600c:458d:b0:40b:3fc7:c88a with SMTP id r13-20020a05600c458d00b0040b3fc7c88amr10440628wmo.39.1701351413608;
        Thu, 30 Nov 2023 05:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701351413; cv=none;
        d=google.com; s=arc-20160816;
        b=DCMeDm62gL6myytj0uqDm2ENExDZby+yXxGtJD+aiQVREx88M7hetvGaQ0eDofqBNW
         QequNBijQXOAixbzmNrgzLzBvp4X/sZSq7acgmN2W4/mwvyIEueQOm1QEOhYaCjc4gcW
         Vk7T8/vR7Wt4oNgNGhoWCxW+FG/fKeZ27o5E/MFcsE9Dijqgnh0s8yUXxDW3UWFywrSG
         5IABOqHXXm39fUc+MK5S5JKSL1ZrrPP6PJ0ND2Jik6ACZjl3VK5YboyMWAgHf/2+Ry6r
         gvMDcRNBNvaA4WKALdpY/ao0l1VIPJm6qjT9Z5Jzcss2edi5I0CNLZNh1pKomDOom8wr
         PUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
        fh=vq6TxQ5MccBz0KdbaF/bByy5+pn65vn8lyysQZcYMWE=;
        b=xug9h0SgWydooJ7JRjyd5keLvqFV+EZ1fzBgAVW32/T81basQeP1l2jgMKoccM5Uzd
         4rmDFGP0HUAClmd2rbV6X44H6f1lfjEZVRDk/lprPt7GL0cthe8z9/4jMAv/Nr0+9Ss+
         MHA0b9vgrWzMd6SwVyQn8r2w13GLa2bZfXrXm8jXcubevgGxft5jkSTwmLD6t+ak22RG
         FCw4l4iZtVTL+uAGyXewzjoUYnmM+kd8ktH07vo86c4mCLg+/3VucdqGMdwmxabZSSyy
         wKprBWhtYktDWi2ivgvMNhmQqCg48safg9QJV6B7Q6f0pJI8CZYMhROzkvnt/gO1VJHd
         QzbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jG/M/p+p";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p5-20020a5d4585000000b00332ee157193sor283521wrq.7.2023.11.30.05.36.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Nov 2023 05:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jG/M/p+p";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701351413; x=1701956213; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
        b=jG/M/p+pTn+xSjPZ1SD6IipJK7AQ4R8QpL2tKk3ipT74YNrExwe3qK35XiftchbaoJ
         LUQZlUOLa9uFHZlgwzsZGD6hF4ihv7yqPTmxTEpQcTJfFgi027vjqbdfUFo0qUnDQWlJ
         b6TUNuA2XjelP4tDYhNiQv49U1Glbk1jtgg3kdKQzAEzxiAr3HTxvTe1HJHSUBfOlTso
         9LXvQ9eC35eCluNvCanFmHCwXDRuHdQtsvYrVbiIyopImND5cTIy73VN4g1gBAh3ASaz
         3nH5Y+T+42WcXHnM6javDIQyoo/ZU1ugtM1EsF8wYJfIwNkXVs+k+rEk+ywxulSTwtEI
         MxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701351413; x=1701956213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92EVl/+kAJa1w133nRnLwZdbri5T/CNJ+OGiI8vF/hc=;
        b=Xn7Lr2Xycc8TS6+NeFZ52u/YyjX8BXJ3MVaaMjVPbZ1tG/TO4mIZjo0zL5I+VpLYxR
         8Sq1L7Xe6COj/4vKJ4XZ3bSyhQF3EL9NGyNWV/NDfahSgBMKnlcmOlTryxWOmhJMg6XT
         7dbFBGSXbzmrv1SVfrxXf75ppvgsLV0Bs4Kg8ev/vEc1wQm+hzlD8bfvlx2omsyXkES7
         JpCv03xROfdWmt1ws8ncLwa8Js2E82wd/D/y4XrMVu1LrBf5nEENL9mrrzzSJlEwnEum
         +gH7USWN9cSh32SuvHbGhLXO76i3w7ExZaXEvi9AHj/PQ2+KoneQK2uY6YUkSD+8gnqr
         Hh/g==
X-Gm-Message-State: AOJu0YyfBfKxUeg2sPOW6wji3TOAD0cb24R4m1zhwB+vPtYpjA1Nid1i
	CM+TD0ryfG2lr6MC/T+p8bWPMe5T
X-Google-Smtp-Source: AGHT+IGzSdlgStqYT69A2lG9GtqRHhg/niB3F/uN4GK5nKt0eJM7WDiZHR6K1BVe40jqO9Y7LSdkKg==
X-Received: by 2002:a05:6000:10c:b0:333:2be6:860e with SMTP id o12-20020a056000010c00b003332be6860emr238311wrx.71.1701351413167;
        Thu, 30 Nov 2023 05:36:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr. [176.184.17.116])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b003330aede2aesm1559297wrr.112.2023.11.30.05.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 05:36:52 -0800 (PST)
Message-ID: <ce8686c9-ac4b-4bb8-a181-af536ef1097a@linaro.org>
Date: Thu, 30 Nov 2023 14:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] qemu/main-loop: rename qemu_cond_wait_iothread() to
 qemu_cond_wait_bql()
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
 <20231129212625.1051502-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129212625.1051502-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: v3leVcjPxMsS

On 29/11/23 22:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/main-loop.h          | 8 ++++----
>   accel/tcg/tcg-accel-ops-rr.c      | 4 ++--
>   hw/display/virtio-gpu.c           | 2 +-
>   hw/ppc/spapr_events.c             | 2 +-
>   system/cpu-throttle.c             | 2 +-
>   system/cpus.c                     | 4 ++--
>   target/i386/nvmm/nvmm-accel-ops.c | 2 +-
>   target/i386/whpx/whpx-accel-ops.c | 2 +-
>   8 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp215931ejb;
        Thu, 30 Nov 2023 05:21:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5DE7vUBBKVEm8q25jHcRJsFD2YOm4M3MilS8CRnyaJxHIP2OXBOV/rOf6+zNVFUX4lvdM
X-Received: by 2002:a17:902:ce88:b0:1d0:220b:f24d with SMTP id f8-20020a170902ce8800b001d0220bf24dmr5188188plg.31.1701350471895;
        Thu, 30 Nov 2023 05:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701350471; cv=none;
        d=google.com; s=arc-20160816;
        b=iXrM4Zj/5m9EtZlQBPFvwBpmrsgU3vSAdjuXU8rtaZ/85U+y1FHfYlhnTkHJWPbCcf
         v/mBe1T2FdYVnhmJj6iQiAA0UZxG6DbUEXTjs/JI9VLyc9jTerRWysvmKGfdY7+NXIxs
         p6mLUBpgG+XkRP9qSoEmMVUjnmUbgCyGJFFtnRsGtbYTn5pfApwzK7U+8aw0Ki2p3J48
         IDift8JBR2+TirSEkpWQxn+57J2kxsC3QLkNrIbWxBJGt/CoR+aJM6LJhhA1GHLuNeDl
         4l1HN2cwDm/1uRW6o3SYwbzTP/4/Cl/WzQu/LrYzrFwBaR+NG/sEt/nSkTc7rfO1m297
         ebbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=wHSDFM4hN86iYi7TnWJUmg7D5J+4PM70pmexxIgHETY=;
        fh=hh8iIRMxqXsh63WkBtfgaM2/SexR5FVGIZD55sUt70c=;
        b=kez/7ZyT0e/COahAJMOH7o2Ud66CsrMnDRmEaXyUFDE0cwgEUNtmce1EtP5X280hLR
         48B9NVgHA6E8EZvB7sTKCBh2uOlEPtwYrBP19OLB59z545M6gBcHh+kXanO6ubplEr8d
         Pq/82CalbImZPjOvMwZ/rEysB9tnhk0wnOVoTU/H39r31SHnNV5pxBHAEzPby505yuVR
         knHT0QGzcS8nuSy0ohaUkcY8/vHBRSxWDbUy8qnWrAHDYovgTkCPrZZsWeou6KUGYeKs
         MfZkY2xRFfdFqzVTKYX/GXKHEC818UW2ebo6ZW8/l+698YP20HyO5rFyRYv6CwzkHNC4
         2NhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id b7-20020a170902650700b001cfb1dab1b0si1108859plk.589.2023.11.30.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SgxfF5JRqz4xhb;
	Fri,  1 Dec 2023 00:21:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgxdL6Gzsz4xdZ;
	Fri,  1 Dec 2023 00:20:22 +1100 (AEDT)
Message-ID: <d9164828-22fb-42a4-b71a-5ae14a172d50@kaod.org>
Date: Thu, 30 Nov 2023 14:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] system/cpus: rename qemu_global_mutex to qemu_bql
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
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-5-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231129212625.1051502-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wlOY02UDv58R

On 11/29/23 22:26, Stefan Hajnoczi wrote:
> The APIs using qemu_global_mutex now follow the Big QEMU Lock (BQL)
> nomenclature. It's a little strange that the actual QemuMutex variable
> that embodies the BQL is called qemu_global_mutex instead of qemu_bql.
> Rename it for consistency.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



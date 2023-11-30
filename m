Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp215622ejb;
        Thu, 30 Nov 2023 05:20:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3+5Z8Yy6jcbk+nEZ3LTA4OEvrDLuk+C+QSfZGEDFaX9hrIIJWXfnfWWaVa9trD5L4l60E
X-Received: by 2002:a17:902:ee55:b0:1cf:bd01:1c9c with SMTP id 21-20020a170902ee5500b001cfbd011c9cmr20856500plo.4.1701350444824;
        Thu, 30 Nov 2023 05:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701350444; cv=none;
        d=google.com; s=arc-20160816;
        b=yYPercBJeEZDABFBSvPjNKcX9gP3rviqNKYmri5McE6AufNkUMJlcXWhgmRbm+XYtv
         lAtHwFCggUxtSUCU1q/xTrFhQ683zEJSdESFUu+qs/xOsZp4Ni68L9Pk+ecvwH6xdgYl
         H06Nh85LEk0b0wk5W8TTTs7eWsfhVpsiqnGvkn89tm9MrCvC7swnMLRvWB2IrbU5bJ9x
         Iu5GKjxWL1SBFXWCsWYbijkVzD/MOpE11bA5Zl8CPQ/dyZVKpkCuXlbe/6frq433R7Uc
         AI/HzxuH81bShkcGWxRiyPZ3BIy/EXPmqL6UAqIxLgUj1Zk+mVA4qWV2btcSJ/0U9oYW
         uWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=JazEB41gcRwBgZxV564L5fkGpE18QOb0brdHFsRUYjE=;
        fh=hh8iIRMxqXsh63WkBtfgaM2/SexR5FVGIZD55sUt70c=;
        b=nHWZVb78C+qxcWdTtewE6j+feUiGGxQe0yEgbdtTsOcFXsGzPN+tGUOsK5EQiTfozI
         jy15fTQsUGQxHByGERYQxnEQqxn+pAo3lS0lvl/DHEYS9iVqFJlhIMg/X//qDnyl0CUM
         j+BH6xypp6ScTk09L8t81c9lBKmjWsKbiuH7C8yykqaovj3tnyPUcGbgskAs1h8Xvaai
         HY0pXa0FgfxSFCbnaT5KZ3M1du7TXX8SasHJ5iChoBHiYTbLZeHk1izMtm+YFWpIsG0w
         cGBEfhaz4TUaVbMKCFIt+pDqD8n4hy+iMYFSuZgQFmWsv2rbii6cS3HUJ3H3uUUWoWT6
         Egnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id iw14-20020a170903044e00b001cfc419e609si1145101plb.67.2023.11.30.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 05:20:44 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sgxdj5bkSz4xjY;
	Fri,  1 Dec 2023 00:20:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sgxck69gcz4xW7;
	Fri,  1 Dec 2023 00:19:50 +1100 (AEDT)
Message-ID: <f9b6941c-15b9-40ec-bc17-a154678d1a1c@kaod.org>
Date: Thu, 30 Nov 2023 14:19:44 +0100
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
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-4-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231129212625.1051502-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Qb0Jsjx5wY6t

On 11/29/23 22:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1812994njc;
        Mon, 16 Jun 2025 05:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPscqIwxtO0VlhKlWJKY5T1WghcXomIV4b+w5ue6JBZxIvh77jGjXlGhU00fYr234ecSXYCO2gJ4N5mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEZzSNY3UoU0HWVx0R4VIVDdxuM6XgYHLqskNXXyAWZneN1R9jmRDNQ9q97LpIsU1ZS0QeN
X-Received: by 2002:a17:90b:2542:b0:312:def0:e2dc with SMTP id 98e67ed59e1d1-313f1c6f6e7mr16239244a91.7.1750076127953;
        Mon, 16 Jun 2025 05:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750076127; cv=none;
        d=google.com; s=arc-20240605;
        b=LxbMRwz6m9ATv0UAdlm7zQIpT/SaKlVqmC7AsHyr7LJ8tB/gXgmD5ofPXbFuwA/Pa/
         T//JLW3bj63/pHP7Gco4d0NvLBwvHuqOB+OEe4Ocx/SwPbYMYnB62f5aRnAsL6WtaCuh
         VWWoA+D/75cdwdVV/o1PLPquip/3ooHOK3Af8NWihzFtRAH2DOc4nFAxWepDheU2osdT
         /HFNjE7K7Kx0tJPjfgaFi6lo3GO393v3CLYqaWkr6VnC3UEN9do+VFN7nxTglVwe1ogx
         G3sbkEjgC7RoAZmrVj19wYfZQQfKjk1dE2FwWvub3B7ya3veiy9ZiQZ0lo5yM4r/8bF9
         fPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hyI6ifgDk3Q7Kv3xDnCmgrJzLzLKSQRU+5vx/8ccJHo=;
        fh=RvH3M8XebZfaMMw+1IHIU6D6fajZyB6RagMQLzVoZgI=;
        b=c96S2OBryXv65NjiBjlJcRCuK2kpNA/+pbLumTaQ+dHb25eSeoxgXP41X9B5b6vuL3
         r5quabHosmGYWqfPxNuSkY0YAIZvpbI3BQpj/zauzn/eqg58wh0CJOWURXqozFuErFts
         iTOyiazxZTFVtme7tuYnPXKshRcNtXu0agLe5pGDDWK56d6oA3UgRP/B/IQUMSB2UWUc
         fd+Rn9ixJvs2/QjbeLBP6dy/3qVSiiFiiVwUtE7apMs/HqjBFi0/gTrWPiEnTAGsTkBK
         7RqUsZ8/QwOJ1gJpm7KxVVjgPyx7rkfAQ+K0DvWM7IW6LtovhEndO+7SS1HVPJEgBJ/Y
         jVNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=sUHoe9SQ;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Return-Path: <odaki@rsg.ci.i.u-tokyo.ac.jp>
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp. [49.212.243.89])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-313b20c8a1dsi15956370a91.92.2025.06.16.05.15.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) client-ip=49.212.243.89;
Authentication-Results: mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=sUHoe9SQ;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 55GCDKG0047581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 16 Jun 2025 21:13:20 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=hyI6ifgDk3Q7Kv3xDnCmgrJzLzLKSQRU+5vx/8ccJHo=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1750076002; v=1;
        b=sUHoe9SQkfJw6ynMY3sqqNwW1/D5eKVGMvw70KzOHvhFaEAUBvdIFPQ8RiQ9kG/C
         K6zj8j45TkI3CIkKUkKcsn9Kpw+FFcPQ0Tv7u6h6FImfNp2xrCTcPc8IavUjqvcq
         oZKLMZ80ACxveklcdUjoRoVM44HPjlaIBmk0d8eLfk3aU7VNeaffIfO2xSa07Kv6
         8BgNNQYR0osuF+xJthsL6B+vyEfdWLOJfgi61eLAmS3/qhh2g5cfMYoJnx85YR1/
         +Zb6NB4YfV5Wo8xscZQXH8zXfJbdC13YSPu3ax1PJGlV6JY/xlEAuMGPeeaEJui1
         0xOgaGo9AKLjN8MbUasCjQ==
Message-ID: <3c997a88-d0df-45f5-be1e-02f8d3018605@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 16 Jun 2025 21:13:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] python: fix illegal escape sequences
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Helge Deller <deller@gmx.de>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Fabiano Rosas
 <farosas@suse.de>, Alexander Bulekov <alxndr@bu.edu>,
        Darren Kenny <darren.kenny@oracle.com>,
        Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
        Warner Losh <imp@bsdimp.com>, Kevin Wolf <kwolf@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>, Eric Blake <eblake@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Troy Lee <leetroy@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
        Michael Roth <michael.roth@amd.com>,
        Laurent Vivier <laurent@vivier.eu>, Ani Sinha <anisinha@redhat.com>,
        Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
        Steven Lee <steven_lee@aspeedtech.com>,
        Brian Cain <brian.cain@oss.qualcomm.com>,
        Li-Wen Hsu <lwhsu@freebsd.org>, Jamin Lin <jamin_lin@aspeedtech.com>,
        qemu-s390x@nongnu.org,
        Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
        qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
        Maksim Davydov <davydov-max@yandex-team.ru>,
        Niek Linnenbank <nieklinnenbank@gmail.com>,
        =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Paul Durrant <paul@xen.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Igor Mitsyanko <i.mitsyanko@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Markus Armbruster <armbru@redhat.com>,
        Pierrick Bouvier <pierrick.bouvier@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>,
        Peter Maydell <peter.maydell@linaro.org>,
        Cleber Rosa <crosa@redhat.com>, Eric Auger <eric.auger@redhat.com>,
        Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
        Hao Wu <wuhaotsh@google.com>, Mads Ynddal <mads@ynddal.dk>,
        Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
        qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
        Alessandro Di Federico <ale@rev.ng>, Thomas Huth <thuth@redhat.com>,
        Antony Pavlov <antonynpavlov@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>, qemu-rust@nongnu.org,
        Bandan Das <bsd@redhat.com>,
        Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        kvm@vger.kernel.org, Fam Zheng <fam@euphon.net>,
        Jia Liu <proljc@gmail.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Subbaraya Sundeep <sundeep.lkml@gmail.com>,
        Kyle Evans <kevans@freebsd.org>, Song Gao <gaosong@loongson.cn>,
        Alexandre Iooss <erdnaxe@crans.org>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
        qemu-ppc@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        David Hildenbrand
 <david@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Eduardo Habkost
 <eduardo@habkost.net>,
        Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mahmoud Mandour
 <ma.mandourr@gmail.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
 <20250612205451.1177751-6-jsnow@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250612205451.1177751-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: dybQRmqchlZ3

On 2025/06/13 5:54, John Snow wrote:
> \{ is an illegal escape sequence, to get a literal backslash we need to
> use \\.
> 
> This is being fixed because of an issue spotted when attempting to use
> the pyupgrade script.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

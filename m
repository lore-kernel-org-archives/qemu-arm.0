Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1812526njc;
        Mon, 16 Jun 2025 05:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnw6XPucxw/G8gsTDlutHlfr1vzC6UN5CGBR628Bh3Wt1DqunjahQKsqxozNgmwTgWwWnzOpHfxzpTeg==@linaro.org
X-Google-Smtp-Source: AGHT+IHjSZcYDuv8hjuD2aO+i4WKKDKjpcn1uq9rwNdF9Oy+9/gAja7oG8hFW+Q5dTx/NRBOG/uV
X-Received: by 2002:a17:902:ebd1:b0:234:d7c5:a0ea with SMTP id d9443c01a7336-2366b12212cmr158496695ad.24.1750076087175;
        Mon, 16 Jun 2025 05:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750076087; cv=none;
        d=google.com; s=arc-20240605;
        b=lQ6T0PyMkt/aOTlpMooofvKwjqO40ViKJ1NX1GQJO4W77bMiIA6D0FCz0rTzNQBQcF
         HBYFJWOu14jHTYYPBqCg1qljnO0WivMEA4gzdJiqXEGGY7z00en96bN5SbKfUyHmOH/u
         j4zLmoWuHHLAs9r6ZdXErR2pIa8460SPdhgpDCpf15FUfA17a60jjuJixvJ070oPjRiN
         sLMJWpty56UXJXIiA7ifwK6/IIUnRmyuX1E3r9q/0Z1Xwh1t/Ihg6PQAIrMHpiKy5jTp
         gvX8AyPCWgVNHMdoiyvJxT0DmLSswrXSqRGADd5FSXZSIcmu3aV4LVADD8s905mlZLnO
         W3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Jns4YUkWleKTus56PdGOGCjWkNbvBqyrqgM+AwVIKyk=;
        fh=RvH3M8XebZfaMMw+1IHIU6D6fajZyB6RagMQLzVoZgI=;
        b=lRB4IaVRVR8Vo7Xe8clfRR+v1cGogcwcnJDkayO4UWbV9mgaacf+pwuulDXIGjkvmn
         NAn0D5SSQAWSoZnMyZGXEO+vNuxPH8qV5pGZ9m4ZWf1vaBPrgXcta1+gjJ20rUNowmDw
         cvWlSAC7XpegnA5mAdXAfyIZkm/tCJx7nU/drra+E1AiuqMTE9pXlRs1s17k5z22cd4P
         hl8gc7VheJ8zbAWhOtftIw5nooytkubCL2E/QS1rdY526KXDn+MmkeimEb6Qqm7lTZD9
         dw80DVRQi+jKLg+jF+dd7yECENSRQxDZafBM9p6dUpvvYOGjE0xxKAqSAQ5m/Q6Z7sqV
         ntmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=mZqaBz0o;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Return-Path: <odaki@rsg.ci.i.u-tokyo.ac.jp>
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp. [49.212.243.89])
        by mx.google.com with ESMTPS id d9443c01a7336-2365de63619si98728015ad.174.2025.06.16.05.14.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) client-ip=49.212.243.89;
Authentication-Results: mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=mZqaBz0o;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 55GCCXHI047420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 16 Jun 2025 21:12:33 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=Jns4YUkWleKTus56PdGOGCjWkNbvBqyrqgM+AwVIKyk=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1750075955; v=1;
        b=mZqaBz0oU0offbwtymE8Sm//X09ELO0dFO0tfbHgApWLR9Q4Bknj/QaUyYiuJydA
         yyJYNJ+VCOp90XsEUDR0yGsVHlYEMqJ0RZmCQh0nzWDw3F4Y8e7zHygfqO9slX9w
         dx+0envOgqaHrRtWY9squzB2pe8ehuUitPIaaDlhK9IUdWnQkwiu57scCt9m8zKf
         WxmP6PJz17dN1WkFyyavtGgaKiu5DwiETb5RmsOffPpvrzv4Um1YCsypFoXUiRU0
         9Pa7pLZ/B0IfZ7Wv3l1YGEJhpzuwTOfrodCMZfU5KaBz2QcSCMYkYr5HAhG7dtt7
         4kAKq7hnUOMzcum+Ld6hLg==
Message-ID: <f943a1b0-3da5-49d4-948d-fd3863c69ff0@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 16 Jun 2025 21:12:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] python: sync changes from external qemu.qmp
 package
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
 <20250612205451.1177751-4-jsnow@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250612205451.1177751-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PRScaA7mWqti

On 2025/06/13 5:54, John Snow wrote:
> Synchronize changes from the standalone python-qemu-qmp repository for
> the primary purpose of removing some pre-3.9 compatibility crud that we
> no longer need or want.
> 
> My plan for this release cycle is to finally eliminate this duplication
> so this type of patch will no longer be necessary -- but for now, it is.
> 
> NB: A few changes are not synchronized; mostly license and documentation
> strings. Everything functional is fully copied verbatim. The license
> strings are not sync'd only because they point to different LICENSE
> filenames for the different repositories.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

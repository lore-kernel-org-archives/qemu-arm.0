Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1808545njc;
        Mon, 16 Jun 2025 05:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfjOY3aPmBmiaEc9r2A0bV3DIF53grIteEH/oFJBQbPrARF1g/kXyBQOjc1vlhvmkiNcu5EKzbw4ZdZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFzoK/gUXOn1V1ssxnJLm/4dFqbmsBU7tL8ULkJT7Ej+SivMMIubbPCcO92/GQOls+IbG8P
X-Received: by 2002:a17:902:ea03:b0:235:e71e:a396 with SMTP id d9443c01a7336-2366b14d2f4mr122810465ad.51.1750075690244;
        Mon, 16 Jun 2025 05:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750075690; cv=none;
        d=google.com; s=arc-20240605;
        b=IH7X8issreRvD1QicmSyjxKU/b5SjVnVdrczWdsjtrjrjG2bUqu/tQId2CMYnq5Lsf
         oD3coQeV8As07we14PKj9mKorPyPhxlBEXEL3EEIu91PMrkFzdXPI6pCZJWlSao72NuF
         A8ZgLlkbgoLKgjaIlORk1jLHY0ItmfNgIhv1WvRU8apoVvOs8RTXOSU5v2RycDmqkMif
         FxT1vZWo4wL/+UqSyU+vRbA9pseaRRHO7rQbINSto8lOkXEOTJWjcPS6omlzgZ0U8vFA
         rIQJjzDIjC/1cO4MrWhV7af2cfFmHh5crQuDrlpylrm0BGOLBeP/84ABkcxFfYdiQpNk
         KVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ued+FNLco7H3M7eWjlnqd/mRkFKELch/S6J+7qUNeug=;
        fh=RvH3M8XebZfaMMw+1IHIU6D6fajZyB6RagMQLzVoZgI=;
        b=CTL8MjPKEGcI3ZVTm0MG6EzKa1i2wERgDJ4WqOnWj1muPRbqt0jHdH+KMBs2afUKMf
         d9V00v/eM0f4BPBhtrxVWjqdkoSaEnqtntzMmc40RJ+ejk5WFK2G9TV6c+fm2Z+fZcnP
         xNGs6zj88qagZKC1Lo3aEGIlKx2AOmSmsx2vuSR3c4MWndjgBZh8qXbPjH+QiWeVqpKs
         b15q8vEQgsO/fRp29QUcE1PthzqctXmFQuhkQExWYoXElmMV4CSb9PjEKmMaCB7YUoiG
         h4COyBERljmFzvzTu4S6wdwRLSVHdIiCdc0dvzVHss8q4JemXCEIlK5NTpGGlbdc3nQS
         GLLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=ojXlCOq1;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Return-Path: <odaki@rsg.ci.i.u-tokyo.ac.jp>
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp. [49.212.243.89])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b2fe1688a93si9768944a12.360.2025.06.16.05.08.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) client-ip=49.212.243.89;
Authentication-Results: mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=ojXlCOq1;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 55GC5CYt045357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 16 Jun 2025 21:05:12 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=ued+FNLco7H3M7eWjlnqd/mRkFKELch/S6J+7qUNeug=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1750075514; v=1;
        b=ojXlCOq1RciJ2fdqnbl0b58/xEt3z34Gtmypg6Zu3hIPBlB8cgvJk51vp0i1M5p7
         n7dS8l2WWoU9OS/+C0h1nDsaD1kJzkeoB4JhUTy1ouT/QD8ef9e7ySK8GZhtrFpj
         jRIIG+b83Qk6+gc8F9Lzj1F05D4RptL8UYEdQ0P/soe2JdZ4PcIteWfNR/I9WKMk
         yKBqb/fTVIRiG7Z0upwN4l+sVhwD4ERg9azQp0uN9y5et8L8fA9ffXj8WdjVotie
         3FM+JNaaEJnHXTPMss/XdAMtzqI6cGPVGl1XNA3FhL7cai2eNz3yLWndfYRgtnaG
         MJWCImLpqoHqvMut4bISmQ==
Message-ID: <a0652351-8443-492d-96dc-9772bf08341d@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 16 Jun 2025 21:05:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] python: update pylint ignores
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
 <20250612205451.1177751-3-jsnow@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250612205451.1177751-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Aj+kZKIZmYmR

On 2025/06/13 5:54, John Snow wrote:
> The next patch will synchronize the qemu.qmp library with the external,
> standalone version. That synchronization will require an extra ignore
> for pylint, so do that now.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

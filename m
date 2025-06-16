Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1812721njc;
        Mon, 16 Jun 2025 05:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFVwSaBGdoW9DTln4MwLnxrD/PoEJtW5fXLLiJ9r+oFKomdqb6L7ckK3EvP3CHAGUgSo976Wx/+KK29Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG6kvzmEcIPT/0kYyGzuhJ8LHYua27UluDHwjahUl2K3TPQ6JGzyLSIOPXnw++YLF5YU/jo
X-Received: by 2002:a17:90b:1ccc:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-313f1dcfa1bmr11472093a91.32.1750076104656;
        Mon, 16 Jun 2025 05:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750076104; cv=none;
        d=google.com; s=arc-20240605;
        b=f+fCzhqQkN1FnEGPsn/H6/dZeBr2lYwA94qJyCIh5dRwQUgtseLJS2bMC/aHLYkuCu
         /ZT6hOK87rtNuXsmd4FoAhrEUV5IAXaVf93Fe1YCMhBiIk2OTjJV2NXy3OXQt3/2tVW/
         ghDGA2sKUkJJKxQrq9iQjdE8KGk/XrRIo8DgZ7VlqdNEeKlZbTny8y241z+h78AP760b
         ZkGvNxqXAu3mqPVq+FNMoBgWarQYzo+52N0OpK1ySHHu5fBb19xXJf5uEvariW5UKzt7
         dl7o6dbw6Wv2ERGTnRXPzyZqbTWoju+VST1F8ninxL7CFx7gYIWpI5nszyzBp9ZWqTfg
         vm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4JSHX6X6s+w1UYxLKUROnDTVSl6teX25I2C+LjCWQpE=;
        fh=RvH3M8XebZfaMMw+1IHIU6D6fajZyB6RagMQLzVoZgI=;
        b=C5I7uIatCDagUGiEVGQ+OxWz34yKC2U56fRFfSqGWpfEEg2hz+4Kom7GWG27zx0YuZ
         kaSci3v4ajkctuCXWrz9ANhakOC09bEX4X24Od94DRVk3nXXdNNGtuV+m860YYJI8hVJ
         BQkf8ZWIY+Kbi6g08lgJNS8A1wq2uBzn/UsV7FR/6aAZ63Hnco1zliESXdeEBlRAfT5q
         a+2FX9cTlVZMCKjqEspFerp3RdLQBhWyrDpt7Iqj2BzWLD+ciaMpjeAKMDk9V9Vax2jT
         vP6/kNotdqAzzagFXNPp8mIVhcIGBZ2iIUMes6eBC3Z3XfWD316N6deRPjyrS0EKdNp3
         unng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=VPH1kh91;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Return-Path: <odaki@rsg.ci.i.u-tokyo.ac.jp>
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp. [49.212.243.89])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-313b2139d8bsi15719379a91.146.2025.06.16.05.15.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) client-ip=49.212.243.89;
Authentication-Results: mx.google.com;
       dkim=permerror (no key for signature) header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=VPH1kh91;
       spf=pass (google.com: domain of odaki@rsg.ci.i.u-tokyo.ac.jp designates 49.212.243.89 as permitted sender) smtp.mailfrom=odaki@rsg.ci.i.u-tokyo.ac.jp;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=u-tokyo.ac.jp
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 55GCCw8j047515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 16 Jun 2025 21:12:58 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=4JSHX6X6s+w1UYxLKUROnDTVSl6teX25I2C+LjCWQpE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1750075980; v=1;
        b=VPH1kh91xsU4KYEmFTpfwP/D+AZzIwCs40gBdNlxOoWfXZv1L0PUrW5tSwSdfLsS
         fN2bLWTG/atuD6c/gWQ+ujbBiUnJ0oCsG0hV6aqYDCEUZoi4+DwdrRTCOIubbeB6
         g5qExqA5Y+6maQTTffkKeGa6UOTusx7tEPnUHqU1qJ8dmEdQDnXbVAMJcIZuJm5Y
         Z9lZg9EvURWFzmpyNI8QJ17K17bfxNWx0tjhM2gGB+5Sv6Pa2qyCVo12FjdPePcm
         iFQPDsr8hlHZUjEnTXeLC15qmVJhENJYrNFHQQ/c8T1VqJuphu5zUex8WCJfHBQH
         VXUeVy6t93xuvn/pUEHB4Q==
Message-ID: <3c349b4d-1cb5-41f3-a64d-e8455b4c88b5@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 16 Jun 2025 21:12:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] python: update shebangs to standard, using
 /usr/bin/env
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
 <20250612205451.1177751-5-jsnow@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250612205451.1177751-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: a3jEiqNiCofQ

On 2025/06/13 5:54, John Snow wrote:
> This is the standard shebang we should always be using, as it plays
> nicely with virtual environments and our desire to always be using a
> specific python interpreter in our environments.
> 
> (It also makes sure I can find all of the python scripts in our tree
> easily.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

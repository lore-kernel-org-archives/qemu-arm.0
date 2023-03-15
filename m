Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp2960601ejb;
        Wed, 15 Mar 2023 15:02:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set+02AkbIxyDCTa6NQFL/ApgdPiG6WBiHTrzlaTU07tivsYSQmHEUx3yHbUrx9xlvYE6vEgC
X-Received: by 2002:ac8:7dc6:0:b0:3bf:e05a:f2f2 with SMTP id c6-20020ac87dc6000000b003bfe05af2f2mr2613604qte.31.1678917731649;
        Wed, 15 Mar 2023 15:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678917731; cv=none;
        d=google.com; s=arc-20160816;
        b=jEgR6sYzDcI4talBqzd7c/rnepKhrslWcwlmRHcBPN8uBLIYCaWMeIfNyvus+nVxZ0
         LHFwTAzm1YuPnI2UfvIuJkiebsqajgJ+SmBHCSEt9pvX3iiTGIHDtgBngtdJ0lp1sZCS
         cVTTVx2B57meQuQ+SSfEODGT1bWpbuV8icGB+DI3uMVfUNnFaPZlaCqYPmHMM05CckSr
         F/Sfv/5wfh8V8/k6L56YOg2NLdZ9epADYSXe5YM/pPcSpt8YeAgBxSCPooZNGTw5Lpv4
         HTOzmASohKH3xvvw81xNLgfsOot7AyWriW3aokOV81bCiv+fAr3ZXTQljngLyPTFblPH
         gWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=cv/hyF/BM7Qs01Vk3pd9iphT2D4CHx286tP6lF+86Tw=;
        b=AcozD2OZHWHyEkoFExmN/3rAVUsAKNeORhrXUH9buEGUrPj1tNMmEKgHuGM8PUQpYZ
         c/4aWpeQxyCgf1r/SSPIb45gPQ+kgzJgvUDMPsMKq/3zlb4XW6O10A20KnFxBaFtQhjl
         Tz+IT+D7qyX/J/399dz5ArOlSSm8QiiORpkcWdXFs9xro4cILO10eEtGbI4JevJ5jsRP
         +2M0SevhiM6dnuuDx27wYMWk+H3/QrnJ081F2BB+qnKCVSbEpsfU/3Q3OfFvtEoHjq32
         OLswwCvUWRUKBFY/l+s6YnTC+PsiL4lHxmGPooBLFLrrPbWhdoNOkXesA/G2Vou4HZz9
         WylA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=P9Fp2zH6;
       spf=pass (google.com: domain of ale@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=ale@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <ale@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id d9-20020a05622a100900b003b86a9f9136si5519814qte.37.2023.03.15.15.02.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Mar 2023 15:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ale@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=P9Fp2zH6;
       spf=pass (google.com: domain of ale@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=ale@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cv/hyF/BM7Qs01Vk3pd9iphT2D4CHx286tP6lF+86Tw=; b=P9Fp2zH6p649rRZvSem0puV8pc
	wfqpLHAskVpro7OGM/j9iidjkzLEvv3Z2UdRH6y5I6rVN3sF8v/0aDYzSY9NYgk+xUHZIIwSsUuq2
	xB+zCzw6daLnKlBsJcJEfPpTWdVjrjuArIZ8MxaUuApNjQTsICcJ+2sQtSPj0uJj/JCg=;
Date: Wed, 15 Mar 2023 23:01:39 +0100
From: Alessandro Di Federico <ale@rev.ng>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, Igor Mammedov
 <imammedo@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno
 <aurelien@aurel32.net>, qemu-arm@nongnu.org, Marcelo Tosatti
 <mtosatti@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Alexandre
 Iooss <erdnaxe@crans.org>, Gerd Hoffmann <kraxel@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-ppc@nongnu.org, Juan Quintela <quintela@redhat.com>, =?UTF-8?B?Q8Op?=
 =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>, Darren Kenny
 <darren.kenny@oracle.com>, kvm@vger.kernel.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Stafford Horne
 <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Sunil V L
 <sunilvl@ventanamicro.com>, Stefan Hajnoczi <stefanha@redhat.com>, Thomas
 Huth <huth@tuxfamily.org>, Vijai Kumar K <vijai@behindbytes.com>, Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>, David Gibson
 <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Niek
 Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>, Laurent
 Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Yanan Wang <wangyanan55@huawei.com>, David Woodhouse
 <dwmw2@infradead.org>, qemu-s390x@nongnu.org, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, Bandan Das <bsd@redhat.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Tyrone Ting <kfting@nuvoton.com>, Kevin
 Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant
 <paul@xen.org>, Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>, Peter Xu
 <peterx@redhat.com>, Anton Johansson <anjo@rev.ng>, =?UTF-8?B?TmljY29s?=
 =?UTF-8?B?w7I=?= Izzo <nizzo@rev.ng>, Paolo Montesel <babush@rev.ng>
Subject: Re: [PATCH v2 30/32] contrib/gitdm: add revng to domain map
Message-ID: <20230315230139.507b8bb4@orange>
In-Reply-To: <20230315174331.2959-31-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
	<20230315174331.2959-31-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CY+TbPBVlQGw

On Wed, 15 Mar 2023 17:43:29 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> +rev.ng          revng

Can we have "rev.ng Labs"?
I suggested this in my previous e-mail too, but maybe it slipped away.

--=20
Alessandro Di Federico
rev.ng Labs

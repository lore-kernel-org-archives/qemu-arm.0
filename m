Received: by 10.25.150.194 with SMTP id y185csp1562174lfd;
        Tue, 8 Nov 2016 04:31:25 -0800 (PST)
X-Received: by 10.157.35.34 with SMTP id j31mr5880034otb.0.1478608285027;
        Tue, 08 Nov 2016 04:31:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p188si18883773oig.133.2016.11.08.04.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:31:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45Yi-0002Up-Cl
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:31:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c45Pq-0004UI-H4
	for qemu-devel@nongnu.org; Tue, 08 Nov 2016 07:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1c45Pm-000676-Jz
	for qemu-devel@nongnu.org; Tue, 08 Nov 2016 07:22:14 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:64934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1c45Pm-00066j-9i; Tue, 08 Nov 2016 07:22:10 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue003) with ESMTPSA (Nemesis) id 0Ls5U3-1cpUpE3IFT-013re8;
	Tue, 08 Nov 2016 13:22:00 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
	<1478607473-25851-4-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <118e4f8d-c837-46aa-da6a-5fb135dc3c07@vivier.eu>
Date: Tue, 8 Nov 2016 13:21:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478607473-25851-4-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:tPLMlZucScOdfSf0mrcGAG1eW9YIztO+WG73M8WDvmEdIRHmQgZ
	rLAglsSHAoyWSvoi5sSI3eTTFxj6g75mpWk99BbPSjlrsi21z6hVV4hJYe1uREijGFELuUL
	2+AGqzOR2vjglGr9sItURYQVYsRzp1M19KKY3EtoPFdfqxd+JFtqsBhoseKmJCynDLKwSDW
	1Aywt2uE5HVitV05UKN0A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2HrGbSQTdms=:CIHNkQLcbh3pzeNB7ZkB73
	HYSMI9XGkgpeLV0i9TTfcNpawE+vGZM0l8BoFwzObUWMf2PuXEAbZp7Iw3kGKWyHDubeOuWhW
	vEf8Bsbm5nCCynzG4soiNUpqsdsJyDqI25ESwRN4Z5mszf6O03ianjsFDGCaX3JER7+z410f0
	iGHkabRaMGrb0ETAACQdxGloCYcVJnQB2s+2yWQiVHn/zjQ7LGTbR1sWBrWyg+qCzBGn3tcR5
	KJo/xw5/h8Xt7W7csHs1cFe51g53rJFTf+7hwuEj3d0tOYS6Gymthdz7ubV5MHCcK4baNZ4BP
	5cWNS+aDirWq8NML80kTpvYo/xLC+a0hbAJvZI4mxUwq891tBjixjrtLvAL0m7yHlGaBDUtk7
	0S3f1Ya2t4dp7fh3TP9c95Jl2D8rAwkbUm1/cVhcIWJ82ZB/pVxPxIYXICmuUoK8+CWZcSguy
	9nR1nxACCD7sB/S3+LwYhUCkm/d84yrE1vzQIc+gyE8sNFsk3eJmMA5tNBdOIHqabnrbb6e+D
	aBwu+ibq4buT6sQRnZKU3S9tvD7HQue/KiraNAeLMb0LU3ZZ5kwxzwWF628CAhk4gDZGzD5MO
	9lSM0O8lFTOozNo7YUDxOIawc0atG6NA0zRlsz11fUjLmCGCfDmMyS3UjuOqPiyucDrNHYSzY
	OKBeVqMQjcPoGTJ/IHH+RDypVWw1xPKdmqEkKAd57/6pMZXO+ru/Nh25VxiZ4lqiv49P7E/pJ
	LdA0ZhmdWAKD/NyB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-devel] [PATCH v2 3/5] m68k: Update the 68k sections in
 the MAINTAINERS file
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <famz@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QYpURShlNgMW

Le 08/11/2016 à 13:17, Thomas Huth a écrit :
> disas/m68k.c obviously belong to the m68k CPU section in
> the MAINTAINERS file, but remove the hw/m68k/ directory
> here since it only contains machine (not CPU) related
> files, as requested by Laurent. Add the machine related
> files to the right machine sections instead.

I think you can also add include/hw/m68k/mcf.h in the machine section.

Thanks,
Laurent

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 451e7cc..5d8b584 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -148,7 +148,7 @@ M68K
>  M: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
>  F: target-m68k/
> -F: hw/m68k/
> +F: disas/m68k.c
>  
>  MicroBlaze
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> @@ -550,6 +550,7 @@ M68K Machines
>  an5206
>  S: Orphan
>  F: hw/m68k/an5206.c
> +F: hw/m68k/mcf5206.c
>  
>  dummy_m68k
>  S: Orphan
> @@ -558,6 +559,9 @@ F: hw/m68k/dummy_m68k.c
>  mcf5208
>  S: Orphan
>  F: hw/m68k/mcf5208.c
> +F: hw/m68k/mcf_intc.c
> +F: hw/char/mcf_uart.c
> +F: hw/net/mcf_fec.c
>  
>  MicroBlaze Machines
>  -------------------
> 


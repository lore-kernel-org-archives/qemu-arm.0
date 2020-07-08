Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp318168lfm;
        Wed, 8 Jul 2020 04:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzysSGunYnrZ+raRdNmMmazyUVBntll52NFxZ/ZJ1SmWJe0Z96vLxZmrGvMF7nqtuvmuPlO
X-Received: by 2002:a05:6512:752:: with SMTP id c18mr13323489lfs.141.1594206990596;
        Wed, 08 Jul 2020 04:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594206990; cv=none;
        d=google.com; s=arc-20160816;
        b=ThXZGnsZPJVo3PbU64NpVnkdtV40OnqxoN8xAp/Tds1v6u8ahCJEgFA7kmgf3jwuWC
         kuvMj9/rlYMW97lU8HP58wO9XQ3SXDxjNmAbvjviVOeXPffsANF0RYgACzg3Bwdn5POw
         QD+FYst7zSBaxy18JnKFZ7oWEJQGoBc+p63FilcmybIhIO5GEYhJWkeCsUX5q9DA66/s
         H1oH6kkF+rZVcPA/93BOc/sQ0pEtqTkbLfT2ZckNCRKKqA2ccLKbeJF0OhIWb3eANadH
         h+h0x/uWiVaYS4c4EfdQKrmcacG233gcEBOHYF0GUd7W/4QMIGJdLnDhFlaWRHy4dz1z
         iuUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7UF6loFJb87wxieC/dzSDSi6hAd1CKXmXjM3EREi8SQ=;
        b=AVZUfk/jDWbhRNg5AvEVS9Jotqpu6Og8vHsIEmNBf363U1J/XTVXbnsHWD9SkIl6Pv
         lOK3ynfQWFpgd0TOanttlK/zpFvhsL7GltEp451Pua3Aj4FIngR5qoR+W9/j5hpFn6IQ
         MxlzuJhGWMjnurKffzKpl6vfviE6DUSNdJtpMPlW3Lv+PxgYUCzVUnk8WsZ5TwI0cqJc
         PAvM2a5J7VYEXT1I6nmxPQahoHNA00sEjTLoZFObRd6vEoZ5ow8tq+8RME8J+p2iGGHd
         x+AJl4tOe5dQ+S7dJ48IWxDQowbtxsVOckhu0YU518tOswX2iyztUfAG3JH3Bs7ZCE7R
         RlVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=LwlLD4gq;
       spf=pass (google.com: domain of r.bolshakov@yadro.com designates 89.207.88.252 as permitted sender) smtp.mailfrom=r.bolshakov@yadro.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <r.bolshakov@yadro.com>
Received: from mta-01.yadro.com (mta-02.yadro.com. [89.207.88.252])
        by mx.google.com with ESMTPS id r24si15918686ljg.364.2020.07.08.04.16.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of r.bolshakov@yadro.com designates 89.207.88.252 as permitted sender) client-ip=89.207.88.252;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=LwlLD4gq;
       spf=pass (google.com: domain of r.bolshakov@yadro.com designates 89.207.88.252 as permitted sender) smtp.mailfrom=r.bolshakov@yadro.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id F07E74C895;
	Wed,  8 Jul 2020 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received:received; s=mta-01; t=1594206989;
	 x=1596021390; bh=IZP5UhMNqaSvqAnZInLSw7aMUyR9UHa4g7mz2kaJfkI=; b=
	LwlLD4gqzKhmjDg+9WVU7o3CgUCt71MSdjCZREhDV0oSr58YKSEbnCG0ZNKD2k5K
	K3tD35qHsix1ygABezMpCKHuFTf4V8AvRtKhcuyU/eAfNtdtkJ65uJTKxajbTCNI
	E8KgP0bcTL3+zm7qxjuC99ogd006+TMn84nN/V+WM88=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGMWieCgyhvF; Wed,  8 Jul 2020 14:16:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id A617C4C889;
	Wed,  8 Jul 2020 14:16:25 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 8 Jul
 2020 14:16:25 +0300
Date: Wed, 8 Jul 2020 14:16:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Christophe de Dinechin <dinechin@redhat.com>
CC: <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, Laurent Vivier
	<laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini
	<pbonzini@redhat.com>, =?iso-8859-1?Q?Herv=E9?= Poussineau
	<hpoussin@reactos.org>, Paul Durrant <paul@xen.org>, Richard Henderson
	<rth@twiddle.net>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter
 Lieven <pl@kamp.de>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
	Riku Voipio <riku.voipio@iki.fi>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, <qemu-arm@nongnu.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Max Reitz
	<mreitz@redhat.com>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau
	<marcandre.lureau@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, <xen-devel@lists.xenproject.org>, Marek
 Vasut <marex@denx.de>, Anthony Perard <anthony.perard@citrix.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Peter
 Chubb <peter.chubb@nicta.com.au>, Alistair Francis <alistair@alistair23.me>,
	Andrzej Zaborowski <balrogg@gmail.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, <qemu-trivial@nongnu.org>, Kevin Wolf
	<kwolf@redhat.com>, <qemu-ppc@nongnu.org>, <qemu-block@nongnu.org>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Chris Wulff
	<crwulff@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Yoshinori Sato
	<ysato@users.sourceforge.jp>, Stefano Stabellini <sstabellini@kernel.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
Message-ID: <20200708111624.GA29018@SPB-NB-133.local>
References: <20200706162300.1084753-1-dinechin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200706162300.1084753-1-dinechin@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-TUID: dSbKltJylMr6

On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
> There are a number of unnecessary trailing whitespaces that have
> accumulated over time in the source code. They cause stray changes
> in patches if you use tools that automatically remove them.
> 
> Tested by doing a `git diff -w` after the change.
> 
> This could probably be turned into a pre-commit hook.
> 

For HVF bits,

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

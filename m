Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1894446wrt;
        Fri, 14 Dec 2018 02:55:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VsSv3seDeR/me5GAyXu/jpDcixZRLwuGudiiDwQ02nN5uLZG4tkG82Xn5v6kdzJs2d6Rk9
X-Received: by 2002:a1c:1112:: with SMTP id 18mr3035308wmr.30.1544784919576;
        Fri, 14 Dec 2018 02:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544784919; cv=none;
        d=google.com; s=arc-20160816;
        b=VcCtYbaB6S++gn5PNED+QccfcpRutq1AEVSW7RUPuLMXFI5fm37saDIrsruTjD1c/n
         OIglq50x0nbyFvokg016Zb8OxIhPIA8duwsG0a5RkXbUtkl/Hhcl35HB4kS3qBG1MW/Q
         fyGVzip12rhdlrsSmAJm05Z9cfxwwsBcUyUnao/SmFefVahPsn6rnrdf+7xkQC/YKAjn
         aQkPQ+Or1aH5xsC+iqnoYkHRdiZzl1lV8sFpYb49yL5xUUS+itdrXuF1P0+0wQkH3VSu
         cfa0x/pfNELkZ72zdigE6w85AGeV0/epJP5WFhdrTvFdCxgKIZbwQC6wzzH7C8ym2KcR
         s3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=pc26rl8psTWJ8sL3BzyTxNQMXY95B0fhAeHSlxsugTw=;
        b=bUuKXXYLdNrq6HTZGiblyVq53EexhxPLJNANOZi7Q2yaLoGyt4mqW7utbQRR2D5fro
         JpcAIZVdGq19Dl6LBvMvqBiXRJx5aErpnCpUFoYe0XN/KQEme64DwOmfZEHzdGeblkWL
         W3lLjdJJ7p5Fy564UKqM0j4pRLr9cgrvKrSsP1UapNBSs/4DF4YzK9euIwCszJCgEdxz
         qs6Hx9RRbTa5jJFHuxdKLIwpjGnUM5aM64Jh0nODpN2S4sfwpF+Q54kwJJKBnCLOHqWN
         C13DkJjfkH70Qt2ZAWedUEg8/RCWFA+QC0HF21tjx6qSziR3zQaiuRz6mp/F3uSqevTR
         iVqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 46.105.43.105 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from 5.mo69.mail-out.ovh.net (5.mo69.mail-out.ovh.net. [46.105.43.105])
        by mx.google.com with ESMTPS id d12si2965019wrc.161.2018.12.14.02.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 02:55:19 -0800 (PST)
Received-SPF: pass (google.com: domain of groug@kaod.org designates 46.105.43.105 as permitted sender) client-ip=46.105.43.105;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 46.105.43.105 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from player787.ha.ovh.net (unknown [10.109.143.3])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 076763816A
	for <alex.bennee@linaro.org>; Fri, 14 Dec 2018 11:55:18 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net [82.253.208.248])
	(Authenticated sender: groug@kaod.org)
	by player787.ha.ovh.net (Postfix) with ESMTPSA id 9ECF6EF62D7;
	Fri, 14 Dec 2018 10:54:36 +0000 (UTC)
Date: Fri, 14 Dec 2018 11:54:35 +0100
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Dmitry
 Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Eric Blake
 <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open
 list:bochs" <qemu-block@nongnu.org>, Stefan Markovic
 <smarkovic@wavecomp.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, Andrzej Zaborowski
 <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, Jiri Pirko
 <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>, Amit Shah
 <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>, Riku Voipio
 <riku.voipio@iki.fi>, "open list:Stellaris" <qemu-arm@nongnu.org>, Stefan
 Hajnoczi <stefanha@redhat.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>, John Snow <jsnow@redhat.com>, Richard
 Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Viktor Prutyanov
 <viktor.prutyanov@phystech.edu>, Max Reitz <mreitz@redhat.com>, "open
 list:ppc4xx" <qemu-ppc@nongnu.org>, Aleksandar Markovic
 <amarkovic@wavecomp.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [SPAM] [Qemu-ppc] [PATCH 2/2] avoid TABs in files that only
 contain a few
Message-ID: <20181214115435.10e0b5a4@bahia.lan>
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
	<20181213223737.11793-3-pbonzini@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10094255618146015694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrudehgedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-TUID: fHnsrtrJa1e7

On Thu, 13 Dec 2018 23:37:37 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
> 
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.
> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.
> 
> [...]
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

This a lot of places to review... FWIW stgit spotted a trailing
whitespace for free :)

>  
> diff --git a/target/cris/helper.c b/target/cris/helper.c
> index d2ec349191..754fa00d06 100644
> --- a/target/cris/helper.c
> +++ b/target/cris/helper.c
> @@ -240,7 +240,7 @@ void cris_cpu_do_interrupt(CPUState *cs)
>          /* Exception starts with dslot cleared.  */
>          env->dslot = 0;
>      }
> -	
> +        

Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209284lfo;
        Fri, 11 Mar 2022 09:20:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw771Lnzdk+tikQUtko7+6JbJq9RHMTAeM5kzMog2X7sQ46uPYniNJhFx3Wu8C4L+mxwjDI
X-Received: by 2002:a17:906:b7d2:b0:6db:385:dafd with SMTP id fy18-20020a170906b7d200b006db0385dafdmr9743761ejb.139.1647019242218;
        Fri, 11 Mar 2022 09:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1647019242; cv=none;
        d=google.com; s=arc-20160816;
        b=apkiJp1nqOqDJfAxtP82szexuuy732db7EEtoAVhMuO6Rdoldws90ahId97F61e/xk
         06DKp8eK01TIFcPv5oO22nN+K2xc5bab7y5fKFqqjBEHDEu5/Aem9zxzKYW0S/Ce/X2c
         /FC80ACLI3LD4WjuOtCJS/aVQx7OoC1tK1fj5ST2kVn9Y+BXF0qBgqNars++Sn0WEh1v
         U7SMFVQnuOTer9o3G7BoNiEk4sw5cC0kpcK6rLeHBXNuyPUvD2nAKyQ2iybvvmsr3ZHJ
         vP2eZHpBdAwKsydsYMoTjNueaOz4XrcO+FYwocDdYUzekISGz1lFSG1OJBuY+riDyW6J
         Eaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iF0Rvsk19nee1rMX5F0YethIB6ujydzdlwFHIlx6D2g=;
        b=vFPVtkrPSPRTeLFdbU/dGHlGbBff6ERQIfS5XhRH3ol8gaz8qlu1CsG3JOf5bJkCYm
         5hQM54x4ANZkDHYhtSPZwh0ED7O8d3c0d9wtYA2qR5KjbQW2TLgkoScK3zNipyNESuv3
         /Bkj2fMrfzYKaxJxFIw3+JR1GJjV0NitP0dvdUZ2qMwQOf9uF99dmP5TIj8H3tRhxEr2
         9PnGAM91hM52vx+5jVwzVhIDT+zs1qjpggLIuu46ImnReA/TdjegqSecoiAhoaK6c0Zt
         LQs34AkOagRGe76xBX9Mckvc3IcdcK+oKsDovri+ztmMA7Uh1T/1WAC8XhA76Bk4WN+R
         Bc3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J9BX178R;
       spf=pass (google.com: domain of bleal@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=bleal@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <bleal@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id lb2-20020a170907784200b006b26cbfe7b9si5532957ejc.172.2022.03.11.09.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Mar 2022 09:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of bleal@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J9BX178R;
       spf=pass (google.com: domain of bleal@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=bleal@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647019241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iF0Rvsk19nee1rMX5F0YethIB6ujydzdlwFHIlx6D2g=;
	b=J9BX178R0M0jyg3apJnFXbE6Fm5pal3Yc4LJD62gSTE7ULUSK7faZpuxFvDnZT/4pvBKjY
	kr2MnTTfC5/PDoT189lELiJprh93ClaXU+VO7CArHYmao/6h/TXQJZI9vhT1CS+pLasHk1
	V5rh2mDNaQos3T+2/kGEHp5Kbx9u6YI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-dnWs4NMhN7q8QB-260yQvg-1; Fri, 11 Mar 2022 12:20:40 -0500
X-MC-Unique: dnWs4NMhN7q8QB-260yQvg-1
Received: by mail-ot1-f72.google.com with SMTP id q2-20020a9d5782000000b005ad0c39a8b5so6569230oth.2
        for <alex.bennee@linaro.org>; Fri, 11 Mar 2022 09:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iF0Rvsk19nee1rMX5F0YethIB6ujydzdlwFHIlx6D2g=;
        b=SiTJl07BkdDr5FcExH35xq9C2H646K/qTlwG62ZXTsuv0vQi9dv3Vi7mKRlXNYMWHf
         ErdMNLZYtEUb0CczAMmaZeA3K1gLlNL49GtNhu9nMFF9v4jaDtAUVfieMca7ZgR3FzzZ
         OViikVtnWXCLfr5gCbPRPVT55Hw+aN6p8cvIUB414/R7XuqDw6oaIw5TJQsr4TSYWrD9
         hW0DHle9nm8WYDIoC22qIHYcqFNjU4Cie78AMpwQh0G9bk7or3TurPFHHEFmeesiEBqM
         0rcmExanr6NszjEsTcQQv4uoNjq5zkb3euZX7nxf7Nq2PjTclgj0K7f1eVuS0zBUsUBh
         Un3Q==
X-Gm-Message-State: AOAM530HNm3ShF3Mvzv09VkyqHYSWTtHW5cDGUInoHf1w8I2t44z+bHo
	B5B/Jcbv+KtS3L93GbmORUTnuQzcFGxgZWtW5jcElgaip6WQTxlQSy4CoiGYfKzQt+tBK2zKzH+
	0WNxoXtty9m0QPwaX
X-Received: by 2002:aca:100f:0:b0:2d9:df12:2dd6 with SMTP id 15-20020aca100f000000b002d9df122dd6mr13636543oiq.199.1647019239280;
        Fri, 11 Mar 2022 09:20:39 -0800 (PST)
X-Received: by 2002:aca:100f:0:b0:2d9:df12:2dd6 with SMTP id 15-20020aca100f000000b002d9df122dd6mr13636516oiq.199.1647019239054;
        Fri, 11 Mar 2022 09:20:39 -0800 (PST)
Return-Path: <bleal@redhat.com>
Received: from localhost ([191.181.58.94])
        by smtp.gmail.com with ESMTPSA id f10-20020a4a8f4a000000b00320e5ecfecdsm3842724ool.46.2022.03.11.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 09:20:38 -0800 (PST)
Date: Fri, 11 Mar 2022 14:20:36 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 6/9] tests/avocado/virtiofs_submounts.py: shared_dir may
 not exist
Message-ID: <20220311172036.awiv6zazfhbvasq7@laptop.redhat>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-7-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225210156.2032055-7-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: +jCrN4sjRBB4

On Fri, Feb 25, 2022 at 04:01:53PM -0500, Cleber Rosa wrote:
> If the test is skipped because of their conditionals, the shared_dir
> attribute may not exist.
> 
> Check for its existence in the tearDown() method to avoid and
> AttributeError.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/virtiofs_submounts.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
> index e6dc32ffd4..d9c2c9d9ef 100644
> --- a/tests/avocado/virtiofs_submounts.py
> +++ b/tests/avocado/virtiofs_submounts.py
> @@ -157,9 +157,10 @@ def tearDown(self):
>          except:
>              pass
>  
> -        scratch_dir = os.path.join(self.shared_dir, 'scratch')
> -        self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
> -                 ignore_error=True)
> +        if hasattr(self, 'shared_dir'):
> +            scratch_dir = os.path.join(self.shared_dir, 'scratch')
> +            self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
> +                     ignore_error=True)
>  
>      def test_pre_virtiofsd_set_up(self):
>          self.set_up_shared_dir()

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo

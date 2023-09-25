Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp511708ejc;
        Mon, 25 Sep 2023 09:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNo9OmeeP5tJd76M1czObzQe9ZZq3yScK/GV1iRY105zcwU1nVOLSAZ/z42de6uBjp3AVA
X-Received: by 2002:a25:d4c7:0:b0:d80:eff:5fba with SMTP id m190-20020a25d4c7000000b00d800eff5fbamr6720751ybf.15.1695659311113;
        Mon, 25 Sep 2023 09:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695659311; cv=none;
        d=google.com; s=arc-20160816;
        b=a/OxCMO8rtr0q77GJu5jCCiOtAhoYRODvbPG41o3kQQL+V3dLHr6NcKiuG0+VVwXNt
         ZHihIXzhWN9JruhDjL+Rp+BN5mQGkOyMKOyHt/jZ8+2jBdF0mmT1EU59XfbcPm/N36Uu
         vEy3U6mSF1MPAy+vznGkql4Gb9MzwVPAHk8YHT7Hjo+S7N/XQ19lcUKPZzH9wox86dNc
         EplTb2f0QQPhcvlP0KVAeOYTy0T2B0qNuWumhN2OJK6lyDeTkJgoWKC0QSGIQqji3s4k
         Uhqam8ize+jE4tBQDXtUiyiWe0EPFDYTKHj8kZ9Tudmkq77HV+INbNVU+e4J96BX7t6e
         Q6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Q3XmcHzrOYSbEyZh6kgDiDOPnKUtdQ6p5R5WI4Sq3ss=;
        fh=qRaaJWpKB8b8LeAvB+0Yn3BLVou2mEMkuWB2O57lVPU=;
        b=UwFoKOMrjJlggQEByYVOLrGd18TGjNPEOkq0YKZj+xtrIt1TP1XdqFD3a3puCJ+MQ7
         UDgtRW4W6+9y/fS54K3+AEz9lQZxWFvhlIQqCRK8doJqxtvuSLckqFhkz0w7dwapM/gz
         tXr2F6d5EZgMgfhLIxWb9hTT35ByjrUDUG3udFho2GLiQ6DemRqb3tKR2GrdMqXeOd5l
         q+2mdeHFKtawl2wY+XtmpDgvMCIZSvVaKQbEg5zNlJKCTjfpmhaA7Ma6BJCKZ5vOOLQn
         Kb5VlLC7eCG5w8AyvbU00Awg/lajbU4rYi5X2GpHgJg58JCuaj3QWm01OOPrP16ZK/2m
         E2HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jHQHMvc+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k3-20020ad44203000000b0065653bcf2c6si5967633qvp.179.2023.09.25.09.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jHQHMvc+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695659310;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3XmcHzrOYSbEyZh6kgDiDOPnKUtdQ6p5R5WI4Sq3ss=;
	b=jHQHMvc+hE9FWznPZx9gQ0YckgYvkk/qezdSQzSKvM6ukUSADJa1IFkk/P3xWIpD6YM/qt
	RfJQqC3dU3NpTTdlcNEQgrkz5nVVhvN5Ad4QT9moKS6NUXIqSeZpzYMIVmZWpdVljCrKph
	Zy7jHjB/wkQ7BqB/UD/mTChMkTUmkuY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-6mdfCm23M3qQ5dpy8iYUZA-1; Mon, 25 Sep 2023 12:28:26 -0400
X-MC-Unique: 6mdfCm23M3qQ5dpy8iYUZA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C9B829AB400;
	Mon, 25 Sep 2023 16:28:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5CE711291;
	Mon, 25 Sep 2023 16:28:19 +0000 (UTC)
Date: Mon, 25 Sep 2023 17:28:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>, Rabin Vincent <rabinv@axis.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
Message-ID: <ZRG1IbuBvUfkqqa8@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230925144854.1872513-5-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: 538ko44yV0lf

On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Bennée wrote:
> This might be premature but while streamling the avocado tests I
> realised the only tests we have are "check-tcg" ones. The aging
> fedora-criss-cross image works well enough for developers but can't be
> used in CI as we need supported build platforms to build QEMU.
> 
> Does this mean the writing is on the wall for this architecture?

It was deleted in Linux, and GCC dropped the cris-*linux target,
but GCC keeps other cris targets.

IOW, at very least, it has become a niche use case target.

We don't need Linux/GCC support as a pre-requisite for having a
target in QEMU, but it sure makes it increasingly challenging
to test.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Rabin Vincent <rabinv@axis.com>
> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  docs/about/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index dc4da95329..7cfe313aa6 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text on the command line using the
>  used instead, to refer to a ``--object secret...`` instance that provides
>  a password via a file, or encrypted.
>  
> +TCG CPUs
> +--------
> +
> +CRIS CPU architecture (since 8.1)
> +'''''''''''''''''''''''''''''''''
> +
> +The CRIS architecture was pulled from Linux in 4.17 and the compiler
> +is no longer packaged in any distro making it harder to run the
> +``check-tcg`` tests. Unless we can improve the testing situation there
> +is a chance the code will bitrot without anyone noticing.
> +
>  Backwards compatibility
>  -----------------------
>  
> -- 
> 2.39.2
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

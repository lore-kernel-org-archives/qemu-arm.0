Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3576095lfm;
        Tue, 1 Jun 2021 05:27:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzZw6Qz/tFWrBlkFCBOR4bURB201ibiCNckosHnMdRfYq8PuOz6eoqe6CTtr+DO6feiD2c
X-Received: by 2002:a17:906:49c8:: with SMTP id w8mr19542074ejv.497.1622550456391;
        Tue, 01 Jun 2021 05:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622550456; cv=none;
        d=google.com; s=arc-20160816;
        b=S/Mp6rIuZbKbMHUTO4GdsEfnC6xmxWVFBhDOk7LDWZLByYTOacE9uztBpUqjQDqfhR
         1Yu5fiL7EQi3k4NgJssqClV2tHlcJ3Lyy+8iqfgn2CTrYLjb8bXE3jphLs7tfUawS6um
         OITeVMDk5tRi2G3CpDcHC2Mvrcmgkz1i9Ust69YC844ptN0C5YAigpGuWHGCkvpC/xIj
         5lwSGoeaVtD6EiGFXFBRK5feOHByYipB1MPhm/4RHuN1FPfCtuDX3nPVEWn3yecw5tt/
         IxqepdJk/MzJl0fy3KXwQ4m4avZQQtUrczwJrJnvh32iMm5FUQOCUM7H0J6DNGrmtYlD
         OjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lQvZyUoXVmIb3zfNjpz2vDPXvvVv3DHJGgPXj4NfCyk=;
        b=Li4+0qD6g/w8J79SmZQZT/U6mu/HZQX85ksY/fu4ae7s0iOs9SCxjoQrvYXZpPZqgf
         ngegqnGrtZCoHmWJHNau1h1D97cTnbsny1OhoPf0GZWIrSmI/x8VUEeBsb2n0lbTBYZF
         cR2M9tMwvJ9r2ekl17BM7MIQbgr02HpAH3jcuhuT57syczScdic899YKTvW8YpAbeo5c
         xJB0oRKFMZb6SODY/oP27b4nCmG1S8dUa2V7AjTodrrfYe0Dwmm1PU1h715hEwcSeC6k
         yTVmyfiCE5PAT2ut7MYPipUY9eHwQcE22rl8QUCHVXvfxKy9Lrwz7F16NsLKfOfYyLj4
         B44g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8lzqerb;
       spf=pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y12si4011636eje.174.2021.06.01.05.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 05:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U8lzqerb;
       spf=pass (google.com: domain of drjones@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622550455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQvZyUoXVmIb3zfNjpz2vDPXvvVv3DHJGgPXj4NfCyk=;
	b=U8lzqerbN0W8UXZQuhlitOKGQ8lLF3WB5iRYJcMRWG10+s/BjVx+dYO0wPDMl1Pa3yC+sz
	niE6UjefJSrnh5lwCVDbQzcJu2tsYjKTaDBg7gheq0fJcT+zz9XSq7q076ilBsxajouVob
	xmCAJzaLNbPcapHTkjxWHkG7ZS1nm0I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-fW0Vw9BrMvKDiAzNh-u61w-1; Tue, 01 Jun 2021 08:27:33 -0400
X-MC-Unique: fW0Vw9BrMvKDiAzNh-u61w-1
Received: by mail-ed1-f72.google.com with SMTP id h18-20020a05640250d2b029038cc3938914so7733933edb.17
        for <alex.bennee@linaro.org>; Tue, 01 Jun 2021 05:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lQvZyUoXVmIb3zfNjpz2vDPXvvVv3DHJGgPXj4NfCyk=;
        b=rsBW2Ve3lL8QOKnk9QE/vjma0houNBGOJzkUvvx2JX6otiKREy8d54wakZopsDj7WS
         rtXpNkoSgjV2G6jY522Xpt0dWzxO0J0ceJOD5rgOyGGKWr5lQ+vqDmC4wFvgQPJ7GjmL
         2jg7j8I+ihffXsdq0BXoqHsVwN5w/b1+/hY+dbP/j/gVj6cggEDRoCPzSce9G5EzhSIA
         KFmbmMb0jB9k2+HofYDxpRD4hI0aQM+Nu7ezha/xMdDT4k9hIKBv35i4F3iD9nNQD989
         h6pF+RQN9K0ljn4ZT5UdwYeVdZMdCn9/Et2RS6rsorBKh0P0TkrQZh+4cER7+qF8H2PJ
         IJvg==
X-Gm-Message-State: AOAM531DEIAfkZ2j+HOz0IW+PzGwadDW6tm5AV0rovNF7U9IpIWdO9uM
	KxamLoTMGRSbtRfWp9JlQaY3SEwFOCl7b/f7g3JZ2EqIjhl1hcFlRDy3X3HUNUmqugSZgFt2vOt
	8ySxRWXQy4kZa/Sqcz4jneGrkl32pVicruqtkw+wrQBIhft4OLgQgSuOrP6EMwJAe88s=
X-Received: by 2002:a05:6402:170e:: with SMTP id y14mr23743883edu.367.1622550452709;
        Tue, 01 Jun 2021 05:27:32 -0700 (PDT)
X-Received: by 2002:a05:6402:170e:: with SMTP id y14mr23743859edu.367.1622550452504;
        Tue, 01 Jun 2021 05:27:32 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
        by smtp.gmail.com with ESMTPSA id e24sm439285ejb.52.2021.06.01.05.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 05:27:32 -0700 (PDT)
Date: Tue, 1 Jun 2021 14:27:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v2 2/4] scripts/arch-run: don't use
 deprecated server/nowait options
Message-ID: <20210601122730.ssdxx7ut6e25e4b5@gator.home>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-3-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210525172628.2088-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: tFnLmevX+puL

On Tue, May 25, 2021 at 06:26:26PM +0100, Alex Bennée wrote:
> The very fact that QEMU drops the deprecation warning while running is
> enough to confuse the its-migration test into failing. The boolean
> options server and wait have accepted the long form options for a long
> time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  scripts/arch-run.bash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

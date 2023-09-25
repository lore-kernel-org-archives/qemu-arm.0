Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp467933ejc;
        Mon, 25 Sep 2023 08:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsmtwKxmgoYWDAC2poEmjjtzpT+CRFDYeuT+zYW98aspJ+YQbZwwVer3ORhZ7YUd62z7S5
X-Received: by 2002:a25:a107:0:b0:d81:aae4:f774 with SMTP id z7-20020a25a107000000b00d81aae4f774mr8153412ybh.25.1695655538664;
        Mon, 25 Sep 2023 08:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695655538; cv=none;
        d=google.com; s=arc-20160816;
        b=lEm55hIUn+nT9RaMe9RHsct50JmIY814tjd7yGdfkYuul2sDpNugdbHb99vJmADK2h
         TRSMLU31yJmGwK2NuBIO5ICNPHA7Gsx+0l3fuSIO2F+5WiIZIYxn5oprlU/YJhR+aNvI
         z5GHgHc0g5O0nW59jlK6so9kij4AA3knTNm/4lOZEJXztHj4SEZgf06+ZTVSb2fTx1sf
         dvqM8YfT09XtLj6Ub20JbFfqM/HWSz22KP09prQk/IFTMzcA5au1XkvS4sTqrpVqWPu5
         qmzMZd5MhrBQI8rHn9nIRrq+y5LOSl1QisD9/x6z24n88eKlZvy7dKNCoi57UthtT3HS
         iFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=J37O+3RdexR2S+GEkypPqePHvQti2/yHLtDs+8yRB8w=;
        fh=zgF+an6wdaeA6HxYLmeFeZ2Hyvaq1NpKU5umquGxNHo=;
        b=IH+2ViS+cGDerukSTRUMd+CKGA7ZXLrjR2mpUhpz0/SM0hLA1234Ik9KA0eV1038Ub
         GkY81JRFtwieZ/Lu0TORelaboTS6qa875+auZjpXY+v1efhrJkfE5dkghXK8wLAgzR8l
         YZoVyWWXud0hAFxmlJka0zxmtHAKLV9UZbAU5kBlBWgZF1MoGphHzVQEsnvTr6xDi1SU
         hTqFyIF0ugcusuQLrOBDgokX1lt3GtHpM0OuHJoYR8kLUmehB8ThOQ/vOmTUtXoEYX4Z
         w3Un2dbKUjRmiq0M8eMD7oKNjWoZ9kLmH4/d6xAo59O+swgwhW6KsKYyGnCRFBACtc5k
         Ed2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZkLSmPvV;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e12-20020a0ce3cc000000b0063cfc873795si1064369qvl.217.2023.09.25.08.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:25:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZkLSmPvV;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695655538;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J37O+3RdexR2S+GEkypPqePHvQti2/yHLtDs+8yRB8w=;
	b=ZkLSmPvV5YYkRILsV/S8Zb4j04x/YBTGCfZ1N10V9okA06gvqEcePelH9dvT0osJWfCDDi
	fSEkKZnevQjJUR+XVTHS2BwNsgbFl1w119fRa4c8EZyVUZZ3Gvc+tem+e2DCw/uaRbb/HU
	/1d6DdJrkZvQPaZfmFsL6pW50ELK0Js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-6nlRrxR1PbqhFavxA_2EJA-1; Mon, 25 Sep 2023 11:25:33 -0400
X-MC-Unique: 6nlRrxR1PbqhFavxA_2EJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C655F18175A1;
	Mon, 25 Sep 2023 15:25:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B17F749BB9A;
	Mon, 25 Sep 2023 15:25:25 +0000 (UTC)
Date: Mon, 25 Sep 2023 16:25:23 +0100
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
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 02/31] tests/lcitool: add swtpm to the package list
Message-ID: <ZRGmY4Uzy00ubc4f@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230925144854.1872513-3-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: ldWLfRT2ZvJW

On Mon, Sep 25, 2023 at 03:48:25PM +0100, Alex Bennée wrote:
> We need this to test some TPM stuff.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/cirrus/macos-12.vars                    | 2 +-
>  tests/docker/dockerfiles/alpine.docker               | 1 +
>  tests/docker/dockerfiles/centos8.docker              | 1 +
>  tests/docker/dockerfiles/debian-amd64-cross.docker   | 1 +
>  tests/docker/dockerfiles/debian-amd64.docker         | 1 +
>  tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 +
>  tests/docker/dockerfiles/debian-armhf-cross.docker   | 1 +
>  tests/docker/dockerfiles/debian-ppc64el-cross.docker | 1 +
>  tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 +
>  tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 +
>  tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 +
>  tests/docker/dockerfiles/fedora.docker               | 1 +
>  tests/docker/dockerfiles/opensuse-leap.docker        | 1 +
>  tests/docker/dockerfiles/ubuntu2204.docker           | 1 +
>  tests/lcitool/libvirt-ci                             | 2 +-
>  tests/lcitool/projects/qemu.yml                      | 1 +
>  16 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp512689ejc;
        Mon, 25 Sep 2023 09:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGanPXjy7iNJnqeOD0eQOkFpRwmbbmZ6s7y7DAo6pIcIfgf/LV/tIFVeFw3TjGJxhss/O5H
X-Received: by 2002:a05:620a:280c:b0:76c:e0c5:2f6c with SMTP id f12-20020a05620a280c00b0076ce0c52f6cmr6119356qkp.38.1695659408759;
        Mon, 25 Sep 2023 09:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695659408; cv=none;
        d=google.com; s=arc-20160816;
        b=LyjHUXIjJ89UeTjv5u/R8P1ah/eTiV39tN70m2+asIxUaWMktT+z5N6gzvg7UK5t+H
         ECiWyDpI5TGU9r+bQoZlRAVtKv0MN3SqdFjRxuzyAqj0wHAiCaq/5QGrujuM2JWSfcVV
         9p7M1jvF/EsmzCNr4JIroiXfBSvGlyP/69jQWIvcRR8pJGYSHK1tdWDKCuGLa58YlZtY
         UaONNb/hm/wnWiYAyX3VtHNRqD8Y4EQz3jDkWIrk4qeb4Hgm99vTufOBa7QT4ZvSQ1qN
         /BSuYJKeB15H0UDMez9bX+zgM9nAykM7Ro+vwZhg/2Ne7T7ON/JaYEMsR5oOcul//sQq
         VbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ZDkrPOy4Mu3WpHlWim56rb19dnBihC6z5EAVjpSCRR8=;
        fh=qRaaJWpKB8b8LeAvB+0Yn3BLVou2mEMkuWB2O57lVPU=;
        b=mu58bMZ/fXXtAcz0Iyctq2t9httP2bB7Ln8j3oPtC61aP74caCw9EZZlM+pdy018F9
         hO8kC+he6q7y60RX30Ysy32XH8fO2ysiIzalbS9D3fGzO/gNeIHCa95Fh7QGQPZeEaQA
         o7jaBu5joB4K5Ns3vFoYo7QxAqTStyk4HKkMYK05bh3PQw/xqdD5vnhLqdtHbf8n7jHL
         voCYNv6kdJLLHF1vckiBc/mSAQRfOgjLn9sBNdGopyRm9t2pG8+bJ2T/LjZSHwQ3ctP7
         7FZlkzS6xS1iRxMdGWFY77+Lw9HmH2KbLL3f9p/9DQplWYluJJ5cqkczYMP8FVkyaS+y
         yGCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PDTMbaKi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s8-20020a05620a254800b007706544a3a7si6387659qko.673.2023.09.25.09.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PDTMbaKi;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695659408;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDkrPOy4Mu3WpHlWim56rb19dnBihC6z5EAVjpSCRR8=;
	b=PDTMbaKigOUYCqOl+W2wZHTKaqmK1l75K8M3rk1qk9IHBCJDyei90G7V4ewau13Fm11B/w
	A3F2+HB0A91hC1VwwC5Kdq32HGv6LZk84P2PxsScrteH1TDIWRqCNas01HpO8TduYpZ26w
	gNps2SxVZ621QPNjcqHgmzcWdlmk6Qo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-zwygcdyoNCmo62csKb8R4Q-1; Mon, 25 Sep 2023 12:30:04 -0400
X-MC-Unique: zwygcdyoNCmo62csKb8R4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 059D9811E86;
	Mon, 25 Sep 2023 16:30:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51CBB40C2064;
	Mon, 25 Sep 2023 16:29:58 +0000 (UTC)
Date: Mon, 25 Sep 2023 17:29:55 +0100
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
Message-ID: <ZRG1g/2hWi8+AzNn@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230925144854.1872513-5-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: 5Sj81uia8vxT

On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Bennée wrote:
> This might be premature but while streamling the avocado tests I
> realised the only tests we have are "check-tcg" ones. The aging
> fedora-criss-cross image works well enough for developers but can't be
> used in CI as we need supported build platforms to build QEMU.
> 
> Does this mean the writing is on the wall for this architecture?
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

Deprecated is generally a warning that we intend to delete the
feature.   If we're just going to relegate it to untested
status (what I'd call "tier 3" quality), then we should document
that elsewhere.  I don't mind which way we go.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

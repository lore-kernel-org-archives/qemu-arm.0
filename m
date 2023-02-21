Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3138415ejb;
        Tue, 21 Feb 2023 02:57:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8tLMthTNIZ5qOgzEzPNGoHA4utNXXTHIFi4CVYCh0N6mHI7kE7xUomjYCOYXnYv6gsIV/Q
X-Received: by 2002:ac8:5b15:0:b0:3bd:6cc:22b with SMTP id m21-20020ac85b15000000b003bd06cc022bmr4299180qtw.66.1676977045400;
        Tue, 21 Feb 2023 02:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676977045; cv=none;
        d=google.com; s=arc-20160816;
        b=C6QGfLzxKunzRAWa2m8lGmI0rB/GeyEcoOAfYv9jgIc0k6SQk7qiaB5dLN5eFiHGAi
         1CGnFJ515Jweoho9mqrEaLxJhDiAtnDzAfC5UPCKtYqgcHy4Ldz78Lip9lK3jwm0Nifp
         QvOaUkXgT4BTIG1XSP+UiJnZjA50Cm5rbiW+VE38JqEtLmVU11mlZyXHh6JB2AfDJtBg
         p6inVirHGQJzKO90Y4srhAPEjL7zkmTb5qdu2PxloQmOeDAzBaV/BZmF55jDrtmd05LF
         qFQufqWI47X8rLKMk409xUCAwLWltAYYfWKioJC4ojhcuwW3asFkPiOdI1bd+73O/4pt
         1hdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=DV91oH5s4/i3PI6iggCrFViacVYZnvK4gHDy0UorEJU=;
        b=YVCQeuCPdeGvk/+Lj5Ht6XxEoOu2VDV8GuB5DiWAv88rldM1MOq+xJL8iLr4clpKMA
         1f/XiCvmP2WZinJakyBK+Fj8vCMBBi0B3to1wWMBOicdjNUHrq5kl6wHK3x1MK4bYzLv
         agni8Ok9vX2rxCzeZi2P5Ttq9duoGLqxcGrne7BgkIbfu90q68z7eJzXr3rjTPeleqCS
         Rqc5pDYY3hZirzQhF4Xn5sH8V9dE/2z+ksFKbCqNbGag3vfSIhkOqL3bUevecjuzWQuG
         hDmsOvhhGSpKAlTg1iB8YrkP6R7OkWI8Ngjuvx6CrsEmctStotxfp3dwcrypBJygfpTl
         4cHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RYHJIwwO;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kwolf@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a17-20020a05622a02d100b003b9b7747550si11940749qtx.575.2023.02.21.02.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 02:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RYHJIwwO;
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676977045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DV91oH5s4/i3PI6iggCrFViacVYZnvK4gHDy0UorEJU=;
	b=RYHJIwwOBuVFb5KJxu2Lq6tdbaZ9ywExadws2EqlEFE+ygKq9HY4cqA6rHvLEMYiSEY6wi
	eK9xJtCEfc2YNsXCoOP+hoXFZUAGzcJrOq3yP3kRjK7M4IQR3RVLmJ4pmbgFbOnmJvbbdc
	0ZHJjSbRqD1E7G63NwJKOMKXYwxtxE8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-hxHrTap4MBONRKzulp6XrQ-1; Tue, 21 Feb 2023 05:57:20 -0500
X-MC-Unique: hxHrTap4MBONRKzulp6XrQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CC22A5957B;
	Tue, 21 Feb 2023 10:57:19 +0000 (UTC)
Received: from redhat.com (dhcp-192-225.str.redhat.com [10.33.192.225])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA345492C3C;
	Tue, 21 Feb 2023 10:57:13 +0000 (UTC)
Date: Tue, 21 Feb 2023 11:57:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
	Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH v2 01/14] block: Handle curl 7.55.0, 7.85.0 version
 changes
Message-ID: <Y/SjiDQR1/xBlUMr@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221094558.2864616-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: uiAiXYRi+M9g

Am 21.02.2023 um 10:45 hat Alex Bennée geschrieben:
> From: Anton Johansson <anjo@rev.ng>
> 
> * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>   version, which returns curl_off_t instead of a double.
> * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>   favour of *_STR variants, specifying the desired protocols via a
>   string.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230123201431.23118-1-anjo@rev.ng>
> [AJB: fixed author]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I assume you only CCed me for this patch? It has arrived in git master
meanwhile, so when you rebase, it should just be dropped.

Kevin

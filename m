Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5151255lfk;
        Tue, 14 Dec 2021 03:39:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxncR20w+Jq72UjQlRtgkhWFqEKGJhGjpDyvwf4bfSs9LrVaGJP2XCkwMWlyDZfDlwZVH6S
X-Received: by 2002:a05:6214:c47:: with SMTP id r7mr4799502qvj.51.1639481942829;
        Tue, 14 Dec 2021 03:39:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639481942; cv=none;
        d=google.com; s=arc-20160816;
        b=G9MvmwTh7hKMk8C4YdqBwZujxQJZ92H3/l5Z994L4q9wdmppQYoKLExQ9tBsr8doJf
         hlVv3zObq54/u5eXJ1yqbsAJqagbPRRhvfkvf3FmPZ8bTXc596mTzdvm6V0/IuPTuOut
         5PGwf7NIi696A/9QQtce1Het4FMWt5+aSoIouFZABg/fwfreC1kXim9LLM3X7ZnGac6o
         WNnlN9U4PW67tsugVf+BybaYBM88g9n+ieeyo7ImlT7R4pC7JU23Vs/8VByfzC74X7rO
         kwa/DvPwd2SzFFRaekqepf6dNq15LiOJvv2GBEfkQuizS/cvK0VFtaB+Oxe0uy1hgoYe
         DcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0j8FhG3Pdijo+JlLzqQ4wiB6x9V3flBlZRvgbDc00+M=;
        b=EZYpK16klVaAR3YoO4DTF1tTRCx0kLXmDigMyWg/ZK6IftYvQt/aaPIUc5oXXVupK8
         pDel2xWSPMThzGbtmygW8KP2XVYjBYAqMBmklHGH95r7ll+atLGAH2pid1cWHrto7A6B
         e64PGVjjMv+0nRZpfTvXX5oT1Xmt/NZr8JMNOdn5+v50SlPonX3yIp+MfdyjACYcGz/A
         E1wbSGHrNdPlu7enIl9ZjTfMKBxEeXV1J4sBYFSJ1cFdgu2hlNoKXy7likpzCDe37Alg
         UhLsYgTAuaRe34O7QzjCYiQKizpvRs8xqPOV/1hYMFfEDT/DTsgY0S54HyG3HuI+WTv5
         JNtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OcPMK34H;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g4si13301961qtb.144.2021.12.14.03.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Dec 2021 03:39:02 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OcPMK34H;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639481942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0j8FhG3Pdijo+JlLzqQ4wiB6x9V3flBlZRvgbDc00+M=;
	b=OcPMK34HRGnZSkyndtCMK7nyX9U9M6v0K44X8/tD4YWMRjtYVVaaSTJEZ0cVf5mmRpAf8j
	nEWdXEoHAinw2WPjyg3HMKFdSKGtVKHZOJ5JCZrOtopmIFsW5iM82rU9WKhf5/4/2QpO+G
	4h11n1QPMMI9ONeIq+5ehKxYTpR222A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203--Mv0SY0KNNSWxV5KAAAuxg-1; Tue, 14 Dec 2021 06:36:16 -0500
X-MC-Unique: -Mv0SY0KNNSWxV5KAAAuxg-1
Received: by mail-ed1-f71.google.com with SMTP id m12-20020a056402430c00b003e9f10bbb7dso16695307edc.18
        for <alex.bennee@linaro.org>; Tue, 14 Dec 2021 03:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0j8FhG3Pdijo+JlLzqQ4wiB6x9V3flBlZRvgbDc00+M=;
        b=w1NVXV5BC8eG3VwwSbpwVCH6FiNCGAPvch9le1zvWD1xWbprumMWW8wdmoZvLSFN+X
         ybvXXI8BPJKTFdD7p3M7VbZ/Z5yGI/qOzQjH+/O23eZD7Cl89xMfi6K5CKiYguJtCxhA
         fTT1qX8LEDrNgNep8cIc1A2zZXd4+YNJ4JZODnXyqFYc7PG2IEOhnJQIX3NvTHRLm/lS
         8bnXu+pCjBqUF/MNuM2gwjfLXUe4rpxmmqQcsBNoj2TR8YItP7ldfxO8115A8cHNPWeb
         fT4a+XRYgj5N5yojCj/1iA+PmmSStlX9bz16wJ/sqS6hSiQm+VxEKVUZ14pVzkwSr213
         Si7A==
X-Gm-Message-State: AOAM531q+bKGw3BuW9vfUk4sNbXjKHEYvzkXTNW6G892q+CXJo3A7F+Y
	eFrY2PKlfEUFnLsaFef0jZE2LBGnOiLfnhMZKWTOfBUF37+oH6QwsDK5GnBIxfZRMO+GyEFVPTj
	LgG9PB22g6T52SMtA+XZ8/u23i3KEnMJtt258zc0y2sxcS9YDkUBo++mbC1ErqGjQbrE=
X-Received: by 2002:a17:906:9b92:: with SMTP id dd18mr5231701ejc.425.1639481775767;
        Tue, 14 Dec 2021 03:36:15 -0800 (PST)
X-Received: by 2002:a17:906:9b92:: with SMTP id dd18mr5231671ejc.425.1639481775578;
        Tue, 14 Dec 2021 03:36:15 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id ck12sm4885009edb.53.2021.12.14.03.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 03:36:14 -0800 (PST)
Date: Tue, 14 Dec 2021 12:36:12 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: pbonzini@redhat.com, thuth@redhat.com, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com,
	maz@kernel.org
Subject: Re: [kvm-unit-tests PATCH v9 3/9] Makefile: add GNU global tags
 support
Message-ID: <20211214113612.u7g6n3ye4auj56s7@gator.home>
References: <20211202115352.951548-1-alex.bennee@linaro.org>
 <20211202115352.951548-4-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211202115352.951548-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: NqhR5Xax/8ii

On Thu, Dec 02, 2021 at 11:53:46AM +0000, Alex Bennée wrote:
> If you have ctags you might as well offer gtags as a target.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211118184650.661575-4-alex.bennee@linaro.org>
> ---
>  Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index b80c31f8..0b7c03ac 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -122,6 +122,9 @@ cscope:
>  		-name '*.[chsS]' -exec realpath --relative-base=$(CURDIR) {} \; | sort -u > ./cscope.files
>  	cscope -bk
>  
> -.PHONY: tags
> +.PHONY: tags gtags
>  tags:
>  	ctags -R
> +
> +gtags:
> +	gtags
> -- 
> 2.30.2
>

We should also add gtags' generated files to .gitignore

Thanks,
drew 

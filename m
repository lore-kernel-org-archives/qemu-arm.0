Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4147366ejb;
        Tue, 21 Mar 2023 07:49:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ecmVeOpUUhPrAca8nCBZqdh/pwmQ7NL/O+50EQyCsOL+olFcxf/oGWjGmnZnXrHOgDYce
X-Received: by 2002:adf:dd12:0:b0:2d8:6cb3:dfde with SMTP id a18-20020adfdd12000000b002d86cb3dfdemr3548612wrm.1.1679410164982;
        Tue, 21 Mar 2023 07:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679410164; cv=none;
        d=google.com; s=arc-20160816;
        b=LitUHDcMKF+6o2WdwtLXfB7RQysELm5SwTPY0/1ZzfLzVu9IiCy+qxxpdYVaxuvdsZ
         mEBoudyyiNO77oodqv69qlbyWG9Ty5c15IUhWPAh+jku51IHtDv1xHIP/8Y4yilIHoX8
         QkPmxnq100DJzdJhWOjL+MLyf4H4wxJ6jYRZrenrSlNDC7hO8b6Zr8eJ/52le2iOBuix
         0wBHWNA9NsvUX6OKpfURqVbZsSSvLQDzyCdoh3luMVrafAB6LN8qk5IuJLqIE4urwLsC
         SQ6nMNmS1SZoI1Ts1Z6PG0JUi8s211w4UzvbT7mYA5FFJxWfaz02GTPI9olAPHwb3o/o
         ngzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=qbQfRBfczUJav6FHt3ZKMjH+csQpxkzMB8JxUvxdhEg=;
        b=p2c0uC+0VTA0+NFL/vR7fZxavlZ4meXeCGa0vvUsVqlvkGTAsD17qLKvWhq0LYmjY+
         MfacsvIsKg0LZeJeBs7mDA282/+3qkM/+Dij+Fu8UoqS16duy3fYgincADR/XcLyWU9U
         h9aEvIANq6bqzPA8C9SFvOpP6fDusA0p9AN8UvxUNUoju8bQJ6qZXXdqEWv7yi9AADpg
         mJEszwlB222aDLVDnTI7T9rdTke3cgb8ju8ZdfDZshJPpMeI2NywWdai1tV86ctL40Ty
         reIKfEdNhTe+DTqsClkav5+Ro3hhMqefPbFsocEv/68NDcSWilu2yj+hXIECFGuBcVS/
         RbrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=hfMGnzoG;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::9 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-9.mta0.migadu.com (out-9.mta0.migadu.com. [2001:41d0:1004:224b::9])
        by mx.google.com with ESMTPS id p3-20020adfce03000000b002cea8e4bb78si10815506wrn.118.2023.03.21.07.49.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:49:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::9 as permitted sender) client-ip=2001:41d0:1004:224b::9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=hfMGnzoG;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::9 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 21 Mar 2023 15:49:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679410164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbQfRBfczUJav6FHt3ZKMjH+csQpxkzMB8JxUvxdhEg=;
	b=hfMGnzoG6xzWlox+ufsQX1egceC/3JbHyhVSilkiaV+C05kj5/k/2jyb75UTOgfVe9SVO8
	Dv0iKHcJVeJyPZTUhDUpu/N3qpFLSn6BX4v4acfZSWDNG2UvylXHh1RokgUtIlbvvCkTkz
	NlbjZ3Xw03ajFpUmCbPcF375angm+zo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 1/7] Makefile: add GNU global tags
 support
Message-ID: <20230321144922.kiptey3aiwnz7j65@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-2-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-TUID: 4iWv/5RZCdtU

On Tue, Mar 07, 2023 at 11:28:39AM +0000, Alex Bennée wrote:
> If you have ctags you might as well offer gtags as a target.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211118184650.661575-4-alex.bennee@linaro.org>
> 
> ---
> v10
>   - update .gitignore
> ---
>  Makefile   | 5 ++++-
>  .gitignore | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 6ed5deac..f22179de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -145,6 +145,9 @@ cscope:
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
> diff --git a/.gitignore b/.gitignore
> index 33529b65..4d5f460f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -12,6 +12,9 @@ tags
>  patches
>  .stgit-*
>  cscope.*
> +GPATH
> +GRTAGS
> +GTAGS
>  *.swp
>  /lib/asm
>  /lib/config.h
> -- 
> 2.39.2
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>

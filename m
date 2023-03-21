Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4151646ejb;
        Tue, 21 Mar 2023 07:53:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set8xm63swYcqwKhCIiLHQuqyKGDH+Vxg61cvO9uNIMNhK8TgBfzeYRXW6Mcbl4zZHhQlvc6I
X-Received: by 2002:adf:f64a:0:b0:2d8:96b4:5ed9 with SMTP id x10-20020adff64a000000b002d896b45ed9mr2292338wrp.38.1679410408601;
        Tue, 21 Mar 2023 07:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679410408; cv=none;
        d=google.com; s=arc-20160816;
        b=ujrkIkTw2betuMRRW51shJ0eKahQ0AMaGeC3nBjJ6SRTdWMF/IdvWydtQMjCLuG3kn
         oXI8QjnJc1QTUkNBL4algE9BbbsD+SI/uLsbOnWHqJQeRJTk0QTKonxHdIHe4iC509Qz
         O9i0W8uLWjFN5masADfkBvoTWOCqlAdJ/ptb5p8Fh8x90l7YXbr9FBrGbjonY0gNQNjV
         jjJEAoAcac3a5mkJyiiXjpvxs1YrnG51IZ6aCs8OLAM4XfahtcPg6i13bx8pZoMQu5vj
         FWtwlNX5Jjl63C5r6gjbLGZDhwrIzLFpBetCMwRa/5IjxaOvXF029R3JvYPDNqTN/eTo
         KDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=v7nt2ZcLJI8v874JEFEjYqSymW12b5rJowFOtO9NW+s=;
        b=qwovmNpj2FP65nH7400k/5cyVqWVVxfCghuR+lyngx/L6bti9O13XsZljXJtb5rHr8
         +tagfeJho3YBlzps4H6ZbbAijkKN4IbUTQZQ41tTmbKKbGZ+gqk2UzymHmsV9Vmj6lhi
         fVm3qYWhO+R44jq/x1+lqT9EInb24UO/UX08GaPx6ZAfnVgC8+pANmmvdjIqewSxCiiA
         QR2fKTDzlhGd7WN88sGj8EuiA9gZ+/wRWWUzC+JinO6+nZXrr+ndqhQsRfbIskYdLEp2
         Nk5JZ0f50TT4/WbtbODGIgQEJMNaxralVtuA8g3U29cMRO8bhwzOgAv9tTf/r2rLPQ/u
         2NHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=a+wfCfzb;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::20 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-32.mta0.migadu.com (out-32.mta0.migadu.com. [2001:41d0:1004:224b::20])
        by mx.google.com with ESMTPS id n8-20020adfe788000000b002c57384dfddsi11170997wrm.564.2023.03.21.07.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::20 as permitted sender) client-ip=2001:41d0:1004:224b::20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=a+wfCfzb;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::20 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 21 Mar 2023 15:53:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679410408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7nt2ZcLJI8v874JEFEjYqSymW12b5rJowFOtO9NW+s=;
	b=a+wfCfzb7+0szC1XzKTnNenvmBweKKpql/zf6uP0rwrey2NFzQ/HB3kibfl114mn8CYK4I
	CbqIbIQZ24Wf1W62V28WtzSAcWYSS/CNQEFecyaM1XuPUwv2q/1BJUJBSD/IDuw0+cB2GH
	3fI+oEds7aY/76gwmjP6XwcqF5khQjg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 2/7] add .gitpublish metadata
Message-ID: <20230321145327.oetnj7ao7jxjp5ac@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-3-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-TUID: P7OzopG1Msek

On Tue, Mar 07, 2023 at 11:28:40AM +0000, Alex Bennée wrote:
> This allows for users of git-publish to have default routing for kvm
> and kvmarm patches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitpublish | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 .gitpublish
> 
> diff --git a/.gitpublish b/.gitpublish
> new file mode 100644
> index 00000000..39130f93
> --- /dev/null
> +++ b/.gitpublish
> @@ -0,0 +1,18 @@
> +#
> +# Common git-publish profiles that can be used to send patches to QEMU upstream.
> +#
> +# See https://github.com/stefanha/git-publish for more information
> +#
> +[gitpublishprofile "default"]
> +base = master
> +to = kvm@vger.kernel.org
> +cc = qemu-devel@nongnu.org
> +cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null
> +
> +[gitpublishprofile "arm"]
> +base = master
> +to = kvmarm@lists.cs.columbia.edu
> +cc = kvm@vger.kernel.org
> +cc = qemu-devel@nongnu.org
> +cc = qemu-arm@nongnu.org
> +cccmd = scripts/get_maintainer.pl --noroles --norolestats --nogit --nogit-fallback 2>/dev/null

Should we also set the prefix for these?

 prefix = kvm-unit-tests PATCH

And maybe even, 'signoff = true'?

Otherwise,

Acked-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

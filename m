Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2306928ejc;
        Mon, 9 Jan 2023 06:42:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvD6U+cli6+5Av0JFteM0vMsOek0Llcgk4O5WX+g450KyAmFhJBJuWQUcz0PEutqcU/WRdU
X-Received: by 2002:a05:6000:511:b0:242:5d6f:3915 with SMTP id a17-20020a056000051100b002425d6f3915mr45664354wrf.46.1673275319980;
        Mon, 09 Jan 2023 06:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673275319; cv=none;
        d=google.com; s=arc-20160816;
        b=EiUNp/Ag6faSzYwh4ACnoGMzDn4FNpOrxvZcVKrlYCR/88b2TKNqdwvfI5+fSFAQat
         N/BJXBk88EGSr8fhQjWxKbw2ru1aOK6xUaReuVO1413W4xYGJnWB+vQ4OJJVDptcBaaa
         wvUxuvjHgoVuBpJi2C+1G+NJto3B5rPkmS91VtRYQh5ySxSFnkyUmeGhIx70xGeiHtcH
         UAP11WQYFkkRgOmqGjVpcI5mEtPyxZi3xu8XL24jCE0EQNLScUvXuM+NKpgfSX3C/+tG
         jmBPUm/Fvtl+Dapn0FAJhqTP0TuTWBmKXKpocchxltx9vo5rsb/F/+xJLhSJNh0M5/L2
         cWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=iHFlgpkGpYic5RNI5UT+NVGDLtt0LXFu+Yz4SP+WGu4=;
        b=H4y0zgCMRoHxxADETUc77tg6qvdLm7FRcdxbU8D29QapfhFHo2nAF3Ug4kfu9SrN1w
         dh6Vou+Fo3fSIZBY5cpW25JGsp1ozoYmwaCPpWv5Juyeg+2bvw7is6Q6As0yxRmeG5PA
         wh9vPOvbUXfuEslfxCaLKOiGPWZaZ7VkTuiHx1TkAiXNqW4OPjPnLC7OlkHCX9RfaIAN
         eFY8+uBSmjJpaw9nQHIO+a0dmXoNQn/DgVZRCWGtcamGRM99YEr1nWfjqMxdqhKeZcFS
         Cn6BKUyvrwPZRplb9+ufBaftBR4UPA4jPC92iIFt3VEd9AdKRwAjF0APiYuzbb0tUcep
         xWTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=N6CUBhvR;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id i8-20020a5d5848000000b002868d09e1bdsi8460668wrf.814.2023.01.09.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=N6CUBhvR;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A6763EF62;
	Mon,  9 Jan 2023 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673275319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHFlgpkGpYic5RNI5UT+NVGDLtt0LXFu+Yz4SP+WGu4=;
	b=N6CUBhvRe1EONzsKoVw5j6ASc581na+ZPU2WVF4aqp8pJAPkzkTVPOBbwa12ZaM/AJUwt9
	Dm6vto2v8xZeegelCpLVlsBrT4eSDXKL4D9Rnj2uNb2GhyWJB5vCmltBOG+rVpyo65PRyr
	FiVqiwIXrBCJ7qgHF6xwU81zvGXwaYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673275319;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHFlgpkGpYic5RNI5UT+NVGDLtt0LXFu+Yz4SP+WGu4=;
	b=2T3oSKLuVPe0kunXbyaAwdjrinGLVuq/hAmEsqng8bHAjvfY0Dorb1H1m1tsWUxXehZiha
	WOQzcupeMx/JgVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A961213583;
	Mon,  9 Jan 2023 14:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id X6S/GrYnvGO1NAAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 14:41:58 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] tests/avocado: add machine:none tag to version.py
In-Reply-To: <20221215224725.3236-1-farosas@suse.de>
References: <20221215224725.3236-1-farosas@suse.de>
Date: Mon, 09 Jan 2023 11:41:56 -0300
Message-ID: <87358jzs5n.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 9Jwr/JJb9S+E

Fabiano Rosas <farosas@suse.de> writes:

> This test currently fails when run on a host for which the QEMU target
> has no default machine set:
>
> ERROR| Output: qemu-system-aarch64: No machine specified, and there is
> no default
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/avocado/version.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
> index ded7f039c1..dd775955eb 100644
> --- a/tests/avocado/version.py
> +++ b/tests/avocado/version.py
> @@ -15,6 +15,7 @@
>  class Version(QemuSystemTest):
>      """
>      :avocado: tags=quick
> +    :avocado: tags=machine:none
>      """
>      def test_qmp_human_info_version(self):
>          self.vm.add_args('-nodefaults')

Ping

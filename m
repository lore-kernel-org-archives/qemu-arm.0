Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp797542ejb;
        Fri, 17 Mar 2023 05:05:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/bCRX1JqjQH+0xofz/4DAoH0kYkqEnBWvAX07T0GKv9AVVEbzuG6KdNUIbGiQS2hg2DDtn
X-Received: by 2002:a17:906:9413:b0:930:9197:24d1 with SMTP id q19-20020a170906941300b00930919724d1mr2619140ejx.6.1679054743243;
        Fri, 17 Mar 2023 05:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679054743; cv=none;
        d=google.com; s=arc-20160816;
        b=l1ao6KqvlWtiWDyK90l2DbdA8SbOsdsqWOQD8/3vl2KwrQbsC3cXby3NxHy13jYrfD
         DltS9zvVDsdSnMf2lZK3Ez947+MZYI+Ggpeif14rmhMWguf5pz72+EmGrSpZG72eP3Px
         p5a4MhmfskxTKoLu7hJDBcN7KY2bVTfE6Aoe4tQlwIG2oDwxNudY0+uIwdsWYWif4GcX
         BVdVrIFee89XyYN9LqQQ6/2zYx0w41FIHO2B+Nyxsgy5UwAsP29n9fCnu+dhfrhMkt9d
         u/o0dfEpTxE9dtj9yNmxtkIve71jttI5noS66Y7HLycu7+Omx2q7/iA45ZwRnJuKAffh
         BysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
        b=02hlmP+D275unrF0eRitGzUAJhZCakwdLBvzTVwRMt74wBI0xVc3LF1646g3g78dIG
         Fpgt8Z6oW/tdqCsgHxeyxTB/pW0ID4fKCDJI83CoJ+Fb1v5/bsLyJKz/R3q9tDNafBf0
         visHn/q1iTM/z35oIia/voVpryyOlRoU1tAULLYKn7nzgvvTLtnJIBw3YSlFLPYxz2gp
         A+NmPtwzX13pTn8BGMq+enDguSMxccu/11DKeg8M7IJ3xeQzVKgOzMZi8v0ceWy9RVU2
         xlcGpXbaDZhkGV8tP/puJlel41K1eEGzKKny5YaiNpKZRuBIvQFmf6HmQ0eDEg39WouZ
         mR1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=drr482Hb;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hv6-20020a17090760c600b009325610fddcsi656378ejc.501.2023.03.17.05.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=drr482Hb;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679054742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
	b=drr482HbX2c7NU+p1K5kDbUc4gijM1kqDslEaCpl5ToDmT7tBK8FpXNV6wpS5yU7j8m6cO
	z37Bq98hEnMExgCd6TIxa7ZraApntfARSPyC7G7vhYuezPaC9AGo5cXwOiVBSD2dWPDZhs
	JyEkE9khSxzcPvBrYrmXbxuqcRTdHoo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-kaQUU-2WOaeEdvUS7hC4tA-1; Fri, 17 Mar 2023 08:05:40 -0400
X-MC-Unique: kaQUU-2WOaeEdvUS7hC4tA-1
Received: by mail-wr1-f72.google.com with SMTP id m7-20020a056000008700b002c7047ea429so770505wrx.21
        for <alex.bennee@linaro.org>; Fri, 17 Mar 2023 05:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
        b=i9I19wtK84JCz2qypUWKYnOIJXGOQjPFYs/lSpDCoRJUg3HnHPvOANh9nyOAe+49z1
         /izDzfjFBKhCax5g7i7zklFa49MlSv+qKXCoDlQVA+9FkJE8tOpb0fFSw48IJE9R/RFW
         dB8+yXezv7gDvcY30vOwJm8WaoVqPfonaPBvOIQXbUh6C5ZKi5z0lVuntB25mNhy6Z7D
         nog1xv7IKzv3AB18GZVEdpQJfOo43+zhgY7mf8RveUWy3N9cCSuy1ye6+3rATPuVZgP8
         tPSfVCQgj8xkq8vV1C999FeUZ3UODWdwVlHG7gROlcYQ0PEX6sMXSw79MUsqlzzSbX/k
         rDRw==
X-Gm-Message-State: AO0yUKXcFEmoMQpQKsL38YHPy455Z/9iT1lnByDcd+Z3ZjPf7mzOYHCd
	LoG/Hs2mjJ9RzCTzj8XTGK82tC5Fdcc3WoWGMwICPH5AT/U1r02hONlMfYQKBV5oblcuvT1z502
	HbFC5roaw4f/vabakvaMWRKhCWYQGkTfXGp1kUBm4t007wv5t5E7SZFUfaXSbGReFDA0yy3jNeN
	8X3g==
X-Received: by 2002:a05:600c:4746:b0:3ed:26fa:6ed0 with SMTP id w6-20020a05600c474600b003ed26fa6ed0mr2204853wmo.0.1679054739759;
        Fri, 17 Mar 2023 05:05:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4746:b0:3ed:26fa:6ed0 with SMTP id w6-20020a05600c474600b003ed26fa6ed0mr2204757wmo.0.1679054739358;
        Fri, 17 Mar 2023 05:05:39 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c220b00b003ed3034698esm2135722wml.9.2023.03.17.05.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:05:38 -0700 (PDT)
Message-ID: <ec17a227-8c71-d238-6ead-89cfec687727@redhat.com>
Date: Fri, 17 Mar 2023 13:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/32] tests/docker: all add DOCKER_BUILDKIT to RUNC
 environment
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rO7I7XV/h3c5

On 15/03/2023 18.43, Alex Bennée wrote:
> It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
> itself to get the full benefit of caching.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/docker/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 54ed77f671..9401525325 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
>   # General rule for building docker images.
>   docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   	  $(call quiet-command,			\
> -		$(RUNC) build				\
> +		DOCKER_BUILDKIT=1 $(RUNC) build		\
>   		$(if $V,,--quiet)			\
>   		$(if $(NOCACHE),--no-cache,		\
>   			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \

Reviewed-by: Thomas Huth <thuth@redhat.com>

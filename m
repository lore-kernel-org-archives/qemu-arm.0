Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp586215ejb;
        Fri, 17 Mar 2023 00:26:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set9ZDVTWFjDN4hXH95EmB/wU9a6ckYRftmLcGwcvEkXLQ6PzzZ9FgCRDuTV33rHYEPmnVLLh
X-Received: by 2002:a05:6214:258e:b0:5ad:13a6:b45b with SMTP id fq14-20020a056214258e00b005ad13a6b45bmr19285198qvb.11.1679037979782;
        Fri, 17 Mar 2023 00:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679037979; cv=none;
        d=google.com; s=arc-20160816;
        b=SKPBY3xTMxOees1V7OhnZ9rC0q93vHzjyVrNhanbIaiFWQE0QyU9hxHmTYN8NLPi34
         puYg6Vxb6R2KOSokk8RoO4FLWYFbYC7kjo7Xtkz/Vp+ISWrOBnNiJfN8cg/JU0PEId80
         csHqpOv8tWErfVJVHLqwrWv6q6QhmbiEkGuOYXJrXMF1P99rJvnsNh1nQg+kmvpAEb5U
         868IVZOgxrlpPTLWxaqiToBGr8J3sWuU7+lIfK8buwfuAWFb0l0Nit8j0e5M0rjpftdc
         WCAhyPbCskscDxPfpSXEU57XLsxDGOyuJonZS2TARRacZ0vETX81cJ0ZHbDpNi2xAKaG
         PmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HqrnyekWZtj3autRtqGDoL7x0MtC0GOcxCuc87fpusU=;
        b=whmTbs6p5+THJnATXWKeeQRnJlAEm3UDWkLd/wuj1HBCXBBsiHnVHA+bPosHb7s9Ms
         CbxKYkJ3q2AdG0J7xwq4RKMiEwhaPpx9biU3RPb992P36zzXzCUGuU/mGGP1Jomyv7AL
         jAKNcV2Y2lCb7PMI8PE5dhKYumhM71YtKWrUBoc+D8SLq8tp5w3SckkY1cQSQ3AEgkEC
         6ROKcjJtS+JSrsddeojiUIV76L5YIrKgnVeaffTDuZ4Ee/93+Ul/4xlFCh51zb51LrA2
         pfzPMQaZ+vcu4UD6bXwbreZIvpYy0HcgEXc+cCN+IQNaKiLt4iMKKkI53CC0Dt3z88NN
         9sSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AW+tEcn3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id es15-20020a056214192f00b0056ed12c0f13si840159qvb.374.2023.03.17.00.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AW+tEcn3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679037979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqrnyekWZtj3autRtqGDoL7x0MtC0GOcxCuc87fpusU=;
	b=AW+tEcn3kmIynANQ+AHSVugdjps7Qny298cQ+RBmwmEEIgDIHf3ynCkZzWrgDQLi7W2Hh5
	eUZjUG68K9sRSGHU2t0h8uXZfx2hQADtRFxIwxdLkZ/n7D6wAlQgJKHQj5oHl6ICdGiPQm
	Vn/q7lR40lwYhcnW4wiN3i6ahoMuF28=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-LBr3He5sMca95ULMBd8vVA-1; Fri, 17 Mar 2023 03:26:17 -0400
X-MC-Unique: LBr3He5sMca95ULMBd8vVA-1
Received: by mail-wm1-f72.google.com with SMTP id p21-20020a05600c1d9500b003ed34032a01so1890542wms.2
        for <alex.bennee@linaro.org>; Fri, 17 Mar 2023 00:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqrnyekWZtj3autRtqGDoL7x0MtC0GOcxCuc87fpusU=;
        b=aOkECjogw5go2zUQA3f8+rGgD89WqB4ZMQmeYWTm7HgI9HH2HnX0pKcR/fSApJRgNV
         1F0HqxGUHQ2kTf3gD1CshY2w0jFWmX8x9TqxvhjP2m56wPvzmVI3xw0antfJVjNKnPZA
         /5UqE5aPE0LTXXHfrYFhYRwFTSX9k02kTHOK3JNjJEOJ8MG955FSnpDzkGRrNsLvCSFS
         8Nf5BVPljTkpjTgWWewySgSGdBaCUmABE8ZJVZlvx1kU5+X4ZcF4bCxRvLEQPSdXoQvj
         Jt38fDJNoQiu3PEMhr4fi1Os//5Xq78DjFOGvRESIM4JmixhUEt4fWdgk8tkwLj9m+YT
         knHQ==
X-Gm-Message-State: AO0yUKU2BzEUfNGyqHc7oUiWl65PGMEXmv7Ea+KT3GBe2/MNXPTAXRvD
	f+wqVEYvMemimSJqGdxtnaE+KX2fc7/0ymkg7uxSFumlUKR+4S+8fkl3swOvSUUrP2xJSqMRSm3
	E5Eo65bYPa5fAnUIr6Cl9KC2wmkIeihjyAAUzguktp1YmxOlcQvVkoG8s/eK5uNtajrIakN5Bmg
	U=
X-Received: by 2002:a05:600c:4fce:b0:3ed:24f6:1089 with SMTP id o14-20020a05600c4fce00b003ed24f61089mr16092914wmq.15.1679037976158;
        Fri, 17 Mar 2023 00:26:16 -0700 (PDT)
X-Received: by 2002:a05:600c:4fce:b0:3ed:24f6:1089 with SMTP id o14-20020a05600c4fce00b003ed24f61089mr16092826wmq.15.1679037975745;
        Fri, 17 Mar 2023 00:26:15 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003dc42d48defsm1479979wml.6.2023.03.17.00.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 00:26:14 -0700 (PDT)
Message-ID: <e3e19ba8-6574-c989-ad02-25fabe5956f9@redhat.com>
Date: Fri, 17 Mar 2023 08:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 31/32] contrib/gitdm: add more individual contributors
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
 Peter Xu <peterx@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Amarjargal Gundjalam <amarjargal16@gmail.com>, Bin Meng <bmeng@tinylab.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-32-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-32-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LByql/RvOrw7

On 15/03/2023 18.43, Alex Bennée wrote:
> I've only added the names explicitly acked.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
> Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
> Cc: Bin Meng <bmeng@tinylab.org>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> Acked-by: Bernhard Beschow <shentey@gmail.com>
> Message-Id: <20230310180332.2274827-10-alex.bennee@linaro.org>
> ---
>   contrib/gitdm/group-map-individuals | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
> index e2263a5ee3..3264c7383d 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -38,3 +38,4 @@ paul@nowt.org
>   git@xen0n.name
>   simon@simonsafar.com
>   research_trasio@irq.a4lg.com
> +shentey@gmail.com

FWIW:
Reviewed-by: Thomas Huth <thuth@redhat.com>

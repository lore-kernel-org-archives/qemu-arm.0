Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp801773ejb;
        Fri, 17 Mar 2023 05:11:26 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Vpwc+qjFnlxt1Lny+CwVDEqDN9rrSIWgSpn+MgUra+cbFoxFYmcLBpnV2nMzhn2tq2NkF
X-Received: by 2002:a67:f992:0:b0:425:d658:5861 with SMTP id b18-20020a67f992000000b00425d6585861mr3071069vsq.10.1679055086179;
        Fri, 17 Mar 2023 05:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679055086; cv=none;
        d=google.com; s=arc-20160816;
        b=ROaKB2AfT2RAHGG5GPVDLHKGw+GdEbH9NWehIZOHa8BkxW8XXyL6PH7otbyuDhuSx8
         FoJ7qjvFQncb0pnuJP5+833Uy8xAHw8UlG80k2IXvc+NKXLA1pe0pvz5xH1C2Q4e59z3
         ZE1yaE2RTXG5/gIIJUK1Di5R/O2HOioJ1Swwj9hsj763bS1HM4F1vfCBlZDpJeJb67cV
         hz1YF+S6CbsBU2xcshrxSS6+UOFgI00mFiuV9e8FOU1KZ/VQQf3BiMnvfUBKwmuRxanp
         REWilSpXihSGyY7u4xKCOg2APXscDU7BbE/DS4Ur4rvuDwCIVoft+kh1+m8LrOsf9eD5
         Q2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VdyWJZv8vhAFDbVlVpAgxslKT4rLXftuJGVINjtZsvM=;
        b=Yh3jInhuverrlwkO1uAid0W2mcR1I4H4a3qUhsS3+hCZ2A9Mm40IQky32TXXa/ueFa
         3bKbG1KTYeaCc4+M7CBDigMRrpUR3BqiBt6Ud8suRK3jH/7g5yG8TZudxcMVS6iIMSgP
         Z6JtdWgiSanYonUxiVRpWkcLUKS3I8DgAxmRDyJHuFmNY6m12b265pBgXLBWF3+dWFJi
         iXmNruBnd2FM6qJ/SdRynSFp++DYkAosHTsbcEub69sSFjjdqErjP6ba87YYrXtqVjGo
         GqeJosl4mvkwyWaUUYN4XyD7lQ8uzU6ZOVEEOpzMHV03NM8UOx9U+mThRaUcMLjINQM8
         YCUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aJDcFbUR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o16-20020a67eed0000000b0041aab766b94si418857vsp.645.2023.03.17.05.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aJDcFbUR;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679055085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdyWJZv8vhAFDbVlVpAgxslKT4rLXftuJGVINjtZsvM=;
	b=aJDcFbUROquPXUKo9w8C56fBPn8iu5IzU+OUyjszX+NGEkTDr5tXIA8icom4bTK/ezK5BM
	Ho5UcR9qX+ghLZgIEAjky0A2f44CYCw+ltOb+YUUYhrNdvdfKjXq+u8HGlXUtlWsTVThEt
	R9kU+VLDSVAsRVNW+6c9qCxXT6OyQz8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-7rlgmbohPBWIikhikOB8_Q-1; Fri, 17 Mar 2023 08:11:24 -0400
X-MC-Unique: 7rlgmbohPBWIikhikOB8_Q-1
Received: by mail-wm1-f69.google.com with SMTP id p21-20020a05600c1d9500b003ed34032a01so2188591wms.2
        for <alex.bennee@linaro.org>; Fri, 17 Mar 2023 05:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679055083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VdyWJZv8vhAFDbVlVpAgxslKT4rLXftuJGVINjtZsvM=;
        b=vFuoOgVF4McTgL27j4/NS+zNiyFj1e2ET0huPsW4ytwqCov8DJ5mmiwJKrx8042xye
         00uBzQn+gQ6NmcokSWw8hY2tfxiA3DkFlqY0LR2DlBcB+INWDMrRVVkF5C5v1Tmpbbxn
         GVx17fg2hCGXmW8OoI60uueW5qSBpHe9C79MxOyYdWz6381+C2+5BhzQ8/utyS09G88h
         i0kqDPgYj8igdhN7HBcFgC6SQsQQTWjPsyYKLk24iiROY/z7NXWu5VZ9FbjjB05R7aNN
         CwfYdFg1NOx8asJQlzzJ1oCXPoe0g0rLZxGCicG6miymMSY5A2m4eo1rosh+ZLaugSJ0
         Ke4g==
X-Gm-Message-State: AO0yUKXT1vSz/rBbo6OYgc4brGGdM4WZAagldhlFFVfnNFkQUUDqV5X8
	K//2vRKNXGOn6pQPd3Rg8sPQpicAglMvtWVYaJEDDea/bsJ6febozBNiF+GfHXiqZk3shMrnN2W
	55RhmGCrsR/AtOqzvXj8+lu7ZTfH2ARl5D5nBNPj3/GKTrSu2rGOhqHLk+I0EC4L+S/jUNzKv2n
	bC8Q==
X-Received: by 2002:a05:6000:110a:b0:2ce:a93d:41a7 with SMTP id z10-20020a056000110a00b002cea93d41a7mr6815343wrw.40.1679055083583;
        Fri, 17 Mar 2023 05:11:23 -0700 (PDT)
X-Received: by 2002:a05:6000:110a:b0:2ce:a93d:41a7 with SMTP id z10-20020a056000110a00b002cea93d41a7mr6815266wrw.40.1679055083247;
        Fri, 17 Mar 2023 05:11:23 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d4344000000b002c5526234d2sm1861459wrr.8.2023.03.17.05.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:11:22 -0700 (PDT)
Message-ID: <5f003318-c22d-b13b-3976-94b0f874c720@redhat.com>
Date: Fri, 17 Mar 2023 13:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/32] include/qemu: add documentation for memory
 callbacks
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
 Vijai Kumar K <vijai@behindbytes.com>,
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
 Peter Xu <peterx@redhat.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BKY8OC/HaPL6

On 15/03/2023 18.43, Alex Bennée wrote:
> Some API documentation was missed, rectify that.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1497
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/qemu-plugin.h | 47 ++++++++++++++++++++++++++++++++++----
>   1 file changed, 43 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp584835ejb;
        Fri, 17 Mar 2023 00:24:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set+aho+d1OOanS/Bll4tSgrXS6A+D85SkJl/YUyS/36hGlbeE8eC3Fszb6hYkpg1jkFED1/5
X-Received: by 2002:ac8:5f53:0:b0:3bf:da97:87dd with SMTP id y19-20020ac85f53000000b003bfda9787ddmr11772829qta.38.1679037879426;
        Fri, 17 Mar 2023 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679037879; cv=none;
        d=google.com; s=arc-20160816;
        b=emXrKxQvkt2jj5GEUHbZwFZCS6osLDhkoC+LfewUE4zj4qii2BUmDmhZwaFqtfejxh
         EExT8AkaWOQ5DzWaiRe3lN+XdC75UardFZRZWLQUUqMdaUt/QsoZwO2OEUKCD19qS4Op
         BToZhkpemsYjRnKNFzlIXl96oSc2QfuZk1kmMl8AuMYfQNaV4XRbKSi39AvkVmWawdET
         v/va9tny3BhvbEkyyR4yW6/CmZKUC5mwsExShcmOdS0fz2mjndcVBNP8uNQzqx8Hqtpk
         7UY40VJgjENuXUa7bLaySCRX5m6oZnqd9fXKBVcgfFpHicH/A05C2P+WzqLO+RRP5nJW
         IgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
        b=pmEwAYpVpf0U+Ag524pTLHmNHfi9kiOoeMTlUE0b5FAlh79FSCLNep34F1jdbiDkc+
         jXezowPjI/Si1qc7b1hGlCv+NqSM3B2F1GEakawPkb2fnILTt49IX57eR54udfmJdH1k
         9smIFjSmoO4tup1PRbl5m7c2eZpbTgJFJWhYJxu/sjj9DN7BIA4MxCpHxcnn2ZdC5QDS
         LRdyLCF15YNYHoTs6fNM9BPj3AjdgvPoDf+w+JTaX5Gxmn90bFF7LZO+4pHT9aLQLHby
         aGetZc2nwk40HaD1/m2JEFNBygrctc15ZfiNH5HPh3PcW+VbR9jVSVBkvmRq7DXY87C9
         SbOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gwcMA/IU";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 15-20020a370c0f000000b007459b3cb681si1110858qkm.98.2023.03.17.00.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gwcMA/IU";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679037879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
	b=gwcMA/IUdv51HkstsR1bt7ANKx8zXjulE/i4IIPuhB20Yk4+lPmXzjBzo4ewkmsodyip1a
	oRwKJo3RozYTXsUHuNZjTdQ9TzhvSSPtssUpU0OmDmiM+y/FJFc/tZAGRwaWXfPrx0wH/W
	i4I00SRZtC3jGaGFptrg6AkxWRE/TxU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-UVHJgaWYOTaDuBhihruZKQ-1; Fri, 17 Mar 2023 03:24:35 -0400
X-MC-Unique: UVHJgaWYOTaDuBhihruZKQ-1
Received: by mail-wm1-f69.google.com with SMTP id j36-20020a05600c1c2400b003ed245a452fso1885778wms.3
        for <alex.bennee@linaro.org>; Fri, 17 Mar 2023 00:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
        b=0Ki4iosQo/Cwo40Aua4lfaGdhpyRCcYbdcaLSQnf43Q2rOBac92XvLfTxufNoHYylS
         4Q6OBSh/w7TW8uqox8rlBIhiGRVt7/WZ7mMWdsNCJW9vKxdWq4NdSawulOahcXW89smU
         nlX/verebffMb1c4CnqMKortHIG7v+i7VYD9EBMIY/nARgTU7cUMoHT2If63pm8y1AH8
         F7mByMj5/qM+i2ffBBmuiPiapGQlts6zYrb1JLw36QiX6nIlo5KN8/BVY3IT1zN3MdCk
         i27kKrvBET8L6yv8U0wF7H1+8F/fmi4Fgvaj5rz166EdaCODg4BtCwKvkHzuVzwFrMSn
         j3eA==
X-Gm-Message-State: AO0yUKUqzzJQJ4T6OexLCUIoVxvziri20jTTYjIdGvTwLSL52T7TXsgE
	JX1Uhy71mfGtciZu4o+qjVcMGZbSVwfJrFTMfXrLbWAM2fuExCGUf9YxCgzht1CU2luVc2Yb6wW
	KI8J8cRy/44sRK5BQ+RaJyYcaXqfjhUGSl+SRe1kuSTcTdjcaspnNgMl/aSt8BltnHDghUQVpDZ
	s=
X-Received: by 2002:a5d:4d06:0:b0:2c7:daa:1c56 with SMTP id z6-20020a5d4d06000000b002c70daa1c56mr5851993wrt.4.1679037874844;
        Fri, 17 Mar 2023 00:24:34 -0700 (PDT)
X-Received: by 2002:a5d:4d06:0:b0:2c7:daa:1c56 with SMTP id z6-20020a5d4d06000000b002c70daa1c56mr5851904wrt.4.1679037874240;
        Fri, 17 Mar 2023 00:24:34 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id y1-20020a5d4ac1000000b002ceaeb24c0asm1262440wrs.58.2023.03.17.00.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 00:24:32 -0700 (PDT)
Message-ID: <95ef3696-f934-376e-ee88-687477a32242@redhat.com>
Date: Fri, 17 Mar 2023 08:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 05/32] gitlab: update centos-8-stream job
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
 Peter Xu <peterx@redhat.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WTmwCOR9XIEr

On 15/03/2023 18.43, Alex Bennée wrote:
> A couple of clean-ups here:
> 
>    - inherit from the custom runners job for artefacts

I know, it's a difference between BE and AE, but in case you want to be 
consistent with the yml: s/artefacts/artifacts/

>    - call check-avocado directly
>    - add some comments to the top about setup
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/centos-stream-8-x86_64.yml  | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

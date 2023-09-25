Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp502693ejc;
        Mon, 25 Sep 2023 09:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu/bm5fN348+fHT/AOuS7WP0sn6UZ8arYbDK/Qqfm+3EoZEPASxLvrtYDL8R/WZsk+e6JH
X-Received: by 2002:a17:906:3402:b0:9ad:8a29:f26a with SMTP id c2-20020a170906340200b009ad8a29f26amr6729186ejb.63.1695658492699;
        Mon, 25 Sep 2023 09:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695658492; cv=none;
        d=google.com; s=arc-20160816;
        b=KaOoqDrTZCRYH+rQ12P0ED+Brpk0qI5r7zCY4wgoBhCQGYMerwxAD7FPtNzs/JmVmx
         5TTDtX2WV23mGZ17HxnAd8Pa0yTr4AibNvf1p3nA1Za7nZB9TJkrGrpD/lquFSXISpIn
         40yhjna+XDmdOxv/jbv0uttSdafT/+GgjP755ifr5ATVNFEHs3YBT2ewqOFVw4VX2QtG
         KJaUOYSK/nh8UIP5r27uhsMxUVmD1SKTFGOde54ydyUxxKxDjfKO27+YTidzzqW9tylR
         Cnotm0KTd2foutw37SLYHBo4pBo84KLYF3EiFrYXK2r3Y9WWMNSuqOznKjgETf86NZdO
         VywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=d7TYpatd+73WcDke8sP8ZGJUjuyshMuCmv8QF2XliGQ=;
        fh=K4NqYNBzOTwwaAVLxUfLHV9qOVKTnvFqUM9paB3EKFA=;
        b=smc1AhF+tVNS70zSYhbJpBGfiusoS+EPg6BCzeZ3Of5aB1s99Df22unjT5VZpL3tlJ
         kR9Wqg61f1ukKxEADILKa/naMP0A0HU8uTQkPbaKGe4Pk+h6rdKHccOmfXe4cA1/dnEH
         ZYuLleXu5YAgwmZ02i6jqsX0MBmflHy0vMgI7HAWv+lj6iAwNp2rSOQ7T0APa4GbFL4H
         9HOlKHbTgX+Kj6Me5L9kxQatEujGcuOhrSwbMy3ecENYO9GdwjDidNKiTY9SYOZD2deH
         dITNpKdxGMtcPjdbzH0nz3FR4fJ8Kh/5zXwe9NO5j444K6DFoMxdC1TjDlKpkAkPYEjB
         3JsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AwliDv7V;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o21-20020a170906601500b009b29427b3desi713581ejj.739.2023.09.25.09.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AwliDv7V;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695658491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7TYpatd+73WcDke8sP8ZGJUjuyshMuCmv8QF2XliGQ=;
	b=AwliDv7VVtcjn/FSSz8O0N+320STpqi21YyANEHRoZkjFuoKpPY9Iw7x6IElImTisggOqQ
	yJjGKFEUsUdXtcbeLW1wvtQfP1kPz52PHKYnN5+SLs3n1UOIliK+4ZTnrv9DgiWtRhbAli
	VL1HiHuLcdbhW3AVuGMU8aXSzVW6Xbs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-p93vY9o7MZi4Zzzup8154g-1; Mon, 25 Sep 2023 12:14:49 -0400
X-MC-Unique: p93vY9o7MZi4Zzzup8154g-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40590e6bd67so22451015e9.2
        for <alex.bennee@linaro.org>; Mon, 25 Sep 2023 09:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695658487; x=1696263287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7TYpatd+73WcDke8sP8ZGJUjuyshMuCmv8QF2XliGQ=;
        b=DX4cBelza+xsR2MBndv6kEsrAq3Y3AZwqx5MnhLfkg+fuaHjtfOCwNgOE9KRLjWtG0
         WqF1Wt07MQpzMJypz/qlcA7yT0Ybpg5Ad6bwyvq+kJxRwDn4M+f/fWdbTp0me50/uVjm
         +hmi/KammoHxGdm2nfjFttoKVU+eY+pALEiHQoFS7EuHTWXNaXs0KpzuDkFw3eRQW5jO
         bXgJC8jhOHMs5ycu8sOWeButN4Z7CGUfWZGXGosxIPi6rANYAo25RjFGsnD8bE+kiHp7
         /Vb/XzHP6aYXfnoaGWF2mvNL44idRy0O1eNHOGHjm1Ya1D/CuOjvKaNSsxxOSg2nHXwQ
         emIQ==
X-Gm-Message-State: AOJu0Yzf7MQSENgCdUSMcw9sDveBZ5YtpZyyDiuWpxCyQc8uaC/HaVOK
	vR5Hq/zcO/Xd2Ix/ysMfA4FBUB00u+5OIQS93xEa2ljg9QdHHXEUDjQUBIoZNFx/1iAZaUE/gUl
	uFJTOHD990zeZxQOwIknpH57pDNsfEX2q7wpRJgixalOG+bH5NDok2caCGDPlMNJlzyKAmte3Mr
	fL
X-Received: by 2002:a5d:4c85:0:b0:321:4d1d:26f with SMTP id z5-20020a5d4c85000000b003214d1d026fmr7075189wrs.29.1695658487358;
        Mon, 25 Sep 2023 09:14:47 -0700 (PDT)
X-Received: by 2002:a5d:4c85:0:b0:321:4d1d:26f with SMTP id z5-20020a5d4c85000000b003214d1d026fmr7075125wrs.29.1695658486825;
        Mon, 25 Sep 2023 09:14:46 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id j2-20020a5d4642000000b00317e77106dbsm12251727wrs.48.2023.09.25.09.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 09:14:46 -0700 (PDT)
Message-ID: <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
Date: Mon, 25 Sep 2023 18:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile
 setup
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230925144854.1872513-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iC8FgxsUaleE

On 9/25/23 16:48, Alex Bennée wrote:
> If we update configure we should make sure we regenerate all the
> compiler details. We should also ensure those details are upto date
> before building the TCG tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index e83872571d..a95e0f5767 100755
> --- a/configure
> +++ b/configure
> @@ -1788,6 +1788,8 @@ for target in $target_list; do
>             echo "HOST_GDB_SUPPORTS_ARCH=y" >> "$config_target_mak"
>         fi
>   
> +      echo "$config_target_mak: configure" >> Makefile.prereqs

This in practice is not adding anything; if "configure" changes then 
Makefile's dependency on config-host.mak will trigger a configure rerun 
anyway.

If you want to add it, you should also add it for other config-*.mak 
files.  However, I'd remove this line and just change

-# 1. ensure config-host.mak is up-to-date
+# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
+# files for subdirectories will be updated as well.

in the Makefile.

Paolo

Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3882344ejb;
        Tue, 21 Feb 2023 19:53:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+wj2zg0Yvs+8w60vQcn9txATuvt1ejg/33egzNjTYZ5FZOShaAJIuBXfbMX8wMomIriAt+
X-Received: by 2002:ac8:5c8a:0:b0:3b9:ec33:eabb with SMTP id r10-20020ac85c8a000000b003b9ec33eabbmr10703127qta.19.1677038034097;
        Tue, 21 Feb 2023 19:53:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677038034; cv=none;
        d=google.com; s=arc-20160816;
        b=rsIUTIApoH1eKyavXt01TW9GpbHiKmTtrwpCBIBBKrFsNoQTuMUhLiSojYJYQB9RlI
         nuDD7Dzp1PHj7gRsr5yaeHcgsMOJs9Q2oojpJ5bMqhK7YqySctKQezwHUDZaHW4EGVNk
         Etx9ODxjg8qj4xCzHktqsCfAch9vLXehO9sgVk3xjYvrH4nWE2k/PvjWqU3VB2DGQLo2
         goCbBXDJ5FbM1MBgW5LqE0I1DOnydHJD015ikyGWR+pq+OVyIuLGL6mENY1Je+GHTV9+
         Qyqft5Gmgj9sHN7Ex6TMeCGmkCa+4gaoJ+w5FyR55gBxeBE4+szNHiICtwEAwf+lkDT+
         PQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yjUkYCUVqaMmDhb6xO88XGQ8LsJPU2Yg/Fk3P6KsjkA=;
        b=pdbpgB/mKQYmj3/5QEf9cGDIYhwEjQDUKUFfBGGHojog5IIzJ7FTUeoeF92BbSjHTY
         dL9MomBfRsv4xDyI2hgSAsZGddhGMkvTkgjz0+AeViCCFhZ8ar4UBtwQZe9kvuqk3cxa
         uLNIySUegSIXTEf86LGvX5VuCvL325ClnvQ8m1KiUGquBIntGt2gBS2gVIZOeBtdB7kv
         LhvUOJhPR5/Iv7Aa+Kk2Kft6pHdas+AHeBSDSuDgS4bGrk6jQm/WwRTOGAUG81Sc6vUZ
         cH0qVWn4J4qGZUqjT4wjq9WYxNbwWPyHlzIKfyp24dVdLwcy6fmJAZZTv6FLzKcIfkU3
         DZAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+z24Yf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ac87d07000000b003b9b48eba27si13912804qtb.103.2023.02.21.19.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 19:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+z24Yf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUgC9-0000pf-DU; Tue, 21 Feb 2023 22:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUgC7-0000p8-R7
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 22:53:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUgC5-0006nR-M7
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 22:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjUkYCUVqaMmDhb6xO88XGQ8LsJPU2Yg/Fk3P6KsjkA=;
 b=X+z24Yf2hmAuAlAg75RYitsv091crB+tdS9M/Kbq1+A/oiPVcfRcg49py0FssAc2Rwdw4V
 RK/PBJxdA0EIg8yzMHLky3P0zjYpBaa1G3FowIa1TPb7wzk4w1bH7w1/d8Zy5sexR9GVju
 PqpU/2XFqN5/ZqgVYD52qfK4xAC1+EM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-7KKUtLOrMXeVJ9C65sF0Pg-1; Tue, 21 Feb 2023 22:53:23 -0500
X-MC-Unique: 7KKUtLOrMXeVJ9C65sF0Pg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so1637402wms.0
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 19:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yjUkYCUVqaMmDhb6xO88XGQ8LsJPU2Yg/Fk3P6KsjkA=;
 b=zwcHIR/UAu3RWFTKLkKH4vL7pQQhcsvmMBFaoqOHXc/YtVf00moB5euECuz/OEbU1c
 Hq/ZodalHk20zuoANmPZ5YBOOdkLIZgqx5EIbagY2dWFNfuPJrZFXaNf0eOP1LYeSsP+
 Xn6SZK8q7CCr4lDelI24CxhNEFOIAViOWNGQixaZ3Wiysgx09SMEDTUN3s3subPcSJp3
 6esX/AG5hpLA7VhhQf9zwoA62HCfIQiNF4n+z7N8MRTahG8jHCn8pS//rb2OkKguAH+5
 QwUsyl/Tnkji+6MTo/bGaJwIX+LoruCtBKWODfROWldDoh7RT3nVPtztyoBrp1LC/1wE
 7EJA==
X-Gm-Message-State: AO0yUKUreDmRSiW/JpWkVrWuet7kXX5/1cRdfG61H8vABi5/cWPO893E
 5EV7JVOYx2W4ePyibvSgeLA/QnPSuarv7OArcmMLuS1LlOJ5gHFjVnj5mp4VEKIbuzmVRdGR+Mf
 Njb++hyJIxWnS
X-Received: by 2002:a05:600c:340a:b0:3e7:5142:cf17 with SMTP id
 y10-20020a05600c340a00b003e75142cf17mr3654522wmp.18.1677038002583; 
 Tue, 21 Feb 2023 19:53:22 -0800 (PST)
X-Received: by 2002:a05:600c:340a:b0:3e7:5142:cf17 with SMTP id
 y10-20020a05600c340a00b003e75142cf17mr3654504wmp.18.1677038002180; 
 Tue, 21 Feb 2023 19:53:22 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003dc4a47605fsm6492126wmi.8.2023.02.21.19.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 19:53:21 -0800 (PST)
Message-ID: <2352caa0-ae10-1807-d055-6bd7757113e8@redhat.com>
Date: Wed, 22 Feb 2023 04:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/5] scripts/checkpatch.pl: Do not allow assert(0)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221232520.14480-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6FIEV39X6cQt

On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
> Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
> in supported builds") we can not build QEMU with NDEBUG (or
> G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.
> 
> However some static analyzers / compilers doesn't notice NDEBUG
> can't be defined and emit warnings if code is used after an
> 'assert(0)' call. See for example commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized").

commit c0a6665c3c only uses g_assert_not_reached(), so that looks like a bad 
example for your asset(0) case?

  Thomas


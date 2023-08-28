Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp2791288ejc;
        Sun, 27 Aug 2023 22:53:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBrl+ktzaD71TLRaAyaE7SJhLQi9v/dJFO5g3Xbj85ZLndhgxu/4mL6Q1SNoU0ymGxBJsU
X-Received: by 2002:a05:622a:18a:b0:410:9bf7:f51c with SMTP id s10-20020a05622a018a00b004109bf7f51cmr24574831qtw.49.1693202006609;
        Sun, 27 Aug 2023 22:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693202006; cv=none;
        d=google.com; s=arc-20160816;
        b=a/yIunDNOVFuAsGsVv5nr6Tphs99FkxzD6EclrRfqi5H7mtlAIXtH+2mIcBXwlIEdX
         +LqLysnGqD0PYC/iU+LbwICZoQh2ynMsdKXXwCu5grYbBWBvdEs3w5vxk3BYOrwluose
         PS9wa5vkqfviZKwsmuzMM6iU0V/Fj9jJ4qVs7fqdF5cUg6dlVzLM4JquYzVviIyMYjI5
         Ned3LB4m3eS8HRfdLOMKA/IyyUjirc7B3TIckaVu7kZAqE2qA1RTutABOfMDT277UshV
         gwkMFDdhWe1EkAxhiXOMLy0O+gR/GcqnxdABEapy/sNFJik3ZrhirT0WP9giGOXEDwgc
         B3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wwtUsOUVBZeWYQBTl04B2bpXYlQCvc5VNPgH/+En7fg=;
        fh=IMDJiWjKw/NXyQcApkVEEe4t38zkTbW/kp1lqzNWEkM=;
        b=Tnm/mSd5LflyT9HB6y2pZpVhZqI5bBn0X6BvQrh2UfprU95l3a8qH6KktZCzd+RVgd
         ZWvvhWXGoUv1vHY4H/DlH0maAOs/fVTRczPL1RlwyQq0FeKsNAKD/USgfCicew2iobBV
         1rYrb+DlMge/WkfYFSjpY/DqxedtR+JKON+8fnbRuY6KnaIJCQUmg7FX8qrNq2Nu14Cm
         SsG2GiEBj5QMba6MHsmf0Ql+xnAlAr7QbajRyr9V50ldKAeNTiuUtoFQCoXHzeu3S+BT
         HR1I3obRFONOrMnmc0552/ACubaNxcpNI1vfqjcprdqTMnxM9sHhEfNmEnShb8NBviUF
         gM0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Exu463q1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020ac87d45000000b00410a4cb9039si2081272qtb.157.2023.08.27.22.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Aug 2023 22:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Exu463q1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaVBR-0005u8-T7; Mon, 28 Aug 2023 01:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qaVBQ-0005tr-5U
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 01:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qaVBN-0002yp-J3
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 01:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693201954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwtUsOUVBZeWYQBTl04B2bpXYlQCvc5VNPgH/+En7fg=;
 b=Exu463q1XtaivRLCi6AA9QpQ2391Ffay/W3uBduns1OsBtRyA8DO2OL6l0ee9K8pDYH2ZJ
 3EpOIHyrrlE4dk4kpFRYm5qIsd3EJdejrNqdTJBkKEI9jJ+/OFzhuGGMsPFS7nLBsqfkEf
 sHZj6fk85GGJbKv7AQfIXbCnxJY7slA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-fUn6M_07PZqsLAjx8XcHqg-1; Mon, 28 Aug 2023 01:52:33 -0400
X-MC-Unique: fUn6M_07PZqsLAjx8XcHqg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94a355c9028so210389766b.3
 for <qemu-arm@nongnu.org>; Sun, 27 Aug 2023 22:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693201952; x=1693806752;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wwtUsOUVBZeWYQBTl04B2bpXYlQCvc5VNPgH/+En7fg=;
 b=d+Iy9nW+7ee/qvs3F014ReDzaaKRxYnM/b74mv8wQgGa/LzGqwvSlvqVybeGJ3iTpy
 SuNLYFk0yzpJy8/Nk7rIUnfqlKfWfXK4/n877g26K7BFHuwmx6Jp5M81tRUpzer/BCv/
 KkTduq63BMMO9fWe7AvK9SXOLKvmTgMtHy5LZCOM/heBDmpiw+fpr/Fx++19xdLXWnUl
 TZJtc0y+Qd/36Xhmxv9Om1qemDdDiuNGENQdEunzVkOGHiQBaiJ9+eqE9nWoRjnS5jFZ
 m0qjT/6dX9AH1V+hNlcytPykIgy3SCW21mzAJwP3nTIT5YY48ELDl0EGnuP8OCxNEIbd
 8DxQ==
X-Gm-Message-State: AOJu0YxFHMgxuvyKGwHH5lt2jRxnXZg9+oJlKosG2Z0gvNS28uRfmJ3Y
 MdHtL6PnA05i5jIuCnNzGH7w5d2UvTqj18DOr8/y173P/PMFeRMm1bJgtRD0vt9vOTpyamUJvC8
 o7Tfx5TV4vIsz
X-Received: by 2002:a17:906:748c:b0:9a1:ffec:aadd with SMTP id
 e12-20020a170906748c00b009a1ffecaaddmr7019782ejl.56.1693201951989; 
 Sun, 27 Aug 2023 22:52:31 -0700 (PDT)
X-Received: by 2002:a17:906:748c:b0:9a1:ffec:aadd with SMTP id
 e12-20020a170906748c00b009a1ffecaaddmr7019763ejl.56.1693201951674; 
 Sun, 27 Aug 2023 22:52:31 -0700 (PDT)
Received: from [192.168.8.103] (tmo-098-91.customers.d1-online.com.
 [80.187.98.91]) by smtp.gmail.com with ESMTPSA id
 e8-20020a170906044800b009a57d30df89sm3918282eja.132.2023.08.27.22.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Aug 2023 22:52:31 -0700 (PDT)
Message-ID: <6d153709-8099-7737-8fbd-3988a35af71a@redhat.com>
Date: Mon, 28 Aug 2023 07:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 2/7] hw/fsi: Introduce IBM's scratchpad
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Cc: qemu-arm@nongnu.org
References: <20230825203046.3692467-1-ninad@linux.ibm.com>
 <20230825203046.3692467-3-ninad@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230825203046.3692467-3-ninad@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.414, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PsS4MPnVIklg

On 25/08/2023 22.30, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The LBUS device is embeded inside the scratchpad. The scratchpad
> provides a non-functional registers. There is a 1-1 relation between
> scratchpad and LBUS devices. Each LBUS device has 1K memory mapped in
> the LBUS.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   hw/fsi/Kconfig                     |   4 ++
>   hw/fsi/engine-scratchpad.c         | 100 +++++++++++++++++++++++++++++
>   hw/fsi/meson.build                 |   1 +
>   include/hw/fsi/engine-scratchpad.h |  32 +++++++++
>   4 files changed, 137 insertions(+)
>   create mode 100644 hw/fsi/engine-scratchpad.c
>   create mode 100644 include/hw/fsi/engine-scratchpad.h
> 
> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
> index 687449e14e..2a9c49f2c9 100644
> --- a/hw/fsi/Kconfig
> +++ b/hw/fsi/Kconfig
> @@ -1,2 +1,6 @@
> +config SCRATCHPAD
> +    bool
> +    select LBUS
> +
>   config LBUS
>       bool

The config names sound pretty generic ... could you maybe name them 
FSI_SCRATCHPAD and FSI_LBUS instead?

  Thomas



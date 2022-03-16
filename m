Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3521012lfo;
        Wed, 16 Mar 2022 03:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMfTUDT3HqFgLVLqOmAZ0CSU9YzSC/UOQRGaXckb3B2bYQE5skASuXN7SKtyXGoCpE0kVr
X-Received: by 2002:a05:6402:3592:b0:418:6d45:2008 with SMTP id y18-20020a056402359200b004186d452008mr17146243edc.131.1647426544923;
        Wed, 16 Mar 2022 03:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647426544; cv=none;
        d=google.com; s=arc-20160816;
        b=jPKHnsSFdvEBW3rJEHdx6CPrPv7nKc5fqlKjsIw+MSkzbaTUp7RShPxOdlfu2jUMmd
         fQ5b0k+oFHP6GxHOLbfjcQ/xxDjWgnYUEwHW3CRCO2mduEKa+7FhFILtohrXG4B07RRu
         OAy9rvo5c6FWgab/bTL33GqYBjOOPjzF3tYnchVrYGERwNLHmHIXyCoHY80W0IqnLKRp
         MJxjEJlH+HVpys4yr9P2wjzYRi+Uf/R2xJADQtwfjyZh7M4mfmnaDCjAa5RwsE8REcRV
         vxNWO1p+asbFRFHwaClP+ND7DWRPBmeMTPUGTxzNGV3GEARvFsNFjAr7rblivD0DNneA
         eLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
        b=Hhd/W63Dtx+ImXiK1arExcP6XzOSVwKWjCbT/10vVWaQqXufIpbgSkgtj2Q+WMVm39
         KSoxsJt00uJjnv68JAFynRr36M2FwTF40NB5L54oZtj+3VtXIuBAhvD+D+totolaTC37
         iNh88LiVNSmvKRlVBxEn6GfqWKLtIuDu7XR/aAZijiRtRES19ynjVqUaJbkM9IsDqVBH
         q/atbk8e1Dxb8Qzb2EDE/felSjAoMUgg+8IGp1lvU4cvz5hVNHO05czHWm9e2bMEzoZ/
         01n4tgWDGFFk2hPQ/k+nb+GqHxr7vWBx+vcOxSS3616MiT7o9smIaKaLi/9Ijjd5ejvC
         PdTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJV3EFp0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r1-20020a1709061ba100b006d07f388e25si882841ejg.908.2022.03.16.03.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Mar 2022 03:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AJV3EFp0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647426543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
	b=AJV3EFp0R9uHiCpDKv+uEm52VgGWUcT29na+MvWenRxx3NE/pAawCFW82fDJnhYoSrBatx
	n0XZ5Nq6CQvvSWxRJ/tFoo/VDWQUjoXuZayUPynYXCNZUA4TITR9lBv5ZjmFl9BJiNDDup
	DEbqz9hor5iTxcxxfZwhNnCwvkn5RYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-AL1MfU_7ObasFYgr49WOiQ-1; Wed, 16 Mar 2022 06:29:02 -0400
X-MC-Unique: AL1MfU_7ObasFYgr49WOiQ-1
Received: by mail-wr1-f69.google.com with SMTP id z1-20020adfec81000000b001f1f7e7ec99so398460wrn.17
        for <alex.bennee@linaro.org>; Wed, 16 Mar 2022 03:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
        b=PyC3RgarL/c0iwtsF+ZQUNmHdrPultPQkLnaWoVuy58JeUfh25SVfFBFLpKwRFAt5h
         DoKoq07ZRXwbIde6D5KbOMi7QF8HkPEbjRKRhTF2RvOaQGq0Bun3WQ5aorHGu9XURrem
         nO1BIOD9TnfL3UaVUtku8nneUCSeGDdqJf1LE8Qq3d3o48EbNPZAWCoyChHdNL+Kf1jl
         vSXHQahDaKCi1yGJHUzCHkvOOeJxKMItDMiqq+7ZffIlnyIf0tGJ21GMbCtES2eoCVZb
         JzNSAEjD8fP3xtnctEO8z9qvwSkAxASyUxAZSCcjxw2ifUifhIdvuqPSEnHxATjTitxY
         zPfQ==
X-Gm-Message-State: AOAM532qcrhgKMPderJqyrYTYyGxANdKsNUongHKuP1UtQy+4E042DEx
	c/1FklittQ11q5jGAR2sCWulfBzyLQmC/O8YA20QWlEdTkp1Jdfq/gUSbO6LRrIv8gmhL3LlAHR
	EGwaamvUV0eijH4GD
X-Received: by 2002:adf:efc6:0:b0:1f1:e397:44b with SMTP id i6-20020adfefc6000000b001f1e397044bmr23848625wrp.298.1647426541636;
        Wed, 16 Mar 2022 03:29:01 -0700 (PDT)
X-Received: by 2002:adf:efc6:0:b0:1f1:e397:44b with SMTP id i6-20020adfefc6000000b001f1e397044bmr23848591wrp.298.1647426541370;
        Wed, 16 Mar 2022 03:29:01 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d5988000000b00203d5f1f3e4sm1366873wri.105.2022.03.16.03.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 03:29:00 -0700 (PDT)
Message-ID: <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com>
Date: Wed, 16 Mar 2022 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JWKo5EEAnvTn

On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
[...]
> @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>    * a compile-time constant if you pass in a constant.  So this can be
>    * used to initialize static variables.
>    */
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>   # define const_le32(_x)                          \
>       ((((_x) & 0x000000ffU) << 24) |              \
>        (((_x) & 0x0000ff00U) <<  8) |              \
> @@ -211,7 +211,7 @@ typedef union {
>   
>   typedef union {
>       float64 d;
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>       struct {
>           uint32_t upper;
>           uint32_t lower;
> @@ -235,7 +235,7 @@ typedef union {
>   
>   typedef union {
>       float128 q;
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>       struct {
>           uint32_t upmost;
>           uint32_t upper;
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 0a5e67fb970e..7fdd88adb368 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -7,6 +7,8 @@
>   #ifndef COMPILER_H
>   #define COMPILER_H
>   
> +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)

Why don't you do it this way instead:

#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#define HOST_WORDS_BIGENDIAN 1
#endif

... that way you could avoid the churn in all the other files?

  Thomas

Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48066nji;
        Tue, 10 Sep 2024 23:12:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWES6Z4rTOsmDev+M+LfFJuP/EycgCHj1f9WQj+5Nrq1phx3Shzc5MmJ37E5FuTjoPT7R394YO2Cf3/1Q==@linaro.org
X-Received: by 2002:a17:907:1c20:b0:a8b:2604:1da3 with SMTP id a640c23a62f3a-a8ffab18797mr316931666b.17.1726035136052;
        Tue, 10 Sep 2024 23:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035136; cv=none;
        d=google.com; s=arc-20160816;
        b=BG9F17iPhDVjg5dMcLxnjE2EAusPfWsEVjt3olSAiTjFAzwA5QefirnafihxDRjuAi
         uCh1Yp2vEQemoEeErh+gmLd5aeCoQr8QyCjrcctpwuwm8V90/B/VnpgW2WvxikcDHHjc
         ImtTEWTLFbNKUvf57QYL/rQ2JXkpI1S7CNXWWzQ2urdEzWbtGwN/INFbqh1iLPlHKw31
         0N0mb5yvVwkqLQWCS51Bh4Byo0xBAr3QVMpx8RfU8hTJkNZjrNKdGUhrYX5nzqEwhj1J
         aHKAtLwwraFUGPiwlwRw0zVr0A3E5vpBaFZIsdU8R3UXc5HK2uWx9HPoi+9m78rkXwoM
         eKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BkkcEu3n5L9MgsVNa4TxrfrxWX5AiHsFze3voBImFgc=;
        fh=f4ZirxmwmPakamPQwhiTNi7vB4UWApqnTIfWAwKt2c4=;
        b=DpVoxmgAZTFl0SqUHpvgVVUeMQfP5l6QgsJXhvdPkt4ruFti8UzxQG0YitSs+HB0OU
         O25Vqmb0E2m+pn1pAId1CFYbdKldmGVp6WwUsGZeYyaG+9ANcUgUIAmDsQmxUy0PetbE
         yEHSBtQ8D00VUmGJIkVu+tRaSMplnBpYCMpkAU65zF4NTe+43RaQPIxir3AWqdqaDoCz
         LBworIpjO8B90GS+4uUmaM7ntAqC/cpwINVYHwRicaIuR6pwOBQBkJB2fd1cyhBT6ckY
         LRceUDn+PKsS6xZ/gG62zNYOest/vhdaa4Nk2uaqfsRdQaY+kmxpOo8B4I281BUiHRf6
         fWVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQJ7f3Mq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25835a41sor339042866b.2.2024.09.10.23.12.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rQJ7f3Mq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035135; x=1726639935; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BkkcEu3n5L9MgsVNa4TxrfrxWX5AiHsFze3voBImFgc=;
        b=rQJ7f3MqjQvdZNhaTTTlOFVh2947nilCbRcy1G90ikyXQfklH+NWS+DNNpT1kTKkBq
         RupNL2Ge6ZmXuoppG1fT238wzjOihErXTwbA8I+TBoNUwv4MJ1QLcy5zYUdkWexmmjve
         qDHtpjShEYiXLrdqIHX45QIWxZQ4rKeQbR4sMm9/ArbYKlMhvkYDEIbgqcs1FHQe8K7x
         uMJ5FJax1Rp0NUPVSXMJ58Lg8b5JK8GVk/nxn5J/RsMn8T13UIgl8XJiz9MZf3m3kM4+
         p/DZZfnfiguPbimfUpLqP65u9m0rOV6/bsWR2l/iVrYWP7uUsU8D3pUm0IYipmV3Pzk+
         CsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035135; x=1726639935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BkkcEu3n5L9MgsVNa4TxrfrxWX5AiHsFze3voBImFgc=;
        b=XmZXqRfnHMn626fGD4VS9+WIIk6vJQrbTPW0DRSycFlaS1jGAcMM3LGMhll0kYwrqF
         rEMUQUmwZ2KJRMvsYQqkry0SP+VhsuyJI/6WUlDAtqJy/oW2KVDuma2SdcIOGk30eaNj
         OVfT+qCpQw1aGjcnGankcDplEkJbMJYlk3FZ6fmXRRtJFGfbmPTukKHCrfzg1BBkXg/W
         6HZpgPIYg1rPg1ggQuDIqZQpR2T9DLc2DwHawWEgq2Q5GfLOX+hUbUxyxoiIwPEShKjd
         zQ0KkNDA+QDerUhD3S17ha3eUVEAellQnisnWUDgm+/gKsBONH50jaSTmGtA+nR+wBr1
         uKnw==
X-Forwarded-Encrypted: i=1; AJvYcCVlaqS5pIzyp9dmekQng7vM+bhevnWjuY6TblmLpz+XDP/cTGrcK/K0FxiP4Lcuzpd8ZH9+sBJ6r94s/Q==@linaro.org
X-Gm-Message-State: AOJu0YwHa4chygBcVszRNaNd3Ue42/X+THNxihwjwkM8opIUdSgNrooJ
	/9TzsFAxeirE90YEkFZK9odEx0QYk39BW8F/3XJSn/KjFtEsl/Uq33oOWVymK+Qjow==
X-Google-Smtp-Source: AGHT+IFEXCrfWvrxzcO/DkYqqT8ecNuaQdjylbt707JncAPQlkhPq1X3u4Intu8OV587nz4vFB5lzQ==
X-Received: by 2002:a17:907:6088:b0:a8d:1142:1d68 with SMTP id a640c23a62f3a-a8ffaaa54c5mr357151466b.2.1726035135459;
        Tue, 10 Sep 2024 23:12:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835d97sm574179666b.4.2024.09.10.23.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:12:14 -0700 (PDT)
Message-ID: <2f25e433-ffbc-414f-a52a-5af1edf356b4@linaro.org>
Date: Wed, 11 Sep 2024 08:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/39] hw/core: replace assert(0) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kM03H5q6csoE

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/core/numa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

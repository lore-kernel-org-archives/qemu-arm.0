Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp43686nji;
        Tue, 10 Sep 2024 22:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTRJ9VN9U+rGuSjJ7RziN+C7g8gCmI50CWFf+ltiObKzWq62KFckPMU/FgHbuvFAJzPr2q9o5kcVLY4Q==@linaro.org
X-Received: by 2002:a05:6512:1283:b0:533:407f:5cbd with SMTP id 2adb3069b0e04-536587a687amr16019651e87.7.1726033830114;
        Tue, 10 Sep 2024 22:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726033830; cv=none;
        d=google.com; s=arc-20160816;
        b=p9rNVK5k3tC1w4l9piHY06ewzrqOEQPTqhhFfOkfHShrPyCtemAueRj8wcHrBL/ywt
         bEBOJBXji4zfRi9TR+wDZ7pVIcxWXEYWfRv8dji4GNdRaJ28mB04QXr4YHClAULGOJAN
         cZLod478FQO/IKxwllQ/fEwt/j1gxd4FE/Y4bCXys1oKJTamZaFcqwQ3blm8cWcHuIxb
         IluUghpq7J2Q/+/hnFkpiU/PMSVhF8vCFc+5C+tmr9AkO+XmwNXXDyHTJdKLR21sQ+RB
         8od8UMZ5NpUWahU/35QGUDXwQm/S3kf9/fEYt9/Md5sh6HpgLnUaaD4dfn897dFByrHQ
         MljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JRpJ0yC+pw08bpum2VqRCaGzVKgHygWh66dJBO5C4+I=;
        fh=Fd/95wH0ZsCq9IxI2GiVkKQM4VSYpKE98EH4a9Ahyvo=;
        b=Uz4vujT5eT02Se1rcm4YF8ND25k7XAFjFo02zv3PUcbQNNXZMh2l/y/NSusHPTJ0x0
         LGyseXnxXcun4IMI2YN+tUUBcJWpeBFRM0meD3iPQvBTO2guH7j8lDnkle6XK2gffOqp
         nfU/Cc8d+91deRrU9DBdhoSARx7Zp0giMnG1KpX0SyS/PGINpoTsE68RK1I778oXivkU
         pCWZwd9X1O+jE6TPEZdd8xy43En4cBxPYW9KSD+0EqT4gh+HjilwrV4Nb2HbOR/Ygdb1
         Cf4ggyrtSCvMa9ueb4EILE01Ve0eNvg3W50qZwk0aNZQm028658Loydg7yEjE70UK68N
         CuBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EK2bAi0e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25953205sor134660566b.6.2024.09.10.22.50.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 22:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EK2bAi0e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726033829; x=1726638629; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRpJ0yC+pw08bpum2VqRCaGzVKgHygWh66dJBO5C4+I=;
        b=EK2bAi0e+n3GXNxE43kgkwwtUu8vvAwWgtO10eX0m1IQp+IkjWZdqJxQ1FI81hizC4
         rKXEEfeycwW3vXEQogDSvMCe88A3ly6AUd+PbSK7eIUF7x9sI9uKfTToQ3PMEApsXdBG
         dX82LCT3lTK03ldYaFXaM6Zrb2TvzNte1zwt6q170mh/jTxYwo4YoTDnId3bJoP/RK7n
         Pe+lb7VwaspyGIAh/tPkWuFyuGc0wMu40uBtNfV5TojWAOxNZUZPguosJH3xrfenmfUF
         hd/Ta2DxoOY1X1aOhaUiufGcKFUFCi4deSTK0xwjMpCgogvsksDVJUMfF9qR7YtNLpig
         qUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726033829; x=1726638629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRpJ0yC+pw08bpum2VqRCaGzVKgHygWh66dJBO5C4+I=;
        b=AvUNj8Fwt8WBuSmHoBKo2N/nLynwH19BRCIiHa7FIUddbP+PtbYn8kISqw9+bzLMWL
         CU48L9FJ0WrKNB/l9wS/A+ZLPygvygSSwWV+TEwlDLF4PPj6m2cqfNKvL1rw0/BhbEXH
         qQ/guC8aLZw/42yTtZvTwYezK0ELnCJREAv8ebZdHYuoj/BUFNDmHPmCuqgjkDubx0J+
         rS/XLnvelRxdewIN1iM+3O9OAdGf6V6JrbmbBQZthMrqkhs21GJwTAnEtL02n5+qgz4f
         KkGNALIiBtTJDAn/g49c8PRcm0e5UV75ErlWaZ81nDpIqoqx0HPFGhr5jkhb1Iy7Z0Dy
         fL4A==
X-Forwarded-Encrypted: i=1; AJvYcCU2yuhP3w+FtSWCp8JpyBbcsxASLlL5+rR1xx8QO/xS94MGD5Lo74ONetQHxsEy0r4F0VnQ8ZuBc2qH2w==@linaro.org
X-Gm-Message-State: AOJu0YxFBQ+qjC0SQpFHEhuauHYtvc+u+RCykkIgZEv8vPYlK0Y2wZyI
	agEZyKVw1zFfdz5Cb/uzHV1HUk/4Ye6mLECibt5Atm+I7R6mhx5HPqy1viY98b4bAg==
X-Google-Smtp-Source: AGHT+IHtNdz3JGktS1H6wUw6Ej9fupOVxu56YnjbGwav8RYfVLrdhTufWQK43MuqJkz8VsNhlc+DKQ==
X-Received: by 2002:a05:6402:35d5:b0:5c2:70a2:9418 with SMTP id 4fb4d7f45d1cf-5c3dc77adc4mr16028699a12.6.1726033829158;
        Tue, 10 Sep 2024 22:50:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8cc1dsm5033853a12.94.2024.09.10.22.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 22:50:28 -0700 (PDT)
Message-ID: <3a7fc1f2-1468-46a8-9075-7b1bf1bd6149@linaro.org>
Date: Wed, 11 Sep 2024 07:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/39] hw/pci: replace assert(false) with
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
 <20240910221606.1817478-20-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-20-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ZTGmjmVayMHY

Hi Pierrick,

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/pci/pci-stub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
> index f0508682d2b..c6950e21bd4 100644
> --- a/hw/pci/pci-stub.c
> +++ b/hw/pci/pci-stub.c
> @@ -46,13 +46,13 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
>   /* kvm-all wants this */
>   MSIMessage pci_get_msi_message(PCIDevice *dev, int vector)
>   {
> -    g_assert(false);
> +    g_assert_not_reached();
>       return (MSIMessage){};

The tail of this series remove the unreachable 'break' lines.
Why 'return' lines aren't problematic? Is that a GCC TSan bug?

>   }
>   
>   uint16_t pci_requester_id(PCIDevice *dev)
>   {
> -    g_assert(false);
> +    g_assert_not_reached();
>       return 0;
>   }
>   

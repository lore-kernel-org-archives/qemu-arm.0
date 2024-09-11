Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48228nji;
        Tue, 10 Sep 2024 23:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtOobrHDwjQoqitpDDAQqiXOmkPs6SNlUxC330l1f4LN5b1qugOTaHdLwFH0mvLFai5sj9DUPVC8aIrA==@linaro.org
X-Received: by 2002:a17:907:3e1a:b0:a86:95ff:f3a0 with SMTP id a640c23a62f3a-a8ffaa99ac9mr284823166b.3.1726035179252;
        Tue, 10 Sep 2024 23:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035179; cv=none;
        d=google.com; s=arc-20160816;
        b=P0bWwy494HfLcwLj368jbcem2AD9UrFeIIApho/jbcs51QjNF7A36l2VPhooJF6tif
         hez2YE5KsWz8vkdeO2XKCbFZa4tYO4gYx9NAPo3nx8F69/opVjJLe2TWqtcfvXJUmlJ3
         1/OhU2Z9z4WHYC6oFq9UyBZsahABb6h05KD1qP5hJby5bTtvztSEqhZnFm8IZRDWcWc+
         3oK/zTtwRmCPpDTtQ2qPxK1OyEvfrxehUAXlNr6C68MYaLpmBHbYePSNcdMcKX+WoDDR
         ktB7RYFEo2Qxu1PlFM+1np4NyDSfajg0L9RSiowJZA02jGl/i8jOtkQCW77VZOlae5KE
         n1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nV2GkJj+s4ZXYPHgUeV+FAl58LUFuFK7PRMAYADUeA4=;
        fh=abw/vcFVEcpWbjP81Wsy+fEFKJpIlg/TtR5/RmdUgKE=;
        b=qrkrMFiZyjZMBfVUZwp5NCZa9YVRN/9FNxPYpJOuy7L9sxOQncBWlDrYHoIHt3gezu
         eAX1vElmH9S0k2VkZspS020vumEPHVYY4oGlEI9tqp0h3UQ3tTLHIE9FeaP7MT61HZX+
         xfuhuGBkVKa8LQBZRIqTM8KPlbBKGxWCOyEk9zfQ3TvMfvmhlRz5sIMAaQzWgBRAwWeT
         hL3RdOEWSC+34ofD//FeXXdK8FLY0Nbk2ScB5c/AcKEchHS/E7cmQ5p2beXnStbxoMiG
         oQgZhWuI4NIzJkiBF2AFN8dnw6E0yK5rT3VmOcTe37r3hTG2HG3tW2SkJn86LUVJR9YH
         xASw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/qpUkPe";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25963f3asor269396066b.6.2024.09.10.23.12.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/qpUkPe";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035179; x=1726639979; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nV2GkJj+s4ZXYPHgUeV+FAl58LUFuFK7PRMAYADUeA4=;
        b=B/qpUkPeXwiKIv0GmnWiro1i9AIU4JOvSZccwFvIu0nsgDn/QdhssK9J6L1QwxwT1B
         sbxw2rARqoBu/IreDxyOaOocjk/EYDdpVg3jsk+K6SMhBo0gxzT8Ae1oeGEyH/YHZ3qB
         kAFulLgXAfgp2JoISbtUi/1fyIhGLgWwu9XLdaVDM2vDsJ6IW/6PtLGpYB5FNRBd+PCc
         ItJ6W+RHg50QtoegDlmlQpO1IHIxiUKZ4NsRAmKrcygHP/pCqEE8nXxpQIIpzDMtsK2p
         KmON2P3yLzC5J8cnuqBqTs8snwAocDwEsht4Y3Fm4pECW8AlIYwvQ1Wihm8gscesWgtM
         kcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035179; x=1726639979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nV2GkJj+s4ZXYPHgUeV+FAl58LUFuFK7PRMAYADUeA4=;
        b=RJmhgSia6oelxa5JVa0XdMwfC7w9/RHttqftWzyyVaM+DZKMZN46jl2I7gLBN4x/93
         Gh4E8ZBKg6dcFc71+xY8SWiQAXqYEB0JXGc1+XYPiHON1aKAeZb2/eMXMsldwxNQa8CD
         X6ZERlVEIfmuPV86w4MGmmNfEHv3LUe5C6hCpq9XaO3iaX6cyQJNtO75NgvjEv+dOFdi
         zDTX8EKi8AkY44b5rLYG65ZydvHjp+RqQctgs6xva86wf/SPMQs3pwSd+BR3IxyLXbwY
         spbeAkwfIblzZmKi4ddLUpKbE3Hdt+CwgQbpkalHxln5fp3HQYuH5wmbZ+ctPUmOSjcL
         3OLw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUBQNj4zUSS2E0OiYo3ptXkRjBWq0imVY+fo+EB8583uwBqam+Mxp0FH9JozlSJIutwMUxGD6+33/0Q==@linaro.org
X-Gm-Message-State: AOJu0YwsIhPCl54UKQXkBeMTaBCAM/R7BKMH5m5BnCNMP39BNtexn44D
	ps/emmizqsRWHmP3DGbKtfbvcgXBLefy/0QbUuiwdJBMIYhfc67luyQf8IFGeDFaAQ==
X-Google-Smtp-Source: AGHT+IHIzipxfmwSPfZxM97+WFZEwa6R0w7t+9K+6gYUNkqckbpC0ixR15l5B9O3GNoKRhN05fLM+g==
X-Received: by 2002:a17:907:72d0:b0:a8b:5dcf:493e with SMTP id a640c23a62f3a-a8ffae04929mr267865666b.58.1726035178494;
        Tue, 10 Sep 2024 23:12:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cefa24sm581411166b.178.2024.09.10.23.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:12:57 -0700 (PDT)
Message-ID: <2b1b2d3b-7991-464c-abc7-5de5cc330297@linaro.org>
Date: Wed, 11 Sep 2024 08:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/39] hw/gpio: remove break after g_assert_not_reached()
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
 <20240910221606.1817478-28-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-28-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5VOZsHSJDB/2

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/gpio/nrf51_gpio.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

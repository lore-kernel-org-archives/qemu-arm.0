Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48303nji;
        Tue, 10 Sep 2024 23:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDbVEcbgQOyXxIaZeCPpyRfCt9/zTyuB6r4pJPURJxIzQJNT71yG8qTH0bN3EsmFRG+gFdtTiZ6pKk4A==@linaro.org
X-Received: by 2002:a17:907:d859:b0:a86:9644:2a60 with SMTP id a640c23a62f3a-a900479722cmr195153066b.6.1726035203070;
        Tue, 10 Sep 2024 23:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035203; cv=none;
        d=google.com; s=arc-20160816;
        b=Ekre6abLAJtBaWHkGZG/KFo5fwgOCbVynq3ihqTzUAtMxp5HygtiQzan//oPLnMAbr
         c2wCzhZK21uArzbzrSDBSW3jYYL0XtXnrEqVZ5j0xi7su7r03bL/rKHxO0WJfjaXKY23
         UFpTWJb+0q+LVXEmkwLcEbv7x+mABisSZUYdwYddKqW0LmoSCr9DkPb2Xt+Xk9aO/NUv
         j8az3XXd/LCrJ8QNCm+LXuoMzdEfLU/Fv/+BUoLv1ICgGM5XhX/zyrTlKLJaOoaEpPK7
         sg0SvpHj+BaeljJZYsGlAaMRp2xiCnkRNCpFNsko+IQ1EQVqOu+Kjpd4QPAizDPDtP4J
         BUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8m3YdQ1Yw6tNSF6vZvuujJyxwJoqU3tbxgDnqqqX+iU=;
        fh=XX2e1AXSuTM77hOVKuutnXhduAGl0NJwlnfCFdlncFg=;
        b=CvmdbNrvbxw+wx/MDQCGir3ZnN63s46MQdchUtdVHnHlpwbJIrhDhYOonmYbxRfz5v
         Jnw2DbOmjs9DcT/LrZwDrWzinHMsggMiH9NBb2+hS3CTftfrf05iSkYmct8Ql5Gh2qUH
         tEN3on5MSrdX6/5pp41eFBNEy0CYQeu3owC5XPT27YsZkR/B5Aagq5GjMOf7D5+qL5ZB
         GKneur4AvSLfMHhiWK4UFNDhpklyv9bUdnybw5wC3VBNJfr9apFao7mjZgkd2ATB4U1P
         5gslQ1zPOZ5Ifb422ZbgDFgIJsS0dACLlsOjlTb4CkgnyUdOV5liC0ABPLc1OtCkz0Pn
         +G6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0HnRyEd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25c284a1sor294512466b.16.2024.09.10.23.13.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0HnRyEd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035202; x=1726640002; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8m3YdQ1Yw6tNSF6vZvuujJyxwJoqU3tbxgDnqqqX+iU=;
        b=R0HnRyEdKuVCsO2GLPffsRST1lnP0VCuSvgS75+S2rv4d7ZoUf2X1OusG4EhZs3CDA
         4hDfnh6AAbBJ5mg4e1meVLic26egqrF+yiQq5NUqSLEMEmaRQt/u6zETiEFeYsj+0A7f
         EpQv3ANAmHiMOBxcYsrmUzwXQmUFIWT+sv9I4b3uTxkXKe/Op37IIOPx6PEGTwFtFgAT
         CrdOAaAMRnkDFz72PBK0776cs3P7TRwo7JkOxfwrtAFhgPIwU+sJtO1a5BpkPcYdqLcM
         VxB4QPJZXkBiGpJCGdK5gOJRoWiLU4c5nPmksnAYNbiEW3htq7wEDI8XpMs5bQvQzS2G
         juCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035202; x=1726640002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8m3YdQ1Yw6tNSF6vZvuujJyxwJoqU3tbxgDnqqqX+iU=;
        b=Ig8YcBYVqCKeTsMm1gt4j1QMXJEVKlY3xRVgtbpCXT8dTDU4+GrhGxYJAj8o30p3Wv
         ZdPnfZEFM8I9fv3YAZAln7DdA1+ap7ylDFzALQlMVBuNbenewiojHPlu2pkux6ZiN2Hn
         fyDxbOEIjxiBIkt1H4UicIXuScI0pHhvuapHIakMOnL10X3aT+zpSwfj5HpBBAQbyvcI
         7SXPSHsyfzll8XH4GYV4f9YlJ4CRjmf8hBXV6lcG46S/j6DFutjKZ6Orsk9K0rko97Vt
         +8JvtS9ljucB1AyddqP6cHJw4H8efyeXz89JNGl7XeSHF0FIRpQ2LmP3I0coEpLujlH7
         SB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkIT95cEtbTEnvzDAF1atfLjmGcLBm+vSeUM94UN8R7z7tGgqvdMwJnay+DoIBUwWiZOO4qU42BqcjDQ==@linaro.org
X-Gm-Message-State: AOJu0YzByTLzMarI8zpVUetKztjFpnMRxA53d2y5Yj0kvtLuoC8KQAb2
	Rm+wXhK8KASpsq8nXNLBgkfafMLKzAau8qsbG8Wu1tAw/b/CBbRZyGXN2uU+295FFQ==
X-Google-Smtp-Source: AGHT+IE68BWI8McnnoxME1op7FLJ8c1uPq9jO1r69jOWkvX8u1v0gwomWUiv15OUhrOaghKJT6dx7w==
X-Received: by 2002:a17:906:d542:b0:a86:a73e:7ec9 with SMTP id a640c23a62f3a-a9004a66525mr186452366b.46.1726035202098;
        Tue, 10 Sep 2024 23:13:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25979e90sm573426166b.72.2024.09.10.23.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:13:21 -0700 (PDT)
Message-ID: <54442170-9ae0-4ca6-9ea2-fc80f49ece2c@linaro.org>
Date: Wed, 11 Sep 2024 08:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/39] hw/pci-host: remove break after
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
 <20240910221606.1817478-31-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-31-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6guNXOWUhd1j

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/pci-host/gt64120.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

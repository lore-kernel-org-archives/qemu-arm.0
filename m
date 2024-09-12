Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp486170nji;
        Thu, 12 Sep 2024 04:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/S80tRQYPErpzaB8/262mxSUC3rotcY/XrgnDqJhmSEnU7yau1JALhYdOHWCFqbGmg6t4VuAEKmqwVQ==@linaro.org
X-Received: by 2002:a05:600c:35d4:b0:42c:af06:718 with SMTP id 5b1f17b1804b1-42cdb57c0d1mr20146485e9.28.1726142359373;
        Thu, 12 Sep 2024 04:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726142359; cv=none;
        d=google.com; s=arc-20160816;
        b=d7G5zoRn1OOGXuJ//5r+ueaBzZeBi68sBIMla1rvuSgjJCyQRSCpgbK2uqRCJWzlF7
         0zNN+UhXrXp7uk2OPsW4O3F/xHjSBayvpOm/J9ezia2183as4uNj+e89PMaeE9xw+9pP
         230iRGiQTcOrfJn2W2LFpn7EMoXEe64fIq0QZ2tHRVJNkEKLuUdxcYJi8fB1Du35/VSH
         MJU6aokcQkXHDR5pZZC4UDnMrGEyyeN10Ewfy9kRZgJZiU0+Hmd+zL/vU4hYrJOdZp0m
         Ket7rovD3f+7TNCv0gEqcGIL+VNN9Fh/o/HSq49dAhBbDPriGFIJX1XAp61PREXuRrxo
         /y3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S9hH4zorKUC2orkfwALmr2q6s1FZ/UxiA+b+T0QKDfM=;
        fh=Q8MhUoO2p+RBzVGf6vMLY2ZaZ0Cs1Sh5+2Sa+nGTvwo=;
        b=O8QgHtBUlGrmaSmWbRaPx92mUAf+edst595nWZD4ipPCbXTNe7akwJTmer0NutmQcf
         RkEes5sqgijYr18y/KNNSIbqhD4Fj1OIg6hK224RRr7/g8V3LEbASGfcDprohTO+Yz8p
         UuVL4HOawVIXEwkbSN0cCRzHxZ/dKjKrdp9Lw3WS5Fj76+TT8xvQ4s++NXBvfb5r3OVa
         EJWw4qgp6qZeNN+REldr0BU2rHC3ihRGB0KE80qITb+1Zk//eMVGNW66/HvAtIFTlkUb
         /nHf4WF2Hl6eVEZgUI+c/dXtAuoCZ5MxDve1Oz6BJXGq1QG1zZJ7vx0lvR4hoRAIDN8L
         AfsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JbcgIzik;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42caf2e1096sor43597135e9.9.2024.09.12.04.59.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 04:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JbcgIzik;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726142359; x=1726747159; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9hH4zorKUC2orkfwALmr2q6s1FZ/UxiA+b+T0QKDfM=;
        b=JbcgIzikYvcNFrNKqPodSF4GCDW/RyzhVOlSUd5+6uK1wWfzQkDs4K3BUAFy562AuK
         YJLNCo9bW7JwdZ199tO3R42QO8O5XlvLDN6Rt1j+eORhLMMQeLUr0Hf1KhhTa56mX1Ll
         Flepj2TSU4hicxkWCxPfdMk2kuUrWMGWqjjVXMBbo5iBWPBh6rGhz/gt8K/K9+PrFHT0
         5PCUz9g+I/h7YGBw0EnmnmApt6vcwNEX8zV8rUS55UqyrSX2THXKq/GUVtx0kVirFFu+
         uCe8O0grB8hNw9BzgTYQaoFE4rrDJqTHt8Rnpjbh+32Nv/sYVY1fR1p9NY/E28FCC0di
         jNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726142359; x=1726747159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9hH4zorKUC2orkfwALmr2q6s1FZ/UxiA+b+T0QKDfM=;
        b=c0wxIz/mJD3Vz+DW7WuJeCGOYNXYzYNQ7ZiLmVxcyli/ZyXGZ01WgwzskymsaOMzD+
         XI3zzi9AqD3Ky5i5O6RcdntKUczBtvgS/a6qRbiaQ6nvYUuQZJw2ZWR+JL4mFZxFB2dL
         ak0qebkiSSlGeEb4M08NuW2tztQWBlFolvfci+9sc1kV0qFzMU6wN0cifLTzhEMsGZff
         21V4WjryUoLUIc46o2ryfpXVThNmtHi4uGQdSyt+gD+wJA/PoqYbKbBt/bu8KlAlUYyu
         pUQH7iqEWjUQLdRLJwNjNlVQCnJhsdYyrl1aZG7BAmJvLgkehWJap0wisIy5l1UlBMaz
         0Dyw==
X-Forwarded-Encrypted: i=1; AJvYcCUXqdm9Q+Gj5LVBKwEMNIqhrj3N0lssdBEhGG15vLklqR1UPO99ivQn18NQRjwLlIKNHxdEI6F6xQ1T8g==@linaro.org
X-Gm-Message-State: AOJu0Yw2EE3O261uTUrY5QmgQLigYg7au79/DUfYEZ9340W5eEoOV9cU
	1k1qg0k3M0XH7jTdyK1OcQqa2/+QTuE+WiQyLhGhKQDYFdWAh6v27dePURz/A6Qxfw==
X-Google-Smtp-Source: AGHT+IHdMYpvkErKC3W9i3z+Ft8XhpOoUilHTYrpJoqTJq/qhlwtnn61XatlsIjXjk2IjSojx5FOxQ==
X-Received: by 2002:a05:600c:1c28:b0:42c:ba1f:5452 with SMTP id 5b1f17b1804b1-42cdb57c022mr22778035e9.25.1726142358622;
        Thu, 12 Sep 2024 04:59:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.102] ([176.176.161.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb44887sm171920365e9.23.2024.09.12.04.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 04:59:18 -0700 (PDT)
Message-ID: <a0608783-d6d8-4ccc-a431-5fc1e96e0021@linaro.org>
Date: Thu, 12 Sep 2024 13:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/48] include/hw/s390x: replace assert(false) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, WANG Xuerui <git@xen0n.name>,
 Halil Pasic <pasic@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Corey Minyard <minyard@acm.org>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <thuth@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jesper Devantier <foss@defmacro.it>,
 Hyman Huang <yong.huang@smartx.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-riscv@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Xu <peterx@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Eric Farman <farman@linux.ibm.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>,
 Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
 <20240912073921.453203-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240912073921.453203-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: oHiUjkfxc/zr

On 12/9/24 09:38, Pierrick Bouvier wrote:
> This patch is part of a series that moves towards a consistent use of
> g_assert_not_reached() rather than an ad hoc mix of different
> assertion mechanisms.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/s390x/cpu-topology.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

We usually don't precise "include/" in patch subject:
we treat include/FOO as part of FOO area.

Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp48343nji;
        Tue, 10 Sep 2024 23:13:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfdO+UxlH9QIKJlSteo3xOhkxnsHLHJaL7/Zj5FW0dBVYFNl7zMl5I2Y86Ux/2sCybxkQXmWMZbeVqVA==@linaro.org
X-Received: by 2002:a17:907:7b89:b0:a8a:71d5:109a with SMTP id a640c23a62f3a-a8ffaae0c5dmr342413966b.22.1726035217823;
        Tue, 10 Sep 2024 23:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726035217; cv=none;
        d=google.com; s=arc-20160816;
        b=LmV7jLEHk0h0yU8wJuQoZ3ULuqW6QbSDWBkMVOrN0/q9NZqEHDUWx0jIJ3qfHxwu/T
         JS1JbRiQ6AeIbk9PkoJD3fkRrWl7pGqZmO5rvP0zZzJJvaCYajhBj/PP0xGg+aXtcwbC
         c7W8rXpjAW8jyFXNFum7MPoeou9B7oqCk6KwkqAVhplyldIi+JZrvTjUenimWrskoXmX
         whfkzX8LSkh+n0cfbz1P+9Q6k9tajLsX3Azbry7p4HwYz9G97joBETvVq4Kp6ctrdojJ
         q7QtK1FL3JNr/OCMN6osQ+VXx/b0zxTSpbCphMyYF7o5oqfK6llK5TzKlmNPKULaI4DZ
         6PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=poAudXl/SIIw/XPRvz0lT3oV27sGXK44B6oZsCmnODk=;
        fh=ncV8lwMqyeSz7Tm2yRrzaU9jiQJYfYpY8k+Qzg0BMo0=;
        b=rWOwssHc/QubS7BVVjdFLM1yCAyoGgowZN2AGP9omD3MDr/PEpRMiZeAoZynau+MC9
         Fb9dAc4rgMj9kyeONYr6W5Ais9/esL7qksEKXkP5BOZ2F0kBPjZtKqbgpexq9JwTn30a
         nYldx4qfAh3xTHenTRlKkOT+nEc85WKFn9041F1M0BUR+rE3Lte+14wxmPceagvtq9av
         tt6CybMSgkLHpgKiMtFUZCzeJUOJvFpIYSM+NsW3Y8ZGaWso5uH3JrA5cDPn+k9KCPPZ
         ZwoUGoGp0anL1V1UwqBpG8dlA2CTh82EGDPsGDIrLfeiGQZpuYMq2PlMydBSdQd7g11j
         3U8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkad1hee;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25c4177fsor257541566b.13.2024.09.10.23.13.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 23:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkad1hee;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726035217; x=1726640017; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=poAudXl/SIIw/XPRvz0lT3oV27sGXK44B6oZsCmnODk=;
        b=hkad1heeicKQmGr1RWQq/9lcGykqvl06czEWhwfSPpoBjdKYHos8LgLAOcCGfX7hJE
         yQZTX5O4GJHDScsXHVlZpPy82WM8hbBk+IM4xw0x9PBBqlyCk2SYaXxk865huq4OcVhb
         5REXs882HgaO1B7O+OpQ+jL1cpPM7b1uRRjsx6NSU+RrHurea3DGWLxdYbrekZhWAIdc
         KyJmqjZIJj3v9TBBWWpy5mNY5TdPwrqzuzGPPcJ8eNFPa44EXIEtQTsvkbNcbyuIyBnQ
         jo3IV7IBcm+h3TX51rge5VWxhfqm7PVx5zm9PPldFlS5VScqm4VyqhSR4MRhJMvfzJE4
         lGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035217; x=1726640017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poAudXl/SIIw/XPRvz0lT3oV27sGXK44B6oZsCmnODk=;
        b=eNlEwAhZxPAqzgwzFPWMzEKQq+oX8NKHHJIoF/Vuw+nQ80uASnaJKrJd+a4nXZrQGt
         GdyPogSz1a8J3O90vvMmn7w6CcFMr4LKScnmY7LTaWsfNMt++CP/Xnc4Eo9yFiH59qiL
         ghphLsNMdHRNhuPKWIA5KXgnL3CB3qdxqOQz/LUwG1XkhqJwgxoJNPvHNTNGc9Y+Kyxk
         DQ5zTWl9wnuBbARgPytiEvPaUNf4yHi26ChhuCYrk0pvdUB445AhTl6hJjw3MEFxiskj
         e5mF9CPmWokpXcZz1Nouu0NNzgzYkf/hyBdQDhlM0n/hp424jdSbr5WIoAMM0qP7Cy1u
         nXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcYCW6/cPBbSUrnYMoklwI4PMNOdbj3ja9PQCBjOYd8CboMDToSp7pN9RTuBLozLdTLKSBK3aLsABUIg==@linaro.org
X-Gm-Message-State: AOJu0Yxv1FxQPbmfD9oyrNvFOvNHAAyWp9Ziunrx8+USbfnJFrcWZkug
	cr853dJa45mMnNTsowReaIpcM7c69yzrpGgvZyqZU6vFJth40I+aU3mlrMBTh4CWPg==
X-Google-Smtp-Source: AGHT+IGxSIV12l24qw5tuVF8BHzeUm7qf/id1NqLdpbzEe6nCFQXxSFQeScbp7YFg/szcxgjwvBm3A==
X-Received: by 2002:a17:907:60cb:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a8ffad97d26mr288054766b.47.1726035217121;
        Tue, 10 Sep 2024 23:13:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced1e0sm570162366b.164.2024.09.10.23.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 23:13:36 -0700 (PDT)
Message-ID: <2993dcdf-b8b8-48f3-b322-a121989559a7@linaro.org>
Date: Wed, 11 Sep 2024 08:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/39] ui: remove break after g_assert_not_reached()
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
 <20240910221606.1817478-37-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-37-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RbLNQAfotIa3

On 11/9/24 00:16, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   ui/qemu-pixman.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

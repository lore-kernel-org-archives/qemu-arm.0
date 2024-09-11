Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp77251nji;
        Wed, 11 Sep 2024 01:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkOCQ9dp8PxtTHy+eS7V63YCXigLKAk631YbQ07ydgbpUrO2ariXINH27E7h7Vnfdt0bzbTdpAKq4FmQ==@linaro.org
X-Received: by 2002:a05:6512:114b:b0:530:dab8:7dd6 with SMTP id 2adb3069b0e04-5365880a504mr10060607e87.50.1726044000385;
        Wed, 11 Sep 2024 01:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726044000; cv=none;
        d=google.com; s=arc-20160816;
        b=MNfKLz8GHc2msSrE8OUjtB4Cj8DjMcb5ExPZo8F/KyQnBtuDVj3ICOQ4FbFbMIiGZE
         YUN9FrjTdq/GPaG2ETnCPilJwftZ+iE3AbnHq9RbBRuDiVUD2GACt++MK9mKydkr3Zao
         ytlOMKWJElHNnrPKZ/U02a+i3Eb+TQOEcDsY+TwdVJ51KxZoHmlCWXj74XCMdcWEMiLg
         m/0mTtgUrLeirnATQm/bwmn5dCDh7zUzJrC5EwB1+jBVf5z+ZhsA3un0BiehQjEA6zgx
         Q6u/Y73QUxYfbH66r5YIBqJekUxBvM1bjTFcp6eHpgrZlRjOAJZRwid+qaHuP+RG3Drn
         HxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+JyV9LJm2Vf4wGO7Hd4ArlaMIqvRcHyLUasi+8n7+pY=;
        fh=GbvRpk1A04Z6WlzBRvK59IqROSHY1IZMxfLySV6Y8j4=;
        b=bUbaP38DbKmsO9rKBIhUE0pnTRt9QZ5SesOv0jmtQNyeUiPRQ1ZEDqbmvmERA0SVqM
         ipJb7YDO7sy15WZGuXNvw9zNrXMCoGqBe/mkPzMh8WWHg/SwGQLWbLiDznnc7Dbz6ASe
         YclLvpc36FFZwIHnRgQdBecPxHSGJoxXH3tYFIbl9pX97gO+MGFb9IR76hxE2Dkx/IRG
         2FE1k9mIbLQFKAQslYWlvY3epJ8GVPLo9SjNq4wnwP7EwusrD8JK0p6faIi5/otqj/03
         fES3oUyNqcNT/IeEgFYFLV47Tr3m0eD0LREdLsT+ywsV5q+1XjAdr6VSIHmH3pHaDNCp
         gGhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q74x6RW8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c3ebd4682fsor1502054a12.6.2024.09.11.01.40.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 01:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q74x6RW8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726044000; x=1726648800; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JyV9LJm2Vf4wGO7Hd4ArlaMIqvRcHyLUasi+8n7+pY=;
        b=Q74x6RW810M2eBm6pbwXVmguDpoqaiR7/W5Rp3HdbSNXHc4WTlveKe2ECTur1JHz7L
         mxLbwbhuM9c7HfmYkhY6SCipvVhrKwJlbB1J6d7fl8jK5cw1O/wbIOEslkpwxw3SGZAw
         oZx/jFYt0q7gO9j8S4KFCXZu+yFed+R6mtnB3JdLu+sbXSJ4vmChjT8xZHZ4fP5XiNk8
         YRyKDULsspvzTcydc+C5KqGq0m5DVvRcyVWTs314J11Qx8My0hGyXHm8tsEud1HLj8rD
         iEh3+8G657ETtKNrrQAuWo4Vs27nw3k+er1VyN3gh96yDKw6EVivTONaEY6V2vGhDjl8
         S8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044000; x=1726648800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+JyV9LJm2Vf4wGO7Hd4ArlaMIqvRcHyLUasi+8n7+pY=;
        b=VuC9gRP63B+dzQELZTPZogqNS42u3bX6PLjbhuKA6dsOMSwSRxpv18zwao5sRKnyzF
         WP2lHYJbEE5ygNpos/3BpTZOjcF6tvcdITiqq5vty2JcEXS1uJg9UpBNJ/X3412/lhML
         FOFyhkIaf9bJtIfNN63GZTlNbC5RxBaLvXfiDpiIN4w1O6M1Le6oeXcfXzbwPdkBtkNW
         vCNyqalzsa6Wn8edaevGhtpFf4/JMPM/t/fsTG5HL0Khq6ffZbAAaQXt0ozK8/uqU1Q1
         FAmzzdDlO+CzTs0oxI+d+mbXOva3f8Ro1FqX2PM5jLBWNzVamiJxvV40T/dLEsaNMH9l
         n5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXeazHdiZgjipK2xINFubOZDvWqTouw1+e8XiVhOjJcxN7T4Ubp6a6lIDHSQ0sYdScj6gZaqOdX5y7XCA==@linaro.org
X-Gm-Message-State: AOJu0Yx05nnWt4EhXJCJd3dkqAoHdJihbbs5VRo4uONLXhJ6yZwzbuao
	bhYl1uy3W7tp2vcbYr16fOiFIziWBs7D8VeC32rxmpG9jIfR6RO6X8TXkgmuMWsrQQ==
X-Google-Smtp-Source: AGHT+IEuEoUthM2OYCPbsPo/4/wEMjrSZwhG3gfLOvWlGcTJuhGUXemtOiCS/nVKmGgtKqBxFEkheQ==
X-Received: by 2002:a05:6402:26c9:b0:5c2:439d:2042 with SMTP id 4fb4d7f45d1cf-5c3dc78034amr12338656a12.5.1726043999447;
        Wed, 11 Sep 2024 01:39:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.196.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd52099sm5139643a12.48.2024.09.11.01.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 01:39:58 -0700 (PDT)
Message-ID: <cd6c5970-9a1c-4d58-b8af-483909c3c0ca@linaro.org>
Date: Wed, 11 Sep 2024 10:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Use g_assert_not_reached instead of
 (g_)assert(0,false)
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AKqj4EPYjLDh

On 11/9/24 00:15, Pierrick Bouvier wrote:

> Pierrick Bouvier (39):
>    docs/spin: replace assert(0) with g_assert_not_reached()
>    hw/acpi: replace assert(0) with g_assert_not_reached()
>    hw/arm: replace assert(0) with g_assert_not_reached()
>    hw/char: replace assert(0) with g_assert_not_reached()
>    hw/core: replace assert(0) with g_assert_not_reached()
>    hw/net: replace assert(0) with g_assert_not_reached()
>    hw/watchdog: replace assert(0) with g_assert_not_reached()
>    migration: replace assert(0) with g_assert_not_reached()
>    qobject: replace assert(0) with g_assert_not_reached()
>    system: replace assert(0) with g_assert_not_reached()
>    target/ppc: replace assert(0) with g_assert_not_reached()
>    tests/qtest: replace assert(0) with g_assert_not_reached()
>    tests/unit: replace assert(0) with g_assert_not_reached()
>    include/hw/s390x: replace assert(false) with g_assert_not_reached()
>    block: replace assert(false) with g_assert_not_reached()
>    hw/hyperv: replace assert(false) with g_assert_not_reached()
>    hw/net: replace assert(false) with g_assert_not_reached()
>    hw/nvme: replace assert(false) with g_assert_not_reached()
>    hw/pci: replace assert(false) with g_assert_not_reached()
>    hw/ppc: replace assert(false) with g_assert_not_reached()
>    migration: replace assert(false) with g_assert_not_reached()
>    target/i386/kvm: replace assert(false) with g_assert_not_reached()
>    tests/qtest: replace assert(false) with g_assert_not_reached()
>    accel/tcg: remove break after g_assert_not_reached()
>    block: remove break after g_assert_not_reached()
>    hw/acpi: remove break after g_assert_not_reached()
>    hw/gpio: remove break after g_assert_not_reached()
>    hw/misc: remove break after g_assert_not_reached()
>    hw/net: remove break after g_assert_not_reached()
>    hw/pci-host: remove break after g_assert_not_reached()
>    hw/scsi: remove break after g_assert_not_reached()
>    hw/tpm: remove break after g_assert_not_reached()
>    target/arm: remove break after g_assert_not_reached()
>    target/riscv: remove break after g_assert_not_reached()
>    tests/qtest: remove break after g_assert_not_reached()
>    ui: remove break after g_assert_not_reached()
>    fpu: remove break after g_assert_not_reached()
>    tcg/loongarch64: remove break after g_assert_not_reached()
>    scripts/checkpatch.pl: emit error when using assert(false)

I'm queuing reviewed patches 4,5,7,10,27,28,30,36 so you don't
have to carry them in v2.

Regards,

Phil.

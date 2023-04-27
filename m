Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp277124ejm;
        Thu, 27 Apr 2023 02:42:57 -0700 (PDT)
X-Received: by 2002:a05:6402:268d:b0:504:ab2f:1377 with SMTP id w13-20020a056402268d00b00504ab2f1377mr4750154edd.11.1682588577220;
        Thu, 27 Apr 2023 02:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682588577; cv=none;
        d=google.com; s=arc-20160816;
        b=J78LgApmu45Rp56ndVg9OryXChm/wHMfT8wX0y6unfTvE/1RwA+bRSdn64gaixqSd0
         5yvkXMenwgvRXIAzMRpHcpd88apdroD1oc4lKnqOMAWpCsZPEI60pJoGjxlAvVgXC7cl
         NWmBMIfAP6P/Jld6QR9/sbsYg0k6pvAsOQSl4CxOVGpiMmg+OuC8lC53suAVb9IuWo+T
         8dynFH9wkGV2C3JfChfp32gW9QQr5emB7QUCOUapW4GbXXZSulbspB10CevmMp/2J7hb
         W2UXVdNz1iSuLlYEUViO14p7yeayhf5iWMs98qzYZpFo4U89yky+hobbvXVXz4Hif9u2
         Uy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UjuGkTdjn1BEI/rogFw66bE622CeRZElOUK2WYq7fLE=;
        b=WJgen8vHLxxBrKmzXNokbLw/POmIHHQr2HpcCwc+GwPzBA7fp9p1mZH8UfqLrcrHbc
         cCx8hUIqefmCPYqyUz+m1C6GIqXhUtVdnzGW1308xWJSXiniMGYeWNs2+Df+xLtNSv/c
         jjlpFIgVKc7Ebswwv1DRk2J01p4QAtpri2BBEtJS63u7udp+C1kiyEhLOfgSp2RWbWFL
         6t5cMNXGRWS5Vpk9+EQ9I7chYa/Jny12eyfKIekFPAsJGWU0fzdDISRFq1fzb8ryy7Tk
         xTuxzC8SsqcUtGtzuJrOgV81qXuEMo7cm1Yz3NmOpRVfT9+Dph6klrRoYlpoZblCbJIv
         ecbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GElwfaXu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o21-20020aa7c515000000b004ad73289df1sor10470139edq.14.2023.04.27.02.42.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Apr 2023 02:42:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GElwfaXu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682588577; x=1685180577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjuGkTdjn1BEI/rogFw66bE622CeRZElOUK2WYq7fLE=;
        b=GElwfaXuDk9GTxKxaM/ehAX2Ii6g7SOJkIkWyBELgoplxQAWaRU4xdIdB/C9QU7/XL
         1vyfosNrZo4GLAiAt4zpi7Cf1fI/0NQ2HYwElSOufLf80iJO9PYQgleHLKCvtnE+ZqTv
         q31eRAqBLn+WNSeuBh7ZtrrzNJdTokmU68sdpVoA5LKBa3QADZEqDPsAbVQPcoT0E49E
         sZ2SiaWE2o1UjHlZcPfdG7b79UjSTPo/fD9StghHYfF2sJGUVH8IYQ72A/O20roxydD/
         tywG0xd6ubpKNtrM34V7fwoa2BrSg4n7AHiDpoGAe9kz73uYZk1EUooEaVkis0rbozNw
         C5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588577; x=1685180577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjuGkTdjn1BEI/rogFw66bE622CeRZElOUK2WYq7fLE=;
        b=VOU4SHV8xYM2Mx+B+gdgm2RnHh8qhGYD+Y8y95oWZgBu0cxFDMLyx6q3iOyO58Ombl
         5UZNtTCcQ8K6s4VnNHbTWtFwnHd3U672IbYGtvu1SiEpJggVHGAh7PEU8iAWFYNnEwJm
         vGwBHFki7XuQiq5XPGukD0FcG0GBWlbnao62nPol3JaisTcQFsKMNuKi9yAqAuP3ecBk
         0TrBohz5txqWCNvmNLEVaFUKnbvuVTkst7suYTq1kEp5jBlvjcJeClBYGlSnENfs6zLt
         eS0x9bo7kVH4Td0+suwqKElxp88vBlsXDwXfZbRRk04XxJ8NgVS/doKHC8Px/Ve7pEZ6
         QKCQ==
X-Gm-Message-State: AC+VfDzavHm7Ul9vnylUwQABD62s1Es2HbRbIaW0K9NFls7hwt9M7ox2
	BEfIwlRgwWjsTzfAJqcuLe6iMgOa
X-Google-Smtp-Source: ACHHUZ4cQDp2fgrLlcEt7ZEw38ItNhVsGf1nIL+RTlSNR2QbHaBDou2b2ngfz57LKXPsNM9GUG247Q==
X-Received: by 2002:a05:6402:26c8:b0:4ea:a9b0:a518 with SMTP id x8-20020a05640226c800b004eaa9b0a518mr4495085edd.17.1682588576789;
        Thu, 27 Apr 2023 02:42:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.23.3.19] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id f12-20020a50ee8c000000b00504ae3a5adfsm7801757edr.2.2023.04.27.02.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:42:56 -0700 (PDT)
Message-ID: <e96ac25e-0a1b-942f-4103-8aaab51c745a@linaro.org>
Date: Thu, 27 Apr 2023 10:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-9-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hHppQTT7VbEE

On 4/26/23 19:00, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Reviewed-by: Juan Quintela<quintela@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/bios-tables-test.c | 11 +++++++++--
>   tests/qtest/boot-serial-test.c |  5 +++++
>   tests/qtest/migration-test.c   |  9 ++++++++-
>   tests/qtest/pxe-test.c         |  8 +++++++-
>   tests/qtest/vmgenid-test.c     |  9 +++++++--
>   5 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

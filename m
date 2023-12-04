Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2667114ejb;
        Mon, 4 Dec 2023 04:48:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1dzJ25ytG/VK1pLiNVr29r0kaCsti+8g1t8TSlEJoGQX2XzTYiT5gPwDD/hK04yWu1zBu
X-Received: by 2002:a05:6a20:8f10:b0:18d:961:564b with SMTP id b16-20020a056a208f1000b0018d0961564bmr1655641pzk.33.1701694114071;
        Mon, 04 Dec 2023 04:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701694114; cv=none;
        d=google.com; s=arc-20160816;
        b=psSju2uMlYUmGa7WTViwLydtCr3Wy0Rflj3+zQYNamnwNf+df0xLOQxDKcWk+R9o7Z
         qKLX5FBhT/laWzzl+/jqHJnmd+ErsxBnKJlD9qCvq/e+gVvjaY+ppelswWeoub3uauXw
         Fqf0JDVPiablxNNXZrZ2MYu3o+xmis4Txj5qkLnQoVCNPF6aFZK3IeZUT4jfCRjFbCPS
         SOwTN8PslKUWXH558nUFmRGbe/3vP1EHnUoOwfPX6gNOGgX9mg9iuTutKFJOQUJ5AQEK
         gXIyYvX/hgHlI/U0ePrN1nhspJWq7MoXURbihGTDKr4o1UKOa11B/W7f0B+Vq0oWfAE+
         SSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id;
        bh=i0mM5CjKmk5ted9cwoxoOPtPHYftMjLJ/f4k79gsGK0=;
        fh=BLbiBgjYQ3iiMXjjiAARPT5bnSXa4QvuZysSezmhEjQ=;
        b=k+XduVb/O19ggR/tyAsoB7xC3iX9XwO/XYIshBRRh5wmm01rkQfWe/Fyv3h4phz8E7
         VnAQg8mGt7ulF8Nsa7LZx36u2cPnbspto3ZCSa94eYWU448bNxrQtxp+AvdIg3hNnH53
         rwIh+gAQRaDdd4f65d82eM/rh7RZRJvPLVQx6d4M19BtFkB75LmaQ8nwxMDJ23GD9yqG
         ebmKRK1NXmVGbBJ1RP+UhXHbwSoUF+QpNLilT29qLXueCGfC3oC5Xbat3l+sAwcYmcOd
         YYIzcMliplYjoH7ihDplCtXYc5+Tdbiz5u3Y+/UpmTrINVmQQz12aQx4GZ2ccys0GRGL
         NemA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=dqur=hp=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=DQUR=HP=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=DQUR=HP=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id z19-20020a63e113000000b005c14fc66cc4si3422446pgh.380.2023.12.04.04.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:48:33 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=dqur=hp=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=dqur=hp=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=DQUR=HP=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SkNkk3tj7z4xkN;
	Mon,  4 Dec 2023 23:48:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SkNkX5rTSz4xkG;
	Mon,  4 Dec 2023 23:48:20 +1100 (AEDT)
Message-ID: <3ae174c2-bad6-4099-8e39-a2f02f58cdfd@kaod.org>
Date: Mon, 4 Dec 2023 13:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] gitlab: build the correct microblaze target
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-7-alex.bennee@linaro.org>
 <a9b7f414-5229-4dc6-9d32-b95d36cdbaf7@redhat.com>
 <871qc29m3z.fsf@draig.linaro.org>
 <181145d8-4d1e-4b19-a77b-1c583155a725@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <181145d8-4d1e-4b19-a77b-1c583155a725@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WmcPS7PRakm0

On 12/4/23 13:43, Thomas Huth wrote:
> On 04/12/2023 13.40, Alex Bennée wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 01/12/2023 10.36, Alex Bennée wrote:
>>>> We inadvertently built the LE target for BE tests.
>>>> Fixes: 78ebc00b06 (gitlab: shuffle some targets and reduce avocado
>>>> noise)
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    .gitlab-ci.d/buildtest.yml | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>>>> index 7f9af83b10..62b5379a5e 100644
>>>> --- a/.gitlab-ci.d/buildtest.yml
>>>> +++ b/.gitlab-ci.d/buildtest.yml
>>>> @@ -41,7 +41,7 @@ build-system-ubuntu:
>>>>      variables:
>>>>        IMAGE: ubuntu2204
>>>>        CONFIGURE_ARGS: --enable-docs
>>>> -    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
>>>> +    TARGETS: alpha-softmmu microblaze-softmmu mips64el-softmmu
>>>>        MAKE_CHECK_ARGS: check-build
>>>>      check-system-ubuntu:
>>>
>>> We've got microblazeel-softmmu here and microblaze-softmmu in the
>>> build-system-fedora job. So please don't change the ubuntu job here,
>>> otherwise we're building the same target twice instead.
>>
>> Hmm - what would be really useful is an actual microblazeel test image
>> so we can test what we build.
> 
> We've got at least a small test in tests/qtest/boot-serial-test.c, so we know that at least some instructions can be executed via TCG.

There are 2 configs under buildroot, qemu_microblazebe_mmu_defconfig and
qemu_microblazeel_mmu_defconfig, we could possibly use.

C.

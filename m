Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1690034ejs;
        Thu, 11 Jan 2024 05:15:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX8YAKIC5YbtkAholBCnKnU6wMdxngtoM98MsufGb079pWN2ilCb2Btc8mWednWPg5C5U2
X-Received: by 2002:a05:6214:19e1:b0:67f:b920:f248 with SMTP id q1-20020a05621419e100b0067fb920f248mr1193877qvc.120.1704978939141;
        Thu, 11 Jan 2024 05:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704978939; cv=none;
        d=google.com; s=arc-20160816;
        b=J/tfiFjb+D5OVJUGlt4ZgTlFxwPMsLfl/rrPaBn3n3oNwqAKkboZAbuHmYhovRn4Pk
         CcoxgR2KJZCjvmECjf/9uHLpE5iyRbbQDou9x28h+X+lL8OmuH35GOm2VhB+QxVIjfLO
         c9R9fLUU60GivTLzrv9/1GM9JRZb47NyeUkW7dzH983uiR+ByxqeEzR5W6KF7F/Hzngc
         9cTjNVjUqnpRRmaV4adOvHmFm229/epAPU9nibs7E+4ABiCK6o45wiyDu9LMYOJKhuiL
         z0KV30mDkzjJeOE/zaCh+TyZt2xjTJA7C9cuRp7nwQpRQ3X05Qu3R4Jf2IRYuOT8zlZH
         vNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=xw3SWpM/KIaawoj6jcf1qA1DNhbkp83hVnVG7AQGJLI=;
        fh=mpQ9Iv//YXKNaz7vmHEc+k87sXxDnnWBQC29SBEBMuU=;
        b=aEwUMeA1T7EO71Tmcmsya2kgOZffTdssppa75NSiAXGTrTIEJdQJSXWxCZyGJveEir
         gg6yhzg82ExOIzilQdM2a1HWFEEAKXX+lwJl+IaTRT6TE7dqKX5/dB0pm2Mp8ucd3gC7
         CZs5W5Wlhk5GIrsW1KZHte9LP1o+Ci9jVgM8h69SFWFYWQwA0+2K+n4iVdnR5d4eHcJM
         CKq+xX5XubUHOoSmQ2FxEyeC+JcmF5PN8nLMigX5InT5ChlHOONxjhYeCh1rMvSolLNl
         e2PLE/RpWt4rQ6v25GdeOPM64pOloA3vszrua3WyZcL7ARorTQPQL2+fQky8KekbB9ai
         ApVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Me/Wp3sp";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t15-20020a0cb38f000000b0067f0b985f45si745704qve.608.2024.01.11.05.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:15:39 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Me/Wp3sp";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704978938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xw3SWpM/KIaawoj6jcf1qA1DNhbkp83hVnVG7AQGJLI=;
	b=Me/Wp3sp9RfC2U7VBpnocFZQZcE/GTdYPfTIIzV3o6ihUWD0/+xkWRBObpzw7tC1gxgk/I
	2t5ZcBpKlQQqqi0A+g7xWlmDr7lR00Xi8cgB63lxwTrOGzwzA+k01GzoD+spu/bs0avQOC
	F4pshqKaQBH82H7aJCi2NIZalBo1mvU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-3sqcJhbON0-UIe8_Hpx23w-1; Thu, 11 Jan 2024 08:15:37 -0500
X-MC-Unique: 3sqcJhbON0-UIe8_Hpx23w-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3bd49a8f086so2602993b6e.0
        for <alex.bennee@linaro.org>; Thu, 11 Jan 2024 05:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978937; x=1705583737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xw3SWpM/KIaawoj6jcf1qA1DNhbkp83hVnVG7AQGJLI=;
        b=h6OfRUeCNxLtOB8jiMy4PkwJiAeUqbMtrArq5eQ7OY2wZa49BV2zQgt04TWMU6m5SY
         rODRx12lQtJN+/TKvo6hltSManUhG+LkaDYc/11I1RU210p6B9gB6xK79vs/XU1dgr3k
         3nAhBTaBuD21b0r2TsLd98+CczzwRpV2vfFuW5UrQf+JYWCdTgiePfX4ZElQCr8Tb42D
         41jGw58ULqHhSuw8XGkh0Rphc83YJdlHJ1mHau2KoksiGXhsi+2cQw65TViZ04D5MsTP
         panX3mw17le3cN/zJyr5FpJPJmK1gDd5GOn57DWJzDebOZ/lc33LKWRlrh0i9Jnm2Qw5
         +53g==
X-Gm-Message-State: AOJu0Ywn2Waacg4rZbprKJrHEuyxFLOxOoREAbG6J7wXcQTZ+ARg56mU
	Nauyw2w1/yb3GZaPKDbaFwdCLCq24RCaq5NWrsPhFQvWVhnyCoQZCKAnS94ijdrHL1BUmtmwb27
	LaobJNodVOwxDkVRfWpHDO+QOLw5KXp4ufSS8apyfDAcaIbRQR/A7Ob9tB+xu2c/tgswXeEJCLb
	UQy5oj
X-Received: by 2002:a05:6358:3a0e:b0:170:c1a7:254 with SMTP id g14-20020a0563583a0e00b00170c1a70254mr1339496rwe.2.1704978936833;
        Thu, 11 Jan 2024 05:15:36 -0800 (PST)
X-Received: by 2002:a05:6358:3a0e:b0:170:c1a7:254 with SMTP id g14-20020a0563583a0e00b00170c1a70254mr1339434rwe.2.1704978936366;
        Thu, 11 Jan 2024 05:15:36 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.181] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id j17-20020a62b611000000b006dacbe57efbsm1144621pff.90.2024.01.11.05.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:15:36 -0800 (PST)
Message-ID: <88294892-8ec3-451f-badf-1454b5ae53fd@redhat.com>
Date: Thu, 11 Jan 2024 14:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/43] gitlab: include microblazeel in testing
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240103173349.398526-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qsXP60P25R7m

On 03/01/2024 18.33, Alex Bennée wrote:
> This reverts aeb5f8f248e (gitlab: build the correct microblaze target)
> now we actually have a little-endian test in avocado thanks to this
> years advent calendar.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 91663946de4..ef71dfe8665 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -41,7 +41,7 @@ build-system-ubuntu:
>     variables:
>       IMAGE: ubuntu2204
>       CONFIGURE_ARGS: --enable-docs
> -    TARGETS: alpha-softmmu microblaze-softmmu mips64el-softmmu
> +    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
>       MAKE_CHECK_ARGS: check-build
>   
>   check-system-ubuntu:
> @@ -61,7 +61,7 @@ avocado-system-ubuntu:
>     variables:
>       IMAGE: ubuntu2204
>       MAKE_CHECK_ARGS: check-avocado
> -    AVOCADO_TAGS: arch:alpha arch:microblaze arch:mips64el
> +    AVOCADO_TAGS: arch:alpha arch:microblazeel arch:mips64el
>   
>   build-system-debian:
>     extends:

Reviewed-by: Thomas Huth <thuth@redhat.com>

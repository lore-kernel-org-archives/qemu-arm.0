Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1636543ejx;
        Tue, 27 Jun 2023 14:00:56 -0700 (PDT)
X-Received: by 2002:a17:907:d11:b0:96f:9cea:a34d with SMTP id gn17-20020a1709070d1100b0096f9ceaa34dmr38562675ejc.21.1687899656686;
        Tue, 27 Jun 2023 14:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687899656; cv=none;
        d=google.com; s=arc-20160816;
        b=n1mK1QJ9iibcmqFS8bLLV3rqqXliyegiFxsMh8gKthDJWcU50CYiJUt2Bq2xsTZtRx
         8BshdhRwrbsmXrVnZvH99qo10s5HukuHdwENEAywu3jcCBE8P0nUrS7EORvyajHWXp9x
         UpV0tZCWET1cpeYL/okpdDufPIph0aaUdnTuxYoM7vCes4Pg1fdjZmTzRIh1/Mxp9/C/
         gPvJoWPc5CnvM1NDa4T5FckOGCRgj1yuYCrKTzsnQPL+EWR3Mc/6nR0Q2alDTKPzsEaI
         v63nXsrGmBcXGRxvuDuD/xW3s0z2fJPw5wZGVzP2HxvO+kv9j2KrXTNaiVFDCXMM5smW
         k0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=62OSSH3ozCHJnLQunVKnxmuqfOzJ18O1VXRziuXTiLM=;
        fh=4AILt7Q4TWcCR04y9mUImqy6AthRYWx3XXHCQgkVA/4=;
        b=OPZjaKmL1DiCaC/GX9cPooB1mltAUwFVkLLQSwl8mmq0LWMuV8CByy2IXl5JgH7/vd
         +uhjjhNdQlGarmv/fsvA4WCXmY64H4s+qM7Tf7LVfsz9avFV2wVS6sK2xj6jYqW02XkV
         zwFaTlYas27Dpl9iSW1Qv9By5W8AV7xh+fwWKV6mk+e7nTaDa4f/CKhtDdjP75Efu5jY
         WqSU47dnsBPy2bEIX+4mkmmAjugJ/t0m2Abc7osvzYzw+sSifoaWkM3KXPOMmOAjuwa9
         phmIqx7VKWOYTpyTIAsyHOfHFCbkWhUj3wCH33EdakzMPcBWxVP3sje0PJHZ7EXHKsTE
         +i3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g1gW2Y6O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id la13-20020a170907780d00b0098895e190dbsor685026ejc.6.2023.06.27.14.00.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 14:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g1gW2Y6O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687899656; x=1690491656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62OSSH3ozCHJnLQunVKnxmuqfOzJ18O1VXRziuXTiLM=;
        b=g1gW2Y6O0heT+yKFj7xlC4nF2pldWT61vL1IOzyIZGlqB+8fwfPhD2vGUDpi4jYC74
         mML9hEVszJMi5oaUDPkhNHueP0NtWllgP/H5PWAI5l+sc8QVX4cJm/VpFqep8qZAvqYB
         v0YY4Q5NlqJVXL1ZnUkQRo/utVzUKH0iUdYo+OwFUj7RSu4tfvrk5sVKJA3EloWQhb4u
         WdlL6cFPK//IP/9ocjtoFMFgEPKwFUiD3InChJL4TVuCSLadHQ5WqNmoCvAcz6Xu7zRv
         A8LLhbdfYc8v9NL9F/HWWYNPLZdmbOatlcX1+fG0D8GCLQlxXw2r8LU+eFb9+G2XxLCx
         sNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899656; x=1690491656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62OSSH3ozCHJnLQunVKnxmuqfOzJ18O1VXRziuXTiLM=;
        b=kyyYUKG7/c6kwvWID+2+xORz/vO5LoQkaCJZFYMgRg7PsIfW+Yr3+thknMJLcUD1Rk
         d6u7unJ6xSR44G0usT80zNnDatMz+mszTWZsQ91EMoNU0wZ5oY7c98OZ46+eiNszDsdt
         k8KO46956xtfh24Gt+Wu5S/hLbdoKdfe1LJTg5FBIuVLfEoOOepk4jeQ+vwyfk/wLnJu
         E6GR7Ln0gHYhtCWchNV8XVJuRkcrEydj5s6OC+OpiYvbY9ZZ7EQlRuEcIs9Cso10Vch2
         QLQFAz2tO+l6vJWz92bM6B+oYPRDwxxsVie8T14rlOHaSdz1e9kHVJGNAPJ4KrdAVPEk
         UIoA==
X-Gm-Message-State: AC+VfDxT2qPTA8v7mC1FPWBbMS4WiC6oscqM5aq3Le46Yc/O99/hH5Zh
	W6b+RaVE5w3jFGtIp3kysBuqdJ/fIXsH8QOOAiIV9g==
X-Google-Smtp-Source: ACHHUZ6a28yMQWprkLI3xYQWX5l/FZWh2yD+hy1eusXwXMqEC/1E4Z/TEPD5zK1Gyphu7CFdUwZRRA==
X-Received: by 2002:a17:907:1ca8:b0:973:84b0:b077 with SMTP id nb40-20020a1709071ca800b0097384b0b077mr33552419ejc.33.1687899656108;
        Tue, 27 Jun 2023 14:00:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id j9-20020a170906050900b00989027eb30asm4922722eja.158.2023.06.27.14.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:00:55 -0700 (PDT)
Message-ID: <db947a1b-dab5-e8df-98ee-f794d4f377ce@linaro.org>
Date: Tue, 27 Jun 2023 23:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 35/36] docs: Document security implications of
 debugging
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-36-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-36-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cVsa21+CYcua

On 27/6/23 18:09, Alex Bennée wrote:
> From: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> Now that the GDB stub explicitly implements reading host files (note
> that it was already possible by changing the emulated code to open and
> read those files), concerns may arise that it undermines security.
> 
> Document the status quo, which is that the users are already
> responsible for securing the GDB connection themselves.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20230621203627.1808446-8-iii@linux.ibm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/gdb.rst | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

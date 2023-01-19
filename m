Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp591757ejc;
        Thu, 19 Jan 2023 12:08:15 -0800 (PST)
X-Received: by 2002:a17:907:a2c6:b0:7c1:92b2:fa9e with SMTP id re6-20020a170907a2c600b007c192b2fa9emr13034954ejc.59.1674158895238;
        Thu, 19 Jan 2023 12:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674158895; cv=none;
        d=google.com; s=arc-20160816;
        b=D/UbSw2cwE208BCvR1PyaHF5BA9fcDAFYsFqkrAVWutm0va4mwHlkqKsUkmmgDxo8V
         WlCGWPDAu0Yix76gCOjAfTHm2980JGmPVrxmZPyY0XapoyOSqcX5pWfQYsaUohRktOPG
         fpjDEm9JVnhzcd3SCABYAE7oIeEojawDELVliBse754vuz2I9WCbvUmkkzxb0K3Zotx5
         eFznI3IpI257A52myJ1zfwTmMxekxxiXTwzY0L30NgUIYuZTpUR0KYhKEumCxGGaYC72
         jckaJTl+P2+HldYRAii3+ZFprTdbzlEDE1ykHxWNltd3hbLpPH9j75L0Bcd+2a0YxnkF
         3Tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UzYtxbMrks1cTP/ZjT2aQmHNFakV/2CSgts7B06Ow1c=;
        b=DC644vgnaq4PcCVz+0HceKEVop1DLmg4cvtWV2j9xy642klxEuJ0VghCmIrnLEXZbm
         YYJe9KX0q/gM51q2nODjkeR6DFqocEcfnsw/+OTd50CY9xfTm6aznrCij6Hjw2xNtgVj
         0//u/c7/KPsw+zdeSCIkRa9wGtVGdOhnR42b1355ODt0fbWreK/97myGaEmDb65eTaE6
         fhzMt089mLXxod/TWr/gk/xo7/LL7jiWnxchz7gj/5eXtiH+Byxc67+hlu4JMuVxRDYh
         q1p4cJNtpswNiBAEqgyUBSnNK5mEYFmhcl00gM4Y00vqp/lP4B5XzbWzDUrydq7D2mRf
         YPYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A64ZxDeN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id vh11-20020a170907d38b00b008714d1f56acsor6307092ejc.10.2023.01.19.12.08.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 12:08:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A64ZxDeN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzYtxbMrks1cTP/ZjT2aQmHNFakV/2CSgts7B06Ow1c=;
        b=A64ZxDeNq8EVwCNGXs29AZo8WLPOrBVOXq2zhheetsVCNxa0dv3zfC4BMzzb5uZ3Jk
         NnURjVZiYl2TYbNyGm2zRJmIcsc7cpsS/qTiciNmuyFDJd3EctNwKTEKP0CL8Y/mG58w
         C4SKHqnpvNga8Ory4850dzwHA+uy1X0eqiinl2D67eeNiapwZh5/JEYsIsB8v6ppFWoB
         dkAWcFl1kUAQpBbLzDpwcdi16g8f8uZwjwygp8p6V4cctEySbQ8K7fl6IWIJZngkLbvT
         7djrgToudk0WAHzbqUkYrF48TXu3oDK2OE4Bur2MkLgGmxy44eEYUk0TjLnNYdWntdt3
         cA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzYtxbMrks1cTP/ZjT2aQmHNFakV/2CSgts7B06Ow1c=;
        b=J33/k6EsWWIIs+oYh8QEuOiL3AA8kV6OHewgljB6Vz6XDvSIKAabcL63S2LClzsr6X
         bCGZQ1mlMkVe18bGoaiILWdsuSQ83sEzBW1/73ZhbieHGDgO9InfMAhEZFOly0Pb8Zv2
         L77NyMdYmORaiHa9ZcBEwQEdi1jPOfeFkrAzrr3aa3TtMjljQPLbTrtfrfD4W18vJYSH
         9a3TZOWr7UAbsKP/58K35vISLV9D4WRzWUH1BIv+OW9C2Q1wsVdLattf0EpC9sTAPU2D
         F63sCfYe7LwTMWoHufyTUzZk4+8RaZR34vzKILTF0srdNY4M+PYXj11HUuKJo6Lo1pT1
         XKYQ==
X-Gm-Message-State: AFqh2krZ6Gtu7nExWehLkxj+rHQf9tTF5OLm18NDVPDPrmPUrZ4I3UAV
	ySZtN1M4RtKj9zcin/KPn7tdA9WlKccMhHOJqx0=
X-Google-Smtp-Source: AMrXdXtQ7cyIIZkUvKCTWx0XG6/E3xpn69sgx2cPD3s14wZm4MOyHeEcNgoko/qWee9tWX5FyStOPg==
X-Received: by 2002:a17:906:9495:b0:7c1:6fc:6048 with SMTP id t21-20020a170906949500b007c106fc6048mr11526204ejx.24.1674158894971;
        Thu, 19 Jan 2023 12:08:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id j18-20020a17090623f200b007add62dafbasm16595473ejg.157.2023.01.19.12.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 12:08:14 -0800 (PST)
Message-ID: <0e4e2776-c44e-343b-1142-e236e38f35cc@linaro.org>
Date: Thu, 19 Jan 2023 21:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 15/15] arm/Kconfig: Do not build TCG-only boards on
 a KVM-only build
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-16-farosas@suse.de>
 <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ikyLgZxSnBbv

On 19/1/23 19:50, Richard Henderson wrote:
> On 1/19/23 03:54, Fabiano Rosas wrote:
>> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
>> statements in Kconfig. That way they won't be selected when
>> CONFIG_TCG=n.
>>
>> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
>> keep the two default.mak files not empty and keep aarch64-default.mak
>> including arm-default.mak. That way we don't surprise anyone that's
>> used to altering these files.
>>
>> With this change we can start building with --disable-tcg.
>>
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> ---
>> sbsa-ref has an explicit check to avoid running with KVM
>> xlnx-versal-virt has avocado tests tagged with tcg
>> ---
>>   configs/devices/aarch64-softmmu/default.mak |  4 --
>>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
>>   hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>>   3 files changed, 41 insertions(+), 42 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

The previous version was cleaner IMHO, not restricting only the
machines but also the cores:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777724.html

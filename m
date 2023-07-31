Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2185447ejb;
        Mon, 31 Jul 2023 06:46:50 -0700 (PDT)
X-Received: by 2002:adf:f646:0:b0:314:423c:95a3 with SMTP id x6-20020adff646000000b00314423c95a3mr10449228wrp.9.1690811210741;
        Mon, 31 Jul 2023 06:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690811210; cv=none;
        d=google.com; s=arc-20160816;
        b=XELYenCwL4y/eRUYEVR2sw1VwjM2Wr4nGnTAN1juheAdabrSLrF2TikQXW71JP19Qt
         wh7f5eROsCFQslIqSdEl1oTZPEvohinn/lXrSch511p13gqes3k3HAqsT06gjq+rmb7k
         biifi4wJVvtsa3C9Sg7P4RGT2gk5lQplXCCHU05wBno/PJSLDdTWSqCey7gU4MCUICUu
         VOpqPfkQ5iItrvncSiAunn+zFHyY6ggRMVVVKiixEBIm9Qsq1LSBJGSHhl4vcy4tg/SI
         PrZ0E9ijy7zPake4GEpvnkdB1SdakNI2C+GWwxdcxNg12SpnWKgAlWcwFKo56MF4/SSt
         mPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dQ0I3HmeLwdb2CHpthEIho6U8+3evu764gXwyozJFJk=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=FY4xAzKX+j25KKc+VAUZbTZM/oGXi0Lc9kxYrEzqD2vZrYFmArgNPGTnppi/Ft0Uvx
         4aHIlT5Yyh1XzjUfbqHh0xH39Xo6rjhjvEWZmpzjLmRi6VvLXAEydbwHFQUc09p6C2GN
         +mHXvchh+1ZLqpb4fJbS5K4nRa6mIW4TJdUtrQ7tXOpEX5N6OoIw9RpX9xbWAK+l5onF
         yGPDR3ZYaNmF241pUvMPdz8oeQevM07D8KaoILodSV1uJNzFnD6mAo8eXk/pHwMw+bTK
         Kp2PODfwM331a/5OOPiw4Ki125vtJaPGawsra/V4fwMlhads9/JKqIPWmw739bSupxWZ
         /Vtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBIHIBOS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ck2-20020a5d5e82000000b00317618d0fffsor3213354wrb.2.2023.07.31.06.46.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:46:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cBIHIBOS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690811210; x=1691416010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQ0I3HmeLwdb2CHpthEIho6U8+3evu764gXwyozJFJk=;
        b=cBIHIBOSLNObNV9EcCZWuJdAP3X/Yjf8MfPWDJ0xynWkhkAvOoCoeQ3ilBgYosgf0q
         IqixA1oCTZtQ5WZRLM6Sp3mWD4Ei12jQRo8QEZ0zL050VpnJud2f2cbulxvqFnF2LcV4
         TSxyxCWhp2FdO+Y9B37ehlsT6fvVD5nST6ZCzxWjKLAgCIRGzss02W+3Oi+8AjTpNeNk
         iHkpi1tG/V4Yj1avZhXhTcXQJnFp1RGefp/CvNyJ6jEMJppRo9a/3bLdW1VSSIz2X4HU
         TiiLHf+luOys2jBAoJnKgFfCD6u1aYYGd0E9UHSVdh9bwk5HWk7t/ywXn5GqUMjygicC
         YLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811210; x=1691416010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ0I3HmeLwdb2CHpthEIho6U8+3evu764gXwyozJFJk=;
        b=Ja5yHUPV68Nr71M9h8XGyk0D4ehh+5HmZs4FBceWUcQpvIV6ITQgUOSnERSSWSdoDQ
         53NLPBC7XAhljbdQ2MKbZejdC2d7tVdkUO+jsq3mI102AT4zOSqJky7UXWU55VQ3s0Tp
         0FL+JHgMQSL1phPbUk6zCHVpRQrHlbyXza+Lx9bhXSB/umCUNFayVdJ1JS3uZzFvqp9v
         ujZQSm+9e8/wK1U6WvmC17GFff7PFbnUaHOZW6CWn1GN+hHcG9xxDWEzsijXZOsS5Jii
         pa5C/GsSv0fce735gIeUu2lM286oAhpdGbN2WN7FO2wG4Uhsxzw6nBzOKtN5wGEbIE5i
         7DJg==
X-Gm-Message-State: ABy/qLYmEhtz+u/ka1dEG9Rp8irwGJ/6ya37eSVVRKxd1WBu5w1g7Y4q
	sX/Fx2Su2HVCa2j6VGXik4KGnFC6
X-Google-Smtp-Source: APBJJlEGscdCdyrOOjocrIiffHS4ZOgq9nstpeavSp5NQ755reBaDEaDK7cpizfk0ROb2M0X1gS8Qw==
X-Received: by 2002:a5d:4b85:0:b0:315:7f1d:7790 with SMTP id b5-20020a5d4b85000000b003157f1d7790mr7532962wrt.6.1690811210364;
        Mon, 31 Jul 2023 06:46:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id a10-20020a5d508a000000b0031773e3cf46sm13250562wrt.61.2023.07.31.06.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:46:49 -0700 (PDT)
Message-ID: <277b6422-7820-bd1e-74d8-5410d67bc09a@linaro.org>
Date: Mon, 31 Jul 2023 15:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 09/24] target/riscv: Use GDBFeature for dynamic XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-10-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-10-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h7+CEM4pJfdI

On 31/7/23 10:43, Akihiko Odaki wrote:
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/riscv/cpu.h     |  4 ++--
>   target/riscv/cpu.c     |  4 ++--
>   target/riscv/gdbstub.c | 25 ++++++++++++++-----------
>   3 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6ea22e0eea..f67751d5b7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -391,8 +391,8 @@ struct ArchCPU {
>       CPUNegativeOffsetState neg;
>       CPURISCVState env;
>   
> -    char *dyn_csr_xml;
> -    char *dyn_vreg_xml;
> +    GDBFeature dyn_csr_feature;
> +    GDBFeature dyn_vreg_feature;

Similar comment that ARM (dyn_features array).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

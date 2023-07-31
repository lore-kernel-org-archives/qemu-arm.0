Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2189107ejb;
        Mon, 31 Jul 2023 06:53:05 -0700 (PDT)
X-Received: by 2002:a7b:c4c5:0:b0:3fe:f99:1ba with SMTP id g5-20020a7bc4c5000000b003fe0f9901bamr30398wmk.2.1690811584836;
        Mon, 31 Jul 2023 06:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690811584; cv=none;
        d=google.com; s=arc-20160816;
        b=TkZY0PWhEA7r3CguHqTg9oknfiVmKR7hOulb7yA3yQz0ggaVB7eXsL8SxHvUoP1v1q
         SVHVqADnDtUNB+gKQb5ZawWARVfF6DI4KHzJG0T9oE/AoSXRtqeYXFN/kvHSzHC486cl
         wSLVxGagIdwpHGmf9AOQI9wIQwy3Nm6viFTZBpXAfq8S+lPhO0+0xmYThzIxEsD5w4Kb
         MCfsqHafECTVabJq7locD5+y/guGkd0BkHTH7gNTwVmjKCJ20FSEpvvJ5S84Y6uIM0L5
         YI4tfRrHNlCrUBtRIvrvW7Pt8/neG1aOlWEbgVgZRkSh0jen0uJ/ODsCC+hspUzlHaon
         JuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PYb25o9TpeL44fOb3xpjsBI4FbNNQ2EW5i5KDKsqu3k=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=BgJuHx1SubO7HKoUdBhZQTx8vrNpVslxGoj8c5IavUxxB4flEKB4eXIj/uXWdtnn/G
         Uy+PpvRwWMXHbddu6G8WYgm/BhTRq+xVYwA1A/ZEmG8izP1w9EKfzLqYT9ABLO9t2+e1
         OPa+D5j7HYvE8VrFRV2FmOaoV2D/QukIIkhdqAlxNJaUvDHZUWp1/BZZAzCS0QPqYqWu
         8x8koB7BnT2tgYiRfQYJhROoy4lHnJP2kbNBTER8jY3xVoNPz5DD+Sm2PwcoCaBFKylI
         tII9IDmXTfyAgfl6C8ycp1njtBAGuktY4IAgJe3t7seVibAN4sobMDUboEb9/OvnVUg6
         x5fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIjQ2gGS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c10-20020a7bc84a000000b003fe18bd0bd9sor1771243wml.9.2023.07.31.06.53.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIjQ2gGS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690811584; x=1691416384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYb25o9TpeL44fOb3xpjsBI4FbNNQ2EW5i5KDKsqu3k=;
        b=UIjQ2gGSy+jYPBMBq1tldQaAYXTXPs77jNiqJt9CeniXajehblRSvLglG2LmBAccxh
         rS/DQ8I2aTnR4BkmqjBtDtZv+X5/3aYZwMgDzaMVlGtexZ7s1ohv6sZSK3TzNwS5HMGh
         SRU7zO53mpfk4QFnz4Vnd/B1dXMtLfXwyYrq5dgZbJaMuwApTNTlFjk0OfUuSjaYoIiY
         P/O1snTMRLNetDwqWWJxno2IHKPQGGBA8ZSWQaSg3/q68RmDHhFR6SCjjijCo88Fyieq
         aJ6iZ12syciQH3WjKXERI/SV8tH0GNgyInHQlPaZxvIXj7AD7sntiyXQbRiAIUCfcsym
         8Q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811584; x=1691416384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYb25o9TpeL44fOb3xpjsBI4FbNNQ2EW5i5KDKsqu3k=;
        b=KuQ7GcfhOEB+dLcprnrA5aiK1teGoKtPgjDtLQQkhqRaQ9ectdBzuM8NhuDoc/wgJw
         LX78NBIkVm+xuvsmYm487WJ9L59tlu/fqITJ2/If8biu/2ZWdWLFe2H0koagdUv8Hdxd
         MTFvuVKcE9C9JQDUwK1F/khPurr9rEyohJSyZKRp8RoejWHGuULIEMz6WLtrZCzTdUCW
         KZCwShJZPFycLJqGbWZoJrxUdQAjSxObLPBEy+GBmffZmwWN1VnD2SbWTvgC97/6AgBZ
         ZbIhLX2DtqDeuP06seBOKpQ/x+BViNbB8GLSZ0fga0fMzZrBkUmPxOoZc+LgvoKxl0ys
         iCzQ==
X-Gm-Message-State: ABy/qLY7yAutSgUZQYjWi/O+zhSZkMoU0rIaeLnmHHV/5N8qJcYdGsgt
	ceDhhkIfP7cNFYWhy+bUOe32gUmS
X-Google-Smtp-Source: APBJJlFPzk5Nu7U0ttJ6pmM9RL12liha3SjICEr5rZuoE6S/5szC9pKQ6MiH0J0L4j42LA/msmfY8A==
X-Received: by 2002:a1c:ed0d:0:b0:3f9:255e:ee3b with SMTP id l13-20020a1ced0d000000b003f9255eee3bmr9260364wmh.30.1690811584364;
        Mon, 31 Jul 2023 06:53:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fbc9b9699dsm11520994wml.45.2023.07.31.06.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:53:03 -0700 (PDT)
Message-ID: <dc296d6d-6959-c924-b0f0-97d122807d15@linaro.org>
Date: Mon, 31 Jul 2023 15:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 04/24] gdbstub: Introduce gdb_find_static_feature()
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
 <20230731084354.115015-5-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nk2yGTR6/pXZ

On 31/7/23 10:43, Akihiko Odaki wrote:
> This function is useful to determine the number of registers exposed to
> GDB from the XML name.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/exec/gdbstub.h |  2 ++
>   gdbstub/gdbstub.c      | 13 +++++++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 22e5add5b1..3115dc21c0 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -34,6 +34,8 @@ void gdb_register_coprocessor(CPUState *cpu,
>    */
>   int gdbserver_start(const char *port_or_device);
>   
> +const GDBFeature *gdb_find_static_feature(const char *xmlname);
> +
>   void gdb_set_stop_cpu(CPUState *cpu);
>   
>   /**
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index fad70200d8..6d9cef5b95 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -414,6 +414,19 @@ static const char *get_feature_xml(const char *p, const char **newp,
>       return name ? gdb_features[i].xml : NULL;
>   }
>   
> +const GDBFeature *gdb_find_static_feature(const char *xmlname)
> +{
> +    const GDBFeature *feature;

Alternatively (in case you consider the suggestion to use array
of dyn_features):

const GDBFeature *gdb_find_feature(const GDBFeature *gdb_features,
                                    const char *xmlname)
{
     const GDBFeature *feature;
     const GDBFeature *features = gdb_features ?: gdb_static_features;

> +    for (feature = gdb_features; feature->xmlname; feature++) {
> +        if (!strcmp(feature->xmlname, xmlname)) {
> +            return feature;
> +        }
> +    }
> +
> +    return NULL;
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

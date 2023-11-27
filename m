Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp900472ejt;
        Mon, 27 Nov 2023 02:10:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKJkcWdXTi1vdt9eEhnyvEyZF/u9QzaS9JuauN/DAn/Jvoad1q99x6Xp7Gf8KQLo7Ytg0K
X-Received: by 2002:ac8:5713:0:b0:417:a348:3f37 with SMTP id 19-20020ac85713000000b00417a3483f37mr18431817qtw.35.1701079857019;
        Mon, 27 Nov 2023 02:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701079857; cv=none;
        d=google.com; s=arc-20160816;
        b=JP3/74kep6FgaRxB4u67YZxf/QTf5X1T0clAUnzMtCFtdSEbXuq/ej9QNh9Lkedit5
         2clSAkmq2ZddbsIksGosQCLnbxzA3J9oUHGH/t44pv9wniCdBvRj0A9pWe8edPu5ykPw
         ZyERt3CGukE2hHq8ValHCxlsUrq9CWj9odsyBlW44GExrZ3GmA1W0FkxU4Fb2zVptt1F
         mxS5psvsX3IZuojUxejDPJYyy4CfmArMV0nJ1GL59PQFlAZXKqlMl701LJm8ltlhBIij
         5TdZgLqhZiIc3oYneimr+YxvfSIr/gqdLYip0bQ1Alf61FDdUExxy+936fFnhCRGmqwN
         L7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=eSlsrjh3rjkA1fj9eXpWQYTFukp6J7XnYqMOvCcASGE=;
        fh=0qkZlD2Zz/ENHvfRZqYQcUBoTPPmrIoES09Uj4i/EGw=;
        b=ygb8qxQD1xMHjtbbf1j85h3HAlUDmITdC6XSIROOHeMcK6ZSC932LiHZudvwv5F9c5
         efoL+nPIslvh8cXd6M8hntMb2TnwKf+8teI49KyWO0URVj//cbhg8MbjWucGkXBRdNqG
         0AuhI8JVsYWXuF++q7WqmP4elMbt3NZpuOvsr2bcyJ+T0RzDOX/F+HurQ13JfzphUdm6
         oPVxoQIBH39n273+nSrQScBgxyYaiGuKOQJnSFdTir7uCu3e0lVyKicmop4iOkvOIkiX
         OExaHbHREexl8xSoohqbVTMPS+SBMupAWN50J42GYUo9qS/XrGXwi5btN36Sw4UU8vXr
         iZ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ol+bd4bK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a05622a170600b004236d74e060si9116297qtk.416.2023.11.27.02.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 02:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ol+bd4bK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7YZa-0002DH-Ut; Mon, 27 Nov 2023 05:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r7YZZ-0002Cf-BD
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:10:37 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r7YZW-0006kN-9o
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:10:37 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a06e59384b6so504274966b.1
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701079832; x=1701684632; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eSlsrjh3rjkA1fj9eXpWQYTFukp6J7XnYqMOvCcASGE=;
 b=ol+bd4bK0hDRTuxByLdA14pISmBCPcIRcztzpq7/vKKnfHgP6LSwjITAg2Vyniweb8
 yPAiGpYKviYQeNKGG4Zh41QajXeFGc5S+YA5lZgxRcmHDbk5NlsVfDM50LAawgY4mGGc
 YwoHZKuiTBi7ZSWJZxkx+Ex5iiVAb5EJSR6ilumKd5coxbA+Jmhd9vJJWr+7ym/1zByg
 Jxi/Ul1tAokZ2Ld28C8euDSxCI8Q7WJypbWcVGX+lEEoMJKDxeJnNLcrRwxxQ7juCah7
 VkK3SnMbfySeqmldkqRHfI++BpOAZ0VBrJnAKe6RbIGScGcOWGIhTFSby2gtSNVOunt2
 gVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701079832; x=1701684632;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSlsrjh3rjkA1fj9eXpWQYTFukp6J7XnYqMOvCcASGE=;
 b=NQ6y9YRN1N9IHhxiZ29nHCzIaBKMD8MG1ud/+CtZDFOjc3kb/GNHPMJZwaIV1ZRba9
 JxQCjFfrSI5sr2nhHnNeLKHKD6D3XZ3UQLjA+2h5Z2OJLoYkCF556JDpfmxqCuX8WD5D
 VS2Yd+pqPtbBJRlNhyUkteBiKBWhkA5Cu9ceMewjVuXVia8fIARF6auncNLCwRnZ63jO
 4BUKdKKCej/zBy1c7uzLRsNM3MuOL86lEGjtp8sAXRY3NPpRNKDXNOE9UbqGyFK6X2VM
 OXIrmGFefIHfnpaY3U8X453s2prYbrz00aPx+VivIovx33UaA2kek5HVcvD9L/GcKNkY
 a00A==
X-Gm-Message-State: AOJu0YxTZzHUqF54CNZHICrQM8P7K+zUo/oV2lKbZgXdKBtsB3mj10Jm
 wQ2ZeIl6+9Df2mtRyajK1BeFAA==
X-Received: by 2002:a17:907:c8f:b0:9c6:8190:359f with SMTP id
 gi15-20020a1709070c8f00b009c68190359fmr6629714ejc.33.1701079832448; 
 Mon, 27 Nov 2023 02:10:32 -0800 (PST)
Received: from [192.168.200.206] (83.11.23.160.ipv4.supernova.orange.pl.
 [83.11.23.160]) by smtp.gmail.com with ESMTPSA id
 h1-20020a170906590100b00a0c68d3f486sm2553586ejq.94.2023.11.27.02.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 02:10:31 -0800 (PST)
Message-ID: <35c87631-062c-43e8-bf46-67aa3cef5b30@linaro.org>
Date: Mon, 27 Nov 2023 11:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] Unified CPU type check
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231126231210.112820-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z4lVXQUYIdZT

W dniu 27.11.2023 o 00:12, Gavin Shan pisze:
> After the series is applied:
> 
>    [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
>    qemu-system-aarch64: Invalid CPU type: cortex-a8
>    The valid types are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,     \
>                         cortex-a72, cortex-a76, cortex-a710, a64fx,        \
>                         neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53, \
>                         cortex-a57, max

Can this list have some better order? A35, A53, A55, A57, A72 feels 
better than current one.

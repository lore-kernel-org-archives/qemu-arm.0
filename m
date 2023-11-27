Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp902076ejt;
        Mon, 27 Nov 2023 02:13:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfaerKZMRM/LBUC7jr+SbgUkrBL9uGR/Dk50dNrWvPieMHDy+WB87U01k8mqMgCHBkqweU
X-Received: by 2002:a25:8c07:0:b0:d9a:ba4b:44ab with SMTP id k7-20020a258c07000000b00d9aba4b44abmr10224407ybl.61.1701080035619;
        Mon, 27 Nov 2023 02:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701080035; cv=none;
        d=google.com; s=arc-20160816;
        b=pfLqPvA9OlexP230z3Yf0cyLCr9ul3hRrP/7ffyuwohlnvM8KW72ATwOuIhEZCBola
         TIoYHsjFAx0Ct1poXNcFYqPCgqg8lLzSi5pzWNoTa5yTXDwHE0vh/RdrdazcmnWEH5GO
         u6QFrMhEWAAeNFBbQ090WY3CoAieh9O2e77Yi5K4KifrzkT329aNL0VO3tWo0MGuO7n/
         53nQzETSmDho9Pmb9bSckK2sR8yP9jdl1DOHTR7xldRuQp64xTupJ8ryPCpoA2kfkLN/
         q9B/06Q2quDd+nd/oC9z1GGR8ZMG6Kk5SbdK3FxYMIsg0rvDcwPq9vvmdxy4R0HkbX64
         iMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=tyNL8YcIXDoqDeFQ+9aD9eH/uirY1NxD9VXtnLU/H9o=;
        fh=0qkZlD2Zz/ENHvfRZqYQcUBoTPPmrIoES09Uj4i/EGw=;
        b=YLWCrTt0Or+bwqBKrZJIdCkof9bPlhKTA6dsxmWjq3RySDpPiYm6mnGQeaGvqhfbuY
         ebsu3e6g7fm/j21wbb6jTFQDZheC8UbvQKwmFdgFS800oepy2fH5EI66wVUE5OgSijYU
         zJ7Rsil4mxWWW0miq2QLs4FgodXd0NIXiFyC2oTywL71Uhb8Z7AVwwmpJvPV9MIG3AX4
         zVaZYlEXdsXm3n2nuekLXQPP6lQw3iTTg7OWHhTtxlzgtAaPQd+GETpcO+iIvlXGqjHF
         D55LZ+NZIAMAYBiFnMU9GWnQcYFGr06cMnzyiTkq0ahmXUsRTobcz5MEHMZRISEYCX9B
         GO5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AOt6A+zw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed10-20020ad44eaa000000b0067a391a13e8si3366259qvb.80.2023.11.27.02.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 02:13:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AOt6A+zw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7YcE-0003D0-OB; Mon, 27 Nov 2023 05:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r7YcD-0003CT-Fc
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:13:21 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r7YcA-0007HZ-IM
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:13:20 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54b0e553979so2899910a12.2
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 02:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701079997; x=1701684797; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tyNL8YcIXDoqDeFQ+9aD9eH/uirY1NxD9VXtnLU/H9o=;
 b=AOt6A+zwjZjbDmnt4L291WKK5tODx2/mobEHMLYzQ/fM0WJtNis4Qinr8bOfZ8AjkU
 Lorn3I+N5qGyIFLQz1iwWm4bz8WfxP6EkCDQ/8xRduIkRg2IsCaeqi9zebZHYuUGsUMe
 oxsg5k131WuBWA1VFVEhFxq8zO/EBg9RFIWm/rjv6Rnugxj5dTNK5YOqZRueJBSTKfEm
 P8x5tYRhGB2z/VzmyBa8CZEN+jD5FSYpT6d+Sm22UvowYThh5rzpbeRE1WxmEK9qVViV
 1kdhP74wQbeVyQRrJyH2InvBneeE9KWhz99RoVBn0WEKcppvBghmCaGOHy/9S/cw6J92
 j06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701079997; x=1701684797;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tyNL8YcIXDoqDeFQ+9aD9eH/uirY1NxD9VXtnLU/H9o=;
 b=K45kEzhghEaeHdUjsUeTcszCcdrwkgIbEdccIONIikPXclAlv4dvYZ84s+LK8NHpcV
 2IJhKSUwG7lpMjIaszPkBoU7mSLuO0N+VFOwX+JGQPgydRgVKEER0pblZI9/lUieScIL
 VYsh0NoMbs6cLC4k0IbdhZbxAepogSs7GWD5KjF5ZGq0YSmgujf0/IQ+iQfQuPaO1eZq
 TleDTzaHCQdON+vYLzRxwcVlB01njY/p3AVmaN+QKh9wIUMLkFwbyOQFtHNR04k6n4bU
 /4mw0wJEo8b1F17Q74fFBMXfGeBfLyopIemvSts0NWym9sg/DHgmdz9ykGIWpqNIPcB3
 FIUQ==
X-Gm-Message-State: AOJu0Ywmkcyt8hRstZNyT7lwc37MKMMwqBlSpEqtMEMAwYXWQDdGlEs5
 /YE/TNy5NPTVvemAWH8LbMlJvQ==
X-Received: by 2002:a05:6402:3514:b0:54b:687f:446c with SMTP id
 b20-20020a056402351400b0054b687f446cmr2105657edd.31.1701079996838; 
 Mon, 27 Nov 2023 02:13:16 -0800 (PST)
Received: from [192.168.200.206] (83.11.23.160.ipv4.supernova.orange.pl.
 [83.11.23.160]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5056297edu.63.2023.11.27.02.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 02:13:16 -0800 (PST)
Message-ID: <c7d6f212-b051-4533-8b89-6241d28658fc@linaro.org>
Date: Mon, 27 Nov 2023 11:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] hw/arm/virt: Check CPU type in
 machine_run_board_init()
Content-Language: pl-PL, en-GB, en-HK
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
 <20231126231210.112820-6-gshan@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231126231210.112820-6-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: JKsEV4dadd3u

W dniu 27.11.2023 o 00:12, Gavin Shan pisze:
> @@ -2939,6 +2900,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
>       HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
> +    static const char * const valid_cpu_types[] = {
> +#ifdef CONFIG_TCG
> +        ARM_CPU_TYPE_NAME("cortex-a7"),
> +        ARM_CPU_TYPE_NAME("cortex-a15"),
> +        ARM_CPU_TYPE_NAME("cortex-a35"),
> +        ARM_CPU_TYPE_NAME("cortex-a55"),
> +        ARM_CPU_TYPE_NAME("cortex-a72"),
> +        ARM_CPU_TYPE_NAME("cortex-a76"),
> +        ARM_CPU_TYPE_NAME("cortex-a710"),
> +        ARM_CPU_TYPE_NAME("a64fx"),
> +        ARM_CPU_TYPE_NAME("neoverse-n1"),
> +        ARM_CPU_TYPE_NAME("neoverse-v1"),
> +        ARM_CPU_TYPE_NAME("neoverse-n2"),
> +#endif
> +        ARM_CPU_TYPE_NAME("cortex-a53"),
> +        ARM_CPU_TYPE_NAME("cortex-a57"),
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
> +        ARM_CPU_TYPE_NAME("host"),
> +#endif
> +        ARM_CPU_TYPE_NAME("max"),
> +        NULL
> +    };

I understand that you just move list from one place to the other but 
also wonder why a53/a57 were/are outside of 'ifdef CONFIG_TCG' check.



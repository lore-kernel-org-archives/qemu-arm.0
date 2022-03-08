Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2519256lfo;
        Tue, 8 Mar 2022 09:29:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHQ5uYtRL1ppOD+f7VvMsFNmYbucDgG8w1mMjy6ynM3M8SZLIgowD/PkB1pFBBzM2+3TmT
X-Received: by 2002:a5b:50f:0:b0:629:5d05:aebf with SMTP id o15-20020a5b050f000000b006295d05aebfmr6615944ybp.618.1646760544877;
        Tue, 08 Mar 2022 09:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646760544; cv=none;
        d=google.com; s=arc-20160816;
        b=gi9c8xXgGheH8EjY+d+nSXksZ/qb12gD2GJDuQs85OHU8DGJGXoQQdk2Ay++MrG/UW
         b1z859QkeOeH5FY7SkD3iyq8ZXI1djRBtIVINzKOW9aknniN64I2BeMIdNCJbm8wvvMx
         pz17Axirz3cu/84Q+uY7/wKQDijdAOoorsTGz7obwBc/T322LHsJZIGijaeigEEEaXZr
         JbotQ2caKn4CnDbvM9RTCVyb/TGd1TGBZ8c2bqvU7hmEDDyG48/Gb5ntjkYyx2AAlXzG
         +SCltyIQwn31puD2Hy1aKK5mgzPnhIiVjkNIx7Fd/JtzVruvWjv8X72FiYStS6etCJpJ
         BHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Yo6RLMKlExhl4mhzxk7SU7K20iKXhKXw7Ojh6DhB9+w=;
        b=v3vmHJ1znStMlnQqL5ZbxoS8Byv4Y4Srf0u3Iw+JXEXRTrx9HoPZBvg9oaWM3wWbKO
         qQJb2APBmuBrGc8G/9ioXvskCh+jq659DU7BgyWHGPFa0PjFc37QQxR4y0LDtsYDbo4i
         H+UJAKZgg9OUHFUdfUeLuq/Va6M1/+pr2kBZqNRukGujfOmHPkqLBdw61VHd2HktrvFZ
         3b5fiWPTrtsElVkuyUK8v6l1MgB2+UXonZmNSKk3hYuv+X0WyBwEonMBcKLkGgmxOM6l
         ji2dfoJIn+N+QwNNkef2cHD72vxtDqRXBKXYTuum6lHfFDQAEemTsOh11izPxNahQ6QC
         l4Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Zw0y0wE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r142-20020a257694000000b00628757589f7si12632042ybc.94.2022.03.08.09.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 09:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Zw0y0wE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRddw-0003TD-Bj
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 12:29:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRdaN-0000WR-2X; Tue, 08 Mar 2022 12:25:23 -0500
Received: from [2607:f8b0:4864:20::42c] (port=42917
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRdaK-0001hu-JZ; Tue, 08 Mar 2022 12:25:21 -0500
Received: by mail-pf1-x42c.google.com with SMTP id g19so6333736pfc.9;
 Tue, 08 Mar 2022 09:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yo6RLMKlExhl4mhzxk7SU7K20iKXhKXw7Ojh6DhB9+w=;
 b=Zw0y0wE84wQYH/fy0NPciXboxIanJCtXtEPnLNoTmyI6nO5Ojg0dBde31w2BhsYn3D
 3nDogmK6OvL3RKG3pJlf9rdmoxOHPykHaaRvbyXZELGevNuC3MgOtamRTGiDU1fGv0VO
 n5LHpNXEOAEl0WuVFTBcawfjzlXKkW1aufd9kiT/IQZXcj+XvZ+oLY4r/sjYD++ySXPc
 ylKIkopqNpNNKOQ0kOK9yB3rSUKX5I7tWSZqIxEX9e8aLU1g457LAFGV1/xASqNvsaMu
 wWP7XGxj24jvimn0Owj+QUo4QCnTRVO3Q1ZBwGTaPue3vB1F4xvvsx1HvTj8RuBYUMxb
 86HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yo6RLMKlExhl4mhzxk7SU7K20iKXhKXw7Ojh6DhB9+w=;
 b=vEqcz7EYswAXQlRrivKGKkHsAa6rdqsVgXMg3M/vF4Lm6Io/jfwjI5AlWyyymVe+Rw
 U103sC0jZa7kr+9QM0CMBRpnFf0m/BEBG71SqfJxovQECMqBH5ajugTPTjvEqjDHjZ5Z
 SF5q29hfreTBbdMOB3f0x/GCWZoOVx4WrPh7J+6rPcsHN7Fg7DpVp+Xdo1x7dv5NJPRM
 BoomKjcet0o51jEo3CIu57RBc+tbq3aSpXhKayHhvZIKZSPOanOSnvFytMtXSLHkiwdG
 XC/OmdySUCEFlFkxpHPHYR1qenyufwsYn9L4KRK1rykBYaKcVDXQHilcFkhp6IG8SreI
 /9+Q==
X-Gm-Message-State: AOAM531IQ0Q0XX3U9d/g49VOpYpk2kADnpbHcclp4zzwDkaPvTDE+5Ru
 sHVa070y46Mz67f54avaLU4=
X-Received: by 2002:a63:5119:0:b0:37f:8077:ae15 with SMTP id
 f25-20020a635119000000b0037f8077ae15mr15340956pgb.11.1646760318650; 
 Tue, 08 Mar 2022 09:25:18 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 x9-20020aa79409000000b004f704d33ca0sm7800442pfo.136.2022.03.08.09.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:25:18 -0800 (PST)
Message-ID: <d8f38bf7-7e85-3c4a-046e-91a8f51edbf9@gmail.com>
Date: Tue, 8 Mar 2022 18:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220308150207.2546272-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308150207.2546272-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +5ZW3e7SBwda

On 8/3/22 16:02, Peter Maydell wrote:
> In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
> own class struct, but forgot to update the TypeInfo::class_size
> accordingly.  This meant that not enough memory was allocated for the
> class struct, and the initialization of xcdc->read in the class init
> function wrote off the end of the memory. Add the missing line.
> 
> Found by running 'check-qtest-aarch64' with a clang
> address-sanitizer build, which complains:
> 
> ==2542634==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61000000ab00 at pc 0x559a20aebc29 bp 0x7fff97df74d0 sp 0x7fff97df74c8
> WRITE of size 8 at 0x61000000ab00 thread T0
>      #0 0x559a20aebc28 in xlnx_csu_dma_class_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../hw/dma/xlnx_csu_dma.c:722:16
>      #1 0x559a21bf297c in type_initialize /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:365:9
>      #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
>      #3 0x7f09bcb641b7 in g_hash_table_foreach (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x401b7)
>      #4 0x559a21bf3c27 in object_class_foreach /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1092:5
>      #5 0x559a21bf3c27 in object_class_get_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1149:5
>      #6 0x559a2081a2fd in select_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:1661:24
>      #7 0x559a2081a2fd in qemu_create_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:2146:35
>      #8 0x559a2081a2fd in qemu_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:3706:5
>      #9 0x559a20720ed5 in main /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/main.c:49:5
>      #10 0x7f09baec00b2 in __libc_start_main /build/glibc-sMfBJT/glibc-2.31/csu/../csu/libc-start.c:308:16
>      #11 0x559a2067673d in _start (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xf4b73d)
> 
> 0x61000000ab00 is located 0 bytes to the right of 192-byte region [0x61000000aa40,0x61000000ab00)
> allocated by thread T0 here:
>      #0 0x559a206eeff2 in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xfc3ff2)
>      #1 0x7f09bcb7bef0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
>      #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
> 
> Fixes: 00f05c02f9e7342f ("hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/dma/xlnx_csu_dma.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

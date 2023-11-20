Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp9814ejy;
        Mon, 20 Nov 2023 11:43:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHqwWNL2JpF1/qH34QnphqmOuccNpFzzAUKGz1Nzj+7aTe9/DGjscMTApL4uTIu/VGfVl7
X-Received: by 2002:a05:6102:4743:b0:452:6178:642c with SMTP id ej3-20020a056102474300b004526178642cmr6667517vsb.1.1700509419674;
        Mon, 20 Nov 2023 11:43:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700509419; cv=none;
        d=google.com; s=arc-20160816;
        b=pKURMhzKQuLc3aAFZoPQd9QAgBOn1bmU6Ek5vw3X/txF1H68n9jeplYzaU7ztiOpkr
         jOp4s9LxLaOGbnQBq3nXnDQwzVw2uFpStmWxfbkygP0N33JoRNanQLjFbry7f6090txK
         VVkH2sSGlK4gvpzpuRpe8JNyppwqASUK9OegAeOis84DEMAaCDFmoBswNSWLK73AC/Q8
         VNlhqJFst+rNw7QOtj0vnVJ5Cn8fQZKIgAg+JWJpzyd5vvgXRK3VD0LmMsXNKFO9jlB+
         nFxNNCblJ8Jdi8L0P3WM1RzVZelaPv4FZ1jCyc6lpg54+mCbu3wz9wM+FkgdwbAIdFK5
         lsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=bHJWYgO21Fl5OFrQpFr8Mpr/ZcYte6sL6+pCQxc4KRw=;
        fh=X/LLdiXosT2hMLn06g2y3lD7SBe2Tu+jA5NEvBscNnY=;
        b=w1Cz1wTzsQScx+jgQugNruS7HvzvkBT2adaUGwbbetTDawDgof5xPiDB1v9mHJ6+C3
         fLmApOAexd+ZNxymmXmYaq2+EAUiC0P1j67+tgNLfW5g6Nncpm+u8WaRQC9tajeE4cYU
         gmpg8OfWTQWfPz+bIYEapOnZ6e5OiGwiFiRj4lQ1wpxUidKrAG47GROdDXT/vNvxcLEk
         9y++tsEEs4z/8Jniwgb9hw6N3KTN1hbmax9sIFTq0Yzx0erIqEbtkm6Tj2F+FTqXOBQv
         7UuQH9KIZTnwWyqDjUv+P7nkaAHXyfCTXRGcII4xq2gWa1ZVZT9Oc7nK6CchKxiXi3Im
         Dznw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gc7FV84j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020ad44bc7000000b0065b086dcab8si7579745qvw.457.2023.11.20.11.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 11:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gc7FV84j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5AAn-0002i2-3k; Mon, 20 Nov 2023 14:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r5AAm-0002he-Gu
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 14:43:08 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r5AAk-0002q9-P5
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 14:43:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so6199304e87.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700509384; x=1701114184; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bHJWYgO21Fl5OFrQpFr8Mpr/ZcYte6sL6+pCQxc4KRw=;
 b=gc7FV84jcDy0JVOoCYOaLqN4wmZlXboltwkAhpyhSF6if9aPa6Up8e7XPLG7yCy4C0
 Ir1UqPRy+IZTeMTh47oycRcxj7GonAyrI3kaeP8yK8KgLHjwDS9iNYOrVO9BcFasPIQE
 syeIA3t5AV3bQXll4AtxnOjsFkm+KKFToHIuM0YEazBof9QkTCnfsqo/zdYMPs83BvpK
 dm3OSZwDrffRHJbgLMepeOwPlbMWriOg7sEyzCT78ejuMtvpx6Bsw1HKjXWHHYkqP/7t
 np/JXvlVxbogDjne43gRjfw2aJ9QUdnQd1EgkrkJkoo3UNjMq8dUetQ3lJuuQoox7a45
 BJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700509384; x=1701114184;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bHJWYgO21Fl5OFrQpFr8Mpr/ZcYte6sL6+pCQxc4KRw=;
 b=Uuf+J5MeXv1iKMB7lV706w3PlaKtVtL59qpIwxWYkTipSro6VO7asb/Iu5oZlLdBRI
 N1xYnm2gQvQ1PIpZeoR4Bnr5eobi4tIH5E7J9hh6iQ0Ab1XPh+ughwEBwyw7Yajk+yVr
 MB7Y0dl/D1grhzrxwvgDvmcIUM7vTzLN+A2Z5ws8ftJ6RM30v9uBZSTcOb3/veKTgmk0
 RjlOhwFN0Z8jTE7T0obqTrrgfZFGgrz6eVGwXZobkbSR2ZEj31/r4UqGxgj1sm27povv
 gI5JFMJFjGQvOR6dtqSqIpG9lXM1o1Be7sJg7vblDBNpJPvZ/1HFmQvFkLD072Kq76Tt
 UeVA==
X-Gm-Message-State: AOJu0YyFKvpkzmhnlbTy8+KUTjeBYZcqPSSsELm+4nu43ay2ybmOiM9D
 NO+y3vmdDWgn25kZrBfp3iQPGQ==
X-Received: by 2002:ac2:5486:0:b0:505:6c99:bd7c with SMTP id
 t6-20020ac25486000000b005056c99bd7cmr5839767lfk.57.1700509383932; 
 Mon, 20 Nov 2023 11:43:03 -0800 (PST)
Received: from [192.168.200.206] (83.11.8.194.ipv4.supernova.orange.pl.
 [83.11.8.194]) by smtp.gmail.com with ESMTPSA id
 j19-20020aa7ca53000000b005488ae52752sm2275111edt.18.2023.11.20.11.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 11:43:02 -0800 (PST)
Message-ID: <8a386258-1a5b-4c69-972e-49f9d1e59f51@linaro.org>
Date: Mon, 20 Nov 2023 20:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] Unified CPU type check
Content-Language: pl-PL, en-GB, en-HK
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231120002724.986326-1-gshan@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uxpXO6wS9Dpi

W dniu 20.11.2023 o 01:27, Gavin Shan pisze:
> Testing
> =======
> 
> With the following command lines, the output messages are varied before
> and after the series is applied.
> 
>    ./build/qemu-system-aarch64            \
>    -accel tcg -machine virt,gic-version=3 \
>    -cpu cortex-a8 -smp maxcpus=2,cpus=1
> 
> Before the series is applied:
> 
>    qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported
> 
> After the series is applied:
> 
>    qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
>    The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
>                          cortex-a72, cortex-a76, a64fx, neoverse-n1,
>                          neoverse-v1, cortex-a53, cortex-a57, max


$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu cortex-a53
qemu-system-aarch64: Invalid CPU type: cortex-a53
The valid types are: cortex-a57, cortex-a72, neoverse-n1, neoverse-v1, 
neoverse-n2, max

$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu sa1100
Unexpected error in object_property_find_err() at ../qom/object.c:1329:
qemu-system-aarch64: Property 'sa1100-arm-cpu.secure-memory' not found
Aborted (core dumped)


Similar with 'host' or 'pxa250' while QEMU/master does:

$ qemu-system-aarch64 -M sbsa-ref -cpu sa1100
qemu-system-aarch64: sbsa-ref: CPU type sa1100-arm-cpu not supported

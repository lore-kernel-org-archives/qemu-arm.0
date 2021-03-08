Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2037062lfg;
        Mon, 8 Mar 2021 09:33:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziNVCZqAhAysj2Wu/64LOmNutQhbECT2qXShs1/kX6Fpm3vlgVnoH1AteFr40ieEdQFqwu
X-Received: by 2002:a9d:17c7:: with SMTP id j65mr20869413otj.116.1615224819964;
        Mon, 08 Mar 2021 09:33:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615224819; cv=none;
        d=google.com; s=arc-20160816;
        b=PV2kOqgIw+k9H4rudXt1jZfIKXHwaxTyJm5w/ruTP5nzvIFOS36Nt02c51um0eXojb
         KczF4l3dd9q6FuwH7peVJIWiMjvIfgUxn8V6sa8nEgQUlxBnbAXjqmS1wEuWq2W7OoOJ
         kKxt7QiB8vC40+4i8xM9iuIhrjATBjVuP0h+HjAiuVGGUDe7Ehl7JASe6e6c7pZDc1rh
         ZYq5ZU1qvOGiI5ks89oOYZe+KPPQWV6o3CGKTp0BPNeP0h1rrIFk59vA2EKSU3rcvHKv
         W/oeHWyksMNV4OWVdmD6ny37T7CkMEYDdfEDItaqebO6ISxsFD4N3U5mctB+UT97qwAL
         RWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eqEAVHhKJIhXGbOs6NWemQDC8v4aBYn9Ws+uma5LFJA=;
        b=Gts4368k2fUBHNL04PGw4VwmavhEZRJN8wWLgpapdXBu7Wes4GptB7h5Cvez6pWbk2
         1JNuxhsoKuGFS3Wn3TS+jTMuhSUmm9TcyxbNP5U4I4dSYN/FTsZ6nUYE4HZA8gOPBSMW
         mKSfdzQncaRjwAncW4tXIjWsiT05LX3vjz0t97+RXz4Chb0RttYvvJKeue/yLsABKES7
         8C4Cg3C7nOXj1Lvu/Ehp2y/vhbmvlNeWZ5A0zRSzoVWh06nM+A5cyCHdQhnUtxnst76D
         kqVv5Kr7rNBvvTcVj+NhgPbmAVfTryyXzFmizapmEucVlsiY7WHQ7yxJ9nthXIpZzhdi
         Y3EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MzfyNzDI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si10086325otp.295.2021.03.08.09.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 09:33:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MzfyNzDI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJJlD-0005xj-0N
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 12:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJUB-0001px-Oj
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:16:03 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJU9-0007oj-U7
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:16:03 -0500
Received: by mail-ed1-x530.google.com with SMTP id m9so15841730edd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqEAVHhKJIhXGbOs6NWemQDC8v4aBYn9Ws+uma5LFJA=;
 b=MzfyNzDIbYtNlrEqCez4tSnUyFzniUvt6I2lnpWOFSu1ye0hEP8h3+Uq5TO8rDocWX
 Usc5QjgC6gt9SLJVLD57kcMnchBLcfhb+0HD3AnSuJ5ghbtdGtFCi34/hkk9VQ+GEsii
 MWMlz7NiHBVGo4SDrz7AoorYijPBf0rYPUsTe5B1PYZ14Uvl8y7hW/UwMf8II7FH4yTw
 mbkjn4VYDst9WGBked3fGnXHzoN1S4llKjcUuEKh57g8/uXjha0JmN5UueONz/GfjsTf
 6ED1PtbWKqXgAg0eeLrnvTyupvPY8bbSh/jPHkhagvMa4uLk5+roNuECbQpD3E9FpUTa
 KpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqEAVHhKJIhXGbOs6NWemQDC8v4aBYn9Ws+uma5LFJA=;
 b=mIuVDVHjozyeIOOn61dgt/tkpA5Zo1kasFTIP9YMHKtTrV/7iCE/HRFQBvd8K5RZbC
 m9jJWJG42qPCudVc9nGAnOWIbPDgWZzhs92roSHRNkKFJb8lbUQI1x+EkrAQQYemYdSY
 tS2Adwm11293ZT8Jr3YvV8QAH7v3PkIV54R9LuUtjePzR/dy6uM+hEjb+oqu0A2S1CB7
 r5gr1p6SF7uhWJ2nBq1zXx1TdT1PAby6N8E6Wsw8w4A2BeNtZm9rILRNwd+EKQAXgpGA
 XJsV9rXJXnUnoto39MjlUZGGYgm7o2G5ot4arnIVMzZICuOXlEDm9oX709t3j46hPv/z
 +2IA==
X-Gm-Message-State: AOAM530sp9if+HxbOeig6qOOSMb0PsZUpAZP2AqzH1A1+PcbbzNvLHPC
 5Fz+TvV0FPfXmkTMKGQdxeJdnGJzNw1Ek47UrIlz8g==
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr22939974edr.52.1615223759740; 
 Mon, 08 Mar 2021 09:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20210303135254.3970-1-bmeng.cn@gmail.com>
In-Reply-To: <20210303135254.3970-1-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 17:15:43 +0000
Message-ID: <CAFEAcA8BUZ_WFqY2RpcT-UX6f7Sa4fr2c9YG6Q3yTPem=ZRwfw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] hw/arm: zynqmp: Implement a CSU DMA model and
 connect it with GQSPI
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NydPF7Oh/0EF

On Wed, 3 Mar 2021 at 13:53, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
>
> We added a Xilinx CSU DMA model and the implementation is based on
> https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> and the one in Edgar's branch.
>
> The DST part of the model is verified along with ZynqMP GQSPI model.



Applied to target-arm.next, thanks.

-- PMM

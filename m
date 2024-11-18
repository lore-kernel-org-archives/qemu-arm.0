Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2490247njc;
        Mon, 18 Nov 2024 02:51:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgeVnWB4wZSX8aI5HYR8IdRmXfQVHcw0lJSjpioNVUNlE2XoKaAyWNBwREosfiCipNV4hc1SD5rTq8iQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFL8WwsO9JkR56u18KxFQYbXKwZRBgtiK+1gvdx/O6bbUu+hBD2EkhVOdyc8z1R/okYRRwk
X-Received: by 2002:a05:6122:789:b0:50c:4707:df0 with SMTP id 71dfb90a1353d-51477ebdddbmr9867411e0c.5.1731927079402;
        Mon, 18 Nov 2024 02:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731927079; cv=none;
        d=google.com; s=arc-20240605;
        b=kFnZ5HVNYVb2H5QlLIpjpHFTTbwLGuzruMe9rHZtKKBoOvLIjvVNWbGGydNm/k7Lm9
         1yTBTMxcV0Ng09MgwhmEuniUF9RvdjLlUPEPaCeOFWbwT08pHYEdHRImyGGB7Ib1u0HD
         pEYJM00fhFcHxrwoLS+FBliu3u3NCCMr1q5q5SqTKL58eihJj27nLkSPI8YBlVZ2SIti
         JbgDhi0dOJSUbLvE9ivt8Ijokz0v6T0WEmuVIPYVvBSpmW6odaYouuAkjvY0FQ1nUzBA
         zSdNovI9mqn+sQo/0tEpTtXC2kfg4dBLBDZrbyQpFfCUE7Md/MoYFKhIuKwz7Op4/J2m
         VMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BjIpXdJcBnpkIS3y/7dWnS6mu/+GbemIYhKA507spWE=;
        fh=RbTTl15wt/BAqsJ10rtsDOQwU/wPZU1M6yuOqqP5lDE=;
        b=ORPHDYTx2sYggL8j+ppOEW3b4I7P3dnzPKJMMrhFglV37DJv5YYhDCJWWgD2n7ur2P
         YWcDvsgUkGdze73yY4B21UoMtXP450qGTdHOhUPtA0ISMZAYTPokUqyXEjcJtJ8zSCws
         deDGtC8M4BoPHB/yG1++QsISW4+82OrUk0tp/TDwx4epDZr4tRH6DEvuYWlS8gkV7/6X
         K90uSjsqGCAjsjKSFmxK5k//h8oejgODlEyASNTJuZos+6MS9B8uSj2SV9LXNTtsVCyl
         04AMkRN+vO+fR18vRqFXvpenZvvY5ITZljF7LdXrSt1ba7xRQsVoU3CSrFDgMlM5cBHv
         HeWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eBnXvJL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635a98731asi101423681cf.98.2024.11.18.02.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 02:51:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eBnXvJL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCzLD-0008FC-Px; Mon, 18 Nov 2024 05:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCzLB-0008Ed-Au
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:50:45 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tCzL8-0003s6-NQ
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 05:50:45 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5ced377447bso5956596a12.1
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 02:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731927041; x=1732531841; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BjIpXdJcBnpkIS3y/7dWnS6mu/+GbemIYhKA507spWE=;
 b=eBnXvJL2R4shg7+5pvh2TyGjr7mxM9b5gBDyTAWycnwhXL1ic7l1F2bcvYmZl3S2YS
 Rj895uJ/zGbq7RhftzDINfuLVmeLqKNY9IEbSJ46+tmPlfR4jjwJ07ceYuHLKeET+ZEE
 I3npZT8IXFBS0cEaEF7dFKOiVQ/2jJssZ93vUE7MD4Qb4Bc1C2NIp4sAew1ymxi7pTnV
 jfqQTEUz6A1w6DNZrB00JJDhBN0nctcqdPn7fvky11ts94Q63vMEe3WaYdG/wA1S0DVY
 iLZGqQXyt55l+D6hwDo5YXFlCO/naZiA5N5+rRgd3+1exlc7UCJmRzqSi46+4PfA66VF
 nwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731927041; x=1732531841;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BjIpXdJcBnpkIS3y/7dWnS6mu/+GbemIYhKA507spWE=;
 b=rQs3DU2Dy3tJkSjYj5/Jdgg0ddy34842ky2ZGFehu/mddHQB23zI0qMRJ9BHLDce9l
 POVFuoG1+Q5sbm8ltvhH6hZPh7/PR4TN3owcmUyE0EMHwLNKugboGFHWu096UZV9AY4g
 fYjiKwHHTMnUi2YD1gPH/cbei9yMPD4++x778qfEX0XnLr66bwpsFVhg6m1QgjZwFCqt
 H/wJsY0i9gShBmQamVrRICkQ+4sfdPX9UHWIyov6L8VxWvdltsLxjONI9UfzF7V78+rv
 lqRv7ZSbiwwKPZgtB5IMXbTv3i8YSaFMSDYbmYFgnRFfCXY7D6xKMJyeK/Sf3FI4hHNh
 UE7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoOM8klLXTmUguGlZKr6oNluj/SFNG7JqT6gOu7H8pmfF9iUTaPaO10Veq5ZBzbxpeM8LfEbW5+A==@nongnu.org
X-Gm-Message-State: AOJu0YwjWfgUUZeKLhMQOxv5og2ZYClC/aePHzFmwaYyaQiBCS7fgkEj
 W5J3erm0toNJK3i6Ln6n2hEdHV4dWYylLn2edDlbjBthovYSTzNu4oawHBmWvDM715QYY3SK3+m
 ilnx9SVruz04IpD/oh4tLkIXH/3QJKYl1BoZGWw==
X-Received: by 2002:a05:6402:13d5:b0:5cf:85d:843e with SMTP id
 4fb4d7f45d1cf-5cf8fc54192mr8540296a12.4.1731927040846; Mon, 18 Nov 2024
 02:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20241108135514.4006953-1-peter.maydell@linaro.org>
In-Reply-To: <20241108135514.4006953-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2024 10:50:29 +0000
Message-ID: <CAFEAcA8Cjdg=SbXb9icdrOJgSxiUk3xt=C78Kb=dtJzeSh4QTw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/intc/loongarch_extioi: Fix undefined behaviour
 with bit array APIs
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Song Gao <gaosong@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0fKNV+4Bdy4q

Any chance of a review on patches 1 and 2 here? (I guess I should
have cc'd qemu-arm on this, since patch 2 is for GICv3.)

thanks
-- PMM

On Fri, 8 Nov 2024 at 13:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The primary aim of this series is to fix some undefined behaviour in
> loongarch_extioi which you can see if you run the functional test
> loongarch64-virt with a QEMU built with the clang undefined-behaviour
> sanitizer:
>
> include/qemu/bitops.h:41:5: runtime error: store to misaligned address 0x555559745d9c for type 'unsigned long', which requires 8 byte alignment
> 0x555559745d9c: note: pointer points here
>   ff ff ff ff 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>               ^
>     #0 0x555556fb81c4 in set_bit include/qemu/bitops.h:41:9
>     #1 0x555556fb81c4 in extioi_setirq hw/intc/loongarch_extioi.c:65:9
>     #2 0x555556fb6e90 in pch_pic_irq_handler hw/intc/loongarch_pch_pic.c:75:5
>     #3 0x555556710265 in serial_ioport_write hw/char/serial.c
>
> The underlying cause of this is a mismatch between our bit array APIs
> in bitops.h and what QEMU devices tend to want. The bit array APIs are
> historically based on those from the Linux kernel; they work with
> underlying storage that is an array of 'unsigned long'. This is fine
> for the kernel, but awkward for QEMU devices because the 'unsigned
> long' type varies in size between hosts. That means that you can't use
> it for a data structure that needs to be migrated between devices and
> it's awkward for devices where the bit array is visible to the guest
> (e.g. via a set of registers).
>
> In the Arm GICv3 device I worked around this mismatch by implementing
> a set of local functions which were like the bitops.h APIs but used a
> uint32_t array. The loongarch_extioi code attempts to use the stock
> bitops.h functions by casting the uint32_t* to an unsigned long* when
> calling them. This doesn't work for two reasons:
>  * the alignment of uint32_t is less than that of unsigned long,
>    so the pointer isn't guaranteed to be sufficiently aligned;
>    this is the cause of the sanitizer UB error
>  * on a big-endian host we will get the wrong results because the
>    two halves of the unsigned long will be the opposite way round
>
> In this series I fix this by creating new functions set_bit32(),
> clear_bit32(), etc in bitops.h which are like the existing ones but
> work with a bit array whose underlying storage is a uint32_t array.
> Then we can use these both in the GICv3 (where this is just a
> cleanup) and in loongarch_extioi (where it fixes the bug).
>
> (There are other uses of set_bit() in the loongarch_extioi code but
> I have left those alone because they define the bitmaps as
> arrays of unsigned long so they are at least consistent. I do
> wonder if it's really OK not to migrate those bitmaps, though.)
>
> thanks
> -- PMM
>
> Peter Maydell (3):
>   bitops.h: Define bit operations on 'uint32_t' arrays
>   hw/intc/arm_gicv3: Use bitops.h uint32_t bit array functions
>   hw/intc/loongarch_extioi: Use set_bit32() and clear_bit32() for s->isr
>
>  include/hw/intc/arm_gicv3_common.h |  54 +++------
>  include/qemu/bitmap.h              |   8 ++
>  include/qemu/bitops.h              | 172 ++++++++++++++++++++++++++++-
>  hw/intc/loongarch_extioi.c         |  11 +-
>  4 files changed, 194 insertions(+), 51 deletions(-)

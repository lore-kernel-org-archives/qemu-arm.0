Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2780941ejh;
        Tue, 6 Sep 2022 00:21:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4EMLBV6fXpbj+GJd+I1FsqF3rLJPGfHCUO/0AWdxXBV2fjA1PHLWMbPas3dBGi9yUN0trQ
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id v16-20020a05620a0f1000b006aa318e55a9mr34416258qkl.559.1662448869916;
        Tue, 06 Sep 2022 00:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662448869; cv=none;
        d=google.com; s=arc-20160816;
        b=RBX0AWa19p5OeotvW3Is2QUfnrKJa34C7uLinkTYzX1KtCbskOY5Fo/rDNrXaAo2Ua
         ZCWE4cj43GHJ1DjzykgzlpNmzI/n8EFfpWlyh/2b1Q7wPFQNVl1OQa+HL6ievZdOdiE0
         AliF77Ff9GErVIrKmvBb63ZhKAawIQXQ5thxx5ip6Ii/ny0R+cV98xqUuViKOApyae9y
         89XZvSmZQuEJ/7cscdBc+kSoCnU5HH3lUsNbbuQRClrLmtcWcpp/ZdqrWCQLui3SCc8z
         qI0FTVcTNkqmWYpUvZdWNXgc6jj9QEdo/TwqujtiylQw+e5gjZWBUnhbIV7cwwvP0Wx4
         +EEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
        b=G8TnGe5AvGMz2k4m0DXbcnWsMJtffzrz07CKxZi14xFJGvheWBmRkJvchvf3Z33t3k
         +GQev1+p9/O0/LtUqVEmP33RWOaHw4EcF0S7HDS98cLca4EQ/jqK45BBgHTAxc5aQWWT
         im6F3GUj92bRx0zvhOl+iF7ZZD5koT2EeLqo/Bxf35vpVtr7KAD5h3F+NRE3M5cSUAnN
         DjxjaWJ7UxWx9UZDpkfLIOeKOMu7vpwUXQqpKVoHWFIPh8tTQ9ST7Itbcm4T3j7QODnN
         2msHcQS8N9mBn6VCqkapb8LJ/NEBhD3YClkSV2G+0p1G5H0SMQuB9uo/03HyI0AXnPdq
         4KIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Y9O0JFch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac80607000000b00344580ed1c9si6485361qth.212.2022.09.06.00.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 00:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Y9O0JFch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVStR-0004ZE-Eq
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 03:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsu-0004Vw-G8
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:20:36 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSso-0001D1-Mk
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:20:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kk26so21103938ejc.11
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 00:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
 b=Y9O0JFchG56VAmiyoyreYkBOwI1dgwZFKLQWQ0YQ8E10ZCPVbQ4RBjtvtjfUkxFV+E
 Ryaz146Vr8Mc4Y/HQqXLx1GBpFaOjF5osmJuv0DLiz443zNdmY2jJdfYXsshGMeBooIe
 GhD1UZaELQhA8MOVDXQnb46hQcyxGXVQrorevf3qAXm/OmUd3xxUOHkPquDB9+PFpIWV
 xP+IEsYzpKKRZM1I5SPPcUrn4AznO7pGC5q1KJI/wQ0nol+5yzyQuZFJVFA+Zou1P7Oj
 EiigQAsHeRfEei/D8aK/2zS9t9vz4CMwMJfj4cgk/2j8kAr2waqCo9IJM/6AS2vITo0S
 OkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
 b=2KJqxy6y/4em4MS7oqKu0BSYddewb45E/XzdAb1dQEsIMcz5xC1eWhDBfrk0vqeP+5
 pYLz6V4/xVqRvca1c2rIQf7OtnQg84sGkzoQsdIXv5XL7t1n6pvr9TAZAFoDFmITmcLQ
 YIlTDDVert9vi3x9JZgiHZOqaCkCF2xCQ59corayRJoeTWxXqg72ekGAp6a13WMPXXBn
 sAa4VfTi1agrxtdawiRZ5/hkUa8dEaf9q7cRS5wAwRPCBc4Mx3YFWa0hCtMt/agKqzAf
 +3SIKm5dow1SgcKXaheEbtIj2biaTdYontQPUmDKOf2D0hK+i8X/jb4zM4LjKoyWUgpr
 edWA==
X-Gm-Message-State: ACgBeo2rVlsabvQyCmVmE/iOmHDFCB1BWRrMjbKcfNatmjQ8MMN8yBzm
 AiJeyTYkT2au2Zo2fJ1Rn86ESQ==
X-Received: by 2002:a17:906:5a5a:b0:741:559f:f539 with SMTP id
 my26-20020a1709065a5a00b00741559ff539mr31133000ejc.3.1662448828342; 
 Tue, 06 Sep 2022 00:20:28 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a056402348e00b004464c3de6dasm7891373edc.65.2022.09.06.00.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:27 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:20:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V3 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <20220906072027.fbffz6ztdukwvsvs@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-2-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nWkqMGqwdlu7

On Tue, Sep 06, 2022 at 09:54:49AM +0530, Sunil V L wrote:
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>  include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>  4 files changed, 53 insertions(+), 82 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

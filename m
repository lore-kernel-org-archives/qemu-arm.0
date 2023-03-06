Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4662550ejc;
        Mon, 6 Mar 2023 05:49:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/BoEwTCBN8zwVWMm+69n4byIfMKHVUNhM2G/tMHmnPvpWNBNG9hUA6e1DfSnpnSj20dZDS
X-Received: by 2002:a05:6214:501d:b0:56e:b04a:6dad with SMTP id jo29-20020a056214501d00b0056eb04a6dadmr20088740qvb.18.1678110542496;
        Mon, 06 Mar 2023 05:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110542; cv=none;
        d=google.com; s=arc-20160816;
        b=dkHBCtH12A3uRIOITk8EtcVSRevyLcjRQsci8SMjkT88wiCp9WSWEA0o1WE5u5qH2c
         KmgjfEtLiQkMn6gngfwVllju1wAZzV705Lk/llzPjVC/y7Bhi20ZyXAbloefS9PUUJkR
         QqhPE4jXqSv+cz3vOtzvrXrc6pWk0otzVuUzoXlY5nd22ukjPw0TblI3kmozOzjvoRrM
         aaW2GBpowGBaNpNZoiUNj04gUCRhJwakxvwtm7aDV0HrMoublu02JGtdoZ67VTLfIW5v
         6T9pWQINaXIPxn3AVgRbrGOMgaRq3Yy9kGNXEnPj/X9wTmXSIYlHSUoYNCzqTvIxADBZ
         /Z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bY0W063cVUeBO6Zy5flXsy/MS0XG4b0EthfuVGWoFXc=;
        b=N2etIBKT6VnHYdb9+tqZNidITLOBsQ0huxVsvlrxX1xkBculTS7j/U47/Gqtl+niig
         vtl9/mj41IA7Iw54XoRWGTCXapo7UhL1JQ9L0X/ndxpCQLhpXgxfsbLbZ9aOyCVjLOvh
         D4Nv9UNfKb4GEcBfD0eAsyw+T/Cb56q1LBy/AL3l4NvdE52JFa/lG4IFdUnsMjpgEQ88
         EmZjT4+4Q/l6QeGjiCRdSAZKHnRR9Z34c6+/s+UXkF4hIi93ktvAkTWCIe4J7Ny+7uut
         vzASCU2mqxirEO+DXshEcXPs1550VX+c+4Z/CXNXIuGXwkyzXDXF/T3BikSB2U07rc5N
         6anw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WqUKRhGA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k28-20020a0cb25c000000b0056e9ecb0e74si6930399qve.105.2023.03.06.05.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WqUKRhGA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBCU-0002ck-A2; Mon, 06 Mar 2023 08:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBCQ-0002c2-Cz
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:48:22 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBCO-0003bI-Tr
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:48:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id e13so8844141wro.10
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bY0W063cVUeBO6Zy5flXsy/MS0XG4b0EthfuVGWoFXc=;
 b=WqUKRhGACjXDM4/x5e5Wk5wlU5XAyGwbDvc3p5i03Y+x5+BrLaO4JNkCrTsGadVXly
 x1nHp0tic5cp/h5OO5CQRtBTuka86wLronwowNj9qhZGmnQ5t8ieM9nY4ELyNvurGTKn
 dxv+2njFo3IZAcrFjMC0x5/rjxcadPsL9Leu9nO9I2AzYwPdKrdbvFZtYTDsfQYbYCeS
 5U2GAPPAloA8kwZnN06xrBTiSvJlF0C66u6U5+YUiuJDruARyXE9jaq+jbrhONAZn214
 CIdrjoSdgogTxUrNrpCaMJFd7syr2zBDmvW3rF7co/G3vwIIWnsfmZ7cA9CXiwSlXyUb
 z2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bY0W063cVUeBO6Zy5flXsy/MS0XG4b0EthfuVGWoFXc=;
 b=MVZ9GaKBB70dOLPav9EPdzEIs1wEZcg8IM3prmHspDWNP1dyR4M2CRwsJj0YHJ01VK
 w/P6LEulEh8Wy0nOnUTvp1/BKLUnYdKdExcd02DUnfICB590VPi9nvFBsJnDCRusu5Gs
 bN7Oq6SPuP4ExWKO86aT4r7Pj+AYt+j4sCijIvoabPWHKVlXxOULhf717ppufWtUCVcY
 KPvIKkejirGafEGHgXLEsrqX1G7ygfcMmMHw79XnaRz7J+GZ7JV0l4m8u666InJfKccD
 DJ+Ih+cCHx6UxbllH3qyhXhMj9b8jGiaYBavF01z2a9nHRI1bs02QsSZ3UP58yKc2P/x
 092Q==
X-Gm-Message-State: AO0yUKV9DkUf8hoiC8mXltRacaIFe3KO3Hvet9SJlgrN5ltPq8Sdj5OL
 5Rq1qaE/KPIaBweuYe3Q0m0AaQ==
X-Received: by 2002:a5d:6e02:0:b0:2c6:e827:21c1 with SMTP id
 h2-20020a5d6e02000000b002c6e82721c1mr6478456wrz.50.1678110499396; 
 Mon, 06 Mar 2023 05:48:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b002c706c754fesm9638645wrq.32.2023.03.06.05.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:48:19 -0800 (PST)
Message-ID: <64d51c6e-f898-d1ab-b30c-4e3b6d394eef@linaro.org>
Date: Mon, 6 Mar 2023 14:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 46/70] target/rx: Use tcg_gen_abs_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7jiv9ktjsTQ/

On 27/2/23 06:42, Richard Henderson wrote:
> Remove the local definition of rx_abs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


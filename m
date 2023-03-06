Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4639750ejc;
        Mon, 6 Mar 2023 05:24:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+COSkyP4BHW4qiRc+XYUX+IFS7kQW9Jpz3OzVlMYbo7KGBWtqMx3JL9gOtddatkTOI5NEu
X-Received: by 2002:a05:6214:5089:b0:56e:b5a1:b52d with SMTP id kk9-20020a056214508900b0056eb5a1b52dmr17736984qvb.28.1678109082874;
        Mon, 06 Mar 2023 05:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678109082; cv=none;
        d=google.com; s=arc-20160816;
        b=MNwuu9I61Opc9jVUArePBQF2SMVsu1iAoUdB+C+4frpTJonpebwluc6P8j50xXrUYH
         Z3E0B0bmwhHwl4aEm0iZMR0tdrze6I5qiHOaAR9GObqoRSzIIO4aIsuWK8G4cmGVz5nS
         QMuR7qCRdnmN/E9SO2Ha2BeCDq8csw5r0DIdFQ7G0kt46M6/U2AdWWRD5ZIZaIqWrgNl
         BxAGu7jqhyg4tlptJJLjhLCVjFMoDOG4aOPMcuOdaIqghAclLRMHpC14RZVvY08tLNe3
         FaOT8elD27QIXOpI3LucKLoIp279y+7Y55Kzhx0vGf+4TVdzCtqkwLvbsYkq0F05S78V
         +8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eKUeXLHYw4kcMo3qEaxFcTYdTG5rKraGNLJFumtHOEw=;
        b=gThb901YHxR7YVEvL1x4j+0+F9kjpmOUFUMD8nLVNTDTK8e65Wv4XaBY0bz8UR8oUZ
         5vH3IN3D/4xqt/K5dJxrVzGKpznPSkDMr5sifsEhxOR5hVqvQy0n91mnFqEMi5JD+JyI
         xq5Z2x+Elwd8mHxD7PrJKzZZS+sBxNCL/yqzlRx5tc3XrImP9I32pZsWfl+c7RLD2dA+
         qxEBx2v0kbiuInKKqIpC8QN+HZ3nKi6iR/z4Qx6GfZHa3202XVBiqv/67TTChbZCZM6W
         nVBL6TqG6QG84o6f9xieGBHDDMSkMTXW+zwc2rXP4qQwanhIwLcxjDJWR6zhI6Fg/Z3S
         /71A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hgw7XhJK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e29-20020a0cb45d000000b0056c25e77091si7197558qvf.21.2023.03.06.05.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:24:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hgw7XhJK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAp4-0004Og-5a; Mon, 06 Mar 2023 08:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAoz-00044i-Bk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:24:10 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAow-0005yc-L9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:24:09 -0500
Received: by mail-pj1-x102e.google.com with SMTP id x34so9771875pjj.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678109042;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eKUeXLHYw4kcMo3qEaxFcTYdTG5rKraGNLJFumtHOEw=;
 b=Hgw7XhJK6Cd8dDATYdxGWr9EB0FomSgSen7oJBiXT4Y7rFDsSmWq18z4VMRJ6Sf0Dj
 x7qm84KQ18XDfYHelhxUV8LKydtaCpSYr1L6VVWCzRqRuoOJY+97Hq5blVtZ1ZcS5O+h
 SXfuUEXp5OEOD89L0r4TyqYRR0U0g4FFXpFun3XFj+HOeVwZwgURimskZ7An0ChjRVey
 Sz3Jx+P9z42UxQT4VM77sk4LedibXI5OrFEFgu1FuYPEfHjjJNoS6RRIyQ0ZyTFL/FYg
 wElguc8oo2NlPkpIsefk4mfOejCqGt7lSgsxq0fF0qaShRL4JFIFJoIe6Wl7FogDV/Yx
 Tk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109042;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eKUeXLHYw4kcMo3qEaxFcTYdTG5rKraGNLJFumtHOEw=;
 b=NXjEPH7xW0YElMcNNOpAKs0xd5mLVciqZyUHrAHrG1pt/2o+HEyepN0usX6MDI6hcx
 jczHD9a0xpCOoFvKiEJZevoac+U9alIyzmqUWNm6ij4P0tjyB92NSl1klRRB019xdi2B
 oXDa8yDxIZaseTvVJWYjb1aJS18QjqUVyOPTaQLxS7J2MeiFhVWyWLA7c0XZOGD9aZiS
 8VM6zMbF99Qdyiy/VLucmr8Jap/NzJVDQfxUs2U1YGV4P9AOBeoQI3YwR8I7mGDMH3fv
 Kxqk7e75kQyzm8wmfWjxK/cjYP0l9CR7egZH1sigirMMyBy4pwpXT7/Me5DxJMQOqYyp
 RkOw==
X-Gm-Message-State: AO0yUKUeHgwFStyBME1PBkUGSyejfkuAPjNXBXF1gE3iJWGb5CjupQOU
 pA3xd+mmh5rzBCHOKxkxUZI46SDxBX1piAboNO8VHw==
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr4219865plb.13.1678109042316; Mon, 06 Mar
 2023 05:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <20230220081252.25348-2-qianfanguijin@163.com>
In-Reply-To: <20230220081252.25348-2-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:23:51 +0000
Message-ID: <CAFEAcA9DErs9iSDYfg58PctRqxjj41ud4pwG21Ar2eahj2O_6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i
 SoCs
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: axrjyIIFUkLg

On Mon, 20 Feb 2023 at 08:13, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> TWI_CNTR_INT_FLAG is W1C(write 1 to clear and write 0 has non-effect)
> register on SUN6i based SoCs, we should lower interrupt when the guest
> set this bit.
>
> The linux kernel will hang in irq handler(mv64xxx_i2c_intr) if no
> device connected on the i2c bus, next is the trace log:
>
> allwinner_i2c_write write   CNTR(0x0c): 0xc4 A_ACK BUS_EN INT_EN
> allwinner_i2c_write write   CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> allwinner_i2c_read  read    STAT(0x10): 0x20 STAT_M_ADDR_WR_NACK
> allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
> allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
> allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
> allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
> ...
>
> Fix it.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

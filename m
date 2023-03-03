Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1405553ejc;
        Fri, 3 Mar 2023 10:44:07 -0800 (PST)
X-Google-Smtp-Source: AK7set82+GDvSAKRwMVoK7+FkJOAz8mJEZmGnaf7VWzc8jKajAYOn5VvHAnLlJYkPsNdxFNgWUur
X-Received: by 2002:ac8:5f88:0:b0:3bf:daae:7f24 with SMTP id j8-20020ac85f88000000b003bfdaae7f24mr4550130qta.34.1677869046826;
        Fri, 03 Mar 2023 10:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869046; cv=none;
        d=google.com; s=arc-20160816;
        b=buQwg7vebGPrLLAJBmD6s0utJNCgLHzi3Jnnt843FkmbFlzJvcOGG+MKeos7d4d4CR
         94ZOdMsSc3KvthgYA+am5Da9OVMayugT51NOUWspR8G3bQQzeDiD69qFt0w9mvO2O9Im
         hvhCxJ4P9nwcUNxQ1Awm50gOEicWoIEASsX39OdhTW63Dm0QRPKix4cSp7hwXkP0gV0Y
         QTez2CsF8GEh9Xwtq0RPfca9it7O5UgsRzqwr2QNBqaDwvBJF09U1QzkZ1f1wkMHlcWd
         WCT20G3s7HyAubMdJ55JR2EtVFIepBkD9raW6f0qk1cU/e0ONaRmPEfVCKrd1TVTwZDe
         BdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sJweuKjisjl+SbzQFRrcKt2u4A0ARVkM5ctNmHfdZMM=;
        b=QrkhaYn8U1hffmGmukQ2fCF0cMTT3S1o+Cr/DQUVi2ylnt11eEEtDl4nbHwUkIIMxN
         gJiGNpLDGIxeMf//pZ68pHdXRBVZgCi2Y+CwEtb0/E+1zszZI3GNSlduvuMClZcHNidO
         1j62AbzvdfEuYWCOUylLnx1vOnmtGYYaPZOpFfdUaegu8ba6M1M56Z7f/ZWoQS/FyDjG
         AVZVtkUC2lRldBZIUkLypvvtsG7A8jhdwrREPKyP2T/546+4PasTj4qpPVyFQ2HxAqJf
         LjCa2rInsvKLAeJG8cuXGu5eevrA5NEkifsl+X8ZwBShieujmNHbhhOV334hWyl0cOkB
         E6KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb8Voo44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a0bce00b00742708d87adsi2537350qki.333.2023.03.03.10.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb8Voo44;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYANh-0001dq-Lo; Fri, 03 Mar 2023 13:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYANg-0001dG-Uk
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:43:48 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYANe-0007Zk-49
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:43:48 -0500
Received: by mail-pf1-x436.google.com with SMTP id fa28so2151900pfb.12
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sJweuKjisjl+SbzQFRrcKt2u4A0ARVkM5ctNmHfdZMM=;
 b=gb8Voo44eokQnpyXZRZCHk+6pesmO1ToYDWW03UdcbkJOSHq9wBdNgcSxL/QeddE4k
 tGXEZksal3WhDASLhfBNgUewE0guedOwuBCt8mmFAK5JPeb0tdCGYFb+r+GUnoF6xo9L
 zGUI0YBctuNI32CFePwoRhTI9IcX15up5bssbtFyYHGHUVqFCJxHWNw4y8GrTE2Ynma3
 3PyTqrmP/uNqaky2u62dAaPjKaMQHoSx96zySnYFFD8Wbx0WNM4W9kLHAoXpYW5xFPcg
 dFzmcteb39w3phpoE7sX9u7bZ8E2dEKzEEv39z+e7HvbRefwn2JiUgJiBLUwWEGkRcGC
 liTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sJweuKjisjl+SbzQFRrcKt2u4A0ARVkM5ctNmHfdZMM=;
 b=T5Vn9B3CeuKfGcAwLoHQAAiLmMVzUj4wTGbmAtFDs89vUaeIGw0DY3up+f/+wlbfw1
 PK4V9eoc4tdrT99XlNxI0epUVi7kYlPOnI9kwupenM/pXeTLRwM+BLP5sV4rMxTZs8a8
 2dzBQvQyVI9eG/ft7W90DaLZLj7Rmfyc+SxBZIuaH5UtOhdc+jFsxhOPlE3qfK9D5wf7
 QJSNydgLxKW3i/WVPNU6L8uIa1Dt3QCduk5kNIxsInAgsUmc3mRULHRDgl9X0BWU3iQY
 4yM5H9VlJk82MWuUjM6tR9ysCZov6uRzQOwnrgDvPX5tY1eW3++4WJq9mZ3CzaFe4iYZ
 VMGA==
X-Gm-Message-State: AO0yUKV4vzYA8HS36RqswU0iIuHRE98mslPREKHDVptypwLktzPaZocR
 dN8LiktfJEOd63auCcx7kPy9uKdW/sndl9AmTEjp2Q==
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr1314109pfg.5.1677869024519; Fri, 03 Mar
 2023 10:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-19-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:43:33 +0000
Message-ID: <CAFEAcA_7WuicoDqMBvjZN4WG5h9k0h4f7oyJ5vxvbjF7O260dA@mail.gmail.com>
Subject: Re: [PATCH v2 18/76] target/avr: Drop DisasContext.free_skip_var0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: NI9hIjuAqQBw

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

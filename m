Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2321592lfk;
        Mon, 31 Jan 2022 07:33:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykzHv0R5x7R/ycrDgGV8f3fav3nl/O81IbIkzgqsmryf740i9AiI7V/RT5CNW1psqwMVIo
X-Received: by 2002:a02:6d11:: with SMTP id m17mr10826306jac.317.1643643183202;
        Mon, 31 Jan 2022 07:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643643183; cv=none;
        d=google.com; s=arc-20160816;
        b=iPbAxMY61f+fYHwf3XjVmnZVvAVE1+WlX0NByKTNpwrXPZ5c9qowd09ugBUn1ZOPqc
         HYxP3M5QWfwqpHp45pmTBXJB2JpLgY0m79sfNRjGFtwAIprsEubICrZKfEJx6D7pVF+Q
         /2VCc6k6J9IeR6LuA3gbn8vW1GYDURUnlu/0MCtjM328z+o2cC6QqGH/2y4uK2wvrd+5
         fDZCK1G7oZ3K27fXzIX2hUIZhPlV7L+xgNHdiBa2vPmam4ruFo0ANSUOV6oDTbmoqDFm
         f/dZKikAkXpFGrf7mfbv3Cy1SmOuf0ifyy2lqc/9iZ85X8WDgW9Za39w4aGbZJR3ir9m
         nTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1dUdavbE8b6OGsd/FVUyFvW0rzMLB8ykgoS73s+GG8Q=;
        b=mkF8STUoIV0+5wfIHb+NLht7IoAzLja1yv6QnPMAhCyAnkdWJ70urxVItZb77kIAKD
         dhB6tcEphwKV68R7l+tHxKw5ublJEkZXkLMiQxpx9WFbLWN4hbRHuwK08JGePHV1px/o
         EOFFsZsmJOkejci9CDJEZ/DuJalugITELzLPUj0y1esU9QXPTF5JTJopKORFQtbMUq4E
         SLBnJYbVwuWV/WiSroxaBNcKuHbcqy51L2HBuFEEPMn39NSZNT5pkFCZFe0qVw6cNbtZ
         pNIBOgij1eoYdOjgoIAMO4iajfK415ohpLq5/mXqB0UFi1K1NMxFMG4QUbP29VFzMVSd
         ERiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnTc15E9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si8676378ion.113.2022.01.31.07.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 07:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnTc15E9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEYfu-0000ll-Jf
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 10:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEYfZ-0000Wf-5K
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:32:45 -0500
Received: from [2a00:1450:4864:20::434] (port=35348
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEYfX-0007Ws-KR
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:32:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id e2so26232120wra.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 07:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1dUdavbE8b6OGsd/FVUyFvW0rzMLB8ykgoS73s+GG8Q=;
 b=DnTc15E9HPAMA4T8EjCB5Eprx1YZ6VOxbZuT+vvLaU9aEMGqpTU2doxnHmG1r3upGg
 Z9z74TiUdexPaFcqPOJSq/6tvri0HO156abP3CoP+rPGE8fx3iqyPzOKJbtNU5r4xUCG
 bWylN6TuKo2UtOmaXuvKWPWo3jNfjvMshWeW+TcKtkKHfiiN/2RVVEYowAwwp/R7hfuu
 N+GQnGIvHB+Pn/NDuF9h3lkg2NZ5luVnlm28J19GczEA0vRRZpVO85flG+9IIWOgSl60
 Ihz7Ho7RurilUuzcddu80GNhdyWDQAJXeIgV7BJGxu9jBNzwBj28sygTJxiZoeUjfwLp
 zgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1dUdavbE8b6OGsd/FVUyFvW0rzMLB8ykgoS73s+GG8Q=;
 b=P+vcTBSyu10YSx5b8FqZLGOndBTvaFnNAEyYHJIXsnMW6Fc36Mcdn/TMJQcCePPhI2
 DfKzWBuVBeE1NpORdp5V0rt878BMEJciG5xYLWZqgOAQVYyhgceU5d5rKKV+2+LBwIni
 mwN2XHfx100QRPImRS775eJszBM3uoVXVv3Vq6UqER7stmkKWxqwrcomQwuVl4o1jZEH
 ITi/vhWZBaq3/L7wlAkTzK4fjUdWeNnAQYSOFonmNQJ2rUMUCCw9i96JuT2WlX9X6ns5
 J/pNYlu1en6oqvPX86Y2xySESzzr0Mokc00KymNPLcdbjIJnwAOSCVg+JrZ5jiZFcqF6
 pQPw==
X-Gm-Message-State: AOAM530KuT7dqG4IN/Ne81faK/52At0pAfhlDbk07yqXPPjHSR4d2H8M
 H1dQyssxoGwn2oh4S4RmkDiW8lOdtX910xLPg7OADQ==
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr18353502wry.172.1643643156517; 
 Mon, 31 Jan 2022 07:32:36 -0800 (PST)
MIME-Version: 1.0
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-2-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-2-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jan 2022 15:32:25 +0000
Message-ID: <CAFEAcA-UZp943LVdq5VMn9mvDxzieWMFn_3+B8F38g5x_nsKbw@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GXfjPuiX2eZE

On Sun, 30 Jan 2022 at 23:12, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add unimplemented SERDES area.

What's a SERDES ? A brief description might be helpful in
the commit message or a comment.

thanks
-- PMM

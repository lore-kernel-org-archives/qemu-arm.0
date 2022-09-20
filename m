Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2020588ejy;
        Tue, 20 Sep 2022 13:32:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67dE6aWEWMvmrQyseqY0K2jV+Ot4ZADp88m5X6TX8/1mJ46hlkSbjnmzeLFFtW2fr481UO
X-Received: by 2002:a05:6214:d8d:b0:4ad:5d9d:bda8 with SMTP id e13-20020a0562140d8d00b004ad5d9dbda8mr3559444qve.85.1663705937595;
        Tue, 20 Sep 2022 13:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663705937; cv=none;
        d=google.com; s=arc-20160816;
        b=UOVdaoPSS7YoK6+wPE4wN9ti/Y/MfTv1Lyrhn9sYN6Z/5KThj25GQknwYmtotsi8QL
         oQfkNwM9rWb1LQkxrnBdpubNnnJ4M4fBo41r+DVr+5yb/XpzNJ2Rl76hK5Bs2wP2kz3E
         i4zKbIzBkCUszwwlroFDl9PS5ubdhaaUQmYnG+d6sBQ8qdpJt29jsqacKbAx7Gwt0epO
         aRDOc6EX4TfnjqemIxGJx9ullVYnDxw4GZd4RfGVkKLLK95cl4natZxhydfqUgZrPVag
         AcnRxvT8r8cSjIImpWyN8FTF9KHZ4FHZXSlk5FfjWRcBcAIPpoI7zl8l6v8kgXGY47gb
         qUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kslvYUD2q7ccH/lP355tq4Z6D2BiJfxKrVTinmt8NZU=;
        b=zahPa539CnlJxAZlDu+HlXvkZXFUHHEpvsN4PQ+CQHOy5pI4RTSkzEAaQ4QQevw+8i
         NqcBd3ADFqio0xPJItLSeYfx62zdrs7iyzGX04/EYCVkDAZaoRPwQjNZaophaw2XoIch
         C6uchPEZRR8XITQbovWsrWqhLii7plyfFJNyT8LnBx+wiI2Tl3hnVFfBeUapGb9otFsI
         Qz5EBXK1/8F5pFUTZ9F89+NXm8+S+eMnueo+RxLO7vL2VJLipRRvz8rXGhsNQdMN7qNg
         WCSljP4suonuy+u5vD7WNKOymVwVtwqY0uc4C86kB0jbP+fxH9fHxa6E/+Ef1YOkUb70
         mSRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9gzKC+v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a0562140dcb00b004990214be0dsi539973qvt.34.2022.09.20.13.32.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9gzKC+v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oajui-0003M6-O9
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafSr-0006VY-VG
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:47:13 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafSq-00033u-Fc
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:47:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id w28so4466316edi.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kslvYUD2q7ccH/lP355tq4Z6D2BiJfxKrVTinmt8NZU=;
 b=i9gzKC+vdPcyiUL81fckd/J4FYr7rmuwL9nv4hDdGC2k5gmiDnWrSTXu8iCGzRIkw8
 2utHNfgcNjNfeJKPcQ++s5rK/S0HmZqjvZliag+Te5HM4QgGOGQnJ/qloFD6IbULq8q3
 tQG1rXUYr0ujRAbrLHGyLoHxpjHcL59tL/eVVHZwp8uhJHMrMZyuA5wbRFjm1zi/cLgn
 I8VG8sL5+AVX+TnBBwW195/V7dBywURWhzyEH3RZ7M3C2OVC+3c16h6moOUnhtKXUp3V
 0tr+vX3EPtcIIGIpY/Qf3zViiXJiamzpP/I6I7BDiiLIpmLH0Qc0YA0Ao2g1wABueg5q
 aUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kslvYUD2q7ccH/lP355tq4Z6D2BiJfxKrVTinmt8NZU=;
 b=k4/9rxVpMF21DJdM7bZ3K1xtXemGhhD6VHYlAv63M2K7h1F+utZPYeXIoVbAczcry7
 RHl4oSBXgCxslKAhpR1WN1yrQ09ixg5ZFpGrp7lyAHbOMzrR9stQv5l2Yn/450smzxbR
 UO+F3BVSjMvx1NPEom5PPuaZVezfH4i1BcpZGnifGM865/skQom/DbdbusYM0R2gSSEW
 a/sLxCzkomtdZH9lZ1JJozRy10g0jUCyXYNMaeZrCSy0NcaGjOKl7rOYMl3RFVXqaVZt
 D9s+5C3Adibc3wTFbgDSdpWoHKsSPb9sPyeFS8Wqn13QZNeT5pKX0IF6ujmlGipHuUW+
 QW5Q==
X-Gm-Message-State: ACrzQf1r6KuytPPi8G7YOo3y4HjcVLORf75Ofv5lSkNOLYkFHufsua92
 C/62TfHbU+aSrHsyZ7wZwLjgdOhr9dDMYPtkgGiLxA==
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20379681edq.140.1663688830930; Tue, 20
 Sep 2022 08:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-28-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:46:58 +0100
Message-ID: <CAFEAcA9i6qSoUiaUyOon4o-uyevxVT0DNdE4rZv_NkND+9JxaQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/66] target/arm: Reorg regime_translation_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0tDwIa/xFeS9

On Mon, 22 Aug 2022 at 17:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a switch on mmu_idx for the a-profile indexes, instead of
> three different if's vs regime_el and arm_mmu_idx_is_stage1_of_2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

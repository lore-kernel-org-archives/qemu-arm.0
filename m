Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2535660lfq;
        Fri, 9 Oct 2020 11:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFaJG4OCDYv/hMaC5r1yTYyXGwv7oQdRiJgyAyUjz/vUp34T6vBOwtU9y4157o3mB4my98
X-Received: by 2002:a25:404f:: with SMTP id n76mr13925516yba.336.1602269389665;
        Fri, 09 Oct 2020 11:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602269389; cv=none;
        d=google.com; s=arc-20160816;
        b=gqcocdB8yJmKxsz+j6sFcWVaqbIMU6MRzolc+0WpC6NlzRtXAf1IFvau0r+eXNNKwD
         okdF7LyF+oRHXHCxG9BNIkqqlyOq8IW4H62j1PXh5OCO0793ctug9edbXSKJSL0EfRoE
         oqoeJI+dElUhP6tCEq962cAxt/nCtDifvvQZIUgH2j++a9fN9KMLV4bOSfkm/0Cfv69S
         d7KQZnN0NVXPHEFdfc/y47IUODoJ/bpQoU66NcPa3eEXozkA10dtCT6UlTWOixLeyGJc
         iu19ngK+l/BQUs1NA8XETsXIBFsCNxbaniW8FiQaDbI8vYVC/ZNPwg+A4gnpl3UmPxmj
         aasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4tbkoVkdabXMCxk3mKB0iMGsQAJwJqjQPGk0gGd6TU=;
        b=LBzpY2TAZX/FS5HcVO25Lz2R/mYHN3kZFCoBbOjhRYM3Gwc2v5N3bgaZEQycG56qLM
         NOHtoODREdROIUrZx0ZTvzMrRwx16CzAy8PNeVgOIdqsS1EEnLkFP6HSvHwFsrssqn2A
         nU4yXcPLGkHqGjioAIWRfc9DhXUUuwKoRdwhXhumA6GpuXXkcMG1XwCsyNdEqd+wFQyF
         60SOUbxPGM9aPafXj+NXZqUSPvpcK5DaEPQ/rUEI+GhUMljU1t1O/Le5aZLMd7WFgLKS
         ZUGz6RMv+WmGrV8CwGIUT3Ko9RURliWDdp04V7HuApwEkYbujoniGBQZstiMGe22Zf45
         86+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODky0azv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si8881526ybb.244.2020.10.09.11.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 11:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODky0azv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQxSf-0002zE-2J
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 14:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQxRw-0002QN-Hy
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 14:49:05 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQxRv-0005WU-6U
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 14:49:04 -0400
Received: by mail-ej1-x644.google.com with SMTP id x7so4391780eje.8
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/4tbkoVkdabXMCxk3mKB0iMGsQAJwJqjQPGk0gGd6TU=;
 b=ODky0azvzakForx+i+ayKwkRJRQ6IXRsbO8CNeJ0TkXKttjFLCHitu+xWKLaE+czLJ
 ONHDibwfzZd2yyR+P9RpDVDn4azgxIExoRBihCE3DRGkQDUT/sKcQdLcqPQX1F58cSEF
 hRjKKhmKYE5uIeXjiMal9n3GQHp/GCdgDW4R3P/eY0t1rf5TqV+9WxsvBp6vuLZt4gCf
 /FCWAxk/3FKomaxyD9JtfsimnJerDQZHtAc60wLKVnHBLu5D/KA4+h0ZWbPDrBbC+FFS
 av3a+7UnLOHpSuj9UW39UPhe1hBVOSWwZP2h5VfiS/KGUocmd6WK7Q9n2KnQam3QwOAS
 2r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/4tbkoVkdabXMCxk3mKB0iMGsQAJwJqjQPGk0gGd6TU=;
 b=LvyLcZnqBuOuFxcvoMjYO4GnNk1lDPRZOTn4HqxAoG4xPCMXcT6dtPyiP84ul4ue4U
 ioM1tD4JKq5/Hle1L0wSrAhKklxScjA+dhGOHnPtKLqqKQcMNt/2uL+5nF7TXUAUqvBO
 p7AS8zxbKlWFqPY6u+WCTBfDTiOzQNWBbIv/iAtp/rOPJeHfRhuoE7PgojmxrFLJUL4S
 EQiwVWQn79ij/q6kbK55h9/My4KVuPsw42leoOzcXDJCQQl/2IqhvJwl6nVP37Ze4gD/
 AHxUmQAbogWPig7X1LeXhz8r1LnGz894SA9/uQpQ6bwLNhdAIsQO1+eqTACtgS6peBAR
 SAyQ==
X-Gm-Message-State: AOAM531ISQRXfevk2pKh/wXCs5Sr/Xvp8yewFp7pRg2vU0xw7ljzNhk7
 0uOOURcCEl6JgKIZceTfDoEvgfBUNFQpLRls8QkDwehCXTjZFQ==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr15459855ejk.407.1602269340281; 
 Fri, 09 Oct 2020 11:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201009144712.11187-1-peter.maydell@linaro.org>
In-Reply-To: <20201009144712.11187-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Oct 2020 19:48:48 +0100
Message-ID: <CAFEAcA8BiQcJJr3hkzTqnFLpYtXf1xbDf+GpgvYnPjJr_FAEUA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix SMLAD incorrect setting of Q bit
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: pvikB3uoPy7Z

On Fri, 9 Oct 2020 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> +        tcg_gen_extr_i64_i32(t1, t2, p64);

Oh, I forgot to mention, but it looks like extr_i64_i32
isn't documented in tcg/README. Is that because it isn't
really a TCG IR op, or just an omission?

thanks
-- PMM

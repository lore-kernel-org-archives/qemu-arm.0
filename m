Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp675855lfg;
        Thu, 13 May 2021 10:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwivBJCJIlUbrM0TYd8Nnb0dPjdBt0QUhPpxivqe8jxHvRUmFbKXeNTc2hIOPQ6rWPVkQU8
X-Received: by 2002:a17:906:914d:: with SMTP id y13mr13663683ejw.489.1620925535610;
        Thu, 13 May 2021 10:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620925535; cv=none;
        d=google.com; s=arc-20160816;
        b=UmDGqAVm54RRxzrm55RH7g1BnVfhg9qi6d972ChhCD8mTFADslXd+3/ES9/4noi1tM
         rF1TjkSgZWwUBBE4GMbsx0+RQVxnASkxiZrqIMDQykrDB4kyFVH1gL8cIm5EXFsKfGo2
         KsCESy5WUAjG50W+7QUzoygrO7MbFdko1gbvZhkONAMen5sQe7Q22JvWDBMROEgheW7E
         wxbvUZn1drK+ZXwilj4F15e47JS5N88DFN9J2dkmydisKWtloqbbNI2/Bll1CxKX97e3
         PDb8QJkKz8stL58DYE4ojW6N/JaxRPzSAS4I4DfnHo3MD491IkYfTRxFf7zMHdy9pkqt
         jtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wZlNz2bDsuLs6L6KptR9cBk9rffE8cXeSkyZYnQFjyo=;
        b=On8Er+cyMrQsnah3eN9OK9EYq+rNVhuGSbAlFaMFDbQEuBYHKx6ebt8ngFw7wQLNDk
         QH5u1tkqhh2trPLri1yE518B6eOIrGeK1wfoXJyhBsaU/E7Wts+w3FmHMlO+Diz0yAo+
         M2/fIgrYT9g1X0QV4z9rbrNZcuVG/GQVn2a0GUSKCPaODsbXVDf5pu86a+EXt0QUCgev
         fNl2ZXSbw0AqVcjc5utCye73JrTCLX55e/S+ryBOTKZSYA55ZKMvUl3R43REjmVKymBI
         KHDHwzmcLMgZk+ljronFHrFG+TAoJvLd2EL2/uRrVYC+k4CB+t5qaaSv20BawQzgPZzu
         baUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zmBld3Nf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si3571023ejb.680.2021.05.13.10.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 10:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zmBld3Nf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhEmE-0003aS-Ja
	for alex.bennee@linaro.org; Thu, 13 May 2021 13:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEVz-00048i-DG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:48:47 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEVt-0005v0-Uc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:48:47 -0400
Received: by mail-ej1-x62b.google.com with SMTP id n2so40774695ejy.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZlNz2bDsuLs6L6KptR9cBk9rffE8cXeSkyZYnQFjyo=;
 b=zmBld3Nfec01FPGCcj5kjoeR2/it0EddWoBJBNqA6tjzvz6ZsYuvI+5BqUOjgE0MQ3
 YwggtD5GC87HUb8M8gmVzerQCbKgf0RZgixp+UTV4y8WiyVPxIkwVAXJjpa7se3bEfsh
 RxhYb1BVoltmNlha1XLuovPbtU4tjAt2CcZK/P0NNs7WcQkIPJ1RX/vlbehoFcOMnnwb
 cIHW2mYPGJTf9pYPqRxx4BSw75hA+ab6+jCmT0kiCnZop+VlHT5NL185Muh3s3VmPb6q
 m0ikvHU8seWnjqv7NwzFLAkZ0tjyad8WqBVwmyzDtiK38WamUQG8Pd8Bfpe03pft89Dq
 cAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZlNz2bDsuLs6L6KptR9cBk9rffE8cXeSkyZYnQFjyo=;
 b=bBfvMR2OqWFGUWMIJMVGKLfqNrhsZyBhib4ayaJKLz/ukqBl/ililm61WzPf+drPSg
 UqnvjAcnNMoed+ZyOF2YbMmcApWh2bffT7r+KNRJl9vDB6GRpi2Fce+2WYawhI7LZJ2z
 N+Pzuqwa32tEHepiO6hSz1RMF3QFWMd1aKgcvX3LQwzVVluIUYYi/L1U5I4Yie2BDvlT
 iWmicZZ7KVETy8/OrBc3Owiz53fytdBdsMHP6SK3ywDGm0l7iZJ7WvMuNMhHlenZBeXm
 YtyTaAQ0xjjPqQzKZIORxt1O6SkvtTcwMM3efQna7Fs0r1erFfzvvz1QHRX0ex5wDAbP
 /BRQ==
X-Gm-Message-State: AOAM530MToUePvg422LInQMPK/cmiWlYnsCEoZPCWrZHaLSEqSRExjEz
 fciygHge7F+eC0+0FC2h8yj+2KquvL9GGSI/HrSHew==
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr13984545ejb.4.1620924517503; 
 Thu, 13 May 2021 09:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-72-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-72-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 17:48:26 +0100
Message-ID: <CAFEAcA9QoW_-nW-eEy-KZJKpaZ_SpFaSKpnwShtrtD74HNLL8Q@mail.gmail.com>
Subject: Re: [PATCH v6 71/82] target/arm: Implement 128-bit ZIP, UZP, TRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ErvOGgxomMuZ

On Fri, 30 Apr 2021 at 22:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  3 ++
>  target/arm/sve.decode      |  8 ++++++
>  target/arm/sve_helper.c    | 29 +++++++++++++------
>  target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+), 8 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2095342ejc;
        Fri, 10 Mar 2023 08:30:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8zPhI/UHDdasYRQo7O4Log7DHKY5gxoCvhPrv4rJN0KUloBQKftxsMle8lTPqWcKqk6v4I
X-Received: by 2002:a05:6102:e41:b0:41f:6792:1c73 with SMTP id p1-20020a0561020e4100b0041f67921c73mr12698703vst.6.1678465848602;
        Fri, 10 Mar 2023 08:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678465848; cv=none;
        d=google.com; s=arc-20160816;
        b=lSKxp/MOfrDPFxpwjTl3SzMdRICOf/ny/fmWc3ibBBEuVFWGLG8YyumUmUyJyklK5P
         Ub+BSPXwUX65emgnkVl4+rgVMXjN4uFbQXinyTp+Gy4Ml7ZJQCa4JUbQCogy7P8bwLHC
         IVaY0ukHuJBnGLofB2NiAaonalds+VHqxHXuiLF1el9/szaHbfnb3XpeANFXp3VR0ACn
         KUxsBaf7uAVWwSkPQ5WCCFtMgiQQKdQfKcQ+bgBEOLg/ofjM0HGeLPel6WnBlcKvUtis
         2VD0DF7G9h4or9yeo7xJQ5ie0+YdchLbvTWr8EaM5qy4cRSzag19+37hshlTisTqfjIG
         Vy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=65BWp2E6jptNzr8QnxwDtV2FZVH8YvfO0/Dktdrz8ZM=;
        b=d0vjYZ8BjLUG8Rxs888bQU8wM7fnmwUq3sj5VlnGxjxNsZs4y6z/SRDwH3AQNZg1TG
         ujU8mctY0a01YfgQo6jCZnvH3gNppxyljltEuAhKWLH8wAc9PQgaUG61XXhfHDdlT/yb
         ehlpl/9iv4xX0bAB594TUv7Ym82dJ7DOcsIkWgFTRUkaPNpmLM0NFI2uCGnvxIexA4tq
         15rgWCjnSvcHctaSCDf0tV2NPJarJX3HnNAVVKoTDi0iaf+J7G5D8JwzYVrX9rhYIYDL
         98D0pQIU5wJY4uPg//p1qUkvMRdPkUv1TUMSDnNLtHeiCYWTfzqa7LZk+UkVst+sbCkq
         aFQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7BSMARB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bz4-20020a0561300ac400b00418b0d5245fsi159577uab.55.2023.03.10.08.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Mar 2023 08:30:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7BSMARB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pafdc-0004dX-DN; Fri, 10 Mar 2023 11:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pafd9-0004ca-T8
 for qemu-arm@nongnu.org; Fri, 10 Mar 2023 11:30:08 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pafd7-0005t9-Pg
 for qemu-arm@nongnu.org; Fri, 10 Mar 2023 11:30:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id a9so6129327plh.11
 for <qemu-arm@nongnu.org>; Fri, 10 Mar 2023 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678465803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=65BWp2E6jptNzr8QnxwDtV2FZVH8YvfO0/Dktdrz8ZM=;
 b=d7BSMARB1NO5c2Ra9TEKMuKeH+KpXvUXcLBjldW1hV1Ygg8xb6fzZL+Km8nkFJi9QK
 HM02GA/suubvGqS/E3vIXiSQTvwwpl+iAKZKS8s2FsMZ8C5oW0VNXAv+oBVGm12BQaBt
 CSRFS7L8C08h7V92GZ7TL/cVwotEmBruwpfSCluZtcitrHyFR2nO4YO8x/Fbstc0Mtct
 KcFanw2ic5ykyBxVsVPi9WGlGHVHT13OoYgw6rxNcSKGkSGqGdNLkHQYVN1ov4pyyEpc
 pusNogZ9sl7jMqLD30/0UFl4ScdKmF14pZlE6hjT/itFvFm7Ez+O3GsmCtpg2OmBMDX+
 ArfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678465803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=65BWp2E6jptNzr8QnxwDtV2FZVH8YvfO0/Dktdrz8ZM=;
 b=BOnAKD3K8oMbSTt7VzreAWO/DCzFj5ewW1F2IDTL6k6/1CPIyvTxKjYtqhe0sh+AKv
 IEHM298VOIL+e5lFJAxssZl8LzCPQgE6qOu03LrooNnfwiBnq8HrOZHE1+26+jO4OnzL
 CoCf/l7MBK2Ii+97oVNzC3AB7mpNd+2kFP+DAA3iff4pc2EqujXYpHU6oeNTiAIXfZmn
 0getd0gvAv+V0o5XTU0Sscu2sZpDiEFevz95xISvPb6M8Xu/Rj0sxbC58rh0YwYS5Pwl
 G3Up0oZjwfTSGL0QMuzfzAXbu7+L+PTZRW38yP3BOD/jf5Qbdwqw40qC8NiyRku9D1Ld
 ueug==
X-Gm-Message-State: AO0yUKXJR6Rx5enndncFEiQTHF+NSFpGUNVdfzO8cG7fyQCJecxnAQZH
 g2HVwsb/p6xY1E4W7eeas5sQELK9o4uTB+NDJCT6BA==
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr10404510plb.13.1678465803488; Fri, 10
 Mar 2023 08:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
 <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
In-Reply-To: <CAPan3Wr=jqP5CVzsMtNmUTj-NvPZouxPWwC9DivY=GL65XJX4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 16:29:51 +0000
Message-ID: <CAFEAcA-vnac6CD36fsaoGD2zXVKe2L_FuGQDWHnBscy6iyiHYw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: kRiyBU+877H1

On Wed, 8 Mar 2023 at 20:47, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> Thanks for contributing this work to Qemu! With your contribution, we would get yet another Allwinner SoC supported, making it three in total (A10/H3/R40). That's great.
> My thoughts are that maybe we should try to re-use commonality between these SoCs where we can. Ofcourse, that may be difficult as the internals/peripherals of these SoCs often really are different.

Thanks for having had a look at this patchset, Niek -- it
has saved me a job :-)

> Your patches look good already, and I saw patches 02 and 03 are already merged too. I did a quick regression test with
> avocado for cubieboard/orangepi-pc with your patches applied and that went OK:
>
> $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes ./build/tests/venv/bin/avocado --show=app,console run -t machine:orangepi-pc -t machine:cubieboard tests/avocado/boot_linux_console.py
> ...
> PASS (22.09 s)
> RESULTS    : PASS 8 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 169.73 s
>
> For now, I have only two suggestions for you to consider:
> 1) You could add a new acceptance test for the new bananapi board to ./tests/avocado/boot_linux_console.py.
> This helps in your current work to (re)test your code quickly, and after the code is merged it helps to keep to board working when other changes are done.
> 2) If time permits, it may be interesting to document your board for example in a new file at ./docs/system/arm/bananapi.rst
>    If you do this, it will make the board a lot more valuable for other people to use, since you can add some basic instructions on how to use the board with qemu there.
>    Additionally, it also helps yourself to store this information somewhere, since it can be easy to forget all the specific commands/flags/arguments and links to board specific images.

I think I would raise this to "definitely provide board documentation".
All our board models should have at least a basic documentation
page that says what the board model is, lists what QEMU does or
doesn't implement, and describes any QEMU-specific oddities.

thanks
-- PMM

Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp513162ejb;
        Fri, 8 Sep 2023 08:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvE3eDivSyL36GD75lErkEbRSTxwX+W28+w6Gqw6cY+FyBAaRf14q+IXU+XWnYJBf5Y4as
X-Received: by 2002:a0c:cd11:0:b0:64f:72cc:4bca with SMTP id b17-20020a0ccd11000000b0064f72cc4bcamr2836067qvm.47.1694187720954;
        Fri, 08 Sep 2023 08:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694187720; cv=none;
        d=google.com; s=arc-20160816;
        b=r5YXwGzt8d4kh4cndNgWwczkrcHoMXdGSm36pjGGiPCHNrFZu6qvt73X68wHZ9Xq/z
         ya6Q2RarGhZwwigr87p0NsQQnxhuwLqmV9dqSGrXa3KYNZtrceRkvmGbIAdUr+mh54NV
         MelbeKtE1YRRvkp1lM36kCjbTGB/PyU531u8loZ/Nrqm36e4gODzP9XPVzBn6fbYWXbk
         nFelIA/xhCuDL1dcSJz1bKLdHdavvWvUba8wOddcut5C1s8QLsPHICQTBdLK4a2kbny4
         IJazYzjIpHq8tMaEh84VpY7cduceIlpB1HmO3d9AuDYRji4OBjE9Nc1StQ240DlPEr1u
         uIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pBgTHklQNbdjDjd8eoz0tW/JQGecWV1WEnHbYq378R8=;
        fh=V4W40pxfZJYyQAzWJwhKQM/6uNal9YCQTJGLqnVS1W0=;
        b=d1NLcEjryeRavpKOi4mbN8TPH7gexHm0eA1Eiw9l8dmdnIHRbLUVBYGY7J7gEU3iFy
         ijvF1H8WLqmRfszOOfVhHIHZXitnx4pMJ/ZRe/pUhBGqhxvkHUGZGYVcYUp+q9U8gvVL
         x9+DFufoe9thPWIkomBjnhBFUL4OagKZnxtlbmEaiGgtFamRyQzQwtYYxNebYu22t7Ak
         Rf8Txp2FuGP+2Du0V0ldCpXLyvPtDKhz22lL+J4S0IrmdvfBzErf5gD2rVSnA2TkMbIT
         MH4zQN/uRAD/cRPbthpQhRH9GrYNf2Q6VlSZ+YURQS57yerjeyLLZ2ulQ7Zi+MoX8FzD
         8eSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqNg8T6C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d29-20020a0cb2dd000000b0064c8da8c869si1241048qvf.591.2023.09.08.08.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 08:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqNg8T6C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qedcG-0003to-WC; Fri, 08 Sep 2023 11:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qedcF-0003lN-Pi
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 11:41:51 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qedc9-0003w3-5e
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 11:41:47 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-501bd7711e8so3812482e87.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694187697; x=1694792497; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pBgTHklQNbdjDjd8eoz0tW/JQGecWV1WEnHbYq378R8=;
 b=LqNg8T6CQ/FxuuXT1l4Kz0BOyidcsM97YG5VFFBu/qEJnYt2XctKxd8uy7QwTSR4FO
 wAfwV5syahcvVG2qNECLSIOdCziODuQNgkfnHMTk/4cV0xfZe9HaqS4o+jmlezZUhoY3
 aXkvuJ8fmnHOqW0IYdht5E86iJFj+fT6AOlmkywk85iOwIe3ibOO1WrTP7kxCn9V7oWq
 MKl/ESIlK2aJfFsGE7ZfT+zrPRs9PGDan07xTJcGnxmNaRRtYVo/GqKw6QKER4lu/rSn
 A/R6+2S5v9Y3flOi+yvfM/olqxub49yJbafy/izBJIwpQekvPmJzA7DzFBLBOmRcigWz
 H16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694187697; x=1694792497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pBgTHklQNbdjDjd8eoz0tW/JQGecWV1WEnHbYq378R8=;
 b=uR/SsYQdjedLRIpnxL+MYUUYNPmLQMfgoVri5yyvTJIV48eLmxxadM8620wyw0BBsD
 c0KWT8Q9kgspOusnCjGrJhNeB9L5GYgTFo/XHVsmksVdMUzwzhRoDqOprTtuF4woNjV6
 PLxNdajZ+AvzPTkDXPwUNt8xa//ndlLZgebN0ACfscd3UT9uNW2ncctz7SNO1Ri01cIv
 zEyZodKDIH9GyIeJJ2s4YMvN+ht9gvOldNeDxLUxSc9Kt1Sw4MdtL/gvYRes46JJ+BZQ
 myA9OpMiGORQ1XIUR2rWzJzF0Z2gqNQuCI2XRJ8GSC/nPFVotZtbvd/Ksy76OtjrOAqi
 UxTA==
X-Gm-Message-State: AOJu0YyeSgGgwdkthpJY7Yhu35i5XSPuuqEuR2p3L9e+J9IwNnXVK2TS
 b75wWKw8f6Mn1Lt9Pvv11+vNKmEHCWlm8SMVSj6ZeA==
X-Received: by 2002:ac2:5de9:0:b0:4fb:7c40:9f97 with SMTP id
 z9-20020ac25de9000000b004fb7c409f97mr2106235lfq.27.1694187697112; Fri, 08 Sep
 2023 08:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230829232335.965414-1-richard.henderson@linaro.org>
 <CAFEAcA9K6+c24rEORCF1vNav38kS5UBBVtSeC9T=DjV1_i0PDg@mail.gmail.com>
In-Reply-To: <CAFEAcA9K6+c24rEORCF1vNav38kS5UBBVtSeC9T=DjV1_i0PDg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 16:41:26 +0100
Message-ID: <CAFEAcA_PTJ69+LexN_Ca=GwjRfQyT_N-+qg34QEyQLgpCEUSwQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Implement Most ARMv8.3 Pointer Authentication
 Features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, aaron@os.amperecomputing.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: OpCb4jLOvmcV

On Fri, 8 Sept 2023 at 12:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 30 Aug 2023 at 00:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v5:
> >   * Updates for review.
> >   * Include linux-user ESR changes.
> >
> > Patch 10 is the only one without review.
> >
> >
> > r~
>
> Applied to target-arm.next. Thanks to both you and Aaron
> for this work.

It turns out that there's something wrong in the linux-user
ESR changes and they trip the clang sanitizer:
https://gitlab.com/pm215/qemu/-/jobs/5047578129

TEST linux-test on aarch64
../linux-user/aarch64/signal.c:583:21: runtime error: member access
within null pointer of type 'target_siginfo_t' (aka 'struct
target_siginfo')
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
../linux-user/aarch64/signal.c:583:21 in
make[1]: *** [Makefile:178: run-linux-test] Error 1

where that line number is in need_save_esr() on the
first line "int sig = info->si_signo;".

On non-sanitizer CI runs you just get a straight SEGV:
https://gitlab.com/pm215/qemu/-/jobs/5047578115

TEST linux-test on alpha
timeout: the monitored command dumped core
Segmentation fault
make[1]: *** [Makefile:178: run-linux-test] Error 139
make: *** [/builds/pm215/qemu/tests/Makefile.include:56:
run-tcg-tests-aarch64-linux-user] Error 2
make: *** Waiting for unfinished jobs....

I'm going to drop the 3 linux-user patches from
target-arm.next.

thanks
-- PMM

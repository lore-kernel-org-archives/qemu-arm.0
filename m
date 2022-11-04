Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp875346ejx;
        Fri, 4 Nov 2022 11:39:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76SVwQuMaQq2GC1CBwsOc8IqkTl4AskwxUZ1QhV5AxTtI5ilkb2K6WcVqrQZ8YWdQNsN9L
X-Received: by 2002:a05:622a:178c:b0:39a:90ba:fc53 with SMTP id s12-20020a05622a178c00b0039a90bafc53mr30353222qtk.673.1667587140014;
        Fri, 04 Nov 2022 11:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667587140; cv=none;
        d=google.com; s=arc-20160816;
        b=lWoW8+u02ZDBwSJjcCitbjQ7Wi2bJXKv7+APi405nTb++RbHFjHYzmYorHaOHPponA
         AzMbuMxLMMJlOcPlTQrMHNaL/LhQ5VqHTg7l/oZ6PSdh8xnuKblK0Jgu3ncLsAkAxExw
         v88riXgPK9uwruecl4+4RKPV4H+GX1xDq6ucIK441qqq+RRm0FduZPIne05UdV9BKFk8
         SZfaH44fKr42TzOaDLZ4BFAUVglr/92uo2hP9JBusI2UDGvjETo7vs4mCKUjBmt8r850
         yDPSzOvyv/Xe4wVowI23m2wx7J/XIwq0PSIrX7NfjGTpXY+HgrP8ycEe7S1jqAcCSvc7
         WXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HUnTCtIiDtyj2L2+Jl2OawdOUokQDH17bs/I4VXIIGI=;
        b=y3CFYF/+Sz9Yusu1dFZD/8PTpQ6Uf4cMCGxFri8MkZs4/Yce5SW+5QJ5vn/+hoE0CA
         HQe69GynPWjXS+f/5bKaFdfJX1bmQI43pECwenc5UhdKSfOrZp/kTQVp06TP50afuxdD
         PuMRgL6BUnNcLeaW3bjl9pW5RhGq8QYKHrH5Xu5IukdHoNm8Cqfv4caeDLSL2OB9t5Lz
         agSpLl1UnPiGFZ8lL65XRZJH2J7Mnw3orED0geHdAr7X1x+j+wy8ZZrmczycYkBaH8UJ
         v05gP6U8am03Ndqpx4CHw5BhKhOXaiNRFqhN4DeivHZJtlgR3+tJr5f0EmSXBIKCi4lp
         MOeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yuty1wF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac86782000000b003a4f188a5fbsi2897683qtp.618.2022.11.04.11.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Nov 2022 11:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yuty1wF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1or1aX-0001tE-NS; Fri, 04 Nov 2022 14:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1or1aW-0001r5-Ja
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 14:38:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1or1aV-00042D-2J
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 14:38:44 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso5250717pjc.5
 for <qemu-arm@nongnu.org>; Fri, 04 Nov 2022 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUnTCtIiDtyj2L2+Jl2OawdOUokQDH17bs/I4VXIIGI=;
 b=yuty1wF2TBuabq+/9750/IGjRu+3UW82TvU7OyYijZfS/5Xyfsayh923uV/8rI7IVA
 8bw/WGOg1YRAjbJurvMo4P9IFI2Lm4BmOCSx5+vy7SDGhmHfOYL7RCKpX1wSAQFYyWmO
 gZUSoBoLq4S8mP7pLQN0iMLSYhsROf37kTykYFPn8+cI6/Idv7LBu0jq1mpEGCm2hLvr
 shxxXzQFnXVemj/vOX9sb1Opiuc+r7/eFXyJMzNEGh67N4XsUsY6X5eJLemhDvb8HrT0
 XrUdhS5yUUIzCyzLsYnt92YbOyyCg8ApGVNfBg1PMswPZlWqvPMQQnQsdCixxmXSc5XS
 dPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HUnTCtIiDtyj2L2+Jl2OawdOUokQDH17bs/I4VXIIGI=;
 b=JFu6Yy4TyYPLWojuWKU7qba42NqTljoKu9k0h/HOeNbl3uJx2ZiBCxArMyKYeJlnlj
 Fq44d5+87cxTvaqrl9FDRuLc21x37tuFKWjoJn0Vc79P6xKEGdDJdh5/lawr9ePWjHe7
 j63zGMvDRXfX9G4VM8SVDzBsbrpn3TF1iyrP1RSPXzOlAPyibP39EmyG/21g4IEpF0Vf
 UaJv8HxRRmKZQ1KVjB4ew8c8gzTIti0M4IQVu/Ca1V7zPwn3H7T3gSPMPSqAILfeuC4w
 2O2F1THJwLy5VDjBSybyVLmg8UEFRvxWN6cv1lKkk8Atw6a+X0LAt241MbYDa1347AGk
 b5jg==
X-Gm-Message-State: ACrzQf1M5CLnGoFWmFh1QAP5eIMC/0G+siZfZwIuFl7Zqmkf/yVV8DsX
 i3PlWlhDpMc3EdOYZd3KMKtE1Vb+/VA47AxC2XhoIw==
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr37799320pjb.19.1667587120446; Fri, 04
 Nov 2022 11:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-1a1f4562-d931-4e81-b242-5b94ee0216b7-1667582981668@3c-app-webde-bap10>
In-Reply-To: <trinity-1a1f4562-d931-4e81-b242-5b94ee0216b7-1667582981668@3c-app-webde-bap10>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Nov 2022 18:38:28 +0000
Message-ID: <CAFEAcA-jsfwqMpA7wQms-+-B6featT-bxUrc5Bqt7ebMLC87vA@mail.gmail.com>
Subject: Re: disable cpu features
To: strixner@web.de
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aGnLZV43hPQz

On Fri, 4 Nov 2022 at 17:45, <strixner@web.de> wrote:
> Thus when compiling an application in qemu with -march=3Dnative in qemu t=
hen it raises an "illegal instruction" error when executing the binary on t=
he real target machine (it runs in qemu).
>
> So long story short - is there a viable way to disable the additional fea=
tures on the qemu cpu that the real hardware doesn't have?
> I can recompile qemu if needed. Tried to find the place in the source cod=
e where to e.g. disable features like "evtstrm" (which only has a few occur=
ances)  - but couldn't find the right place. Or is there even a (potentiall=
y undocumented?) command line option for that?

No, QEMU doesn't support individual feature enable/disable,
except for a very few cases (eg neon).

Generally your compiler ought to be compiling for a sensible
ABI target (eg armhf is a common Linux one), not "whatever
the maximum possible the host CPU happens to do", though
(aka, don't use -march=3Dnative...)

That said, this:

CPU part        : 0xc08

is a Cortex-A8. So "-cpu cortex-a8" will probably be
basically what you want. The catch is that the virt board
doesn't support a CPU type that old, so if you're using 'virt'
you'd need to sort out a setup that works on a Cortex-A8 based
board, which would be a pain.

The simplest thing would be to tell your compiler to build
for a Cortex-A8 with Neon.

thanks
-- PMM

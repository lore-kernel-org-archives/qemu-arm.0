Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3760242ejc;
        Tue, 29 Aug 2023 08:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvOKVIFRVL7HIqpuQOcsKxpvGVfEofcAQJ8RMetzpyaPT8CM/fn0MEwx6ynfMGd/LrxGCn
X-Received: by 2002:a05:620a:7e2:b0:76c:d4b7:5dbd with SMTP id k2-20020a05620a07e200b0076cd4b75dbdmr24857762qkk.45.1693324458782;
        Tue, 29 Aug 2023 08:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693324458; cv=none;
        d=google.com; s=arc-20160816;
        b=e3ZLznTCe24zwq8pJ73NFDMwATMCRiHdjenIeGDTh0mbrETSZLm7lY44Tkj+8Y5Oh/
         3WlGwRPbhXbdtUCXfrAFin/T1JHnEdtLP9ILFL9M+C8jlayjHjmQPKwi0kiuDJJTMG/f
         KH3h4+GPPvhcYYPcG/S0nrIXxCWuJ2w8mWxXKxmqc/DP8+v52z/9reIOwlLlA98NCi5B
         iuSDhR3fsSZI3QGZsPEqdJj/vWxBDk72x+WHB9ICHPcXPNzrsbqInj6ewrAPfx5Ktn1W
         deF9x+rp+WVhEUcFosrcwWsm+lQocTqDWEBiSm3BqoqkK0HRH5iHiOMNP2GX+vuuczst
         +ScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFWvO2HSy4bQBUgPqx0FnbS5LqLLwLj4Qs4qOlhSbUs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=m2A694xpL0VGVYYCLP8mtW33LBKWJv4gemf8zY7Ji8L5hI7spEDeJbF407npSkGc3O
         yOZK15tMKpgJoSnUVdsHil1EWQqAvHak7gI6RcHhDXlIhxBwyOo69v7m2Qpyr0raGn7E
         JH8oz0SHAj5tmYJStdb1uN2W8z7O25IERe0uqC1HCErcdqKuzrNt2w261uPgoV8T8daV
         wQU/5ZAPoZGNkqiUYbR2nfupZx7XRCuT7g8E4/lbezdvpssKvxv9KcgxAq2BpWcmwMnC
         QiyyZteqBCuAU4yAnmcX4IK7eJdeVCK5bflQjr4yTPA19b4+FCWCA4thPjN+CAUupmpp
         OK1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cFRmt0is;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020ac87fc6000000b004035311cccasi3815178qtk.432.2023.08.29.08.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 08:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cFRmt0is;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qb12L-0004dT-5N; Tue, 29 Aug 2023 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qb12J-0004d7-S4
 for qemu-devel@nongnu.org; Tue, 29 Aug 2023 11:53:47 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qb12G-0007SX-Bf
 for qemu-devel@nongnu.org; Tue, 29 Aug 2023 11:53:47 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so9438268a12.1
 for <qemu-devel@nongnu.org>; Tue, 29 Aug 2023 08:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693324423; x=1693929223; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dFWvO2HSy4bQBUgPqx0FnbS5LqLLwLj4Qs4qOlhSbUs=;
 b=cFRmt0isrKKo41jC4tqpbNJfq4aNEJZrrkrySGb/cFLIKrfV0L02cJWL6iBcBCgDMH
 SrAnkzXnlI8FJhBD9kUa8fXJ8ziSwdVTleACJaap46NEuBQ+03ELzA05BvV7/6sbh2xM
 p5Ude3WJMRCiJpjnW5KYcdopnXfOcuM2iqhV7AQVZQKWQAT4i2Qu+HwCZCYcu9NLATlU
 uzigVEJyDwLCJpbf90ljGNOuVxLOFWACRWL+5UYPMWvI/BnNkcZm0jjlYhgD22jvP2Tm
 w2oTUCkPDKrftjPDFZiyXW3nrmB/CyYQyOD6cdy/dnkN+oIeYu21IPKrZoBWAdbMNoUG
 itsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693324423; x=1693929223;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dFWvO2HSy4bQBUgPqx0FnbS5LqLLwLj4Qs4qOlhSbUs=;
 b=OZt2zMNuxUnFQZbBDhqCftvv9QQdmI0ktfW4IW7tvOhL/UEqcl4sukxahN3ifCv9iJ
 yGLS2K+Dzta86xbdypPHMyOV8fr4guMuG1W2t6uLNPfPP3VC9XSU50lw+ip2tNUId2c6
 hhsQB5PY2KJ0q38mhlste0KePlItXAJmC1B5dsfezhaVCih0NC2IdmKCTbGh433ggWu7
 7QAgRrJBROksBygep3ursSMmiRvt+rE/4EGZRyb6lXYkppHMyKHZVRRGHxsn/QkI7TJ+
 47tM0ajPHTJcJ7Ua7b5S0t1KIsV6Ess96HUSq3VYXFlj/GgKWKLiku1RF4z+22T+Q69p
 goZg==
X-Gm-Message-State: AOJu0Yy61cZbmCvmSMGFHrZcVHj/p+oZZOVRicJSnyrTMG3ulhRT3UG+
 xucyy89CInpBR+RUtD4hu0YIWcvnPZ7XGmKnv9Epz4JrR1QjapH1
X-Received: by 2002:a05:6402:3514:b0:523:4e41:2a37 with SMTP id
 b20-20020a056402351400b005234e412a37mr3650079edd.11.1693324422895; Tue, 29
 Aug 2023 08:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
In-Reply-To: <20230724174335.2150499-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 16:53:32 +0100
Message-ID: <CAFEAcA-jjZHx-7-oCEu+2kMQ38J6=szkK1qrjmOi+gxAd5GOzg@mail.gmail.com>
Subject: Re: [PATCH for-8.2 0/3] arm: Use correct number of MPU regions on
 mps2-tz boards
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v09e+bDGAP29

On Mon, 24 Jul 2023 at 18:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchseries resolves issue
> https://gitlab.com/qemu-project/qemu/-/issues/1772
> which is a report that we don't implement the correct number of MPU
> regions on our MPS2/MPS3 boards.  Ideally guest software ought not to
> care since (a) it can find out the number of regions by looking at
> the MPU_TYPE register and (b) if it wanted 8 MPU regions it can just
> ignore the 8 extra ones.  However, Zephyr at least seems both to
> hardcode this and to care.
>
> Patch 1 cleans up a bug in target/arm code that meant that we
> were accidentally not exposing the pmsav7-dregion on v8M CPUs.
>
> Patches 2 and 3 then define properties on the armv7m object
> and the ARMSSE SoC object, and have the mps2-tz.c board code
> set the properties appropriately to match the config as
> described for those FPGA images.

Ping for review on patch 3, please ?

thanks
-- PMM

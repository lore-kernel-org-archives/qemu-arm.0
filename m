Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp686703njc;
        Tue, 25 Jun 2024 07:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCFeLeMwdLhIDaCrQsqzz3wgDZSACLkD4n81hQAWaTBThmzJcenq3zgbBF0bECnNhzYD4Q2fruoBwHgiKGWLb7Xr5WJVob
X-Google-Smtp-Source: AGHT+IGup6m9qTwJeCnpVjtNcNqtTHehqe+rh69oH3cBYAuc20MrvIQ/jaePkDKBurTfYhg1FJqD
X-Received: by 2002:a05:620a:4591:b0:79b:c4bd:bb76 with SMTP id af79cd13be357-79bfd6890f5mr590021385a.33.1719325325490;
        Tue, 25 Jun 2024 07:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719325325; cv=none;
        d=google.com; s=arc-20160816;
        b=mXJFmHiZjZ3X087fiK0UcTh5665s3QsVAwjtjaxB9NwECfF3S3BIuw+97s1ryZHZ4L
         rJkRaoPyK+PCndEzoL/siIqiwGFxaRJ0lrj+vIg8v/ypUcow5wAUtBYkhRlDI9hFjuck
         xb3AL38SUNJ5KuS2IOpGlCQTToQzAttDIwe+tQ00TRicZ9qqRHta1kgNXZRhAZeCkFEq
         06+GuqTh8Mmg+Rb1LaEbrw7Z7m2CkvfxQJokfCW4Kb9pRK0Jze9tKRWm4oj/Ve7XLBLS
         Aoi8nIiTKAsRap0uzvvuB5G57OsmTQpS6cNF5gpAVZluWQSouGh6quk7W8vyeEkRDm5x
         DP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=O9cqHsdsLOQR94Ee7h9BJMPEQ9Tc9DlvOrfbkkjIBQA=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=bOt4YE2qkWtQEWi2wwPY415rmIm8OfnnjcQiyM3vFCMRMrZwoTGziRrLZ1lb1Gc2jP
         5sEivtmYAS6jUGg4i3kdEIMlNgyNyFW3SfWd3PKAc+jfWx5nutxfBdp5CnV05GvUZV4G
         +xiu2ynIUJIzGM4JjaBM2in2cmygkpKV6GN62FSMBihm6z/ukYIqYybyB1btmEXPZiV1
         TGj96bUKrbR5digqnhlPMbb3plc6FfbTaKncA1ha+miNlIj/rP1oX0uXtNy784f17zEa
         50qEXO1zCL2CgZMFqDXiS2rbITp7DJUJj7OZ8q2fXw3GgNj7OaLG0k3MHzzT681pmWbv
         jRQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+nVFiku;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce945bffsi1094874485a.690.2024.06.25.07.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 07:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+nVFiku;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM736-0002vj-Bs; Tue, 25 Jun 2024 10:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM734-0002vO-H0
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 10:21:30 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM732-0004oy-Oc
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 10:21:30 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee83so6034320a12.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719325287; x=1719930087; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O9cqHsdsLOQR94Ee7h9BJMPEQ9Tc9DlvOrfbkkjIBQA=;
 b=r+nVFikugSV44+bqn5EWfY3tm5UazZV8yrXBd2r6LhEDfoGUkoWX9ti8pCSrPz4Ed4
 cWtjG+3Ommv0HqFPI5BC7WGP9fT3pqruNrrA0EiFo2HUtDTLDLgs+xyT57bH2ksqNTdO
 SF1L42tm42uaK35pcrQCMfrPHAjFYxb3pV3TG0oYKWLpJLMhOkR95uNZdFEK5Nj9Ht6S
 fAOAwSQfCxgDnytiEeHU82RzgPeGvVs305+s1cgCa8Lpd4tLvPXIySqdCe4wnZSJEEXP
 0TPyqpqZ+In1fUtc7YFMkmPyBLfdwc1M+rmCDM6OW6A3h9+0v55bhy/9g5pD4heU9j0A
 0Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325287; x=1719930087;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9cqHsdsLOQR94Ee7h9BJMPEQ9Tc9DlvOrfbkkjIBQA=;
 b=hlQJcWv8/1iuS1DP1wZlGMYBXGaK6fs6yRIwv8ypD6nJ2HVDC1Vrpr6dY6BvWLUQHz
 S5TtrqgKHpT8z+41bFI9ibjw1IIuww61hiCgtoUdFbVB7mdUNhnv0LbqOgUBv9YI7wNZ
 Fr+akeHe5VEUURpWEzsmyvHaTw0oGjDohsMGcP6mrTPigRh4lVV4iZgivvusYebC5gpN
 gvNAm7h1DuiBYPMF2jeAXzqMeQeks3dvczwSvLuiELdU7DNy0goQnzfjP++utnrWQh5f
 pi5xidCNQpuW7OU+6+JhBh8O0lTAk46OoRoX1gnZs2QgqaOCrFDFV179PzKVFEnmhyPL
 K8EQ==
X-Gm-Message-State: AOJu0Yy+IwZpnlbaCaXNeMJgwFYO2n3nsYL2Vi4pCSvwUUpHRK6SFt2e
 /6GsJ+Ui7HWzbF+PF5i2ZFFY9sdxSFFbTxYdWk4UcJKlkSXY74Qk0AogaE6/FMzV+hTHI3ndCEe
 7OMSg5wwm2Lqsjn2UqfuBMlxglIwkIuZljLkqFA==
X-Received: by 2002:a50:99de:0:b0:57c:fa44:7a04 with SMTP id
 4fb4d7f45d1cf-57d4580b070mr6056896a12.39.1719325286790; Tue, 25 Jun 2024
 07:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-14-richard.henderson@linaro.org>
 <CAFEAcA9aij1SbdEQkR9=UhJO2uz1u90881FwC8KHLYuLFto5AQ@mail.gmail.com>
 <997bc99a-bf16-4a6e-80a7-c750435395f0@linaro.org>
In-Reply-To: <997bc99a-bf16-4a6e-80a7-c750435395f0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 15:21:15 +0100
Message-ID: <CAFEAcA_Gh5ChFNRFsA==oLWfmkZWWcLQyb7ZjcPE8=28p4r5Qg@mail.gmail.com>
Subject: Re: [PATCH 13/13] target/arm: Delete dead code from disas_simd_indexed
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: 2APj4vHKvyTi

On Tue, 25 Jun 2024 at 15:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/25/24 05:41, Peter Maydell wrote:
> > On Tue, 25 Jun 2024 at 06:09, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> The last insns in this block, MLA and MLS, were converted
> >> with f80701cb44d, and this code should have been removed then.
> >
> > "MLA, MLS, SQDMULH, SQRDMULH, were converted with f80701cb44d
> > and f80701cb44d33", I think, since there's still code for
> > all four of those insns that we're deleting here ?
>
> Yes.

...except "with 8db93dcd3def0ca and f80701cb44d".

-- PMM

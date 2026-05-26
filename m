Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00450CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 10:32:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRp4t-0002xJ-Oc; Tue, 26 May 2026 06:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRp4r-0002wX-91
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:32:03 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRp4p-0002vj-QL
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:32:00 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65c24be9e4bso10688485d50.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 03:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779791518; cv=none;
 d=google.com; s=arc-20240605;
 b=jpNp8P/rjTNYnmDj0jC71uCiv5gfuyBCsMI2Eetz+ndj1zX6xALjltvLbkbieTdkCk
 gAr/khxqp9ruwd2OKKu7SfL6y/JFrdik3ZyD6DB0og2p8C8dWrDtsiJbx/H76WcWRNc7
 xip5zYdfXZfvAr7jd8Ycl2YHCG8h8kKBT9ZGPOf0/f7lSO0AW6RUY3ZvgjsuIS2LJ7ep
 TVpkFJGGUNlJ9UBS4uSZAK3wPca/Q6Xke9+AX7tEZXNIVwBnZ+eGgEGCo3D9gLn7YHke
 O/YFHz6TsElk8csH2DuuubPdJQ4hCEUarWO+9k+HVgYWrDC6XdL7aM8mbauuL/rKNLh2
 9A+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CdB3Xeo/RDXmP5Hwr6H+wNirmuNzl+E2KmzTP4eU6wI=;
 fh=vB2Tu/vCyie66cU4xBIL4Zbm0zUL4mcNm/VnYbKgwJ4=;
 b=Rhm/Cdmx1LpReLBmIeS2915bZHad6O6+NH9dc3RuijEp05SxxXlSuThsNn4k8FHRnb
 1DhV5f8qSY6HeM3O0lPj7ENDbqjVsVNZAsMNGENO7ryQDgf2fix1JK3KvVpYw6Btg3WJ
 cgKgiC/FHx78SYoMtbUxOuX84XEKoWa6Q9PvquLyUfaLE4AUZG2NcdCdbykBH3o0yRMG
 bpUr5QTIl3r5ut736jxWFx/nODDMGbTmCl8JXHTR2bnpHeROhxtKsnSl7AyNd1tgI0As
 DM5NayNaDkPfRpV3fIQTBBs+lBxuJF4SxNjAi9MtsTdcq4Vw4ZEMQCW4wd6zvB0s51DW
 GBNw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779791518; x=1780396318; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CdB3Xeo/RDXmP5Hwr6H+wNirmuNzl+E2KmzTP4eU6wI=;
 b=xbtWwZFJKE9wdQKz8LFXv25hSPZq2ESDDf5qWyYIPtO1dNBFAEd33KM4BBv9oOZK4M
 XWg9PP4SquzKRtbRmGzcuxHV9XdYHbcZmtQLAcntIRlNg0z+4B/Ikjy3sadVyd1Jd+x+
 GkVCS3AkFHQ/XbQMv6gTBGCZJJg17CiwllDOUtq3ZKmdFPex56Y797bXcmkwos0xWf0h
 H63CwbZ26G1ufNSKp7LMI3o2rAK2WZf2hO57LqZyENERIFMHvehO3HJlPwvYd3B1RVhb
 PiZx34qrvVtoP5mEfV0Y9BC3lI6VYk85TZr0TSIpo6WuSXY4eu4jXS3gEi1urylwPW68
 M93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779791518; x=1780396318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdB3Xeo/RDXmP5Hwr6H+wNirmuNzl+E2KmzTP4eU6wI=;
 b=hIJlLO+hOAbbXyNGWgux89+hb43q5Kx8DsCeSO/aduwlwF23Rx6XQoImXo9t336Gkz
 ypJ2ENNQ4sdpEwYqGWVCEScYpIAuQ18qf1Z2A/THO6Matk/ZRIQniwVjBXX8YD8rp5DH
 xQ5SwRC2jMwEG0VSKbfijPB6ZESevCKfzK6wCObm7lblhXfo99YaqyLJAIxBVHUYp0Y1
 DGCcjbRPAjm/7oKVD1S07kPUsicA0G0c3PsYFoXRWNetJMWMhQD6UmsSY8fQE39ft3SD
 1cVh5YKYNsqpxtzhAWXxPmpNQhTR6+wW84jq/kFld+EciZljLb2kGYUEkFx1A9QE4zqj
 5vNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8la3dK8Csqf+9byNVMNHPqobg+mR/2kfoIwusNKb9i5LIDECZYI5xyLDxvjVKVYd1Hw9R6wnJgzw==@nongnu.org
X-Gm-Message-State: AOJu0Yyg5EaEek7raSuYsSZEN4QdGHzXFHOg7LLe8o6PzcMRQfqD5itU
 S6reg6tqDAM3fkTukfMdpkzxIo9weXSuwUsdXj4HZoBDiLRpXvRzHxx1Haw1NRT+wH1mY9dP8Fy
 WkoEWmJoWzAbQO+rUXDRrELPvGcvy1UzMnL8Xc3knktunbAtelaM0PdM=
X-Gm-Gg: Acq92OEAr8YVOB3P4PyXfjcZUFp2pzt9BOfAK1xVUcMOQ4K+tvnn1kSS0mKFzBumzAl
 VwdB0S7coXttDnLIEbCTutmH5G6Fuc2ZA0z6pY97Mtc+FkyT892ZRi6oh41NZsK6VLd1N2BHRJQ
 GdFbtEPrCsqt7rPY9eBda84KdS/1qIMGFkYaTYW28S4Vh30BfERVBnaUWKk5liSUst1G6/yn7kM
 6XMZLfhUNtXUuHHF7X6LsQE64wNOsmbbVSWaWUWv+xg5wlQ2r1UJI5j0/K+XOzKYwc85DvY40oS
 hE4vzt9QaKQkRmNiAQVwS+DHWvEiZrJcVNaBp3N3PYCYGM48Vf1zJH9c5NyW7JFVLpg=
X-Received: by 2002:a05:690e:4844:b0:65e:41a4:54d2 with SMTP id
 956f58d0204a3-65ec98d662cmr12268126d50.32.1779791518107; Tue, 26 May 2026
 03:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260522220306.235200-1-richard.henderson@linaro.org>
 <20260522220306.235200-17-richard.henderson@linaro.org>
In-Reply-To: <20260522220306.235200-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 11:31:46 +0100
X-Gm-Features: AVHnY4IFc21ZkDYeOmP5SOvU9FXHwRAU5aY35cUDb5mhypfKxGx8rRpIrRa3KjU
Message-ID: <CAFEAcA_DGdtL534Sp49zq9dnt7b4fQEFc8f-FvoT0KU7bvd_Bg@mail.gmail.com>
Subject: Re: [PATCH v7 16/64] linux-user/aarch64: Implement FPMR signal frames
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 22 May 2026 at 23:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/signal.c | 44 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Side question -- have we ever looked at whether we can run
the signal-frame test cases in the kernel's
tools/testing/selftests/arm64/signal ?

thanks
-- PMM


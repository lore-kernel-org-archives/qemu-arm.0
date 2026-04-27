Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941D3FF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:44:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHIVz-0002mF-Cg; Mon, 27 Apr 2026 05:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIVw-0002lM-FC
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:44:29 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIVu-0003i3-LM
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:44:28 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64eb84d1e37so7667883d50.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777283065; cv=none;
 d=google.com; s=arc-20240605;
 b=GIGjEq8K9ZIOJzQvAeSnQAdxhJLIVq5v0yzaVDLnyikjqbB/GqNN+AJULp8483bpSs
 PZDxExxq02e10Cqrh3Bjd4z09IEqSxsoz15g3jrDeHIm1q5Muov1nMtAP6Ml7RgKUxmo
 j3qYjP5X+I2jlRRFMRkhV/PdfmTAV7ftyFCuBBA/ZF1CbHtuXR0sJCsOlvzzX8OikvOR
 Hy6F6C7YZcnxx402ovsxv5GHIk2F7ru9RoHtf4jzwBsBXS1+HhtZWQyelFnzXAUEhPx4
 xE8e5iowRR8zhqUozDDIOrOvWtIQG3aV9P8hshbTjBUY4Oc1MBxcEGQG4tS3njGWlU2V
 hqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LbSEVQmL+Gy+XI6Lng+xGxFyxMrWeFFBBTACeEpD4cQ=;
 fh=RAFVKqKZv4mFpOCP3K/XDYT4cKXJmGndCkWKiSP6KDs=;
 b=h1s2dlKk9xzkZmQ9du+sTHuZj4/Kh21hgkIOxfhiTISl8tmFK1CNAjMzNOYCVnDIwF
 U8boI2IMgDg+HssMestwOaxDjzD6FSI3gsKP2P5FtYdF2eNfaTMg8Joyus28GS9xwvZD
 k+1le+ARGDDBluXpbGICqyPtDpbWONtjf7fN0+mlQDOinSs8KOPApMVLmGeEKONGHUiK
 ne9uAADIz1r1W0GmDc5Xf6DbhIECvmrcYrJA6suYqsQ8CDoxTTUdoGtEqnvBP6lTwVDd
 yKtCQEbwosMijqkFlNnVrwLjE4rCiG3XXp0DFqCzLVd5X79LhO5M1l32ZwtRdBwsD5G9
 72eg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777283065; x=1777887865; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LbSEVQmL+Gy+XI6Lng+xGxFyxMrWeFFBBTACeEpD4cQ=;
 b=WkwipVgwyda4IVSRMVqzwlDZkvtPISheQOJOwXJlDEP4L2adhjJIKtRFTjRCD8YHsI
 tH6YYJERxVulz2i9+o5CBmeug/wKqyRwvhvGId+AzDJvPTA3vUuwETZAdFccb89pkDwr
 UUk61/a5EiTAitydwhqjqnGoqPfIB21+rm18Adgc8sbx2WAxze0ovYkOuUaSY0srFauH
 VAebt6NrsuAVXgRFnsAU3m0ueMGC7gHVeYivpZZqSpW/3z7saTnq9cBNq3rhWN+rhvh0
 F7XvoTzYpn3q0XclV9UvTpETAP+MiDeoNaBqRE5GBbIOtku6Nev21arrpPTuy3QTN1vC
 cPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777283065; x=1777887865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbSEVQmL+Gy+XI6Lng+xGxFyxMrWeFFBBTACeEpD4cQ=;
 b=BT7VBq/UNmX4cZ8M8DnoPKd8rD+lG0rQFqMFQvVAPg1OudadE46NX9Elcqn8AmCGQT
 1kS2l9bMxtbQnId+eGmjk1GW7MFlect1Z8tot3S9DdwZR9AXVgn5OfgkHZTg+gyoR5Ap
 BLKjWStCqG6MBOd4wRea7fRbDRCgi1E+PBTWOC1x82yWAKkehgTPibGbPHeD3OmOJjSX
 Y1xPxW9iVHVj84k2ipQOfaO9v5n8KcYKDxSsfySQUwTAgWUIrs4TbVwitMj/LS8Mgpo8
 xMcg0Kr7IsKzpf9JPvDMPInteTIvAe9DlY4ybbZEHx0a1WURmLFtdVOoV6yh0+A88Pu+
 CebA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cEw0pDvWaENSKsVnjwhFNrzVz5SoSuHH70I567r5HnpHHtMwQ3RBNuDLyjYq2qli2ge3+RCyM1g==@nongnu.org
X-Gm-Message-State: AOJu0YwdIr25hn/TXgFxLbWzPA93yG/SC6DHNCIJvozw1Gms9wADtPen
 WqvqyEaYeaf+TEy/pPLGI6kSBgAFwjpHKoj4mNQQl14LxEiW6QqrsXOpGy/cg0i1Z2ea100YyhW
 qxTPCmbaGVFY9muFXJstiEBUsje/IuNku9kPUp99+9A==
X-Gm-Gg: AeBDiesOVDk6WLi+mMCeUN31bMEJNZqdh9yqGbyd1SgV+Y3pTPbKKRioGPSGrvw/yev
 qMs7UyzznKU/M9odLlqqwzMN/FoGW1PVWSlzvZMoZHFT4TC14An4bp1LYvYWid//uEuAkMuLz4o
 rZVaTjUG+k3YItzCfqaIZP2y1BRChI0m16D4ERYV4I3TB54HhiOK+kgJbdWKoWcZFs7GPvhmHGq
 LQBKL13F0A0XlKTUUsf9ect/VgdSJhih29jnpU5Mqje/9rrmUz6mBb7cUN8nZvfZRuL2BKq12Bs
 8sou/Rv+Q/1FUewmb3DKHEwpY/0z23XtNP7Z1PBbfqxFK10l6uDLLwnMJZ9oqnn8UniUBP8v4kq
 PBg==
X-Received: by 2002:a05:690e:b4e:b0:654:1dfe:ca8e with SMTP id
 956f58d0204a3-6541e0e2555mr32048946d50.65.1777283065245; Mon, 27 Apr 2026
 02:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260420140552.104369-1-eric.auger@redhat.com>
In-Reply-To: <20260420140552.104369-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:44:14 +0100
X-Gm-Features: AQROBzBAUWwqNcOx-xJGaI6CwdG5Oz5BpCKABJY_zB_5mL_6g9cVohmqvFNmY9E
Message-ID: <CAFEAcA_uLzLjqdr5LyLQ3EK2zy-ZoS8FfeDq9VcaobOozO3e2Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 20 Apr 2026 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series introduces an infrastructure to explicitly tolerate
> some mismatches between cpu cpreg indexes/values on migration.
>
> We especially handle failures due to an attempt to migrate
> more registers than exposed on the destination.
>
> Once the infrastructure is in place we can handle the following
> known issues:
> KVM:
> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>   from v6.13 onwards. Causes forward migration failure.
> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>   register from v6.16 onwards. Causes backward migration failure.
> TCG:
> - We can eventually remove AArch32 DBGDTRTX register which was
>   erroneously defined.
>

Applied to target-arm.next, thanks (with an edit to the
comment in patch 6).

-- PMM


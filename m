Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAD3CD13D2
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 11:11:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIPIi-0003Lv-9q; Thu, 30 Apr 2026 07:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIPIg-0003Jj-Ot
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 07:11:22 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIPIf-0004GS-65
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 07:11:22 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64d5a7926cfso710632d50.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 04:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777547480; cv=none;
 d=google.com; s=arc-20240605;
 b=B62Sa/iuIgcCfOThjO/ntudIp7Eb5XFj1FJoKeLBD5qgILzd1u/Y/bfpzS6Sprwzg4
 RNEH2n46IivJespxJR1RFbGqTeg/n8DCltRxvmeBWzhQmtDOgUNktAr1UMkAXPAxMtSl
 ktsKK8XqNdycN+Yug4G39FvoL2kRAd3mQA4DLppEgo+peOTyf1Ttyjhrc5wKUKGoIW3K
 gW8YR9l/KEK1SVq6T82TfIwAm/t5va0SB+JMNjq+hBb3mwxXTYNvEcJ8m9Ra3hcqepbd
 cgyPp8aLwbLYgt2NANQnM/7LgKICUFc5MINeWM8a0W1n/9XpYbjcyeyjHE+T6q8umAGo
 cSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jOBa2BwcZLSDUUpuDelqXcp1PkIGsEpcfuBTtZlPwHc=;
 fh=avAcaUabNb0kiGjoBH89kZtyR2ePqLu5Z7e0ThEYRGU=;
 b=eTOD26keXc+AhUkIqGsEWLAvqcH8/bUWDd9VCmTt9QE/HpyZ+92Y7j3ueKX0LLu5j+
 a/p8jOGKXjgb/Vm52nzt6vUhVyAfOrmLYzAXchcxnyqlOsA2yJyT4xqe7421LQOugcWX
 +xVosi3FzDxvF9U4FYFbL9mnHC1WhGhLWRUSj92yyFosGi+Ijk0g4KBLmi0xCFevjNN0
 xjKvb9NTfhS8m0iR1xZC/5akNfMP0n2SzKyRjW15ZClRwzXzJ0k97NUGys3QWe4itVJ2
 bPfHpNJcLgNpOnO5kiOWbXjIv39LW9QZsNgn1pMKzBYFwjUrjwgjylWKFRclHK7o4lkz
 JtMw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777547480; x=1778152280; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jOBa2BwcZLSDUUpuDelqXcp1PkIGsEpcfuBTtZlPwHc=;
 b=Vbv2wxZALkqS388XOW7n4cUU0i25tUYQlnpkWi5rH8TfCLDgevVJ4D2iPUdYVZ9bCK
 Kg1UfRwZw43ArZH8v5SXjPncKgQBRvCNYnaEtQNCcS2I2xe3GpxySEnA1/A4oMSgbE5K
 Ra58oSQDimP5M/PqzkChMlvMPcSKFKLecfS7DCbq/k3HRQ5oyQz2tnLH484oSy8DQHmE
 KmKUvC2lYtciOO1JD9pugJZGA8Fi3m36Ir1kfQaiF+RBbLVVrTcjKiOQrOo5jbDZfSBe
 HIYsZmBB+19fzTAYLe6qIejphJMT59OpyjOn2mf6FjDtR+nLX/xbBMsnDvehCTs15s5U
 XBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777547480; x=1778152280;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOBa2BwcZLSDUUpuDelqXcp1PkIGsEpcfuBTtZlPwHc=;
 b=XByfcGBhCFOpv7GzPbmQRkXW4Pt7giNMbDtuUa2U38l5ZsoJtyLOjQ28q6dOzHodVH
 8cf4WOgA0wTgMwWEImLUIQ+d5h64MIkkLVeccQnod6/IyuST8qD/QRseNPrVp2edNfEK
 iT0EBLWNsuQrwMz97rsAGATo639lQXOj0/csJI8ZRocG5Er7J/zh/ydeCtcDDDMlO1Va
 AQgT43lmAFadO8uItFSuDetA4kiTG7DcoNtwxR3Yli3puEibA+DwKdAuywopVZT3BFSv
 9Jm9o6igvlMd3CD5ubyh9uM2BdJNUQ3o6q442PDEqgu6Y7OmGkgYEjVEGOuT89YetMqL
 YZ2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LB7D2kwEAysurZdftni1wiERm9+tUs72P+/iGfmuHRQRpYRJvMprLe1pyhRQE/DABe8Nkn3Hkwg==@nongnu.org
X-Gm-Message-State: AOJu0YwHlk7CnMhDSF3GSXOImXLkLl9qVgKRmcxpFLp1YpAohqbd4GzC
 ZcLct9uPtw6VuANS6V+DWVWTcBk2GuIJ2UnjaoKSxEo3P40XBnifMyo7x7x2cEMAhEWZg09DWdW
 JZ8Kguumr3pbRCpepIPU/G4A2jPqcPE78DMF+PJXBbimhDFN+LiqT
X-Gm-Gg: AeBDiesZBO8KPJviOcfk5YsmOh7Th9mM72yTV+t0tw44CQqC8lmD258gFwIg6zJYQ5p
 iYhRJ7FVWAr/YRTECB1ZLhEPSIhZ8v2OMVt4dO5wNPdIPCAtuXRyO1LZ29CFgO7qiz7Ow44xFYS
 fgLIqFF/SFZi45w0pe+vBE+IjEcBVXjaYBJtD/tb0d5UFcaywBTNjHJKO/e8xg1ahYyDszZqGee
 6Ek3Ur29JB2Wm8jdy/cp2oAAhBnjof4nFNnOZXJTvst9HqUh7k/uPFvTRq0Iq1m44GcP7Ont8oY
 pHCSQk/o8gyDxDQfo3nWF4UrbRuRqjJ9qJwczRFRPL1MU/OGuZnLa4v4NNRW9WxP4nwDi7at+Y1
 ZyA==
X-Received: by 2002:a05:690e:1a49:b0:656:25e6:e127 with SMTP id
 956f58d0204a3-65c18aecfd3mr1354623d50.11.1777547479592; Thu, 30 Apr 2026
 04:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
In-Reply-To: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 12:11:08 +0100
X-Gm-Features: AVHnY4LsLZu729GJkA52_DmE-18Adk1BJNDMx-suWx3bdoGRDgmLnEvtUJWUsHQ
Message-ID: <CAFEAcA_8RUWYNSByA56uPd=CpvvF-vM2cwYcyLW85z6ZJXUoRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] FEAT_RME_GDI initial work
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 21 Apr 2026 at 15:22, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> Adds FEAT_RME_GDI, some extra cases to arm_granule_protection_check,
> and a very basic TCG test to check the prerequisites of FEAT_RME_GDI:
> FEAT_RME and FEAT_RME_GPC2.
>
> FEAT_RME_GDI is not enabled yet as no functional support has been
> added; it can easily be enabled in cpu_arm_set_rme in future.
>
> In the future we should correctly set bits in the fault address
> registers such as PFAR_EL2, but I don't see any apparent support for
> these in the existing GPT mechanism. Testing this also gets tricky as
> I think this would have to be done from EL3 (e.g. by modifying
> test_rme_virt.py)
>
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>

(cover letters don't need signed-off-by tags, just fyi)


Applied to target-arm.next, thanks.

-- PMM


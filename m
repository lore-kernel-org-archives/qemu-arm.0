Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2886ECDB471
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 15:19:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wc2tf-0003o0-Fc; Tue, 23 Jun 2026 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wc2td-0003nS-OZ
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 11:18:41 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wc2tc-0001p9-B0
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 11:18:41 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-662df6a4fe4so7139944d50.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 08:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782227919; cv=none;
 d=google.com; s=arc-20240605;
 b=i5N7PpjdL0Um7/oEBxVoi+ElgYOjhwMmdqNteehj42kvKcafD1ITmATRBZJDQLGvgJ
 +RkUEAxJbAf9qNHzxquWsRd/cr6DA6xVLOjYZ5i/RE7/elfRS8T/uynN+jMz++mWX1hu
 FHZYwjVtPw3UCmwf8BFSZhXgExSwrFalpVtbYRbtDjlENyFBT0gonOel4eOQIXKNnZJU
 7oYfL1UGXUfBHWx+jn4ccVNQdHUAYdT//tXm46GVA5HWHn2lPXYEoqzH8UHh8Xm9Rc/j
 W9D9mriz5hA4US5iR+9nKhrH6t85UWvnJ+jImWHz2vymQWiH0YNi/RKSqUgglHKrdLRW
 chyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1HikhzCygbcSREMbSxKDYoUjkFnj0CYVYDR0dfelPlI=;
 fh=OLFutRwhRL6PNsYPJuv6hiQfsMU8bPw6cL879n4eW9k=;
 b=Mg+e1sJc2Zm7e+b1a7BSXXUGE2K+omEtIB2wwf1NC3+DkbNP6KL62LLmD417XuGnlo
 fGpCIiP3uoU2GYDphO/lTZrTxVosHi7rfU8Z4J2S0eBds1k1FOXMFp5n6eLq6IhM+tW4
 s4l87thvGRLbVSL6WKPtUnte1ppJOy8plEGSuGpLgmKW+OKhxSmwmoeDnSE2+HhwDy4c
 SyO4yYSJyU+8UIp7Rz6DQSq+5nQihM3C8RsskdjsgMGnZhdfoWfFcHbd1EK0WTofjPAT
 FRuNWYYCP7l+t4YtnnnlMUuJEBh4Ki7AqCv/yLA0iAwbWJ6bQ5Z/bUF3+q3V2S43PmrK
 BeGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782227919; x=1782832719; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1HikhzCygbcSREMbSxKDYoUjkFnj0CYVYDR0dfelPlI=;
 b=wb+GuBjhy59gGxleYleuBzzwTAchkfENSv6Ou64zouSkpaLDCCpbtbv6MZ0+Y/6Gm+
 h93pPpWnU287xyJiMilAzClTiMeuPz4GHj0/hvCxyJjH/e6Qlwkm+AT1VZXC+P33Z6YE
 DwA8ir6W73j3+yLjIeHz9LwZYs2TeHDqZ+zwUq8xGaQGf7ZhkwJyVog/KSdBoCaE7/tE
 fkrVtx7J2B3OKyYDXaZfEtVSmHuvcUxSS927AM/9ht6ieVPb8kkb4JsppH2MmKBDGl88
 6kC+BhLky+MDFefN3bsIA3KlOc7H2eCt5GfMHpSW/0HPCKWregmXAYlLJRg3AAQc2A+v
 wTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782227919; x=1782832719;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HikhzCygbcSREMbSxKDYoUjkFnj0CYVYDR0dfelPlI=;
 b=J+fw6jjuluQZH/D3/UpIvgV3BF9R9G5hEsCWrvKf6OsLKEdEQehDXPxEFKPo+DeW6K
 tNqWm40PC7DtEvbOnR0pwz8k6FQRZQ84GzgkSSOJOyctUP6QuXn1Sd2ZVQTYFgm4FdiC
 nq225pX1PHJYWk8MGuvYjfj2CNpIfG1IadEIRfqeio6VWPXTPY6T9y8B7VDL1igvMBQD
 LIT8xLn4yIholZ4XnF6riJUnx8076XFYi+drMdhimDE6th30zPSiZydBN8aI4qPZq+Q3
 lBE5XFwhij1ngVJr48FAbI8EHiXP8sziqQTPwzsWhzBKLrQjT5G/1Z2OqTRebF/MFyj1
 K80w==
X-Forwarded-Encrypted: i=1;
 AHgh+RquiK1m83AXf91lmgV7es9pVvXxDP+gviBNmkUQicvL7sLQdmMI8q3MeyXWwB/f+5mMxoJ3FN62GQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/pp7v0hP2LR6BuZdwmafrIHVnhcC/RhRh3FtskIem0hgiLvpf
 aE1+u5kpfSu00DmCvM8Lo+tMWzH8U6tbTHG8v26e3Mp8NQoO9hzfpWDODwlSv3NFbeTshbJTkQ2
 KpOboAH1ioHhhdyAupAXhFMpb5citF1hkCRFaV1tCDA==
X-Gm-Gg: AfdE7cl/kziiT/+HwKQLHNijF2l0VbKd0dcH7aw5znpQSNSPj30drIZbF9mfN23anJM
 Xqor8Hsw5tbl6Nog/g0b3uMvw5azrHO/2U/ERsMRbFEdpTR0fyZXS8BSJvTivl9MWa0tWqSwap0
 gmh34+Gw+SiwKV+4FIivAWdTuHsufZf3G6u8QKu8mtK7tA32IOkUCf6eKpcfviKDSLn9EyzmJg6
 vKUSESYHE6PaRN9lfteI4svS69OYj37Y7ZOXvKCA+nWLVOP0vKWiGkMrBQ98P4FCsrCRjz1P0rD
 k32J+QUI7fH68Ol4tvGkscp5Ri1+pNKJpTXeeuPjNOsCnPS6Z7kHAsGn
X-Received: by 2002:a05:690e:128e:b0:65e:1d95:29da with SMTP id
 956f58d0204a3-6635a026a1cmr2997845d50.32.1782227918435; Tue, 23 Jun 2026
 08:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
In-Reply-To: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2026 16:18:26 +0100
X-Gm-Features: AVVi8Cex_iyqwGUpp_Ts8y0P6KkIZbqVIGOEv73-UmYxjupz8zTiA8P-I4SYa6U
Message-ID: <CAFEAcA_4w9SHZDwptYYnfGhgpWOeynZQ43fjuvNZo0VDV3WuHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: Add aarch64 GPC3 bypass windows
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 18 Jun 2026 at 17:33, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> Adds the GPC bypass windows defined in D9.2 of the Arm ARM. D9.8 (the
> APAS instruction) is not implemented yet.
>
> A large part of this is testing. To test GPC effectively, we need to
> check that memory accesses are causing exceptions, or not causing exceptions
> as appropriate. For some tests, boot.S is altered to record certain
> exceptions and continue executing the test. An alternative would be
> to use gdbstub to break on locations inside the vector table and continue,
> but this requires significant coordination between the C test binary and
> Python test driver, so has been avoided for now.
>
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>



Applied to target-arm.next, thanks.

-- PMM


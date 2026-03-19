Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108831075292
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 10:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3AAM-00072I-Ia; Thu, 19 Mar 2026 05:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3AAL-00071v-72
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 05:59:45 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3AAJ-0004um-SM
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 05:59:44 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64d5a7926cfso891833d50.2
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 02:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773914382; cv=none;
 d=google.com; s=arc-20240605;
 b=MNHSigYqCzNA5jj3H03QoO+UfHs6d1wKhQY+wK+5yAkpXF9S8RpCna3Y/bLYdEAWlE
 wD3xqYAYx6KLnCpNn1HCipP+LLBMdOOXPaZwaH7j1qj3LkIGnQDksjZl/741NMx9a8AJ
 r8eTepvCh3M5N9rG64oVTnb0lBvzSYYnFAchxdT+DmsJ6AfzBMuyve0/VnA+Xeju7owt
 AJX5y+VHgCPMklc1b4oFADnswx3bIwI/KylM+ryYeadNK19byj0l89CvwOwm5Zo7xyMe
 DTpCNCkwmnPlSWbsRL7LHAI43r+TmrJd2oTg7DddOllQx6kcscoNKihhIdceDOIcwRxX
 uGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=l9tqgiVeDF2QTwXIY1oClhARxh/7nCn4FvukClUXyxU=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=AjXXpBCpPjFiySjCGORcoN0LR/tv1tHQygLbjXNrEtsGKfmYy6B+Jz6FImGNTfLEK+
 O0U7tGbX3/TjEp6n0i/YEcydv48OjhLzBkM9zMWsXJKCx9QrYsNR53nAzJVv9WGgozoE
 +phgjE1XmDrUkU7tXbIeGOXSM2tQbuStO+IqaeqX41sTTZxhcKXTH9E17NE6VcZiKUdr
 sv6+LWdISZV4oSY9dl50HSKQRvR3hu79djtwzvySXONhxgelm6Fgmmn285s+xu6XHV4H
 +UoeiKtJQ/YKBs4S7ACOEwCAIQt3bkGS9vTouaimjKGp/6/tengUQwg1HEr45HVrVrHu
 In2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773914382; x=1774519182; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l9tqgiVeDF2QTwXIY1oClhARxh/7nCn4FvukClUXyxU=;
 b=SUQ65/oHDXeNKoW7i3X7c8Sg7svVAv+B36R2G5cF8inWVhwH0/8z7qwM/yf1Hv13o3
 xZkh/eWgKrUgVK066yXbDqyX1xmISS6Rv88Usx6gszB4CTXl7YNeg9S43oZEDO73kUpG
 6uXNx6RpoSpXBq/nLXzs2vijQ0oNxc+VfzZgfC4yfUn0FJW5lKH2l8uQY9Yx9viPZ36f
 UabI77VBYpZkmyHD5Sp11glZUUrgHTwpzplCWlM5UEhuwpw/vqGkxxEiZfsO5V+7+gbL
 1TDGuTlYoraSgoVnowGZulRw7cZJMDhjOj+hPfoZARIx5+s3wlNNkLdNG/Njw9QHMv3K
 TC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773914382; x=1774519182;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9tqgiVeDF2QTwXIY1oClhARxh/7nCn4FvukClUXyxU=;
 b=etNuUV7Sf+dMqqtxzhTrBMR0EjjbpZNVmEgjUlAoL06veeNgr77bO731lc8fwX4xJy
 GZICodXWd/heFf5Qy56tmU35eXIaPQ7RcFfVnmBKSo1lg+zAJTFoI2XeYr9wXkqrIMZH
 2lCWsbUCnB4ee4sJmBUxM7w5EvER753gnPwTE5yjPOtKEeKmvOPGyTHbx6s6tbgMtdSb
 WwqLkAfMTWlKcj9VVSHSc/PRAsJiPvJUbPGkxw+xWYK8p42eJIujVy9ou1Y1hXrszXdV
 VDlCNMYZY1L+imyUE1cGWpPrqxx2Xc+J7Tu8qKW1XXfIzEqxR5GSjh76KMwve3SfEc1V
 dX1Q==
X-Gm-Message-State: AOJu0YzMXoSFGW7XcX7JOjCYeUouUyNqxNX2CX/A3/oxFyhB/btaG1Qz
 dGa8H/H0h8uxuO6V4aUAD9+vs6hbOzEzAGZ4vB7X/as6n7bc0MaYoUDoGOk3O/y/Ffrd0QXuH9O
 z0UFnwAbL7aaXryWPDMwX829QAC5qa/M2bXrK8DJT1w==
X-Gm-Gg: ATEYQzzOIfZ7ovPJltqTNcVqUAjeFrjnAyXtyoLy2FffOzrjxA7Q3Gtnin4UoHgiPhP
 g886k+SY59zOfJOrmGfhL5+HWeLlJ5XPs61Arvun8o+XSPj5DKLUjnV7/2DyquF2RR6xX8lPgX9
 KvMtRZ3l6YGJsQbwwQfgKy38WAINZRXlhRZlc/JhwQzz4iAFx5EPWWL+eOWHSiKC+em4Kj/MzVR
 Zt63PHiqrVvtG9c9006BD9h4t9KDqvi01mlzjLREbv4pVYE1RnXR7kTzF1nMK9XtAnjaSx6R7Bc
 6wMAbhbk4r7CNi7z4PYhREhVu9P8YFPVPSNgMI24tzQFRRd9G8c2kW9Xsm4Y6wHVSrK1F7vUGpH
 DsQ==
X-Received: by 2002:a53:e1a1:0:b0:640:cccb:1fd2 with SMTP id
 956f58d0204a3-64e9146c49cmr5090061d50.33.1773914382196; Thu, 19 Mar 2026
 02:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-21-peter.maydell@linaro.org>
 <20260311141537.00003ce9@huawei.com>
In-Reply-To: <20260311141537.00003ce9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Mar 2026 09:59:31 +0000
X-Gm-Features: AaiRm50a1o3pKLIyazQ4KykB8ogHiUaaVsfnUZUtHi95PI9cNp5LRFGjv5DOhCU
Message-ID: <CAFEAcA-Pjbu+2u+xg7xbrsgq94yU+yYubf=iqE=YvYMGzgPyCQ@mail.gmail.com>
Subject: Re: [PATCH 20/65] hw/intc/arm_gicv5: Implement remaining set-config
 functions
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Wed, 11 Mar 2026 at 14:15, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:27 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > Implement the GICv5 functions corresponding to the stream protocol
> > SetEnabled, SetPending, SetHandling, and SetTarget commands.  These
> > work exactly like SetPriority: the IRS looks up the L2TE and updates
> > the corresponding field in it with the new value.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Trivial formatting and naming comments only.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> > +void gicv5_set_handling(GICv5Common *cs, uint32_t id,
>
> Might be worth throwing _mode in there as set_handling almost
> feels like 'set that it is being handled'  Also aligns better
> with the HM naming in the spec.

These functions are named to align with the stream protocol
command names in the spec. I agree that "set_handling_mode"
would be a nicer name, but the spec calls this command SetHandling...

thanks
-- PMM


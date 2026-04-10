Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E5F459EB
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 15:04:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBDPM-0005La-MG; Fri, 10 Apr 2026 11:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBDPL-0005LD-A2
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 11:04:31 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBDPJ-0001L7-S6
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 11:04:31 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64edf260b49so3324727d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 08:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775833469; cv=none;
 d=google.com; s=arc-20240605;
 b=Zq0kAEidnBLzPhz9yfWF0AKePi1w71+HcO2O3lYgoIMRjQYOYKwyZ+WguA5eB4PV02
 C69xZzn+i7xHggugr6vadGcHSrGQeVVCnfNCEWi7y+tOTDRZko0ma4xbXUsOQvnC0r4K
 4ASz/xJUP9i+7ubICP7swX/IxXEgDGJs07XsLJrYX9RjhL+KnPF47ogFkWZgOwDGmHaR
 wfAQKAkGf8PEMt6H1G/BA5pQ/PCH1hlnu+di8n4cj2eWJXArNGxu9fqaLY4FtlWLULjz
 ar3bPtiHjDNl72vJGAwyUNDj2D0fU5blA4xyPhXz1jLaCUmORqEBlhtnZUg3cBGQJFXB
 7tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6SQCY0tTnDDChZFId1z+GikYvHBYH0iXdjUWdU46GYs=;
 fh=y6MrUtizKHMRWGRrY1qpUiq38biO2fL55FvIh3/gKmQ=;
 b=Fkh0dvnQapvq3hBa/M/jw1WuLkjxiiVXZ1n4W4XwvPdTygGvFvON9ry6p4vMrn3Los
 Op1kAfsh3dDrX02PMQiTga16Ixp4dmkRfVd2qXFH3R7RHsd0iEjNmwffC9RsZFxBDV8P
 raWYHXlXqn/aA6ufUIEFvQMn8InV8LWrlV59o4gIVCms3AbeCs4ZXWIp8cOtwqn/u1UM
 m8wcFNSC226eSc6Zh0F3yzm5rPCYqTwrDK3rIOYPs7Fv1pOBuH2MNTwgK+0XxJWco+7F
 08uBwU7KpuFHpGMQUkEcnSGJwMj1I890nnav86tylVfE+Sprj1c3JmbcFUQ/Mdv+ZDvr
 E6EA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775833469; x=1776438269; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6SQCY0tTnDDChZFId1z+GikYvHBYH0iXdjUWdU46GYs=;
 b=KSgO+4EPg1np58TLkFCF+dSKZhVnz8dPtmxMqle1S17xTFJqW5f08upUIVt6vxwowm
 wA1ltA5yDtjXQH+wuNqZwm7N+83yX7iU78AHK8hSfjMrykqFcSMnEyO5aIbhhIVuVMrV
 YkX+Ee3rtpBmt/W5IN79bJZeQKgd3Vi2IoTfW1ocGeIL7vmxIg7nb9uq8Pmjooyb3jAl
 ZF/QVcHhNvnbuZyzjJKpIusISs4FEMPdzZ8OaTUL278ewe7rxZVQbUWBzDoMA6XlIrzM
 O/3c6gOji2BCrTHp0FPBH4Knma0V3hzdLhuI+OHzRcXngzNZdaCJswksnjT+Ee0yo0gd
 2fFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775833469; x=1776438269;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SQCY0tTnDDChZFId1z+GikYvHBYH0iXdjUWdU46GYs=;
 b=UD+00gbbUt4Bny2APh+BiiHFDwe9g7aHyQELTR7yDLuvwrlsTg3Gr0OLxBxe6VzekD
 5IbE24EFrIqaqU7fwniUBULhInj+w3wwXoTwVFsfh40beBOX6lKx6XsQU3RaUQs/78GK
 Gng7DpYQl4yGgjqwW4I9RBmC4QopnZM8l2pSFRlf33Y/POyFONQtVP8flYZKH/hG52cR
 PD/XW6qoAlTS4rfn4mUlWgIaTJaXCgrczrpisNXnpZpeLBvaGsWEVuQ0btAGjizK9oDU
 l4eWQmsuvfJSGX3rDX3atP9ek8OtH313M6nLi8oqgcTrkOgdz03e9d+XLE5eIZBFXfAp
 F8aw==
X-Gm-Message-State: AOJu0YwgDxZ/OsnMv4nTQg831L1yc0XGDyVwZWQJQ7A+IJFa3ZlvRP8v
 JH3AWzOHlBbnMLUiPl3GrT7xpP7aPxIcp0Y5me4R2gu5lho4pMDN/Ztz/BpFj8uzqHhQK+p750b
 E1gKQyz6c7I/E9PozEh43/P+ay578DXW58Yd3SVJb1CkEibAO7c3Dpwg=
X-Gm-Gg: AeBDiesE5R1l0gJtyWhqHacm1JvlzGvutjb7DdspgqGeRw43D1MlnSFOgu2ik+A2P/o
 WyrNTMW82VlIBPjSo9ppTvu7Ue5+FIX8a5KH0bhZgdb6yCsoWm1PXcuGCY9Rj7XQJJmwTUY/Uzj
 SAdG35nl8LVrIA9V2o1o8Cn2I2tYSYCo55o3gJCp7GKWoXBnA8bT2c07Oqr3vEwD9QLDmbcKEHK
 w3GjPomrPYYqMRsrG45WpSt7HJ5AXIQStIsxJsBLCnObitI0vnOmpzPXtOoO4TZz/CnKMqzlE81
 R6NXUTpU05o53sRF0hGTkLqYdJY82V/qGmyP1K+ct5YwO5xJK9f/LI2BZAgiqiCci/dyrRM7iCf
 9dA==
X-Received: by 2002:a53:ac87:0:b0:650:77d0:8f7f with SMTP id
 956f58d0204a3-6519905c33cmr2623494d50.21.1775833468434; Fri, 10 Apr 2026
 08:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-11-peter.maydell@linaro.org>
In-Reply-To: <20260327111700.795099-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 16:04:16 +0100
X-Gm-Features: AQROBzB46PPWYaqNhobPPWhn1Q5ByeFwjQ7KYkNE6o2sxwvQFCAIXmSmpstEoZI
Message-ID: <CAFEAcA9L7gqa9FFRhWpcPF2Xmr4+OAX13he_McG_CV1xkDAzkw@mail.gmail.com>
Subject: Re: [PATCH v2 10/65] hw/intc/arm_gicv5: Implement IRS ID regs
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
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

On Fri, 27 Mar 2026 at 11:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Implement the IRS frame ID registers IRS_IDR[0-7], IRS_IIDR and
> IRS_AIDR.  These are all 32-bit registers.
>
> We make these fields in the GIC state struct rather than just
> hardcoding them in the register read function so that we can later
> code "do this only if X is implemented" as a test on the ID register
> value.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +/*
> + * There are no TRMs currently published for hardware implementations
> + * of GICv5 that we might identify ourselves as. Instead, we borrow
> + * the Arm Implementer code and pick an arbitrary product ID (ASCII "Q")
> + */
> +#define QEMU_GICV5_IMPLEMENTER 0x43b
> +#define QEMU_GICV5_PRODUCTID 0x51
> +#define QEMU_GICV5_REVISION 0
> +#define QEMU_GICV5_VARIANT 0

Apparently it would be better to use a PRODUCTID of 0xfff here,
as less likely to clash with any potential actual product IDs
allocated for this JEDEC Implementer code; so I will switch to that.

-- PMM


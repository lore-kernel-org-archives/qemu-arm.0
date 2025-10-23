Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68799CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:52:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBun1-00039B-Ew; Thu, 23 Oct 2025 08:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBumy-00037s-C0
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:51:32 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBumu-0003AS-T5
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:51:31 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-63e17c0fefbso797105d50.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761223886; x=1761828686; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+5PqL5ZxUUsmEc2PAC+LfM+bZGlSeMgP+auKmNkesXo=;
 b=DUFCWp45E1AVgN99FvsRUWUD4uJCySqZV/rPQqetBUhHDUCXmpgwisuKgAabUJ7KCZ
 GWnRXJAEzHuerGbuzvo53mq6wARLtIeGNL95VCP+XE5wdEhoahsa7gJ2YUg0vltp2Zw9
 HDu06TTHlSZqHwZ3SXQ7fDs/Yoi86YTeFGU7sLjJb6Tkye6wEY94p1sr0VYBNPEJ4AJc
 vIXmRM5Qt7h/v5YBttmIMMMitej/sKMnxB0zlR5oVNcKWBnh/Mip/UZ7Pjw7f2sA56E5
 dJBdNa25TQHTx34xPxqOhR1sBpwUi656ihO8zlHgDlazcD0V2krSBk0lwhDBrVukhpoe
 bdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761223886; x=1761828686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5PqL5ZxUUsmEc2PAC+LfM+bZGlSeMgP+auKmNkesXo=;
 b=KHzE/r8b9qsiHtzryKdDSvz33lxTcksQ2Hk8QUrHGbbV/QGEQVmoriJV1hDaTHOBdP
 bMYNFzHdL/HkjcR8ILJNfLYETe4z0O4sf9zs4LSNF+Cpuh9Cve7UOJDPX/JjPPNvPinz
 q/yk77ZlcgzIe3cmDfLUYf6yFYVeuGePDiM9ZWSlziBC/znzgAmF9yvi88+OfCk92mPc
 Q5+Clx6zCquhkq1gWN1k+e/9xQu622A4PxOrViJ/at6gnw4foCRuSWF2Ul3VRTlsIt3S
 2gFJgPy84ozqvjtc/HNfmCzkpbreLizhUwxqrKTpTKnGqzCsYqfe/dXb4pJ4rVYiNTjf
 TFhw==
X-Gm-Message-State: AOJu0YyMd8MltcTWn/sU569+p9uexUhwZHYPGzYuE3F/DtzFanyH5j06
 +sBZV4tmmcV6uQU+sfvNmCn8FPdASAXAeA4UVARWJzbQvADc1ABVJyldodS3FSNIqApRxkhplJf
 lxmatyF5VD9dSw/LkSTqxnuv/UoBIexbVOtaQZ0PWnc4xS0q+iaWQ
X-Gm-Gg: ASbGnctsJTsmnn8Je6rnWlckzen0MEu24apC5FF2YOFQipSvmCUtza/z1Bk8mnWzbmN
 shnEI0VYZZp+vX5mOqHXTatksfNdi8G5GYiXpfzWPzt1DOY5RGWXylMb+GDOeQx0hB+SzE6+S9R
 Ojon5U76njfNkqBSvrwMuwxuJOl9Y/jFCl7AD8/a4/e+CY88ZkswWx2GY5aXyFJnr5jcgBkAAC/
 jNr78OcK4BmQb0s1kd/gFXkN4XOIjm1vYb2wwIwztDmH71KCMOFbhxKldENZd+Hwr1HJK9r
X-Google-Smtp-Source: AGHT+IHSLRsQ4vEaol9uukXm+lusfl02KWmZxCyEr67FYX85YmpQnPDN29Kvvc9oOQLd1Ho4rDVCg1f/AV53gbkNEHk=
X-Received: by 2002:a05:690e:1511:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63e160e98a9mr18500658d50.6.1761223886060; Thu, 23 Oct 2025
 05:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251017153027.969016-1-peter.maydell@linaro.org>
 <20251017153027.969016-4-peter.maydell@linaro.org>
In-Reply-To: <20251017153027.969016-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2025 13:51:13 +0100
X-Gm-Features: AS18NWC33KCwJiaDFRUpINc-4aLCNb-T3Np3MyG1ihe1OjHu4K0U9pisn9bjtjk
Message-ID: <CAFEAcA8BobzAHpgQ3p=UVN3p0Hm1_P_xr8AN=sJ0GQtFP98FEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/tcg/aarch64: Add test case for SME2 gdbstub
 registers
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 17 Oct 2025 at 16:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Test the SME2 register exposure over gdbstub, in the same way
> we already do for SME.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +def run_test():
> +    """Test reads and writes of the SME2 registers"""
> +    frame = gdb.selected_frame()
> +    rname = "zt0"
> +    zt0 = frame.read_register(rname)
> +    report(True, "Reading %s" % rname)
> +
> +    # Writing to the ZT0 register, byte by byte.
> +    for i in range(0, 64):
> +        cmd = "set $zt0[%d] = 0x01" % (i)
> +            gdb.execute(cmd)
> +            report(True, "%s" % cmd)

These two lines are wrongly indented, and Python will error
out with "unexpected indent". I fixed this up in my local
tree but clearly forgot to commit the change to git before
sending. I'll fix this up in applying them to target-arm.next.

-- PMM


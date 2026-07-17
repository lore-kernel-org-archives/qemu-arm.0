Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1345EC4451C
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 11:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkgkI-0006Vf-0w; Fri, 17 Jul 2026 07:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkgkF-0006V4-VF
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 07:28:43 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkgkD-0000CD-Fi
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 07:28:42 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-81ecf499af9so45074777b3.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 04:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784287719; cv=none;
 d=google.com; s=arc-20260327;
 b=TD29tNIjAlg8YsipYB+DVs5mdxBOrvhQqihbykzQarJ5pFPjJENg+0C+4KWTlksgct
 Ilq6T28A7Kp1stCy/z5sJxkU3aWdDHEEPDilOUELhSN00Qb5fxYEnoOmxVv3YchQ0rs/
 485oCZ5Md0IlNynCVH3GkqsexYAb2aBR7RBSI+rXz9hnwwFeGRlm8J41rwFYEmoFUNo1
 aZYQ9yZyh9QsxwuQOXqeVozHtkk9FhkYc6TcZ0mVy0RdXxV0cvePkpBofMFV+287I6it
 aqruci5x6e49IMQUxqHanMXZ+VeiVBpkFAXJp3JT8acyNWiCFAUzmR0udxsymAL+mU5x
 0g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8csP0/y1o4tNevTIFivehVlkNlmNFE5TfYnkt9pwNXE=;
 fh=vzOnVi298tpRV5SQXFA+rnb60BNU4OKqvCxMCgFdLtg=;
 b=m6vIYdXK3+PccvClP6TMPq3+AI/bkuwiN6FX+8/rzzOOqRTE0sASWcOzykUHyUNagW
 4lWybDPW4O+PYHFeV2+tPBND0a3ELU3BzgEw6m3O/c4/sgJ5JQ5jkwQBajYUZLhzB6ES
 DHUXC2hYn1s4ouDfmE2TUwHvhFpw/8T42MiqxpnUjL8dsjH83ER9zkJM2T/3wdi1sRB5
 +PM5CnA6FnCmHewCmiYB1+uYeahIVmkfZlczhlrn0n+ZO3EzK300ZgvYtGhzqxvnG1Pf
 t3fxh3LOcOBChmgykXiTiu/k506e9Ii9KvdLnJwiN0GIpxmwGDn0IgscNQ1Zj4B468s+
 t+iw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784287719; x=1784892519; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8csP0/y1o4tNevTIFivehVlkNlmNFE5TfYnkt9pwNXE=;
 b=MeaoY7KU8CUMk1ymwI4JGKMIEfa29McB0T8+p4pQHv2M1ebsSxdgZ4tXZ7Z9yzCsZz
 JvovlMuXscMn3SoVFv4aurXerpycxtx3XccQzgHNU89KPTFOE4eA64x6r50HBESAveQB
 UYoHmaqkkAD2BY22e3CS7nndjNgJSOy0saXfEZSNfZGYSb4NazLh+ouc8P/hS2+QZ4KD
 6bFe4qDCwhrTXeAeswI8VsdVenhoo/ptvJJDcPbn9d9HsaRExH5B8wFY3pRib37f/vEa
 EcTPy0YGwcsAHpGQAF8dAjJcDxxHVs18rWDMugZoO0viXP7ImI+sKCKbYgnJkfeB8Un9
 Vv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784287719; x=1784892519;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8csP0/y1o4tNevTIFivehVlkNlmNFE5TfYnkt9pwNXE=;
 b=QeNQLGukakyKGr1215QoAhaT4AgVcmrV8dhUStr9iJdibJQb08Mu9hxOYJF7BirKXU
 i55n3J9XORNIgTKuBzqacD7xAcytBe2fcPW/YS60wcF76UgR7kKK4Z4Q/U2/fDsY7RcQ
 JeKSs6D04kJucBKzL3Wl2R4MOJPvXKvA/gX3YCvybriv65Trdd4nBvgeELevFjMBNbBz
 KDAdiGArqgCPeHbODkHE8Q89SEdzIsTYxBleMNwv0dMJSANEm2tD1ePSVfUShU2cD7zW
 LZ2oVMdEEEwrLB0cXRMC0CJSpw4Cp8GOE2T+CxF2+aG9IElKIm6vJzaQBEKJCuXK/Hqc
 lTvA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGvQ11gZvi3venSR0wvl7iNJBHTv2ieEfupuxZ4Sx8UUdSJDc22Wkdm6cb2T4rJAGPFfp94LjnOQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzy1sV7Tz0v5X0/A8IxjUeyKZ7PbNVqkdUc3+A2N/P87O0xKwBP
 6kgeu4B74Is4rrKa0gIWDpNDExE++loCVqIXO75Vw3JKp1bOddmY6iJ0owhS+5O14jlUCq4fJLV
 oKgY/qDR83PaTWqcio56kOPwpGN2XT1UjxH+Z5bNEgw==
X-Gm-Gg: AfdE7cmwYiRIoCY/UosNEOR9QhUi/F9+IdJx5lupEuvMI8pQdJ7HjOFYTNvMBPWZxzD
 OhsGjAPg/IVo/tLisyeQgRVMqwgI0Jt8YmZgwAXsS2RENxwxiA/Jkus2H8Nt3/sCLOJABIQv2dY
 MR6PvXt6hLXDIoAi7XiCB62BpeTlb7F4f2r+3OLNSbyX/yA42eRYdNoRxSrtc+gMmzovXBJPFl9
 pgMCdeZDb3Vj5hwWReoD1eh5a5f00O6BUG4i93Nb43ouAkHY321cHrKRcXWmRyphb4PaRGrTYeF
 H6v6+oJ6V9yqxokaR68vIV9qSkljmHw05fDbnKp33eNypyb1VsirzFlG
X-Received: by 2002:a05:690c:dd2:b0:81d:6af3:b9b8 with SMTP id
 00721157ae682-81ef26b7ed1mr5205977b3.60.1784287718737; Fri, 17 Jul 2026
 04:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260715131819.14827-1-dingtao0430@163.com>
In-Reply-To: <20260715131819.14827-1-dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 12:28:27 +0100
X-Gm-Features: AUfX_mytekb_1XJdQ79DW4roY87bbelE0vkQUmnZwMfIafaiVPXObc6z0M7LXHY
Message-ID: <CAFEAcA8AHg2Sov8rEsU1jNFYUgmBaVV7eBz0YtzExwHTLYvdEw@mail.gmail.com>
Subject: Re: [PATCH 0/1] imx_serial: add missing migration state
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 15 Jul 2026 at 14:18, Tao Ding <dingtao0430@163.com> wrote:
>
> Hi all.
> The imx_serial is missing a migration status,
> resulting in no display on the terminal after migration.
> This patch fixes this issue.

Whoops. Yes, ucr2 has the rx enable and tx enable bits,
so not migrating it will leave the UART in a completely
broken state.

I've applied this patch to target-arm.next for 11.1. I
tweaked the commit message a bit to lead off with a clearer
description of the problem and to note that it's a migration
compat break:

    The imx_serial vmstate is missing the ucr2 field.  This register
    includes important state like the transmit enable and receive enable
    bits, so it's likely that after a migration the UART will be in a
    completely broken state. This bug has been present ever since
    the UART code was first added to QEMU.

    Add ucr2 from imx_serial to vmstate, and increment the version_id.
    This is a migration compatibility break, but this UART is only used
    in the various imx-based boards, where we are OK with compat breaks.

    [etc]

thanks
-- PMM


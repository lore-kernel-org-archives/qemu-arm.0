Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4226345lfa;
        Tue, 8 Jun 2021 01:54:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuDBfehpjg4M4AaP5Yq1vZCO6cZ2Iid1BaXSd1WXBpqbw9hIDzrk3X7BTGAQJLlpyC4toe
X-Received: by 2002:a25:c9c4:: with SMTP id z187mr27883665ybf.200.1623142484120;
        Tue, 08 Jun 2021 01:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623142484; cv=none;
        d=google.com; s=arc-20160816;
        b=o51HFYfc+bP3WP8o3lN/DG8+o5aXAYueVxFc6tGvNveTrey9Kb6phJoPoOiTyCGzXb
         hw4tyHAqw65chlUDqGUASerrZOcO95C1d+F05FZHJeg2g7KSSv6ngKJLHdQW9AlEIxRE
         hkPjHS9KTHaPB0BiH7Qxpfvu/qHyT276uIKRgVAMo+p1yfEc1PASSWXnAY9BcN7G1DmP
         RllFvB7p2As8nwr/9mLehXWzCONRfPE+ak6cZdrHs8jvk8Vr7x4KwTzLtalVc/FGw+7g
         XK17NmmQp02MEZO05UqZf/F63T43z6g0nNWB9hOCxbSA+k48Px3CyEgQKauUojFdcZAQ
         AM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKhC1xdQZxu/wqVr9+1ycTV5AZ4UVpfJX8gynD47n9w=;
        b=cGj6d3BfeLrHhmlgLrqiq3B2mKeUVVnJx4XCYA/XjLiTQQ9/FCZ1EvWzx3qXfaDB9m
         cJXK69tsOKFdF0oi5LXS4U7xd680KWEW+VUxYdj95GK4t7ZncUj73eZWu9zUMX0FUhv6
         Wh6Ie/yxF4hbrxrxJScTZhRVTr/t/PGVzOSMTpl/dC0DJ29M2Y2OwjbWyzCA/7hA3W8s
         A6U4NlLXdRJzHfSOWE4cC8Ln/0w2eiwoW/TRHafXJTSzY1ZHi464yevHGTj6U32CSYl4
         gRzm1AVBbBPtpKeMbq/wKEL+pKODWAQosMabbKkdaQxmlEsc+ZgZJC2RTTYgzuhezChO
         Al8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W4wr1mkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f28si3838202ybj.119.2021.06.08.01.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 01:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W4wr1mkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqXVT-0000Ek-DW
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 04:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXVC-0000EZ-G5
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 04:54:26 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXVA-0006XK-Ho
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 04:54:26 -0400
Received: by mail-ej1-x631.google.com with SMTP id c10so31310094eja.11
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKhC1xdQZxu/wqVr9+1ycTV5AZ4UVpfJX8gynD47n9w=;
 b=W4wr1mkCYUdwTkIWmdhl8fm/dWUnMyCnuU6r4bgya72bfudTmL9n75VGrzE9sD3SLz
 ooh9/v244lRP63jOIlckxgWhHrRIj14ZK47oQbykyXIy30QGXzZF3eCofOWDCRj6k4LL
 LkGSTi+mXEEKZpHO4Z32X1GjU0Own/kXrMCtz8pxCM9xZZutWqAH1mD1IOwqgbHIXABu
 OmeGWqACXMqJtiyYrpG15xdyu9IY3eanWilPyDM1GayOj7s03S/csnsU9QIYSvG3ppLT
 V1yIIjYqWJy9BWriUkECn3EQTS5Qjx67c2uEGYi6cgQtuLFUH7OupterOh4j3r/tcPlL
 4l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKhC1xdQZxu/wqVr9+1ycTV5AZ4UVpfJX8gynD47n9w=;
 b=Ump94Pae4cgNIvv7qlUp0prC9N5kGm/MMkEsnrLQ89PGaG0M2LT/9NHtrYw3aIJUDS
 7FYoX1MhrXY4GoftMG066kw5h0U/ldoJHvh/yeggfT3JXo7I/z0OnU6fmRdLA8l37lzb
 BH7KvISPDRPO452XmUoOILDSeSTR/DLUuoxnFUpvcNZST5+zOZxFqHMxtgTx6q6gR75P
 sEzlXOGq7zhoX3l+iEloOKYiajKc2GBP3DTnFAax7bdnp6AX9WZqGzNPfPC0Ale92e5E
 nqcLJoKblfGJNBU0yGZfvqAe1nnlmtwgB+sKxe620LfVgmfXaCtHMexVfuJ14c7iCH9m
 ARLQ==
X-Gm-Message-State: AOAM531K42uPFe+W4Qm5Y4M3sezLk8isY2F2IJ8ylwLup7qvsx7MK/2r
 9uJBB/b+e8MHYTRSG+HQxpUkbKnrIrOC/6CFFUs89g==
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr22831066ejk.250.1623142461679; 
 Tue, 08 Jun 2021 01:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210604130352.1887560-1-jean-philippe@linaro.org>
In-Reply-To: <20210604130352.1887560-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 09:53:48 +0100
Message-ID: <CAFEAcA9q+xoDbgGQooKX+YPdtd-uiSixgD4-eFeWwAWPQ91DQg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VQQUt69HMlzf

On Fri, 4 Jun 2021 at 14:07, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
>
> It turns out some software does this: EDK2, in
> GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
> interrupts that it manages. This now causes QEMU to abort when running
> UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
> does need fixing, the punishment seems a little harsh, especially since
> icc_eoir_write() already tolerates writes of nonexistent interrupt
> numbers. Display a guest error and tolerate spurious EOIR writes.
>
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2: Added qemu_log_mask() (so I didn't keep the Reviewed-by tag)
> v1: https://lore.kernel.org/qemu-devel/20210603110012.1182530-1-jean-philippe@linaro.org/



Applied to target-arm.next, thanks.

-- PMM

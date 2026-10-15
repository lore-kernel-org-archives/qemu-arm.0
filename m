Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B68CC6B3A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHJ9G-0004PW-Ho; Thu, 15 Oct 2026 06:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ9F-0004PC-2t
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:57:21 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHJ9D-0008UB-GD
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:57:20 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso777293466b.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061838; cv=none;
 d=google.com; s=arc-20260327;
 b=L8FaOQ82XpT+fLGIaI6Z9jcUEDCm7jrqUGtLetp2GXTlmKnSqEeYjW8vghIgtIJVff
 E+uFH6KhNlfED3anvlMB2raaaToFVkhRVVwabSprGB1RO1bSbR4h4RCSHxs+yejAH0wM
 owwfVv5GqWE4RL61vxrzFI+VkFbWkfOpSmppINBE3oFGBg5ZyJw4N+lFevhd+y76dv+E
 GuDqpLuz5pBaOg8u7lcqJzbI+Oq2N9/mLO0lGFks7I7TFygAiwp7tG8GebLRKJfwt33+
 Yo790jXdatIA2/nXir/E2K6LBwiz9xkyIVdc3AkRtNHKnw6wkN27bmpsnyQVybX8ZEEa
 P2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=RYSFE9nEnpDfJSTsSGt0FMe6SX2bXMHzywunkDepyuo=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=QUd+/518O1QRvdwhhudRjkJSgiQPUY9eKuRY0oNwIvnU1Shhy015tqAuTTMdavIIbQ
 kV6PgY7L/i1i9M8D6yK7E7X3GBt8Ggg/EaVglCR+fP2e9/av4WGxpgmjGAnORC93jTDx
 Cw19vLNz9csygFwVK89o4dlYuLHuQnAfaW3GONPLJnJNLuj5aMwtxIyDsPZBmCVupwcp
 XHRlW70Xq5lGrzL/TXKqno9kLndVa18jt7fqfIJeis12lmetbSKKta/F9nhLE/OEfQhk
 n7EMZLBtCEWnRvXm6/iUN3EvYGcL8YvyShcJiyUYne/mozcGulCKcDXWLFVaK34q7+rg
 dD4Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792061838; x=1792666638; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RYSFE9nEnpDfJSTsSGt0FMe6SX2bXMHzywunkDepyuo=;
 b=Eh6y2qUXwIOoWuBDm8WpIO/akWSkcNBjQ96NLpRVSFkML73s1Cy3NyLB4cSodHzsU6
 uItAweSjgxafkXEBF2y5f7XbqrBAMmaDc4JMPRemd0Bm01p86NlLLbQcmsHVdz4+cTUg
 4RDJfM67JiL1Nnl21AIfWIkkySxz0D83fa5kmyQFwMXu5rFIo/Bn0ydvCZfN9Q/yDkmI
 e6SWRIsqUykXYSDwWIe4XlbcWeKXj5GnJm1qkGtiTlWM2lLg4gHMfx8ZmWIb18WwFkt1
 P+fqvC6jgQzDn/5ISpOc8Q+9c8HZvCwJdomJgynmqFZXprAZDgXN+ZDf+ziwQaU62oYD
 PjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792061838; x=1792666638;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RYSFE9nEnpDfJSTsSGt0FMe6SX2bXMHzywunkDepyuo=;
 b=WjxhfhB4Bfi63sQvcjP2cqhTep4w/k2w3tmf17DFbONdRD/qL5x4rw7wLHfAqN1s2b
 kn2gWMwwwCWyaG6HDMU6MDr7hOZ1WiNjK7s0Q2CreG7t1DNK3LT4dIjVVo3Zj0ulgrQY
 GF+RqDPlDXfCgawPaS41nLMS/lpWOfutCiCDOBhKEAnGLJ1dGr1C93uM4ow/9ccPxvpy
 r99Z/uLxnbI/GVmDxQ69YB1BC8YYEAwLfBzAoXOfLvqhxgyrzzsx5H89y7SJnhXD++Py
 RrIJny7OSIlmo6h3dhRlHy9XUGk6LpEHUdDsN2oPWiNeMCAwgrFWVwdLFoCWazbWlxmT
 dwwA==
X-Gm-Message-State: AFq9FYKhwi7UnWOsXSICavSqD6oTr9gl75gXiDVtSkdcPg0E31ySgOFZ
 pF7JQtFUbBgLRJFUPdIronYwCXtpIl8lCzyD9POPrYnsTeCGIk99ldGc6Jd4zF8CmGLm2rF73p0
 j0FRll5ZBReelE6obdbnXk1e6xXJeyyDy5QCX3GxokvMsjbILr0+g2XA=
X-Gm-Gg: AYBFou13hDiMy2QZqUsjYrvPDfEIkUXKNpQf0kKNYpvW2XulKEXzVtYqGEZsyCxtT/z
 7Xa0c1GiprbYHqL63ST6C4OXS2ysTbAJo+6LYQalqVNZff/cCsk1rqsindkSSD0ksd5GNLSKFMw
 MHWOeEUI6NEyASONu8tY2VGEeXz/4GWU2mpiBQ4EGgA2NbeaYs91yo+Wyv2AAJJpM/XjoWaO0IS
 ah2Ss9xIAcgTKhrIxh3BI8Sxcl0LoiNJEmLTcC8743hShN2VeMybLv9KEAX+4RCoRNgXTG7nVLt
 rgn4sSlQSUSq5rbxhNY5ovJc27tL0u59cBnhxZNhfnCxQWs8ZPuJ3BCQfkyfThri851CUap5TPP
 z50jl2ZGyCqZyC11SeScnCcUKeP8UnesgtnxEYeQ=
X-Received: by 2002:a17:906:c116:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c31aa0e9367mr1714858666b.48.1792061837892; Thu, 15 Oct 2026
 03:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-84-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-84-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:57:05 +0100
X-Gm-Features: AclHuK98ZKM2fa1I9u4js3-FmvwJ9Pe9eMl1-LEI_vR9b7DiuTc0hva5BCfsVQc
Message-ID: <CAFEAcA-4UtU+b5GHNvZsUf-dP7FPmc3VfREOJd0__EeA=yqwfw@mail.gmail.com>
Subject: Re: [PATCH 83/86] hw/intc/arm_gicv5: Implement saving virtual
 interrupt state to guest memory
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Tue, 13 Oct 2026 at 09:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The IRS_SAVE_VMR register allows software to force the IRS to write
> out any cached virtual interrupt state and configuration to the guest
> memory data structures.  (A hypervisor will use this as part of
> saving the configuration of a VM for migration.)

> diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
> index 50365c4dfe6..667f4501ef1 100644
> --- a/hw/intc/arm_gicv5_common.c
> +++ b/hw/intc/arm_gicv5_common.c
> @@ -116,6 +116,7 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
>          memset(cs->irs_vmap_vper, 0, sizeof(cs->irs_vmap_vper));
>          memset(cs->irs_vpe_selr, 0, sizeof(cs->irs_vpe_selr));
>          memset(cs->irs_vpe_dbr, 0, sizeof(cs->irs_vpe_dbr));
> +        memset(cs->irs_save_vmr, 0, sizeof(cs->irs_vpe_dbr));

Cut and paste error again -- should be sizeof(cs->irs_save_vmr)).
(Currently a harmless error since they're the same size.)

-- PMM


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C97C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:34:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohwe-00011L-Ni; Tue, 28 Jul 2026 09:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohwc-000108-QL
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:34:06 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohwb-0006U0-EL
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:34:06 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-81ec29f1d07so46937007b3.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785245644; cv=none;
 d=google.com; s=arc-20260327;
 b=BDx6pVxzReJy+dy62sB5ciHo0hrwkMwhmonRyd+0S9JjmI1XEhhM0i9HQZSAfbpuZN
 xXJlBNpuoRs8xJq6Sck8EV04o6iGDcFWdoCYLNspzn/RedFoyjWxGKcbCd2dnoMLGVcE
 4lHvEDeD3x1nkBuQF+tCt1ZE4H0p4W15CRuCsUz7nKxaOMueG7Qeef1LKjc157k9IIzN
 8GMnrAMF/AfKdchpEY5cwnDDRdfxKb/ksd+44f3kvnlaat1TxvccqrUnE93ZaEW/iE+/
 JqYt2qPypHPsLvGW+cFtQfw4K/7172BWedJA60dqVWZqMdQZGD36tER5qqYH5X0EcXR+
 xbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5DS6zvuVw2wdZM29Z2230wF0+Xa0DkLmd3WoHG/TTZQ=;
 fh=161BvG4M4Vc/TJ0+ywePrY2c1Ezx68RTa5fktBK0occ=;
 b=QtU1ud0UYB29AAV2GOlsOSir/H4IgW6nn7oizSleMKBkAauYpW15NMkvJKpOAmaEKv
 I9XZo0YuarH5x5XhwDsNZA61KinSA6ef5NiIg4WGsHjoQ/FnJXStHweuFc5y5HuiV64L
 BfliMGfPK1r7lbpTrcjha2oZ2YqDGkwILkbBjzrv4Fe1gUMv3q1ugh6rdg1lxpcj5WL1
 dLuZ/GsLMd42DnfFPeGl6dzq8c+B6BCLjW5xrG5rO28xmGNf6W3hPlAKcA39Qdom/h/j
 g30jJFLmWIqQowL6SrV1g4z20eKWxQt59qe+FHro9VYF/opBb+xGtvf6x8FH5Ky5heh2
 Hbnw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785245644; x=1785850444; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5DS6zvuVw2wdZM29Z2230wF0+Xa0DkLmd3WoHG/TTZQ=;
 b=Tsfgd2CZH1LOXrqQ7cTmXcDw+XjYTPwxdy5UVCbsJjVLAeq8TRo1b5Lh4L/1qZR1TJ
 a/14aA3jpa3PoprW1LRknQx9DmO38uWgO0cUBKrX6J/C1IHTuhXNdtcX+UCOCPptidgR
 dPYVmTxCgVqwGNt0URPLxnnU+uNIZSvQBr55QJCWfrEkMnZhSfxhIXOIQqG09T4AvBlb
 4nasBG0ZN6jlYwXbYhKOdSw/RLXm9rLRzFX9izXvex4OcJgRNWa0Odw6JA6l6R5HZo0h
 ZyrW56sva34KfVjPej9ij37vvw8o2Q/M6n2kR3hN85AEjJURSqumuqTdYoyiF99y06lb
 B3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785245644; x=1785850444;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5DS6zvuVw2wdZM29Z2230wF0+Xa0DkLmd3WoHG/TTZQ=;
 b=D7rJT1k4s+BU7QodGzMMvfAI3EHd9UlQDB3kQppVuZn32USZYkrcGB9KHza8FMhosQ
 dscAZHtkLvPdnlrGCsUdJnxRC7w4yKzhj+0dZF7q787iGHSts69XTZfd/Q0ScZj+Jphl
 8yH5Qbi2yow57cc3mU/eT71f0HWcFVAW7FsfAOyvufafouIGJzaKldyL/mu2HiyA8hQN
 OxO/LVDGmTuCgSiG5cA0Sz6DV4O5zy86hw3XDI+4W9vOAQve7I069zM4BU5vAFaU38PL
 ytOW0awt6ZrMWsTCQllaf6ph+YNg2UigapRIT9Bx+oOmCxq7efZ6oo/xFMGV58AaDMnL
 Tg9w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqsvyr4Vcn2DIdUjVfcWkv5nUI9jNPh8lnWJ5cZyiCx9kxNKyzFwXd3XzFFNglPNwSVqiy76+cBxA==@nongnu.org
X-Gm-Message-State: AOJu0YyimzbCNOKAS/AJBtlprP4gezXHJ95wZ3ff6Pq/tWyd1S0BavnI
 Xx9hsWW65Ij2M1jM9Stetw0r0SnCPzEMTfMpxV6BkCp2liNL5JMM51XQ7ye0Kl7nQzFhb5OYvf5
 zBCYy8sFCrBpGJbfFNPLVASw+fRaPp778crjZHWSlvw==
X-Gm-Gg: AR+sD12Vm+rqI928ginS4L4QqAmYkY89W20S3nXaldpZM2TXZuqYqTmGXqt6/ksIq+D
 SM0ZHSXAldoVbwEHwjOZnpF9JK92YECTAQVG4qZ72beGPzdWe3Lpqvg2G/1iJyVmX7fpofJ7Kmb
 OSpPgs2D50KvGy5et4jWCkeuf/SY8sVvjogqP1+96ll08NeXEtxp9lGPTq5uV70IoD6aY2t8v3M
 yohwcCk/x/DZGWgQs5I653kiaP9b1+xL+3EzuzW0CsZxH5+upyfKhumSlgoZpwrrkfizsE4j9wA
 izsojAgo7+oFR40ACaIw64EC1GjYtQdED8AVzbVI6qOgNQ==
X-Received: by 2002:a05:690c:6e0e:b0:81e:c7d2:f26 with SMTP id
 00721157ae682-81f990e1022mr8192827b3.6.1785245643781; Tue, 28 Jul 2026
 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260719174905.420725-1-richard.henderson@linaro.org>
 <20260719174905.420725-3-richard.henderson@linaro.org>
In-Reply-To: <20260719174905.420725-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:33:51 +0100
X-Gm-Features: AUfX_mws-RROaqgpSt_pWL3pGYinE7eXepv3kNogIcBtgxACIYAzLN-dN0Aymj0
Message-ID: <CAFEAcA8ytRX3C6rr0HZT38Tkq60gK_Yfqxq2j=8iRa_E=95z1A@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/arm: Split zdn in do_z2z_nn and do_z2z_nn_fpst
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sun, 19 Jul 2026 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from z2z to zzz to indicate zd and zn may not overlap.
> During decode, retain z2z name and duplicate the same field
> into zd and zn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


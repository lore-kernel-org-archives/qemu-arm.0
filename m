Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1600665lfq;
        Mon, 11 Apr 2022 05:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxudLfA1GdW7jsZA2O/qmx58OvJFZQv55U310qlF3I4KR2mK6bpGSPz/HArnhtQJlYIyR9G
X-Received: by 2002:a05:6214:1d25:b0:441:6b43:6e29 with SMTP id f5-20020a0562141d2500b004416b436e29mr27008313qvd.28.1649681775559;
        Mon, 11 Apr 2022 05:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649681775; cv=none;
        d=google.com; s=arc-20160816;
        b=cIH5DfGvmp/sNj5faiYGz2QjoLdfzA/CRX1rATYgPLMW8J5BbUBcTOYJ4/NWWSZBjO
         VuY93SfCbIByVPJviDRe5u5IKu14SIh3NNYP9SnZm/UQIJCVpCMVtxWE8WoFUY2SmMPK
         KkZsvN2R1TwyaVwNWsRR8QDoVcObEX2Dtaio2xlSQVyPMDAjLBCt5nK+JbjscCfDrQsx
         jfjl4F1WXu5J2jQPsHQjLoraiz8obipsfWN9hNmWJLwPcnMeA+PCu/saXEGkXDy08pqy
         0gc6aiaVEZwlvFsloWA7YnRb6+VwbXZBQjfJCoI0f3jX7u0hdTYVARtECVaJMsVO7K0w
         J96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gAHhXdQgTf/kSVU3weL0xlWL2d9rZi6UGQmrCdY9aUI=;
        b=E1rUaGDe/rnMZkZKV2O01Y6DwThl1UN/xWfFHJP8IsJbuyJP2xGYXdCDunmUgY5ypT
         TmfBuis0PHQP3R7pALgrBl/LMPtwV8lW95oHw+Gtv26izVqCEjTXd/+nmfCjuwFvMNAf
         A5uaAU0rKOHWtzpPJKmzK7NDV00rU0Tf6EZLwZQHI8bAdxQx59enyVQIpdBtySQiKgk8
         xFVZx6AYxlU3a0ZgoOWJu0UY9PFS8UvMmLGinIIdZkC2/s4M25sWcM5ECTtQQ+1in7ks
         9FVvW1vIo7v477aq3Rymuy/ECAxWOWuT2E6/WzDfrrljcKhJMw5rOV9jlvP/Mug2/bYA
         mDqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AX2NldHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az7-20020a05620a170700b0067e4be23806si492813qkb.75.2022.04.11.05.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AX2NldHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtaZ-0005oI-2h
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndta4-0005nd-11
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:55:44 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndta2-0002JX-Jr
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:55:43 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ebdf6ebd29so92988317b3.2
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gAHhXdQgTf/kSVU3weL0xlWL2d9rZi6UGQmrCdY9aUI=;
 b=AX2NldHUJx+XJ5iYXokZzr1h+jocpskqOyqtuzHdb5vtss6kOafYN5erxQMtBUzrcJ
 S2lMDwhya5NCpTybXtmw8PVqARMSCYHnYFDBUG6capEAYklamL5J/2502d45WCR4atyQ
 cQFtvuUDxdj9of7eHxPrik9nradpiwKvNRhKMg4ZjxTWFMax7Bt+eanTtvZzBFwWKPM3
 F88hXkmOIwbv9BkpBz+fL0Pe3UUqwUpEe1yn/lB5loQwQcbw9zJBfwgV0fm4gGbvCFCf
 TmEAvcVjA4V/lyYZX5iTGek1GlrSR5WN79NQllG0BrPW7f5eI7Gf+LEPtPwRvjIHg6A7
 z6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAHhXdQgTf/kSVU3weL0xlWL2d9rZi6UGQmrCdY9aUI=;
 b=hAiF3jnTkCjH4eRoUZ2FvuJ4Uj953N1Zot+d9jsZboeAyNQllvLgEm1k9ouv6IJ2QR
 cSxq1QAouNy6LIYAGYGs7RRNcUL5QG4elP5QmRVQKDetVsAGzrfaPFFlT32H8uMk1f5w
 6UuKHrJ3xMwaZpu3s+/3GCxrh3OuT4UoSfrpIOCCYlvCWoq7BsiZemqlu9Js+9UOZu+Y
 M2K191G9phGytvrnUazXFPLPedpocer+aYmwZ4rwD3cFUBGCJEhsH2b/ohnlZaqzbqTG
 7Hw03f2yXxQWHnDVawtwl3J1w8hZ0Q8ebtRDHAt3/wGUR82ayj5iwrpiCi0hg8uPwa+W
 AcMQ==
X-Gm-Message-State: AOAM530r2Hf6DHWhPpD+mUaXqFsTArMqx7ZHqrzNTHYku24dtogEWdqY
 qzUYtBAKvQcYbTBK/RKTpcsLFdxPUhQGE5SN9SClOg==
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr25036506ywa.455.1649681741631; Mon, 11
 Apr 2022 05:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-7-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:55:30 +0100
Message-ID: <CAFEAcA97+9_ZWTpiQty85fW+7yJaT+L2BvZUYiiT67D=nn9_=Q@mail.gmail.com>
Subject: Re: [PATCH 06/16] target/arm: Annotate arm_max_initfn with FEAT
 identifiers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AkSAhER6uD7u

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Update the legacy feature names to the current names.
> Provide feature names for id changes that were not marked.
> Sort the field updates into increasing bitfield order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

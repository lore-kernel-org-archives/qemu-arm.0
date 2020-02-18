Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6011322lfp;
        Tue, 18 Feb 2020 03:10:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqztcEdyn6gcz6LmeHWIWWHBOSiFA0uSNzykzvl0Mxky5MODRuRxqn1Y8lMCqsvspS1daZL0
X-Received: by 2002:ac8:3863:: with SMTP id r32mr16917426qtb.291.1582024230904;
        Tue, 18 Feb 2020 03:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582024230; cv=none;
        d=google.com; s=arc-20160816;
        b=DsQP9/ix+MIY0i9z6BI/mnqUluOazenEVdRAC3ZfGE+seEmI5GJ99WhZvIlAnZcdZC
         5kY9Ul+zRMfz4OrB2PLt/aU6lac8LSwRhIauB8gCC9jcG+CDKBF+hyYYvc1iE/C6O2ft
         krdIr+d6hIKGNsQXj2Jo2Fe18fYFFOzCTEWlkvo6FOgKDYdwd+3m5UH4tg1xy1VrgeG1
         S55IV49o4Paq1FwnEUhSpKHgkg+8DvMycU9eQFKBSvKLps8y9JdlvPVDVZGUUy5pdz67
         7fcJAUOKRNAbnvqI4j+GXNBO7ioPOzk6kBTEQuqRSqcDR2AwIdlbS1Ky85/wu0oz94dF
         oihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvdycf7eeOlOjrck3aMmk+I3QxrgA8fg09x+XPH+bPY=;
        b=UH70/sHLqqtEYfE8T+rj7jiceFGn23U9KITVRqGioQq5FhhZ2A3HR+znCnyrIKYvZt
         yaVJ3cxl9xjj8ilgQUr0n/NQ0TWLl2Gh/D+6AgNMbL1Af6rmlj6H8vn0SGq1QPZBuTKW
         I8yXZScuODJAH6QdJ7Bz2Hm0EQGfrd4vRZjGWlpijPFlS3vVwKcfCx1T/A5gnP7gKKbG
         nEr508jI3Ob2td+5OULLorWjc2KHRDy/XOlUV0ngL44fFIfTgcBv8P2S5OeubWqN5lHa
         i/+HYNaLpEUDzb6AG4o7lxlFtJklnSgntNGhf1Ti/TFnsdypKsksZl0jnY3YomLkabwA
         qSsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RUyZLh0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si1760668qkj.74.2020.02.18.03.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 03:10:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RUyZLh0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j40lq-0004yT-CT
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 06:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j40la-0004wx-JY
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 06:10:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j40lZ-0000QS-DW
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 06:10:14 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43886)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j40lZ-0000Pz-7a
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 06:10:13 -0500
Received: by mail-ot1-x343.google.com with SMTP id p8so19073495oth.10
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 03:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvdycf7eeOlOjrck3aMmk+I3QxrgA8fg09x+XPH+bPY=;
 b=RUyZLh0qeI7r6RadeFKtI2OZtkZDgW2RVKhbdb3tY0AnZ2QkB8tuWYnZaKGzSn4kxm
 Xe4bPDiUBfcW/EeX6xD8nRZITALx5lS6NhkuoazG4busVgxw+jJty9OofCFroQpZb8S1
 8h8+UTFyt93FJ707imoSMfTTCK9owTdGsoF3CW/BfmUbJsWy9mod02MDPHiK1ihXIynm
 ARJ1AJQKaeWxitiPUD+eKU9QAZJrC4kadPPPtwHkUnIKS6RPor6e0vSr6ZCCrMUUxdH1
 kiOcl1jLLw9i+JtryEWfgeGy2fiuStd4P/ZFuzlxlRMGP1Ouf19JlMO1zmdJ55JNv7lY
 Ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvdycf7eeOlOjrck3aMmk+I3QxrgA8fg09x+XPH+bPY=;
 b=tWkKs06jZOHAdtXWUmu3DKOVuhtUsK3bsbbDzJDQUuOlmfqtS1SlsxkvOqh5VjBWuU
 jd185AJhWedjuE5O9wdjO2ctBN8bFUJnhMA1Z7ufNARaguzoLYuB6X576YNPq2bxC48C
 WsyjlmsMx8XmMY4Q8XFYTXJJp9x4ASHb4uUBCk/1g/sQJSTKbIUJBLRTTrSYPrNqgGJu
 ga2BDLhVB6dKk4PnPjsIbQdzu5HzzBrU2SCiEg6LjPQE+MZLPN/XWZnptf57HsyO1vq9
 JgTitVpbZWZyt586KpHXoFI+gnDQNl4H67AOLDbymKb2DUL8ZH1npOzpGiO22VCa0b2H
 KWYg==
X-Gm-Message-State: APjAAAU09dVDn3fQhHBfcSL7bbJ9gVNdCMGKI6J2ZAxUAWhPIU7mPxd7
 /PJ8d7ez+FwJzdBVX65OOMxQOIwIoTfC5xMnRBdzzQ==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr15546075otd.91.1582024212250; 
 Tue, 18 Feb 2020 03:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-16-richard.henderson@linaro.org>
 <CAFEAcA86hhBNLWhAe2UY+0-pS65wpSdPKFPTA9O4m9avjECxaA@mail.gmail.com>
 <3193d3bc-230a-8770-ffd8-d15d26c75ef9@linaro.org>
In-Reply-To: <3193d3bc-230a-8770-ffd8-d15d26c75ef9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 11:10:01 +0000
Message-ID: <CAFEAcA-GO-rNA-TbVj+vHXGWj33oKZWPrG7m-k=q0+UekRERGw@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cvwcrVnVlFjv

On Tue, 18 Feb 2020 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
> It isn't clear to me that DC ZVA does check tags.  There's no pseudocode for
> DC_ZVA, which is less helpful than it might be.
>
> I suppose one could infer it from "behaves as a set of stores to each byte
> within the block", but considering that stores are both checking or
> non-checking depending on addressing mode etc, I'd have preferred an explicit note.
>
> So far I'm treating DC_ZVA as unchecked.

I think the spec is reasonably clear here. In D6.8 it says
"Unless an access is explicitly defined as a Tag Unchecked
access it is a Tag Checked access."
and then in D6.8.1:
"A cache maintenance by virtual address operation other than
DC ZVA generates a Tag Unchecked access."

So DC ZVA is Tag Checked, other DC ops that take a VA
are Tag Unchecked.

thanks
-- PMM

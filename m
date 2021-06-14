Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2159508lff;
        Mon, 14 Jun 2021 10:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzukLCyuowGfQRL9IS3ps9/b4nQ/sIg5FRlRFhe/QRX0lP774gvD6MEJgoLyi7DPc+KTnQy
X-Received: by 2002:a05:6402:b76:: with SMTP id cb22mr18363972edb.112.1623691081626;
        Mon, 14 Jun 2021 10:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623691081; cv=none;
        d=google.com; s=arc-20160816;
        b=kyzcX6btRXeoSDv3fp5xJxnF/rYV8ZS2t9UA5BaJd5slVXTo/5wlJqzZ8iZtDZhERD
         PeWSR5nmGIqAQunA8ke/mRg3a8Dji7np9CQjv2j8qhN8xRI0zmaU1PdPobuP46n9WsKY
         Vm0GS4MVOwNf/rrwkpd0eXPkHJjnhhQhYZ3v7CnQMELxKW6C5jzdWwqKbRwmM8V6eDDe
         RHvure6Tbp6PjTEphip7UQ81CE55kUHyAfbfk9kslhya7REl0xG+ZdQCcEQQkzDJ652p
         0bmpu7xXA0uvuDU2XIofuAYeE/RxwUUShXTY+4V1QCYNB6vPwHqDaa16DTRPOdcw+ZHb
         1Bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c6JwgpiyD4ciFifob5L4pR32YKZ0jguYL6EIHRqdYJY=;
        b=0llFmjcuH3q+B8hsMd1ZKCmx62ibb2ze3cGhwg7ecP4nxeV+pYZwOxdf9xnB+2rTvq
         CYvvzfykPeOwa50IE+ZIoXPVCJdocMVsqAdzCI0ZIGWG4wenrBhpox7X906qU/DP1N4s
         DV10SsxomRRAdCL10JIx8op6oXm54LCgbXgjjtQ5w8rMh6lZz6qxjlmom/kyc+vj+gsg
         9sDd5CeYd9kmVKBZV4BCJK0PTbdjJOIyHBsBaKg/8fehdSDvaq4/jbowFN48hqmUZybw
         tueImJ0lC3L6CgHVNPcsKeY7zZH5ZpwZSkoRXzEsDRw9+8lMRr2ImX7fpNkKPzwqEf5a
         7pgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZwtAnFoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ar4si26561ejc.706.2021.06.14.10.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 10:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZwtAnFoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsqDo-0001jd-Jb
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 13:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsqDg-0001jN-Un
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 13:17:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsqDe-00034x-8O
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 13:17:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cb9so47574808edb.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6JwgpiyD4ciFifob5L4pR32YKZ0jguYL6EIHRqdYJY=;
 b=ZwtAnFoXIru6GLOoZAuNx8dL0/VnlBZ6ewoUsuYJLED/+z6inemsCWlzOSjinIwx5I
 2dxcRyMrJM7Rg8xZyvWr7hmIKlg2bNiF3cr3tGxPVxs1C1eRmbxcJjzGYcgsunxaFs07
 zvCUSzMn+Oy15dZkBpxulejPgLU1aelFDvT17YlJiAVJEtDTnFYkv1NgSFDD0fnlS4OQ
 etUeO2UA+FjKmqy/u/hFqTpdzd075bRHXO3WhaSqNNG2oSOiPuxozFumeJN6L/PnXNvq
 rebi6JKr/tayrTtUcDogRLZQvwMXKhTGk8g1ktIwCXyC2P+nDsMrmYiJO7XktrODk1Lq
 Qlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6JwgpiyD4ciFifob5L4pR32YKZ0jguYL6EIHRqdYJY=;
 b=IsioStDQvAkIYjVacreOQUbLE0WzoYacrqZCiWq/zWHiy5+5qTnmCD12gPy5mLdJPJ
 3gYY45HUJGXe5SOwvU1K3W5R+j1hR1x6WUjzs/wxak9beoWOe7PmLSEnInC5Od0eRpc1
 y1lTo0c1vDb0PF5h8FbEOaagjKnLBSIkp7ruQLpglLrjxLJjR9hknttVMljjdxNgMdpK
 iE6mNr+uaxUDq6PQAh1cZPoz6iNx3XRS4U+eDSQq/zKyZ9uLen/zu67wtPTLXTrnDg6g
 3jzD9oaKvrlYxlsMlXhxFDuu/rQZBgRKL38VsgOTGAttofXX+opZR9KnsycUfVXMqlzf
 5UcA==
X-Gm-Message-State: AOAM530+1JKcLllDWPYacbmWMdWh8uYgkgTbkCbCMro1uiB8oEv+XWWj
 Nhr9O4bXoNsLYDSwd8ncY9TeuRBHrsfXGBjSJs4N3g==
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr18075290edc.44.1623691068647; 
 Mon, 14 Jun 2021 10:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
 <87im2kzwj8.fsf@redhat.com>
 <CAFEAcA-MUzrnKe=UzYHuMi16XBiRrkFFLWxKMF+1T3QFy7tEMA@mail.gmail.com>
 <c6e20262-9602-6bab-9458-9a9b11633b2b@gmx.de>
In-Reply-To: <c6e20262-9602-6bab-9458-9a9b11633b2b@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 18:17:13 +0100
Message-ID: <CAFEAcA_=6RL3t2h5dZcDoqw_0U-C22B=53JamPVk5aHx0u+sJQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OMHxtlx1sJZA

On Mon, 14 Jun 2021 at 17:25, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> File MAINTAINERS does not indicate for section "Virt" where the relevant
> git repository is located.
>
> I assume that you relate to
> https://git.linaro.org/people/pmaydell/qemu-arm.git
> But I can't find the patch there. Do you still have to push?
>
> Please, add 'T:' entries in MAINTAINERS for the sub-systems that you
> maintain.

I don't maintain the target-arm tree like that. I accumulate
patches locally, and only push the git branch to a publicly
visible location at the point where I've finalised what's going
in my next pullrequest and I'm sending out the pullreq emails.
So providing a T: location would be of no use to anybody, as the
tree would always be stale.

-- PMM

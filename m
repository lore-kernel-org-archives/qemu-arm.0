Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp774191lfa;
        Thu, 10 Jun 2021 12:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ht4+cozoOF2XPQHzsFxjnGAJ8M+8reRQMIe1En09E/GSfNbStrx1OljswmP2kvw7XAKI
X-Received: by 2002:ab0:6646:: with SMTP id b6mr1698743uaq.1.1623352657248;
        Thu, 10 Jun 2021 12:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623352657; cv=none;
        d=google.com; s=arc-20160816;
        b=bL4k9yUL1iiFY7Ie8bLeym7frRlZevrmFNuLPn9WQWL1iu9WQkOVgvVs72ORBQl0Ae
         dh/ZllKgGYxvOwqR9QvUGh9YBtFl5RLzcufsR+m1SntPY2OOaXEGJEH4UUq73ystNTGE
         GpVz9fxPfzz8yTbblfueI4VLtYzc9xyXHl3EwBgrtV/090H4ACtob9MhatmiOZ18BVtV
         8dDc+5rPdhBscWpdg+HCkXyjgcbCUtINKIMAgwclAostXM/O+8hxBKgEXq30cmFZTdQB
         Xwp9D/+Zas9Y4TeZSQzCKrZClMCndCd0R7zUnNGCykqPO+y/vRYfi2gVGfZmrN0h9rvU
         069Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lSnoAq4VAGe7W/zHb7OUZQlahSkOz4MeC7zzXGjqNjw=;
        b=gvUeyvOWsnFoM2jZUqMRasdfqQurT3M9jpSBQ5p407VsxrTCXgbiN4/w9EzUyUxQzK
         Y2m6vxx822URP7sQGRUxuIYY77aMySHEqsgp9ELm8F53Y03pQ3MLpidt+ccZT1uKuwhs
         037UCx0q645vfFq3xeoWZwzp+eyXExnRxkI05AV/zyKvHbybyEGdmuDgCA3HNMbEfakE
         q411/HHQekq2ODOU5+xzZXa5H/uKxIvqP1SlJQCkQiB/GsyEsRb6o8tYEkFWwSt//JmU
         4Ad8PNKYimjrJR7qMNUc7wK42vJrEN4xALmRGqkD6hVPk3T7bDpUXcG+aI2P73r368wY
         RsqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oX4+eZGz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si2142629vsq.437.2021.06.10.12.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 12:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oX4+eZGz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrQBM-0005JZ-J1
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 15:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQBD-0005HE-J8
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 15:17:27 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQBA-0002tr-OY
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 15:17:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id my49so839492ejc.7
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lSnoAq4VAGe7W/zHb7OUZQlahSkOz4MeC7zzXGjqNjw=;
 b=oX4+eZGzMSRaRrEoZI2eTpZbTUNklMaSz+d90p7i6nJeHt5nFE8VY2+FFuEJDNstyB
 63gwOtQUvMH0l8EnFmmUwZaILHoYIOktsQpTOw2GZqrZqO4h/e7rRlSUGurAl5skmfRI
 NSESBHLIUvXD0VWQbG77ZOEvGbNuHMwYH94GC3s/8d0mpTgnF682fMUEozydWRFtdjYF
 eDagNdvmXpXWs33KwhBYN09s7KPU4SFM969P0L17SWVEyxj7gfTxTB1jvI17gok11Scs
 xbR2ZxnM6hRgoqMwsJcEHQXwnmGA6YasmxdmRLW1hu4m5z/L1cydc4Wgsj9Au8qA54JK
 ui4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lSnoAq4VAGe7W/zHb7OUZQlahSkOz4MeC7zzXGjqNjw=;
 b=eg65wv8+L1axibLD4yOuZu4D+j+r0zF7CrwZ3muPW7UTkOzTswiS1wt/rIqs8wQ6dl
 hiie1m2htK+LItEPwmrawMLgqy6Sqqi+4ci3tjR83D7ICmxlV4a+TWLqnZEOPEEkEpZY
 4M03EmPmk+0dzvdGQ33uaasIGiBjitVvd9KXRDN2GlslxWswjSnx1BklJ5nNAneGcDUN
 Tb6mwKtNyYqKAHlmVToxWY2Ou2KyGnLRkK6sLrvP1lMLQL+3mc9qxBEgiIjMDhqp2lI1
 WTKphDs/hZJXHjMNMPiG+V//Uf7q1agsqmJKA/XG5exBGbbnPAeCz3Jb60o5OtzIDvRg
 Pmug==
X-Gm-Message-State: AOAM530HwUexB2rRYq7gbZQr98DUeSQ29DHn26gpE1gTJrBoxqePG5Gp
 MN4XN1FkYV8jyynecT2EJX4Mqu9jxXHKfBDS+Fw7tw==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr139621ejy.407.1623352642781; 
 Thu, 10 Jun 2021 12:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-53-peter.maydell@linaro.org>
 <86d3ce3f-0bc7-4f71-c4a1-18f2ed3f15d5@linaro.org>
In-Reply-To: <86d3ce3f-0bc7-4f71-c4a1-18f2ed3f15d5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 20:16:49 +0100
Message-ID: <CAFEAcA_pn0pNQTfzc1WtMJ3C9OuPPBQJQzt2HpfgOM0FKeth3Q@mail.gmail.com>
Subject: Re: [PATCH 52/55] target/arm: Implement MVE VCADD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGralxKveTl4

On Wed, 9 Jun 2021 at 22:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:58 AM, Peter Maydell wrote:
> > +/*
> > + * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
> > + * so we can reuse the DO_2OP macro. (Our implementation calculates the
> > + * "expected" results in this case.)
> > + */
> You've done this elsewhere, though.

Yeah, because in those cases the op had to have its own hand-written
trans_ function for other reasons so the check was easy to add. Hence
the comment about why this particular case doesn't do that.

> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

thanks
-- PMM

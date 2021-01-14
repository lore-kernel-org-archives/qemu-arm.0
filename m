Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp215076lfq;
        Thu, 14 Jan 2021 03:50:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc5l4J8xQ4iN3rMKO5Mh2YafH/73M+clrI1//3R8muY2poieN/SiFgFLGJTVX5t8r+PoW1
X-Received: by 2002:a25:3d47:: with SMTP id k68mr10038494yba.415.1610625051600;
        Thu, 14 Jan 2021 03:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610625051; cv=none;
        d=google.com; s=arc-20160816;
        b=oN94dHK6rxyFjhNKWWBPr9usDntG6aZZyJ74htarAEJOPy/lA0xZcXHsc0OI5zBBEs
         xoCYgZGsuegoWaplmQh2txqGbgmcSbaf32ax8luJkBmXEqiV0XRD5uvw/RnJeJdwBxIM
         3QQycpU05MDfk5zJHjFS4nARk8Aq9JakgGC5DFaTvyDLC4EV6WJKHDUxFQVUUNhbgyaT
         hSS0x5anC9Zj7c/sds925KFExwByLWL+eTVX4Q6sF4hoJdkzq6baSPWZGKsgutXc2wxw
         9JoJzQJ16SFJHNX+VRWdwK82uUG/PD3SJDRG4k7trHnDm61iVjOFbW4w6VTr+IXg64rL
         2ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C+sesLtFIEUJvJejbtTvulbw9IeJhCwP1JS7j+Ki3e0=;
        b=DedAcznRvEWPo097viTH0Clo3LxXEDLqoyzMQVVK82euRqp08WQ0P7BAN8I8xMDI3b
         W50RQqrc/Mch8VhkSsWGjbCrDV1T2KtafUh0LFD4pd2FKw28t0D69IMCa4RLmlNuDrlN
         dlslsScTW/UqTR+wDdTJsisc6MNvyFOU/ApiO5vOttO6cu3GsjOLjUvl8jzZFc8ZYXx5
         bJFeFs4vsUuoOIz769kRrb2XZjUcW9pUwB6lNc1dtNJ0LkrRRYxqkMr0U/wOr5FiRF7t
         TbaUKLCTc22ZYKcMT55zWUWYWYDXRWAuEQt7TtGauRf894h2dIGe/JgORtSEoOdWC9Qv
         m/xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UD/cn+xi";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si4608315ybs.268.2021.01.14.03.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 03:50:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UD/cn+xi";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l019P-0003rA-0H
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 06:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l017N-0002ru-8z
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:48:46 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l017K-0007Qv-Ds
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:48:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id dk8so5397666edb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C+sesLtFIEUJvJejbtTvulbw9IeJhCwP1JS7j+Ki3e0=;
 b=UD/cn+xidaZQ0NxBesKmIeHvTCkhhmb6SXmEN1CDZNYXhJ9XQ4gO1sWSEqKrILBnOW
 WxgO+et1m3w3ODZuCSDbkJCtl9gAABajDdP2xSfYa2EOEt3rNalbP3ZNuMa0uacqRnhn
 uC/HSLkN88X8VkyUBeHeBYPTu93pAj1KGkdbEmOFGqtg+/VBf6khTbs8tfQgLSbCKmci
 DPQrqVsSkY44sSh6w8lv24SouOnqDAcYHfzPgx2ray9zddqMKAJQTkVoFUkUsEJNlS2R
 AQNoRDAcWt1DO9CyJWUcHbWpNkGMsZsS7fBwdsyojJaCjUWBuKcwb4U3jysZ7Rm2oOhE
 bAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+sesLtFIEUJvJejbtTvulbw9IeJhCwP1JS7j+Ki3e0=;
 b=XvXgttxTu0nWDTxWYRwBBmmiRmO38E90Stp/BCvwA9R4gVensBP8/USNYp0Z1R4pAA
 DrtIAe5OTeH8h6cZ42YlJnCR9it1M9FyS0IxVB5BSrBXj6p1/OskT7bCI5KhBE4tG0Cd
 0vlTyKtFUYauXYZeELET2b4VGk0SaZt/FTP0aZt/BWUNhLBtI2hCQfHxh/NE/XG6LKdr
 ikmHnAPh9lxJKZg6j3/yz2SU6ZUKujDK8Po1HpG7JG38+4itO8S/HKkPJBxsTIj+EA+w
 nTykoeueAumy2x0XvgJghUQtEfXlAHHJ8HMyMaoj/4QovW1t7BSm82nQsXzLA2PW7SWs
 y4UQ==
X-Gm-Message-State: AOAM532tDPCV1tLsBxfRjQesKdXqTF65FS9LPSFYgGilyOKvQNj7Pu36
 NfMa4w64pzA2pHO9570sedJ5Vf9cq52KQQcZMRMjSw==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5355613edw.52.1610624921067;
 Thu, 14 Jan 2021 03:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
 <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
 <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
 <CAD8XO3YCJjTZBZaP1MOwUzcMQ9t+tbjOAwMT4STqYmp=Lmvdmw@mail.gmail.com>
In-Reply-To: <CAD8XO3YCJjTZBZaP1MOwUzcMQ9t+tbjOAwMT4STqYmp=Lmvdmw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2021 11:48:29 +0000
Message-ID: <CAFEAcA-A8Q1+0Pu4Csok+QFtw3qX2JZjt1buHeuWuFpqJhjTAg@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8sleTFVpt7hW

On Thu, 14 Jan 2021 at 11:24, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Thu, 14 Jan 2021 at 14:22, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > Does that mean that in that case you need all regions to be 64k
> > aligned? I mean secure and non-secure.
> > Has anybody tested 64k pages under qemu?
> >     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 }
> >     [VIRT_UART] =               { 0x09000000, 0x00001000 },
> >     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> >     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> >     [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
> >     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> >    [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> >
> > Maxim.
>
> I.e. I see comment:
>  * Note that devices should generally be placed at multiples of 0x10000,
>  * to accommodate guests using 64K pages.
>  */
>
> but it's not clear why UART, RTC and GPIO is not aligned to 64k.

Er, 0x09000000, 0x09010000 and 0x09030000 are all 64K aligned addresses.

thanks
-- PMM

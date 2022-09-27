Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp556859ocs;
        Tue, 27 Sep 2022 06:20:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79UAXHWyvL/Gq2tggrMmgmsA7fFuqEC5Ck7QqntYj+fY4Fmk5v+Q2tnE1gNgITmhQpZLfj
X-Received: by 2002:a05:6214:c21:b0:4ad:75e:93bb with SMTP id a1-20020a0562140c2100b004ad075e93bbmr21574152qvd.27.1664284815832;
        Tue, 27 Sep 2022 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664284815; cv=none;
        d=google.com; s=arc-20160816;
        b=dFxlGkAsaVxPjfqraz1BK1cvFRwlDr4U8FVEY8Lz7yyiCco2fZ9g3sdJotkcX5Hxvl
         Y3bbGTEwypi9jEEmEQbuu3ExvLTVBU86Gm0+zhYMJiwWa2L1/B4e+8Kjme0R2FMfEWQo
         89Lti/VbHlQUfQFKUhN4QXEDgGEOyhxqKvq8bs/JgbLooGl8PrqQUKL4uFDaotiDcKwt
         G8f04qt7kmUWEWlGkyd+aZSd8PrNnFKQS7nKnLrZJOkX4d4blr20ZcBx0VoqqR02C/1z
         XCBBiJViOe9mvhGKK2LiJnGbyGuax2jZutAmttjOthbXYsToYIx+GkgkKA3zzqyIgnsw
         WQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=K3CGQRmOykz5tfoaaxFSaWYe5yWY7ptKtK/037Qvg2g=;
        b=TJvJzNrHRErZi7g7+jO7PhgAVrzLyiUHostuHKFq5hBZhcohg+Nh1UAx2v9YmLv/w5
         yir6szXNROW6+0BOLPct1y5PwSgY0OWOBGZDTPe+LbRVlBXiwN3BepdUBPqtLXyZSidW
         OXzU0unCDwaxUip6HnQ99P1reJURAykAO9ts/mgM1D4VPUcprhjsIZ7/z2hK3LjplRCg
         o635FbGnqPPJeYq9TEnfwyli+abXuB3edbyeWY3rnnzTw0NfLR40bZtDLajEwXnQ0jeo
         QHhLVbSbYMpGtwlOV3Qkx6+tL4bc7V/cDH4XitRj4e1zkJdH1gw7Uk5yXRkm3bJLL2sd
         zJww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yBVz/hXy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl4-20020a056214518400b004aca1197e25si1017850qvb.32.2022.09.27.06.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 06:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yBVz/hXy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odAVT-0003A8-At
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 09:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8iV-0005rQ-MX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:25:35 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8iU-0001Jb-2g
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:25:35 -0400
Received: by mail-ej1-x633.google.com with SMTP id bj12so19947787ejb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=K3CGQRmOykz5tfoaaxFSaWYe5yWY7ptKtK/037Qvg2g=;
 b=yBVz/hXygei7svWzhpGDVu8e5DrU/34miPkM4tx7ycoLRyJE2UGQMPEK5WEw4uJOuk
 Wlg7H7jlTF/bAFUQQeWBGEco3Po7BcRb/3N6VTZnUkwIo+CXJENCstidGv9rTawuuE6M
 rrH137NV7j1Azmu6nsV4X8O3nnFXBhtefDnd1EFdcNii3RXH9M6IKuxzKUj/tONJE0W0
 FwDlV9tOsXtaJiSInkFmXxNUcV90JgYMI79fhOKhHdms1znlWPhLlWyOC2mMNOC2zLVc
 BLVmaRHPgkmkCfjEgX8cMJxtGYsoO9a5u5Ik9ca+8mgHlTx1sMJS1YkMQTSLoZNgR8pM
 Ch3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=K3CGQRmOykz5tfoaaxFSaWYe5yWY7ptKtK/037Qvg2g=;
 b=yRfMXNuDpS5cHBkm3RsFkDouMwIhXEr5GK3eyQHjmo+kSYck1hldUsgzRwz4JaR8TI
 7l77SnMVMpwnDpSnD90AAgoERcm6Qkxz3UJPDmorShBFwqdn66O3KflSkvlSdDrlZl5c
 F4mCusUL0E1Bqo6EhkRyNTF0K/0/1N8qcbsvlHUu/pkpn/6m9VPdgIW5PycHH9ILi+tQ
 Nw2G3Beh+PwKrxNWNSEEq/StYXYUDEJH+4IU522LXbpWCbmi8TJPgE+VMgw6QZTAaOtK
 J+Tb8Xoq09/eQ8EVEyk5kweyCCjO5ulKH/oWWrSf1y9Q31ZHcuUpt5gMAC2wMe45WyAM
 gxsQ==
X-Gm-Message-State: ACrzQf1OwKEzkuIHEk2qyZ8F3lvhWbhndB8wvGyL6b1s3lIwq+MOxrd+
 ilmlf37KbGSfS+7t/qPV54WD9e1Djv6qZrpjTh/bBw==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr21880756ejc.365.1664277932749; Tue, 27
 Sep 2022 04:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-6-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-6-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:25:21 +0100
Message-ID: <CAFEAcA9EqYi0LdXtz84_-8r1L3DUNWdnNL4LTHrm0n4cub4ejQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eli8j53c6Tfr

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Since the pl061 device can be used as interrupt controller, its node
> should contain "interrupt-controller" and "#interrupt-cells" properties.

It *can* be, but this PL061 is *not* an interrupt controller.
I don't see any reason why we should claim so in the DT.

thanks
-- PMM

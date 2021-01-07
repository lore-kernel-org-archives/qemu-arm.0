Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp445345lfq;
        Thu, 7 Jan 2021 08:49:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwMKwV0WhpDtnL53g3BwGXXaFiAhhnifRW6z6LPnph7tkXxwER4oejR9YuYrmYM+Wv3K0U
X-Received: by 2002:a25:6902:: with SMTP id e2mr14308076ybc.97.1610038147021;
        Thu, 07 Jan 2021 08:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610038147; cv=none;
        d=google.com; s=arc-20160816;
        b=q8ISjFrECw1c5wEv8kII/Iel1XHyvm+/jcRz286G/tKm0IEzsZXDjlzT1OUbjfD9nd
         yx9An7PvTzES47RNIaHjXHB4n9zqetmLQgEFMk6gkSa0Qll45WSruphkDTGq+CKTEGz3
         rEQai/fZEDL2dtQoPPN2RjdtugqObvcK5T0QGYQ/QcpnPigYSPLAB6fmTM4dwpya6qUK
         zGNz7QT9xjS7rJmiq7dmGNpaQGY+zOhvj5NmVZdI7PgPlCZkNboARNzMaFIRtTURiv4J
         jzWlNKrw5RKiIrKDX2WvlA3pmuTLMTwYH6GAuV/U/03rDwWnHz93Z+L3YrgiDAIe/YJy
         PCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QORxvQQGcqsCzWuVmsLL8k9lF5JX+K+N8q2BxtmPHPs=;
        b=SfEbnUrL1ssezHBBiMjSa6Wy/PldyiqmgeMxhe03s44DUUoyLuv75Dr7/VMBMCy89Q
         dhobffgQVinxe1KLDNEBORktS8wU9I5rh237K1A7zp1ePthPscdL5chtwfxEAgyw6DR8
         YVLw5uVlI1XtvXTtHTqC7YTVgVE8FdWCbJVhgQGVpgzC2eL04rHvfcOTvC3aN+s/IIlo
         bBZVfLBPGN0evEYsz5urzs/waqOYh8+ndq2PIg/vCZUg5IdKcJ4YyVSADgQRK61w40lN
         Pi0TxzO+36rMPRTn1EyWJCuc4FsbnxrwQ/dF+/tT5cECd71XdyuAC9JHA7xxb7lThivO
         XVDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ackduXaF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d184si6569182ybh.123.2021.01.07.08.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:49:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ackduXaF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxYTC-0002WP-Em
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYQf-0001hZ-MR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:46:29 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYQd-00073c-4Y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:46:29 -0500
Received: by mail-ed1-x531.google.com with SMTP id dk8so8442758edb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QORxvQQGcqsCzWuVmsLL8k9lF5JX+K+N8q2BxtmPHPs=;
 b=ackduXaFQRFn+Cz5PxZJqBKKSTElw+nreiULK7avFHw6q2PSmtl1zdY9kI+DnGxeGn
 T8o56CD7jMGy0gsHch3vGDv9bdRMszh3CLPKnJj3PhcAa4UAzin+94aXjKvCb8DbbzzU
 sViKh9u1OMRwJSK/KC2vJEKZz19tndThWKVB7jq+7sXP7QIvHke2Y/YEV+UJX/4DZWcc
 SeJC3KD+/mMr6nnpFEeb+RovLkuZLHPU1UEdsFDnxr6G5TkajX1lKrF4cY+M7aHRBxCL
 oWxg1f450/Oj8wTHGqps2GgIpPw51bBEfu8XF7UUVR0zdXHYRKlPHesXWm9TGMhm7f4o
 BlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QORxvQQGcqsCzWuVmsLL8k9lF5JX+K+N8q2BxtmPHPs=;
 b=AJNY09dqsFlfy7LhvU17MJHbHv2/0OdJqh8AGP1rtAux7Hqd9k1+mNkhHlqBu7Casl
 GFxkc4XfA2fq4WF8n19f6Qd1sGYpfnq3LXuK5xsjYlp15bW33k9suPkwD0qIcWXwmi30
 7WZZWDF30reQ8q3D/+pR0sn3lm7BqPdAflpg5bOX5vo8gr7r1VmBD2j6pNoNLVnatXwo
 Th0Aep0OYoJSjdbUSSznCK1cHco7VTnmazaDD0MQXnFLZ/wpESV7IGm5kFWi6mICJav0
 ovNvFLGOmf1p0m67NnlECNxCzUFKHn5F2UoxrfFxJwI6dsGEXEqN1n8vDTauSpjyrb1K
 tSsw==
X-Gm-Message-State: AOAM532OK0yUJKpTvDhXIUzsxh2Qz/rJRVm03GHUsrYwUAortulcc/T1
 /04lbSyvCWwI8vj/jG1zqj+9LOb7lG/RZYWIDosacQ==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2281070edw.52.1610037985683;
 Thu, 07 Jan 2021 08:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-17-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:46:14 +0000
Message-ID: <CAFEAcA_uSEmN-RmKVRT-+7XNOh05NF4j8MbqAWdrheoZ88fwGw@mail.gmail.com>
Subject: Re: [PATCH v2 16/24] target/arm: Enforce alignment for VLDn/VSTn
 (single)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t7x6x2V3XDah

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 48 ++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 6 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

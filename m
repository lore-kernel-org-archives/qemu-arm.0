Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp650676lfo;
        Thu, 3 Mar 2022 03:44:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYCw+xfarSw2dn0kh4dlVFHwrRpKX6v3Mfy5A7oL3sWxa2KgaaN2RIdeuq1gWtxaZQZWRV
X-Received: by 2002:a81:4e82:0:b0:2dc:4e9:32b9 with SMTP id c124-20020a814e82000000b002dc04e932b9mr8838913ywb.74.1646307862923;
        Thu, 03 Mar 2022 03:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646307862; cv=none;
        d=google.com; s=arc-20160816;
        b=FMIVoM0udZ/4kpugrU7YCdQN7x5xjtAnxCg1kx02xyhnM1+HSKNm2fe9HNolzZabfx
         Rkp8BhVR4aDHjNMkgMpJi6gO4trhx/28l+kP4avHnZIQvpOy30Y75zk6HW0oQS1bRz/5
         8F90zFk0nfPnoMjxvjeOsRBlDyxVaYhWzJyxzJoIAYr4o8v/atY6aERqOdlNKXHoRMwq
         FVqQ0vh5LB+RJ+TK6zL3iIX1u6I72/0k4qpZGqzECGr1yxpYoetE2DeThgnJBqneImqo
         aCnkZNh+VM6nNqWHuxOVM6/zl7pNMvqE87iUztm8bqi2A+ppr7aSNw9j28ntAubzDW3+
         y82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/JQj4MOq+sKXFEjWyZLXtAunHJWj0p9MhFrltauh/Q=;
        b=q2wfkJs9kW4o8dILdz/CJv9mpAWgAInfDV7aQKDLYlJlqEjX336ukc7OOc94wTcwGj
         OtCCJBRLNXwOBNdG0DBboinJcKc5WjEJxKbysV+Ob4ZDRTiZa6sooax6PXkOYAahBCf/
         qgkEQLHh/ks0tdQTIjCBmkULPcx+QQaUGaAncGzqoY6U1jI2ZvIr9//CMcHXLEpbjkiU
         JrYiYFaCKyJtnaM+B66BtGQXHiCTrUyD/jrimSurWqy1ItDU2Qah0h1MWsYK0l2FyHOs
         tHUVxZh4KsSb4zdppauUO9H3VRwzB1gGkoP28vaKA0MbOHie6C1E6vcNcDGPUay87Wz1
         /VOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U35Y89QQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020a2584c5000000b0061da7a59b61si1366103ybm.185.2022.03.03.03.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 03:44:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U35Y89QQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPjsc-0002pY-CP
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 06:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjsP-0002of-S6
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 06:44:10 -0500
Received: from [2607:f8b0:4864:20::b29] (port=35573
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjsO-0007Px-Gk
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 06:44:09 -0500
Received: by mail-yb1-xb29.google.com with SMTP id bt13so9683165ybb.2
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 03:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/JQj4MOq+sKXFEjWyZLXtAunHJWj0p9MhFrltauh/Q=;
 b=U35Y89QQ9SopL7Aj0hiyMUkhOYEG2jTHyCFdF27Ex/0RmGIYCRdHi6SZ0TLHgQAakr
 GDCswqgU1gHDlqyG4pIGTB5GS7yZM2VxyvtwLYpuZF5K/sboMa8M4yNWSAuLU2/9TxfM
 8q9y/HkRaQuPFe1Qi7lvlfaZfAg9x3Is6xXDHQrzXsFQjWKebn0DDOpMB6oC3tnKKsG5
 6XfuJOZKmESBYnuQXTY3ccribQY8eW2W2n8snaOfg/CPVE4ST7zpXKjKFh1Aa16ok3jn
 GPLIlcKvRb3Usomv6Td2v2iY4Bvxj0v9jRyn5fr+ZtQPtf1L/5MVH41737/1/JBN7GHj
 xswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/JQj4MOq+sKXFEjWyZLXtAunHJWj0p9MhFrltauh/Q=;
 b=Ab8n3bJWuBoMga16H5TMvAppxBas0RpwFonX2rNUH3kdindiYCnNetgslGGSJ8MYpd
 BPcCWa0hpLrwBlhQrB1cvzMVXFsoCIWGmY9DodI2aj8yQrnkS+JWYPRn++VQQPpyKw8F
 v0XyxcnJM9wYwghPK4HCJlpC/GyQSR1igrEC5Ttbl3X4Yo0fgCCPnr01iV2/ycJd0nTw
 CDpH2LHuhM0DAd/2LnvbB1ek57l5gKHOwvNAB4CcR4s9+gVTQ1B4RGRDQJobTRyPJ7Y9
 VCHj8x/gu9YCpmOhnz4A43/6+98GP/sG7p/1n/0HPmVnlYYte80KBqjR/qGXiUQZnfja
 CfHg==
X-Gm-Message-State: AOAM530HZkN1OQ6o5NHdQHBGOxGicpznRN7GYbT+cje4nW2+D97twfUM
 JTUwZqI26pF5cJONcst9BSo340snXsPoYAnRr2/PrT2oOKPlYQ==
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr8867743ybc.288.1646307847400; Thu, 03
 Mar 2022 03:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
 <20220303113741.2156877-2-peter.maydell@linaro.org>
In-Reply-To: <20220303113741.2156877-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 11:43:56 +0000
Message-ID: <CAFEAcA9H3Cc+E9G91xrvH-YcD-fJU-84hOekbekca-MOz7d_eA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm/translate-neon: UNDEF if VLD1/VST1 stride
 bits are non-zero
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kK7tRWi6MX1n

On Thu, 3 Mar 2022 at 11:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> For VLD1/VST1 (single element to one lane) we are only accessing one
> register, and so the 'stride' is meaningless.  The bits that would
> specify stride (insn bit [4] for size=1, bit [6] for size=2) are

This should say "bit [5] for size=1".

> specified to be zero in the encoding (which would correspond to a
> stride of 1 for VLD2/VLD3/VLD4 etc), and we must UNDEF if they are
> not.

-- PMM

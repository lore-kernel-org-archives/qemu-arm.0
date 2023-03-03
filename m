Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1300535ejc;
        Fri, 3 Mar 2023 08:55:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/duz9lX0+A2JMCp3Em/7PKqoNdUQlO8FBX+PtpjZoes6M2Dnzs03exNdE8TEGNxZIxGKKb
X-Received: by 2002:ac8:594f:0:b0:3b8:68ef:d538 with SMTP id 15-20020ac8594f000000b003b868efd538mr4352702qtz.52.1677862529078;
        Fri, 03 Mar 2023 08:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677862529; cv=none;
        d=google.com; s=arc-20160816;
        b=Rdf94UMDZGEwa+OWtHPtyIUa0oGl8GosIlUL6sfB0rN7HGfiirm0RqQHaH1fhrl19W
         mgrfaHgvzpb40w6jxhkwsUIkxSADfRBUeeLkS5ahnDfXRvGxOFxwPhAlJahyxg18RCDc
         msA8U31JVf5YacKg6FnC05y+F3iw0r5Hfs8oQGXhESDq2wmkv3ZibzhLnhrN05otEfiW
         5qskvEu6SQCvYys8C4Qi2INvG2H9CSpNCD824Lq+hX+w9n0Sli66GOiPcOmtzTibtbEL
         Ersxd7WKDAI9GxWkqcsH2kQFQxfbCtgZvW8ZqJyps9KTEz9Q6dx6weV1RdtGwEZr8TpU
         hJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Ew60/wbt5oKoD6+e+OGNZ8PEd4JBl2JusoxoWgGKODs=;
        b=ocWwMO80pyFU8kqIjxj7BRxUUcutPW75sEePRr4SIF4BCdpkA1Z32UeAj44J5AjFDi
         nTdehlVbTh1967/dDCDaOxUsYumAxJDPmQKmVb+V6/WbyiM31sZ6P7E0YMKzcl//x9Hc
         RQF8uQdb1wacOuQD4HBYLEsZgGq232F0iDCIGr8oGXySaNWVImybdKm0fPDzQyWNYXIY
         T4SICIqOKO8PZAkQhdJal7qm/iYm9qZ7jIVai1vz06UB+A22rzdZ1pzaQdgTQUSStvZt
         /OPx8BNV0bgW+DP0r6Y0Cq93Ut4OTtzgJ9HjP+CBF0K8mzTe7WSydPugD2goadnU5aM0
         Qc1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qPkPB04f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020ac858ce000000b003ba137af908si2183256qta.372.2023.03.03.08.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qPkPB04f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8gb-0002ud-B7; Fri, 03 Mar 2023 11:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8gZ-0002u9-TX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:55:11 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8gY-0003zG-Bo
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:55:11 -0500
Received: by mail-pf1-x42b.google.com with SMTP id fa28so1950055pfb.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677862508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew60/wbt5oKoD6+e+OGNZ8PEd4JBl2JusoxoWgGKODs=;
 b=qPkPB04f526aPRoaz9VFiEzuQCMrQBqo09AZVVmpwTmw6Ized4InZJZxWvUPyt4OM5
 iRm0oiRplWqdkFPmmAJKGwUJ7Njq47d0XtqfTZ7ZC3o9N5TY7nJ/uenOv6SaPLxvBfek
 qB7mSIDUQ1lBig2x48l3sxy1jvZjv6cMOYqQeghbtnqPCa3vTs4sEHSKnDgURDVaVYGd
 nCtCFB07NRw8I+fdmauSRHNNYLfWrQSjbyM7TZl0tvwMmWwuQyCN+3bsisYxW0LBBRjT
 cN258O4ITEawtDN4zxtvZKqB4CNJ2nom9OWjVLxdeYELbl98H25P0Nvy24pGnv8xnY+2
 vIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677862508;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ew60/wbt5oKoD6+e+OGNZ8PEd4JBl2JusoxoWgGKODs=;
 b=3TEhM0TaUF+Rka12TW19iokSpaETpYsOiqL4c9KGgjnF082wFpMLA0coqJrouX1Hdc
 hlgVoGPOo4P/qivHGtBm83q5Qs/TKc5Li7AIKHubo4XszXlHNUtAkfhSCcfhucmka1jw
 Qw37LCwFfTXfMy9csTTnB+p7XCjYIfCxMKmrNbWJspRz88svoYWyz3Flcgny6hZ5Y9I+
 vsrTLCgb7xG511sGSdf5Jhzaiyc864PibSZqEcbDJN64bUT0usyDBgUd18jx3jwHtJwk
 FH5hC1Y9UI5iYripITpgx47O2M5Bptp9bQXg892TFKDjKK4Ve7hbOvmm16HDybiLV7y2
 nCzQ==
X-Gm-Message-State: AO0yUKV5UX/dR4juTCe1uy/Z95EXecjyJFluXrD8vpxY7KUsLCayBYRw
 jvTXkstbjerMvfiaB8UcqpdppcMBZQ4Vm/p336mayg==
X-Received: by 2002:a62:d041:0:b0:592:41a:1054 with SMTP id
 p62-20020a62d041000000b00592041a1054mr1155595pfg.5.1677862508403; Fri, 03 Mar
 2023 08:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-9-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:54:57 +0000
Message-ID: <CAFEAcA_YdMEG_OgLZe=wVW8S4DBg+FG4G8z+_QtNc7rXe4gCcQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] target/arm: Support 32-byte alignment in pow2_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sg08GjfIMdOW

On Thu, 23 Feb 2023 at 20:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have removed TARGET_PAGE_BITS_MIN-6 from
> TLB_FLAGS_MASK, we can test for 32-byte alignment.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

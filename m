Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1624973lfb;
        Thu, 31 Mar 2022 01:46:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhuivallLPO4QlP8x+Juf6U6BI5P+DCZX92XeAngaJD8aZ8EZT4qJ6LNJ5HGLBfIAkdm9O
X-Received: by 2002:a05:622a:492:b0:2e1:ee8a:b1c0 with SMTP id p18-20020a05622a049200b002e1ee8ab1c0mr3225540qtx.162.1648716410145;
        Thu, 31 Mar 2022 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648716410; cv=none;
        d=google.com; s=arc-20160816;
        b=yqVKXsJd/Weh7hgohXfXd6aZbIqdUKVthegEVczjQinO6FamVH5A5XWsauWZDlROyS
         yuFxOQ1IxwEKLzmcWFs1DSEkR039xVAJdD3ywwPK4fZv4XSZ7R6YsfRv1goMt/Gn2bFh
         QBgZLImwy5d5072qIWxh+L3MITAI8FNy9qlstdk5yh8NnzaED2hUrgUMgYSIKeMaIDCX
         XXgM4E26SEcZChPFMzLoe0Xsn/YPMt0YYTyRf44AjLF3VL1zjT2hjelBUTBl7tbDXun3
         THgDGKOsyek04beaOBU0BbXgRe7K9ysUPA1m6u+8SHbxcm0wFC8uWbzfmpKnqpyhJ9bS
         pCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yPfi4Nn6/SbDf3IxbFxR3rP/TkP5Fezknc9qXsLwshg=;
        b=gW1jNEemz3oAX+FN572vStvydVetgrOqrT/sLqksc+CsFNqaNBxj/hGEXDnpd03hdk
         EId1b+hBy/HVFqQMDIgddKnKnT03NtOLM6sBptnwyq1BDHs+HevTOL8IUQFxmGkFeMvl
         zP4FF/pnDfy+aFmo6ovSKQuZt0FNOJqwtqzn/USwG3MBigghiveSItdpV1KW7xOzFuzs
         orXgzx+m3KKR32IhwmHGsCCobZUj2BE4KlAvyfRLtT/+97xMlc57vPccgyidonpMF1XF
         KtBY8LWRH+Na8tF4EZZ9d248gKc369YB4yHKxzIWmpwjATYuhoCXBXHsIvWjfjvnmtTa
         /uwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aY+RJf30;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bh14-20020ad4490e000000b00440e46a7c2bsi12065340qvb.201.2022.03.31.01.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 01:46:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aY+RJf30;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZqS9-0000N2-IU
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 04:46:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqRf-0000LT-DX
 for qemu-arm@nongnu.org; Thu, 31 Mar 2022 04:46:22 -0400
Received: from [2607:f8b0:4864:20::1132] (port=37105
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZqRc-0007e5-V5
 for qemu-arm@nongnu.org; Thu, 31 Mar 2022 04:46:18 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e5757b57caso246515747b3.4
 for <qemu-arm@nongnu.org>; Thu, 31 Mar 2022 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPfi4Nn6/SbDf3IxbFxR3rP/TkP5Fezknc9qXsLwshg=;
 b=aY+RJf30wwbTQBV7744EOksxsthY3UUHayxxon3BDVz51ZDF4XyU0xSsHIEL70qFCR
 IH6DN98a9BPDWaxE3HE6HOuFYQZG/Th2mN2VQBmwZKeGTgkLRZ0ei7oiAaif4g4BXBtw
 vCLNVQSDn+DlUVYfwXvHXhQ61eEtvh4egGq84gt6vDViNFnFKNW6+vopwxoEQG6WvbN1
 pasSfgxHZLAZT6acNBSJ337FP7Rlj8xNeXYXw6cGb0whz4tDhen8w3V1073SV/vajSxB
 Msg3k9Rn4wFS5FqpK/F6KjNo7R0CAlVNjbURowMTCi4/34AdJITzdaZrjhOChYG3MCaW
 qSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPfi4Nn6/SbDf3IxbFxR3rP/TkP5Fezknc9qXsLwshg=;
 b=nvTGEkHNsLr62cGrldJ0hd5Smr9r0ybbTs1tmQgbUtNSi9XbzaJdtmf5VWry3NEnJy
 D18pKadXMcVdJNLa2UZj42JfxONSW+ZfUSGNzk2foIMV00h2FOwhaTPv5//1vYmcTPMx
 v5ewDQwBHPqagekW60iNZYF5OeiOiD6wC7+w6l682XP/c81fr2UhJiJxjK03jIn3/Uf7
 Wn5wgbc1wrsqnnyyEQwhmyvZ2Fu+9+b+1tXfa0nn719YucQzO//gNJfPEsfjs6UrYk40
 enqyEL4WF9rTKKDtihHhfT4UUBIMAvGWi9sOk8AX7eVdC9PngVRN/7EQw47rDdyICX5R
 qGdg==
X-Gm-Message-State: AOAM531dYiryIcR/39prSaNPSPFWN4uzGiQykdWJzkWrFk9emi+fp2/s
 RXOTMEKuSYYm3kejMx3Q6Ut55hgPwuoLBS6988xTag==
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr4006605ywf.469.1648716375904; Thu, 31
 Mar 2022 01:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-4-idan.horowitz@gmail.com>
 <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
In-Reply-To: <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 09:46:04 +0100
Message-ID: <CAFEAcA8eycaT-ESi8Fopj7LxH1aZyyNCcL6whvNpQDqt9VEVug@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: Determine final stage 2 output PA space
 based on original IPA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jp7c/oncsgbL

On Tue, 29 Mar 2022 at 20:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/27/22 03:34, Idan Horowitz wrote:
> > As per the AArch64.S2Walk() psuedo-code in the ARMv8 ARM, the final
> > decision as to the output address's PA space based on the SA/SW/NSA/NSA
> > bits needs to take the input IPA's PA space into account, and not the
> > PA space of the result of the stage 2 walk itself.
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>
> I believe I follow: because the walk uses walkstate.address.paddress.paspace, the ipa
> input parameter is unchanged, and it is ipa that is passed to
> AArch64.S2NextWalkStateLast() to form the output address.

Textually, this is described on page D5-4802 of DDI 0487H.a;
the security of the output address of the memory access isn't
affected by the security of the output address of the translation
table walk.

-- PMM

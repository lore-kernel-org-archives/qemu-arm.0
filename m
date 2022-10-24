Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3179876ejn;
        Mon, 24 Oct 2022 03:25:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yTHOfCIr3NzKnCxLxPp/fLagJVKzkrUnyoLdjQYJIlgsuGao461tbm1VwPvk6kj5UysGM
X-Received: by 2002:a05:620a:458d:b0:6ee:e940:4a6a with SMTP id bp13-20020a05620a458d00b006eee9404a6amr22355200qkb.235.1666607119408;
        Mon, 24 Oct 2022 03:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666607119; cv=none;
        d=google.com; s=arc-20160816;
        b=A7KlHw4q5TdUs+HkAp7U56hWCOZIIGWkSWLlEdtvk2OI7q4rzY82F0X93fJgENvDFz
         7ZXaCRabsYGwdh0A7uzWWYXQwzKVOPvXE1RhXp2ESvPKofaKTe2vVY0yr7egwazXNG+c
         WIQhY4RPSPqavqW7eMr0IyIYmM71yP/dqqW13ZCjS/0slEZofQJCfNEcn+fMCwSqB6o/
         Spp2YxZc5ekUaOGjsqmuTwpGHKJLhv2dM06WvGFd8QbHCDffmR8KCgaeJbWsjj8TijBi
         0PrERFWokaNrh76/TQGsQVVzaa9yWQ3U6H0iC8VUoFbf3EUuVCGWpzbxHvj3HGkyKsjq
         tR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
        b=ULeM/OL3J9qgtzNAdR/F0CdD08D1FioPh3J8+jj1gbb3CAQAzhXVAW5KennSOU0tBk
         mOBJnap5ESViii9Zdow7YWnaYA2+j6y+JZV/MELg1CwYrU1Ntbi6W8FHAzBicoaAPpgn
         +DUya/T2GxkOEsFrKPrgjgKHO2Xxt1G8IzqbV+Ok9boXrGdNkptfJ7apMuGJEvlyXC94
         EQvxPOdfMkcFVPv1L2sVjChpaewdvgHrITsGTWJgP5k5wVyNUiGjO++1r8Eq4ppwD2O/
         4PrwwzQXfF9OZ7lbeKYYrOCMbJUmbiV/medRwFOex0C8R20r8Qnv9OQjO3mDLMkqRzCl
         haqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HmBXZVaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a05620a439c00b006ef1a8de757si5835824qkp.91.2022.10.24.03.25.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 03:25:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HmBXZVaH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omuXY-0006hR-P8; Mon, 24 Oct 2022 06:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuWx-0006MK-SG
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 06:18:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuWt-0005Ke-Oq
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 06:18:03 -0400
Received: by mail-pg1-x534.google.com with SMTP id f9so3905908pgj.2
 for <qemu-arm@nongnu.org>; Mon, 24 Oct 2022 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
 b=HmBXZVaH/gLPCmR3huEvCZWv2M3es8sT2jtuxS6sT9V7rVQ0SUTizHC0glPr0mKEU1
 CZnBK6lqs353Uz27ikOqRjcE2L+Px/66rLKudb6lLiLhDx7oEexznYc3RSGzAIk3b8uo
 UZza+QXBUSYJUG4mW5spNAn1+RzuKacbhun/1g7UFrvTOJwj2XCUC4m3ngjVLCz+P6F8
 UoRY87QVAl9yNE3kTvaYncerHDTJJFCcPILFfjwsoF/Prtdgn2xRdoDGymd33T4UC7CJ
 DrK4KhSDAgyPm1p/UbpAaahxJVB45YR9Mr6vqsOC5sGpBhi9wXyfGB9XxOj0u7UgqDsY
 0wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
 b=yamxyDQWVlAOdVO3iRZ8EWjoIwaYnqqf6KL4GyCwnmHaFToQs7hZz+t9jrtJnPN4A2
 mPvFA7yUD/KtLC7X6pNcY7OIL/59699WOWUU36MJQNS9Qn4CbDTYPV0njZIGQNpQkdjJ
 +mSrHthPet/SWQRd/JovQcAFIcC44K2XmEdgCe70cOZAXYnP2ncWaAYHAOt8+32qbBKe
 xodYNUj1yB3whGchmIF6e2UEZL/FvbCOZRc0IdJ0irangT4B6lK+TRvVsiSleMa23Ei5
 a+4PPOMABa3ropeX8ZlxBcENBTJrJ3NF4c9/BOUds4a6YxUxOK+gjqaeMOb5/gGa2MkN
 2P/Q==
X-Gm-Message-State: ACrzQf0GjFgMFHgXvOz+D4Xfccawu8dO/KRkGWgFtsPWou3TXA4rue/7
 GX5CDzZT6/K9Z0r62TqcbDDsw+URgwWUwZ0lPOIf4A==
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr27646498pgi.192.1666606677719; Mon, 24
 Oct 2022 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024072802.457832-1-bmeng@tinylab.org>
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 11:17:45 +0100
Message-ID: <CAFEAcA_547EyiBQotG-E--Mb_t4XBCfxx5XsaTYAW8oe1Xm+wQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iCbs32+BhVQ8

On Mon, 24 Oct 2022 at 08:28, Bin Meng <bmeng@tinylab.org> wrote:
>
> %s/return ;/return;
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

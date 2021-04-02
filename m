Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1639042lfg;
        Fri, 2 Apr 2021 11:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/JR3IxDdzkgi6yMrD9pUEzWBDZQEl/R70irsQ+DuYwyjUX4k6OmxJvSaS481eJyUj6LEk
X-Received: by 2002:a6b:5818:: with SMTP id m24mr11590726iob.144.1617388597410;
        Fri, 02 Apr 2021 11:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617388597; cv=none;
        d=google.com; s=arc-20160816;
        b=LzWTEKY1HoAVUhoRW79FOOAb2oz1DF3X1/b/NcmCZED5YKp8kuQdwbhQIRu9Nt/p/P
         Wk0PLMtqOiXzxqXFZaxSAmZyiXgmQTOdcinNj4jvZ07C1s3U0Gx6H0EuQgLKRjNn3l47
         ChpopCZNMI0YdTecPfEzeKlp2ZhjhiMGcDB1CCv4Vah5HMI8kEnJZYPIMql3l6EWwynx
         KhrW5sCn6dmbOy7kpAboHT/4yiDyzXAG5ThhNH8Rg9mEXAFYiVLCl8xVIFDvwiXPS34P
         I5cRdfOY2643qXDLAW7jgOLcz/Sc2TFgxlsCPY2a9sYX66Y3W40A0oHc8YKEMSkSMs+x
         ndrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycLVpaygnCvDyiqZFpLSTc1Wmb/yz6jvDoc3DrtkmLw=;
        b=v0qavnMCQB/WKUHz8Rv5ReE8kCr8D63/k1/X7NaMCvSkDV2BbTcD4hJvhURYF9GM1i
         RdFD/EK2dq1Co/wTwJATG177h6a/7nCqkn6s6LMKV/iQjYLwIEBp8AB2FGcubf+qa3Ow
         h2UREyZBU9b4bNHRvUscppC4siWIa11HEcsIY2cCZVazBnj2xa6iW2kDcIouZC3j/qnp
         Lh1TbFnHbJqVtFKK9sOLMx/9R2foMFDJjxiUO+WO6i4GVK9nqisQqnW2wa5IsPXeVC90
         6QulMOHsX03NeSlJU5u808Tdf8HH0zIMAEkghfIQTnQxhNefjsjF4CUwi5paVMUd/Cui
         3RGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FFcroj93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si8191627iot.91.2021.04.02.11.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 11:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FFcroj93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSOep-0000Eu-G9
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 14:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSOeC-0000CN-17
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 14:35:56 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSOe9-0002BE-Gu
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 14:35:55 -0400
Received: by mail-ej1-x631.google.com with SMTP id ap14so8557560ejc.0
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ycLVpaygnCvDyiqZFpLSTc1Wmb/yz6jvDoc3DrtkmLw=;
 b=FFcroj93g5jbLT1wL8XukXK0tDH7E+vVGodgK3mdf5ixbBVpPub1Kuuo7IfgyjxNP8
 8RBx7rN0odxUs4qRzhsrkG+6SD4RnNs5QrDWs29VLAUbGv+oa+H+8fMA0NK8h8k81IFL
 5PcQRLGe7iRDnjGycT8E3C1dtd2MKZDdD3Ss1VCfxN8hMdXLCkxDm9DRUF58C6POJ1Pt
 F5kdz6TduaAf6hVAVX6cdKmbR5NRUACMjoWO0XpQnGR38BM9mNiCxPicgnJJLDNhbdwv
 XwlNBxPrnssYgyOlbMODp396ApSUA9tUlRDE0PWvL/imRiWOacEfqsdUmcN5j3BNqqna
 CGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ycLVpaygnCvDyiqZFpLSTc1Wmb/yz6jvDoc3DrtkmLw=;
 b=tlOZDQzaDrpz81mnmVaEAzA5ce8GBp7uzyVZIbnLcu+MpTI1smI8ENy9EdJc7TdveA
 XUQgKN/X+mDmZ3HB4p9TBQMytMQbDyFd4ggqf+kOQj6kfERagAOP7lYyWL/B9ck1hUyj
 TC/FZQ0e2mf2xWdbb4XQr65RA4aQM9D9whlFrpsSlHLe48z8rurrAXK9uu2dLJxY2OiU
 6QeOFocXAK0/RtjpKVMP3vyOvjNqu8wbFY0zL+CEkHd0S+DlUIFVH/KsXMVpO25/+yXJ
 mzGMiu+ap8ZFOQiSleg3UdG1hRXHdzYBAdmrYo6pM1gHvvjl1GQFZah1QXttrCYTNiIa
 REAQ==
X-Gm-Message-State: AOAM530Qt8IY2An+1iOfysTtDFX1PEvEErfmeHWzhoOWaUaO5YmEFAog
 Zrr8zuSrPd1PqI0zYz3nPhCbMTLdOEh+jxXd7kPgzQ==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr15201130ejh.4.1617388551330; 
 Fri, 02 Apr 2021 11:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210402053728.265173-1-richard.henderson@linaro.org>
 <20210402053728.265173-3-richard.henderson@linaro.org>
In-Reply-To: <20210402053728.265173-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Apr 2021 18:35:16 +0000
Message-ID: <CAFEAcA-jky04K9d3WFxj+JU31mP_NS+yrEDXzXaffYC7CRTFLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix unaligned mte checks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: hRYOzdFzayRy

On Fri, 2 Apr 2021 at 06:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> Therefore, drop mte_check1, since we cannot know a priori that an
> access is aligned.  Rename mte_checkN to mte_check, which now handles
> all accesses.  Rename mte_probe1 to mte_probe, and use a common helper.
>
> Drop the computation of the faulting nth element, since all accesses
> can be considered to devolve to bytes, and simply compute the faulting
> address.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This is a pretty chunky patch for this point in the release cycle.
I don't suppose there's a way to make it more digestible for review?

thanks
-- PMM

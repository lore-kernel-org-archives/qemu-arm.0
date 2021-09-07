Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4836556lfb;
        Tue, 7 Sep 2021 08:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7t/CLluDiYB2l7wb2gSI1AU2eqNqjF64sFEzybr4wq1aJTUhwMUSXyjOPD8BSN8zwHcou
X-Received: by 2002:a05:6102:21d9:: with SMTP id r25mr9965395vsg.57.1631028522040;
        Tue, 07 Sep 2021 08:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631028522; cv=none;
        d=google.com; s=arc-20160816;
        b=KQR9uftoU8rXapAWeVllOXVpnLxxs9tI5gFT0fJHII10K/nnbk8JdbLr8KSr91lrJD
         FH2bK5bkPPlqoqAHOF2oVd8pzroJwOYgoAEtMi5eqR7hbbLV1WG/03XOZ3yAI/+r9Ess
         xI8YSH1/y/yM2UfbOlOfck5NZLLv/RKOfKwhMTW0eOYJ/xq5hL+mfTM/GkCtibX7BlOd
         F+3OefpG+S0EUl9i9Ve4+MRSYe9Xv2OAx6OqsvosRYyJjmJFPkdgFXeFhKDGtMLM3OYR
         IoMTVod1eStj2Ajdqk/CtdStYC1lncrpLChLspUDoZfoLLYSakV0G9ZT9fto5ayvtgEP
         M+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auutU+21lrsq6UjdoWD7jlgdut/oF43UfVCOita+TV8=;
        b=PB+zJ7ns5J14AkRUEblels4BX9/YXEPZ1gAvwZKiMuaGCXfj0A9YtpbGKJr/tltBag
         xwICQasAvIFcZuiOP3YNiNeYjN1GVpf9Ln0NR/QVnKYAcMjz0Utg1xNFxtxqOfDA0QwL
         maaKk6l+wAT1uAnsRq3UM2meyUsRBlLUSWoAO6/FO+S25HcJI2FEB78nffr96bed2dTx
         qm5XXZRSoITJbUWloBzDpEtt4jydotm88sewWvk+wboXBaLLAew4FcSlrwlmERIotU58
         75LWhXcyg0RfwAV48gR452RFClEIxbIfS7lgNdPfrljNzyckxsTr2z4B5LQxSU6FWiM2
         t5ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BA1xi2K/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si1610435vsl.117.2021.09.07.08.28.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 08:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BA1xi2K/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNd1d-0000tG-9m
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 11:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcy6-0006q8-OU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:25:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcy5-0000of-A5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:25:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id i28so3792522wrb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=auutU+21lrsq6UjdoWD7jlgdut/oF43UfVCOita+TV8=;
 b=BA1xi2K/cLitiVapH+70L7X0/RsDxV+Y00W3i6UuNkNZo2WUTR8AXYOzsXpKttdaEz
 d0XRz2yM9UPqBceA/CYQ7Y0HE/syyUlKUhhNaweQTQt0q4GeS1TND3krlutpCWJcwT+h
 X8U7FcWsyAYXPTlkAitu3o8MdwPQ+5l2myyZ9OuCdgbRlJiF+e6KbzFZwXpkq+7ztwHL
 tGG7/lWX5lH0rTsb1SV9q7InPKFxO2PeKrS5ewPTdCu8B9ZggAmxXXx2ztWOY1xNuyVV
 1JsvXZauBg5yMNqpwjYOd4/v6ZLfkUnDPs2Ei6qlBiYgWAIFv4OZELhy0IsUQ4yW6yJ6
 S98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auutU+21lrsq6UjdoWD7jlgdut/oF43UfVCOita+TV8=;
 b=WI5ZeDaOzcjsABEx0RRz7xhAwrohfyXSahbiVuXVlRb0N3YVWU+7C7FI94OV6qChMb
 XBPpkmH4IGAl2Q29rKQ6HksD2GTvm0otKdbq7dyETPi5Lvm5AcYnpmph8i9RPSLT3HJv
 FopwSOw81esG/9YctkBgAufbYBM74q1IUvbxFqM+YXN8fcxG6YnW+JLxNGF0yjOly2HR
 23HWfB6GPd4I0UHw58oWU7A/YwsoWiseObTFYxq8+UPnQfTTYxTxxaGCCe9LKjyTSSBk
 VPStwHE8Bcn1yz6tRDpLFGV/NAXkf9HHMW9pdR+W3eFGZIJNNMKdFzkTA4Q5O8SLe13f
 JLcQ==
X-Gm-Message-State: AOAM5333d8ZSpleZlnqBeENOszyubjpOIbsKl0kWCzWmE/tFCfOr94dt
 5kTLsiYr1d8IbbrbMERUE1C7tI1vtsSwFbSuVpuSKSVUYMc=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr19975922wre.302.1631028296599; 
 Tue, 07 Sep 2021 08:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210823174924.201669-1-tong.ho@xilinx.com>
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 16:24:07 +0100
Message-ID: <CAFEAcA_=xW+Nt7SKG61o-8BPs1GvfUzH5KGQ22ZnVozKBvPQxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6d7fj3rBxDj

On Mon, 23 Aug 2021 at 18:49, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This series implements the Xilinx eFUSE and BBRAM devices for
> the Versal and ZynqMP product families.
>
> Furthermore, both new devices are connected to the xlnx-versal-virt
> board and the xlnx-zcu102 board.
>
> See changes in docs/system/arm/xlnx-versal-virt.rst for detail.
>
> ---

Hi; I've reviewed the first few patches. Some of those comments
will apply also to the other device model patches that I haven't
looked at in detail, and the changing of the block backend handling
so the board creates those rather than the device will mean that
the later patches are also affected. So I'll let you work through
those review comments and review the rest in more detail when you
post a v3.

thanks
-- PMM

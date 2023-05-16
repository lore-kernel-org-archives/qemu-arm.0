Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp292123ejq;
        Tue, 16 May 2023 02:45:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6R3lM4UiK00lejGG7pTwybonbIcTuutc8vz0XAuEiQeyouCAuKBe4YNBb1RP8Pzug0LVjG
X-Received: by 2002:a05:6214:624:b0:621:463e:f337 with SMTP id a4-20020a056214062400b00621463ef337mr39845564qvx.9.1684230323584;
        Tue, 16 May 2023 02:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684230323; cv=none;
        d=google.com; s=arc-20160816;
        b=JckWNvNnmmEyg644FrpPLng9U7SFAjx4R3KHow9/AN94pGMkVLj7piPvFAmBebkh12
         1EEkDbPJm/xzfBMtd1e05OSeAx+gxgEQhpxKFgJEs0+f91MB/1n4FEmXuchqmTg38aFD
         RclI/7IVi31rGO7IhLPTWqxQWoWmN51ZrVtbI6I7FgW3bc67E1vGbPlnnFN94h9pSYdb
         U1yQ5HleLTUEx9htkYppfM+GVbioJTY/JdOw56GToHA4Bv096GxEyIa8sSwpoUwuUjbq
         vIo9leATUBIXDupIaCsov5rqBq3N7dXVhPhex0nvTI7b4TqpVdARF2/bGjEke9ciBYkG
         Nk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hmx4PggCrfjeFt5nyxNmjBzhhotwtfvn5mrGxguuJEs=;
        b=selvc1C96gCzAVOhgsGAFHehfqc8flhvQ3RskcvIBnqSNSoOHgRtqicmdDp9w7EqiM
         TW+Mum8VpVlSEwIwZey4d73+HX2GUD5Np27Q8UTlXwKDPgZ440ZxSMH8gx7Nnp/zd9wx
         vdml0aAlqSlwIQ/N+A/xVjbOt1whi7pn4ra7GJ04fKIjj6pmGx/ep/ym7cd10Tk2vP3/
         Y3oKO2N4K1HRKYWCpb2BztXyT+Gd3KEbMpRAHzkwiUY0b6TtIZxvh/Y9P6Eq4j0Mh8XU
         1dI3pNbxMmrOIK8SoEPaamKdhyDG9gTpBMDLkV3dayJs0zbe1xntBP6zrzWU00SnpSKN
         x9PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qxgPM6Ds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu11-20020ad45ccb000000b005f16be313f0si11289237qvb.311.2023.05.16.02.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 02:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qxgPM6Ds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyrF7-0003b5-PT; Tue, 16 May 2023 05:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrF4-0003X0-QS
 for qemu-devel@nongnu.org; Tue, 16 May 2023 05:45:16 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrF2-0007cd-Ah
 for qemu-devel@nongnu.org; Tue, 16 May 2023 05:45:14 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50db7ec8188so13172773a12.2
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684230309; x=1686822309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hmx4PggCrfjeFt5nyxNmjBzhhotwtfvn5mrGxguuJEs=;
 b=qxgPM6Dsz6ATEYePvi0ma7TeURPnpKMgVbwVOOjWmBpOcxwWRaHTd/3qHvQh8jVGv2
 YELlNo2BdpcgCxIr51EQhdAO7fepjZtLpAC5Z3ZDynuYZkzUfuXV/thDz6JABRu6YiRK
 qr4j8dwo1roEUa9j3TH8YZrowNURXdWMzj9m42nwWJJXWbgWCcrQ9BceOika1ZEFPlY8
 9LeTsZccKQkMwSXk3QXl1NiVQrGAkCmh8poNd+5+VVGXDm04BbEwN3tZKrUvQUDqYrAd
 BJnv7m+/uuWeOsM796Jsai7xoxURAVzsk2P3fYeH4YZJOGjpjDvRSM6cdbWFf3Oq9rXi
 q0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684230309; x=1686822309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hmx4PggCrfjeFt5nyxNmjBzhhotwtfvn5mrGxguuJEs=;
 b=Ooyr0bzc9I6gTXFb6mp5/+Vwsdj5nzW9/I6N1ST6pPYUTvRXkpXeOeWPMkeGpf1YRL
 vQkupxKUC/evFxmlrqlXjSoFAluDZNa4oVW6ENREGBWgx0ty2kQVzX2vNHMTgdamwtmY
 ZlKSIc2bpoPKda3yYGR2gxWG/doVMRSkt6PlLmnrgq6W0fXF9H/nbHF9cJtKV7Jb9CFF
 IkYxXmf+Jyv787UfFW76iqfvG+cbMdf7uWu6kvJMBx1H5asj+lzPftgWHVoyOQHpuvPm
 zDiyO27vHFasPbWdS4EbErUPy1ZVd6p5PE9K87LclZJWv0xxgSTv/CAxBHwMi34HFzxT
 OhCw==
X-Gm-Message-State: AC+VfDxz/UVEnxcdScOHHNmLUo2hr8OKh0VaCRtPNXLNsPEDIWG/gui1
 eIznraL8QcYNGuW98QEWbXNep42cFvGlpBHzUDPrUw==
X-Received: by 2002:a05:6402:74e:b0:508:3b1f:e6b5 with SMTP id
 p14-20020a056402074e00b005083b1fe6b5mr29645493edy.15.1684230309365; Tue, 16
 May 2023 02:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-32-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 10:44:58 +0100
Message-ID: <CAFEAcA81iOTmSHvdyxq9Hi_wdzCRmPWxsgm0V3=TwvFiCCMzkQ@mail.gmail.com>
Subject: Re: [PATCH v5 31/54] tcg/loongarch64: Check the host supports
 unaligned accesses
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yvjJnFLaQvkc

On Mon, 15 May 2023 at 15:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This should be true of all loongarch64 running Linux.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target.c.inc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1182618lfm;
        Thu, 25 Jun 2020 04:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzLWsNna1uVKC15Jw1AQT1Z1hguMS1YNQV2pJsOi3UBufqoTtsTJxdYOAgu4mKyVMLR3//
X-Received: by 2002:a5b:28f:: with SMTP id x15mr51283919ybl.335.1593083571764;
        Thu, 25 Jun 2020 04:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593083571; cv=none;
        d=google.com; s=arc-20160816;
        b=o3Kbz8XHIpyWphuvzcHgDBtC7qVKbcFCmVx8HsZD3c5/hdxoqt1lKZfbtrvejhpN7l
         0dOXSeLGoAG4lGVzcS1KnnUyyheRzWQzSsczrHzbZvULY5kDqBZBbIWhfuWsd/lHGO1G
         tkaJ918xTa0YABwOhSgIMF6UcVH6TZkF2pkkTkKK7z42M1H3b0dd1L3Plmt4HxItKsZi
         imIT8t7tXKairG/RoQzPB11d3D0HsDyGznPcLgq+URjUaUwHcqL2TFpl3EFnloA7vloX
         SQr3dsRca3uqjiOOS8JstKQqdcWCP6u8AD2d6uU/qDueKuEv0LVn2YgPXs+ftbw6fXFy
         QQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2mxHRW8MSjNqz5XJ/PBqKLrSV/78W5mMnJyFAPuyRLY=;
        b=yUCNNpRp6YGKAumqsN1qAifzbnGZeSkgxqRG2XTAc8OIkjqN/QEsIIU52zqgN4HpTI
         UrmTokTVSuLs9GQGqKn+vQ7fN2ni8bwn/oSGFVETi0bJsH0wt8pZMsuA6RMbBu2FI3i5
         1VG1yfbUiqQkv8sH6tHcpwJRKdytKExp92f8P08DVO6BIG4ZVk+xwzrfo/xrNYdAH8JS
         0J7Q8I7IYD4I7G2rU7IhT70ICtNK8jTVNCW9e2Cd0/H4Z+sk4Gh7l+IUu+DAeOSwTPWP
         ZDfZOzg9Nq5B/27i7jwx4XfDkd+/HRzlw2VHyrbzFbd/LQHIQ1+NfPAVr0beSYoCvwmu
         h0Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=buIVmduX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w78si22364169ybg.320.2020.06.25.04.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 04:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=buIVmduX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joPoJ-0000oq-4F
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 07:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPo9-0000nI-Ny
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 07:12:41 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPo7-00058d-Vg
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 07:12:41 -0400
Received: by mail-oi1-x243.google.com with SMTP id k4so4617942oik.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2mxHRW8MSjNqz5XJ/PBqKLrSV/78W5mMnJyFAPuyRLY=;
 b=buIVmduXOAsjLSZPB3h21JGeV1TO3bmB3XnB7OnOUkYmic4rAWgTrZJpH0CB9IsXQQ
 2StHmTe+OCsqvUrUFdYyDVTQRRhlG+OdPfK3juwgrdY5AIcRZpP6wQQrb26fJhYG5G9/
 k6t+mKLkE2prNRIAiRELbBMsy3GtKYGFom0gtaj+D91Uup6hOmha44IjiG7QOlwqKVO0
 azbRTYzjL84Tv92XC13q10FZ+1omdhGW4iPRGV3MdldxAXHsXykDo0wl0IrxJVs3YZVm
 YAwf9hbhuZvIPFvcmROfDBqPghDObMnNoxm/sTnxSObN+5zZ1md1WtiXR7C2tpCjE68g
 3bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2mxHRW8MSjNqz5XJ/PBqKLrSV/78W5mMnJyFAPuyRLY=;
 b=pDsddmyfUc+kmd1QN59FjeQT85St5Ih6dphWF1nEMPUSTr/dGGH0vBuquxQk+qfunf
 gyEci/Ir8bt2slfeHsMlkJ4w/r8CIaif+pcb8qf5MFXX1gP2QQ9vQ6R1IvK4CjsCphyR
 YQ8UUx+WxG3ikF9fOTRxcvRveEIWYm+0L/P10omvgJY7Q20bp1BDrJQem/viFwQKpElB
 apG3tSreOjfRgNHXseLe2AL076BlOqoN8DZnwDiOCrA30qehLgID1gr6MEw61yxOpKgU
 oaQzZcEY3T8eLH3/R0+bika0dgjcUV5EvGNNJjgPMs7dIS2GruMSmbo3bX3voKXSI/Ig
 gG9g==
X-Gm-Message-State: AOAM533aVm10fLOsOimjpf+6JmG4RborA8baCCLOd2AZUWbI4Pd+cf19
 E6yJCm3x+R5hDnD8bpKC2ZAv/nhUCmL9y9HKOFKNNQ==
X-Received: by 2002:a54:4694:: with SMTP id k20mr1652844oic.146.1593083558974; 
 Thu, 25 Jun 2020 04:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-32-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 12:12:27 +0100
Message-ID: <CAFEAcA8peNugU721+PO+kDEH52Dr6+oP_x=n3wYVzpEeGfur_w@mail.gmail.com>
Subject: Re: [PATCH v8 31/45] target/arm: Tidy trans_LD1R_zpri
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7SPmJh26ZASH

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the variable declarations to the top of the function,
> but do not create a new label before sve_access_check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v8: Split out from previous patch (pmm).
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

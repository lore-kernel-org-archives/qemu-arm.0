Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1528765lfk;
        Fri, 10 Dec 2021 08:48:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1tgPwfUxf7WkC/vQnowLf7VMvwGyJ1zbRuU6ntRs9Rj/0+BA+lxspQVDp0qTS2XqVUBTw
X-Received: by 2002:a05:620a:44c1:: with SMTP id y1mr21417876qkp.566.1639154898420;
        Fri, 10 Dec 2021 08:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639154898; cv=none;
        d=google.com; s=arc-20160816;
        b=lhY8Y7ilLXYQ0xDW4AsvktqepxNtbS4LCfAe/Ty+gtJ5zq+NS3RBpuFNWZe8jdbOx+
         PzA5B+d3w4c4leSulCW37iOsbdP/gfWgLjj/fVLD33HBZ7KCLJzMaHzIQp68zNTlNPEt
         pAvzsJti569gBFBld90GRq7Yrclv6MLpCkUU4cf3qbXmpfEA4RdrBO81vker4/f8rEVb
         PE86DYI6Nth73X6Chmgq4+qAVPfe068FyIRtajyQ6l2l2/wn+1SIduRVsFxbZ2xWiR7U
         3CGg1Hag+j3VV/cWg5GGlAmWYZ4ifeuhFOmZ0q2+yAnc6Cn3A+Z9ssBKnKA/TQ4Z2gxa
         6pMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46aSvpLgwbmRFQ7eYd1yyC5rdxtc/aKq+7Ah8gtQNZE=;
        b=n8HUJhwmrRWnHbyoWAsWIgYjPo7rCyA6XPc2fXZ9rZDHU28kxaAGAIDxlWGRRHHgd0
         /rvQH2l/CFHDstPBsosuQrcZ7nk4bqVorzaXyRDs8MojvTA0o1hv5wJDAlT9qrZGlB/j
         /159Qptwhf7UTq1evAl1vnufaBFItNV/npjthYJoVCk87bwLaVdtJhI86FhgkSXmicwg
         mDw0J4U9TMLCYkieQuOY3NQGhiCv2697DixWUwr82RJ8+YsUNLtAt0eNxjzHxN/aHX0V
         lxFK1D0N4nuUAqOh4iC00+pdvT+AYxjb40CmvAsqlT0j4nn+/jxTzQtZG2EBVoCQs0YT
         FF6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KgW2fA4d;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si3675007vsg.75.2021.12.10.08.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 08:48:18 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KgW2fA4d;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvj4D-0000W7-Qn
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 11:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvj43-0000TL-8N
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 11:48:07 -0500
Received: from [2a00:1450:4864:20::431] (port=33495
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvj3u-00038C-GO
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 11:48:06 -0500
Received: by mail-wr1-x431.google.com with SMTP id d24so16048523wra.0
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46aSvpLgwbmRFQ7eYd1yyC5rdxtc/aKq+7Ah8gtQNZE=;
 b=KgW2fA4dq2vRYn7MkVR9N1WtAf64Fyn/xN3ZQTkcTISkiIxuazDcmk5o+YVmqgHh1l
 xrHt7O9cKbMc69W1s2KbzqPV1os0vwILoLXlLVN4LepObUAbP6ky0sfJ0r4QtLRu7itN
 83Fhs5k+xKJdbaFv46r29Wy0UjJLJhsW+CJaP5np3QPK/62OgtJju1qjX2jNKscaLk3Y
 Xp5p9B1qLpKCxoj/TjfQx8OomzEq7Bf6/Jwr6gMRhMekFF0FpFak/tmZ/9LGS/PEtRkt
 qiZRmicIGA5VMYErZ6vJs19hXc4T/txIhBWn7kZG51LHjt3EvsAZWRc4v1vTdqUXXIKS
 TN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46aSvpLgwbmRFQ7eYd1yyC5rdxtc/aKq+7Ah8gtQNZE=;
 b=xu2Y/WzeaqjeHVRveTwmct5LYYZVG66QnMXZTbmtNjTKo/hwTqpdfSazi8o7N1CFkV
 IExIn8kyfn2bNglx6l99GyXJ4YfU3uuugXGSFD/BBQXNKqVKYg6hCVEQDVLtAvjJppC5
 RZdalMGKJb4k7LdxXGOnEfXKZ9oZUPSSiC2N8RGSzHk4l7QKRUsqZfOdLLHucR9xYR8Y
 h19ALSBM97kBslO/xqW3EQG4jdEtBxLWdMwRnvUULxZMovokcjk731Y2XkXjX3WKSoS9
 3x+gr46NXvgJosc4jFlGQqj3MiSWyXldH5ibXyb0QzuQSZZRwhrvRpYj8A3ivd8+d4RH
 Bqlw==
X-Gm-Message-State: AOAM5326nsoBYWEnLOf4QpV51EK56UBNwQib9FpQXmQbrUhqpq6/q+FW
 qoGzV6vtJq0ijRPxtm3Ce3lSFllQolas86Lm3L/X7Q==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr15618519wru.172.1639154874665; 
 Fri, 10 Dec 2021 08:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20211203221002.1719306-1-venture@google.com>
In-Reply-To: <20211203221002.1719306-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 16:47:43 +0000
Message-ID: <CAFEAcA-n+XSNM1h-VTAGxNiQwMtUr-S4N9x-yWifJr-pPTRYZw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc fix missing queue_flush
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: hskinnemoen@google.com, qemu-arm@nongnu.org, f4bug@amsat.org,
 kfting@nuvoton.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /vgHDmXep0Yf

On Fri, 3 Dec 2021 at 22:10, Patrick Venture <venture@google.com> wrote:
>
> The rx_active boolean change to true should always trigger a try_read
> call that flushes the queue.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: introduced helper method to encapsulate rx activation and queue flush.
> ---
>  hw/net/npcm7xx_emc.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>

Applied to target-arm.next for 7.0, thanks.

-- PMM

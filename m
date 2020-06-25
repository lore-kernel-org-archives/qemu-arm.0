Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1274228lfm;
        Thu, 25 Jun 2020 06:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCgbyWugc+/ofThjcpXXK52bCXc/w6aJ0OWch/AWlzBLGRzXjHnhZqLkGcs/uCmH7H/rIP
X-Received: by 2002:a25:7ac5:: with SMTP id v188mr53922297ybc.237.1593090439952;
        Thu, 25 Jun 2020 06:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593090439; cv=none;
        d=google.com; s=arc-20160816;
        b=JpLZMCXAvwvSY5a4pxBCakaBSjXYPPHDpOJLKkwfgceRfrIpQM01AB3li7aWj6FsT3
         QXCESTtpFDBNvYBoy6oQS7WeV9bLj9hMUxLK1C2vhW14ClftUPkm1zPV7i28gU6J1c1t
         /W1I8JYr1I/FGHp9fSHPO7VhGk2mVq7Cz42sf+7euGc2BhMnjGZ6fAIMfOzmA6kBDqSK
         indtwTd2aKDfaTGaYGtest7gTtAR27sMCU6EABarMe7bW56g68ob3E7RcgLKIqGKdmvm
         DV8v4S1Sv33djYUgyzwbsiBb1SZaoYQcToiXKzWwaINO6aRWFVY7ecIVw7c6HyiVlInI
         /P/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrWXjVl/PZyY4oGQHClj812uTU/ZYTzk0wUcgSc8Ht8=;
        b=KXTw6nfyK5nwjtSXwg5zeT6lHXtKL9aRgwf0OrKCE/jfMLW22lf3l/kt90iplG029G
         BwHg32+4dOxA0FqwxD+gOYQvog4O5e3bspzllQXrOyj9azn8FJmgfDfp9rljIwufjXvf
         8FnvuQIBN7gzE1u6iPu7lb2Ezd0KyCGuaMjqXHPe0OdRjQpKwXvmwNyD5MtwpEqNN2GF
         B2und2Fyj47omVYTQkqQuwcENCy9Bx+NNKy/D4JoVJ8rsEy/LWrcHw8SuTyeFK6cKZnR
         74Za/C+o4R19FhjktCHc8O4t6g+QK/l2XIcSDZCi38t/geCo+7I2OFINp56+H7Mnjy52
         SWQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zElPG+VR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 196si21685446ybd.439.2020.06.25.06.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zElPG+VR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRb5-00046W-9z
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRR2-00046b-2u
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:56:56 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRQz-0003Qn-Js
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:56:55 -0400
Received: by mail-ot1-x344.google.com with SMTP id n24so2875776otr.13
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrWXjVl/PZyY4oGQHClj812uTU/ZYTzk0wUcgSc8Ht8=;
 b=zElPG+VRjjY9hucyR7GHlcSDv5Chp9WiJhn//8BI4jvNuGOwzHaSAGeBhY6olK9ikP
 43Ir7RwMn00lcvox4Qpxt52fmm/Cxms1X6crNrKqqSEIohckIid3W6T2vSAXc5eHGnUa
 xShRh/3nyMv+wwl7Bpu1Sh945JmvPUfmbs/5zpdr61crU++H2E0xyY8NN6uErAIchDFv
 TX3ci+/L2Q8PA8/cOTl1ijDxA+GD1URUpJIAwG+fHfmsQrOrRdjdvukQr7+ABmPAuXkm
 g5pHR6JI9VlbIs/WgOpegW6TiQygQbvPYv6oL7SyEZf/qBwFhCUoOpDFxFZCIMZg/uQ6
 9r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrWXjVl/PZyY4oGQHClj812uTU/ZYTzk0wUcgSc8Ht8=;
 b=N6xIozZKEpsSqTkohWh2O4oi+REjyzMvLHoVsVQ0Pmd55NUyJS36xmNVji4pslugCf
 +ee10Ak1qI31m+MTSj14RvxZxd4aJ+UcWyfGaMBwT+CnPjvjdUioz7biA1fe0p/cL5CN
 dV7N79D20XNkVmwtntodo+Kn3axQap7Y0ZevaPr/8uIy1L55USBzWFrLMH/7/nzq2ymX
 MBBIj/EMoiD+6EytlPLkZKl0J1wntBAzx3LdQey2LtKenyKv57ku+TS5XDxJziHIQp9w
 ihr4khQZ9A+6HfRMP8EH3n8ONbl2oCZXF2Lg6jOg4FtDvTLrN2WnE9aEgUxxNeH1PkK+
 5DZQ==
X-Gm-Message-State: AOAM532XKjuyxYKBBzOrTofLNUu48bEi1hmRubW4zK16k4e7Gp1geUQy
 GWJ03FQY2kOC6vTvgKZek0a8bHxAtBthZkbbptPcqg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr25382789otn.221.1593089810954; 
 Thu, 25 Jun 2020 05:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-42-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:56:40 +0100
Message-ID: <CAFEAcA9FH4MbkGuvDqu6qMjUTLcgF4TdB1=X9BqksrLcbfjkpQ@mail.gmail.com>
Subject: Re: [PATCH v8 41/45] target/arm: Always pass cacheattr to
 get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
X-TUID: ReRAM8J/JRYN

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need to check the memattr of a page in order to determine
> whether it is Tagged for MTE.  Between Stage1 and Stage2,
> this becomes simpler if we always collect this data, instead
> of occasionally being presented with NULL.
>
> Use the nonnull attribute to allow the compiler to check that
> all pointer arguments are non-null.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

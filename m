Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3069159lfo;
        Tue, 15 Mar 2022 11:16:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuqJii/4Ga9NPzkgtSZRfF1vLThbvwt7Jk5fbjzP4w+IvT3qgizZyVX8jKeTq+k2NAaZXk
X-Received: by 2002:a05:6638:108:b0:319:99c7:5a69 with SMTP id x8-20020a056638010800b0031999c75a69mr24312239jao.297.1647368173292;
        Tue, 15 Mar 2022 11:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647368173; cv=none;
        d=google.com; s=arc-20160816;
        b=QLm77ivPdWulj1nuipyWmLGhy9Lwol4mrVsp0ULUf6VpY4IQx3OduDYbUtOKMnsDy8
         YeujHYetWruQAhnCuTVUTWT1qgc/d9EKGKdcjbXrnlpIJLmm+drD8Uwq/Md3U2GSe2qt
         96ZIFD63QMFq5JVO2dAuqrtbzXAaGnJltp1MTOHK2nuwQBnU0pC+dA+b3xWGDa4JvO8b
         4RvOMAHEJVsHr86XhhaqWmAXB6MXjOuxU7ag6Uju0NbjRUHbH8+atqcdf1wpK5C9IvXD
         GF7xpcAj1n/7XjPZoMCEHefY458TQp4jDYYKZ4QAjY4SOyeBqvnTG/X+QxX5P/ktbd3s
         nVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYrrnYCqdg9IKcw07D572OU+DjPuQoglS2UHEjaMEJM=;
        b=Vt9mDf49voPrKaDt6pOoMabaoXSINx1S9/5n+3ofkXyzOg2DrKkaWyGtNgs7KCyC+M
         PKmPGgo84ULj8CUNVRf0WZcSlYDFFOK44nAr9FZ1V45HFIKHO6qM4wPSZvWV25u/rP8D
         YATUlrgk5cRt5/w7pg/c/jurAuLvGDjCOHH5ErAsUsv4T1wuk6l4D3k+Q+uQCmiiLAww
         /g6N9bvZtiZWWf6fY7+OGmkHGod922rao0bb+bY8SabUfmM9HaRg4JacUHZEJesFKYai
         c9hBiQKpNoB3oFT3woFzzdBa6J1UJ6DzklCYhZZJQm2SJxQIzuDShFjSBXmb5s/xyza3
         97ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FlCAdX4y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a056e020b4600b002c7c7c22c33si204508ilu.107.2022.03.15.11.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 11:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FlCAdX4y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUBiO-0002PT-JN
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 14:16:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBeL-00008T-RL
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:12:04 -0400
Received: from [2607:f8b0:4864:20::b35] (port=36719
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBeI-0000yU-V2
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:12:00 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f38so138715ybi.3
 for <qemu-arm@nongnu.org>; Tue, 15 Mar 2022 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cYrrnYCqdg9IKcw07D572OU+DjPuQoglS2UHEjaMEJM=;
 b=FlCAdX4yu8Ca9Ai3sRaDEKl89XQf8PlHUUZBsWdG41T9Jcs+K6++IYbFMqHX5CTzry
 BXy3Wq2rJNb3WUCLLG/dQybECj5p50ISRCwS3tWEJZnWXx9To/u5Fqw6MqT/3dL0yhoJ
 ocGh96/4VpKZosR5WB7iUYNwA2j+8tdGeK3h4E8P9T39ywVDrFd0nXatCALWTja6nSzr
 Wu/sJAaOn1sE0Y0FVsu6ajextzTf0Pl+fQehe4dY3Nu3jIJg79icLQ9JRt1jNAEycbY4
 IOo5toh4tsVf+mw8dAy5PxlEwZcMlkm68104BA3CbFGShvXRwnx5jR7bu6IPfmsq4kbt
 4cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYrrnYCqdg9IKcw07D572OU+DjPuQoglS2UHEjaMEJM=;
 b=AWM8GSdqdiqBzWNK/GIWdD/mhousTURGsWi7qWl+JuoxXSD9uSoNdLn9+woWf+nu5K
 kVMP/TlIka5hyGqvESr1rXPYPmnN74hfOv4ArDTKILOlY4zPABZVBOnrai/pkK/BRkzy
 vjbTTXfU5EHlTCoR1StvZ0pJ3Yf2S+x9SNv5FW+qlV61UnEAP+/MQP5rXeWF+9SEx5b5
 8nLWccP3grA6l2QiWlxg5doBQkJourh9L8rISGU7roRQ21Tp+lfTneSLcU7lzs5HJrlx
 jbof7hkgcYgtFL5/b03IHZaeqoq9ecq1Qd7j2O5P5fyQ93LD/Bb2i3l4CQaNAJwl3utH
 xzsQ==
X-Gm-Message-State: AOAM531g2IciQ0qpmm5v/3fWT1P+2qyToPb83EETqG5jiuW5IdZMeFmC
 4SUy0RMIQXPujnxQ87EI27QkTWEe4hHcDs2sQJzn7Wm4fbZZEA==
X-Received: by 2002:a25:b11c:0:b0:62c:16d9:c028 with SMTP id
 g28-20020a25b11c000000b0062c16d9c028mr24858139ybj.288.1647367917112; Tue, 15
 Mar 2022 11:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-2-richard.henderson@linaro.org>
In-Reply-To: <20220314044305.138794-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:11:45 +0000
Message-ID: <CAFEAcA8iATdOk783sMM16_p-kQQmu+T73trWnuCJiv+2hqmK_g@mail.gmail.com>
Subject: Re: [PATCH 1/3] linux-user/arm: Implement __kernel_memory_barrier
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qpqWiJk7HrNE

On Mon, 14 Mar 2022 at 04:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fallback syscall was stubbed out.
> It would only matter for emulating pre-armv6.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

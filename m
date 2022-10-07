Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp325403ocg;
        Fri, 7 Oct 2022 02:40:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77wanzZFQ05ynIsSsguXxaoP9LbyPWckozAQ2GCzaNhMugnrYaccWq6DyuKRDvW1hMxt0I
X-Received: by 2002:a05:622a:341:b0:35d:44fc:3908 with SMTP id r1-20020a05622a034100b0035d44fc3908mr3414168qtw.507.1665135655948;
        Fri, 07 Oct 2022 02:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665135655; cv=none;
        d=google.com; s=arc-20160816;
        b=b/Yq7S+EtQbWfjZJ4Sr2yX3gE4dCPUISYJKyGbh8PHeXKav345le1h1/Kql7lGJ0QU
         xWZF3sMw7RkYOYWwYlHPSarwFoB8Q0NbrxWnJUws2uWBWP+G/+e/3+hkNeigOQtHpaFn
         D7gHDIFjsdTMxh4TwJX9uKivdImGt58k49rC8+C4kqXODz3YewzcwPlghmqeWcRLhUzk
         IYlYIgIinM26L4HJAiQEf1nGs3vhGZM9+sR+ksoYiFMnHQXAabdZhVDsDKUHNHYxC+d3
         SG8ERc3BR/d80fWYW+cJhqZXz8jux6MAGMkYAJvIDNI/kmjxMTIB/MP1bavQPpnNPNmH
         4x4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/2t1nU8OsYeNfHsZn398luF5EshR8ZGqpWaAdBvWkhY=;
        b=yDfrsLs3kMbymjCdAxEe5bcjJ4xIzTi7uxj1TOgrnpZObG007cdfnFD1rbKVlRHnGC
         I/T/gHLGcKqWWTD6qyvmaTa3jZSIKZwPe9A/T1t51RMNKzQLb12TwzWAW6H7H7LLNVZM
         zSNTtsKAfXN0Pf++qf18S7B/EZcjZ/YavnNFA0TmWpspdCAwY0OfC5MWyrKdkOa/MTUX
         uG2IDO4BpO3iPXGQw0VlAgn0/1EV2IixbKnZZpFXJ1EMBWrn95gosm9YzoK6Uw4J2qq6
         PbaWNLDeq+SLzbkQNs10EpehHSiYUKPCZw//MSt0idr1qgzvbdwvqzlypxRZpwJ25SpX
         XGBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYisFl5F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt11-20020a05620a478b00b006e3879023d5si677766qkb.549.2022.10.07.02.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 02:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYisFl5F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogjqg-0008Gw-Vi
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 05:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjjd-0004mP-2c
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:33:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjja-0000Uv-UY
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:33:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id l1so4025613pld.13
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 02:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/2t1nU8OsYeNfHsZn398luF5EshR8ZGqpWaAdBvWkhY=;
 b=iYisFl5FW7WuZJpTaMCIM9rlafMrpuS+hIhGZ0+TJc9lYp2hklSGuCVlnqizczFZy1
 PWcLVF5wGr9eb/aNqQ7VOr2NdJO0ZdwN/d2hrn04nryf4qxaGSO0o2c3MKekwxrkF+Cr
 OVl2aa3doh3ZEaCLynenTsHm2kUnAKHZUr/FG5TXOyDK982K2/Ku3+5Ny/HMmdbAZdVc
 YGmc9HU/ATlIB2/dnAgbRl1IJVYhE+HWqKh4RWW5VImxPc4lnL1TxxDHtK5tAJg/yvKO
 SuTdbPrraylSaiZnyITWz8AY+2ojB+Ghh702ByFiEY0DY9Y59aTU3d1ZMeTMTkFYIq39
 ULdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/2t1nU8OsYeNfHsZn398luF5EshR8ZGqpWaAdBvWkhY=;
 b=TFbI2NHNBXAutiNSBaR7dzY6dOp8JRBc/uG2G99shcJe2oTZfHeRrQtk1QfKiDdZ62
 3dkP6fSG2XMzq7jrcASEMKXFJH7m9hQ/gSUNUt2tTu8h10/EhfltEetcvpowlzfGnox5
 C9fxVIDPSsBqVe/nlM+LztOBShZTpKJ73MRbQatMASKLdCvuocugY/3iYbdmQ8DZqCGb
 Ryi605RhBUxeDj23cG7+ah9QxHjNWSANqUQFad3mLD3sdk/5/e+xwowwi2rd3BqCSAXj
 Ndab3HEVE/dHOQ8bDX82PgnGuU3N1EHWu3HB/kn8vIZ8cXI0sAeEsfSs+doS/7dsGf+c
 ttUw==
X-Gm-Message-State: ACrzQf2/DDcOWyRExvkH7gvZZhG154PNVbsFOo0ADOYZAvh8YDS+UtA2
 Y6jkqpzj3+Pxg5Xj1iuE9zz2MlMsu/Ko+0E+jgt9Ug==
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr1177405pjb.215.1665135212236; Fri, 07
 Oct 2022 02:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-36-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:33:20 +0100
Message-ID: <CAFEAcA8hBdQFVSriFXmKCsd6W6E2i4XkPN1hvtd9Kgr7VaFjoA@mail.gmail.com>
Subject: Re: [PATCH v3 35/42] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uvlf86kKLSv/

On Sat, 1 Oct 2022 at 18:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Separate S1 translation from the actual lookup.
> Will enable lpae hardware updates.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

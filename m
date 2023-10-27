Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp132795ejc;
        Fri, 27 Oct 2023 04:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRtG6ii4DHFlXW/3x1gypHbfZgA4yZ6U06A2Lz34klKJ8SrC2sePfBxVkJvMl2bbDqNwAQ
X-Received: by 2002:a25:41d0:0:b0:da0:f622:8466 with SMTP id o199-20020a2541d0000000b00da0f6228466mr4019486yba.22.1698407548546;
        Fri, 27 Oct 2023 04:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698407548; cv=none;
        d=google.com; s=arc-20160816;
        b=HOArCbFKM9dX4pVjYpuI8ULEqREAyv2VM4e+8F9DGvNdYfFfckxBVMzBDWsEgMbdca
         F2U6KhO1ftB6Eo+antq9AymADM2sES6x4Is9F/0xeznUxrrRYPxM6oZ1FHCxe0CQRBMp
         1rY/dXfbJnCKSL77D2ufPNNW2Xeuecf5/voIVxgqiih0WvOrk6Tq1lnLzdDs0y60AtIM
         nsZZwuU6yFGvCyBNPn6AfcrkyOcyaLmvr1j2hlULL0xjIj1IuVIlCIVN8W5AabsIf/d8
         rm64+VxlYeLqi2WqAh5hY5BIyqhqrVMyJ3dIjmaA5cOFGZQi6LLto70YawxXwXrtirAA
         OTuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w+3GRQtb8Hf82961Yqmm3e+F7zpDwsEetV2eHkCzzp4=;
        fh=8ZvqHR4zlDjBTNficCG8AmY6zPuCjMlCgUWPFQllnqw=;
        b=s136YImYSUeJ9VwThL7XAnOADtYWiWLWxEsH97Nf8uooVQEJiyS98wiFHba7TBDthy
         OZ0/r/DpO8sKyxgYFpzUd+iNgNrFZkAUPPjsqf6H8eGNSXuS7o31MDCba8Q9gikfv5gO
         dN/vaM8g1FFbMuoj0TSUZquAPfjf3g0xcuLxOxEp5rwrdSMlte6vkY1wsnVjPZXDahxr
         d7PUjkw+fHC/sZT2iyKlap39FFZKFQby8uLasqCyMF4A5N4xHQ56teH/tZzhNe6z0BNo
         T5Veobf9IVqcs3F6RkuYBGwnhrw0vK5MgYBW7YXi/pnV5vsZWajJt3ovhHRI8eDh6JDt
         xfcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ul77dz+/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d140-20020a25e692000000b00da035a8702fsi2170626ybh.316.2023.10.27.04.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 04:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ul77dz+/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwLNt-0003dU-Kc; Fri, 27 Oct 2023 07:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLNo-0003bW-TC
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 07:52:08 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLNk-0007xc-K2
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 07:52:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso3061342a12.3
 for <qemu-devel@nongnu.org>; Fri, 27 Oct 2023 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698407522; x=1699012322; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w+3GRQtb8Hf82961Yqmm3e+F7zpDwsEetV2eHkCzzp4=;
 b=ul77dz+/S7JsWarUj9drm8kPPWKwENSpUB+I4W22wC4f4jj7OlsYmuLtvKVZaz4Qg/
 W9n2/zA88kgVMk+09rCUFbfV/PtZKdzhIRbX/1uBo+YQj2D/hikfJvQkMRpcfTE3uT4C
 5m6zqvym18zHvsNUobUgBNxgYNflJU86rZQN7MBfhFXSgXPBnNSB2NLZ9huB2J5Ycjzd
 JrGiql6EkalijRcfbDk7Cr4m+/9AqekKXMRn1/EhcnaC1TC5A23iNwAqUvzeXdK8XfSt
 vCjs617Fm7RL0je9NPVRDHNPLU0urAF3c1petPKZGgvgr0GzINWeHxd9k4bMSuSEREXt
 MPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698407522; x=1699012322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+3GRQtb8Hf82961Yqmm3e+F7zpDwsEetV2eHkCzzp4=;
 b=wBA+IUycIvddQ5cho+P4+SyXKP9ajQ+ceuYQZFcK5gDj6vVlfVy169feOo3RtGneDw
 lD3D8WWkvQHzH3EFUZ1Eexr8mx2UwlCWe6ERA7o+MKBmciykFLknSFecPBSQWTv3Prde
 Qke2aWCv6GutD/HlayGC+tIGBWDS1zSUGR1QxpkfNHfdze0nakd5rDqfY76YHoWMwpWO
 xOgHXkR6iP1LbSQ3166SpLLuMIIQCM87mz5s1JNMEsd3oDXqLYgWih+uSOm5P6bhfQlt
 +IlPiFVia9kUGGc8sLz8wtvUgUvQw4sgRbtmhOwE2D12Zw/Q444qNtbb7YudOviPqUFk
 hSHg==
X-Gm-Message-State: AOJu0Yzc5yke6j+MWfQan2b60/0xaqZco+05NPAURKHtWu9tp8EMhrWZ
 f25aII9gkEgq+LLf95Yy5CwgyujQi3EKyQpr/UGKNQ==
X-Received: by 2002:a50:d794:0:b0:540:97b5:3719 with SMTP id
 w20-20020a50d794000000b0054097b53719mr1998180edi.25.1698407521892; Fri, 27
 Oct 2023 04:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231024191945.4135036-1-milesg@linux.vnet.ibm.com>
In-Reply-To: <20231024191945.4135036-1-milesg@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 12:51:51 +0100
Message-ID: <CAFEAcA8N7nUmoQHkhSFdVG+3amkW6N=jsVq8BqkfQAzygY_4yQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] misc/led: LED state is set opposite of what is
 expected
To: Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org, 
 andrew@codeconstruct.com.au, joel@jms.id.au, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: M89JIRONfvQM

On Tue, 24 Oct 2023 at 20:20, Glenn Miles <milesg@linux.vnet.ibm.com> wrote:
>
> Testing of the LED state showed that when the LED polarity was
> set to GPIO_POLARITY_ACTIVE_LOW and a low logic value was set on
> the input GPIO of the LED, the LED was being turn off when it was
> expected to be turned on.
>
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

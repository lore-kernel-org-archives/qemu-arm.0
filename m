Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1164216njb;
        Fri, 28 Feb 2025 11:22:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxzJ7iyy8f38WpUAiTCRFLDIaA03SEDex4dGWQZKnT1eI0YLgy7B0lKB/NmtX/780zVhGVTZSQMNNyfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHcNysUWAWg2y4ajmbcSdiZwpMNfn3JY3Wh/PGCcrj1B6rs4/nPJZ+3hiZzajXo+2Rb0F5S
X-Received: by 2002:a05:622a:1a03:b0:471:f141:c53 with SMTP id d75a77b69052e-474bc0558b1mr64297011cf.5.1740770563358;
        Fri, 28 Feb 2025 11:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740770563; cv=none;
        d=google.com; s=arc-20240605;
        b=g2DRtXYFHlC1b9UoctkcmOtgSA1tGJ1Lpd7jNbDHhxOswR3a2FTf1ZyGlix2viUwnd
         jc0VugJT3r4ihzeHLxk9pgeid9SFREVwVB3jBEWPAQmLgEZEp5as42Iab8hrJREaOOYB
         gq0vZE0JikkX5GGOQ64R6SoK1sXTF/dG5loDWbAVo2CFrYkDL4HejL2D1PUDprqUUMZp
         vtRJN97LlA41I+A6BvLuQSplc+xorw4X+vAA2TYPPjCLkZwXmeutqwjIVTL3icUWHQPU
         7gthEHfNL3n6gu3UTeYRqF8+g5cqonZyg/4WA+q+UT+lC8JrCcCudgzgwSq8+NkBmvmh
         tYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CGo1UVYt0ObEV9vcbF/d+aMoY5qsaz8RtqPlWaCXiWA=;
        fh=2c0Jts9+mWI1SPFDVDbusippLseW49OJShug5Bg7WIQ=;
        b=Gx26SyXN5wLsVYKAJ3tvR1G+eqHAD8eBirhkJiioRFEGFB/NrH/9AazFLnvFHaccQX
         PlQKu5EzRu0VgsITpFmnR7cU7ao96DD16qQJS22GE8uWwQqJj6WUlD8FJuo8e0QcuYDK
         4CPUgQb7vQfeu2hjEha/vGpm9n1rn23ed7ROs6UEOKbatX5ytCtQJ9CSyqNYSc/NIJBj
         13bdYa6Z/eT7k32198ANZZRBzSmCOZsOlDUSJu1BrAHZbxteYHxoeWQ+4LZsnI5sM3VU
         Jxp0U5Ia7gjFbynUkOeFluzR1AALtdq/p/++XnK0mjzYx6ARbrn/LrxbgmAridu8bFME
         ycpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9XbiCWR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747357d544si36368471cf.645.2025.02.28.11.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 11:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9XbiCWR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1to5wG-0000YM-Gd; Fri, 28 Feb 2025 14:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to5wF-0000UB-4t
 for qemu-devel@nongnu.org; Fri, 28 Feb 2025 14:22:23 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to5wD-00041v-5M
 for qemu-devel@nongnu.org; Fri, 28 Feb 2025 14:22:22 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e60c4e83cd3so211384276.0
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2025 11:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740770539; x=1741375339; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CGo1UVYt0ObEV9vcbF/d+aMoY5qsaz8RtqPlWaCXiWA=;
 b=b9XbiCWRrmDHKolCxsy4A6RjOFs5Uu1CowY1yHD+eNsMFYX17Pzc3XplTdMK58Q0MY
 lOPmFdTPC5xQuX6kWMtYelm1rgH6fHpWo68jBBH7PEjKJq93LYxlKzBUjznhHXZK2oMg
 pU0WXVlytHaJs3donv3K4oZOMOog11XIdPm8lL405pYZECAgo/vSDLNz9aoIy8+feDph
 3GdzF44PznPeRbLK4m61qIhx3D0xtOyZE9IocmVHnL001okkWMYilTrM2qDQkfwM126t
 HPzSXhcBOsH0uiO/pWlKhv8cCUOYb8G64HTBT1GZNDdKvMbblxrQBFTyf3Xm9u64W0xM
 /tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740770539; x=1741375339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CGo1UVYt0ObEV9vcbF/d+aMoY5qsaz8RtqPlWaCXiWA=;
 b=vIHS6SaL4V3ICCeh/pnmioVoeG/dp0DKGbubTZRTh++J9c7dxExqUGQZmb/PmMZQOU
 78yeUNAwdk4vsRo1NQvo9WqU58k/eXeyEe9l7wy1OIUjQ4c+ctAPK+9kJXMPlVHpr9hf
 EInGXcXibVBhOkQIAn4bRTFLTGtE6tlE76RgNFzWE94eYaGsllfvH8prCiiDStaC0fPA
 vGGU+OjQU05Ub9LzdorTTLiA6jvfxsSLJ2pKqYkOPvHuaRjRvGUwnZNYkMDGgwb1fccX
 Q+xo7zQESFQn1Gaj5dnukkeubKT5soeVLJuyCH59mpwxXBoWYDNiN3QKPd8mr2aQ1s5N
 Bvsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU66OHdollPL7RI9yog5fbn9sp6HxXQIJ19KgmrxemdfzBjToIw3pmtla4PAci/tth4q5/bp+n9vYok@nongnu.org
X-Gm-Message-State: AOJu0YzAvI28+WwIZKS2g0dlEAI3BshTKePbb/CSUfTuu3cHV1W6YcE2
 QRpI7vuhHwWNRQixWDcwFzsHZPR25m9K6293w/dGZUTXTlLZ32SoosHUMZL8g6HvapL5QLAvO32
 quymiBS4mVhF5Tp/gODg286QNqCiKosvqq7EwRA==
X-Gm-Gg: ASbGncvsRIKWXpx81imRSWkdo7iUGoFyQ9BNDR8NsLso4c7h9Gt0winQY5ym/d0QeiP
 N2F5gZOQIKD0nPmHpC6oBOap0ztvJ0TMKI5+aSSppxdOA9hXWdbFrA8l5AUUd9qF5fmk97K4/gL
 we6/UYooMK
X-Received: by 2002:a05:6902:1502:b0:e57:4db7:6d51 with SMTP id
 3f1490d57ef6-e60b2f04369mr5333020276.32.1740770539618; Fri, 28 Feb 2025
 11:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
In-Reply-To: <20250228174802.1945417-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2025 19:22:07 +0000
X-Gm-Features: AQ5f1Jo8sJTi94Zbulz0ZSHaEDQ0Jd4nUWmOUKFHAh4khB4q_CiFyy-Y8oTkW3U
Message-ID: <CAFEAcA9RPnZdf5zqFwu255-LdJ5inFbjtCA8SJ4o89aiUuabpA@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/net/smc91c111: Fix potential array overflows
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: GSCx78/eSWcI

On Fri, 28 Feb 2025 at 17:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes some potential array overflows in the
> smc91c111 ethernet device model, including the one found in
> https://gitlab.com/qemu-project/qemu/-/issues/2742
>
> There are two classes of bugs:
>  * we accept packet numbers from the guest, but we were not
>    validating that they were in range before using them as an
>    index into the data[][] array
>  * we didn't sanitize the length field read from the data
>    frame on tx before using it as an index to find the
>    control byte at the end of the frame, so we could read off
>    the end of the buffer
>
> This patchset fixes both of these. The datasheet is sadly
> silent on the h/w behaviour for these errors, so I opted to
> LOG_GUEST_ERROR and silently ignore the invalid operations.
>
> Patch 3 tidies up the existing code to use a constant defined
> in patch 2; I put it last so we can cc the first two patches
> to stable without having to also backport that patch.

See also the other smc91c111 fuzzer fix patch:
https://patchew.org/QEMU/20250228191652.1957208-1-peter.maydell@linaro.org/

(if I need to do a v2 of this series I'll put that one in too)

-- PMM

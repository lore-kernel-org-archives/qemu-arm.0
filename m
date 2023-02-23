Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp860562ejc;
        Thu, 23 Feb 2023 08:04:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+cwbFc7DhZOI9MZwKo3HJgT28VG+Cw0/+rTw4sQMG0JvvcdWjiq/WpfjCa6/diHcg+kJGG
X-Received: by 2002:a05:600c:3196:b0:3e1:f8af:8772 with SMTP id s22-20020a05600c319600b003e1f8af8772mr9385587wmp.9.1677168255814;
        Thu, 23 Feb 2023 08:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677168255; cv=none;
        d=google.com; s=arc-20160816;
        b=sD7YM52dUCApg/luQ2gNWhtDsOewvGmzIIKU7mZkOFRU1yX1VWIRjRlP6q0Pc+iFak
         nyYxkt673Hy0FbjgV7axxO+GK8tMm96L983ie2lCMLJZZcxhl5ZOS/dZRRWvX7XWELri
         oY1Ito1e+v1SX0HAc4WoUDk40FvuLi6eY23xirtZk1FDB/dU9cjU1lt76XjFgbvchkZw
         O5efH8/O8yYMVzvHEwvdUSYEDi3ETtPMAMZH1geIleu+g2ppzU/Lcv7/eB7tBHwXecU6
         lUAyBPfQxATcP/9yeHTphFYEnicjC5mjt9+yxGt/w+DTvKEgo9hGmUdHQQeGd7YKUhOz
         lnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=F97OQmeAYAFPWNscrkYAXbz94Fzjqt9Nd+VnNFVX4X0=;
        b=Wt5ByzsbV6iJoRGdYbHxXsddkUTNOmgfJIt5/6Htx8BV20auSnpuRoWd7DXfqEx0Js
         ixDEOxRI3q4tghiZ0+m2XF9F5f1HRUbxZwqn8f/8QhYYc9n64bJJ/XX/13+cmp4bBjwR
         Pqu5J/Xm3tS12bbnZ1IaJYsMCENaOveiJZwXVge7XLwA0vh1OpDLf3feDzQGZlUOQ9nS
         dxWEN0hhR3cDaKcy+7xoOdmjOFyB/buj2yMMjALikEl8u40XM3oZVI7NFkMX8WiWpyLs
         109M6j0MK7fjbGnpXfp46ZeHmUZgFmBuVK1/CwBCbrQ7ZdGVGmba/RGRUsdE5ZgHk/Xh
         81tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SibvgxmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020a05600c099200b003cf763bf47bsi6315428wmp.151.2023.02.23.08.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SibvgxmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVE4d-0004im-Br; Thu, 23 Feb 2023 11:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE4b-0004d1-6S
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:03:57 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE4Z-0006Fa-Mv
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:03:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso13591594pjb.5
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F97OQmeAYAFPWNscrkYAXbz94Fzjqt9Nd+VnNFVX4X0=;
 b=SibvgxmKk3jFtICXCN7mkMvfsrun52lIDSoVp3was0GrLr1wlVoTJc5pf9f9c1By2p
 U7kAEqDBq2mRZbmaOsI0T7E1XKKvEPQB7/y3LLaXKImKHey5scCrV8j6sns09nj5QZCX
 GDeDCOZ8W/0hyXqrb9/NIa+WNc7uHdEoedcvquoxphszGjoPgb6Jj+Tj+93sVD3wp9+d
 g4WK44oBSePWYdDicGNJeCVP2nah7TVBGAEwoYS71z2r3ZicbWf1SA5e8zm7AIDdlqLc
 soJT76EeyasVg9VkEbSin80F+vDHAqCunbYezM/Wf/S9/N54Pe/poM9swZutA6/vMvZp
 s2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F97OQmeAYAFPWNscrkYAXbz94Fzjqt9Nd+VnNFVX4X0=;
 b=1uLifYpz/TUm9A9P7hpYO8nHsVprYnImt6FQKNom5o2MOGnmz/gUJhrLo04J+aT2bF
 tVQzLRojpatNaYVR09JncAMSQ6kEr4xXyKDOFqqbFOZDBxo3qd1RgwbPUKCspWcRSVFJ
 EJ4MeVyIK3XzMlR4JtpvzsOTzjyiWhd6DSdJjvfd9wiPjR6sOYJ0s+3hQQogybAZOsDw
 k9pOvpUtn3sZA9rycLSW0od+Di/0jxVzG22MADYhLLWC4qog0oVv6Uq8UHC9/jOLbdB6
 3ZH3biqOPsdWovmFJKRSDr//OzHCQXc3Z8CSlIxhWdvI3R84a4pzmY0MGeWyHd0B5AYD
 JT8w==
X-Gm-Message-State: AO0yUKWQr+bZYR8pOVHwQTXRAwY3NzQBDpdcE808LhykPl4tIE1es10C
 R81Cd1kZiletIPS7jiidBK7I7eOsfIuYP7JyUPSBTw==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1242806pjb.137.1677168234060; Thu, 23
 Feb 2023 08:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-11-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:03:43 +0000
Message-ID: <CAFEAcA-xQmEsVGHiS97piq2_qRMBj3xDWiw9s4SDzQQSGvy6cA@mail.gmail.com>
Subject: Re: [PATCH v1 10/19] target/arm: Hoist finalize_memop out of
 do_gpr_{ld, st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KHJKKHxhWh0F

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are going to need the complete memop beforehand,
> so let's not compute it twice.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

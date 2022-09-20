Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1878677ejy;
        Tue, 20 Sep 2022 08:57:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5a/M4EIYQKR+SCpMX+Woz7Qhkxh9FZcC8VvyPZ15DLevbf2YtAz/dr2lSWrTsDDt4I9OnT
X-Received: by 2002:a05:622a:1304:b0:35c:b8f9:b8ac with SMTP id v4-20020a05622a130400b0035cb8f9b8acmr19646447qtk.335.1663689455222;
        Tue, 20 Sep 2022 08:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663689455; cv=none;
        d=google.com; s=arc-20160816;
        b=dGqdLFhnvOPuy7xBcOlFqXRWtUusPyfRT7yZUUbO9v4k4maxkpAalbSEh4ABKkap8p
         fodkjZHJUXN/+C/lMEfNjCKxnuNdUhK2Popf37cf2MoPZKOLMNfYJAdM/6dG34596Sid
         9SX0DydeQRKQpc9hQeO53/HbFPSC6JhUbZOC2jFo1TtVeBJxnbaEZHoLiNDxM0AF6R3K
         D1EljPHHcPo2h37ZlZfMErL5vDVa6GFXF5Zb5PigjIOuTRkhi+ump+nBsNJwyYWDT6BS
         HCUj9p/MIOnrVm3+xmzcnYzzZSN7IEZaCOsnciy0dpJ06k6HwchrC1YxhcvLMAC2TA1Z
         TghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xLhurAWq5p7Y2LI72r7TFyiP1tvKRCdDx7nEVnCYaZ4=;
        b=msrtkqDxw5WgQI9v+IvDVTVpsStQtFPErdXxKeD93Dta831wpbcMquqAXMB5qVL5rk
         Ynlh60BRImIfb7Zp4f7gVMVQ3LWmrgx2nq37q19QhA7hHlXTjgb4CT3EUT6Cd/DwcwYX
         CVElQAEQWqEgu63Ii5R/Yayr29/AADYeHG6lKB4kkSbfPh2PeRiuzWqLj4MZUrx29rDw
         7Rop+EHs5nXlPyVeVTs9OymSpZhdo+Bs9cO0s0K1qMgBAgEstW52xroFv0LrHeInDLo4
         S/YfI7hYVBYP6H+RiAw48BukC3YyGrfLFDFVnRXdpZNdq3iu6O57+7VVlH+plglu8UMV
         wgMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NP4XY9Mj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez8-20020a05622a4c8800b0035cc814219csi1009984qtb.763.2022.09.20.08.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 08:57:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NP4XY9Mj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oafcs-00016H-Kg
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 11:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oacxV-0004qD-S5
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 09:06:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oacxU-0000AC-1D
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 09:06:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id z97so3711713ede.8
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xLhurAWq5p7Y2LI72r7TFyiP1tvKRCdDx7nEVnCYaZ4=;
 b=NP4XY9MjV2SlxhhpGU95yY777j5lDpVQS8loN/1YNHs0Uqr9Xbgv5v+1w8Y0wgjAuR
 f0rtaIoageBiOx7L2pFTOZECcNhreN8jp4KutTz3JdOnCCni9QmqWx+MnxrUYkun9OqN
 CSSjN3Rv6rbh56gN+g9ajKtcxWqb0o45q5SFjHhbXisgTZIGo+eRPX8U8MLnfrrYg7li
 Y59yvvo2lqj5Pd21hWAs2qFL0cGbZsnoFmdDKGtlLlM1MCMn7PabbtbYvJhblCpz+VlD
 dOLkvwWEaDecMoDBNHEYWpCcLZfBZ0dnmaQekemPX3LczzItSarm/MRbizLwgloaxBW9
 FMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xLhurAWq5p7Y2LI72r7TFyiP1tvKRCdDx7nEVnCYaZ4=;
 b=1Ex5SQTyDV57uF3QdOLA25GCcQ/q57Sq+l9laxTWY9P/hXgIjdW7WEkP01vxbA7Jyw
 SSSkYh2TlgLLumdUOjdDvOna1yXyZygRvqQYx0NQsZzVJLKwm/QxKAe1JjGxkIOgQbce
 8ybWidzKdIzPlipYgFG5svVIyEjOJLgGszxh1WbE0tesVgyC0Nki2o0I9lXOmHd+qDd8
 IpB0khKEmRCiP6zep3qR/ehQHj2A87uL1l6agcJ83l0Y4ii190d+AToYIQtqEYPPn8bI
 XN85g+RG2bjJjyK+IHN1YaX0i2BF/oqUyVFwMMfxLvTN/S+CkfaIyF2xsFgkbq10Ne/s
 VzWw==
X-Gm-Message-State: ACrzQf3tGYKUCQXdBtMJ5twewPMkAl+JDA/SZLLqOFxFvtry6zWRSrHW
 tAkXQbI6vOU20wbinSK/McSidrgF2Q/FqWc9r1MAMA==
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr20348636edc.149.1663679197964; Tue, 20
 Sep 2022 06:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <YyYqejml9wzwnZQx@fedora>
In-Reply-To: <YyYqejml9wzwnZQx@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 14:06:26 +0100
Message-ID: <CAFEAcA-WyOy-BoijQqTiezx-e5NRFndQ3uLEzTE9MF1cC8AKBg@mail.gmail.com>
Subject: Re: [PULL 00/20] target-arm.next patch queue
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rWhNYCiHkfMw

On Sat, 17 Sept 2022 at 21:22, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

I've updated the changelog for this one too.

thanks
-- PMM

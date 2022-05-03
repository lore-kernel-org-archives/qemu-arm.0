Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1558398lfj;
        Tue, 3 May 2022 10:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2waA6MvQ7iWKh7ZefIqlMvpgTo2T5zr6+YBqqkyUivwh/1kLircmAuqtyd+6q6aUEZUJZ
X-Received: by 2002:a0c:fc4a:0:b0:456:3d44:9771 with SMTP id w10-20020a0cfc4a000000b004563d449771mr14241938qvp.53.1651597988340;
        Tue, 03 May 2022 10:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651597988; cv=none;
        d=google.com; s=arc-20160816;
        b=WiXY+uVvHcpo3C9fv5CYLukRauH5GrGJgUBWFElfIGOkuuHrbl/yoKH7V+VFibpGIB
         A3tqbDo/XoG1ue8A1/qbYzT+lvxeDhtfDJN6F2hcGa8g+D7q/Fk//XfpUTggLEudMomH
         eFlmfsNF4bx6JfNgFf9owlQ3TvxGeQSWeAqq1/X+LWG169N476SGTnq3rEXW8etU6blH
         OLqbuKkmemfhFQCPQWg+tV5LfmwYgXeL+7kiCZy7c+0aLeImpkucPEtvAizzwDkp2s91
         b9a3II5+6GQwtVTyXjDAgqDjLnV3HZjriJXT8vd3JKX41477dI+bLEFqZBc5dgUc7QYL
         OQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qskZz+HwSHwzT1Ly7EOjisqEUw//QhfFSfAXHv+fWak=;
        b=fdPkOVef+1tuXwWul0DYViOWdP54PY01PIeT8i3rFQzi+L2+UwBaV/mvLYziOThUMs
         dZyxLdfLQzABAJgQEikiTa0oT+qw34k8jAV1XGo3m9yaXQZzFBf9F/rLxFslI/ikjQk4
         XQ43kDlGWspliyMhqVhqepU5gwkBMLqoDj60VaCJkCed/uHCS1kShMqEldXAe2pN4m0c
         iykswwxz4ctgnO0JXTsUwXFsJIB6Mw7RCNMwmpkw6dQBoR+QcJD4XcFLqtffSrQPhG1j
         TXOoljzl/Qp5Da0rY8e3VSkxs/9IE0SnMpDWEqmPlOLtYLTK7YGLTADmrvSNc2BdlWwL
         w3yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NXNDrZm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a62-20020a379841000000b0069ee6bca308si7504888qke.392.2022.05.03.10.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 10:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NXNDrZm/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlw5D-0002W0-N3
	for alex.bennee@linaro.org; Tue, 03 May 2022 13:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw4m-0002Qs-Hs
 for qemu-arm@nongnu.org; Tue, 03 May 2022 13:12:40 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:43444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw4l-0004hZ-35
 for qemu-arm@nongnu.org; Tue, 03 May 2022 13:12:40 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec42eae76bso186975267b3.10
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qskZz+HwSHwzT1Ly7EOjisqEUw//QhfFSfAXHv+fWak=;
 b=NXNDrZm/P3AZgbI4+Qk7Gmja6wYGf4kYTIWKOyT5M2Q5pU1okqzFSzc2dEkUfOr2FA
 p3hAReA9st3IvtqdxRAUoXUjR8EqZniI+DPqJ+jWimFEuGTlWJku9vzKytlfhwYSHiaW
 ySuumIdNPWSc3xUtN7w1RXUjeLu0h95aa4SF0nlx0G817zPjc68/2DEbOjCvpwDlaieQ
 Iazvn1fmz93FyzFYUDsrIWEqS/tkt4cM7Y3shK4luHTxkhUBG3TQ7Z0/qoeyfJt2EhbU
 YWsYVzAS0BYr1xEbzV4BeXuBJnCQwi1tMMbTGHntlEcVz8MdmK5QoNEAR/poV4jpLorA
 41RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qskZz+HwSHwzT1Ly7EOjisqEUw//QhfFSfAXHv+fWak=;
 b=74Q6dFHhCKoK9cFBZ5Ah4Y5rxfk4zZxfEkhjv84pmUBUI5MVP5ct9XGFlrR54RMym8
 rHlhEPAdJVN+yYVaBTCaXoJz3BMHAkkTlUmZ4ag6gfHQbA5wEo7qDv373zKkvGseAGNF
 X1W0KMSLyaorMvEmWFc/a/l4whe/dVZR2+eJc+SanYZZSKcy9aHwVhdvrp+hKMTBKeb2
 3wsH+0ktSg840J3IN0Q4jl79B0KyAZkVwwJyMengHnU9bW3jbDuo0itrRpjtPAmDiJFD
 oeOy5/Eq7HtgjHIGZS+SNpJQ9RrDJFK97bRmqIBltWgDjRdtnr1KIpU4ojk7KRn+ZFZx
 XZeQ==
X-Gm-Message-State: AOAM532L6cBlB8mBD01alPIOSVaayPTnADq1OXWRc3ClT9XwPhJA376+
 jwoFfqvZ7m8uWRFfG8YJUV5HgJdn2Rv4jhRao2baSg==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16405052ywb.257.1651597958115; Tue, 03
 May 2022 10:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-23-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 18:12:26 +0100
Message-ID: <CAFEAcA9fgq7NK7_sGkk8X5SNF1qcuEPWUvezJ4YCg-rbO7-A4w@mail.gmail.com>
Subject: Re: [PATCH v4 22/45] target/arm: Merge zcr reginfo
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: IoPMKDdbQLGn

On Sun, 1 May 2022 at 07:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
> now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
> while registering.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 55 ++++++++++++++-------------------------------
>  1 file changed, 17 insertions(+), 38 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

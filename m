Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6458999lfc;
        Tue, 16 Feb 2021 05:16:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMZ6IIBRUUQiG4C0uohFJSjNK2GnbTvhvDa9enxRD8dtbhCgaZwB1W9y6zz06vm6V6coX+
X-Received: by 2002:a67:dd97:: with SMTP id i23mr10795114vsk.33.1613481368134;
        Tue, 16 Feb 2021 05:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613481368; cv=none;
        d=google.com; s=arc-20160816;
        b=1In0TOhQCBq1ZwcjekJTI8G64SNJ2rSxQ7dKZmBWcyZ/9mpEZhQ824266eo6p7BRi9
         d9qA7l87+VkiZtpO2TgBOLk0xvudOgLE2KKTycp2+WHj4KDXE+BSv1MCLj+2JNnZ7kfO
         5LQy5zujHxFMqB8Q/MMBE+QWYi9L7YDJhE0H5xdIoiqotmXmDVC0PgcPfsrUbcJ7Ww7U
         BcAZKQBdUP6pwQ4e3JsSqcuRypopMsqX3TFZXArE5TnVwF+0X+iWM7vy4RwlU5dW9X2q
         G1LGlxSk5+IfwBfBuOaQEgh2WZlHTJa7ZlAsGkHs9hU4G/8uj4H44rcuaEsxQHJGTfRT
         4FCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hWf6Qjcmse9OLPkFZplSkmUjV0aXxlZ+z6bAu5QRxLk=;
        b=QOrWoABF719n7Y7JpyJdEd48KpHfSs0qm2XJn14ejpOhptEYvp2uMwJjUhDwA08BC9
         mrdFlxbiM7zAb4hIHwKsJaemUGVxlJ55JZcpRS6+dVXIMrM33ogrK9PQKcS+LoUizscg
         QougkRFURQXjEyCHevn5azktj+ySBKt54ZkhTCYNOvwVqHn4LofaLlmr4Bf2WyqIQDFd
         9KO7p3oEUGNf8KVY9qJlHjjHYYDoQoaa507dKhEdrRzgQu3veZnrOvos5J/YEo2NOD4I
         k413bs/8e5vi3UMAxR4yYsd79966E6kDp+/+86z69q8E75y5OEe2XeWeJ0LNKs9OTycf
         MlWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XRqymkir;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si1889842vsn.164.2021.02.16.05.16.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 05:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XRqymkir;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC0D1-0000rc-Do
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 08:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0Cp-0000qK-Fo
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 08:15:56 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0Cn-0007ov-Ri
 for qemu-arm@nongnu.org; Tue, 16 Feb 2021 08:15:55 -0500
Received: by mail-ed1-x531.google.com with SMTP id h10so7350666edl.6
 for <qemu-arm@nongnu.org>; Tue, 16 Feb 2021 05:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hWf6Qjcmse9OLPkFZplSkmUjV0aXxlZ+z6bAu5QRxLk=;
 b=XRqymkir3dG+7ls4vdmQlBWnSjXi5jhK1nnGn2yInvVOgKRnpvEAgRcpbjBgG5PHhA
 MbqMnhtLCT274PFzpqxvXa5hGsTEILSeXsAvhd/iJqo11q6taJucKrkGb2ZPWZwM51HP
 doYM6uPkiRsxORJ+JgMVCsKdCy+E85gOeoAJrsnr6M5biADufG64DB7zlv4YmTGMxZpl
 oLQtecO1TVQb5H+nfoMjM7raveM/loV0lq95pkaCeBOHx63mSaWstg0v2B7CH/tx1u/G
 z/+JBUAB/EtdczkKt0zkj4tf2KFcmbH+jLQGPwRkF8ujGD1CEHBhxh5kWK1P1SWF77q/
 1Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hWf6Qjcmse9OLPkFZplSkmUjV0aXxlZ+z6bAu5QRxLk=;
 b=UaZXjQcvihImyPfN6Vp86YuhzzUlSoMr+3U3Sa65NcmrMbCcUfELM3QRPTuZFvn3pI
 mDbpc3vwuu5eP89GHjnAcyvRiiZjB4KG0QJJHEh3M6RbMTiGFnjxfgyl26Idxdt1CMZ9
 veEKlS1LVXMUn7HFj/rrDs12G/LVxl2psBqfuMBcMo7/EWgIdH1+0mH5Q9jk9iNzujaj
 JhniuRqjRfPikdQDi52ug1Kmfz1ZRtzBekVfEeYcLRew+NgLyj+yL3VgVyy6H6VnPFKw
 CBQxPmxMf5JMD0a3hF+6nY6Zndhmk6ncilMYEp3sYKI5vTRBcU9e1gEPpfXgSoB8KNr3
 oryw==
X-Gm-Message-State: AOAM533mQekXN5M2++LYvT7cFkLChZt5O5i5cryPhJzoZa/pRTLwFXgO
 85CDXbYHZNtB44cDgLrTrpWr7kP47/zuJkDuMHLXOw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr20768218edd.52.1613481351814; 
 Tue, 16 Feb 2021 05:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20210216131132.1116574-1-f4bug@amsat.org>
In-Reply-To: <20210216131132.1116574-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 13:15:40 +0000
Message-ID: <CAFEAcA9kg1qEMamBxgshqL0YADDX9e7U94wr9HuzCh0yV9w-mw@mail.gmail.com>
Subject: Re: [PATCH v4] MAINTAINERS: Add an entry for the Siemens SX1
 (OMAP310) machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SltXx4HtSJvg

On Tue, 16 Feb 2021 at 13:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v4: Maintained -> Odd Fixes (no test image known)
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8201f12271b..47f8c591760 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -656,6 +656,12 @@ S: Maintained
>  F: hw/rtc/goldfish_rtc.c
>  F: include/hw/rtc/goldfish_rtc.h
>
> +Siemens SX1 (OMAP310)
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/omap_sx1.c

docs/system/arm/sx1.rst is already listed in MAINTAINERS
under the 'OMAP' section; if we want to have a separate
section for the SX1 we should move that F: line here.

thanks
-- PMM

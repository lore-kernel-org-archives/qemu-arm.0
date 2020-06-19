Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp611966lfm;
        Fri, 19 Jun 2020 06:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOzqXp9rBv9T81UR+Ajb7gBBa4yzUvkcZizP5LRxJpO9RMnArn2hpWEi7zDCdIMia1xFwI
X-Received: by 2002:a25:ab12:: with SMTP id u18mr6048490ybi.142.1592574945330;
        Fri, 19 Jun 2020 06:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592574945; cv=none;
        d=google.com; s=arc-20160816;
        b=MPqOkB2d9JdIBxP2kP/4VSCXXjbM1Ymf8AodpRTsV8Y4h6dORKO0eoQn4G/NX9M8Iw
         qcro2QqelVdHjRrnm1gpieNGhmUD0nIVgAPRuERGOk4Zy0dWZwWOKUUCpbYf2Wryb7uO
         9yp6QUaSqQqQSbvEaFL3ne4BKkg65uB7/jt0LY72hKG4gX+9oDdwkeahq6oiNCuAT/ob
         c1wHbI+4pqW447TzkP/brG9FibQmeDePpSNHXn8sfwTXjc8O5b0h6zSQ2sfxhcAH3xwC
         h9ns5h/ygzN44GAMHvwJZxMkG48qy+MustYpjqtKd1aQmi1DcDeHJ530Rjac9HSBBrLY
         bUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1EzHJztIDOyvbULr5Zv+UekoPb8XqsgsZrIk8Ndaa5o=;
        b=viLVH3thtezZ0FIwqxvA/glS/xCRenQodqxs0hyO3Ia/JtOfwvcVs7ips+q5y3uZ/j
         Mdpez6ZayCDd5pBgmwnFbh6JB+ejStswpwKFnJfF2kLtIRMiXYhZhM11W+u6Rz85Ecut
         eXuFzqFYJIveXpLesw5FVHzeVJ80mwN7Eb/eQM9H6K9BPi1b6x19IEraxoIaHCCxSGOA
         /zYHgEFZU2rFpiSbxy5+hwtoWDU1h0bIIUVpG3X/Uk/M0DIVPxPEmf+lO7fUMH77XRPp
         i+LClToJk5YwZ537RINOApAAjoyA0etxUA+BmHupl8bGcPi4yes3qp17Abmv3mU/ZCDt
         VNug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yI0Fym38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 136si5184665ybf.378.2020.06.19.06.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 06:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yI0Fym38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHUe-00029G-Lk
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 09:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHUV-00026J-4v
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 09:55:35 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHUS-0001Oi-HT
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 09:55:34 -0400
Received: by mail-oi1-x243.google.com with SMTP id j189so8482672oih.10
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EzHJztIDOyvbULr5Zv+UekoPb8XqsgsZrIk8Ndaa5o=;
 b=yI0Fym38fJvkBpjJZMPMxkrY6ob9DLg9fqhk8mhS8RJmyALsFS4wVXY/njtRMQ8ptY
 2qISFMqx4F8fjBeg+xuvBQNNOG1Ng+uPdL108mUOdpZAptioMUEFpieh0oYq+QbDd1SH
 CuuuqTGxOQpXKqfATypC/Kyw7j3KLDDRMhYYngf2u/srCrHpmA1EEJaZ8p6vC/KFf4uw
 z0bKCpi1gaeTyvp5iLKRCaUyQbRxRKbRVGJmOYKApu7e9OV53oQPFcPRtqkWAW4emRlh
 h+yJw7WX5oij1ky0NY9cnulXExrtA7LCYbGfNAG3AWUImDKkhE0kJV7DBb8yOk9b1ztc
 v6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EzHJztIDOyvbULr5Zv+UekoPb8XqsgsZrIk8Ndaa5o=;
 b=Jc1vbTYtGmBoZM3D/IuqRhhXRkw8Db8aSvk8j2lIE3gr8+JPBBw2CtX3mSzpXvl69U
 28RJyCLaTJr8LZrDiSKDcZ2p3XxNryXm7TYInBtiUqvJHXJYS7cOofo36X49CAzXDUKg
 pSZzgV427G9F3EakmyW+LCbxd/ymbaCiz6UPWdq4+Hm/VlT44KyylfdnQLTC4dFM7QvW
 wzXYWSzzF4UOn9jMp8ZIqzK+T+fR7Fv6mgCX1ePDuAl/WQNzm3Ps+J4ETRv3AzbCZu1A
 LfO6D9p8M+cHAmpueOEqJc/O1dAva/BdhV1n2HgtvztJPAHcR82V4x2TLkAdOtvUY7UW
 Phig==
X-Gm-Message-State: AOAM532RF7penpWzoANSjBh4Z1/YSHOAjczUFFVNHVJyj8kr75sJuuXp
 LNrdHCjniJgkG02UVsxR5VEtwm8Y/eYBYpnh7U/s8w==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr3080689oia.163.1592574931344; 
 Fri, 19 Jun 2020 06:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-28-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 14:55:20 +0100
Message-ID: <CAFEAcA_UCd8p9fS25nLqC6dOuaH6_hYR61NshTmrp3fpBqML+A@mail.gmail.com>
Subject: Re: [PATCH v7 27/42] target/arm: Add helper_mte_check_zva
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cyf0EVEQw821

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a special helper for DC_ZVA, rather than the more
> general mte_checkN.  Leave the helper blank for now.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Helper does not appear to be blank :-)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

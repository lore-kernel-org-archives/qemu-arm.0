Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1908745qvn;
        Fri, 5 Nov 2021 10:13:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygyENZlhOF0k+4ohGi8opnXceeNdYP5bP6nBnenAe1dneo8eZ0cRJ0AcHn9Fd1Z9jmlIku
X-Received: by 2002:a05:6808:218e:: with SMTP id be14mr22475980oib.147.1636132432998;
        Fri, 05 Nov 2021 10:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636132432; cv=none;
        d=google.com; s=arc-20160816;
        b=YRxl/zurPg4tH3SK9u/yZO4WMbQRWbvjEFAAWo0qXq1u5qz1QEneF0UiFl57BKhaLu
         q2bUKEYOVTwcuxbxxMMk8DOEbkV9guze/yHm46oJhBhTONPeJjMrFkoD2YFEaKIcqSb3
         3oY1zY4Up2lnmZQ0OBz8CNUIMkpoUv+gBOA9JRrD7xho+1yqdS9SB6axTKxe27rV3yyW
         f7Chr3Ga+91m5gOPjBd2e8XK5RE8yD+fMaoEFef/Hm75A1RwS1lh0xaT5FYFp3u+q5ka
         KzES4wDA/oOcefQj4rUPXYhz/6LOWLaLyyq07yvbq5hwotAlOi3q4c2qhWKVNUYRFhM6
         9qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+oeeevTvvCE3c4nf/NIZP2x2G5pus53mLUY57P2efs8=;
        b=C9FdjT/kEHmiXT9O/hu3ZQTvl6BIcbk2gfUb1IDkYyLzT7n+PPD13P187TXCB8OAwY
         pCXNB1TLrdLrGWnNj8KBZxeWtf1fJNLApqpEPRI3rwrZF2tQLeKNbSDK3ii9ltpY+8Jz
         4qmZf+Dyp0KgNIHemUqthiC4VU+O998pZYYtgkP266pmG8epAxW1LDiiWp4MRZ/9jw/o
         03tBXh3oq6cGWh9+HewegxGB/OCZnVufw41n8Ceo8OKp9swX9eNQpuN8c8lmWa7Kke/z
         OZniYYY0HRUiXsbzcR479aeLF8uV0AoJRapxyAezbdmle+ykvk82UbMwCdtc1JYXPRGS
         wrow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=enF47wU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si6561764oon.79.2021.11.05.10.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=enF47wU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2mm-0004AY-Be
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2mT-000485-UE
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:13:34 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2mR-0002QJ-3q
 for qemu-arm@nongnu.org; Fri, 05 Nov 2021 13:13:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id v127so7604375wme.5
 for <qemu-arm@nongnu.org>; Fri, 05 Nov 2021 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+oeeevTvvCE3c4nf/NIZP2x2G5pus53mLUY57P2efs8=;
 b=enF47wU5uzwReg7v6baTYm9hlA9tX7TO/sXsALrVP86Ubg0yQKS3dZumhN76yLygyx
 x8NnEisBtb2iiFoa/kuyt9V+v1qnDl5ZdEvvQ4bJvNcxzpfhLr6W2Cs2GapPaWe1fpp3
 UeKSUkPxYecMMfQiuvzkA3q22QE8FECxF7S1LbHl9wPy6CSpO5uEWjIKcXJ9Nz30Ac45
 9x9A0CfLmde4p7Mi2OIXOiul92ZIWQlFZCQ1bvFu7pvrzIzOIfjEeEDKLvd1bvkswi2A
 dzjizv2t1d35yB4JRAY4UTnnxfdukkPSy5IggGljbC9Xy2G1dHVc1a2mGaynpj+gcUem
 GVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+oeeevTvvCE3c4nf/NIZP2x2G5pus53mLUY57P2efs8=;
 b=FaU0wrLnTUuJbYqZeeixPS0fbE9WIrEONWcESij9PYRsqLLRiZiahH0wFEz6FHfYuE
 zRHgl1iwP7WE9bnRxXQT+8ubJW/CyeBEG90plGc+frmJDlNPAye+Bdw2dEOC/c2ddUjn
 5QknP/uS7zYrqFKHED/Ufzg9AYoJAwvfVt5/lklcG55wJOmhla6RIl8gFIJAhm+YAq+h
 HxpdlwbT8vBJbIDJwFRJdwCQWEJEDpURO1IBal/47XG7xyEG6z4Ji8ifqDPYCs8SvlKS
 qBbvhiAuMt09xN4KrIwFTM4g6C0c/NG8fMEoyUXsJL5YDESN/Qp2pcG4Q7WLI9MJ5n6g
 iu1Q==
X-Gm-Message-State: AOAM5322mmANaMN1+KeiDmf+3OowAS/eblxRfGCYeq+/gsHLp/86WYfm
 +wDaWi0CfQOPCrp+DdlEOjJ1pca0yeEu+Cu9RRtixw==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr31121528wme.32.1636132409364; 
 Fri, 05 Nov 2021 10:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-8-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:13:18 +0000
Message-ID: <CAFEAcA8yyxt2tnUMcqgt7oxMX5na2q5JZpE-SBKHgBK8fzrnJw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B7sPSKsF05Qj

On Wed, 3 Nov 2021 at 04:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

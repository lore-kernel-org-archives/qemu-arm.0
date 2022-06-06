Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1371718lfb;
        Mon, 6 Jun 2022 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz88fXNoYixAlYRR+uS6RRypTvmkjZ/GdKJI9l2Y7I+ZJRvRWLruGB8rCEcUrZbygDCgPR
X-Received: by 2002:a0c:df8c:0:b0:465:d376:1ec0 with SMTP id w12-20020a0cdf8c000000b00465d3761ec0mr16678564qvl.97.1654522493558;
        Mon, 06 Jun 2022 06:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654522493; cv=none;
        d=google.com; s=arc-20160816;
        b=yyheEaq2d/4XveHiYu+3LSFBxT5tkbZxeDHZE5EcDGSY5G4mzLJ7p9cc7E+EGa9JB6
         mNCU3PSquxLsKRKZIA7wbOs1T0PSm8bW/dr6bhhZTRbhfjRhfJoWnONxIbkgYlU5cG92
         4S/RurHOk210ZIEPsFDYuqMCB+os5hxUL3uzVMPN378nvP3FSzxanBCbnvaaliMdpsGd
         qJJQyBWlMjy1AH6OaZcj42PWju4+keytdTNH4RjSXyfle00KxeWosE+lEvFZyaJW2CGH
         ehqRXSjNrnEePHs0AIplS6B2YyO7iDqqgIPcUibhwqknfnucP8x0Mjg1ESkOi1CrVgLm
         ztNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LhChXr5C1Y29wP0vR+7yG0IPFznToHZx0o7exPvq3Bs=;
        b=EPs2i/IVm2ik8LXSnYGe1QwF0izcIymYyT8H8gSwFJn37RGMYbS7CK3zQqRYC4SEZl
         K7ou8zlM2JGZPNXxqcAXQ2I32mk7wPHwwsKynbahKjkdy2am75AMCLuEDyULoe/Il67p
         Q8KxrxtPb5aIrOW/SViDxeaBiFMkPKmLVXhTXftaJzK3hWwzA+cG7SeMIOvkKlF8nXrh
         MOVUoUrOS1uXqiqD8910c1t9IS2V0rRo8WdrRsxIFFqPQzpSZX8wonaxbfMQIo1fTYPf
         7K1rLqY5wsTOXjJLBiv0z1BU5vyKq/sN5GBYScA/Hpu3wlEDUthTNTWtJVAARQRHtxsP
         /EpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GlO8RP0f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az43-20020a05620a172b00b006a62c4bc399si8308397qkb.478.2022.06.06.06.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 06:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GlO8RP0f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyCse-0006Nx-TS
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 09:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCqy-0003kB-N5
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:33:08 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCqx-00043e-1Q
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:33:08 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-30fdbe7467cso107763097b3.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhChXr5C1Y29wP0vR+7yG0IPFznToHZx0o7exPvq3Bs=;
 b=GlO8RP0f2vtCH0rUTxLGaiXnrMeo2HHqCsItWHAkrSIki6kSs7WX8n14xy5KZXR3q9
 C8sI7OGfMLii6TMTbB1mVKW9kI3/jtV6GB6D34cslR8sfFWoJwiIWuwSb6z1LsCDq5dH
 V0y/S7xaR1XAWszvdKK972PU+EbOTtJReP8C/F8iABedxSUszSI+LghpHrYtbXC99Qsw
 MzlvTsSe25tXoFfcE/D+sybhmv5AtgYW5wMMYqqC2PBZzGGk4D7Tl4UyPS1AnwJD/4i7
 lljt8A8LP/3VTcm7Hfgi1LjEnIwF/UHgcMddIOvE4AGMiig/xLqnT8X0wiwVG0iEyzEI
 Y32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhChXr5C1Y29wP0vR+7yG0IPFznToHZx0o7exPvq3Bs=;
 b=cqz5JrEwC21DFNxrxFlij1EGr98yOg/zutS2LqUCuDcP5lPGkwWrnoCw9Gw68FYF9N
 O1WRchxIhY8vOERMcxcWchTO9j0BIUwtwhfUn2qn17rHgQSw5YNWppcFe5at3ZjDkChx
 uDLTku+/OQQ7T6AMVBn9Px3FMEo51cKJsFrN2BioSYHDEnUo/bW/1RZmH/yBqQJMHJdy
 DnyqzrUuY76Hgc/rTIei6+FgcJZfuZXedzXn60SHuC1OOqnShJSoEpQYCdofpZ6OMQhI
 qGhsi6yLDIEaHPbuXj+SGnuSm871bEtEJt2Lp4uzWtD4ePx8eZvJCcu0BbLwxpTEbuEh
 3hvQ==
X-Gm-Message-State: AOAM53123fvx4GlNEY7RoZnEs4usXB5LHbLTJiv5xnzrl5DbhaTR5Zt3
 wHN4ArjeciulRgGo7XOjXo1xrucHb06NSX+1rXauww==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr25574433ywc.329.1654522385069; Mon, 06
 Jun 2022 06:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-25-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:32:54 +0100
Message-ID: <CAFEAcA-zJMxJX2x0PVLycb1fJ5=W=HwKSTaSqpxfZOg-GnGKAA@mail.gmail.com>
Subject: Re: [PATCH 24/71] target/arm: Add ARM_CP_SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gI4swY9RfpM

On Thu, 2 Jun 2022 at 23:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will be used for controlling access to SME cpregs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

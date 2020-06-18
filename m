Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1635314lfm;
        Thu, 18 Jun 2020 06:19:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvXZYqzDm5QstQq2UaUrRnD+5YGFEDATL691M2kga/BE0wZNJJECKqXoSOx6ds+PNI0SV7
X-Received: by 2002:a25:81c9:: with SMTP id n9mr6685306ybm.385.1592486379679;
        Thu, 18 Jun 2020 06:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592486379; cv=none;
        d=google.com; s=arc-20160816;
        b=CoXBYCVO84rRTQTQE8ZlYK1sDBM0h2OztT5g1pNTSKSbxcKj3pYs3MDh05MidzGaMD
         LwrMGcbfkkNDn99MDkzZDb2UWIsmYh0MPygIE+/VHqOzyYiVrJ1vzxtpxnWbleh9G0ja
         gIsGQyms7y0oimJfRX0DeHpiDpyg3ClWUK/SDHlRZxStNfb6huCKiL3t+FG4y7G/YPE8
         BtjWXz86zXBL+bn8vD7sSo9liYoy4wQocqOYb9YTzdZM1gvs/mD/qE8fXhczH5SQTb+V
         gNP5LlAG/qxxR+efU4W2HVnGKAgcoq0QOBy0MpbZUs0pdv11luih1AqhNurQQt1dZmQr
         4EZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=719po6yBzvB0Jxp4u8XJmXaxbW6RZMHkp4D2J3C5OrQ=;
        b=KQBnYs5iMLQDp2rS9WrYF3A8tmUBmxddttgdpOmksOq4bXKSmgcfg4yBiJ30bjIYVJ
         4/dTncgsr7RYwewCqzC6200ZToJdP3BLvhKrG1qN6Uzx5aGqEoHFiY5hB8W/V5peuVa0
         z5PSlUn1sEcMmZ2wwO0bi7ORWJVTtKOCXKOY/c9mXnWctJSj4IV2CBhrkiWuovKP5x5Q
         Bhs1xRGeQkATuOtt0+WqH3kBPi2HzJOMgM/qa4GB8Jr3OREwiMPlXO0r/N2duBBladJn
         y07Lz107Qtc10Ka8wird1fNB6nDdHzW88PIOhpl553x7lJAbmWSdn4OWx49S3pf1wNE7
         i/wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DPN9Ccsx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si2420217ybs.237.2020.06.18.06.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 06:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DPN9Ccsx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jluSB-0001hl-2h
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 09:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jluS4-0001gw-60
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 09:19:32 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jluS2-0004y1-MD
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 09:19:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id n70so4477661ota.5
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=719po6yBzvB0Jxp4u8XJmXaxbW6RZMHkp4D2J3C5OrQ=;
 b=DPN9Ccsxk8ixbSgCRjynwjgsqiVhATGw8joqecBLQkskIrhxwQeEjhZr1bAzUMnbN4
 lDIIVmL3aEANnhnTLmyRMZpys62oEHJ/b9QMr2SQsFk93pL9rLHU3qqjveK3h2mWRA58
 VuwMPMBuKCMtQanyWEc7WizxVXlmDktnV9P5LahnybcaeRz7Zfqwww/l9fStGQuEALg2
 uz7mi2Z/7DtwtL28TqtutU38WBbmMc9JzwczPc7US3i6ftxs5TIH5xSVqJt9gMyS0/rT
 1itk1ei59k38illRt522ozScOw/xplH17SgI7xrLXtBGdSxvuqzMXIrELxlACXCHpa5e
 mb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=719po6yBzvB0Jxp4u8XJmXaxbW6RZMHkp4D2J3C5OrQ=;
 b=fGZConR4yLReDraPPxUs+205Ghbr5ec75SX9LckQ+m5o+MyRWL5fBL6SQMgc0m2AQd
 bNYBwJTQR4s9Xx8lJxyDytK2ukGvGEs+BzamJ3v0ehFmCBWGD80QVbVCt93VGjYzuz2Z
 nfjhl3AXDXRU+bjxQfoQcVX2qAuOBoiuA7qp/9thL33gXvrGcGt4HrZmCL2pF5uLISau
 kq9qqsd6VWw28eQKhwBHDCjK5dsc/PrEFXf7HWU6LvxmbYoQ+Fw7SBd2zRkXjoCTj4s/
 WXWHIFhuJtwYNuyUd18eDtjS3MUMx65HnE8CS6B4MTxymBAgct5YYFLaiLaF0Rpe8cyS
 pFSQ==
X-Gm-Message-State: AOAM530/Tx1h9f6qV2LAtBpldYFttdlF9+lum1TWT81uVjjBzTiV0+H3
 8Tgfo0w0UWXYN8l6NGdHWRA87HYkg8h0dm6OWoknYQ==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr3230862otn.221.1592486367473; 
 Thu, 18 Jun 2020 06:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-12-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 14:19:16 +0100
Message-ID: <CAFEAcA9rJN8uE+D6eOitdsD87Ja764u662Sk3Jb9BE5nRVVMNQ@mail.gmail.com>
Subject: Re: [PATCH v7 11/42] target/arm: Implement the GMI instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
X-TUID: 0T1V+qR7wlfM

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Inline the operation.
> ---
>  target/arm/translate-a64.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

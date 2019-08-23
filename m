Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp509569wrs;
        Fri, 23 Aug 2019 05:29:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoW3feTItA9GHcDNljjL1zozG0oQAAdOypSZFtufjA5Ef8KhhSbpk41N5xWac9K9iQJIpl
X-Received: by 2002:a50:f412:: with SMTP id r18mr4205727edm.47.1566563398135;
        Fri, 23 Aug 2019 05:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566563398; cv=none;
        d=google.com; s=arc-20160816;
        b=PLpab5NdNSKFz6OvUlt7pMkslt2V11AAztMrShh7G1fHONHzsUzwkUc7C3tKe/gUEs
         qLuEqkVi6/76KpGUtaDMD51+vkS1Fkdwsp6bg5ju3uFzL/hoPWb0ufQ3Ggq6KGOJSTu0
         TwSnQX5YAkG47d+GB6NvJE8q13Pb3F/cYdaZThUPdhUogmSCF0/+Fn/+gz31Eh7vH8N1
         A56tUHR1ss6Uj5KGCrb3fA1lD7SPcfWRkNU4q1AlDtngGtd5Rq6rhc0LNk8RgHTsPjCW
         wRUt+H/xPE05Lwybpid1pKJGVvcV1WUtLGHUnVPGdq1n1zF+fJtPGc0p0+y8vMsJRbcH
         5Ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOykgX4jukzcLHOtQbzxdIt0wUVBkJ0RXtssb8+ftHM=;
        b=H2/Nawql7WjRpKCHYF2G5p32LovWFdPP3L1r/cRSAAv3or99m0z8rBRKj2cznCnT2N
         xqdEafZu3bI3U/weAZED7JVHvPS62BvpVlHj7FJxzn4CPQfBwBwGQ/+eAyTwSPhvdyZ3
         dGSr1JDUGN+Bj/LTY53JfdwN9DMVxtF+rNmfBTYbZpQ9l/Snnu26wua5TUEF0QaKamQC
         c1vP4OQKIGvRoJaw8YK8KLmGDu3nYzNE4TZ8twcx5KzYSNB7Mo6CVYpreNYzBHoNXm8o
         o5sgSyJ8I1u6bl+7p63YF+PPj4FPnQS4y1rxY8ihkQQ/QH7oqtAcrPjHytLwSRzIj9XL
         mkrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EgEV8cy0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si1330395ejz.244.2019.08.23.05.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EgEV8cy0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18hZ-0008Ap-2L
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18bH-0002Mk-JR
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18bG-0004WD-6b
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:23:27 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18bG-0004Vn-17
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:23:26 -0400
Received: by mail-ot1-x341.google.com with SMTP id z17so8516190otk.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOykgX4jukzcLHOtQbzxdIt0wUVBkJ0RXtssb8+ftHM=;
 b=EgEV8cy0/QGrCDwvZ4BKMo+OxUU8zGio8eowE/1+h0RPq/FFCu2y0wH7G/7Kz6cOD0
 dN1mcWGgWX/xVmA0grNk5Je9JVkDqcAWSSCXlPv3Ud3thiXl6fY0Rv3a0J9KvEvgz1qU
 gVsCnulRNsm9YxTf4MmdPSXuu0abDJZeciqA6/LwSCkqeUEarl5KPXtqYoinV1/gEghr
 j/eYEaW2jzztf5bKTZ0jP33HC5lmt7oHnkYFouA3rFFdpK564tXaAh279HiXpOpA0Yjk
 8vtiOwabUqIItY9QT3FlYFC5fMZ0EfeDVRzzdO3pfpH43Ge3Vmj51VufMY751Lm6l7zL
 IpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOykgX4jukzcLHOtQbzxdIt0wUVBkJ0RXtssb8+ftHM=;
 b=EgSgeZeCOTIir1gMQ3A/wL04WXqlup3SAxK931jFwykic5ltG6CBmStSbiQgaVMj2a
 QeMUdel1jLHcyOSCOXAR4nT4vo8hKtnVMYk3NNu5zBxscrm5XSg70oFYODVqoy83Pm9j
 3pmriG+IAyjPd8wRv78PnXsic/A4h1fmYC6/pALVZvMNZmw+eQwM/Wj6op6X073v3IU5
 62IiGXSAHEF/8zJos3kZBAyv8lzKmsWpQ982SUIDPb2BnBPtVoZftPRrxvcOjKWGReFl
 CeGQxcHN1R5j/HUok6ZAGBHMbfGHOt9rTcNqonWSfLtP4ecSyu0WkX4uFHiIuKrxRgBH
 0SfA==
X-Gm-Message-State: APjAAAW5TuJQ5IthvRsKP2AnN8eBipSqG4AMatHIyyFSulOWsXcLOUkw
 ssKqNRYVfIrgNXJbXVnN7knaQAS/R82evUfnT0KI3g==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr4048393oti.91.1566563005259; 
 Fri, 23 Aug 2019 05:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-14-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:23:14 +0100
Message-ID: <CAFEAcA92qXihhbmaP5oHTCNV8LtmZUuxA9m8iPGVUY-JidBaUQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 13/68] target/arm: Convert MRS/MSR (banked,
 register)
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
X-TUID: SH7VQbAbITgz

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The m-profile and a-profile, decodings overlap.  Only return false
> for the case of wrong profile; handle UNDEFINED for permission failure
> directly.  This ensures that we don't accidentally pass an insn that
> applies to the wrong profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

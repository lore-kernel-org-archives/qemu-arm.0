Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1295629lfm;
        Thu, 25 Jun 2020 06:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6DyxW50Kx7P0XlK8TRfGJMi8iOW49pQs4C62MY63FIbwaNViQSgina4LXYeDuQCmFeLeT
X-Received: by 2002:a25:b992:: with SMTP id r18mr51476323ybg.283.1593091767032;
        Thu, 25 Jun 2020 06:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593091767; cv=none;
        d=google.com; s=arc-20160816;
        b=m3jim39v5NBHqav/L+gDfQZZ7Gd3RKZIYrecHX1X9bb1O0Nq7CNQKZTSq1uT/RSuso
         YI+s4lKtFC4G7W7JASvchBcUwnosKOGnWJFstmynjTUQ7LpSCWMmTMlmwfrxTSXdJw6h
         0y1XSncl6nrUBKH2G8KeOT6NDSo47/t0IbijDJMUeSKsXEdkJWyZNZxdrQeev2SRQ++A
         BQbO2sw1pHz1ATDf/j4mh4hsj2WgzqTImDspMqAXIAg3s+I4vOwdvGWkBloKaLvLeUNP
         fIlIeQRJn4RrNLhcjKHKNtu0HhvAMySEm0a4oJXQM+TY1eXR6SNMK75//Ggb9k5NB4hf
         0jYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dBHI6XnyQBCVvqfjrKwDTVT77lOgCq640799Y784rVc=;
        b=0ruUZWNXnqem2gUjFnovsRAlwNj+319K7hxFKE3CXY9a4XVDRKqjqrCBUdCclZQoVQ
         93r5P71HtOBl2ddlFulDjzAHgurgKf2XMJNj8fdLLQnJepxuvDOQrF39KSM7at5q3wFQ
         MZO2hYqvR20TbS2ToU22MYumxj6q6eWz3cISuZs5/sMF47fv5liDZACwwBEDvkKZsCsh
         +j28pDvlGBCNcTlm2augwDG97p2EnQNIRYobOxM4TipGAzYA756VKWq6omEQ9mZbFvid
         xL8nHO1UJapyVPwtcV7SB3/5KPyxpj+JLgjiUk8XaByN7mOPUgKAmUQAnHtfuYnqH5U8
         IAIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bZQQXuG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si21947761ybm.450.2020.06.25.06.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 06:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bZQQXuG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joRwU-0005ca-G4
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 09:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRva-0004Ez-Vd
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:28:31 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joRvY-0004Y5-Gh
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 09:28:30 -0400
Received: by mail-ot1-x342.google.com with SMTP id k15so5205631otp.8
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBHI6XnyQBCVvqfjrKwDTVT77lOgCq640799Y784rVc=;
 b=bZQQXuG6RMJvLi6W4yl6iCvmyC+sHMc10E5QKG+mhSDtg/chEf9FIag5ni77/CjD5R
 Otj7rWotZFiu39tgsstMvC/iNaHbefawoV81BeTPhuliWK9yhd0cU6Zr/VIboVdymSnd
 NAJcfxYaQgv8EIjsVb6gLbLLTmzROquPD/YTNlFpWPSp99jD5putitFPZV3g+tiyNhZN
 PdeQ5yMxcN6Jeeje0F9dtHNpHb83H9VslM34Xy1pMUIilj30FthTiM2G/0VUK+OgGw4W
 FDsDPjtSTgaTDeucNAzJZGZlwxfstDwvYkDeVzKYSpXW/D6DFWEtETFILBDbgTFIeY1v
 yGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBHI6XnyQBCVvqfjrKwDTVT77lOgCq640799Y784rVc=;
 b=giufSF6oSk+fyAO8F8k5sonpPvnN8Oopp42bQ2cn6iff6TgrbaK2EHmvQdFYGNbVAv
 Smjqol9hlJL6NOVj7++oSzsc2pZYOSxhlS9cScSjIbGlkZ/8AKUguo1gLY8kCRvqEDNu
 ORi3Do98YyA+Rxi7Mk1NDA6gyiQfL+/XhHuJpvQGDO+2eYYG65bDG4TSuymA60eFxrCw
 gnQUcJvbQSaGbQtgCMdQixqbBWSfT7GH/iTC/8ezlrb/ykeEqTPkzTRepPYR4YHz3vV6
 IugvhY4LRbLQ8PDnVbifPrQ38hxzkeZKUUVcNrulrcan9NK4o8/QmKAp3kPP/o7M+qay
 lg+w==
X-Gm-Message-State: AOAM533pO+mWo/BBG2Fb0lrqAXqj9BI9FzMY95gPFVG9AMbJ8jV3d/b8
 YydD2VfKaNHgO34ULGMLc/gf2YKUVsxotBdEYdJDqeVe1KWQWA==
X-Received: by 2002:a4a:9528:: with SMTP id m37mr27497695ooi.85.1593091707225; 
 Thu, 25 Jun 2020 06:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 14:28:16 +0100
Message-ID: <CAFEAcA-ePgr2OLEtf1nRr_5SduQ0R=ZW__7Zzw81LBHkqgN4wA@mail.gmail.com>
Subject: Re: [PATCH v8 00/45] target/arm: Implement ARMv8.5-MemTag, system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LaWy5RNWv7cA

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 8 incorporates quite a bit of review (thanks, PMM):
>
>  * Include HCR_DCT in the HCR_EL2 update.
>  * Use a separate decode function for ADDG/SUBG.
>  * Use the system arm_cpu_do_unaligned_access for user-only as well.
>  * Fix alignment for LDG.
>  * Fix no-fault for mte_probe1.
>  * Rearrage how tagged pages are recorded.

I think I've reviewed everything that didn't already have review now.

thanks
-- PMM

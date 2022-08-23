Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1750155ejc;
        Tue, 23 Aug 2022 14:53:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5XG/Gg6/iC2J/7rtTgNGNKe0L6Qsk1Yfc+seUdAZMANGeKvFxDS5T5HqQgRgITxf3xXNLo
X-Received: by 2002:ac8:4611:0:b0:342:faf6:351b with SMTP id p17-20020ac84611000000b00342faf6351bmr21343671qtn.343.1661291609495;
        Tue, 23 Aug 2022 14:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661291609; cv=none;
        d=google.com; s=arc-20160816;
        b=TMxWc8sx+bXsWKENsHzV+Amjjr2+zMSH+Y72yQTVC5XzH1wHso/SZ/IzAppH+qDlUd
         FgmhBVw68YNeTWsLflyDhhqbVnmXo4pWGvrkXKIEs1zBwkJeZ+zVcpWeJfcqhsHZYD/s
         1MdNG2diBO3PoUn9KvAwm0MnGerN82k1d1a1E23oG5yGjXFruAm31MLeyoLpD6H7UDdZ
         a7haL86ltI3+bgT62p/iyjqpMLwkgeglpDkW43TK3Mf0bx1L/pDda8mJCsbxvqKvOHKm
         gYiDA7npV0hD8vvhkQeIMGuno7z3qMw0s2SbO9FNEw30gPLI26cR1HWLiox2JDN7z89C
         nagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jnM6VSP/dIqL9iD8qyhxe7atHYA8kITihiv5S2SMqY8=;
        b=sXQlfi+ezwpkC0kRVtTXmPuQaQbrCoyArxS92X5YRczE2LSLr3Sq0+0USEH48yypWI
         K0UxG8X4AZsaYwbu+OpJmym3v5WzVoEOtx1f/9UAOmwGUgkrXn7CCsstWd8ZXfaJunsA
         5QfXcb9ZSLow/bzQ1fu/Ocj3K7hGgTCCbIzEsmO+CXhW/E/BLQYbWGG1FyAGLSNNwtEQ
         lVLxVlfERA2TGYJ+E9cF4Lm79Zsiv8/EoztW648bt0vTayUAi3IR/nFFueb/1Um17mxz
         dLF4r4P9u/4/+fBk2dfT5OzoziTubcIvgVttlEtIzrdHDDz4ukC33dPxgzp4jFR3CraH
         ALhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EqdYSIgG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020ad45746000000b00496b2bd3b53si7207112qvx.236.2022.08.23.14.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EqdYSIgG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQbpw-0002Xz-Ua
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbpn-0002XL-3f
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:53:19 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbpl-0008DN-HF
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:53:18 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-32a09b909f6so415186197b3.0
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jnM6VSP/dIqL9iD8qyhxe7atHYA8kITihiv5S2SMqY8=;
 b=EqdYSIgGGLFlqkMIMm6vk2S+hsdmP0A0SX7igPhxcbQx33Ip1gzEqRMrEOCmRXiPP0
 6ubPeoGFMUljnP1jmvGtM6T41PZ7qEZbwX6f4HboqhKX4jE+PBJNeZPIr3IS3sBfbX8j
 spVEs0eL80k9+JEanYCX/9+ReNSrd/5ePDpTIGpJKWT+mWoB47kEpc9uAQqeBnNyN4SL
 SVzJ20ajTOpYwjshVyFNyOoOBjCJ8gT/QiLc2Cqk5qkPHqx7UGDKDnrDrNGEe3hsSJmI
 J9W+Krd+CKUUCE9GHNMfmH8llf4f3qlIG6OJL7l+bUjj01E0KllB0+RZVNNhpwJv05I1
 Fe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jnM6VSP/dIqL9iD8qyhxe7atHYA8kITihiv5S2SMqY8=;
 b=uFf82zcZUG6hukvvciCuyofyO8C98xPv4Uc1i4w3TqbgTZgMI7EYVVxZWGDq6IA7/r
 HJIG1l1K7m+5IAHyhWhrVdIdCbW5olpYWskQIaaz+QqCu6Mdq5KeB7snJNjIhAhi/McV
 l/rU9jzgS1s4wbL9NZfyl3Y1mgNTzsD+1dLOZVsL8Pfo++OqI+RfDOx1Ycx3O5kfiEKf
 +6RYOOK35ORvwZLc7wBOJaQg7COyWlnS/XDTu9ur4KpxPjYuJSakn1r3SwZYDNgwEJmX
 GJg7zIoLXYNHn4tP1hzSWwZYo0b+PE8L3VEvEfABr5NSYSUTa8Ot3LZU/XBpejTJoxdb
 xZDg==
X-Gm-Message-State: ACgBeo39ON7ZDvYrunYB1JhIukQf35+eBleR0RYmb2ZbdwH4bjuuLhhc
 1NCuEdGCnBRJTIAoSq5oQxkmlFTsqDoCwuqN9wAfHO0yPYg=
X-Received: by 2002:a25:d011:0:b0:692:c1b5:6198 with SMTP id
 h17-20020a25d011000000b00692c1b56198mr26594760ybg.413.1661291596258; Tue, 23
 Aug 2022 14:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Tue, 23 Aug 2022 14:53:05 -0700
Message-ID: <CAFXwXrnQkNSqp1359Eu-3jgfgg8m1Bd_O_p4qPNxWN9zq4F3BA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] target/arm: Implement FEAT_PMUv3p5
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +emcwZCR9FuS

On Mon, 22 Aug 2022 at 06:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements the Armv8.5 feature FEAT_PMUv3p5, which is
> a set of minor enhancements to the PMU:
>  * EL2 and EL3 can now prohibit the cycle counter from counting
>    when in EL2 or when Secure, using new MDCR_EL2.HCCD and
>    MDCR_EL3.SCCD bits
>  * event counters are now 64 bits, with the overflow detection
>    configurably at the 32 bit or 64 bit mark
>
> It also fixes a set of bugs in the existing PMU emulation which I
> discovered while trying to test my additions.
>
> This is of course all intended for 7.2.
>
> Changes v1->v2:
>  * fixed indent error, comment typo
>  * a non-change: opted not to use bitwise |= for bool
>  * fixed patch 8 to implement MDCR_EL3.SCCD, not some
>    weird mix of MCCD and SCCD
>  * update emulation.rst to note feature is implemented
>
> Patch 8 is the only one that needs review.

Thanks, queued to target-arm.next.


r~

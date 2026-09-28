Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EABCA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 16:21:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBE6G-0000Zy-Qk; Mon, 28 Sep 2026 12:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBE68-0000YY-EO
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 12:21:02 -0400
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBE66-0000Vb-Lf
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 12:20:59 -0400
Received: by mail-yx2-x0e.google.com with SMTP id
 956f58d0204a3-67375a844dfso2916597d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612455; cv=none;
 d=google.com; s=arc-20260327;
 b=NpCU33zsmhO5ITolwd9PZ73W/6l4qYfOvCwOb1wdX9VGPMm2y3clkMfQiICUtDIXC9
 tzQ2Fj92qqQ/ycQC5LwuptpUkTckeP+9jabY6PLoFol3RlEcAbrxhSjZzT8Ruk1RQU02
 T1DQnFFduGZFguQKYeYDQ9VpTgeswkDuHrI7vXcVzyewBpUa2l2RzCxCwkZ9JTxTJ1CE
 w1Q/kUnRK9lIU1TZVzq1Z0e1OdbzfKSk77mbu9z3YeJKS8N1pjwiYRnFhvtocq3wmNDq
 Tnur7Fp1jUlRhbioMwnL9T+M3xEsAiV4+fG3uIRRLIeEe0KhC55nM5I8vbqghJaCGPzF
 Ep5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=RTJw5B+x6lAXCJ7HOWk4IWp5t8cNWalFlhNq0MyZNBM=;
 fh=RLPLcvb2XJ30hdiQr1ow44Tg18GJUKdP3jVzL7hodk8=;
 b=pC5o1DycmziEVOhEbOW05Piy2l9IrXdkuBiezgvR0cLYxZ2mC4WUKY8nYGd2IVgHzN
 fTR+Wj5eZ2KNCn66zx8PPob00QLhcNFiDIm+bBXmhlGr6IhOgPx0zZr+Ex1/AFlIv2CX
 9Y0IetL5gDnPqC/u9U/2aaEg01cwLN1smdUtackf6LfcxX3jxxHothPEXR9daCACrF8V
 93JSqvvYmKYH1ZlY5E5J9cs9S8F/kpwhm6fOJphZ7ktA2XXQWFFRLnYE0PfEbAK05adX
 gGWnUiYJrxf2sN+x/THr+QQjKplDIlNA2o429IgsLhiyPTbGD3hPyFPEc7jWIifr20th
 6SKQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790612455; x=1791217255; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=RTJw5B+x6lAXCJ7HOWk4IWp5t8cNWalFlhNq0MyZNBM=;
 b=rtjyEi57dvmieELzIO85EF0stECWwFzBxau4iW89ROU+Wf9jtfWcpzJJ4mpWGNng7v
 LnngiarWGC2JLstulfoAXNSUMt5J/BgUtrVj2wXrjGSvF1jWbJ2DlXhpT/LShP9Ge2uY
 3NvTXiNvVvIF12Ugq9dyQS8Z8cS1eUg66ideQf+puWmk3G7Qx5hJYZLKpt5BU1BU9ArL
 Zslq8PFbHuyY2NGLYvTHLBiDnTpCNUWPWKwivO9eg0gIpmXaQoDFKHAtr8i5G31ozeWD
 8h1vMG0CasvY1DQ3K7vxeT/Hux8xzVp8ohAIrCig1EmimqS3rARx5E3GYLQfx/Tlbikq
 FrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790612455; x=1791217255;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RTJw5B+x6lAXCJ7HOWk4IWp5t8cNWalFlhNq0MyZNBM=;
 b=ctW1e73LGKL/8G1BTczzSnwWzNA/jaEFcOUzW0UGokt5yw5T+oIID3k82j8L7CdtnK
 gQKPkUXVgSmJcOgMZ4Y1eItWAMd9sVHhn520tZNfyhmJ3jIxvRYHJTujGn/7v7kOtBDh
 2j7n6D4xgz5djCsZTwR5Bbi+tsNXGs8iRkTaJ0pwimBcp3S6Hsmx6IRNre/hZ923O0tQ
 y1FFZgj7hKcIwit2J4weBpHtETPKJ8TjPeIqbsk5qO7+RIEzUkTpwlKD5QYFAgWbxkvX
 Z7wYmrNkipeCdUqfcUmSQp9pf8HymR7s6zOnDl26BtdT4BnBbEfNqYosNlhrIJMZ2nqt
 8AOQ==
X-Gm-Message-State: AFq9FYJoBa+3dwGfX8t4jf+p12MEN5UML+uEqfVHEvDiAhDZNhzSuz+m
 Zy/FxXrqv0nJ3J3D55Vc6UAxZpm6UfhkPrjaBxCkxSPbi220qC5k5bKBJ3FJ35CazbZyTWRO8cf
 tx3CXOWwGttHNZvRNqzPQBmQQa6lxZqpmAVYarcjpDg==
X-Gm-Gg: AYBFou017y70tdb0u/mBzjvhp38w8Z3y1r1XQ+9NmRrBSNtdA3icDwrIp/SnkyACr9b
 96VlFwU0rYSBCC+YivMidxo4eEqU1cbBFeohmzdjesXdY+QhZ2X38E9EBvzpcUXqUjLE560dXPP
 rtQpC2kuXtDHrPZKI8tMISmmjsIKaZmbY4rCMfGQGAQyXg/OvJcK3lCQP4NIj354uB85rO1wUX7
 0GmMK/d3eldu+2XKwsijby7/cSzb0ur9f3pFsiRWSb4tFhE3AmNjab8ntZNKknGI0KNtlJ7Tscj
 kKKNj0kpgHx5WSOUWoYLSIFxDR/Rq5/+OXM13GDD+OHs3vVqMlj3hnslXY+pUA/zK3fgVqIQksD
 psvmzoWEmWPnckWjJMnQyCVOSUPEKZNh+zTo4tO0=
X-Received: by 2002:a05:690e:1444:b0:674:1489:803a with SMTP id
 956f58d0204a3-6741489979cmr4308610d50.75.1790612455025; Mon, 28 Sep 2026
 09:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260921074451.3158645-1-fuad.tabba@linux.dev>
In-Reply-To: <20260921074451.3158645-1-fuad.tabba@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 17:20:43 +0100
X-Gm-Features: AclHuK9YAy-iVlwEpYQck3puycnc-ZFlLIiHFWJfBWMV9JbzEXzS41YIVLEVF4k
Message-ID: <CAFEAcA8fWgG3xcQbQy4nt798kaM5RZPdhGhWvt9FYMunrEuHKA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Fix timer deadlines when the offset puts
 the count ahead
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 21 Sept 2026 at 08:44, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> Hi folks,
>
> Two fixes for the same bug in three places: the next-tick calculation
> for the generic timers, WFIT and WFET each treat a 64-bit overflow of
> cval + offset (or timeout + offset) as a deadline beyond the counter's
> wrap. Once CNTVOFF_EL2 (or CNTPOFF_EL2 for the physical timer) puts
> the timer's view of the counter ahead of the physical count, that sum
> overflows for every deadline still in the future and QEMU arms the
> timer at INT64_MAX. The first site regressed in 8.2 (8d37a1425b99).
> The WFxT sites have the same overflow test.
>
> The KVM arch_timer_edge_cases selftest, which sets the guest counter
> to 2^59 - 1, hangs in every host mode on QEMU 11.0.0 and passes on
> hardware under an nVHE host. With patch 1 it completes under nVHE and
> pKVM hosts. Under a VHE host its physical-timer half still stops, on a
> KVM bug in the same arithmetic (KVM programs cval + offset where the
> timer compares unsigned). That fix goes to kvmarm separately.
>
> Each patch adds a tcg system test that fails before it and passes
> after.
>
> Based on master (3b5d71cc36).
>
> Cheers,
> /fuad
>
> Fuad Tabba (2):
>   target/arm: Fix next timer tick when the offset puts the count ahead
>   target/arm: Fix WFxT timeouts when the offset puts the count ahead

Thanks for the bugfixes and the clear explanation.

Applied to target-arm.next, thanks.

-- PMM


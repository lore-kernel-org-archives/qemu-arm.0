Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp413274lft;
        Fri, 24 Jun 2022 08:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upngx7L9y0gPuzWAo2Mjp9rp+E0PxQbflei3Qdy+zT56HPUCrxPS9eUqUsYgNOokCF/j9O
X-Received: by 2002:ae9:e852:0:b0:6ae:e737:d8e1 with SMTP id a79-20020ae9e852000000b006aee737d8e1mr9928947qkg.268.1656085129202;
        Fri, 24 Jun 2022 08:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656085129; cv=none;
        d=google.com; s=arc-20160816;
        b=VC/yt+4QPQZP/gn81JjWZDd629BR6N9+IlwHJlOI40MMlcnxazGuN3HFCwqhTgTphG
         vBSUzSOivvuuCAY9uKMXhaErWPf1OBlpHHYVtloLe1C8/V/SvQQSrxziSBEcI6j/midN
         M3tQRoc1/cYZUjtFlUIZ2lCDIj01DGFatNvA7raSOwJythl4A0S4cO3h7W2ixoQKFQvt
         9mui47dHCqjXFdNLTDAmAv9SPYpBXC8hzvAKPG7DiDp/fayHSKkEQKxESXM688LFaiyY
         DH5/Ua+ciR/YR2zA295U2ebm/Hma/B7tEwADUc2l+8aIr47gX4ycGW+kpvpFuvR4YyXb
         vS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Cmp6pTyRdEQS9MnZpBdd6ok0105PVmUMmDnaaYrip7M=;
        b=SiBAQvk5RProZR/V6DYfzgZpBoYm5KkEFh+IIaczPMsTc1DEKzjgLFW1eUcTaUNYwa
         bG1XH08hkHf4309ut3Qi/ZqUPosBMxuLWy/hhFyE9+vL6zbGZQQgwIiBLqPN2NrgkRUR
         +aunEaasdoL+ycuNoOP5KoeDuVe6rpXB/y+A2qqojHxZEJwBPfuWGBUAYWdu8QY54l+R
         t2PM+ZNWNgzNyud+N0VZDCrZiySiMSigvTOxgIvaNnvHYBC5NYA5vwGYQYzmNyd6mSct
         K2SnDhEuQQgNoP5O4/LtcOkzEjMlszsGmKpElfd7HAeSsvvvGJcjnS6BEjtiRjqaaT9d
         EpHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k9IDKPnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020ac86103000000b00306c6e7b241si2129397qtm.667.2022.06.24.08.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k9IDKPnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4lOS-0002TQ-9b
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4lGt-00021O-Gt
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:31:00 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4lGr-000799-Rk
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:30:59 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-317741c86fdso28415387b3.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cmp6pTyRdEQS9MnZpBdd6ok0105PVmUMmDnaaYrip7M=;
 b=k9IDKPnZnWY2XDAlp4gDORJQxtMjKBzZRLFHnZb9WNpucGQaPMUsw08fJC+xFSyvoE
 DKtjHLP+tJu2F0/fZlPB9QK0t1z/NS2LSzjsDFFsRDzDg8pzHnKaBXyOw4138TAMK9tf
 zcbL3tqkfIfeuEBS4inHerVU8HhvWp02nw7J317eBiriAW8gvWWfqYAi2IIWdMMWVdVW
 cVTq5Y0YUavErA3cdr5aaMZww0AjEiJTVg1A7vTvKeWxdCT8gSlOgl/UYUuNfn1OLI4b
 Zy63/MPW53jLLi7pILixis3Vi0/m8WqmDz4ZP/gFa3E8MI1X4yW8ty6PMbQYm/jIe5nV
 mMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cmp6pTyRdEQS9MnZpBdd6ok0105PVmUMmDnaaYrip7M=;
 b=zvac1I67rdj1nLJhxeH5Zi5UTYSppfyGqskb+2x8eetK9R3c0HHfZ4S1i0On880VDu
 eIqqmBXD9KZS0dJTyUwTy37HxuVL/ggHhKYeZ8anDvO4JO81WJS9qZ8cLSGvQvYtOm/e
 33YoBQDkYQ1eBCBPjkdXyT1v1DGiNAlZEYZjxFPxqQ5oiQxInu/TeZuER26bvR/tTyEO
 kpao84ukY1vBw1BiMrFpQPPs/TizwoUngy+cxOFpzxKxRohaN24T1Qgp1EkgtF7YXMJO
 f1RMetTzH7p8aVVNZ8Ew/H3fKFTBheGUU+jagDRGMBWeJG7HKjkujH4s8+JUm92UO3Mk
 Af+g==
X-Gm-Message-State: AJIora8c+66yMBanLr/nxs16667gaZ0aIUBJoKIy4OLxjw3FrtWw1Yk3
 GiNi4jPaz8TCuC3+dtXzc/bZpMJfGDhuNeebIiE+0Q==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr17181574ywg.329.1656084656515; Fri, 24
 Jun 2022 08:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:30:18 +0100
Message-ID: <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
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
X-TUID: LefLDNG0JPB+

On Mon, 20 Jun 2022 at 19:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This new behaviour is in the ARM pseudocode function
> AArch64.CheckFPAdvSIMDEnabled, which applies to AArch32
> via AArch32.CheckAdvSIMDOrFPEnabled when the EL to which
> the trap would be delivered is in AArch64 mode.
>
> Given that ARMv9 drops support for AArch32 outside EL0,
> the trap EL detection ought to be trivially true, but
> the pseudocode still contains a number of conditions,
> and QEMU has not yet committed to dropping A32 support
> for EL[12] when v9 features are present.
>
> Since the computation of SME_TRAP_SIMD is necessarily
> different for the two modes, we might as well preserve
> bits within TBFLAG_ANY and allocate separate bits within
> TBFLAG_A32 and TBFLAG_A64 instead.

> +# These patterns are taken from Appendix E1.1 of DDI0616 A.a,
> +# Arm Architecture Reference Manual Supplement,
> +# The Scalable Matrix Extension (SME), for Armv9-A

So the thing that worries me about structuring this this way
is that the SME supplement appendix includes this caution:

# The instruction encoding tables in this section [...] will
# require correction if subsequent versions of the A64 ISA
# add new instructions which overlap with these encodings.

My guess (based on how the H.a Arm ARM has incorporated
SME) is that these tables aren't going to be included
in the Arm ARM and updated going forward. Instead the
behaviour will be documented based on whether (existing
and new) instructions call CheckNonStreamingSVEEnabled()
or CheckSVEEnabled() in their pseudocode.

So I'm a bit uncertain about how awkward it's going to be
in future to maintain this transliteration of the SME
supplement tables into decodetree: we might find that
we have to look at new instructions and kind of
reverse-engineer back out any required changes to the
tables here, rather than simply "write the trans_ function
for the new insn, looking at the pseudocode to see which
_access_check() function it should be calling"...

thanks
-- PMM

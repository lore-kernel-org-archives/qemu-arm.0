Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2369ACD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 16:41:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ6Sf-0001oz-P4; Thu, 21 May 2026 12:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Sd-0001nf-Pp
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:41:27 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ6Sc-0002ih-AH
 for qemu-arm@nongnu.org; Thu, 21 May 2026 12:41:27 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-65c21049dafso5726846d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 09:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779381685; cv=none;
 d=google.com; s=arc-20240605;
 b=fcu9Eus9jtgC4Du34cQ7yX0oTcwaF9f6tMp8/JcNxe6aO+Wfhf+BHC471vVCffLndn
 bJArwId8KjjLFjkHNb0IEAx9mXBcfGoOdxSQUVzgriqZdeXPX1YPBCjp3rtQKQLwGlVG
 sw8SYkjGgh0Ueem7kDC5I9sqG6AFBd7PCDRo5kKXte0tYCatV8dsqwOFQFIz/P4w/E11
 wlrlC8o4gHFyl5tmg+QGP3Rnqg9fHph1MxQMgaDABVwAyNayhSYsZ1sXNlD6U1Qr/o+G
 nFkU5DEpEaC4tWhFn1w1CY0Bm08vVieZbgGQD08gCFbXCI58g/M36laaGFzxtrH07NUN
 RMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WZGcVxrAD8TQcq4nZQsOrHA/qVqTF0GTWDQgd61XImY=;
 fh=4nD0EAkKmdq6obF3WZJmNhn++QJ/owmGfM+OsbRdx9Q=;
 b=WxD61LCJeZsJbPfNMN1FZSlPKw36751aRt+oqjgkXiMwCojl4fmJZmOr5Rg67uI/vZ
 DMjCFxB7xgXLcryYeKNVtMxfxHZ5zNCpC0tdaJVMVhX03x6zrcOPiugBjWuuwUohugkb
 f2r/ypdbuiKLdDtqFdbJqm74dwkd6+P3g3ryTTha9mPwWS8zzIVvIZ1tbrQT2c6B5Le4
 u4/4G87Ib+OHQ55+99reot4kgdsNcXV0IVEEAaAGMVhXmZBfejR2+ctdLEcCXLVB6EWx
 fUZnTPT55kIb/ExiE2RGB1mBTgFjXj81Zvofg54PmuCtmyQuGuBo1fc9CT3MtgV0mgGH
 SLcg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779381685; x=1779986485; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WZGcVxrAD8TQcq4nZQsOrHA/qVqTF0GTWDQgd61XImY=;
 b=K1ht0MLF1VHOPOG4UHuR+jJ743TI1T7yMJfv6l6tcRF4DavxXa9XVr61V4hrLckwPd
 TeF6AX98ikQnnJNiRWc6YANvl4wk2BELbTRfb5NDff3YnLLsi+57pnvuwXOcQK05EDfl
 JXJJ6N4VT7FSFodkUw7aTXab+XKRzF3g8M4VkzjgQ4dslBE/MixER/jfh2RZjncyOx1C
 4WycRfQ/jPQny6/3yLhd0EBW8AXbg2Mt5Q/0YnoAEOrCUc/EoUM7qVtuSBqutQCxDR2F
 xnWUtbepgnzxpwWa7BdHI/p17gczS9EVwDzJ6pX/NjCDO2LIZDPA4Ulec110VPbr8mIf
 MJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779381685; x=1779986485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZGcVxrAD8TQcq4nZQsOrHA/qVqTF0GTWDQgd61XImY=;
 b=LWN+NwI60rF+yGXUZgWKLgRRZrgBNXHKUVZeDnLHs/SZIxO+TLeLM/ckSdpLinp/OS
 v+ZblNDUnAHwSKRUH0Jt+UM/mRgMQDXK7PW8o5nhauLMdzjk7I8STvfvdGnJ7T16JU/V
 /xaA6Y9Qjnz92ncFZvBMLQNHF3KO3z3ReFM9yKNRHHLUpwJ+7CFa35LC38VPVfgPpbMq
 MssVsv6Mi1cs/C45srAT/tg+DIGHGErZdk6IuF0p2PjUdNqZI14ddBLddMBys7PNQtKG
 FbNfK4PyHbXSiT8wZCzaFRGI4xavLgBprWRnWgPfmUfTqyFc+qlRJSDCCgsargPBYzu1
 oygQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dHzQ1LfwwQvb/+1refNrB0guTa1JWw036ExeXIngNWOHOcvh3rX+pTEIfgczQ/CG5o/7Fy9Ha9w==@nongnu.org
X-Gm-Message-State: AOJu0YyJYSM0IKKc5X8ClXURMz36rIna9hcx2unE33fnYH+HQf0c3FsU
 GknAqIxBIe61p4V821APbR9fQWy4JfNYmYXu4Wk4m8ZuGCnUwMi+INzZhR8u1awFr2c+wBaZmzI
 nDt92EIjoTCpLC5FBpqgExGM4RXsoYLdw9JFo+XAy6g==
X-Gm-Gg: Acq92OE0/6W6iC5lhrDcRPsXfUeUXSFB/fyi0UZwhkgNnH5JmBi0PldmcbeDDM5tBMt
 idPB3S6kZibtYlt5QIgBUvxIWGc2N3j35nz9+O2QU9P2tWJ4qai/6sfv28097CoNsAprUxUNri0
 T5xHV15Kv58EOXE+ZjGxsbkWFuhExlSOn1PXPZfMgcrhkLWqHP1Q74TOSbP0kBtWsUGeXa4cxvv
 1zT4O+4a7i6WweLN0GPR4LufVTCa8Zac5ueIMWmgRZf9vOuTsYUxnebkGgBawzv9Y/krK34UL3p
 2+iftkODKPBMaqloevqHWRCJoafmPdPf64D8GqK4wojy0MeCn5zsxbhVNU9W3Bi7TTo=
X-Received: by 2002:a05:690e:4196:b0:651:ba22:fcc3 with SMTP id
 956f58d0204a3-65eae23512dmr2648495d50.61.1779381684792; Thu, 21 May 2026
 09:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-43-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 17:41:13 +0100
X-Gm-Features: AVHnY4JDj1mWacxTuxY8UeafFviEqaeZy6qc2oTWTUMM5HRxn9cV_M8LG9BBKus
Message-ID: <CAFEAcA-fc9uKtfdt_Xq6xfXuxFSRF-Jm4=Rgus4VGiBxJVejdA@mail.gmail.com>
Subject: Re: [PATCH v6 42/64] target/arm: Update ID_AA64SMFR0_EL1 fields to
 ARM M.b
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


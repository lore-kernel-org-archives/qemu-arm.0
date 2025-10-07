Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D178CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:34:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68mC-0006D5-9w; Tue, 07 Oct 2025 10:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68lw-000611-C0
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:34:37 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68lk-0005c4-G8
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:34:36 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6360397e8c7so7299350d50.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759847660; x=1760452460; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=up2pd2h+xw1eC4BsvbiSd4cik8lt2ycq2b2BMwznzo8=;
 b=V6q86VLqkzoicYiF4+KNAR44n1pG3xgZUszAtS2nDBIURyn/SJnjSgUAdNI5zCwwWY
 naMEhpOg1W+Fgp1Z2sEkunjggKdGZ5nQpcHzoylQKv8SNzK4RIG3bPTMCIg+iCvuI36D
 w6o8reBRvCgr1UJ5ptm8P7EvCzZ8p1n8mVxs0/xkBo8r8gblPbdM40VnQJaSUbj23+QJ
 RQO+IXCD3gwMnNJ3x3v2c3VKnPH+sgCRbJiwb5g1GW63o2H42LZYtJLtxDS1TC2FE4EI
 0Tw1bR/p4x75xdkAmkz5om+DRNbu1h/Ecj4vFF1zpupS20WqCAhokij/K3NYXSAukVP6
 GCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759847660; x=1760452460;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=up2pd2h+xw1eC4BsvbiSd4cik8lt2ycq2b2BMwznzo8=;
 b=vWppDKKJeM+tVDqV9TeSZinYjLhgimdLst8sE9ek4kVLquiInxR1TgY0Z1lGQTY/1/
 9ivAzdUG7/MvFT4snXbUuKK+zUGNP7Omv79N6Eh+fmo38M0CMgBlRlJHEXjFw4vFhlnY
 pxlCanSsoeyCuT2wQILTLgwR+MGyCeT3BWs79BBHK93ISBi8565AMSNwNyxqwjSQoE4u
 c9mk7V610vRAwJhVDW1IWSwq2HT7k2qTKxyQ7nxdg9/I4j+1nExA99R4uOjTtbiMrPoP
 zewuzWioBB9WOKHIFDP3BXCZ/rJucE/fEx42mRl41DJ2nc/OtwrHhCth0fgrb9dQ774D
 I/ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXATw17bk3/KwyW4wRVwwLpmuIRwTnC01LFqztPjCqvUaXuw/auQEKlVWV53KDZ58dfge8aGStwVQ==@nongnu.org
X-Gm-Message-State: AOJu0YzB+KY77f9QZd+ZYIIWOuPcUspxbAYx3SNN67Nkwfx+/9gF0QAH
 fB1vrnDhhwhFkfMredyeOHeCZm5JX61YgYisOz2KFQptk9h4kbrMaHb/qQbrBc5BpwZb2AghJ8U
 H1TRIkCNW9xR9cAgOq7h6db1pOWpI3DcSm/uma6BeYQ==
X-Gm-Gg: ASbGncuF/2gLQQ2sQMMrrTj0pALJuR28T4UrljQTmRXlEcqxgyrPaq10Xzn03TYBQ/O
 ehVUUUzyO0EeufnoiUvBcmBeKsXbE6aFyvSpLhgTVj8s8erXj/jM/VQr6QVM1fUDLtZD7d5LKoS
 wBMLa/6u+fNp4T1CmS6wJA8Uf+H5W/cMvKK7g5X1wh1Fk14+Hsbnge2oc2MRI1qVowxTryaWI8F
 Uejgu62W/yS3tFP4+zryJ3Wv9StSseqv2pqWV/fNaflCUs=
X-Google-Smtp-Source: AGHT+IEus3RbHlNqq6rk6mGzCzdln51dHABWNqkN5+MtEJEwGR+B/kB8Tjg8+RnCAOA9eXK6t87ikfky0AND5yK7XOQ=
X-Received: by 2002:a05:690e:1552:10b0:636:1fd9:d64c with SMTP id
 956f58d0204a3-63b9a071c12mr12573769d50.8.1759847660445; Tue, 07 Oct 2025
 07:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
 <20251006001018.219756-4-gustavo.romero@linaro.org>
In-Reply-To: <20251006001018.219756-4-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 15:34:09 +0100
X-Gm-Features: AS18NWAblrMYWXxraQ7E94kBiphBp35BbAPRRhJJqYPBDjUQzkQQfH-4mzlT6rI
Message-ID: <CAFEAcA_p-zJVmEGujPamQgecuoPENKG9ubi_0xAc42UCsMkYpA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] target/arm: Enable FEAT_MEC in -cpu max
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 6 Oct 2025 at 01:10, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
> first step to fully support FEAT_MEC.
>
> The FEAT_MEC is an extension to FEAT_RME that implements multiple
> Memory Encryption Contexts (MEC) so the memory in a realm can be
> encrypted and accessing it from the wrong encryption context is not
> possible. An encryption context allow the selection of a memory
> encryption engine.
>
> At this point, no real memory encryption is supported, but software
> stacks that rely on FEAT_MEC should work properly.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-ID: <20250711140828.1714666-7-gustavo.romero@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


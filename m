Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp198357ejc;
        Thu, 25 Jan 2024 04:43:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5JrAyj20w/NxHT9UErrOGO6bTSCHzhoAVBl+rGREWNK0L8ZlaKnzy7UMu5J1YQ1Xv1kx6
X-Received: by 2002:a05:6870:420e:b0:210:b1a5:9c9f with SMTP id u14-20020a056870420e00b00210b1a59c9fmr672271oac.49.1706186616313;
        Thu, 25 Jan 2024 04:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706186616; cv=none;
        d=google.com; s=arc-20160816;
        b=eP55gKziUfmDRd/SabDokxFR4j7pOntHgMHnta/tSB34RaqQlioyajfnZhIbu9xt9Z
         mhorWloZ7PtHm2mKm10enPMrINkbnDM5VpktquVdyyk/7QjU+qMDwAR+R26bmHnijodf
         hJaKwhl4/fBrT1BTrxKKtuyqwdshZAvuueapucRx4U5hI5hxc8fzjmZlMOAlpXk8r551
         D/JNmueebcNSHlxOT93q7ukX1JOLAGwd7RlkORAdTDD8jwJEy6zatyHGeOdJY8lNr/5J
         25xs6a8DlFrWDlEL3/YLURTKLTug1s6GnzFh14x+dybvX+fIASKlJR/2vE5nqDeXWENF
         LvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZBo2p2FT+kQJVb1ClssDnQgpm0jNvb9prJhWz+pDlgs=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=U+yvcFiviuvtfnY77vMnRRBE9qF01FL7Tjxk7X7EyuWcAQ2KO+loLU1Sb92MoGTcOw
         g9lWEDwNA6uXumx7ViVo8y1/8BjX5qFECUJBovHv0cJ/mTb/qpHEBhTSSCA0I/Y4tis/
         fFKvvpkDEfrwxCM7fOQEfCHgMHoYaPxp7yJ5DWW37en6+nKsO03gufD4W2WBOLutrKsK
         y82L68HeXNAXMQ6Tm+R7zQUGkb+Dd3isHg09ut7hX6AqUp3Ps80Blni4vdw+vW4Tz0g1
         lIRehFPyjj/Z/hfD97ZbxISn6G3VeoCEsfabkRMp+oiPdRV5mC/TtCuBPb5MDM2Lmz++
         fqnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/Tcl7z6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21-20020a05622a035500b0042a6cf8c5b9si907209qtw.536.2024.01.25.04.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 04:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/Tcl7z6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSz4g-0005cC-H0; Thu, 25 Jan 2024 07:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSz4e-0005c4-MW
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 07:43:16 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSz4b-0003Ut-3o
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 07:43:16 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a354a65afso5890867a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jan 2024 04:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706186590; x=1706791390; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZBo2p2FT+kQJVb1ClssDnQgpm0jNvb9prJhWz+pDlgs=;
 b=e/Tcl7z6W4mRpP66lwCByIXf2b7d3wQ3x/nwA5G4ugfa/UqpGyJpLujZoX54GfKpQB
 9gu+iI3wqwPR3bViiyzCx5GmG5efcXNJqUINIt0/xrXCxPRzWqaYzv07hUX73tCj5I/Z
 I6mPVJSBPK5I5+7p4X9jjYHUAovVIYu5jV38NASMqKHhRb8xpuFV4cDOZb1lU41fG7tQ
 fTxvTxGBKS3cNV62wSuJLu0S0yfkp99azbHgOpMPay/rZYCK4Kjr5wIeKG7F+vuRwpgh
 EIaHdZbwvrSAJ88HswnH7GYxLrWxrdRJ2SwKtsL/li33FGzH+QUUD8NXvIzUYx0dVmfj
 HdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706186590; x=1706791390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZBo2p2FT+kQJVb1ClssDnQgpm0jNvb9prJhWz+pDlgs=;
 b=fmzNlNWyhRl2Tf5rVWc8+e9rX2TKgNWzF6n5wqPyR4NuT8rDngkcEkcprF6uleqSEd
 FmBP60SP03k35WHFlnAz1Sv/XKp2hRJW84pZ85iPGkgZZLJTAqTlNFcTr6vwSaKLRd5f
 wnW2ebvpLO3d9ud57fThDKTlAR4AVka4ieBpDufd/YiQf6MBt129GUqoziXk9SP1ofjj
 oVB+eIN1AOBE5SlPfVjA0X42zJI0Shn33E4OS3C7rVhhggdKYIcCuiy1v+YfZB+jGZMl
 GAdAFJAYxeB2fOzE9S7yjjljNsM/F+tM5TEdOx0IDIKcEcTW97QRWnev0MR2ynPxHuu8
 dTbw==
X-Gm-Message-State: AOJu0YzExQ+g/hGZSDDPs+/M1avhLeofiiI4NhnpUr8Z08MZO1z3OXPP
 wYbWAxJD+lsK2VHQONA9p1oQgCc+mWLdT6zleUsT8Dn8856z9/jw4HUj4vP0eVcJZLyojkbiPFT
 TTJtw6ZUvjrF+QgiU20lUlITpiq02xp7JSrwAag==
X-Received: by 2002:aa7:dcd3:0:b0:55a:c0e7:1e03 with SMTP id
 w19-20020aa7dcd3000000b0055ac0e71e03mr627592edu.71.1706186590082; Thu, 25 Jan
 2024 04:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20240122173706.4019545-1-nabihestefan@google.com>
 <20240122173706.4019545-2-nabihestefan@google.com>
In-Reply-To: <20240122173706.4019545-2-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jan 2024 12:42:59 +0000
Message-ID: <CAFEAcA_nvmAvoDvxabkbrkghAY1OwwNS52-ua1XeEdFPmvTqEg@mail.gmail.com>
Subject: Re: [PATCH v14 1/9] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K33oC70FdfHF

On Mon, 22 Jan 2024 at 17:37, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> The PCI Mailbox Module is a high-bandwidth communcation module
> between a Nuvoton BMC and CPU. It features 16KB RAM that are both
> accessible by the BMC and core CPU. and supports interrupt for
> both sides.
>
> This patch implements the BMC side of the PCI mailbox module.
> Communication with the core CPU is emulated via a chardev and
> will be in a follow-up patch.


> +// The device is using a Little Endian Protocol.
> +// If running into errors, please check what protocol is being expected.

(1) This is not the right format for a comment in our coding style.
(2) This is not sufficient to count as protocol documentation.

The protocol should be documented in enough detail that I could,
by reading *only the comment and not the code at all*, implement
something that connects to the chardev and talks to the device.

thanks
-- PMM

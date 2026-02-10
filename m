Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1C5EF06ED
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 11:48:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpmDg-0002m8-Sa; Tue, 10 Feb 2026 06:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpmDg-0002ly-2M
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 06:47:52 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpmDe-0003si-6b
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 06:47:51 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7927261a3acso41796427b3.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 03:47:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770724069; cv=none;
 d=google.com; s=arc-20240605;
 b=WMFNQCsV/I+RJ7z5GG8a2i3hfK+m9XRLH52GHI6KJIRSHKYBCgs6zoJvmaaezX/3kg
 z5w7rGBVl2IxVm0OCYzyGpqt8hZmuEJ625TxswqaRm4+uHAbfGeOqITpY5tJnD0jU+mK
 IHjg3G1YdfgCUfX9hqGCUlW1TCBnt5CLQgI8BrIwQn4Xv3OMkdGEdro8njfmrLK4858A
 JA2XloIQ0a4c60NT8I3dydF5ZQat4IdFogqx5r48ktebU52AldaCcSunITyXxwYatWIl
 LScNFHF9VJrgaUU7YcEmaMo6HBbKqsrR1UqbRLcPRdTYKpTokpnk9d4St3keyH4wWXBK
 wthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NbYdlMKOlPbPQEzXWmVw5X1Vspmiq+h9MkdYLhOibzQ=;
 fh=MUUTud3Kuq3pdKrB/VAD6bPR5OmBzj1ZBxmqHq+f8b4=;
 b=On7iRSDmM9nIG6w0e9NgDnXhx2wBE78SxTLnYeuOytOBP4f4qpLc8SwBgCS8Jl4hWE
 F+jz9amajMIAA4viFBTho/1OE0MZu3djDVB7Uq5lPw0rpRkSCviHCmKcHiQWZ7awJK1N
 HylM1vEHSa1JNPPtUqqsTQShCAmnt8UbaRtV+PWzjA2ZQySyOGQGiCftvfCeh/JKunpz
 70PmzpZqm+rCd1f3va2GVrgdfoXX3mjF1MA7+x4NPsgSTnCDTFvwRKf2m/hd6lNciqwv
 l2FMEZx6/py0WkjQKnJwQn+8GuXsjdG31uCTs2zKYus/uiHY4RaMg9jFzT5HjoCsdk2R
 oAWw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770724069; x=1771328869; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NbYdlMKOlPbPQEzXWmVw5X1Vspmiq+h9MkdYLhOibzQ=;
 b=ePPlwP8o0ro64+MkEK4Rs1BKvebbB4ioLdVtOdeD/6o3kngMhCkDHuTw0tUXcgl9eB
 NBHV70Mpcuz6URLibtngCEWMeraXMQ0I4HZN/QYLa04L35dwcGS7fF586uQZ08+0r31l
 Vs8+vUqeOjObOTGlOzLFbmgPeK8rM0b1qlewoUcO6GVeELKno9szjWJ0XN8ymtrKzSzz
 l3MGGVToTSqxS2xFIfodZgi74S6WY1T/7Kb1sOVAIUQf7JOy8m9srGZuxS5m0uW/Igl0
 tEOWaLGcNzYRY44ObF2p0YDP+zGhxy/pws8cSWo2yhx7aTpoBVZLjId0cGFgKk2RTPDi
 N0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770724069; x=1771328869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbYdlMKOlPbPQEzXWmVw5X1Vspmiq+h9MkdYLhOibzQ=;
 b=Z1SQhwFMHgcxh2PyqeNitZQ6TFENgQSWgBXPAzgyl8TbXA8g2S+uVSunKVr/eZZD1a
 7JVNalQbxp2wP0EOljd2HlH8etXo9Bg8lJHKv7GoeRgudRw/PiXdhlGV2ljBFYQydrYs
 b1JEndamIhVX9J1StXiQ9YejytamxQgJMQabJsUiz0RUbgfkIav4tIAXRNzxiKFA50B/
 BfLVjvvWFpXPvofjIKJtA1Iuopr8yoJJ+utdg0xHybso4JpUU/mQOIB+hs6KMPsP7aRh
 BPpAnN77Q3PxUmjWTO5w/OdlddAg/dERAyZr2FI+8nWiG+vC9rRVj0aHwJM90G0zB8fR
 9bVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSbvzwGt0hyLXItDXZRqm8/xRyebfP6yImnPkS3Sv6KHdzKCrVOWjHRcEIOW4iU0JkGFd9gV7pDw==@nongnu.org
X-Gm-Message-State: AOJu0Yxx1pNcdtpc36mWHDY1lRA0XMCJqJ7ok13HvrnkmF/Ay2ii0z9Z
 AHkn+MdQfHOnw1nNTnf7rVTc41NIcAQdSFsi5WblPO3Z/7V6wNBzSIxGjgPfscJd7xgxxI+xCuM
 +G+l/3aZjMQ1j0ZCNM45oWIWcNN75HuTl3ZTu0HdUKA==
X-Gm-Gg: AZuq6aIDdi0Va9//P0mn52vDqtXlrzLb40McOZZB58trvb2k6zdivkgBi+FQinI7ghj
 aG7HJOHvvk1r65KhdWXCoNs/n7D8czvlYsRz2V4hXjpbAhxCeoG+uvbWu6og+yzkStEnlqzVPMN
 r0YfOesbruoCeWiHJlTy+W+EAEvtoKCj3Y87Irje1pSgLpoRm1C5FQ2jWyRKdXAGbcjIdSmHDek
 QsK3TPTfduKmhmw+YCRbMyLPm/fjzkCaLpFWO40bAonL4sIHxujZEePzvH/F1FlI5H/CODcQ6RU
 lw6BnlmvfIzfRkTIkATWY8g3KuqE0dO7tZEbNvsSKKa5lOVNDQrkOyjjj6WJZlNimQY=
X-Received: by 2002:a05:690c:9b0a:b0:795:616:434e with SMTP id
 00721157ae682-7952aa91578mr149545207b3.16.1770724068943; Tue, 10 Feb 2026
 03:47:48 -0800 (PST)
MIME-Version: 1.0
References: <CGME20260209052236epcas5p4039ffceb22c042b5d12a01f4694ccee3@epcas5p4.samsung.com>
 <20260209051931.122531-1-ashish.a6@samsung.com>
In-Reply-To: <20260209051931.122531-1-ashish.a6@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Feb 2026 11:47:37 +0000
X-Gm-Features: AZwV_QgBgcew-j9MZ53q6g33TB82NIP2KESM-C4bGUELvk4NE1LyCMIEcII17qo
Message-ID: <CAFEAcA-v3WMkmUu1dhOpL7g-x+Mzy54fBsj+rwBHKvEW_BNejA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: Implement WFE,
 SEV and SEVONPEND for Cortex-M
To: Ashish Anand <ashish.a6@samsung.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, saurabh@samsung.com, 
 vishwa.mg@samsung.com, y.kaushal@samsung.com, ashish.anand202@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Mon, 9 Feb 2026 at 05:22, Ashish Anand <ashish.a6@samsung.com> wrote:
>
> Currently, QEMU implements the 'Wait For Event' (WFE) instruction as a
> simple yield. This causes high host CPU usage because guest
> RTOS idle loops effectively become busy-wait loops.
>
> To improve efficiency, this patch transitions WFE to use the architectural
> 'Halt' state (EXCP_HLT) for M-profile CPUs. This allows the host thread
> to sleep when the guest is idle.
>
> To support this transition, we implement the full architectural behavior
> required for WFE, specifically the 'Event Register', 'SEVONPEND' logic,
> and 'R_BPBR' exception handling requirements defined in the ARM
> Architecture Reference Manual.
>
> This patch enables resource-efficient idle emulation for Cortex-M.
>
> Signed-off-by: Ashish Anand <ashish.a6@samsung.com>
> ---


Applied to target-arm.next, thanks.

-- PMM


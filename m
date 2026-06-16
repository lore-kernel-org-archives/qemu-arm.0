Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B825CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:24:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTla-0004TO-F4; Tue, 16 Jun 2026 09:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTlY-0004Si-Ah
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:23:44 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTlW-0004fq-Sk
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:23:44 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-662bb8b1f93so577804d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781616221; cv=none;
 d=google.com; s=arc-20240605;
 b=e0HxMuFh1ZoH++vtW3I/1qYcRcpkPpMEvNsniZF90C7YSPq9oDSKLs7JibaoITKpFe
 xaH1IpQX0LbtiAmAsZj9+EfoIca74f05OCOPuG4cGVUAujVUN8XwaWSKvH3UKWDnmwp0
 1PBdLg9mYTmFgbIfQkcG7MCJ3EkT6m2NUSiX4VeJuwHXl+hxFx53HStgFFnYQCOIIw+e
 SZ2bMqD6SPRn8rs5nr96QuBG4uB4NffOjzlavyMB/5XiDkC8nzZ1OZFnHyDJo1hvX73v
 qrjG7LNDoExQU7wksyl8a5xu8jQuSoFd9+n/8A7yRAkJ/aoDIepnFUarLPWkIVn+v/On
 Tzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FBxRE+w7wp8sxW0dHD4wgoXUzz5Cg0aGnuonc8RhnpI=;
 fh=NGlB8MOaR1ln7lNO+YHU7Z3TGk/+M5ioGV0JpPRbBSg=;
 b=Ds2IMCGj4Bu2GZAeHqXqcThtj0oU2MYDkcsNxKlbnjBmx847NPVAPqsXSdeGxngQBM
 IQRdLkpspl04tNLcjRitYUTy+8Zgj+WEjA5wxzBmtP9usto0K0MElbl6w+R4rPEB67zh
 rcZGTlZEc7FdkGMo2l4okz1KIuD4wWgL87T9NIkEZJu10jrlwYbVmChOrY5om5vGZ5Y0
 KOiHOpMmEWphDO2awMkxq+/+4ByLrp1u08J/uxQTfuoOoaXF7qqt7qAszX4Rp7ZHCZgX
 yjxi1Un9l2xfXIe+BdHPwbbcEUSGFT5n0SfFjZwsKqCA6sGnrLM4o/amf8tpMNdPVlGD
 ycWg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781616221; x=1782221021; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FBxRE+w7wp8sxW0dHD4wgoXUzz5Cg0aGnuonc8RhnpI=;
 b=UKSUhc73R2AkAKZB5LKXGpk2Vd0pkDjGxKbSuKr8/5tczBG3aBQVWwP86itZnNSX4E
 +K7yD1yaRQH2Ucb1RnAGoiHMd/mQbYaPBw3wbiPyeuMlhFsRK2Y5O9yVhxGZcHGxkBYM
 leWlFjli78cdLYJh5u7rCREh7Fof3ILewBNCJBC00u+DIAmVY3FNqML1MC058OUoTlFx
 43LdIwgewKD5IM3Q9JZslLTois3vosl6FpTxF8OF68TBDxnYnWM5gCNDef5YUjcKtNdz
 URJKjzWDnXUPJwiavInANd3a09AC/6HQNZ9D6umtLACm8p8vBMtLVZiljjsMQYtp5FJb
 hksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781616221; x=1782221021;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBxRE+w7wp8sxW0dHD4wgoXUzz5Cg0aGnuonc8RhnpI=;
 b=rvZ872Yb5w8JYUQUx+LxYhiUNr7pkKA7kMeknYarSci0zx3f9eGvyk0FFBUtEADX1E
 rVjNN2X1S2YQXj02Makjvq5VPooU/aj4b58pm6fWjadNu7d+VD8xpqFB1J1DPY7EyAg3
 7YUqqvpEuSQ/UpBELfCEee8NPI8Sq4rOpwOph9jT+6/XWQ4yScsPoibu4rvBBKQqzw1z
 eht95lT5Q8uGJi2wQvhIvxaD4nij3hYVSLoEJdmlWGBzNBsBpbOI52EN/PZGYEL8bgnx
 lptxzMSon30g0d/8k7Vn3rdAOnOW+dwI6mK4GB790Y0ImDfqHp0v+LcP33ufzdyYA0hT
 Xqkw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Ld9DNoN7/cMHgi06jE70JtfdaOPUrplKMBBu9Jr9247/mWSl7mu+gkLUUQEfIAW6FTQXItwhJEA==@nongnu.org
X-Gm-Message-State: AOJu0YyjsfZdeqlRHXV1OrdNOL2wwECY+hEtPAXZZiDcpS8MnAsIE5cq
 6guZo02Tl1SALAfyEf/mJ6BlcMwl6j7VVuJEwjfCi+YX8fGXzjRS2jgA7nh1nNaT2ujfumuJ8jU
 qSBGJdp4hA58USp50uSmN6rvILizC4zq0wRdynZkGTQ==
X-Gm-Gg: Acq92OGoLNKE1NJNlCGru6tpn0jneS4kGSmdQFHv74/1Km6pfSN24ee75K7S3MRQe18
 pnSJfDEJqAMOLzo8rvh+ZuK0uz3/CpPcb64VwM0MAhHXQMYjxwPRi/zvA7oZ4OMktSbiiWTCS+U
 3WLyvzWLeb/c9aUWDBlXG0Cm/Wc+baA9TZ+Upvy0NhY6yD+QAFnU5LA2/wUgP7np+oZVo4cBXoF
 hjZaVPm0F8sBv2kZl6jpcTkPFxMDeDbE/8fFs6HRpo/a3XXPdMI+19kLi6R6WDlOT4ekxaQqtyx
 j8WkIIFQLoBl4JVRq7q7DbCX4PJDzYxSeAotWRpJrZ/sKUr5IG5z9qKd6Wim9T3hZnE=
X-Received: by 2002:a05:690e:1241:b0:660:54e4:5dd1 with SMTP id
 956f58d0204a3-66278315777mr15055171d50.44.1781616221475; Tue, 16 Jun 2026
 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-19-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:23:29 +0100
X-Gm-Features: AVVi8CeiKpg4KRUsvuG7MfA1w97L0NvIirYypfK4Tud15FwrLiu0Ea0B7zAHL50
Message-ID: <CAFEAcA9=uoJ4NsmPQyVFr6XXxDoG1qHz93Eb-i_mu_pXo3XVCQ@mail.gmail.com>
Subject: Re: [PATCH 18/25] target/arm: Implement floating-point log and
 convert to integer (zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 5 Jun 2026 at 00:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is FLOGB, FCVTZS, FCVTZU.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


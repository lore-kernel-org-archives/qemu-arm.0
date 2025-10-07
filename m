Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014F5CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:33:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68ko-0004Hv-QC; Tue, 07 Oct 2025 10:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68kj-0004B2-EH
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:33:22 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v68ka-0005Tz-43
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:33:19 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-633be3be1e6so8725197d50.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759847589; x=1760452389; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eUcABolmLKzvNvBfTunUMJPXMrj4PmRsjn1sU0BBoA4=;
 b=bIpYsBsAIFmILG24+M0Sve0FKfdXajXF4sxISCMR1SplmnhpqbjRFSv5QB0MPIPGM+
 d3CPFD//EW7HZJdQM+bue+45gwiCzZ/5hnlyugoMAN4NgUk0Xi1QeA38cAKLmYKyTAM+
 vDJTtb2gAEvwDZFfTF0DcLgG0+8b/1Arve+ISBAjPZg+ET3CRzLGp8Q7qlZhKJIg3Uni
 dmZKxwgPHHKOJekkNpkab6MKJZhcaKnUPIqDtbj+OSmJMip0XtrMtR9/sPAIL+VYu++c
 5OoVOkQs6PnPBUHvV59XqGbJBXtNk3gMo5n6AzmzrHFaGWQ2djtulDcfKzVUJn55ju+X
 TGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759847589; x=1760452389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eUcABolmLKzvNvBfTunUMJPXMrj4PmRsjn1sU0BBoA4=;
 b=LgFcYgSnn3kjffP5H6oeUTAB3Lluj5snyzm0vIjSt+r7tZKusxW+JB8eEhYMheIaIJ
 7AlrJdzwpkChCgHWtnMGA++kGBN6abfXwDntaZPMSryl1DeON+5WMYFgHiGct2y1EWxx
 vJqWgqhhXuudzhs0kL3IhegUO3GevPsObPG9w8X8EVaHGa6Wf8sHx702+kX7iXz22u2+
 8l/Zz0gmXMW4ZN77w10qbCUlTIs/1LgdTIi46Cr1sFnbvvTGqTxDc9dhonSzE+7p7xlp
 Cv8FT8D4sStjgLUbbtDTisl0eMB1UIn8bBVSjTXng6W01pJ/WmlnILX8/72AhEo8yV+8
 QY3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL5zXIYRW/+01RiHkWst4EsIHVkjsZ9VpeB747xgIfGV3Pfg72fFPKCkC3yKygGr8Sepw9RBWpKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy6mPEV2dCcC39xHJ9Sl5TUMQ7ykfTEdi7VS/BWEKep9bz0u4zB
 JTYDzRGwD12Oq1znFwt8t3p2uy/AgI0B5oH3GIblIhnp5ZNbhOY/a/JrYq9fqF2VFzP/EGHSgse
 RYK4//p46yn8RonUm2+xUpFt7wbcHShNSg0Ay3yBrlg==
X-Gm-Gg: ASbGncvv/f7YCzN7ePv464SFnVs+e+j0cbu+yDTnIJ7s5wkAgYzOT29XWGDZMu8TaDV
 uM/nERit/rLVRl7xjvNharH7z0TmGv6lYeQm3UYPB7B09fJmHHdSZi7vmzVFAJHDxAyoUFdpaEL
 lKyNurhN4q6TErtD2CEf9p7EzXWDHmt9K06ZSjYKd5Gbk4NxMcLYleoMsiYCLkNftjTJQ3qoPqz
 jOL4qMfId3Qq36lPEpizGTak8xx8+NgvCSSiyZS5DuAMJg=
X-Google-Smtp-Source: AGHT+IFfE21W/JLI93Q6a9rkf0KZ9VukKWRMLNXtZJvq8Elu8CEm3qSCdIONhAXG/y977K3A39YC3QL12DJbA/Brh1w=
X-Received: by 2002:a05:690e:4319:b0:638:aaa4:ca7a with SMTP id
 956f58d0204a3-63cbe09ad62mr3318193d50.7.1759847588629; Tue, 07 Oct 2025
 07:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
 <20251006001018.219756-3-gustavo.romero@linaro.org>
In-Reply-To: <20251006001018.219756-3-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 15:32:57 +0100
X-Gm-Features: AS18NWAivNp8IvBhD7Fg-5Q77bPPtZbrzfVrqCszjuG-WOgGUV0wDKvGQw-q5nk
Message-ID: <CAFEAcA_mBh2GeDMXG5b2GAbNj85z8g7bZicxdiyH6jogndDHpw@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] target/arm: Implement FEAT_MEC registers
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Mon, 6 Oct 2025 at 01:10, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Add all FEAT_MEC registers.  Enable access to the registers via the
> SCTLR2 and TCR2 control bits.  Add the two new cache management
> instructions, which are nops in QEMU because we do not model caches.
>
> Message-ID: <20250711140828.1714666-3-gustavo.romero@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> [rth: Squash 3 patches to add all registers at once.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


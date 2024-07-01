Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1308974njm;
        Mon, 1 Jul 2024 04:49:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwJGOUMXwXKBiz+muK7IHnfyJTZDgV1DctUeSYHJ7TnHn45J6/IoE9Tsns5CB1cLCs3+JeDL2PfUzKRwMddA+0tHIL6BIy
X-Google-Smtp-Source: AGHT+IHnEOubws3EvARY6MsCTUFYS2ydpYC/XdQt75nbqgcDFPDqGYAIZq3fogVmuv0BdxsGfrlK
X-Received: by 2002:a05:6214:2122:b0:6b0:7ba0:ef67 with SMTP id 6a1803df08f44-6b5b70c09a1mr75066316d6.31.1719834575510;
        Mon, 01 Jul 2024 04:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719834575; cv=none;
        d=google.com; s=arc-20160816;
        b=nxVXeGCl4cwVMwPELxu3HfqcPBUmgFR3kBgm/E5Z7TSQUr9BUtT47BIoKGrr2GxmiB
         LXZg8ZJQSYjy5hOzg4oolXu6AAEJ7g9IlmKjb+Jt0rWAw6NDE6u2mAHesRXLwKmHKJLU
         01pRiZ++Mf5W2oG8iOIns6fFWjhcT5vZ2bgC2Ez8pDzRbgXakPoz2kwW3YwXrClNDNDX
         eXgZz8YrqNWe8zZj3zTdSHMynYh+HT78QAkTKXAW++jEO3W8K2Z2yO/fE9lW7nJK8Yjk
         sqYnY8RX56DmTimlSOAo6UC29PIDLiD2Bx2ortlT6MO2DKk27sd8fzctVa8MFmMm7ZQA
         sWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9QiWhYMtp+5dTmuBml+i14w899+CzD2aZHw55I3s3Tw=;
        fh=UvmGNxhdXCYRERFRkBNNVmMLn71Qb0uinOjbhuUaWyw=;
        b=neIgkKq1R9jhM5uZr9yRQvvCChSCnIzkGZoiHEMmsp1JaV8dCY4jPoori4cKmQEuh9
         AAvLFJF9K1YkmZKfX2okZwR85OygGh2rB7v/IEeoeXKzuWUUVBTgpPtfHVmA0RnUC65d
         DInYTKmdjvyZFtDoWiIQoor31HCzqbDZh80iFMEZSx9hm/VjV7pJaAQzMyevQ9/+hXGF
         0Fz3lYZSLaSfrVM5G16wTjEs8j2y/Qtmv2huiQZvYdNIqvEPo6yQRiyNN8VJnCa8ejKb
         3PKxqU4OrszFU/79+UZkee4NpG+TKFDqfpZdUSVyu4xtRv02TppDEaZisJbwsgk7OUDk
         9U8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=teDsXnwM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e606a6fsi79867236d6.437.2024.07.01.04.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 04:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=teDsXnwM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOFWw-0000oj-G3; Mon, 01 Jul 2024 07:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOFWi-0000n7-Ka
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:49:02 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOFWZ-0000Yr-8c
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:48:50 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57d2fc03740so177130a12.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 04:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719834524; x=1720439324; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QiWhYMtp+5dTmuBml+i14w899+CzD2aZHw55I3s3Tw=;
 b=teDsXnwMXKR8nucqoQSEXM57uDaZoY4q+E0He/3L8Tr/93STOwCEYuGPxrpTal9K14
 e3usC3VWRfYPDfIpmx39OtnkEmLYEnZyzyZvhWusoEmDYijrZMAaE/nethSOg6YKY1/d
 yBmvdEqgkdnzTfv4blCRfwkoizkwXqPFSLrPjAcEsYnwgwZollHuJ6rk6HijfYu1Kjff
 aCxkTbPBFvL0XmKdh6lHCggUesM49xnOfHo548aNrzs9NkLabxCIh749HGxXfn7zdvJn
 ryD9h7c/XnlbanCGjFu3rfEANhhuWkc4RO/g8VFLJBHIngcGxJfa2zKyYHdecWiiXXtw
 CWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719834524; x=1720439324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QiWhYMtp+5dTmuBml+i14w899+CzD2aZHw55I3s3Tw=;
 b=HWSvpy9CKPa4zPg9lfBcHluC16sNNmqK1CWj42qEtBI5lJTMBaxUxo/jCFkExRQgD+
 UWshd+ojR4kUAchUjQ/8uB6scv5agEZsFcA4g137OHwbPoGN0WRz+q6O9yO+glwLbkQZ
 QNSUhOsr7O9ncP3QTD+P3S1D3Bf+vfOODaVItc2S49ptNx04sa+BrmQ3iNLtlgfDX1PR
 WEdnVeGMbx2gKukyn4ixLEZEgejlHFzGbCDaFyQ2EWgJqctjdy/y8ZAlvl4CR4dYmblF
 YA2uWOGGY3wBxW2Iun8+BlAy93DMKIH/l6rx3bNgBlYZpFrAS1H+lGcVHwVlfCNtyktI
 rrUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa7zXegwsnLB1pOgy7PsYd5tY7OhvrBa+mQ3IFM4RL/Xolv2JMszkDrqVHrLzTfVFVZiCBJ60Cv28xeCe8wzG472iS
X-Gm-Message-State: AOJu0YxJiXZxuPK4qe3J/9ub3n0XtJtGYZCePtJ7D+kNBH4uXQq2JnNO
 OluzUFOn9dyvjTMomBKqxJd44NSmGRfbxFUbAIPNdYHNtou7oPKE+C1fndNU0/Gkdak77MjaWXC
 8V9CGecs5WgBTbRG3M1BfkjATTeE++3dly8yL2CnksNzC/Kn0
X-Received: by 2002:a05:6402:190c:b0:57d:57c:ce99 with SMTP id
 4fb4d7f45d1cf-5879f0cbebbmr4146568a12.2.1719834523957; Mon, 01 Jul 2024
 04:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240629110800.539969-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240629110800.539969-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2024 12:48:33 +0100
Message-ID: <CAFEAcA8FoAOv+nbCOWxZT5Mn0FHOwPZ_YHKHrhEYFEhXh-C7OA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/misc: Fix STM32L4x5 EXTI interrupts
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3WfKT3f1emJA

On Sat, 29 Jun 2024 at 12:08, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> STM32L4x5 EXTI was incorrectly expecting alternating interrupts.
> This patch adds a new field to track IRQ levels to actually
> *detect* edges.
> It also corrects existing QTests which were modifying the IRQ lines'
> levels.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>



Applied to target-arm.next, thanks.

-- PMM

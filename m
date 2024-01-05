Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp865481ejo;
        Fri, 5 Jan 2024 09:46:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH06/pD4j4crJlF5BftZRHjISW+4eblb0x0qdK1AC7UOmC83aNPlUFwYKhFWzZ38pWF+csh
X-Received: by 2002:a25:ab2f:0:b0:dbd:5cc3:8355 with SMTP id u44-20020a25ab2f000000b00dbd5cc38355mr2553344ybi.102.1704476788438;
        Fri, 05 Jan 2024 09:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704476788; cv=none;
        d=google.com; s=arc-20160816;
        b=0q+I0odziTcZxryJ/bZwk2gyEu2V+uh1+O5DsImG1oqtDB5jrbM9Mr2bIDgbHUtI2K
         4Z4M51gU7e4v+U/LClUI9T9iBTKdnkP2xwDEvsz48UcKu1hmjOYB2Sw3qZZfzTE6DMJm
         Ouq/lI1u5bLjYclNiiQPpg2oXmanDSOOY1PfsFKl4XRj/xq+MuR0HxfmCjd+BU6a61ig
         4QdGXYihuPepU736jqnHdB5YCjrFOE6m1azHJvdPl/VrFKhyFdre+6ypkElIgBVGkm28
         V4MtUvdYGQbaQcD3fV9m17+y8EJke6HYO2CSWZ6d/6UJBU1qQ9G6Rshueq5z2l7wheYD
         zlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Tt2KkEKR/O3GKUqEJluYFu++1FBZrwVdsu+Pdswpigo=;
        fh=qdExgS/EC9wfn+jhDNphFdE7zpmUpTklI58gaAWmHTw=;
        b=CUquPFPyPpqhfNIgfm5dTMcxJjVtXfPkwpMs2aIa2DFYi8ZG8OhSrhKhWJ5MREx/r+
         r5p6NPMKQwwWFOA48TSikykmL/Bt2E9X90RG1vnmXCArQcyJ3Jwsg12D8YyfubccfuEU
         h3tiVWJOLTfq2EXAYTzbsgj3Hcu9uOlrz/bQPCxVovsWvWXzTAF/FqtAwVMOvy/zIMGC
         mnEZfLStuClq7t03bBg/ke5wkkKHtwA/n25czcRRbh+58qEbUm8jVBJaManTBjhghL8f
         XUruLrg7/ZmeMlvpqaBrV8Czki5aJP9Wk3EMwrnwnBoHkVRiqw3A9yH6Chm1+tMjC3aS
         MyYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCfyAKda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05622a189100b004283bbb0cd7si2277544qtc.100.2024.01.05.09.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 09:46:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCfyAKda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLoGW-0004fd-8x; Fri, 05 Jan 2024 12:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoGU-0004fN-Jr
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:45:50 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLoGS-0005Ws-Tk
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:45:50 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso22259091fa.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704476746; x=1705081546; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tt2KkEKR/O3GKUqEJluYFu++1FBZrwVdsu+Pdswpigo=;
 b=hCfyAKdavCJuka5JaNmqthHNa/sTLOwQ2mmjm3vV6woupkHxoONcWeXKyIRzgK068g
 jZzddLWKZo+0j+ysw5Dzx2UicjIHUNLKF+zKD8knWmRJ1iPk4TJhxn3TXGnD9Ra0/jDK
 npNVaaiRt6yxqYjFPksLYSTLAxcaBFDT5J1B+Ol9pyIP/DwLdB2YzLJD+NF/AbxlzEdO
 2acrGQxmJ0CXXy3sf7HGFBXzQLtPlS1YjN+UvE+aHY1Z7vSL3PyxF9+TZOe7hybKqa/Z
 xMiZsIRP+8Lg1xfxjyP0l8MrrapmUQSgrUJwpjIqD8UyD88B2pT5C8TFuZ/WQJqKJr0p
 DjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704476746; x=1705081546;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tt2KkEKR/O3GKUqEJluYFu++1FBZrwVdsu+Pdswpigo=;
 b=KtUZyv4KEJUhLqmG+80zssqJ4ys/T51XTWQOYQWdSbPz0ZLxAse5H2mDsh+ye2otjn
 4iyStTRbQVkejSIc+MShHrzm2jbacVMfdtEobKzC8qkNlKL7uStrgrfViyuD+wLyYoW9
 hv3+L8dYZkpZpyBPiL+/KmkoHvkQz3RW8iKOr40UBHcCGNcvaCdBl6Y59hopms/28KL7
 Ea3z5xMKXjDFdIkSOyM/NSfEQItUSY6gZ5KjSbYuZBdFinDgF+bfejGOsSKwMg8mwo0x
 dIFCQIm5YBor1SxjI1cA6jVmP4GfFohobgKZxzlt0qWD81yFKPUTKdcoyyzWI8YYvdEn
 LhIg==
X-Gm-Message-State: AOJu0Yx70qBwaNCOfIQcSQjum3fEftdk5zC3QSlOb7iCAmKct2sdbtHR
 XtWX4ioeWb8ECXgaRiNRBctChIfo3olQgWBEtcboQ104qI5D/g==
X-Received: by 2002:a05:651c:1a07:b0:2cc:866a:79e6 with SMTP id
 by7-20020a05651c1a0700b002cc866a79e6mr1713551ljb.10.1704476746543; Fri, 05
 Jan 2024 09:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20240103155337.2026946-1-sam@rfc1149.net>
 <20240103155337.2026946-2-sam@rfc1149.net>
In-Reply-To: <20240103155337.2026946-2-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 17:45:35 +0000
Message-ID: <CAFEAcA8oWpr+AO0tENSyS_ExPW8F5wLp5+5cDFF6gm0pQnAcCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/intc/armv7m_nvic: add "num-prio-bits" property
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: aXRWXOrIRC5M

On Wed, 3 Jan 2024 at 15:53, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> Cortex-M NVIC can have a different number of priority bits.
> Cortex-M0/M0+/M1 devices must use 2 or more bits, while devices based
> on ARMv7m and up must use 3 or more bits.
>
> This adds a "num-prio-bits" property which will get sensible default
> values if unset (2 or 8 depending on the device). Unless a SOC
> specifies the number of bits to use, the previous behavior is
> maintained for backward compatibility.
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Suggested-by: Anton Kochkov <anton.kochkov@proton.me>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1122
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

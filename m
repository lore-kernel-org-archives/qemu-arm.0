Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp227162lfp;
        Thu, 30 Sep 2021 05:42:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgmQriZ/suYh9FzRWnIYy0lNCoY/DFoMLkpwJl99Y/Ql3aHx2hhcUpLrU6dMy98ixS6rA0
X-Received: by 2002:a05:6130:40d:: with SMTP id ba13mr5560745uab.124.1633005730754;
        Thu, 30 Sep 2021 05:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633005730; cv=none;
        d=google.com; s=arc-20160816;
        b=VHWMcrZUnZCebYRGCouDPI8m3Vnaidf84JDywjBNgoe/2vvXXz3YelMXieE9hpGtgw
         fmCpbl9NHmlmoNttV73r9S2Vb54EMVHQtQu04oqtXAjDClrpRn8zoOcuRdmN6kycFOGr
         rowByzPOa4BgjJYGIs2HpHI0UxaymKG05ThR+PBK4gHkgp6v8jv6hORKtp69nrdaCUXo
         mP3V3RKrSknm5ryAqlgvQ2gkdeix8wy4sXf/XjkCUDMDgj8OLTvdMpXEdYqRWNaxuZni
         y71k8C/X39uHFQpPxQYjkDezoNve9kaYJWQQPG198e96b7QjkiYnwToMj4ZmaC7uLvj4
         NyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSyHRHsYs+AnSS0bNHuEGBrbg1RhSpChGg259dP8q4k=;
        b=u+fjFZqBycgbiwu0bZZE/XUddLMaMXTJ2Xp31V4wmv3R3tL9edEHlR0UIZlLShgv49
         rGhDZKQDjG9qYNpiaOk9BfXotnicy0pTUmVGz9QDlz8CBFBwOovxqVfjzefuUDDEdL2P
         M0LlFgETmkdVbxulGBzRK3b/5gRn+isNxSMn4ZXPtUG8FI7yEof3YVxaXAQnLqfpYLGr
         E0P8QMfhU+FgCtsiUzeaVcwVDvFBlrvQB7wMi7FWARZ6Ou7VwBaDLjXOPj3eKsCI4y8e
         nWeFRD0d1dBdMkrjkp32/DH3wxjdHdWTMYXDmqHCmnAIdHgz4loneG70YO8NZcMIRBMY
         s3GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TQrMPSYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si2178035vsl.51.2021.09.30.05.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 05:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TQrMPSYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVvO6-0001iV-19
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 08:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVvNi-0001iK-AU
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 08:41:47 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVvNg-00041y-K8
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 08:41:45 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so4254561wme.1
 for <qemu-arm@nongnu.org>; Thu, 30 Sep 2021 05:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSyHRHsYs+AnSS0bNHuEGBrbg1RhSpChGg259dP8q4k=;
 b=TQrMPSYZGfY66Z9fkLf5JiAZZHZQY0uGHhPnMTlihymfGb0aka7xaYLQYUHLlJHTl7
 ylaKCatVJa3X4WzBB/4/GyqxxPubLYEFmVRV9xQ6alKQprtM8fup6DbZ8hSJkWe+nznR
 9wVNPJvfPI7Ip4XkMM28uOwtPeN0BFEQ4a+M1bHDIoZB7aWvkvO+/pmxgARcwD+z38HT
 G5IDmzDNjsVzv4ZBzklZLiVp5Jm8CVYN+j69tdtQadYbbL2dau9Bt9jFSdOq8qlgg7Wt
 m7RIqqmBvfve1jP1BBvXazoe/oxCw4z/Jozl3cb2u0EQv7TVG72BNXQoE+LsNiPhyG5Z
 g1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSyHRHsYs+AnSS0bNHuEGBrbg1RhSpChGg259dP8q4k=;
 b=oBW0qK3cg0KsVjb98Yzb2quMhdPGxz/dOgu50VA/Ft9l9vU4tX9viVVioMzLm1pZsJ
 A9o8FSISh0yM3ML5zBHnZEaaH/H2IfOYoqsAIHcqxzrD5rR925YOH1qc/788CLbl7VnX
 fUR2nYKJ5O1Vk+yO4bkRFERdYrYSMavjB6Rs8foPkT9dfenD7yCRDbGzG2aAb9hxmU42
 +J69GAPbiCODvVH/bpxtcMWoSy7PYjzTH+xC1bO58NkY7TlzHULP6GiuAKaiNaPP4g8D
 GFvwZWkijDKHImqliPIpNYMbwUQQSKj2G6qKLSERRvI94JwzEyXWu3tj2nbYvXvlA0he
 hngQ==
X-Gm-Message-State: AOAM530+DeFzBWoHek43iyI6+uUlQXvxJE7QMiWgxwpBGtI7Tew3muJp
 pYjGbhCBScwlvcaC6OO5U2MShmlwYKmtvWmlQbGkcw==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr16326247wmc.126.1633005703080; 
 Thu, 30 Sep 2021 05:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210927142825.491-1-xchengl.cn@gmail.com>
In-Reply-To: <20210927142825.491-1-xchengl.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 13:40:49 +0100
Message-ID: <CAFEAcA-LhN+Q20xeQ-dh+9a9_Z2ccfmH7caKjNuicNmS0nC_=Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: sabrelite: Connect SPI flash CS line to
 GPIO3_19
To: Xuzhou Cheng <xchengl.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 groeck7@gmail.com, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ph4Roa/aCs8F

On Mon, 27 Sept 2021 at 15:28, Xuzhou Cheng <xchengl.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> The Linux spi-imx driver does not work on QEMU. The reason is that the
> state of m25p80 loops in STATE_READING_DATA state after receiving
> RDSR command, the new command is ignored. Before sending a new command,
> CS line should be pulled high to make the state of m25p80 back to IDLE.
>
> Currently the SPI flash CS line is connected to the SPI controller, but
> on the real board, it's connected to GPIO3_19. This matches the ecspi1
> device node in the board dts.

Thanks for the effort you put in to track down the root cause of
this bug! Applied to target-arm.next.

-- PMM

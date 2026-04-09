Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E59DE9DE7B
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 09:19:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAlXH-00057I-IM; Thu, 09 Apr 2026 05:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAlXG-00056a-07
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:18:50 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAlXD-0005jr-8m
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:18:49 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64937edbc9eso599251d50.2
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 02:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775726326; cv=none;
 d=google.com; s=arc-20240605;
 b=bxPYt28ovVaIYW5CCG17lmbT1H9+i8ock3QjMvaSaxReSwSEpU2MX8XYFlPZ+yJniS
 B+LfBlEv5A/vk6qbnc99e7Q725foRVhfT+busb2Od4kOKZ9GAkEDRWfwcrqvSHRCa66H
 BBFxDu3awjLiy3YdmzNz5+aBhnrugBmH97crjzNUaMZm4052S2gSqkIe0Aldbjpn4too
 qCXTcfgVX0JfOPLHQweWWQhRbBVd7a9DQW2sznXqVh5n2EHH9BL0CNdbcXVUgmrCEiHG
 OCpaqz8ffXbWDBlAEfsu4C/Nf9sCMb+NF/j/qy57n6rdJvks0vkV6kX9GGtSwZOOyYkR
 Ublg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BWegvmsqAEMLsVg7d+5gDL/Xyt4tYWPMAeL182yYasI=;
 fh=vCFlbS7KL7SUrF1IIPIFajhCnu4rwq8Em1cyfePdr/s=;
 b=HLKLosHQ6AMEhZ35kb0Q8E1NW/n6BqntHwGQA+2aGDr1+L5aobUzKzSu7uRaR2CrlS
 fWKHImOes15iMo9NA6foMh2mq3TLZ3qY6uvRimX3x5b2OOpsK2orPq25YQ0THtiVbRvV
 cLDhtIh33XtRkN//vv01nbcIGG5GJ5ehzKmJDYWvApmPjQYmrpFnkfmD8gSqqi37T/Rs
 VXV8+KXEiePRprT1d8rvbbKlb/spR407SD6/6Xsp4ISG5V8dmwLgl3G/yZCmp89JnYZ3
 D+AB34drj3ovWtQb3sPp0yHRiYxwBprtfEyI76pPzLqK2AzFOSE0xzff+gMvnuiOa0nf
 RjJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775726326; x=1776331126; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BWegvmsqAEMLsVg7d+5gDL/Xyt4tYWPMAeL182yYasI=;
 b=F0kclfwWQCauXZryBl3nwsZhBle4ki1f/5qNioc83LrCFtR4AeqFt/LpmuDt/D/KsS
 s8BC0Hl2LF0B3fzFS5ScxBb61hrWVuEF4ggp5LwQvh4T3IhluNC6+VpifRmldMPCJh5y
 dUfFUWtWgjBRUlnHRNHrX15hoNQXBf6g0KZBcK46co70fs4hRi4To7LjnTxrJhKfbqQD
 dZgIdv9tPDtfHtqa1w2izP4dfgf6b1Ta5EMYBY5GnILYHyK3CmRc2UdTPLBv8uJCQ8J3
 YOfdRoxoPTMIo7idP3PXinnkTXrGhPXnkNicV3pNGH5oZkSUOFpdL8Fv0WGCT/hnvwOO
 Egcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775726326; x=1776331126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWegvmsqAEMLsVg7d+5gDL/Xyt4tYWPMAeL182yYasI=;
 b=EACMg8iWhYEUyeJXRxpFzy6PbOev7MF8VYRI58v04GKtLGGeOczowpnnJRD1Am6k3o
 AIdBz2qmax1KGBJ+AIvKuCBnYmrH63k6O+6uNGM3ah8xpyden1YfSUL9ovU0z6rXVUF9
 6UjEdzAWGvof3gkeRP6ILupvnnrz4G8ywpvQ/o09gRgVEesB2Uk8CSh0jIgsf4zy/Pm6
 XMpGuiVrUDtBtPXCLjzFny/nAdjjLcK1+OSNTP8kbbplwvGNr0BDZ3XNCveHWRgKkSyi
 q+MNG3vS/o/m8ksPDJXv3fzbVQGcQ9PKCNVl9yo5JfILIN4gZWkutYBC9NWIn9v3w9Er
 n0eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOIIDCv9In/gRF/x+jQtldxzt6Rrh14c/YE9I3Vl7ZCZvywaH9K/QdVU9YWHdXA9DjPGxIXPBk0w==@nongnu.org
X-Gm-Message-State: AOJu0YwYjAG+IrDyLr3R5y4xtx9Bl7rqBw1yw15OdzSzWMJ5kOM6Tawr
 ut+2f6796Ugg/dTul4IvOKVlWG5Glo2X23X+fB3c5ZQmRsYN/DpUPAsrI+WsoYrxXyY1CP/z2n5
 ws9vs8XtcLLJ0xyAQXcGLu8xADJl2RaGXQG1W5vEymw==
X-Gm-Gg: AeBDieur8sUBP67FnnNsKyO9xsf9Br1Yb0BeQQF+YRuA9cAtZMs5F1aLeJnOlCAgHaU
 kdGIINUpTMC2J5CIBC642HmwJP4zOT71TRkkFF8QuZhpKC2cZ8VMgI0U/IWiygyGMn14nuugZek
 L8PTfJ4fCK6MbXvdK5vSt/svlZnsv+AIgCYGvt2ltzenS2CN0GqXuNhfKiEwGv2k/2DNF/QGNa5
 Xht9goKEpi/c+AvccO1z6Pf/iHHSFfN2k2heoUwf6X0BqI3xfgpobhzxNqc/FJ1gn/2KM1LLjEl
 Xf5LFhwr6Mg8uMBrES1E64dJTBiofK4gNWmBo2vhE/LP4IYXcsIMkZDgm1CefTKKy5Q=
X-Received: by 2002:a05:690e:120c:b0:650:2ff9:d654 with SMTP id
 956f58d0204a3-651875febe7mr2331592d50.26.1775726325932; Thu, 09 Apr 2026
 02:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
 <20260409-fix-unit-address-v1-1-946840930af2@iscas.ac.cn>
In-Reply-To: <20260409-fix-unit-address-v1-1-946840930af2@iscas.ac.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 10:18:34 +0100
X-Gm-Features: AQROBzD7PAoRbJQCon-foLQnsOtbREpfTbSOaPoZYJfzNgUoB0OdCB2YWscPhqs
Message-ID: <CAFEAcA-GMDdeY4bMQfJLVbHBdwqn2rr1K8=D3YytZXo+r3G7NQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/arm: Fix unit addresses of FDT CPU nodes
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
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

On Thu, 9 Apr 2026 at 07:40, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>
> The node unit addresses should be based on the reg value (which is in
> turn based on MPIDR), rather than some arbitrary number [1]. Also, they
> should have been in hex, not decimal, as per de facto convention [2].
> Fix them.

Please don't fix multiple different things in one patch.

In particular, sbsa-ref is special: the "dtb" it produces is
not intended to be an actual DTB, it's just a convenient way
to pass a tiny amount of information to the firmware for
this board. We talk about this in the docs:
https://www.qemu.org/docs/master/system/arm/sbsa.html#board-to-firmware-interface

The firmware doesn't need the MPIDR in the node name, so there's
no real need to change this.

thanks
-- PMM


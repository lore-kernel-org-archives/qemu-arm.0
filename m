Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32396C44515
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 18:16:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkn6R-00062j-Qs; Fri, 17 Jul 2026 14:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkn67-00060A-OE
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 14:15:45 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkn66-0007Mg-9I
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 14:15:43 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-80a123ef90aso33463667b3.0
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 11:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784312140; cv=none;
 d=google.com; s=arc-20260327;
 b=saE/WV9XajK2ewnbp6ZTyFLyfj6udsE4Yfzz2VCf4Yzvzb2fvyTFwgXusuCRcJrhV7
 T4Dzl55TN3b2nilXiaXJZrGFq2HmJSNb79ObuL1shd/hz78+CnJ1f9V20zIgN6EEwt+L
 d1B3jCSGw0Pl8I9b3UMihJk4ky5gRaz7R7TiOVLHYwbTaKIBuVvpw9E57cIrXvGBLfP4
 v6ditUNCQ4XjGfxatkNz5L9wGgxK+ajQeSgPMICLkjHbkmr9zJZ9rh7m01HzOkdMbbTX
 Pb03VPNKU3NtyXvLwrvJgVDLgDA91IHBF7BHa0gZRtllXvFYfGoLzgTMU3LUg91niAvK
 iU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=u5/REWPssNQzJgBC/rzOpgJs6qngnLwQxtd688bC4/Q=;
 fh=7F9C3pNjlt+Jhy3kxzs5QBymnfvKX2O/dOn69LFCl34=;
 b=XmfnOq7VDOu4lzYaY6l/JwGZxVJnYjFlbDqgzJj7hpkId5YVfBhB0jScYxAZh4Pym/
 9jwuNvSTBtgVJDPzh7R4uMy64IvpkxyJxozKEowBTm3p3GPlpRV444XSHjA1optfIoOi
 K8AswPDOQ0lcnHIH2EmfMKjxg4qXHol3DykR8AE9JU1Gi4i3MJabeA7/qFwaNERh6ct6
 NL1wrKRF8T6KgtasZSQYWmvWc3/ZTATUA74C0tU4TL+EPx+7fMrUQinlekAMpMPs931L
 TbKvZStY5Wn9zPl/NA+TPOU+NpnsGjf0vxdBsF3ylTj0k5P24zDl186hmSJu7jSWRQmx
 AZpg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784312140; x=1784916940; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=u5/REWPssNQzJgBC/rzOpgJs6qngnLwQxtd688bC4/Q=;
 b=goAS5oilKCaVhbYcoExHaWaARJKr1IW8oWzcjqX4l4fq8N5+VFTKSIGGagzKZXNhEQ
 JdDIjflMzv9xPbp2NatAsuy/7yzV+gBgwRkXhajjcRUb0AUbEixHpxOqNDyNL9kaM+ga
 G8kdlgOEozWynV4JMdi3giCCZJBoy48T+TcE9ciSPBFo9Dh4XmPMgBBqyXe4ihSLGEsW
 fH6oQrz6ZjxzgXPCxXJJcQ/+sffF6tRtsia2axANQNMuciRR3AZNF14rHLjeCA9Gfl9m
 peuiekWncvoGbEYwUHSYe+VmjwV6gdrgK1RcSHC/2M2hoFrQk9vEIqjVIvDFWuwiV5mK
 UUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784312140; x=1784916940;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=u5/REWPssNQzJgBC/rzOpgJs6qngnLwQxtd688bC4/Q=;
 b=e6XqldRcah803brP7OXaXjNhHKE+80bW+KG0fFVdJITF0jmuIgN+NVN9kN1qwFZ9IV
 djrLzvsTg1OCr7fLFpm/s6E+TsvtOM6YKx7uHVGEWmxTri37M21/hR8LpJW1tnY6X1G8
 csU5iK9UVdrheNA4Qg+uC9QUED5I2YlnnRzwAM30W2YgujJXPTQqGOvj+LMMwnILd1lw
 bIbNUEgfhEOLlaPSFOeOq10DTBoSxLX3bOWkAuK2x5U1Xnjo4MLG5I6AaJdiD/9a4Yj6
 QgJLN7/kUP4tJOLmuBfDiJFrWNFfZGmOta4Zsbv7qg6t8EBTV8d2DmSksUs3/pJF4imn
 jIqw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrdQN/Sc4pPHJf4IIEinowAtF/2DfeHTp90OJvglRFD7FDeGQu1Q/RsjWKvlBybsIoVqjGu8oQTw==@nongnu.org
X-Gm-Message-State: AOJu0Yzzqf+Cu3vcoaC2Y6cs2oiJVOBP2lsmFAr0inRW3BhY3dn3JQOQ
 t3pxQUq/z8OkfoucHnRgMHuwYTBVYln7SkEMNx9XCyuN6ulyL9KMfNxpMZjKnTzVfChvSdhM14y
 1+P6HdSlIqOOBOgOrKvnRjomytTzve7M1PAkKWUNUIg==
X-Gm-Gg: AfdE7clNeLHXZ+3ldSjhFfY9vLyTuAf3Ucj6vhDYGZhiBW0ucmTrlKeBrBlbaS76sNL
 1VO2JnuFiEGYCDv+/TXCxjR1EGAjojx3Zhe0c8712v7gAyBPNMHzS0zXSKmzzGgHNBKUFPq7eAx
 n7HKTA0zaScE9wMQSK0KQyZoHnYXA+RD2t0HcTj2Y7Gx0KGqvLNzHWZ4likK0Bjfga6NDxDE50Z
 1lqtlGFE1KjBELWPlCFY5DllLE9TsGA88cxwlvR85mSleqQB29xz2omM1p4y0cQirZr9NqMJZsG
 oMYVfPGCFh2DFEmmJbwZv3zwXEB8vTU71HK+UVWa9/853A==
X-Received: by 2002:a05:690c:298:b0:81e:fdf7:bfbd with SMTP id
 00721157ae682-81efdf7c075mr2136617b3.15.1784312140192; Fri, 17 Jul 2026
 11:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260717174412.88258-1-dingtao0430@163.com>
In-Reply-To: <20260717174412.88258-1-dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 19:15:28 +0100
X-Gm-Features: AUfX_mwvy6Bm57SptJAU93Z67tGAtKynfjEmcQN_hV5dGGac_QI_yKzkZwfBGVk
Message-ID: <CAFEAcA-ZLB8+N_ud+6V=DkDrOvPznc75eoGHwQhMhYk7Cgf8MA@mail.gmail.com>
Subject: Re: [PATCH 0/1] Aarch32 TCG CPU: secure register migration
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Fri, 17 Jul 2026 at 18:44, Tao Ding <dingtao0430@163.com> wrote:
>
> Hi, all
>
> In TCG mode, the xilinx-zynq-a9 board cannot recover normally
> after migration during the uboot phase. Some secure registers
> did not recover their correct values after migration, causing
> the CPU to enter an abnormal state.

Yes, this is a very long standing issue:
https://gitlab.com/qemu-project/qemu/-/work_items/467

Thanks for submitting this patch -- I'll have a look at it later.

-- PMM


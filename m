Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4066ACD3427
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 09:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMNIP-0001xk-HA; Mon, 11 May 2026 05:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMNHG-0008Sa-SY
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:50:25 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMNHD-0004Bl-GU
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:50:16 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-56a9a7e762bso3932948e0c.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 02:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493014; cv=none;
 d=google.com; s=arc-20240605;
 b=DY5SVCpbGriElq/hyUu6JFDHKOJyH7W9XGtQRyDzg76EroP2HpDDku8zeaK/3E+2+f
 1fBXYoBeiKQnLSI3w9ZHu1szA0O88URCcR9nS9i12awolqme/pP7v/hXRApPpaclp+wA
 2uLju3Xq1PRvQ8c6SbrWBvzxiqy8EXtQ/xnQDtdgkz7RKwvM6gbwiN4T4PdZe6Ex+0kI
 0Afqj9aDrPzHWTN0FwQqTreFa/Cq6urOp6Yl6LHDYSvizso/Kx7qWdxbcXZ1F644s2ZY
 5E4FcSwfb5tMF3eNNMeJ3SDsc+XnUvW64Mvx7u5nRtwk4dp1fIvF8AQzE+Ze+ZBDwo+T
 /W9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0gRUhHFz17qRfmoO+N4rAPkuO8r8Cs5B8nqprUKtisY=;
 fh=KiO9AqBB2Fqem4HG/Wy6kWWNc1pwrSS7E0QvU0aUpeo=;
 b=FyP17gkTE0KEiwcCa/I5m6U28Ynzi9xQhVzH54Vbu7tPCK+ksjE4jM61go68A9pZLi
 USXczm4Xr+HTn6xI4JVHzUnwJZJictnrkkCCoikxOXaPKWw6gRr/CNzP/4VhuagmCs84
 7isOnOy6i2eRHAGxm/FeYQtX6jbNOlrWHB8r97Erja25bteTs5k9vbueEl2THuVifh/c
 SPRfMjU8bhu3E4j7fcG4vTAQ6u4WTARfOCHWTPbPfOviaTm5XqiGvlclluQeJwsA9lYH
 PdKdKgHJbfPxswVXiu9KidWOpOyj0UpGMbhbS579cQRxGGPzhRRhC+RVPmOB3fNXoiVe
 WTKA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778493014; x=1779097814; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gRUhHFz17qRfmoO+N4rAPkuO8r8Cs5B8nqprUKtisY=;
 b=jQ9VQ9DS2sIWJaxNQUTEOT2u5Bt6p0dPRJ+p7xVf2FLhaQvWWkVuredIPMcywxRn8c
 3hdHj3QnRzK7JsrPL6CADn2rfvziNIpaQVMOg1JBEdzb03p1RaQ9six/8rB0ZxhT21lb
 ZexbF//8550U7evBbfFeQ/piouCgmJOdYv/BXNgWOgnpffEj4MSQ+xME8gag/u7SJqTt
 jB7zaSjZKPK3aofzI/9xeOs3+9KImOuXyXV3T6NTYuKeEA9zSSgt52LfbwtI/qOxom71
 6vywkYtmUWnVd0SCcwRdS0SLS/LSzdO/5vtgpRVOLq2oA6wXeevgGZehswFw5OmclE97
 eSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778493014; x=1779097814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0gRUhHFz17qRfmoO+N4rAPkuO8r8Cs5B8nqprUKtisY=;
 b=f1pH85bdmWvzDE+cq1rqrN/CLDB+vSPfUQmlYeGhvp3LSqOQbbNv4RXnd+Dp2owXmh
 72itQs+oGZYn6IzkIOkis0bn3IcHY3Uj8MQohPVrNrg2f9gEPeOkt5nv8DIvLpmnmpbB
 azMy+UaDKwAWyllzEzv5LHTs6IC64rXevjd8Pq/GUdvnKI8z40vgYGScavFDkUpeCD3y
 s0f+ypvJzZOmJqD3tL3vcNkK675995qzEJ/QPcJjAR2Bt0ncoozbrk6VTN07O8D2fCHr
 lTjPdOm1pk4gIdbgA/j10qm3K2vq+hgfbqUo+hrf/e6f/9b+tPFuhmWkMFoMqAHaBUgv
 WAlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8RxbBX+qvvorv820Z/UBWVGFlkKsUojrWJzuLoZI+Y3WZ7fejUaBF+G9sdThJ5kXm7/SDFaSw/6w==@nongnu.org
X-Gm-Message-State: AOJu0YzoZ7h44+vRpd4b6Iik6zY6jM34XykdlsNGJabj0xMJ9SrJ4oyy
 m89ndZqsHNq8+OY9CoSjRCkuFsI1WUkYtI+Cyqh50iSbBfjfxdYfG7nyIjrYlt2zoSKgw/ZBfta
 JQUgxwa8OXmNeF3BkhSZXgYR6ZGnMPUP2hMgUOAkudH8vTaBftuoYOyg=
X-Gm-Gg: Acq92OHdcIl0RabQXzIDp9c/zdmA9lNuoSG5DjQ7Ngj9UIXUVSsYEZVgoi1wtqDb9RP
 R45qw0zrmeDwJgEPbuSgMDJTqGrEJIQ5M/ZRMSKRqGr9p90/NZBIY5LVj6ZSnV36yGTdm8aEqvA
 svJY3hZUHVWc+b6VMNU8+6a2CXAv7Dbv/Ku760N60lVJbSsFlPPQ5WeIvn7Egs3Sp8iWzTfVZ7s
 tdEVbSBCcZ3ExSAJBm+cxqC4uLUUN8IaVJq5kV2b/2geLJ2VkWYQZipVurxxThxT/1Jo50Dj5ak
 6aRy6FmoItZXc7y6P9oKeRgBADSaAAfs/inTw4uK+M9RTr6LrXgwsaqxhIQWpQ5Icqk=
X-Received: by 2002:a05:690e:14c5:b0:657:4633:b67e with SMTP id
 956f58d0204a3-65c79edd3dbmr24399369d50.46.1778491225358; Mon, 11 May 2026
 02:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <agBHWKJmtNcrQBXe@Air.local> <agGeEVCUXGi8JdOu@redhat.com>
In-Reply-To: <agGeEVCUXGi8JdOu@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2026 10:20:13 +0100
X-Gm-Features: AVHnY4JAYrL1nKWeGoo5-2AnOKt23WU0TdrIdgXKlUZO9_hRyZSVkn13XYuo2iY
Message-ID: <CAFEAcA9ZDGYuDWunsfYxGiTndrQfTv8_wyFRq3ChG3Wc-ZE3DQ@mail.gmail.com>
Subject: Re: [QEMU-SECURITY] [BUG] hw/display/exynos4210_fimd:
 guest-triggerable host heap OOB write via unchecked window coordinates
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: bestswngs@gmail.com, qemu-security@nongnu.org, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-vk1-xa2c.google.com
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

On Mon, 11 May 2026 at 10:15, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> Hi,
>
> Thankyou for your report, however, the exynos4210 device is classed
> under the "non-virtualization use case":
>
>   https://www.qemu.org/docs/master/system/security.html#non-virtualizatio=
n-use-case
>
> Thus we don't apply the security process to issues in this device and
> it is not eligible for CVE assignment.
>
> This bug can be reported in the public QEMU gitlab.com issue tracker
> and/or patches sent straight to qemu-devel mailing list publically.

The report was cc'd to a public mailing list (qemu-arm) in any case :-)

Filing the report in gitlab would be helpful so we don't lose track
of the bug.

PS: for future bug reports of this kind, reproducers using qtest
to do the register writes are more convenient than ones which
require building a guest binary; for example;
https://gitlab.com/qemu-project/qemu/-/work_items/3412

-- PMM


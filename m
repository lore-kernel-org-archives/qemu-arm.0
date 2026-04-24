Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1E7FED3D7
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 15:58:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGIv6-0004BF-0O; Fri, 24 Apr 2026 11:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGIuz-000484-3r
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 11:58:13 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGIux-0003s1-4J
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 11:58:12 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-65492d097acso1727316d50.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 08:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777046290; cv=none;
 d=google.com; s=arc-20240605;
 b=TJvCduqWp26h8R4Sfv/u5/TxI2jvPb6DI8jlfwCYsY6c3Sn42p39LvzYbwA1bb6bWD
 f3MmAu4N3kg7WH6wO7EzElNgQBAqo4h1/ARu2l37w+P9Ja30iohPOTQWvpjrBe6DM4NZ
 x7VSvLi58pfBfi9LgqParQLtNqeE0ptGvzk6Y/K2l7KDkJNmJYGJc2c0xbC2NMgEiNOB
 MoiXN1Q33bFKliVAjaXoZugneiNSROjFMLdqxQzj4dPjyqsO3I9MfzbH78aV15BVUe5r
 9ODbcGJuC3B9gLhgx+0+i4dMauoaiXfoQs1zmryXDr1Nr9LrUKIcuEloLbhqN66ngeHa
 8XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3fHju/rywQ2hs+X8YMVNSxO/PxQfzdwsy2MTviTNEoU=;
 fh=a+FSKGxEorurDlo+COrsLQBobHx9uyuRxf6z2iJgKe4=;
 b=LT0pzrUHE9q9j5YBHWgzqKEyGLYsRpz/9suQqqzmO4wb+RSC+4u9567zGTgA3juSCU
 YVFg4Os64fliUBCcE4JAj3Vuz5XN+xLxar6gyTW75gopBvgy6sGLz1AYX5Fs1spsWkOh
 lteApmCKmDg3IEnqvPq9UXmWjfr49BtdDTI2d/ONzdfYm344aAlmt9xYSEIWyOqeK4Q3
 XmbNcoOYNPEKu0I8StkOgPyxhVy1yyaKY3+wdxeSwNgtWoKwx4CZ+e5FtQkYWI9ECnSd
 RSyqHp8DAyO2w2FW+o3zHicY9y/aJIf6u8oBvq656tlngM+9PSR+lEVNF4jJTEvat7CF
 W+gw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777046290; x=1777651090; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3fHju/rywQ2hs+X8YMVNSxO/PxQfzdwsy2MTviTNEoU=;
 b=PPTv2b9FJQVmM14jkae6k1099h/cCI9EZjK5A1p+qnX9+Z3V0Y5Bzj2F6gP/M8Agdp
 wI5v4i8wDj/el29BVvf03v0W47Jr7a9rK9/RXGtS7ESx0UCaGqxFrxYLGr80et1UuEJV
 rTECV8aMHqXrxw8lx4+7eRTvucDaWuNw26P1Bj/qyUh77t858crGVex6nQ47smUrDEEL
 mm/016yqAoLJRr0UY9/STUqARpDlMBL2eobcYRjrrSB+xuDC9ytd5V+8XohyIFV08/Hv
 842tRte1mh+Yy1CLDujUd3Q01A299nUorNvb3vvnXGCHd+r30zjnRDI3Np5QGL+iHS60
 x6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777046290; x=1777651090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3fHju/rywQ2hs+X8YMVNSxO/PxQfzdwsy2MTviTNEoU=;
 b=AsNw5l8aBWU1283Ebe6hecSs0zfxybcJhw9qSqJURqcIARkSkgkedF7j6ANl43txtG
 PjFMzOtTnj79kxAio/mdUEwaL6IOAewRLbyH+J3Ed2EGxWMPjctL/0VQ8LXNka6UMcyd
 y6ccrACHEHSV1krEj0DgtHz+3U8PJaNhrviYJNnYuMEMZCA0q8x6KeMh6LlwATCqj9Z5
 DENZMUje2MOsdxp9NYoNw8Vn+GtzUA03CNF7N/f6RAfiZ0vMnWG+tlOiw+9/gYibUcwb
 ygiTRkfWOrtjfTYce55f9xAIyqu3ATcEpRaBea3KOx62W3km+0ikf9Df11jWmdu7BaS1
 deZg==
X-Gm-Message-State: AOJu0Yy/F6nTyGP5wyNm+zE9H7U3uZEVig041Y+1mX5UPg9A+BNXx1uH
 YHVnlPgU6Rj4qvCCnyGvpzdtscGBFBgjRe/LL2Pybo0zA2zXfidr3cU/4bJcj2gmycBZ+Pj3vVP
 /KE61ylnpToQg0dBxZ8rCTIcJbA1wNjKkYwWv29b1ug==
X-Gm-Gg: AeBDieuHBs+KV9IKDs+NFWF5anwpp/f9FADkd9p0Kny/m1To1+aOxAaOa3Vwy7U41ua
 IPvOCCxAJtc3qI7O3NukznzJUSECb4Ys8KNpz5sgWVh0+jsFzowT70Iz84OD/FUc6WkiR+BcbJ3
 TB4UIYzhzk8jSfcEW0fPIafBTR/qNUhvQGYiaH7feHRsf+zNCzQRbeZDLVkfAc91Debciy3gfeL
 GZ0luzewNq4fZ79IwW1pXOjBzKAolge7T3lZemcBvrVAPffVN9IZ9ml3//OS18c6Wvr72YrPz0g
 MD/kudAqh92b/Y87sQcNrhZUwjILdK5IFKzI9PBaOGiinCGJfn0tonXS2IfkE1EI6fGguJ7fPFG
 qBQ==
X-Received: by 2002:a05:690e:147:b0:64e:a969:fd10 with SMTP id
 956f58d0204a3-65310a1267cmr22256650d50.32.1777046289835; Fri, 24 Apr 2026
 08:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250929165230.797471-1-clg@redhat.com>
 <20250929165230.797471-3-clg@redhat.com>
 <CAFEAcA8Dja4yqnaHsXc9pg6EzEAVZFR3=E0sGa9Bz4bvuf+_bA@mail.gmail.com>
In-Reply-To: <CAFEAcA8Dja4yqnaHsXc9pg6EzEAVZFR3=E0sGa9Bz4bvuf+_bA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Apr 2026 16:57:58 +0100
X-Gm-Features: AQROBzASYHS4sX9SZcWEReuIrVmVYyHkHdzbas_s41zzQbTB_SNmUaovveuP4H8
Message-ID: <CAFEAcA8nyngyeWi4Vb=ZWJfxNsyFfSqFJMnWnYG2ce95xaCfPA@mail.gmail.com>
Subject: Re: [PULL 02/32] hw/misc/aspeed_sbc: Connect ASPEED OTP memory device
 to SBC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Kane-Chen-AS <kane_chen@aspeedtech.com>
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

On Fri, 24 Apr 2026 at 16:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> But here in the prog path, we use the address from the guest
> directly in the call to address_space_write. This means that the
> address the MemoryRegion in the OTP device sees is not necessarily
> 4 aligned, and that it can have values that exceed the valid
> size of the OTP.
>
> The OTP device on the other end seems to try to account for
> this difference: its read function uses the offset it is
> passed as-is, whereas its write function uses
> "otp_offset = otp_addr << 2" to convert the offset into a
> byte offset before using it as an array index etc. But the
> write function doesn't check whether it's got an overlarge
> value, so I think it can write off the end of the storage.

I found a repro which triggers a clang asan failure, so
I filed a bug:

https://gitlab.com/qemu-project/qemu/-/work_items/3436

Would you mind having a look at it?

thanks
-- PMM


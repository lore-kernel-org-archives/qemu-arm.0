Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7D1D216AD
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 16:23:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRC6h-0001Uj-Nl; Thu, 04 Dec 2025 11:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1vRC6g-0001Tt-EE
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 11:23:02 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1vRC6e-0005h0-Q5
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 11:23:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42e2e3c0dccso742582f8f.2
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 08:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user; t=1764865378; x=1765470178; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lG425//d+MvSg8How3M3OdL1/eggwPAhz84RWegnJtE=;
 b=c738BzVFGggk0LLZFNYvmUPGXve5eyTC/mSj6jEkz5Jgix8U6CXq8qJ2C4FdStVFx9
 MVyJ5Nhx8N2PEST9JgspY1OOGsSidq1j4tWIzA1VccoycFikdl8Tea4Xo01u4LxxYXom
 wjODeSeI/Ib3mQG1s/OMw/Y9/JsIk2Pq2lNXJ6BScbatOQsCZc88wueX8y/c7x87O5a4
 BHYXaxw2gFd6nSHJ9+wOBM5stlREOx8idYYuki7NlrVYxq16cFl551cAv1LJiNtKt+NR
 /OpI/FrjgB+UxCF2cM4uIhRqjjp2lm6W4UpFbaArunZdC3nAtCrMhu8ywQ8vMWqQP1sF
 wU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764865378; x=1765470178;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lG425//d+MvSg8How3M3OdL1/eggwPAhz84RWegnJtE=;
 b=CZSVcg2kscJ4quVznsnttNTPQ8u2azMVxRJz8QeGk1eGPJRgMuZoIqrYQds6BzUIrN
 z+TjgGQ8jAH1DtX7LxyuGjcgPwvAFI3yIRQ/p5WzWOS4yFsgtiwx45R79u/jYiO64WDP
 tjqp7rH5das8OnlDM/9oGOzIhkDN18G7dkPbqYv44pC7G7h4VH460Uq7hwfLFMaE4dMK
 o4hE/yQZa1dolhZtbHl6b+1YnXwkqrEFeCplNCmEbFRq6iINxReK/1CDxxjJ/uv7CIFf
 JRTxaTP1Q94Y/9TRB4CcBqUyg7vm+emqd4y6OS08d7XxvXtjYafLEUixnXudC3Owe2wq
 NPwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc/gD/1vZnjiTXx7JJkIJqinx7EZqeCMGyyuMPRnyNdXgew7Hze0wQaqaanPdkx9jyT+4U0gKkjQ==@nongnu.org
X-Gm-Message-State: AOJu0YxEzaoYYnrS0pSq2vxKyEqPnHFtOD8KSjXPVJUedmFSG2wvuXbf
 BaiuWGlebRmNDc4QOD1C4pUw0e474CU4xHLCwxIJ8vWWsy1ivi+P7mIYCm86BVUpovYLALmpn1Z
 x2xaE
X-Gm-Gg: ASbGnctMV76RQjhtYhydF7r5xms43oLPWYzXGJRctTE9qq7802uzs+WLMsyKGAgxDci
 c+WgUY76XBfVfTIcHeINyH4aJxiURkNEna/ddVfJDcwb7O8M7+FwKcQg8/6oxrJAEEWuD6g4mE1
 2G3uOCb5H83P22AAnshlzohU+2ZlBxP0xguox0rV6qiaky6vGl9qzgmdnI4UkwtHwRiJxQxPuWu
 EGCvmvkCvGbOe6YMKwQcIv4vPUUf9e4WPGOj9NpkBWtYwTejmqzs3gaSEEVBBPMATdcvH63JEaJ
 PDY/AhkUpeZ0/eFLPvSHUV3F5LAuJy5Duvvwx+FRMK3m4IjTO31TYbiiXapZ1U8SMGOW3yCpSGn
 X5OsrCRAP1bVAPLa1xPZPRLesSYwCTIrWlM0fLwq1Yj6XP4f8g6HYTUleoCedGqJwZvoG1PMrlu
 cUuB+KkVNMy3Ki08rMPJIfE+iogrcUDdq5Mps8e9Q4GhxBC9oJXBC0cWyCaBR330d1mAulF8+2
X-Google-Smtp-Source: AGHT+IEqEoDtn86CGYIvCrrbCoxQfP1n/vgdZbMsfW302CT1AiG+yBw3JD06JKjf71rclZH2BZ9HNg==
X-Received: by 2002:a05:6000:230e:b0:42e:a70e:cab5 with SMTP id
 ffacd0b85a97d-42f731bcd7dmr7091961f8f.54.1764865377830; 
 Thu, 04 Dec 2025 08:22:57 -0800 (PST)
Received: from Jessicas-MacBook-Pro.localdomain (nat-184-7.net.cam.ac.uk.
 [131.111.184.7]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226d0sm4100879f8f.21.2025.12.04.08.22.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 04 Dec 2025 08:22:57 -0800 (PST)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
 id 517881074BC6C; Thu,  4 Dec 2025 16:22:55 +0000 (GMT)
Date: Thu, 4 Dec 2025 16:22:55 +0000
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: handle unaligned PC during tlb probe
Message-ID: <aTG1X4YXZHOgT6NK@Jessicas-MacBook-Pro>
References: <20251204155427.801085-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204155427.801085-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x435.google.com
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

On Thu, Dec 04, 2025 at 03:54:27PM +0000, Alex Bennée wrote:
> PC alignment faults have priority over instruction aborts and we have
> code to deal with this in the translation front-ends. However during
> tb_lookup we can see a potentially faulting probe which doesn't get a
> MemOp set. If the page isn't available this results in
> EC_INSNABORT (0x20) instead of EC_PCALIGNMENT (0x22).
> 
> As there is no easy way to set the appropriate MemOp in the
> instruction fetch probe path lets just detect it in
> arm_cpu_tlb_fill_align() and set memop appropriately.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3233
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Seems to give a PC alignment fault when adapting both pcalign-a64.c
(branching to 0x1) and pcalign-a32.c (branching to 0x2) where previously
it gave an instruction abort. Whether there are other unintended
consequences of checking for the fault here I will leave to others
(which is in part why I filed an issue for this rather than naively
making a similar change myself).

Tested-by: Jessica Clarke <jrtc27@jrtc27.com>


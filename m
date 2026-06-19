Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D987CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:03:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYt0-0002RQ-Oz; Fri, 19 Jun 2026 09:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYsy-0002Qy-HS
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:03:53 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYsx-0002t3-0u
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:03:52 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-662ddac3174so2146143d50.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874230; cv=none;
 d=google.com; s=arc-20240605;
 b=DsX0cYXQphQvuqPABOAtLFpGsBq6YWwK0lB6JxhpkNNFH4j96jez3yTDcW6UGGbWrq
 7BWdAh7I7mkGtOfGlRGOQcuY5zZH6bid5LvBknFExSPDqnaGBQH2hkdv97D7MXZC2qHH
 D4GLSBsjL0A0eUqKMLo1X5QDyEStUs7IfK3U/LKQYlq/33hAm58yb8JHTNcx4BiN0mCh
 SVe05pb5600PvGSaKMDKKFsUtjLkm791ris7/vdybRFH6ZB0J4GquMgj2HqvKG10R3MA
 vxdLffjlRPgdPOI3sc6DmcPFoSEvYdd/5fxKb4LA9ypNsT0T8Q/qBU+/1zqcq0p/v54H
 eN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JW26VVPqkAMOxRNjl247CGXg7GoH25izs4nXDUUhnzI=;
 fh=LUs0NoBcbUVkLSQ3r29K785bGdQw1m6PyUuVwDKWox8=;
 b=HKNkGgPqpHlsOuu+1O6thbJNrynFs0BCUJDfDvfdwoQDf2vku6IUa07+DROEDNwjmx
 TSYG6qv1P4Zke09oUqmIBmeT3Y5USTmiW/+kLT6Cm+uhiZOcaNW8aM67nzPLnP2/Ulrg
 RUzXQnBveRA26cQx7esQgLSdsoVkCquGW5lE/ld1RLLarf5orENUBzuCFaQCxTQ4fFzY
 H5wdoHhBLQdsumSZvkw0QJCCjm28L4I1mh76gVHO7NMITgmatXh7iY1jJfZlA/9l7Z5z
 MsBk5PTi8lPZ/V5c0x/yAY7BlLgxu9FODglOnB/JHE9eYNF9LgWQtBH5CLDY0kpXdghU
 To8Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874230; x=1782479030; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JW26VVPqkAMOxRNjl247CGXg7GoH25izs4nXDUUhnzI=;
 b=F+6LSoli9v9yxDHKaGZMtyfGB7ODxrREtOIR4RIyVnk6S/2099U+v5QdToJ1r8Geru
 Us6KpD54sQDDfxrA+ztpi1Z6i0lOE0Mjnsd2MfyJZl1eg+sThLXNvuYnjvtp15Wg+Gm6
 toL8bSlvwFPTwMU3W0pQpaHNuwQsoZk6LwmBtLTxhhV/cLKbw+j5/6hEgGDsYEPESIHI
 Ue6r8Rhj0xXINqJymtJ3shvsPfZxif88s0HteJ2fVwnIf3wSHm8ElVN8eVVV9zBb3BIz
 /53Zw+g5moSQf6B5oZSd8FMDcqD4aVJSLf12BzQonmJ4Z/i3KptAVwrb9K7PuFwfeEtd
 6OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874230; x=1782479030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JW26VVPqkAMOxRNjl247CGXg7GoH25izs4nXDUUhnzI=;
 b=cal4s96yHa0Esn3PW66sWP+a7xoA3nyLL+Mk+l8w566REz4BknfJ1EBxaNJa0yuKtl
 2eSr/bUGbeQDxykSUGkhaJZ2SS2J9olwlkcWZahW7pFSKpi2CQ1GBi+Qak9iTm96B9fv
 QxqFxeG3WijZM/OtPP6k6UqmR5+TsY+ZiTf7xNRN1p4LRD20QkrfVVmnctjn8JL/VEOr
 apZo8ahviHMcZZc9JMeYw/JEyFDBSk7zzqiBp264bmAH5AFk+pWJVFyANJ6RiS2K4o/9
 waaO0zmuIWwiuXyP5FSuLPnjSNzosJCEwBlK3tsaXnRFILoBKaqLm4MUhegNKYOdfz2i
 Q7Mg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/jgLbgGzS8jx0fGLu+HmHpczhG1+E6F2Ah0lACgCuxJP22eTgPA2qFuTgcVqCBFdHCn9k5bztsJg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8lntETMe1x6GVHY+S1wulMG87E3iq2UzMm0h93phTicGvwP9A
 nabu4uIaNybFyX9+eVS7c7+qmhJtTiI9k7prLT1F45qltDqMhf7g04G2W8nD1FrqY36QH/OofNh
 kQQ6bdYq7PTX785omnD8pY5x3zLdgYjGQ8xMPlvdSA7hWdUOzY1rq
X-Gm-Gg: AfdE7ckHuybvGcS6H1LoOZHRxlOBzLfLm0t2ZSwGM43mTCnN3dY1xDCl9oKd9/6QyP2
 kf1d/mHT9ouhACyWwfCgQffSdIOA+eeDCuB7EFzY9J4fQFi4vXCRKEXWTMmVMaWBw8/wJCKjyXc
 OtFv/ulIYt6/CujW/G937feBwWqdMV/Q4o7a3Io+nZRcXekbkhK1i6ACTPTVvnOWkjBrZztIgrO
 QA8bj+lAGbGp98+6LH5X/gLQC8wvcrHrxiOuv1bHo56RW33rU0XBboqNC7IOKY5H5xGApJPP5Ao
 KOyzF+W/n325h9sq836hUUVwNYz5WN03X3l2oFn2VPhGljtLGHdLj4Qc
X-Received: by 2002:a05:690e:168a:b0:660:9c4e:a453 with SMTP id
 956f58d0204a3-662ffcdaf3dmr2792700d50.16.1781874229499; Fri, 19 Jun 2026
 06:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260618040718.572950-1-richard.henderson@linaro.org>
 <20260618040718.572950-4-richard.henderson@linaro.org>
In-Reply-To: <20260618040718.572950-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:03:37 +0100
X-Gm-Features: AVVi8CdQdde7Rbq-Ytrj5i21d13XmK8187wbZzzVqHBJHV8FVSh2JEaUuFSrPEM
Message-ID: <CAFEAcA9_M-eRirgZVhdDci9_hE8iEBGm1nB4FNVFdikpX8FcSQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] target/arm: Generalize sve_compact_[sd]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 18 Jun 2026 at 05:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement with a DO_COMPACT macro and general purpose
> predicate handling.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


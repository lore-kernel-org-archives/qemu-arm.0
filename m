Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36A1C88E6A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x62nx-0000l9-TY; Mon, 14 Sep 2026 05:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x62nv-0000kf-1Q
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:16:48 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x62nt-0006AU-Jf
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:16:46 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab20a32so1415521d50.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377404; cv=none;
 d=google.com; s=arc-20260327;
 b=X0L78tIbeLq+Z3KJHnMjeBdNIVmyB/oJ5FUjX8RaH2LM1t0qVhYOk8JcpW8dkX+mWs
 tVOkqi/QYYB1U9Fx6ol4xpDM1ynaoH7d2bMFkDzkbHBhebef3tJLMkt49tpEpinSsXwM
 Zps3mY8Bjanhu2ulO2jGwmSWsfF64RSku82UlSUDo7zI5i/6enRRQUEzhffnv+AeZzXP
 7NgsDAK17c5KtkFqIam2AQFyJTTo3iWFJIwSGpHAy5DlstPTbTjPgl8Ilu6qK2gKbsJw
 EFDzd9OC+RIC6o3e+Kww/GrR2udjkvnVQTSP8tbhn2tbdkQUuyayT7oqJgqSJhqMJXP3
 ZigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cuVNCcrSOpi9sOD7sQqHogVyBc5TXxEpbbTv0EpMwhk=;
 fh=iRBR1iydTcSOyxzATQgmbspL4DwNW6FukaaSwGNW6Go=;
 b=Jx5NGegNp7WGHpdo02QX+UiWckwuPGDd53rasW7c/o0nEBtafoBCSD/V1Qx0qyJ0mL
 mEF86nG6wl4LEt+q6C2b0fotmDr4PEdDj9UjB6x4t0zM0OEjvuxncPUTAmQ3b8Lq9V/O
 W8UVqXdeJ5KSedxPLCmygr5F7iEGC0l1J4VZOdZgYjs6fXKj7agl0GoyE8NkFipGlk6f
 JRiChk2DgATbxRKtZyMr5BOuernJaOMxM6v8H9ilPLMcGN5GxFNi8NPjIa6p0x71nXsD
 4UW4bAim7qD5zz9rPnjD+pR8hrYY/HD8Wg/5SI4KuJbKlzRtgXMHiQ/ET5aqk/REudQ9
 4d/Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789377404; x=1789982204; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cuVNCcrSOpi9sOD7sQqHogVyBc5TXxEpbbTv0EpMwhk=;
 b=Pax7AZYyFArV9H8SnZ+9CLzlWCHUmbdUXQVlDt/QWPPNyD5UushHlyWugTrrpLsmQ1
 GHImuJHQiCX8cCWq4LZlB1pcMhOuoqU15HJjW/jXEY18wtMfWZ6tf1FB7c4ISAVDLyIi
 y/Ldfmyrhgs53I5nJT7gEAg51Cvo/cpK6SfUwSV2BtBBfbSTFrMSPG/ftthth5oMqVlj
 4PYUFzyOAqBbJvkvPejIQM4LImgCdSRCzIFJLMKZBDLA20Q2+Peq0TDP+QICug9weBhs
 EEoHnFYzlASQEZQykRO/smpVOXbeeTkyNwrdRMlyt3lKH6h4zYTJLNULrOcPr9bDgCGN
 eKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789377404; x=1789982204;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cuVNCcrSOpi9sOD7sQqHogVyBc5TXxEpbbTv0EpMwhk=;
 b=H0EDYAkqj3ymBbkSigo0P9KufhauToGIajlwZp23NkPtaWwcRYcSAzICrI1Lt4l2+M
 fm/4Hi1gHtBOYEppMSinwrdvYbYiADZGxGPgdD0Mc/yS6cvP2FYen8bB/gSy4Xf6Ybuh
 QTMuLDdPDGxsx9TkltCtpCGD9m6TLKNIpBVDjaNKwnnaXdDuuGJZ+zX15BeJnPCJSD11
 u5XPTnXxqMOzJ/wdTdQIZ8v+55vpPpPV1HTvDRq79l3fCG28ocMvk97UxhdBSP+y+/mf
 /fskycD4ahFn+jMIEOlzgtPsQPTNmbPtpP0qa3mWLfhjoSWL8i0z33jQRYta9O5CCHxx
 RA5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0/6Q3X/2VEO9E7F8X9ID2HnPFEOYbNFvbDKbEFyCl5eBcy9L58Ut0FJlqWS8wiHxkJXpmoyweWg==@nongnu.org
X-Gm-Message-State: AFuF++m2Rc7TMqUwZ0RCytf2Dq5tAJfBIe/rMGOHftlsxTzyScK/BYU/
 1Zk0wZeUxtx1GzCHchCqtxVrGnX86urgL5wcO3NM7jd+3Gb28bUa1uN+3fbUcQaNyiarWwk83XF
 mLtAVvrSfwbfn4PxTMZh+pRVJuV1Wk969TDUuDMiyJw==
X-Gm-Gg: AYBFou3fUSKVjv4h3ohIhGWbgrzmNRmgX7GLiTBUE2RVY+Cn5UljRsvtKFSjmLzlRn9
 StNSWSif7AbzP+yNQgvzxyxwidQSkLeWFcFn1O4hC1FHtNcuvgZpJyu918uAtKT5/VhHZadcr9s
 6nPsTr8rEbO3qAf/TW8xqCCFxEL7dATmHsq74r4rUPp6E3jh3Fxp/7Fxa/dRt0pT2B+gnmdpjAR
 XnhukxgRpEiGJ4JhokEXOQRYiWtcxkT/8IOmLby/TtftlfM143Q5Sf9uZCVx+CImjPH01htAEDI
 kiJ+u01i0HtxEJC7Dept4HB+xwoV/k/p1GDU3j0KpL8hm0oONt22vuo+dVObfBb/4u7lTFVGuc6
 SMGLzh1yXjCXhL64NmKy2FIEncbYJHV7n72Yf/zU=
X-Received: by 2002:a05:690e:4553:20b0:670:fdf6:dfb6 with SMTP id
 956f58d0204a3-6714dfdaae7mr189754d50.21.1789377404174; Mon, 14 Sep 2026
 02:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
In-Reply-To: <20260806173123.333423-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 10:16:32 +0100
X-Gm-Features: AcwNN1XiMSb6RZJn0vc6KF7TWvHzPXlsYl3L7Yoa2djgaU5fqKp5cuTo1w0l-_4
Message-ID: <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Thu, 6 Aug 2026 at 18:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
> within the range which are not explicitly listed.  Previously we chose
> not to honor the TID3 bit.
>
> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
> on these registers, so we might as well honor HCR_EL2.TID3 too.

I thought we agreed not to change the behaviour here? Is this
just a "forgot to update commit message" thing?

thanks
-- PMM


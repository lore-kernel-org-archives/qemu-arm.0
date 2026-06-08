Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9002BCD6E79
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 18:02:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWeIQ-0005Wx-D7; Mon, 08 Jun 2026 14:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWeIL-0005Uz-TE
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 14:01:54 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWeIK-0001tH-K1
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 14:01:53 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-660e9ea26b9so4575054d50.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 11:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941712; cv=none;
 d=google.com; s=arc-20240605;
 b=dPFBjFfjheeVFBM2nq0EL79lmY4XK1l5a3+UNtMHF1YI5ld46AnnSrGuj/AUBR2mBx
 Mr3kH96n9QU11cC9nMCQLCZqmhec/3qqt5dWteU4qCpD9fAP84k1s/I71o5In8EicWrx
 BLyNeXD9jyivtkVgt0UCLJ0ikOPznpAKccEOoZ59dic72hX6e4pyR4hsyEz6l2hQgC8h
 3N0GA53K642RNLKN2ikrIH/G3Sks7DiFe8BLGj40QSE4I6RNqlBjTkIJwc58RzVcXh2G
 06Fx45lo/TPfTAJhe2FHucmgsZx/Id2QI6aNxw9XIBKS6Nvq4MuowVVkLiY9sJeHGOxZ
 CvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PbmVMlBTI1D89FAE/1WRXmY+YS4Lim1UF2iTW3DOm/k=;
 fh=NnOYJFwNLe3ieDAltF+t7d8up8+ubOAyoT5DIJHPR9E=;
 b=kCmaGfNMVflTjZfhjfg7IX/LHeuS4rr9pkyx4a2/ask0jrk4xKovPc5yPVOHgSG/G+
 U06QxWVxFVvmLhaqTezzPpCo1Lua/S1XHTMu3fBEaYguDhhiHu0aY6NQgh6zutPVBDAt
 7PaZftmhBatHtl+mzJ/7o2vh+850Z4P8OU02wlBLLlnj0qJFpEQhypqcVp7bHtlyqy2W
 FUwVOIBOI1Y8czR2RhFs+nQQFfqOG4YsBUFDkoazpNY8Bg4fboYLsuxoXk9DUQ61Z9Nn
 /ZTlGxsf3eXtXp8cYIJZOUjHZJVaJfT7dZpc+1bNQ7Llv5hiQ5JTroZwZIu2THwS3aiq
 uDeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780941712; x=1781546512; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PbmVMlBTI1D89FAE/1WRXmY+YS4Lim1UF2iTW3DOm/k=;
 b=mFBkiVp52yvUm71FrhH2n+jlvfCk5TvtaEqVTYLbNIGnmRFNY7USzbPSy8Syoa5KzZ
 hbWvJet6LBbMqil7mF03uQZ65sbHrluDGSw58zh5iKTEhpn/abDtVWsQ350ASqpc2vbg
 DG96fiPDqGY7Ex71YPXFE/5RcapGkAeMzYFdj951wUTPhBOUdz1Pn3MsQVPppAVK+Pxj
 0fBFVEjqmuun5Cr4TO3zTCr40WgZwNo1Ai/14fKAOLuVolDjg5vkkoCe3a0GtZFClGhH
 dBqz37T3oHvYdXE69VqXW022J51yi57hgItn2syWTWAZgVlAWEcheA59Ubtmvtj5B/MK
 50qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780941712; x=1781546512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbmVMlBTI1D89FAE/1WRXmY+YS4Lim1UF2iTW3DOm/k=;
 b=CiFMg/Afs+OW9hRdj/oP8XFCCopa2sHEoEFT0R+7ivRUYVWbCcF84mxmD0mTYVaOsL
 W/JiKJDSreH0X8upVXOUoREXg/B2lDZVPqNpypyjXRXtEX1shEhcIiMUGRzap5tuJTjf
 qdwacmNWbxIjEVzNWK4YByMq/TcgOoFFsZFSK6lkVCplx+QAa3ih6BMMBuAn/cdFn45b
 beZrJK9IzfHfaqX/67kCW3K2wtMbG5CAGtFZGChca7xcp1c0KxZHiKWfJIKl5cMajTLV
 StnJWlQev9JNyquKO5R/vlRv+hYmo9GP92fNHWegnM4DnaD6FUV3RE77tAns9Z1kS9p/
 hyDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2kAN3hpYq/sbA5Y93TsppL/0+fy1v/UtDaO/jTa6SX0tnblcYbsSCRQJ9N7SpdFy1gj8zs7FtDw==@nongnu.org
X-Gm-Message-State: AOJu0YxoN2JN3+FwtLIhBW9wf99JxgOvtzKoMtv+Q7MB6utyMIzR0NfT
 PKDs7TmQSdCKi8jOAlzf8id0LYbycIFbnBh+CQdFmMmH3lCBsSOuPorkKlWEcIPvkOPGAx/LDC7
 3HoV31odnUX+m1a9GqbZEspuFl0AkNq+6r5kHypKHxA==
X-Gm-Gg: Acq92OE9QnzEkyshsFNQgVtfeowSIRunqa9xe7/Tf/bN81wuLd028n5OXp3CO3HKWqD
 iXm4ijk+/a8/ATtepAbDS5ayPN6d79L2+BN86JQ3aLLLBRUSiHwstTOLbeXPks+BsStxOBU0HaW
 Op6MUAaa3Zc/0Queudu0nXYMAyTOUzSw+N/4juk7y9GLDGuNqieMKs9xsUP4Mf5VsRxHooGHnv3
 x5hWbm6PSN0DbaFya1abG7j08pMx7U55f4BbYMQdHcGg31RGkO5e4+8jQkG5FW7i7xe9sJpcAih
 xl5Uow5yC339QgaIq+Izs7T81CJNm/n13R1OJPYxlT/g2MxWld4G7o8Q5xdI2D1NNihNARD3ZtG
 YD7zTefQsNZop
X-Received: by 2002:a05:690e:4088:b0:65e:a838:e9d1 with SMTP id
 956f58d0204a3-66106facf32mr14822490d50.59.1780941711504; Mon, 08 Jun 2026
 11:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-12-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 19:01:39 +0100
X-Gm-Features: AVVi8CfhupZr1gs4g6lDkJ1lkkyKBM22J0Sw6aeJNxKrMvFtuGmrFCSLAQz9rNI
Message-ID: <CAFEAcA-Ju8GTfpahUiypBSUyhJNURk0-63PFqA5bhkY1w6EmZA@mail.gmail.com>
Subject: Re: [PATCH v9 11/45] target/arm: Implement F1CVTL, F1CVTL2, F2CVTL,
 F2CVTL2 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Wed, 3 Jun 2026 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


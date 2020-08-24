Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2645839lfy;
        Mon, 24 Aug 2020 08:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0nLuxkXvYa2xwI7hQ0OwtiHrqskFQuC3Wba2NK2yw5U4rCW9TRYs9ZpOtpUj0OsktE4gS
X-Received: by 2002:a25:d209:: with SMTP id j9mr8409183ybg.205.1598282485759;
        Mon, 24 Aug 2020 08:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598282485; cv=none;
        d=google.com; s=arc-20160816;
        b=qsZYCX55ENDX6LUdKAG7i63VhQc+7Po2AgS9sFceUezKBAZKQyX/a/jqP0CZDHf6gQ
         1qSfneETEdQbXBTt+RwwMGDKC7wU8WZoBHkbyRCp0tcVoko2C7Bu+N7FQsyQKt83+Gds
         bWzUKECbDKagXamtFMR6QSG+VBPSgX3oXRV7+hy1bBxqsCbqV21tQOM/OYcA0DBOKk5t
         kSkrLECjhvmhFVdqWwkaP2ZGEEZubY1jZXOlFP/O5CIu9T8mUdI11yipPQ+SN3bfofyg
         pIzYCloJRTwchz1LwEY829Dz+uIcIEETTTFvZUmWKxntyYarArvnGfDT5UOsS2nkr3XH
         bjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2DSY9LxI4LrHoalgSGkJ/BeHmNyn6l8uUx13JEKQeXo=;
        b=pXQV7DSl1oNjCnrLm1yZr6QKu2CtLWs361AXipkBgIBY6SiI7phnQ6J9svlWNTeB2p
         JanSJXL6BG8k0Yt0H7A2NNBtsjpoM3d57V5uOPEqZIIK45bnX57X/rWzPDSX7TNnDn2k
         CnhRE1KhD/RvkAhsNtyyu8fKKvGc6SrY/tTC47FQ3GV61PHIkdfvx8NhAYV8DEm8O7dj
         QFf1DAekCJZIMTyQOLlmA+1spRhqNoNfVDTbRlVx5VE2yNhaRvZo+TxpkHJ7R3NwUlu7
         d7rfPJu3iOP6AuKtqTXPTR5VyB+hf2eobSnOBiWpyybL/E8qzW0y8bfaCd/9UjZ1uLLq
         qFdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPvTI3u7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b129si12034548yba.468.2020.08.24.08.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 08:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPvTI3u7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAEHl-0001jH-15
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 11:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAEHd-0001j3-Bd
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 11:21:17 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAEHb-0003AG-NK
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 11:21:17 -0400
Received: by mail-ed1-x543.google.com with SMTP id bs17so8424725edb.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2DSY9LxI4LrHoalgSGkJ/BeHmNyn6l8uUx13JEKQeXo=;
 b=UPvTI3u7/i1W+EhMEA00UDVpQkAPFiSh3sIOnJFy4gsSF79iiSD+1HrE5iRiljjaN6
 NLZAbCqXSwF0+MxdNkw1fnkj07MrxicUzuLkzdJ9NFxtQnp9y+K6CLyaSctFm2NGCiK5
 Y+vqYak+rOLPJdvWSLcyt5jB1hkh10pPAij6y9Q/ypgfmdDmI9ZMMEMlwjoxhMCLmEmr
 5BTWB4qKSIjqqKVtXrlVXajt9Jgt62tmOjbQHLiysF7P19H1heEau+OL1W6/Azh1quWR
 7PwslStyFoOda6Hs2K0S4ZMJgET1LjInmIlctnubseBDvbtvOgGChJ4hsiKZhAlKbbfw
 nxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2DSY9LxI4LrHoalgSGkJ/BeHmNyn6l8uUx13JEKQeXo=;
 b=PaPaVt3GXbHAJ83lip9a183W66DNVjkn3ZZ4XtkZxy5zcWW7uMaNwrwoXpLyFx17ZY
 gEme9Jcqb3hLUDb8GfvhfFf3gXj5d1ccJuUir85tMt61QvI43w1PXwalzC6aG79YM9AU
 rrrOGmzAWYgYOw19Y086B4k7fqLsATid0eFn3V4u3EhH1g3n083U06fJanMcYs2hV5KT
 uxOKPzTuhUZHRxbJXEbnq3+5zCgu1KJGyjd9fX4DUwnfMFbGPJTAYzQa92Vca9LLSjFT
 sYET/xH6bJkOHJ8WRUJMI+NsRJLUkpL4MvEIpEWGc97+0NkqcQrW6aaYAv0BCUfrCZG/
 6lRg==
X-Gm-Message-State: AOAM530NL5zY2wlzXQ/kLhbHVGzMFIYMcpss9dRVqH6/k43uwiAKJQsA
 dJZpzDDvTrIstY0g58k7WRCFJDJA7hY3+z9IXyoFXw==
X-Received: by 2002:a50:da44:: with SMTP id a4mr6048556edk.36.1598282471979;
 Mon, 24 Aug 2020 08:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200812111223.7787-1-f4bug@amsat.org>
In-Reply-To: <20200812111223.7787-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 16:21:00 +0100
Message-ID: <CAFEAcA-mgTYGEaHPHe1Dx3aUcvXgNNuSFoSURyJzCijenxS_vw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Clarify HCR_EL2 ARMCPRegInfo type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +otBUkb081qv

On Wed, 12 Aug 2020 at 12:12, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> In commit ce4afed839 ("target/arm: Implement AArch32 HCR and HCR2")
> the HCR_EL2 register has been changed from type NO_RAW (no underlying
> state and does not support raw access for state saving/loading) to
> type CONST (TCG can assume the value to be constant), removing the
> read/write accessors.
> We forgot to remove the previous type ARM_CP_NO_RAW. This is not
> really a problem since the field is overwritten. However it makes
> code review confuse, so remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

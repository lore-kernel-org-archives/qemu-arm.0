Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp196375lfo;
        Tue, 2 Feb 2021 07:09:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEaeUpopopJUPCqBOePDr1jPbppi+P1pGXYYoOEdllPJ65WoaZHvfsK727MQHd6nRQJeIp
X-Received: by 2002:a25:685:: with SMTP id 127mr32396508ybg.483.1612278558493;
        Tue, 02 Feb 2021 07:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278558; cv=none;
        d=google.com; s=arc-20160816;
        b=n5MW4nb3Dex2Y6tAIRQZgUkW1Tprry4HbCcF5+9CxHa67uQtBAYJuMI67M9qwaVLfF
         aJWV3pLVze0O4xtPp+4vwp49m+A0rIYrI7eOeAfSQiVoMtC8AiDjQWx2ehB+kcbSRMuR
         6NWqKMm2RFOm/oxnNfkWqzMMGu8SuY2pRDHZ/GHq0MaeESY5zgnW1vY9ayzqRtRHMTNA
         g40D/SGoECKEGoToituD6TPatC1YyzYcKB+Y/ea1A7//z1gpAMWFk4Ne1NMFSBFagKD6
         DmtsCKwoImdcKFWiGDavpSHqcI15C05LCSHBzW0GZ9TrW/GLDuCYJUL4yLB2pC+iu/fD
         NHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HH/qTnEXS4eUhHqtj8g5Cw+sUyE1oSiIG7BsA5dW7g0=;
        b=olAS6V1CtbY0e3mm2hrVwEzi+wXo6TdydKVA/IMPzAi4BpepaQeKvSR3kZmZyqDYuj
         UQk47gsPUUAQsbrjwh0arR6mbpI4AVO2ntE/KQ93oyfYzXegfeMTOW9gkrqmcrNdC6/g
         fBPfgEDYJNXJN+i4CR2SLHSBoq0yPJPLx7x9YZ5W9sd/QB1x/mKAi+Nn5HB9wCnET+4Q
         FluWIM4pq2gylAtzwvi+XBUfgiWjWEk2RZ7MzilG7L/3/GwEzdG8U51t2gqPX9DFZlRk
         YXGalFZ6B8M4gZkQu5lbO5GbWWvEyg0gvT8yAkCPbSh6AUwVX5t+xe0ghmCsTuc45S8S
         /F7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pMUymucv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18si23893839ybf.261.2021.02.02.07.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:09:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pMUymucv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xIr-0001xY-Q7
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wyG-00007S-W1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:48:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wyF-0003kI-G9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:48:00 -0500
Received: by mail-ed1-x532.google.com with SMTP id s3so9496513edi.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HH/qTnEXS4eUhHqtj8g5Cw+sUyE1oSiIG7BsA5dW7g0=;
 b=pMUymucvZXB28J1ctpUB/RuQ2xgdNeoPvtXuXB736ur6l/3ehY/NWYDBPCCY98YlJe
 rRC/ux/w+wG9HU+U2KINWcEVSsLUhwnApQNhDBA1Klf8KtP05SiD/IwHLTDySueYNiJ3
 Vjd8EEv2bGX3vqv7px5wLuQSxuM+LrcIrOg4KpMsxhryFVJYt1CLZo+KMk3RsGhkTsIs
 ZkZ1hKma1089WdSaHdf4mASzLseOuwcjoZnDwBjc965G3LqMbeJAh771zD29zd6NrWAk
 FwqqR3P7GF01waLFN5qbV/SGsAc/fqvtyxrJqwDPXb7oyS5ONq1ud8iGgX9u6NfJeIvO
 aDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HH/qTnEXS4eUhHqtj8g5Cw+sUyE1oSiIG7BsA5dW7g0=;
 b=UTyPAW30yP5n1VrwjhcWNCYOMnVVpavu6x2JVpn1QUrl73vcuF4EfunhggjfXwyAWe
 v9ynIj+h56c12IVP4XH8kXXcQSUbSi7BTy/VXjkK8WYiniUV9js3dYHQ+ojpXTx+aPQ2
 +yIOFCta0ni2zJL0uz6oC4mNtzKfHoQPXul4EpMd2p1OB8jUXrdKa/QnfwDWWqiHtcMU
 E3YQMC6yz4/sGORGho4ZQvPRIDFdrb6Js+Pq8hp9AXSY7VDM1pNpQzfRaLYDkmGNsjfb
 XiEk+47B/WxGOu9L7ZPnm6OrBdEDr3JIoLzOkQ5dl8tgJBEvE778oOwvCU3+orEu7y97
 14BA==
X-Gm-Message-State: AOAM533ZRSlFVb3/ICElaXHqE3fSVcUgokSRhm7phs1Rqc2LdR7pWmeM
 tF4KSzuYkFx9U2Cic32pKgdwyUZcPRN6kOe4Rnmo31hFqyM=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr23596989edb.44.1612277278299; 
 Tue, 02 Feb 2021 06:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-23-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:47:47 +0000
Message-ID: <CAFEAcA-TUeDMqcWcUWVcwboi+pjUj1jZnvwj=ynaeKKaVcmPyQ@mail.gmail.com>
Subject: Re: [PATCH v4 22/23] target/arm: Enable MTE for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jCE5Zmw93F1P

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

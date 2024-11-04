Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2129309njc;
        Mon, 4 Nov 2024 06:04:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMxPFGeSumSwYqdrJGSaRkUglZwsdeeU7X7Yo+VXvXX/sfJxvjK+dFpYpHaVXIxo1DWcboVefIrKyKjA==@linaro.org
X-Google-Smtp-Source: AGHT+IFpTfaLSs0CKeakKHjnQumP/xGY0/hk6x6vF6gLnkrzW1otFryWQY/Iq0KBXcdGi8d5kiAm
X-Received: by 2002:a05:622a:11c5:b0:45d:7ebd:76e0 with SMTP id d75a77b69052e-4613c16aa85mr509849281cf.44.1730729095373;
        Mon, 04 Nov 2024 06:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730729095; cv=none;
        d=google.com; s=arc-20240605;
        b=Af6OjjjMlqKH/41tx3sGws0Ns2ebWRAbKXDueYTPKlGSD304fBNvxpsk97bDku5m5Z
         twUIGC1LxFYV7rz/uXm4HZ7lKWjgT7sgPa6o8c1EDUf+MpqAs2UXNZW262tBwnaBft9e
         XzIw0Z7A2M9iE56hMPmLhw+M4Y0hCixhztUthPxqqWn4QlA6TBFeovQwg0Uv9BKmXR+r
         oE2JW1ssAYaUpm9EQMiIHXWwM4r0y6padYCDABs3WCKcZwCDg8ZzOejwzFbUJSCdrT22
         m98dloHXcco0fJXKCw3dpV054SzRLjGMU+tTvtlQXJAvyUFRTFVwsGTm8hOoa1FBmQlq
         YuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qrb71dAyXhLrPOdskubCZa9YPaib8kba88lnP/u9WL4=;
        fh=Z8XRhrSr6y0HzzAPXAGGM5FLTrBDm6WRlP79tsOeeBk=;
        b=kjpAz7PHX4zSJ8TR/xLg4SA2tTsBAovifOEOBjB8cingPAutR/x1+ibJv5Kun8fDa+
         SX6H3ZR4A629auWorWEheKgB9sCgt24Tuc9g7FXp4ReZSgAryhcRUdLglC7H8kQrmIsI
         2CvBjo1UILEfR0BIi6pA+fFROriNRHTgEdtPwLpXBrCrnYVJDnvr6LeZ8PelEuPUEpSD
         wJq7CBNTD37dLnLuNg4PwDm3UNyBm/uST/UWBLcpouigIRc8/4q4d4qcCxjVpF2cmNX1
         vEV9/5V58po9+hSjQK2iv/SKhf2XBtHBeF6/1d0JFZgoOMuJitiFdzavD9Hc6+zP0k9B
         x5+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VZpR7svF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad24fa79si106278721cf.649.2024.11.04.06.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 06:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VZpR7svF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7xhH-0006AK-4q; Mon, 04 Nov 2024 09:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7xh3-00068a-1I
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 09:04:34 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7xh1-0005ay-Fk
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 09:04:32 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539f8490856so4395533e87.2
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730729069; x=1731333869; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qrb71dAyXhLrPOdskubCZa9YPaib8kba88lnP/u9WL4=;
 b=VZpR7svFtFiqBTewoAoF63bGGDkiyngQry3jq7L4rLoSDQZYcD0Qfa4myqjKcjUvJa
 CRbLOxXmbXuNEnuRxqY25xg20arxG2R0x4g6y8k1z9gaDcNGzWCjJFNs+7Q89NB/UGA7
 KoKBku/L9kxexRtXwhcjUKCC7J3aVW3vbpluOPVefpSjq0gfgxNo04O9PMpE89LoMG9Q
 +DQgNIUrFG21C3JyblE6wR9dSVDh6bT04lEmGrFQOuLohmsDXlZ0SRDA+LcejbDAQlZb
 V+248ksfyArvZlRBmOgwjtj/f127kUlXk6RNhaJn1MsZAxzJmxByD37g/cNeUoigrTsS
 OMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730729069; x=1731333869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qrb71dAyXhLrPOdskubCZa9YPaib8kba88lnP/u9WL4=;
 b=SRiLlioXKUxMxIDJIOJJYZb00qvA8Db9A9DRKOhk1lvCY6/qS/xVJ3sFiXhcswujvL
 yEnY2695dMNqTTQiYpvbPj6mbO09lYeLxqFIPfilDblAkNmP/2gXMzwuUrzfJZwHnMSh
 3yoCdW8EgGP4HHCERFmYEau2kZQzRRoWrrbap6jJHHlR64gSivTj446c3mXQziUuf5wp
 e15eoFRjKGx9P8IL3LZiYh/wrqIt1ZEJf/lWW6JzINAkZpgMQOcbCOjxBMQjH1Yzcq++
 eAV36xb/PRqjMOjaKH9vfp7RzCIThCdKBN3KTreVor3rficJZE+17foNxlESFlHj3ZOo
 6GmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAOq+ccYBbz7Ph+fcpp1MBJkhKWKXl+FPxhBKhxqIY+T1/6Njaav9+L4baLlRoXkM/Quy11zOE6w==@nongnu.org
X-Gm-Message-State: AOJu0Yz/a9BP2CuDXRJ24ejxeFZudZbPLAuLGaPJd8Jdm++0yyHzqk4I
 0FIQdcydZZv/wHwQoctLAP/jSAiKPXDLcDTonoOs+tv71Bb8Mr6Ku7GZ26eO+aQUagCFXHD+8z0
 Wy/IQCaISWCxoUW+iRRukJCNOnl30UjUaPYi7JpCjFf2lez6T
X-Received: by 2002:a05:6512:68d:b0:539:f593:c19e with SMTP id
 2adb3069b0e04-53c79eb5fbcmr5713772e87.60.1730729068695; Mon, 04 Nov 2024
 06:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20241014184847.1594056-1-roqueh@google.com>
In-Reply-To: <20241014184847.1594056-1-roqueh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 14:04:16 +0000
Message-ID: <CAFEAcA9Vikyioaz1u6Hbj8ROe_aVnjnwsg-yX-TV-NCs0U3hHA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Changing log error to trace message
To: Roque Arcudia Hernandez <roqueh@google.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t0baiY0ruC68

On Mon, 14 Oct 2024 at 19:50, Roque Arcudia Hernandez <roqueh@google.com> wrote:
>
> From: Nabih Estefan <nabihestefan@google.com>
>
> Converting error to trace message to avoid spamming of message when
> there is nothing to transmit.
>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> ---
>  hw/net/npcm_gmac.c  | 5 ++---
>  hw/net/trace-events | 1 +
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to target-arm.next, thanks, with the commit message
tweaked to:

    hw/net/npcm_gmac: Change error log to trace event

    Convert the LOG_GUEST_ERROR for the "tx descriptor is owned
    by software" to a trace message. This condition is normal
    when there is there is nothing to transmit, and we would
    otherwise spam the logs with it in that situation.

-- PMM

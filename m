Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp58730ejk;
        Tue, 28 May 2024 09:17:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZOxqTB2PZqElUOOaNyPIWRq+qETSgY1onH5QiClXFRN9q+tE9Bnget7I0R+ls6CLr3dF1TNbbJVzoNNOz7vAqw7aItBtR
X-Google-Smtp-Source: AGHT+IFWlj014G9rZKveRm/6b5ulCK3q5jILSFLib8rjGemG2V7UVqw+BKYRg04qs5NSqp/3iBVI
X-Received: by 2002:a67:eb51:0:b0:47b:dc5d:6364 with SMTP id ada2fe7eead31-48a3851f726mr12082829137.8.1716913032073;
        Tue, 28 May 2024 09:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716913032; cv=none;
        d=google.com; s=arc-20160816;
        b=jDq/ODT0wg66wqw6mmsbjjXEVQTeWBz6Z/x1dJA0vWBxdVW0dNcP0MPNkO+OlUOU9t
         5Z3c3oVYjcFZVO1el0blZYAkCh5bizDbbgopNcuxM11oOm55mixEchXvTF86j7dpH8M2
         iSrwyxI0N0an7nlUgJXrPyKHMReRQuOSBjJCAgEFIADXcuEq3FRTjPwP59icl9FmL1rW
         gWV5zitDCUYgT6h14TIdrl/EUffo8mMKMh8xPIl216vtQz1sRUTOM7luUouo2rHkmmlb
         x1mqUk0Pw0xz3pZPq6CArVys8rqNDV1p1AvrtseMDRHBWhKg3l62kfnvKc8HNmXfCl38
         A6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tBgieR/viPTn3U2zbnH1Ut5T/F5fwHVCaQDR/eJLJv4=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=sh5fqK6qRAgBMplkkaE77ZUlJPupixvk5a285Z+pQWqgSBIJ276X6WEVVvbSDdVZO5
         0jH48uiNZ60D03O7w1lcCCFJOB9sB4oxwxZd5CI7hgDZxCus6FgC5XHGTAuoAgAefQiw
         6jaADKR2Ak2vk7i6K3av1NGTkfAkf+mKhw1agfiV5SDbhcgC7YZtukDbQEzXWZ5c1Vbk
         wrA1kzdQZqFGTORR5hYeR9obpY2vRceGFEnCUL3pFbFL4X1/ifSM6kamyc3GYqXX3A5c
         pZU6BmYk+x88Oj+JLciL2zBU+hvm/ktOIPE5ra6+kUiumTbcRiUIUjHygU5c898rXR2q
         ygKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYuY5nD+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a3a412869si2047280137.750.2024.05.28.09.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYuY5nD+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBzVZ-0006lc-TL; Tue, 28 May 2024 12:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzVX-0006iq-8F
 for qemu-devel@nongnu.org; Tue, 28 May 2024 12:17:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzVV-0001nw-HR
 for qemu-devel@nongnu.org; Tue, 28 May 2024 12:17:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso1746709a12.1
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716913020; x=1717517820; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tBgieR/viPTn3U2zbnH1Ut5T/F5fwHVCaQDR/eJLJv4=;
 b=dYuY5nD+LosIUXPuFo3WUSJmsw2DQuoj8Okax3jE8wswtQ5drfEHhIuo+FDwEcRPiJ
 wtSvShPLg72di9q4xJXZ5FnUAm4cNRLRd9hW1n4Wd784B+5mHXSn44pgmpQdYB/3nETE
 o33oGjPyEiWtfiJF7GNsoidd5M0QITGhF9K098HMKvRdtfxLG0bCwByR5veYe2F5UBE/
 tm9iV3DgM1A/Po3zM1FAJUFzMpfI8zwT/PSyfVD+odbO5sYRHyWcHi+Cv/pdQTUwvmmV
 /NhC2cIZofrUEb0xa1QIeDpRhk+6h8EYGhYv8J+KEZD9hKoEmtu8LNeDov7zjsgOAoE9
 d1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716913020; x=1717517820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBgieR/viPTn3U2zbnH1Ut5T/F5fwHVCaQDR/eJLJv4=;
 b=SHKUTD2dMlPVcnPi+LkvpRhS1OlxcAqIFGAfwM8df4ApWXbRmXjCYb2P2GowaoIPAE
 zNbBgIb6aPIDV06UVrEvgy9+tX2D5AIOUnoHS0jogjdloyQa5X84jAUeIhgldxUGM9tA
 bp+4x/Hf89MnugKlwvocVEZiV4AYqIVfcLcdJbql7VuotmdQaHXkupYGu33lSL+I2cvH
 AfRw2/trkIJ3XFFO1Vp+bYe4oLRHDO9MWa5m82G/AWG+k0RuvlY8eXCyq4dGBVsemWX6
 hJ6yuE1uXxrZWG6113EmmgIAHlU/17qmxtjI7NeNb9Llkmo3iQNxlysQ9N0fIBNThrJe
 /R8g==
X-Gm-Message-State: AOJu0YxpeBz3DJ8yk/ao7fb52LwIeRYZYHipiHm+mxDUFEe67M+yv/Dm
 IRngqiHGikq7YYH4g2TvNec8F62/IsDaapLHAa8ug23lX+JwQ/0KbJfeXL3plxf826rCQxqhA71
 GWQ91JoWO+QHBlJ6qqPDdPUTtdir/NtiB9S+I9zUNLa0F1tNU
X-Received: by 2002:a50:8e5a:0:b0:579:a157:81c6 with SMTP id
 4fb4d7f45d1cf-579a1578959mr7600609a12.8.1716913020083; Tue, 28 May 2024
 09:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-68-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:16:49 +0100
Message-ID: <CAFEAcA-e+80XkzD_cRnyJNZiqqDuZ-bdm8aCVg78jKVtqbFxug@mail.gmail.com>
Subject: Re: [PATCH v2 67/67] target/arm: Convert FCSEL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S8owxRtLi/yg

On Sat, 25 May 2024 at 00:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

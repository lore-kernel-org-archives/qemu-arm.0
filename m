Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp748375lfb;
        Fri, 1 Apr 2022 02:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7tFLEZYHCIy2d1TH+wkRzVQzIdEZtf/1Bzz/xMw6IeF6TGOl1i+cix5q0abFqe3JjqsAK
X-Received: by 2002:a05:620a:d8d:b0:67b:e95:2975 with SMTP id q13-20020a05620a0d8d00b0067b0e952975mr6096895qkl.115.1648806369985;
        Fri, 01 Apr 2022 02:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648806369; cv=none;
        d=google.com; s=arc-20160816;
        b=VsXy1oHJcgUR8fOY9eEzPpMpCuOkQcUWs08nXUJ7rsslzkeduOtPKsFu2P8pUqhTFt
         ycuAHw3vQgy494W5ilTGxM79esXsG8RCFgmCANn0Yc6c2QEz7wdLlOZyIlctsFz0edyz
         oSajrQP7nvbsgalgSqM1b/spyHfXuCZekMqBZusvO531vf7aCfxtLW8ho1V4Ob0VG1NV
         IesZEumS38I2Sum3NKv0KtQAIBQMO7dlx8EYiKzy2jHQybjcmMAtiGOIVdnAnEoSIKQu
         ajBGtWYkVSde1a1ZgbCbqCAjAiGjP3BW61hhDE8R7ZCEiBoRWgngU5FZbvqFhY/r00JS
         NU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsUpKboYlC709IcaNNCAjxBvqN+MRTBabmItLNsSlpM=;
        b=SegllV/RnDVsi9uctroaKG8lguOwM1Q0xT3Rrg8A4OJ2dGFgkiuX5Qa1pshGhq/NTh
         MVYwgfcouA/i2/MpX9hNxcjEYz7P7fltFRjk4uotWfuyGFzj6cBnDQVDe8zGEcC9XCUD
         qbdg933JArbz3yK0v14xmDXKZmRNIPp8TTadoVUdeTXRSR160xE+l/k795hR7JTAlOVM
         eAlPu4WnE8cE39vKBYRAUxTC++GsU8TeWXBwLOkW/+mXxFhsJeHUgP9QlO7nktFNjMxW
         8ofhvJgFbVoYxw+wSCHPNua/DVpr8J5loin2fs/8Jom3iJFlffvcid6qtL98YDvOjxWk
         EA6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="kB5/JH3p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a37a902000000b0067ec954803bsi772179qke.716.2022.04.01.02.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 02:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="kB5/JH3p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naDr7-0003u8-FC
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 05:46:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDdj-00068p-Tx
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 05:32:19 -0400
Received: from [2607:f8b0:4864:20::1135] (port=37798
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDdi-0000bM-9x
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 05:32:19 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2eb1ab11436so19530297b3.4
 for <qemu-arm@nongnu.org>; Fri, 01 Apr 2022 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsUpKboYlC709IcaNNCAjxBvqN+MRTBabmItLNsSlpM=;
 b=kB5/JH3pNyTT7mmHB9m/kd4n1QVAO+IVbxdyipQoRJNZxHChQDu9DVCgHHXltsyLri
 2fNPsw845kKLv28GOoSsyI8CCoHUlCnG0bDEUYpHJzRs9wFnaoWXzzNqYyh2vMkA1/rt
 J5RBAEap+sw+cSFg/kqQU6W52/2/EnDlnGg98zNWHc2YDGaGDOqpFKlO8j1fRbF9jmFU
 6PoTIPeBfL7tvhGAPw0eJm9Pha9QZEdDH8/tnBsy3/XjgtU+b5oQ7twePlp1zLTNZaaH
 zlt9TBNcIgzoNKlHUT+UvhZwRqgGerAD1930D+eXkhYm1QvRO3goSSqITFBeItYgxQbB
 gf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsUpKboYlC709IcaNNCAjxBvqN+MRTBabmItLNsSlpM=;
 b=kn467bEcDtpWITfD7v2eiAQ4nZWFrBujbcfjK7IiECbBe2KX5iSt81LHIXJ+pF5nOE
 YJ/26c2aqI3UOiRefU5AjazuhR+i+2LCb7ExQv0F0ZGPaae7iojawiwz2mkTYaHkFeSU
 wcwucpiSL3yx7zeyEi1sDRaVPmb1GawNaTwy7F5W4GOsLaV5kRZWCse4MeFk1w3Wweap
 LA4WxFPxAuC9RNssvj8EWdrfJLI43Tc+FysaaoJjul3yttGdwpyV3QWsyfu++1iTExIg
 0OKkVhCyb76uw0P/x3PwwlZ6k/HQFaY9r7I2u4aV5sipKjhRGWMiFkfu+IPcXO2MFxxO
 kUDA==
X-Gm-Message-State: AOAM531lq/QvZj1SuTKyq7UBnJkARsevRd5CCc+hESJPYI990IwgEm5D
 NJN2NtOqu5FxcEWYOtEnrzskGM6cHEPSdR0CSjnvSF9HhXNN0w==
X-Received: by 2002:a81:ac15:0:b0:2e6:d7e3:c4ba with SMTP id
 k21-20020a81ac15000000b002e6d7e3c4bamr9317450ywh.10.1648805537012; Fri, 01
 Apr 2022 02:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-3-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-3-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 10:32:06 +0100
Message-ID: <CAFEAcA_uKXwBe4U9QxzseEBde0PWuxOWZAM2ppep6WAUcLty9Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ftp+OZOzhzi3

On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/stellaris.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

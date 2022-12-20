Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4437133ejb;
        Tue, 20 Dec 2022 07:55:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvbS31CuJEqlGNfEUW4w0ytKCfLi6yGlh2/0fNcBx/C1Q5XwwWGnfu6y0KA6s1WIny3jYjc
X-Received: by 2002:a05:6214:5f02:b0:4c6:f65b:2e16 with SMTP id lx2-20020a0562145f0200b004c6f65b2e16mr17320137qvb.21.1671551715617;
        Tue, 20 Dec 2022 07:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671551715; cv=none;
        d=google.com; s=arc-20160816;
        b=0pUSBFmbVnArOIiFuAmpqxmiybHClsCfwsQx89csRNMkmjRvox/8gLSwdPXPFHmB0/
         pciBq6LnTo/K3+bdyR5fLLGRx6n0Pk/qEE5Renbc6wMIH6XJx342Z1hJR2hCXkno4DpQ
         qcqyteNvWI9ZiFQTG1stIR0Lprud3JJVy3BGz7iHEF9lgPZd0oO0JSSMlOcldRd14hsW
         xOry7+XVd7hlDU4zXo5Q8N7k4pu7fbFH3Dp8Cc4sMRERq/w3LAgbEoEw6IUBzRqTVbCQ
         hbhfoRiDqNGBfZRenikYtdQrinj+k6yhpxE2qkhMuGyAstPbhY6SZ6ePJ9neP1NgM9Yl
         iIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=esxV+JAxsoi8ZaSUALEfuVHkdZbV6zRMhSOMaRkPlRU=;
        b=iAj067wTyAL72H40E60lJHmSH4djcmKT0Elc/CCBIy6CwWN8283T8ycdyYoWOXM6DF
         ns1/fAdjM8ne0Q/UNbrNh1iyeqUx2b/EqpGKfMYdtkzv4kgPAT9wswsirfltPipyYIy4
         Wf2OmYIzexw0ZIEddYnS73gpFl62Hpd7+3cztCbeKx38g/e9O7r8fzUrPmdSDdZP9maJ
         58NI60iMdUayhrlMddFoPg41jeTw7SO8P/eW6uvLGyZ20CdmuRM4BagTXBJj42YcPJ/d
         uchxV1Y33GDs/04jEHxgDaE4oE8DpC28gWZM4WPOMhxE9EV0sxHbF+74a6k3l3YY49Sk
         SHkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=voqN+p+3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi6-20020a05620a318600b00702315a7f34si3796258qkb.112.2022.12.20.07.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 07:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=voqN+p+3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7exR-0001gJ-F7; Tue, 20 Dec 2022 10:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7exM-0001f7-70
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:55:04 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7exK-00070U-NE
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:55:03 -0500
Received: by mail-pf1-x429.google.com with SMTP id x66so8797832pfx.3
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=esxV+JAxsoi8ZaSUALEfuVHkdZbV6zRMhSOMaRkPlRU=;
 b=voqN+p+3AUqiRQo39z/h2A8IWgROi/Rtis6yq4zwiSEaD28iOrToWrERjjpcX/JEb+
 kR4BLnQwCoyY0JVeYs84HGsUsIjYXXMXxL4z4h/m1+UTXIVjsRonFMcEzqWEbaWFM4EZ
 6hRa+uuMRZPst/vpbiz8NZHQWDWTfGmQhoqgb9etsovG6FAAma+s+YAh75ZB1Ouqgrpu
 jxFhoWqY4oxA2XbgZWjJcf+cQ91OfIA2ytKxZGZ+QVsgLTMf+S2gh9qHGWt+mpwHrCxQ
 rVGVYbsylvyJVZZfpkRiN7pFhRl/6XLVO28tsXqlpU9JUeEY/SdVaJttcyPX+OsXLhXL
 Sz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esxV+JAxsoi8ZaSUALEfuVHkdZbV6zRMhSOMaRkPlRU=;
 b=B3FJrB+Yb7FnKv2A3SlsK6N/npJij5vo8JbVpuyoWkeNHocHZ5JpeyL19UjP3xPE5E
 RBsOdwADPpDloa8QOMuRNz8L8NEj1f9H4ngZ1B5bWCIDnMB4jrphfEIX83Yiqf4IkZul
 lznITbDFXg7IsRHfgWYcQxB4QhOUSZn49ugIzXhtAILAYAz+CjyGyTbxIIPBzyv6j0/5
 Zuw5yS+w90GapcKKIu6khR+GDbpiIu/9hpfhgJCnb/+86jlC8QBKOjG+PLZzVa8NsFaM
 cTIpuxUmD6S/Rg0EujVlJ0YGAIr4ciOCETwGIluTWskAE+PwzCWRqSW37p9nHlOpvOyi
 TpSA==
X-Gm-Message-State: ANoB5pmkTj2gLnSIe8Z13RMa7CdqXv25lm0Z/RSHV6qYaljTaaWxZoPW
 G/d/KJeBtv9eJVVKX9FSQorqgy3qkuwN3rdvx/V8iw==
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr81255210pfb.3.1671551700853; Tue, 20
 Dec 2022 07:55:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671548388.git.jcd@tribudubois.net>
 <63a81cac41c769989e23caebb476dc078e83731d.1671548388.git.jcd@tribudubois.net>
In-Reply-To: <63a81cac41c769989e23caebb476dc078e83731d.1671548388.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Dec 2022 15:54:49 +0000
Message-ID: <CAFEAcA_EtuLt4YAHW73ZBNJS6+KiDZpvy7xkoybAhwHOWzP2DA@mail.gmail.com>
Subject: Re: [PATCH] i.MX7D: Connect GPT timers to IRQ
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: WuwS44gOzOJr

On Tue, 20 Dec 2022 at 15:37, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> So far the GPT timers were unable to raise IRQs to the processor.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

Hi -- would you mind resending these patches, cc to qemu-devel,
please? All patches have to cc qemu-devel, because our automated
patch handling/archiving tools only read that list.

thanks
-- PMM

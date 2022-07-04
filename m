Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3265677lft;
        Mon, 4 Jul 2022 07:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdvFt7dktb2KLaLK2lFGxBdA6Se1k3R15WBC8Ii60GxlZeu/ESD3sgDa8iyK9RcZ1qK+U1
X-Received: by 2002:a0d:ff07:0:b0:2fe:d4ab:8652 with SMTP id p7-20020a0dff07000000b002fed4ab8652mr34852439ywf.379.1656944621859;
        Mon, 04 Jul 2022 07:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656944621; cv=none;
        d=google.com; s=arc-20160816;
        b=uCtGfVaOeVr7+X4l4n0dUINj5MEhB62WnzeoW4pYmSSbfuH0KTQw5Hf8eK/2gniZwf
         wXEum45ExmixVyTaM8QNmlcYHjBtMyVK+w4IRYAb4up6NnEGtnlj84zqagDBXiuEXCby
         3AX3mxQG0vO4O8U5FnVISlHpgEm50EBIOvtx81jIRYHmbnYGZuOtCq6yk5/rlbttuvmE
         q/KVtcQdtKTVSYc3fMFjtqmM5OtlV5rJ4A8aALcg1hNx7SvENQohoqNYw340ECQw3HWT
         8qfwkBLhHi1Zdx8Bsej4S64dJGE50WwIQTX0z5w+2DD7KweMZekemuCPMuHLf0AE4t/7
         oFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NqAjTsi2tsm7KgyzKA4DctBjLTMBvvU4yow9eoKkC9Y=;
        b=cJ8fA87X4ISnFTeeZHRaYaw6gozPrqN87SmC84mW6WAooECgyjVWeYvbVok7w1BEdz
         aXENeo62vR0FeYW3VsGkQVKXGCx1Ie2Y8FWfnR7XlC3zCfggZSMPghplj4ZoL0AW1ICC
         WCI/UKUDqSPivtuMp7Q3G34qm8EMAFsjGMfUQjfjcjS2V2mOai2FxfEXz3+lMmam2+Vk
         +bUVIg0ky176rATPPaDFDTUv7mDHZrzt5fvphcVR5mPDXLj5b6yYG36BAQ3LjrQQ1dH9
         xM/XvVk4XjAFAyTZDIkEUtLNE790MqgPksK73o08NOQVQMvxELuGmGMkUsGYE3wL1ETA
         hEIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhGG0bOI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020a81bd0c000000b003178e4d22bbsi42890535ywi.231.2022.07.04.07.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhGG0bOI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MzE-0001ir-9D
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MHQ-0007dn-Gs
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:38:27 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MHN-0005yY-In
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:38:24 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i7so16923316ybe.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqAjTsi2tsm7KgyzKA4DctBjLTMBvvU4yow9eoKkC9Y=;
 b=vhGG0bOIl17sgzYX8EgGN5zmb2cA4tP7ge7/qCHNQSE13GyNsLHyy1pGGW8WekpEf0
 6f+zGKgE/W2AxSmxjDdus+d9hq9DzD9MK14x+ZyUJHQvfCEpZMVYNraxQvtY1UFx3RzL
 NgA1OXSuU3Ut3IMaE7Q46xv6EDDLYnPYKyFnikpgcRtQgplKwJZgjPoDOjvBff214FHU
 VdNix7KRT+iVPw5gOoZR5GZTiC/+acstHCPDtvFM/RwJS0PURV5p+3fG+xmVkhRZjyvt
 LaITBd7CiJoA0nuT7ir3o8HYmPhTgTNHXQ2QK40eK+XZ3Nv9ooGvyDhiyC6/KKgtUpjT
 dXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqAjTsi2tsm7KgyzKA4DctBjLTMBvvU4yow9eoKkC9Y=;
 b=gWOZ0rKud2VXvIPUYXKZHFUBHmodQ5govz+F6WI9eblt2dIf6OVpzju3DZLveeWwWS
 DW+i3BIPRl27Pqi3Uio2AF6L28PsGCycOFxTUCu3XZFJ8TGirhZjZYz4ekaMYlwdgcC5
 3UUXUroh/mvFDKV3ljRCaVsxuVtR+npigSuWsSXFcXsRx4yl7FdnZRb5L8fphwqK/jZz
 SSdYEwzSSXkv33f+KAXtcmxwp5daiAdTwDBo0SBGn1LzgeifnZgy0v+CmbAey7pUidW3
 N4gONPwVQMULZx1Po+ojsUk7gk9iJnlEzFN3+86vTp3J3/CZzG1obsZrW3t0PNszrfMN
 34pg==
X-Gm-Message-State: AJIora92bWUY0bGTbQP8J9Y9Os4V3xYYtQYJ/x/qMpA8U7+aXhNFS6OW
 iyjOOOih1TKos2P7osFCpZ5cUBVkv4nefiR4GLiUtQ==
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr31339404ybr.288.1656941899839; Mon, 04
 Jul 2022 06:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-41-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-41-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:38:09 +0100
Message-ID: <CAFEAcA9FEqooZmP=yXPvidVDoXHR5i7oEgNs_LbCjxwqTMM0xA@mail.gmail.com>
Subject: Re: [PATCH 40/40] pckbd: remove legacy i8042_mm_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQv/Dao9cG0L

On Wed, 29 Jun 2022 at 13:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This legacy function is only used during the initialisation of the MIPS magnum
> machine, so inline its functionality directly into mips_jazz_init() and then
> remove it.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

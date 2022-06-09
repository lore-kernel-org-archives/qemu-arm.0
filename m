Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4094804qvs;
        Thu, 9 Jun 2022 06:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh/VXYRlPzTTigBvfkssTNMpnilirHPqWZJa54uLftIW8oIEnMeYOVpQOA4YcOyf6aU0rc
X-Received: by 2002:a37:8a44:0:b0:6a6:3991:6f23 with SMTP id m65-20020a378a44000000b006a639916f23mr26176512qkd.762.1654780713209;
        Thu, 09 Jun 2022 06:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780713; cv=none;
        d=google.com; s=arc-20160816;
        b=RljVEMoL0ipZCn7NF4bb/2zUwuippatvk+zJzdsfGVgEoiNO4q4IdGu/CG+mnqUSa7
         T/EGsg8n9kCN8LOCQqaEdkG2ihvcZIRv/bNe7WoUzkYXBj32pe4Nwu4VXgSphmnFA+Rg
         y8qzy7yq62f1VXigmn7Xep3V+4qrE6txeGe9Rx354QHIIfQeAEeitXTpzOaOp3GuxkbS
         jABFUB3zEIwW/DlDvAOZKD+Fam5A1ZRpQsLToP9G9C/6Fwc6smNxqxI9ZN6x3MAtI8kw
         7eOjT+0RLOMKp66VTsAm1q/TAcQxGOyfeOfDRus4Xvb5p39SQxyxuETSpBKAY7KcxHAx
         5ExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=om4sJnCjN0/7wPJP5wWhqRaUPvJmOkFHQ8QIY1bmuuc=;
        b=dhBtyM+DIlnbgjy8q/LBXLePm1v8E+pNoMjkprT4rwfY5jrHEyMqkVP4fjl22tW18U
         Yzk2N470pqbI5Q4uBJkx9JiRrv9fFtlETc9RoGXw/MqSER5Ll85yAKEGaGgSigrCzOK+
         d/LkfhpzZJYMng44QB+SDQhlOZ2rGOrksNN9+Dr00Ms6R8rKfynUP4UeKjdeVqin/FWY
         5VhxZYuhQea+j+OztvVJsdI3FUHvT1Nsc6voPLnLF0DT7xc1/MTlURG2+jsos4XnmMDV
         t2mjlf4NSsoFpiAlKNmnH09WIL+P3/V64qMEfM3qTnJODhi/yLArXAKluoMoqAidMGZz
         Z/ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UY2NZ3ob;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu15-20020ad45ccf000000b0046b9109dc64si6390810qvb.177.2022.06.09.06.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UY2NZ3ob;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI3U-00054u-PA
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFti-0003So-El
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:00:21 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFth-0007td-41
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:00:18 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-30ce6492a60so236931397b3.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=om4sJnCjN0/7wPJP5wWhqRaUPvJmOkFHQ8QIY1bmuuc=;
 b=UY2NZ3obCjT2HvJm6cCk1PhkjoerMFBtaQriDEhZy3zBRZsgWpBfmOOH/Flxm4D9/c
 5X4MKAKeeA5Dw/0kKKaGzXWDks0E+F9w2NeigGcppEqKuLahpr5mLUfB9u4IKhf/1+wP
 6bi8Ks4KCVlBQAkR88Pt0T3W43lZXVTE1GRFDiNNlFE64uq+ldEIyNRZWSO1FMuwFfdy
 63WGH0bkwFrdEG8iYIL0S6f9cXhwBT+mg/I26Ql8xWNE85iqabOlZWfc1+uD+BnFtA3R
 uBtIsZePu4CfeaGk9op/x2Bu/pm+JPtskLhX5L8KaKsQaSissyCTHdbeoTDlwfomF2Ma
 gBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=om4sJnCjN0/7wPJP5wWhqRaUPvJmOkFHQ8QIY1bmuuc=;
 b=MEba2WcdcbLiu42pDZa08bE28n1C9Zpu1VoeChxbr/IWHUKNlkN0l1WD0INLfNNpuo
 HkUGZL0QgQqdTBl6x/L25ruOEeZAYX1W2ROftjY38Nru2MQ+Dmk3+yoh43BslIiT9rxH
 jPtLhZr9HdkaLy4MuGPHM6QtqGVFtaiQstA4x6UnsglZ4mf9MJm6+xwISdNS7Zt7iYd3
 rYmFFcbkUz5iSSMYLhBEkcKbGVcmnflnstNBrGmjCBMd926NibL15XMjiKutlXdCSo5p
 gaTS3SHi4VsY1g6/itTiGZu/lXxMLHA+BV4v0Lxu50sMnmcwJMKcyWCDLz+9aib2IJk7
 47pg==
X-Gm-Message-State: AOAM530Prw8aVnZRbuUQnIeTmLNYVeI6igWJKB8jsRumkCOozYwplY7Y
 JV8gy/OFyEosICPXnkLN+HMBRKuMDNfu4ptZnzeZ4w==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr41082210ywc.329.1654772416207; Thu, 09
 Jun 2022 04:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-31-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-31-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:00:05 +0100
Message-ID: <CAFEAcA-XFftEUruttQBGnxmhJNJLkzTb+4oYhW0VM=3w_e2tuA@mail.gmail.com>
Subject: Re: [PATCH 30/50] pckbd: move ps2_kbd_init() and ps2_mouse_init() to
 i8042_mmio_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RlPIXgh3oGdl

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move ps2_kbd_init() and ps2_mouse_init() from i8042_mm_init() to
> i8042_mmio_realize() to further reduce the initialisation logic done in
> i8042_mm_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

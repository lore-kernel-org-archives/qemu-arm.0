Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp463333lfb;
        Thu, 9 Jun 2022 07:08:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4SfugjDg6WBD6E5epkRay9DAlGF6gCYptVggVPW2yyGgvS3h0c4lF7bjLvO3cBS8MR3UE
X-Received: by 2002:a37:6d0:0:b0:6a6:8485:ddb0 with SMTP id 199-20020a3706d0000000b006a68485ddb0mr24384942qkg.301.1654783703776;
        Thu, 09 Jun 2022 07:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654783703; cv=none;
        d=google.com; s=arc-20160816;
        b=dCicNF14DG5SLyX2mGTJgxYnF6bNp8Ce30W1npi/hntGBb8s33Rkx8BLVZTwjEDtsy
         Z2KDMCeLDxtr/WzwRw2vR8dGFrq6SBntXNsTrq5SghhKpeeo98cmkx1m39N8Cw9lus05
         +5GOtu+gMcPyIsDfGAeDQOc1Rdi2yqzlGk0XWdZSZErmKKlXLK4eDe4I1bwf/VF6g4ST
         ZEOJjdC7y2a78p9mXPxqiKxpRIYZbPZwFNBFTJLOVeS8Yi8YvkIyTw7MhLX27myhzjXg
         HYe2FkWcnPp25ncnzHMcENyQKmkSLbbv/dFp27aFCcne1LRgSdhGwzkldplgtJfj8dss
         OYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wVHq+kadEusxFBNgWN5OPNJH8tRKzmGjwXKWp4S+45Y=;
        b=Es77oAzh8oCNoDrtHGBS/J1EwE6O+hkSJ6MwlMr5xKM62bFJB16t61LGp6rNVEEyzd
         IGk00irdYtDGN7fAwPmnGu7KFHtegP1wDD3+qXFzmJAUCp/B44UWWDt8lSDIGZGC/5ha
         SgLq8bdZKErVZWMaVeZuy8si8s24odL/16b+rG1ndyRKRxKIZhwyO47N41eu3+ebGW79
         B+Hf5tIVfrWAbOUhf5//yHzIU+MycsMRqPJk2IcuVX5KQVGcLxsfPkMVF391tsRf18Az
         83cftAvcQqpQOgNIeUgXJw/EojF3lXuoZsgq07xpusIjxnJAX3pT3tiWoRfk1wuwatzO
         +hHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fiM4g1Ex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a05622a010200b00304f271adffsi5061236qtw.628.2022.06.09.07.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 07:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fiM4g1Ex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIpj-00022N-8y
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 10:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHeT-0004yO-3F
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:52:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHeO-0003f4-56
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:52:37 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 184so5796347pga.12
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wVHq+kadEusxFBNgWN5OPNJH8tRKzmGjwXKWp4S+45Y=;
 b=fiM4g1Exc/o5XVhHBoyMhFQ4e74nrTaOzgAPRqknSL1BgsuGtnk/VC2BaAm9cvxXr6
 8R/KbC+ioVhKJkPHr5oFSU6TBRP6Lge2ehH7LKgyLwa+kOw6XEdLHACLCjXs/Ye/E0Qn
 w8inH9R1iqM5kE9eR6Cmoa99tFw5OyMNZgRx14+Ak9ozFrDK3MrfJRIvY2hVdgzRoRRC
 TLsPzJU7sx2Y4UNdU9cG8OkMITh+shmBm5QBEfQ4XY6S6tq+UK6Kax/s+2vsiDFHlGzq
 O6hMPOz9hVkYvxZlrxuk5+5nwJPJnD4cmCFrznJVyi/58ZGNAFBBpc9SRk0q+7Zyja1P
 U4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wVHq+kadEusxFBNgWN5OPNJH8tRKzmGjwXKWp4S+45Y=;
 b=iqY7dLEFmjuUjHsB9LabE3/AoOl2qlOLMezGPkW4EiqCVcBxUUOtaTbWtABAqaZ6K2
 ZCxL4sWfPaOoE6tEsooibinxu8qm7yQSI7EU5ScGv+Mva47sY5B9xJwjvgC5tkiMPu1V
 LOfFFXXc/edPtY1gjgwlM2utVpY/Xgw80lB5wZV4Ucj7QbL03oefy5ojTZVrIQGkxJov
 inXoVCVZXiitFVjD84B62ls/dG5xvMzRjmEdauTI2cZGew3cIjzSwPxkzrGnHt4J49rI
 Nef35wCYzP1ILxMlCKZkssU/jQPHfLqxDXcDZq+/hWaj2B/cZyVnuKLChSQUqzJ5s8c7
 ls3w==
X-Gm-Message-State: AOAM531rEqGnfvrope85LmA7ADI5OGiiOoh2ZwA8JVmLJHAd83jDlt0K
 yw8eksZuV0rHeuktDGG9piqSFzbdhJDrjiJfvS8D0Q==
X-Received: by 2002:a05:6a00:162a:b0:51e:73c4:f895 with SMTP id
 e10-20020a056a00162a00b0051e73c4f895mr887667pfc.82.1654779154884; Thu, 09 Jun
 2022 05:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-48-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-48-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:52:24 +0100
Message-ID: <CAFEAcA_xOznxBzt1PQQgBqkOSesD02N=+UFSi4Khd1mkv6FjdQ@mail.gmail.com>
Subject: Re: [PATCH 47/50] pckbd: switch I8042_MMIO device from update_irq()
 function to PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mihR0WxGKbMO

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Define a new qdev input gpio for handling incoming PS2 IRQs, and then wire up the
> PS2 keyboard and mouse devices to use it. At the same time set update_irq() and
> update_arg to NULL in ps2_kbd_init() and ps2_mouse_init() to ensure that any
> accidental attempt to use the legacy update_irq() function will cause a NULL
> pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)

Same remark about preferring named-gpio for the internal-implementation
irqs, but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3244059lft;
        Mon, 4 Jul 2022 06:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzE87a1KSCmVglR4XaM2sVFFgSrcuFxeyshiS367kRf8YvfFYXt90Sx6210xSCTblmefo+
X-Received: by 2002:ac8:5c96:0:b0:31a:c19a:7da1 with SMTP id r22-20020ac85c96000000b0031ac19a7da1mr24444012qta.62.1656942763500;
        Mon, 04 Jul 2022 06:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942763; cv=none;
        d=google.com; s=arc-20160816;
        b=dvXalbP2Cbv9qcbvFZIHk+LRwLnsmpEIZ+/hDoPFoplyvKkuiVs6cD2HBVeu63IQjI
         LcGLqvSj1lSHGSSOhLuOlCjXng9OumGbSrHcED3xTvZk17do8ZjnH6wpop77e+WLWfER
         ItSLsnA+BsQtnsFG4NGQ5jb9De6tSrSTIcltG4tTzWfJofZmrkA6xWmY+3UKhspFGbo/
         XiNJJBSM9PampXcQ4njD1j6O7kYFmR1JYORQgflnB7dQSqPfot/uDWkEYjT0LnG1rWnN
         Jpx4/5dzqoyK9P43fryL6HhOUyi+A4DMiz4LLn7qvxDmcda8nDo2x3aXE/Q5sL+4mozy
         IANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uFY0/kdVOjuBkxJkwbIHQ75iU2Ojd0GlIFJ81aJjpJA=;
        b=ozSI2KUfOZYP0t/pvHmHeT/r9aXeY8HEUAqfFQImud0PZz0HKsT8EaFTsOz1ci+DM8
         hU6EceYsalIncR+Snf3WBgvEaEA2BRp1aNrtQFNHmL3ARa0BMqkuw7CmoBdYQ8IgfsLN
         InTcVokRO+STZ9hoFi71DsBdxmmIV+TZ9ecWUhDiTICSTR9azdUY9Rk3iDL4CT7LvHyP
         dfWsiEe0kmyY6hHqgURt7OI+NFtVRsEJT10HWRAlCkUBXsO4L/o81hIaONTJMlSXo/fK
         x/iaaoNLM6gL5kUR+nslyxW0K6TY6n8ZShKbfOQU7yFi5mxCS/rVbYQFIZMbMehhPmKD
         dkIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iv2sQin9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05622a130300b0031c154221b0si4055332qtk.649.2022.07.04.06.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iv2sQin9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MVG-0005uW-U9
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MF9-0002td-10
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:36:03 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MF6-0005br-Is
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:36:02 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id e80so9697814ybb.4
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFY0/kdVOjuBkxJkwbIHQ75iU2Ojd0GlIFJ81aJjpJA=;
 b=Iv2sQin9X4BIJ54nVJBFSGvt9475NDqRla6e80BW/3lwyeJA87aPjtfTYbgUKhB/kW
 O8dRy2BeI0MwDsJN5pwlKjknWlLz44JZPnq8rx11nwJWzcnFiEBNYyrxVPlA6mrlirpM
 g3UZhgdf0NZXHeR6IztT1ZuOEkN436l2SCtMSDeQlmFVn2ovTGuPELhRtojnwS+Aodqg
 dyh8DDn+Sf6v+Jyz0eaBoSm7iPgLnl1V4Rj25H8ygoFbpmZnunmlLoqIeacn+ZsyZNk5
 WoG69yxOAo6OePEyBzSkVHUCGrud0f8Tt3pevUJiRIIhqG5Rk3ZJ175MbjMNp0ExlQqC
 TA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFY0/kdVOjuBkxJkwbIHQ75iU2Ojd0GlIFJ81aJjpJA=;
 b=mHqAI6MoA8ywHY4XMM2TfF5OPtNnadaNH9DYh6ollzXSnU67Bt4ZR2+ucHaDYTByYa
 gvzTRw3+DwMn9d2D9yfLjeFgsnfUTEDrVO+nYj0msjQlB74CRL8MgMRWxWl4MFCxxPCY
 0G/oMZ43exTgVkqtNf20mJiu2kNtqQv/Sz7WKGVwMajoOYq0d2ySJZL7HlvKlqNp9YZc
 cqItsGdWkzBlP5cR2kI1TGmoGiSZ/q2SoomTF45XEvh7Q7lqLH+ZtQlMW7jtXbWF9HDV
 uquUfP80kTv5E0WQ5OIudSuA4tXzLhkNrHP8KM7iTgj3x5xcOZlgWfwhcMBx3etS1zIO
 pZ/g==
X-Gm-Message-State: AJIora+vPGxAa70XPac1Ht7E1HDeu4jnrVkmf0oglRjEXpGdklE/YDZ3
 ywwUBIH5G4ljmAZF1w1j/ul6n//GrYxQYp6Hd/dyiw==
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6096412ybg.140.1656941759409; Mon, 04
 Jul 2022 06:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-36-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-36-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:35:48 +0100
Message-ID: <CAFEAcA-MCuByDxQzz9G5kV_Yrot4bPyBnvOJYg2Qav9CHVUXdg@mail.gmail.com>
Subject: Re: [PATCH 35/40] pckbd: introduce new vmstate_kbd_mmio
 VMStateDescription for the I8042_MMIO device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VD9bAginirxQ

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables us to register the VMStateDescription using the DeviceClass vmsd
> property rather than having to call vmstate_register() from i8042_mmio_realize().
>
> Note that this is a migration break for the MIPS jazz machine which is the only
> user of the I8042_MMIO device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

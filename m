Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3260661lft;
        Mon, 4 Jul 2022 07:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFnFs8pQHX4ISAuU/buKSnJE6nVn6SoXX1vraYkz8m90TZDz9rAhHyU5Lk28MYnSBAb+a2
X-Received: by 2002:a25:b7cf:0:b0:66e:2ddc:dda7 with SMTP id u15-20020a25b7cf000000b0066e2ddcdda7mr12458823ybj.197.1656944208669;
        Mon, 04 Jul 2022 07:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656944208; cv=none;
        d=google.com; s=arc-20160816;
        b=h1Sm5FV7RULq9cm9JDneDpF70x1gm85vhIs4u5oFuxlzkc2m1zIIr9hpdZGNQdYAqm
         lbwRtlWvgbCOwIwlZC/279Scf7723eHBZ4ZNOtB+40d6KQOb5K8oD9sSgBl7kE8ZDXmI
         cDR0agGiabDc4/zQq4mv3xAs9ZgqlzS6Lmq645HcKE3LQ0xXL8CHgCgGqHSg4g+WMbO2
         hW+3whRTFzSyH+DMXl1lFzcWqSgFdVnjzm0PQ9aeqyTye6BimKxvDD8KK5hDb1kudGtV
         SssXNhv0fVdQrSaLp2ege/bPIpkS1BBr/6sA8WVSXvelgwBJ2SxPMcEXqECNIE2j6iSw
         3eCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mXQQ9PdxONj6kwWjuhW51OlCjIyvfrTMqGuv5SJSpsI=;
        b=Oz1f+IKN4MgC7x+Nh8F+yX5gIaZkP65R05mCjOj+7mILAIaRCkOfv7pNPvu4hUcyIA
         Zx8Y1dpiCVSD6GWiLpPdEA/QyvERBRwytlwfBxVj79k+aG7fL8o8jjHNPshgnCBCJbVH
         5LUV52tYBX1N4a1kOxyc+EpESr3nJ52nE/YzHFVn+n7AD9WTEVycwTjiwaag8qchDLJA
         ZU00lSAF5YqJUaKjxJmsnlXu5j1YU20/S7dqsmr9H+/SVPtoimje+EI4Rdk+z0fSjdrA
         XAQElYNH2DULzXRvFUlFvJkbnXtbTQ/fw0TOmjSbXlzB/D6CnNWo4t/hg/vKe+W69xxh
         sE6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrQHYKyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62-20020a251841000000b0066e0e73476asi11140972yby.488.2022.07.04.07.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrQHYKyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Msa-0001C9-3O
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4M-0002FG-RQ
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:24:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4I-0003HN-1L
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:24:52 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c9b70c382so19670137b3.6
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mXQQ9PdxONj6kwWjuhW51OlCjIyvfrTMqGuv5SJSpsI=;
 b=hrQHYKyzzs5qms+U+k9TCEnYFZ5FMxNQgJ7ukZI8GJjry7y/SFpGoG/fN01prqZyuc
 5XQymEA7XtXVGGt03qzYHLjY1TFWW/wzLHk+F2YRGSLaFluk5U2gBAp4isjZwg5gp1hd
 3BoOiu8wx6LPy+0XnQIlmG0FJKfRath4OVdOMlvphInxaHRjQBKHG+M/Jl4WDoK8huvs
 qUVmj7nYzbQUmQGxidIrNfhRMF39eBF9CBxCnSImHOHb6YB+U3WwfO2DQqpyBNsBIng+
 IWaimlzTfO8TswxK6swcPA4hTxIqKmE6jXUmoOyCySX45Vzr3NFQd031hBtgYWhSyp4W
 NZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mXQQ9PdxONj6kwWjuhW51OlCjIyvfrTMqGuv5SJSpsI=;
 b=x/UvTyJm627jhEgpR3uyg0nC8UK83ubmvTkTZbbxioI1YDCltoUl0z/2Z1xJr89kQY
 uLSjAMqwDlgRzoeEGPPA6osu3b9xalhnurcCoaES1FQsKL0Xg3HgRPxpMcNQ8AiLK+Bs
 3O9yQqhiKSOVc5Y6vY/LQc3MittrI/ZE4GPihlrW7OHB+ByJ1E0dqRd8rHCyoJ8ywSbq
 8o5uegSrby9NF9Sr0H+1E8l9QNTYJKaKwp5P5sWhIu5vO8LEX9qOu1aL4XkRGaPxXLTM
 4tekiINcKE/ilqI+hRAAPf0ex+T87vSQEJHniCXxuzKhkKfq5oEQt8lzj4XW7CFb+NFw
 FPQA==
X-Gm-Message-State: AJIora9pmAx3b2wl3Kd2P1u7D8abZ34T9rleMOE/nqHfl5Vd2yC7rYUe
 0zdfiwAL1K7lV1dgcrOVWCW72MLSIaZQrdnTYKWbiw==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr32688362ywb.10.1656941087643; Mon, 04
 Jul 2022 06:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-20-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-20-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:24:36 +0100
Message-ID: <CAFEAcA_U-WoT93LgpyMXzFAjzPEygqOvcaNV3Uoo9apoHBC2Dw@mail.gmail.com>
Subject: Re: [PATCH 19/40] lasips2: move keyboard port initialisation to new
 lasips2_kbd_port_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
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
X-TUID: R4txyjjKr+qV

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the keyboard port from lasips2_init() to
> a new lasips2_kbd_port_init() function which will be invoked using
> object_initialize_child() during the LASIPS2 device init.
>
> Update LASIPS2State so that it now holds the new LASIPS2KbdPort child object and
> ensure that it is realised in lasips2_realize().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

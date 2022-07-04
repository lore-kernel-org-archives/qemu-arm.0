Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3252894lft;
        Mon, 4 Jul 2022 07:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uItoh1Pt4+s6jHdi/RtukvYYOq0QL9f33T6GUEts039KTV0G/V5dOHFf6EZmcvnP1SGuqG
X-Received: by 2002:a1f:300c:0:b0:36f:eb7d:746f with SMTP id w12-20020a1f300c000000b0036feb7d746fmr16526964vkw.27.1656943541425;
        Mon, 04 Jul 2022 07:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943541; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHLrf4GQuJzZtx92aqbvnxkaLmXEXHSxMi3ed8hyVl0rnuMnJh6A2UBplrKv9JbV6r
         e82LfEm6npVtR3v6C+iYW4bNS+DuOdMtOnVOaDwDoJ5uMe5aOAo+jn3CrJq2159zKBBG
         dqaRj/Wts6iQHr7w+9kwxx/btM9MAnge5xN9HlU40L2bBL6kSQSV7b9t5BRRJzfZp4Xd
         Mi1MlUXKZQ5nwWex8C6Z4vuQw3ushUr7xuofN9Pg1avQf3WZyPxqtg9/EIofIU8nYO4N
         ovAepX7LTz6aowWLBx7UGZEqTRhnycmHqH2EPjDk5cUyVhcQm+7a/QWigZ3cnu0wZLr+
         1+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IwuukI/ohXksY0Pf7JHDfE7vM/eRTalC9oRQff2kz3A=;
        b=DG11Dyq1IyRIJI5II9PvXLk/zd/4keZXZMBv7X5VDxvMkgkarqFKa3piM6F8P2EOJp
         Br70ONY57+xUXqfp9DAaVqjFWPUfZRr2dP3ylb1tzx05sNyfhBjVeyuxnEGf/h+ZJ/HS
         toTQ23H8ENDpKk3B1lCoOzOhCKsgnqm3g7WbEntNNzFy1RY+iL0VHMZcabmrWyNRdu7z
         6MM6YW11582/1Xd5/FhkpBFH1PcIcPRnqd0NvMB92M+xTieeFLNsGfRS5LOiB6aGQiG6
         HdEotfxqEtTEAiAQDAFm1cdVm7hxot4LZamCvbbNMT9B3alIaegyOoIwoSAxp0rZXAxE
         4oNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mkDhxPZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a056102304d00b00335c5bbe14fsi7447335vsa.465.2022.07.04.07.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mkDhxPZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mho-00009z-Nx
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4p-0002dZ-39
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:25:23 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4j-0003LR-DA
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:25:21 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 76so1284767ybd.0
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IwuukI/ohXksY0Pf7JHDfE7vM/eRTalC9oRQff2kz3A=;
 b=mkDhxPZ0ov+Z678Jnwg0vu3VIn2tbA/5/JwL2NMMqGsutuCyFFKfTophWOVKUfi6tf
 +dGsEvBZ99DrFsyM7LJ1tM9eR7A9peBajySeNlyY5hmPBZysj+qK6yOqMGzKIFROdJMV
 tLQzp224lfATOX6uyIIWyoNgg5H4TFIQeUOPr8Vozyptx6KHwoScsw8DFzP5ZQBTZm+1
 A3ZEiikjBDPISDKEfb8bxTc8+rJUwtkn3dP5+ag0NGwFHZKf81uP6JifJE/Qb9Llf+gA
 S7Q0hFgUlRRlMA8Gs3As3Gg4X8xNhXDk6AZ1jeDeE7Zm2wHgErMPdS8qaHm0PYP/PzBe
 X5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IwuukI/ohXksY0Pf7JHDfE7vM/eRTalC9oRQff2kz3A=;
 b=7ekdWndQdXtq/u8O7rV/P5967bgfrCKfOZYIRwlPVickeBG6k9RxnFYPf+rI2Jsla8
 /lqK+uxmkX8HlMknyoHZSHcGUZ0UP88a5S/OZzjRtjLc9U9/2B9amP13nTg5QnD5GlHw
 dIW/5Ci1lu1E44ft/a4E0h3bQJpD6NUDhr6ncc4URV9aEHH6FItFg4ulN0NKLSR7JzoD
 S8cDKtK/dNALr7PwRugI+v+mY5US6qjqyIOJSzICpNsjBqOmFzgyPIwXuxkRM8Fy7NSX
 ipUoZg1x6WQg4YLuHNMnEzUb21lRc5l3Y6e9XwpHxIymPHYnZ6jN3Ml/eVZ6QQi1hXMy
 yfYQ==
X-Gm-Message-State: AJIora9pAgdan7HfXMlwZpZF7cORMLzDQtDYE4Z3V89xEKT03g6NRN0/
 tltBmWL/At2ZS5keH8eT8YLwXug6zT643Q7d8rMC3g==
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6181627ybu.479.1656941113644; Mon, 04
 Jul 2022 06:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-21-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-21-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:25:02 +0100
Message-ID: <CAFEAcA90ZJ5JXSDynqcnox=tpYb-kotghcjbOgo0YvDcNQWGwA@mail.gmail.com>
Subject: Re: [PATCH 20/40] lasips2: move mouse port initialisation to new
 lasips2_mouse_port_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: jI+IFW4rNwmW

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the mouse port from lasips2_init() to
> a new lasips2_mouse_port_init() function which will be invoked using
> object_initialize_child() during the LASIPS2 device init.
>
> Update LASIPS2State so that it now holds the new LASIPS2MousePort child object and
> ensure that it is realised in lasips2_realize().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp463047lfb;
        Thu, 9 Jun 2022 07:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7/n1QL8ZRIeCwunsytcu+SnSgdhIs/j4mkeCDMw/+VdlH+szHjMtpujO8y+yp7+y38nSB
X-Received: by 2002:a37:6d0:0:b0:6a6:8485:ddb0 with SMTP id 199-20020a3706d0000000b006a68485ddb0mr24383267qkg.301.1654783681818;
        Thu, 09 Jun 2022 07:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654783681; cv=none;
        d=google.com; s=arc-20160816;
        b=lXfeABQew59/lkGyRVwTyvQEg3pGxFSZmiBzwqjY5uXccvPdgJz0H3m95JJPvH05pS
         NdUGorSgcNuhwzk1XyC2ic2jEAZ0Zb2PSWLPBgeBsiIWhuPWNln4EYBjmeJHpTniq7Rc
         v6OJR+z7aFMvyNp+rIRgRrHOFMjqqp0TuGSzj7TFDyuSKVhsnr15ALyL09FurxUwXs6i
         RbFRm1LdQ+cF7PA02ZmdnB/0ex7NyfiZDZ+gHC/440vDD5O8TMwrMxrIp5QLc8iL2CQc
         gxI9sHptKXZdaUqbcwliyP89lNi7jqyfUVsX225fVtM8ejRRDKRfvTeR6/KWFd3F0LTd
         RytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JqJh9ldDOdnw1d8r4xxmGvYmKoHHf1z2/a0A31HRdCA=;
        b=rfrncc4i06+Yc/er2Ip/9n9ODUX8uQiv+yDb4TsQBbWcL5VGR3WkswQ7mbj7hp2mJX
         NTZY06tRNNIHaXLFc0nYun9lTNXLENYvUUJ3orTn3O+ohpJ2NxHZDq8OAsqXpIpVqhIh
         NYIb2BerUEprRVgo5E7rMkAcCg7kWjVTml0Pql2RekfMatJP5tBI2nU+EiSJivxUaD5Q
         eVxOjCRYbh7iRJiZv984nwndDNLAkbcfCOD21HnjM6T0OMAD2324sS76Hl7kyVPJgtMp
         fdVblRyJuphQdrXbC78wtUG3nNYluBmFt1rqLXa6+Btw8V3Edh++dIekylHDWBOP03Pb
         bacA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JACOnmbS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf14-20020a0562142a4e00b004645b509383si13549200qvb.503.2022.06.09.07.08.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 07:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JACOnmbS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIpN-00016M-4P
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 10:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcw-0002u1-Se
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:51:06 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHcv-0003L5-6f
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 08:51:06 -0400
Received: by mail-pf1-x431.google.com with SMTP id 187so20991057pfu.9
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JqJh9ldDOdnw1d8r4xxmGvYmKoHHf1z2/a0A31HRdCA=;
 b=JACOnmbSvjmwvbxzgetA37SehZjkghbMFLqDgQT22ugEu+Ilrg10CxnLmK4/+ZwPKe
 qlJuqA2Q9tuVRJFJiPeY4Y08QXO4+Tc+51N0M7PO5wjUVnGQdfEQnTuXh1cWIeZ4opej
 tfU7wNffSnVY5SmzJh9f8GuBxpk+OokjqMs7cekjqwq1+OkvEhuTG0B4BpGfY3nkF/Uo
 zomrxkqZCZl2CZF8F+NYaqkLFaRXjzF7HPGa4aKr4pF00SC+vwrIC+aYsotnql9hwThz
 CNY1awRGZg3qMCUfBcGPX0LvNeGWP8QID5cYqVI+gkFi6m1xdgs90oJb8w3eDFX+Vnv/
 O/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqJh9ldDOdnw1d8r4xxmGvYmKoHHf1z2/a0A31HRdCA=;
 b=hvxElWKKcVmd2BTZlaJVM+hvOnyiySrrLehhsjs+axgDI1zqLNz2CcJygj93ruM6i3
 hbDhb0zxx50M1qarsR+ifbVGRtIgfp3J5CEpBs46kBOaBXUqQkwZAXccmdZCL4ts0X0U
 pERn67RGOkTswt2AqmfUMo5hBOlL1rhplqGNHEJjPu5blk1UoLVHdtLalF6veY8lAlaq
 KbQRBE+YnRjKAym1mgTL9uJCU6b8Ezp+UDy7H74bT8v8XCTbADnlk4BrK5p8Pjdr4cth
 0Qk4AR+sQAnSwdFnyAKsmGvwrY3o/pjqaKFaP2QcGmHlEutNzEksZiEX/ePJ3lWG9fOo
 g2Tw==
X-Gm-Message-State: AOAM531pkQ/z9pkVISRa9Tq1ZifqG4SH2P7iBsJbupDjNDmakbL34OXX
 O88a4JavKaCN6+uF04EHd1fV032mW6Hhs1mxbdS5Ow==
X-Received: by 2002:a05:6a00:1f1a:b0:51b:fac8:e00c with SMTP id
 be26-20020a056a001f1a00b0051bfac8e00cmr26903077pfb.26.1654779063893; Thu, 09
 Jun 2022 05:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-51-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-51-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:50:53 +0100
Message-ID: <CAFEAcA8-2NAvWPE5qtedPmfwAY+TBu-pWLhNo4R1njEoKUHSyg@mail.gmail.com>
Subject: Re: [PATCH 50/50] ps2: remove update_irq() function and update_arg
 parameter
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: i32RFW7FgNL5

On Sun, 22 May 2022 at 19:23, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that all the PS2 devices have been converted to use GPIOs the update_irq()
> callback function and the update_arg parameter can be removed.
>
> This allows these arguments to be completely removed from ps2_kbd_init() and
> ps2_mouse_init(), along with the transitional logic that was added to
> ps2_raise_irq() and ps2_lower_irq().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

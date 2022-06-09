Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp446576lfb;
        Thu, 9 Jun 2022 06:41:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznHvz6t4HaVCQehRlSRtWy7tZPF4/6emmwsliatRRgaSePlXbns15Unv+j5/gYB6Tmhz4W
X-Received: by 2002:a05:6214:c26:b0:464:3fdd:a3e6 with SMTP id a6-20020a0562140c2600b004643fdda3e6mr47248300qvd.113.1654782080867;
        Thu, 09 Jun 2022 06:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654782080; cv=none;
        d=google.com; s=arc-20160816;
        b=YleWnpAgHTisKjAqpGiyqrxUSdMyE5Ky5R6KtSoLmFHPvhxfODHfWNBusEzuBNVS3E
         mt/mmoevBa0amCFUxy0AmT0oh2qeUr1tmbllUj9NCYL3BgwCPxAC7zzmz92DokNXgeXc
         44G2nlRXLr2LFk8E6r8shZQLAFwRggbOLD1YSUKHgNvpUV7nrwIFhGvJhA09FQ7+XrqH
         PqvMwrqHnMN8UbN6pPr8VFIltcsH4VA3WNDKlvscMHJmTryczo4tjSw0bHqD+9Me4FDw
         mMZ4MwuDS04vxD5pxhf6l0ORS5ZCYUQy5HgBS8yeIv4A+GJUyOkPAEgihZP7G3nGEu2g
         sZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cIL/3yyGMb9aqMbSeZ2gELvbPZuXWTrQiXwR/6eJ5OE=;
        b=nWpGqQ9Lg/ujHHsCFWea+VX+oqm7BPYfzghchTwE24tTS39lznM9LzrOz2rXUigmNk
         nGoETp0Ik/3FMItI14ySJ5j3sMQSbUw+cVpNFBO4N95guco6w4gGIs+BBKkXQ0K8hnth
         CV5pSQraiJqOqbXW6KjBp3cPUHXXRy7z5ISUvc4PraaBnJJjsX8mrZvQBereZ/ou4WKr
         vi+gIDmLQsFpwQ11gLwgHXX/Io9cYCZEN954kU03M1X3SAcxm92RVrVuOZyjjnPh/GKA
         dinSjP4S/JMfzVJExN4z6KWBS5+Zy448UZ/88BCNwpItPx9wtMFqjwkPADBDKgjlzV5p
         AiVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkzJlVo2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f33-20020a05622a1a2100b00304e4924793si9574123qtb.440.2022.06.09.06.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkzJlVo2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIPY-0001a8-8X
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4d-0004E3-30
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:11:37 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG4b-0001uW-Kg
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:11:34 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v22so41201204ybd.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIL/3yyGMb9aqMbSeZ2gELvbPZuXWTrQiXwR/6eJ5OE=;
 b=WkzJlVo2TiLlpVFi14LvuUQMJ/vKPC6ci3S0Kp1DJ+z8/l+6d+dTCnSPmehCEzZUnb
 vkKQU+HoOE1VR1hrRAgj4taPGioakzWB28fxnzrHE7J9ICKd8+D0CrozAnEVmrM4sxGB
 DFP4rbQg2+nsKURLHlMUT/CCYKPT4pwJeK6GmFZZYK+jdhYhMW2JwJxZP5gix6LIIfPc
 aDyW0gDfpy1yfBlXiUSuB9jop1osMZ7oQoNC5n/m0f5LUQy/U7lmIMv/bwn5CuQiz08X
 hvEGzOZXEwoVKGq3tnRaoML3q1XccEeRZjHGgwXiGVn3Sg0b8Ngo/WFSriz9THDLUbbu
 BPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIL/3yyGMb9aqMbSeZ2gELvbPZuXWTrQiXwR/6eJ5OE=;
 b=4k/FOYWYytfb+n1nPSAPwvgh40vU28E34u9fKCiqnAA+5rXTbTSJqI8zWeKiQNmFvv
 WvnEckNcaLuZvq2CHmzATB46vlEtdYYiEFDJpPSGyLBtHnSqaBBUPUpWaC74Am6gu30c
 lUwngWBQs+X/0TDEt5b6nVCykqWHRsY2NfNswh9lcr5+jNzavfrU04NA/f5xjl728VwP
 MIaTWuEWC4G8ySKVdR1D4/s7dZwdSWMcGx2jPl2IkhLjeBlvPGd1cXvPD1SVZ79DbTU2
 xGJV9nuCFpvXQDkYUXR2Ie4j7J05vc1oZCkM24zrkRIDQ01X7TOvOtCE0tVeT31y2/gl
 A06w==
X-Gm-Message-State: AOAM53197mwGVWkhxB6AiOpcvlQGq4+uMwsV8smOm2Sar3rpyJJgq0wW
 6RUwCpk7XzC9j5tBoFoknV2k6sI1hcIdSjN4ShRvyw==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr39705371ybq.67.1654773092790; Thu, 09
 Jun 2022 04:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-42-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-42-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:11:22 +0100
Message-ID: <CAFEAcA_pm-Faho=1T=WRcQC-8GwP2PZ_x_u7hZGvq4p3-Ezg4g@mail.gmail.com>
Subject: Re: [PATCH 41/50] lasips2: move mapping of LASIPS2 registers to HPPA
 machine
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
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
X-TUID: G3NIX7I7Yhjs

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the register memory regions are exposed as SysBus memory regions, move
> the mapping of the LASIPS2 registers from lasips2_initfn() to the HPPA machine
> (which is its only user).
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

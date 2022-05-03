Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1489728lfj;
        Tue, 3 May 2022 08:25:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9RU08I2YUueR+WCjpYK07yw64+NdAQlxWKQdIizB/0CUMcgP2/34Fn/JFsEpHaVpise1U
X-Received: by 2002:a05:6214:29c1:b0:45a:7954:e55b with SMTP id gh1-20020a05621429c100b0045a7954e55bmr12900967qvb.20.1651591512834;
        Tue, 03 May 2022 08:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651591512; cv=none;
        d=google.com; s=arc-20160816;
        b=uOH5H5mXLkipfgh0TBxTJSdH6TQW0WhyiN8wzQurM8ZE2VuuHclrG9jstGu9neqLfy
         8mXeouMyq0gbDmfVGRDueZR8j/GrHQr0A7dl5ZF1cLwblPrKArtEm8PYU9Ss+w1vDhED
         O3mGJMz7tfjn2hZ34IEkz7AIKXYGleT6T4roltHxu++fjMlz/VX5yP+6MCOzqiBwSqto
         RBfGQ996oxk38qgggYMDO9iXsr/bBgVDRurhYOGNxhclbfvKH4UR6qdAIoxNyUrKz8/y
         TN28If9mcUxoMPzP/AwxFIKC350JCmwFlOgD2FFuBMKbIlbbvFashqdpAA77g7KMCLe8
         vc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4yDxlLpfXlIR3iRjgtf5ag1l2Z/Knqle08/xN4PWEkc=;
        b=OTfYXUxzdfGtqiq2wQVP7iZgwYqQ1QNloK7i+5g+wrlnXBH53+MdpnOrJks8qNSySp
         Un3Vd6/afGJr4/KocgxqTw9aAJN/0y5pqYKTDzSe/BpNNfHeHn1W8e/MX34VHR0nnZtQ
         jB35t4lBTtas7m6ml+Ma9K0nNYaFujrPZ2wAK7N++dIA1zN+Vl0LSFqtjvURO+BO5KTP
         UOCOJtnmGoyMLK0njoR5ifqJHHWxRFo0MyIN+o+0T7sFbZeuEX7qfMxgc1oa4kIYUPvk
         qeNXSHJSr8qIr195A1JDpIwUeiInuoIAALbU88+LsFXVD+Jg/2Lumm7FeodWqIPI3M3s
         zzHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SWo3/2KR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f66-20020a37d245000000b0069fbcb269afsi5020727qkj.661.2022.05.03.08.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 08:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SWo3/2KR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nluOm-0000T2-BF
	for alex.bennee@linaro.org; Tue, 03 May 2022 11:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluOX-0000QF-F2
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:24:57 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluOV-0003Fw-Tk
 for qemu-arm@nongnu.org; Tue, 03 May 2022 11:24:57 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7c57ee6feso183659727b3.2
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yDxlLpfXlIR3iRjgtf5ag1l2Z/Knqle08/xN4PWEkc=;
 b=SWo3/2KRaPxW87cPuVCma4DHRz0Gd7ovuUErFMiKZiSbz+y+EeUUBqJozqnTtItFHL
 pH6jp3BXXCRZ4m+tJcEi8izm5hV7Sg2d8yRwE6xPbDtxTdzmVJ4i2xoxpV5nhPT4zehH
 LqC7xlBy2/TQ+BznF24YbcmV5S20dDWqNSzOINbpCyjK3BEZ94rIJEQv9ZBqK2xICPlN
 xGsXD58WRQv2WcDZUrZmBTfsmYUC+jGWXG9T12vNqJh9tp4AXVaVXKbnoHne4KrW6FUH
 jXVANoiGMwvvrSP35Oy6f/u2maeqF7JiVSmNLBNdwOIoeXnlBy1kBMF8jW92OXKiJLf8
 ieSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yDxlLpfXlIR3iRjgtf5ag1l2Z/Knqle08/xN4PWEkc=;
 b=PpKaCseHWsc65XiC/Omz+gM9/mMVNeWn48JV/lLG7QC/PXHlyMAVC6q6fxNpBx1KIu
 zkvz0qk8lbbKdbv3pSoHcePP+qluOdNPTJCiHGa6pkb4KhDOMEm70W8XfNE143rIDTBC
 rOSMm+a0mpcgT0BLV2/QwAg8eqcyeKtxv4/9EeSabgHhUH+d5gKzMnxnsGIjdbF4bnXW
 SB5fyJ6xMahSNhVCGN46yhhLE6mdZGClkqIaUt8K10f7wd5v6b37fgPoUe24nPb4w4ke
 laGOXsmKS2fMIIdQ6zYONLtasR6WELXMqdwalfSt3am3r2Id1qzNbxYt4XKAXVr5cXW5
 VJSQ==
X-Gm-Message-State: AOAM531x4tAAMdWftOcHb68Y9JO8zPU3WpG/zZiNzGKp4FkN28q6zhjf
 EdkmfnKGQVfCTvZT86DY0TCSnRjQ+cQz+/pOsGDy7Fe1f9w=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr3090612ywd.10.1651591494685; Tue, 03
 May 2022 08:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220427042312.294300-1-richard.henderson@linaro.org>
 <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
 <40272c05-c2d5-756e-5096-a05f53367095@linaro.org>
In-Reply-To: <40272c05-c2d5-756e-5096-a05f53367095@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:24:43 +0100
Message-ID: <CAFEAcA_twqKhn2CttPSx78W21UXoOrm8hfoObQ9a9ejPJqPJ-A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: V0jw34lRI7SL

On Thu, 28 Apr 2022 at 16:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/28/22 05:56, Peter Maydell wrote:
> > On Wed, 27 Apr 2022 at 05:23, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
> >> (indirect branch from register other than x16/x17).  The linux kernel
> >> sets this in bti_enable().
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >> --- a/tests/tcg/aarch64/Makefile.target
> >> +++ b/tests/tcg/aarch64/Makefile.target
> >> @@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
> >>   endif
> >>
> >>   # BTI Tests
> >> -# bti-1 tests the elf notes, so we require special compiler support.
> >> +# bti-1 test the elf notes, so we require special compiler support.
> >
> > Did you intend to edit this comment line ?
> >
> > Otherwise
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Oops, no.  At one point I had bti-3 sharing this line, and following code, but it didn't work.

OK; applied to target-arm.next with that line fixed up, thanks.

-- PMM

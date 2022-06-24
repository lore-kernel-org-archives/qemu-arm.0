Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp400784lft;
        Fri, 24 Jun 2022 08:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sldKaeGApvTeah7qeyxpTykYd5AswoZ34qus+Oc3xdflghRb6zsUudBdLJNG8UGQhpR604
X-Received: by 2002:ac8:598b:0:b0:317:cab1:960c with SMTP id e11-20020ac8598b000000b00317cab1960cmr2306007qte.520.1656083979724;
        Fri, 24 Jun 2022 08:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083979; cv=none;
        d=google.com; s=arc-20160816;
        b=EjtqdJXpruAI9KduOL/KWfUOYnWuv4YeQCnUWpyk8Z445PnhIIrk2KiDboIdSEx2w6
         Jg3lVLM9qDZwCsWduz9NG99RiZxeuu4vOgSb8kb/V3STYsn1+9fdL9bOfBIuCq4ujcQB
         Yaeb7GLxK8jW4pShXo1W+Z9yYe1lGC86gUTqD0GXQDkfY7keL4ER2Nzs6/zfMY7jwGqv
         mpsq4eNW/5fGLOqJnx4BlJGHgYH84SLe2/RE6aSNodiKSit9t6BHn9MFSA7TAu4I86Z3
         V85a8pMPnZnTZrrde6SH6ZnRzQyb5EXQ6w05JfJ1LKcSUPCU+9W1XJNKknR92pLQFasR
         RDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SKahIQy5cG4/Ex+BBA2D57j+sjQoy3Db0dxHJJCGPxA=;
        b=Ds4TpgcK9++GlUh1zTXGqxOys42fbJTQP7XtRFFXEE96S76o3o1pC8V7ENmjN7WC3T
         dK60CbkSPo3HQJmvD+tbq33A2IIh2k4/OU5OibymXsrp7KccT15vF8taNEXFESqanZbp
         9nXEoxy/W/dooxiJxy0719q8Ax4Sz1JeUBPLl1yHBPhbOk5r58GCf56Gzw7WBz2z8S6o
         Pde5td/xDoC/NPelNv+ATsXvnHMTClufsBWks1MXVuP8qh8QE1EkGdgPC1e11U6NugDM
         vQYK9wRNyLCCg/SO4JI8BDi4ke9KPTJ8ahJwH8n0ZAzVmpocmQNwB+GZx2sCuzxsTznJ
         /XEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vne6pl7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac84e8d000000b002feb26af429si2111952qtp.565.2022.06.24.08.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vne6pl7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4l5v-0002nB-7j
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyx-0001AQ-Rg
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:12:28 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kyw-0003uv-9E
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:12:27 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i15so5049763ybp.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKahIQy5cG4/Ex+BBA2D57j+sjQoy3Db0dxHJJCGPxA=;
 b=vne6pl7BU2QZtWwvB511ZbqNyf24cUQ1tpGPyo2TNMzbff3TWEbXGliPcojDTCDqZz
 w6QsBDtIOvrudn5AJPzKG9JpXCewh1AsEhh17tOCKRVN88IU/3PfLnNS0HWWTzLYVVdl
 5uaA6qNqqEzCsPsoa5b6dHmzZoaJqPlRMHAzhN2zWQnAiR0cEO2y8hHqQCIDgVn79kFe
 CkQke+b+vQKN/3MVMhGujBMW8JDSBi+eeAL9l4RrhuYUASVcK4nZzsTk5ZI5pEOwaF73
 gY29tV++slgMS/EOA3E6Prs/Rp+SbMtVZcaBjsele04kf1lzcT1az1G+RrU+kCbjNN9j
 Nm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKahIQy5cG4/Ex+BBA2D57j+sjQoy3Db0dxHJJCGPxA=;
 b=j845RpubCQYA6HcLHor0CcNW2Ets+9ZkTyTuv7R/lvvfz+cLXtJ0y2acLgjuxXZ78F
 k6JjdlLjUSfWyxzZ57V170dQw2l5O+9ldlPPKBZ5D5XNbU5zu0cB4MwZFAKQhGgZLt2k
 i1oIipynx3v2smTzyCpOdFzBrkQzohzNVCI/1l0lpnEUSt9E9Nqv9aBhxRafwA6cGbLB
 xQBEH/yKDSD1SCMuWCQUfeIZT9rak3mtvl7KKaTCLIIVCCC7o6+EqhOZvOLUW6JgMV4g
 TEeqo5Fj19GWz+7sjnjsW6ugJGpjTFelAhc4REQmm2I3oCap9XJ7QgnpxlnIQbMdxIpp
 gv0w==
X-Gm-Message-State: AJIora9UbYp19MOV1Qx+RL5CPJFFEtTUL9KQNZ2t7i7cO1j1jtNWhRzu
 RGvG7GaAFYTAAWLf17FhFoHaiZFZF/Ws0OVk4oFrvA==
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr12662316ybk.479.1656083545281; Fri, 24
 Jun 2022 08:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-51-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-51-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:11:47 +0100
Message-ID: <CAFEAcA8fm0GT1JqE_zaOM+sU0KL4qpP3bRTNyt9VVyvvKZradQ@mail.gmail.com>
Subject: Re: [PATCH v2 50/54] pckbd: add QEMU interface comment for I8042_MMIO
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: HKilFlgpnMu6

On Fri, 24 Jun 2022 at 14:53, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This describes the I8042_MMIO device interface implemented within QEMU.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/hw/input/i8042.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

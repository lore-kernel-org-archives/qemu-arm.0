Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3244265lft;
        Mon, 4 Jul 2022 06:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlO6nV8pHAnSSIxs5ctiQhDmyxXgz3zztVyvJbuyXNfgMjAfY3e/kD1D739g4avrb3Dvhc
X-Received: by 2002:a05:6214:1948:b0:472:fad3:9663 with SMTP id q8-20020a056214194800b00472fad39663mr2416763qvk.37.1656942790857;
        Mon, 04 Jul 2022 06:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942790; cv=none;
        d=google.com; s=arc-20160816;
        b=DtrZYEX+XKIZVPyulrAorNVVuF00k+DhqEGhH5kAcz93+TvsWs8/2r+qCYE5ajCoZf
         UxvIOk/UX+ATJXSQnxvqIrO/wf8qroHoJO9+7Ua3/u+CP0IbdNcRp/FfLtrnjFz/VO2Q
         +tv71elRX55Al5CuAOgBz/AArvOL4uxy1hmix5fhsWg+VGoRDqIdH8Jso0Fey8n3vHI6
         iVnBu4prKhMzf7FIoH6UEBuF4eH78TRHx9x2MlPzRIEW0WQfOxAVaTFFoYsp+NNnkJJ5
         rOxL3WerUHuncr4EBSUgJK5+NwA9FPgQLgW/8dbKTX0xp/XkItrkA5Hm+dZ+0wuKNVYX
         WuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UAiJLAa4r4qIMcsDU+5OqGDWQ6OmPMz3dgbHS+wx4R8=;
        b=d99ksdacdHaqxMX9/U4Z+xqOX1oZ7X0t2xPGwttxI0CvtcMRg021K16s+7Q+4eqdg8
         VH+NyDeaVgoKpTazu8RlGD7FvqwHQ8gn6lk72gYhUFnqr5R+scmCcFAlciSYDwgXNZKP
         a6NQ1Out9T2YhPzGC595sWnrjzZolPW3zGhAoAE27Ii7wiyLVAv0ZjujuZTTnXSqDfmL
         8eRUzLZ4jnt9wJVG0ezjSExnE+aFGsYKKjawagspGMSJ/4tz+R3qx5Vloy1P3pl2mDVH
         uGJR1nW6+VKUFKSJfNOaDmUsvVsLHzG43xff5IKAVvM/kqxKUt2BbQgttsBulZkS1NAe
         31QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ios3Y9ww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b65-20020a379944000000b006af5d80a189si11260372qke.221.2022.07.04.06.53.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:53:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ios3Y9ww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MVi-0006fQ-AC
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGF-0005OB-1W
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:37:11 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:36445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGD-0005qS-Io
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:37:10 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31caffa4a45so10912097b3.3
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UAiJLAa4r4qIMcsDU+5OqGDWQ6OmPMz3dgbHS+wx4R8=;
 b=Ios3Y9ww1BPLVxSPmiwezsVTKnx/7ch03Ir8uNVyhf/9ExQURH3EtvcU4jIlZJTrcr
 wZ6ugglyTLYV2WYnyyhH7KJHGLp0S0zwmI1T0sldP4RkTyPhgstisLAYVyp3t59Wk1p0
 xEvhwq9B6IEjYcGrOe/ydR+7U9R53NHgDovuiuP1Lk2BceColM0hEor4NqO+4xoPcjyG
 yd3rvyhwE/bY1fxZqakFDML7Z3b/3W7xVTmyeCP7NJILEYIP6VaEwb3HHVxsP6SD50oI
 Z/WIKJvfaGGpf+f+K9c6K0dPPBtjyjO1bJiQ4WAOw98ZKl/pckTHlmUKHZckcVLLLD8C
 F93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UAiJLAa4r4qIMcsDU+5OqGDWQ6OmPMz3dgbHS+wx4R8=;
 b=A4PY9BeEPVeEYyerPsEY9yDpAY/WYQijwmD9iq86mWy4QTdbKIVV5BBCSQqtefbW0S
 IaOY4qFe/Nq2YHSAjJD6snUPabbIqyE3m8aDRLjygu49bLu2Ef4ZZLVVszbt7nWsd//E
 /PvR9TDeJkj2O+9d9qockHBEGpfaTS7b+fj9PF30IYohM8otEspek1WKybdODvIRFxrG
 w/8UW27X+G6uchDDgbGPQenngroJIXaWHgM5/JcdrWIqsZZTHfS9CNlpMfXMG6C9y0dt
 S+xL3k2PdGe0j8Btu75/UqTxXeIaTg2RnNHRQC0LHRNBS1DxtTmoJDXrxG0DF3AfTHB/
 qHFQ==
X-Gm-Message-State: AJIora9+zwjg3j7wX1eS/hl/PBgmEA+K8Lmj50WBfCD2lL5uPl5k1nwa
 XwqF/XWxjRhjkMLDqbWiIaPqOemHrEpsNddcxsJsRQ==
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr907720ywb.469.1656941828515; Mon, 04
 Jul 2022 06:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-37-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-37-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:36:57 +0100
Message-ID: <CAFEAcA-XSMuxQa4ENTNOsJqu9rdnLtqdcOSHVK3jbAnNK8sQKA@mail.gmail.com>
Subject: Re: [PATCH 36/40] pckbd: don't use legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: sdxA2CHc6W3H

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 keyboard device within KBDState using
> object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
> it in i8042_realizefn() and i8042_mmio_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3375342ejb;
        Tue, 6 Jun 2023 03:05:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lZGTwuPOxgClKxIFnBamKeM2aW8QoIZl975ml8R0f3zi6uOcUuZQqh9luXqd3B8SDwy9B
X-Received: by 2002:a37:aa8b:0:b0:75b:23a0:de90 with SMTP id t133-20020a37aa8b000000b0075b23a0de90mr1250834qke.14.1686045905424;
        Tue, 06 Jun 2023 03:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686045905; cv=none;
        d=google.com; s=arc-20160816;
        b=Qq6cy4tVphSVkYXLuMZza7ek46bPfTrNWB6cY8MZLrh1rU0CF0a17Z/BxAM3Bu57g7
         5qgdjRYO7oLY6MQEtvd934W7hGTaQOCjGxpwq5MA5ymiMymyTxVEaEypBw5bq7Xrl8vp
         mKSDhrTsFxIiYBgsW/JOu2Ni5sO/PUOVxA8ZTdJeGLv3DIBKJpVYbFHgsivQ2ZCZtIuL
         Gq5XGFkccpt2WRXCTuUYEEPsmi5Spkr2QrFhb0kPYcAAse1oO1NMvUqZoDots43teJz1
         3vxzh6TnrGKD0+UaKTmCuboqd/pZPiB1O4ToRRUtl/EWzS6BurB/GLhusTsa9pgYguyf
         V0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=92wGn4QQJVreuFWfrl+WHcmwD8spWYxPz6rnS0StpKE=;
        b=Pn8ZWopYq5MKPnudYbGRdc0bbxCohYpQ3rBMTuuKGcnYujfcWMN9RvYGNlkXp7ngpE
         +nCc4p6gJptqlCehf2FqeIPWwhVUwJZj2JnEE5AeQgYbiZHcAcCE1wmG6JdEM0vEi8P0
         /JPgsUG2nhVZnL1t1r+6G8oDd3RYZmP9rVd4dZt6u2EanBbdG5K9PDP7gOJjfW8xehPP
         3XWfS0Uowl/FwMeIeP8x4XdmB31PfCPgObLZObo/PrPpsKMSzxpXYHBS3LyrF5kqcDW2
         v1kjRtcYYyi4ZA9wPLWeKGWhoZ7fQ7ZJNEMULtHIwWszE3mnVTUaRfJLq9sa1d9+lc32
         zTHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b6+F7z91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a05620a16a400b007469d22164fsi5577931qkj.206.2023.06.06.03.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 03:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b6+F7z91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6TYc-0006VV-Q8; Tue, 06 Jun 2023 06:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6TYa-0006V4-SB
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:04:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6TYZ-0002PP-Ak
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:04:52 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9741a0fd134so980761966b.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686045889; x=1688637889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=92wGn4QQJVreuFWfrl+WHcmwD8spWYxPz6rnS0StpKE=;
 b=b6+F7z91QPU0xCaO56NM84FKpnTxhxEfnVcTo3L9NXY+O2JAJtiBYtBbudpwZ7z3C1
 NBfC8eZnXCwWNKY8U5Nbgo6wpB75mhLqUQ+Sc6zD+Rmx1BCf4PM8Fvrgi2wG2RtBXO4C
 AhaYyjosQYRnZkpOI/dKSUp3245ZlGwY5pgJ/PGubXHB4qQaYSwqoYLfgGTwKpDiiyR3
 Ep1wRWroBmdvQ9nqz3/iUoX6WSje1Q64I6S1rHrWE3DGT/WENXiPs/mToxx9+TWurAuu
 tKkKlQ311AUcwBHL4i1zsRiUYeg1FJKyILiDXbfphKICXna3QcjrV15b4F+yNnurxkDq
 Wh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686045889; x=1688637889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92wGn4QQJVreuFWfrl+WHcmwD8spWYxPz6rnS0StpKE=;
 b=TpgkqE6Vqb1ZT+LDT89bj+0Lsl4TYcU+5fcWUzik2V+/+NsSk87+CIEWPdi4PLn5Em
 gBzr3vu2oMGZ5Lyjr0eKfiXzjMmcdOEHg8wyWsSGynpnLhEhUN0zui9r4o5d8oNGPVjP
 KMG3S05GBSJ2wHRCpxwa9BAVpU0zG7MF0I6cj/gSMUKi2261PoE8BF0mYgM5uSwaAPyW
 DoZ0HFQe1aeGbsVLkLS05UHuXJXCmV75WZ+8IhlC73uZRdHE65TKJDEFe18dL+dagtM/
 lp+hZl7jBS46hRqOaqldJdgN1ODoRO10Fhs07RLYRO9DUvzaXI686XPLQrDDlcPLwebh
 8Fcw==
X-Gm-Message-State: AC+VfDyNHc/YANCdKKsJsvaLBnw/PT2lDxzgfjKDdqucYBaQeZp1J99x
 IaJNbA52PDJtRV5FjX8b8Q6pB/4CHrdX601x58abyQ==
X-Received: by 2002:a17:907:9729:b0:978:4027:57eb with SMTP id
 jg41-20020a170907972900b00978402757ebmr1914627ejc.47.1686045889541; Tue, 06
 Jun 2023 03:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
 <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
 <1fc502fa-8363-5a5b-0697-f3001c7ab773@linaro.org>
In-Reply-To: <1fc502fa-8363-5a5b-0697-f3001c7ab773@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2023 11:04:38 +0100
Message-ID: <CAFEAcA_sGtV3HFZHX1JapnE04UpOxxxWvwgApVVm7dMX7+A-uw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com, 
 quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sVqYPMAcfktM

On Tue, 6 Jun 2023 at 10:47, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 5.06.2023 o 11:55, Yuquan Wang pisze:
> > The current sbsa-ref cannot use EHCI controller which is only
> > able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> > Hence, this uses XHCI to provide a usb controller with 64-bit
> > DMA capablity instead of EHCI.
> >
> > Signed-off-by: Yuquan Wang<wangyuquan1236@phytium.com.cn>
>
> Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
> Without EDK2 changes Linux behaves same way (no USB found), with EDK2
> changes (EHCI->XHCI) Linux gets USB devices.

So it doesn't break (cause to crash) old EDK2 images? That's a
pleasant surprise.

-- PMM

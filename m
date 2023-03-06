Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4684630ejc;
        Mon, 6 Mar 2023 06:07:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+Q1pOtNF5URd5l89zpprVg2pJSoXJ0obg6bGNwK4wpIytRRUNBEH0FZW5CkMGbSMU0KQur
X-Received: by 2002:ad4:5ba5:0:b0:56e:bc62:e164 with SMTP id 5-20020ad45ba5000000b0056ebc62e164mr15327853qvq.8.1678111653296;
        Mon, 06 Mar 2023 06:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678111653; cv=none;
        d=google.com; s=arc-20160816;
        b=QXI3xrHBWTHDsgbLsYS64JMy/kisaXSDSMJMqGYb/GY1qzcLVZX6n0fRJQ6yFTj81h
         01NDOmxKbrJDnOm6N3+LYGIgMDe7fpPSiMwCfQ7NSngjRO3MzRIhfJvG2UwsLavNiswt
         HX1X9EmcL/glNz0mbZGje7blRsj+OQEi2ft6cyVoSbeTomMVHHQzkwD9wP5Imha/qIho
         7+mJxT34vNOmUU6z4O3XrJ87PKCWcANMAVavGsiU0kvvJvOXEF/nvcHAkHCm9E14FR0f
         La0zC6nLrkiD1GhSzZ9+ZSEiTBVwltGLvIcnZsh1o4m890BMrhtkhvM66lwaaivXq3Pn
         dqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=T2wiUiHhuPJjTnJkQ4TTXnOMH9vrpZf0Lp9HQB8GqL4=;
        b=IaPlVk2US0AWPhY68xfiqCg0NNCElda+hAXnDhQaenLsrljncr7I+0fZSYODDP343W
         i+Qsgb0/wqBpbJgIrpvK3ksHCA0QtHSzwqBTmXgDRZWp2JSPg/EKf1KW+BME5ji0+nCF
         JiNXFXvLOmHiDAcMsCAVanSUxEKe/agE0bCxrcPrcbnVQnhGWBdU56OkgBWUe7oJPyAG
         cZU+KDbQmg6ZFJoArzKkizhTvIOxsWZVPxMCPu6/nM4P/gKVFcZg/ZNc9xC7i7bmzKU+
         GzxKYmfqpM2yGoA2uwHqxMnZ9pqjv5dfsw8JIm8w2Xp+QULQ/tW8gIR8ngO2MMtAZ2HW
         IJIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3ARhmoT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a0cca8c000000b0057d747b0206si6984107qvk.368.2023.03.06.06.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3ARhmoT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBUo-0005vw-AJ; Mon, 06 Mar 2023 09:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBUm-0005uq-AS
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:07:20 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBUk-0007XM-Q9
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 09:07:20 -0500
Received: by mail-pg1-x534.google.com with SMTP id h31so5588601pgl.6
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 06:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T2wiUiHhuPJjTnJkQ4TTXnOMH9vrpZf0Lp9HQB8GqL4=;
 b=V3ARhmoTufWbfV0Vcpl/3fe+TlOifJipmvHV6cxnRvL+97HfRy5OGetevfH7+JSJgu
 kD2r0dNu72AxjZgv+Z8Bk8hlPKGn1eJovdVdsHjUaVVYzQDXXOq0uqbmsEwrShSoMTRR
 /FWuattScQMJrBbEXOOAkSpp2PIHSsIZ2PrfPQDQQsn4VoVWh1YX8CncPzG2Aevue4z5
 7q07uXAN6MMGJ+gkGBEBBpCy0Q2jhZZrR9vDCe9HZKRagj1NgloEvbgVqAMgl2ZBjzn1
 9jSvJtxNVnu/Uum8FFDd6pzogrXWC0NiltYcMtHUH0b+HlFRKaAMkP645x+ItHSksc0y
 Fl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2wiUiHhuPJjTnJkQ4TTXnOMH9vrpZf0Lp9HQB8GqL4=;
 b=uYKjk+74RJ6XYi/c5fs6XiIWpTSev67jfbZNt3bjmQ7GwmPZbwLtDe5tWPlv6ivWlE
 n1Y0JfUj1YSqfGQ80q1D4YxRmzBYAI/AjSiy1jX/NFNTCiBYyqWyocV1TrIYeM1U//E8
 b/OM1rJY2TuZoSyapUkbw+C64rJdIMhisZew6ypc5NKLqf9rI6jw4fCvWncoIIwgrWA2
 3ZbqmKVqOQq5gyS07By5S5rB6eiR2p7iQijrqkL7f+UnfwU+zDbEcT1Dtf8TD7n8UZ2n
 Yh6zD/8VCb2IIXMsmOM94CseNc48mHiEbD/xcrbJ9byXC2XpT2P2XHR7ecZnu7vLiCtN
 qSLg==
X-Gm-Message-State: AO0yUKXApkIKcnvHsI+JCLWfrhbsEyVAhmkkviFYD5rqd6EYU74mVpmU
 7G3HL4inv2MjurS4LIhLfecD8TFWGFbfG637M7BTYw==
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr3827135pgf.9.1678111637286; 
 Mon, 06 Mar 2023 06:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <CAFEAcA_VzChyJ=E_QG0PUd==9YfEwmthO7MfYoXpp7=XfgqZ5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_VzChyJ=E_QG0PUd==9YfEwmthO7MfYoXpp7=XfgqZ5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 14:07:06 +0000
Message-ID: <CAFEAcA8GkvJixkaiwMJU7JMf+ZUjG57KUA=12G49zvMS8PKW=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw: allwinner-i2c: Make the trace message more
 readable
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: C/WRKYpOZaE7

On Mon, 6 Mar 2023 at 13:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Feb 2023 at 08:13, <qianfanguijin@163.com> wrote:
> >
> > From: qianfan Zhao <qianfanguijin@163.com>
> >
> > Next is an example when read/write trace enabled:
> >
> > allwinner_i2c_write write  XADDR(0x04): 0x00
> > allwinner_i2c_write write   CNTR(0x0c): 0x50 M_STP BUS_EN
> > allwinner_i2c_write write   CNTR(0x0c): 0xe4 A_ACK M_STA BUS_EN INT_EN
> > allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> > allwinner_i2c_read  read    STAT(0x10): 0x08 STAT_M_STA_TX
>
> This seems like overkill to me. We don't do it for
> any other devices. If we did want to do it we should
> do it by providing a generic mechanism somewhere that
> it's easy for devices to use, not by implementing a lot
> of string operations inside the code for this one device.

I disagree with this patch, but I've taken patches 2 and 3
into target-arm.next for 8.0.

thanks
-- PMM

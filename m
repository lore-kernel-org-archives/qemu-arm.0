Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2494631lfq;
        Fri, 9 Oct 2020 10:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEk6ozlZd9EV+qB8ivrvm9h7Y6BWcO8NRPDo8I62ntfqryOJTUc62Zym7EXBEf3R4UqXip
X-Received: by 2002:a5b:1cc:: with SMTP id f12mr14513578ybp.150.1602265902316;
        Fri, 09 Oct 2020 10:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602265902; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5HXoHMPc7KiMNHYrRVDJyX3vHVgvBSc4joubkrzCo7o9J4UQ3Gyh7skqPvzpwRteY
         q3O/LBTqtVpI2N6sy51X8HBxLwOqvljXWl8GosXNYNVY+n7ivu1EoPqVnkEravE9UxCV
         KTDDXbmD+4WmYZPVTkRFGrvINnzNLgYEZy0iXgvhj59o+2FQwD/TTLY04hwHJRxXehk3
         8wT8Kn/q+Tbr0vSpMBHmYeqxr6lpuiqaha5EwTNv+65g4qjN1Q8vNl/dTlWrpeHojP7/
         xQuKAUTBnuzOrfFviqyc6P+p0yUKmrUkupQK9osOcPGaa9wwaqOso/NbUMZJFqj6Afrh
         w4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1YplCQGGpub2zlaw7ENhKq/CRFojJ27h9P4zlJkUHQw=;
        b=AlmjK1cCUymio4XsDvrGNc390CGnPmBGV93qcU3cotqlSIO5fvh3a8eEluxMECouS8
         r1CQHWAfvx3qQAuB3nMPFihohJEcgaBs8jGLyPNChibRS4zz+OndDoEfv2ko3WNZkP/c
         B3Sz27dL/L4yUAEPNYNg6+kgC7PrfGrXecY97FJ1kngpJcIs8VA3n0IAfyG/jqChwn+A
         cOcpmE5BF7IYdnG/z2xY+ZPygKSUpRuG2t8hpHbp+ZTM1qu+bJ18wrCPBRd1+poeNsvj
         npVIQ+nrSk1iz5KoSZo54e40omwe1NTEt45VQwuaOXq89O66/9HLKlrGOQia+CDu72jL
         ba3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sr6pUWN0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f190si8485196ybg.158.2020.10.09.10.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 10:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sr6pUWN0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQwYP-0007zZ-Hv
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 13:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQwYG-0007zM-PF
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 13:51:32 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQwYF-0007I7-7t
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 13:51:32 -0400
Received: by mail-ej1-x630.google.com with SMTP id qp15so14304770ejb.3
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1YplCQGGpub2zlaw7ENhKq/CRFojJ27h9P4zlJkUHQw=;
 b=sr6pUWN0OWDHodVv8ykgx+XTwDO1lWO+ihseEVkxd1kLH/J1ZS1yOqBhXmyELCFFKw
 2CoZQiE32wU1P0YVYzdOwD4UfFwF0FF17de9XoAWjskcDsONYnz7WXPwgWYkmz5cNI84
 Kd7dDy3ZoF4XfVxKdKicQ3nNh3sllX6SQ5oxjbIve1T8HomS1P65s7GNtmBlpz0YHNwn
 JXBioc9rDOKAQSOTXK6dJQsPOcG0239jlL+3IlGLOj2oQHyaVD5+GQlQDZzMoveXx33L
 m0/ETrtHpXsGZoKvB6dHCBYMHhibhBWwqoNTxymqprTI7Y996nAitQ4gd9Uy/9OiA8OC
 IHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1YplCQGGpub2zlaw7ENhKq/CRFojJ27h9P4zlJkUHQw=;
 b=riBmRq4hsYrcXm08YKvEEvojk1ouK+j2ofiCP2TdY16iSskeInbC3boYT2F0S3w+1S
 PB+l1QYLxC9sHGInq1+2lsDom+yzHjUAa6wW/6gSOWBgR9BQVZ7+gLWfIGzNc4z2skj4
 SVrdgbqsAYKRztIM6ew6RaKnfXrpcflAODmdQTMLa7964f3Wmcdkn4/5eyHTF5U4W5i3
 fWjpke5G18lTo9dRQu0RCzSNxWWjgZ9evER7FbQr27/tUKhe2Sj3MCFL3wOv0/2MEdZJ
 t1wQE0iViqFq5UgvPQvQb21tl5BoDjVgocCpUAzW6lOLWWVnSLtGZdba7G1PpYvLeN04
 WsDA==
X-Gm-Message-State: AOAM533EX8LOavNW9MWe7p5Wb9gIy2fedooCij5nsu/ToTUyxTfKJRTO
 Ca5Ioz4ug64571qzBv5MCNv3m6qzJSE/IaGmBX8jhg==
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr15773807ejb.56.1602265889313; 
 Fri, 09 Oct 2020 10:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <74151CBD-4750-4E68-9127-21076C019036@getmailspring.com>
In-Reply-To: <74151CBD-4750-4E68-9127-21076C019036@getmailspring.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Oct 2020 18:51:17 +0100
Message-ID: <CAFEAcA9cZPgaHGuCs0J20YJ48V2eXHFFRsb9a56xFULjtFtn3g@mail.gmail.com>
Subject: Re: Re%3A [PATCH v4 1%2F2] hw%2Fwatchdog%3A Implement SBSA watchdog
 device&In-Reply-To=<CAD8XO3YmTC7fzxttg%3DQLMpJbg7uLogatxN7q7vf-iGZjyQLjjQ%40mail.gmail.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DNcmaL4EPkhf

On Fri, 9 Oct 2020 at 18:30, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> The value being returned here is 0 (initialized to 0 at the beginning of read function).
> I have seen similar practices being followed in other qemu implementations like for example bcm2835_dma_read() in qemu/hw/dma/bcm2835_dma.c,a9_scu_read() in qemu/hw/misc/a9scu.c.
>
> Please confirm if you would still like to add specific value like 0xdeadbeef for bad read offset.

Judging by the subject line you've mangled the headers on this
email so I'm not sure exactly what this was a reply to,
but in general QEMU doesn't do that kind of "return
specific marker values for bad register offsets". We
typically log it with a qemu_log_mask(LOG_GUEST_ERROR) and
return 0 (unless the h/w does something else).

thanks
-- PMM

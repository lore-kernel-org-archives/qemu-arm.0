Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp78102lfb;
        Mon, 11 May 2020 03:46:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIy1x4rjdWEOO7nahCE9zLrJ8HHGbAsLcFkcndtTcx2Pi1CpFvJFTRsvaet4+vLjin2pKrv
X-Received: by 2002:ac8:2fe4:: with SMTP id m33mr16000258qta.119.1589193967357;
        Mon, 11 May 2020 03:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589193967; cv=none;
        d=google.com; s=arc-20160816;
        b=IK2Ayz9JE5SR16VUl6fjX16kuIqqexdSxcR4AWNSEOrvb86cNaptx+SMmL/IdSHXvh
         fbK9OmU73WI1wp/wilYDVJvfbvPxCaYwbnlXrcS06BoRJ0LN+x8uZxOm3Q61RxeeTr0j
         5/gfi1ArSYZlyRTUaZgn7EBrqvLLVYx13+qMPvoWjQYcprIEBd9DS42phHrRZecRCEej
         BHB2Adi5yQRlewjjStHmU+b2vV+oZh46vVGSx2/wo2Kjx9A8vGPm9Ga/Jn0eauMkerK7
         QhaMHJmPQtTf659sgQ2+MVrlTqL4p5wvEfFbIXO0MbiuwpjhJGmS11oBEpBetk9OZQ4N
         Wv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OwN6h8cya5X49/nSuJcvJ6u0elsZNdW9pQzkzZsOhbM=;
        b=W42yP/dgp/LEbC1NiBdB6eVbMSvuKUaYg+0hzWFWRN1sC+yqVPDSilUeasIljjYWA/
         +zNPsG7sQmtjJtlQ0MoBYlASSVWBwGz/V4X3uokK5y9kiYxBfGvHB6/r1fGwZfUyYq2h
         OvAyS4vone8x/2aM8DdLlzWZPsVvwgmAWirL99BqtyUp/oUK6xsu0ZpuAqF+nOg9NDPF
         fF6Xq71AjJMIxPTlGIQzDLXkpgZmq93a2IHClCNrEf391b8Hj40vwqFB+Ueq7lGWaxtE
         6dd2gIg4sI8v6oXDe31myD3StrZqeYDwSuxzcaDd+30avMVZW2Irl9Sfdo2HgTGnrO6n
         4NPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ICg2Bn+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si12796qtm.252.2020.05.11.03.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ICg2Bn+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY5wk-00054i-N2
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5wX-00051W-Nu
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:45:54 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5wW-0000Fi-Gw
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:45:53 -0400
Received: by mail-ot1-x341.google.com with SMTP id t3so7143994otp.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OwN6h8cya5X49/nSuJcvJ6u0elsZNdW9pQzkzZsOhbM=;
 b=ICg2Bn+wU2NdqbZeGk15rfoXq7Ouj3hLdtP3+0X5++eP3kqMgt7eK0Ge9as6BZMJ2z
 IaRNZm46CfIZzsky6qCE+acLvRUt9kOa8bvlEFTb2Ohzuw6xOCx5fzL7BoLI/dEv5lIj
 2Cpvf1wZywX1+i4dp/stv/eROtW3pNl7y6WzCzIfs6GC7NWhjcO1jwN5sE9rX9uT6zV9
 BAe32bRIffY3KD0+403m01euVaDvnGjnzW/1xrZwg40hfZaHQaWZuSvC0jbTyuMfChVh
 jwlNbl7qkEGFi5wQV6Gv1F0OJ3vLZHyf/iGClhyEyylRBoOURMYIyUaUiGxXCcuiHcMY
 QxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OwN6h8cya5X49/nSuJcvJ6u0elsZNdW9pQzkzZsOhbM=;
 b=PUKFLfJRQ65z/+SCmTQo6agZXk0O1hwgS59SCNoObPuCj0bOlG3LVXkL4LD40FMYjZ
 SVQSO6fTAp9prXaKZrsreBZdJiJTUSc94CfOUsfCrSWFQKMmXY+BtE7DMLJRpJpinOFW
 PsJjTtASz5jebZVoRd7KTD9Y7KbsyqgHLNvz8ldyuRxJ6DigfGzgS/Uoyy/Kg8oZ9Qdq
 +ldOEYnJuvmEgHnqNxbjtUuzOdnOPoSrrATbUVyHeBFGXEXB1F5zVcPEd38Kt9MxIzZe
 FulZRKHe+OERUcFxrlIp72MTJL2to4cw3wPlkooIFJrYvO2Xg0BZiDLWf70D4ZdCDZga
 RLTA==
X-Gm-Message-State: AGi0PubHL2FNZqpg2B0VhUob6t7NpNxzPLK3hDetNOoVyqtrCKeHdwGF
 GoDjqOgEL2c0qZo0zNf4K8c+nHVH3rN0XzCNNSXJzg==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr11919432otj.91.1589193950984; 
 Mon, 11 May 2020 03:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200504072822.18799-1-f4bug@amsat.org>
In-Reply-To: <20200504072822.18799-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 11:45:40 +0100
Message-ID: <CAFEAcA99uztOyAODdb=oGo7XM45dj-uWY6yiMW2LBACQH5=GUA@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/arm/nrf51: Extend tracing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QxwpoZfE1IsM

On Mon, 4 May 2020 at 08:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Few patches while playing with the Zephyr Project.
>
> - better display of unimplemented peripheral accesses,
> - better display of timers use.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/nrf51: Add NRF51_PERIPHERAL_SIZE definition
>   hw/arm/nrf51_soc: Mark some peripherals as unimplemented
>   hw/timer/nrf51_timer: Display timer ID in trace events
>   hw/timer/nrf51_timer: Add trace event of counter value update

Hi; I've put patches 1, 3 and 4 into target-arm.next as they
have been reviewed and are independent of the unimp-peripherals
patch.

thanks
-- PMM

Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp169881lfp;
        Mon, 20 Jan 2020 05:01:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqw0kh3bbcx+aZqaFLY7FhJk5bXdBBHdKGVrYnDKnpG6mcelTO+0eqIMw+Fo0h7QxMV6pkyh
X-Received: by 2002:ad4:4e86:: with SMTP id dy6mr20504633qvb.81.1579525264224;
        Mon, 20 Jan 2020 05:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579525264; cv=none;
        d=google.com; s=arc-20160816;
        b=dulax0qEkB9VFo7T0P/mmffuHm5p9to2K41gRq32cBJGn5WIAZv0y06povMUhP+FXf
         M4bLDdzCxthCtnt8o1Q8+00rm5rHH3brnBuyD8/jUl1qpi93KLzLuIzxUKz3T64CbMIJ
         RBWhqaE+CqdL1jrErr58oNYigw6pB2439RfNkV5w2pNJA4h+f5EdiFVD88pOljed3zRV
         b8hJ5Aj5UC/i44AHDKLEhTkzUpCei3VVCYnJzCG+/GW4u1olimNiXA09ZjVrdfYcvP7p
         8MiKEME9I0HghYDujU0+hBXQN+IZues5eLJ8asuT5aKnGJ7FSZwWjB7gYS3rD/kydKj+
         NifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=enEzIYGOJ3Z9BcpMWQn0M59KHHmkVRX4jfdLkG5CuCk=;
        b=wru+ie0DX8ztEG2L+F2LjBCDI40M8rxUgbQbntDhfBG0DTrr4pmf30o+XSePB85a9p
         nf6TztBjc0gxksbQHwWwMpYCKQ0We17dOnf46lhmKGc5wOOeAOEaMfNLF8UNepI8AHMA
         FBSES3+3SPzByOdvqp3GROmD99uZaYHuV2bdAeu4nGjYYI4TZqXJxrJ5fgQoR7+yeWp7
         G+iqLx1iPhGtMapMeUD/SiR3IKPnEBOiPXnldHLbtIuUeS60NvbZrqyDjf/po548I5ik
         6CpqtxW0JT1+KGkphum9MWH2qdZdtJFu95/BQye9x73iA0IKX7R99HFmCvMI61zsEXqj
         DajA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bX4XaQYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si18507478qvx.171.2020.01.20.05.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 05:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bX4XaQYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itWfv-0003VY-Jd
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 08:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itWfk-0003Ue-MI
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:00:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itWfj-0003jj-HJ
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:00:52 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itWfh-0003hW-Uz
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:00:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id k14so28619054otn.4
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 05:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=enEzIYGOJ3Z9BcpMWQn0M59KHHmkVRX4jfdLkG5CuCk=;
 b=bX4XaQYDs43MyIIESYHeI8kkQ/pwbnQSNPMjHiF4P5Za1GD8YduN/DSGcEL0Hvge6Y
 8LRks6GSVgt4jnH9Jk6XfTZUmxKMbtRpDcmx2797dyffQ3lyUqijBsGYoswec3N1vAGP
 cta9GInwB8/jAyRdXCkddjf65qN0Rao9VrvIzF3z3P2ieA5yer6O4xG/So1Nz2eX6UnP
 5+x0GOGxCLwMWdOzpbrCIHTEGDYuiUfCr21KqVSESPxRMzHakzuAIXEbdLM5EP7DtfZG
 8kg5BACFwa5U/q1S+5RDuE1uv2G/foA/5D8mFA8aRfaxj8r5Ui1qOprvHQ5cNmAGJUQ7
 TW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=enEzIYGOJ3Z9BcpMWQn0M59KHHmkVRX4jfdLkG5CuCk=;
 b=MH7WJL+6kKBiirkRkyR92veflqfOXCtga1JrV4cHhh8ZXUrUp8XOt4jTlmyL5s59jG
 52htBKhSa1YJsNcbK9pTRnxI1rJOUcHdARvV1jtKKkx5ULwj0S96k4PCjGLZnbvIem6W
 V5TJariWukD/GfeQiLDduPZBAxS1JPK19eorTZwodECynvT9FgF/QtnYgeEbLpjRO7Y8
 Q3Bxe3Rj9QSbk1Q8NQaKQBQmEgRpDsx2fiRoJyXjCnKOgR/aB18sUmNgbr7RFFYL1KTp
 c4bKQVUuye1/xhlm2Q3DdH230lBbeHYKqTjBW/C789c2CcF34l5KkeYiAPGbESly1flM
 LKRw==
X-Gm-Message-State: APjAAAXD3PZO2Kw9SBucB92VyIJPP8DVGDtx0W98I2MAy57zYZX494Zz
 dMygZNfzHA5GKOP1ygwrbXt56+rmJiqupfT+Jw2NhA==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr14993763otq.97.1579525248039; 
 Mon, 20 Jan 2020 05:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
 <03110090-dd50-b124-e60a-9cf136e8f7fd@redhat.com>
In-Reply-To: <03110090-dd50-b124-e60a-9cf136e8f7fd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:00:37 +0000
Message-ID: <CAFEAcA92pO3j+d8wS2PHhUKTjViLS3GbrmT4ocaDUYKFZLWgAg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: add PMU feature to cortex-r5 and cortex-r5f
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Clement Deschamps <clement.deschamps@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBcAXxRnliDd

On Tue, 14 Jan 2020 at 12:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 1/14/20 11:59 AM, Clement Deschamps wrote:
>
> Maybe describe here:
>
> The PMU is not optional on cortex-r5 and cortex-r5f (see
> the "Features" chapter of the Technical Reference Manual).
>
> > Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Applied to target-arm.next, thanks (with the suggested
improvement to the commit message).

-- PMM

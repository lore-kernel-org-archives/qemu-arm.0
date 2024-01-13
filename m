Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2892851ejs;
        Sat, 13 Jan 2024 02:41:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgcwJkFi6Yzf0fDXc1er2gOWGH0PTv4mIGT7mwlw5YO020HSLwoh0zrCmKh7MeEWEx73B7
X-Received: by 2002:ac8:7d96:0:b0:429:e003:43df with SMTP id c22-20020ac87d96000000b00429e00343dfmr239725qtd.114.1705142496997;
        Sat, 13 Jan 2024 02:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705142496; cv=none;
        d=google.com; s=arc-20160816;
        b=N71KpuYpqrmZJSo7qpxyRt8EYUEyQcS5OCKNBcuwIDTeS8D1eOgIm2wjiLjbUuWBSD
         iU8/nIXgT5FBgF2ig5LCshrKrZQZMPljZ52ovXwxVCLIFcscxyRdq2QoEERaHYcJyNgE
         QwoXsAxHzV8odJ2Pc+si9qjNlUuMAz2Hf9nlCptsy8OF67cCmBYUDxR/fISPqitFUBDC
         hp+JylgABFZPG1e1VEZcGvoM0eyTg7TyizqMb3m3z7qjPcWGERbwaZCb8XgHLfFVq6Sw
         dDKBQ9vOztUeAcpfMiyqB/wYz2m3eMxcVZwg7NNzrtPzfJtcZJf9HeFycJgZXapBH7li
         pa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id
         :in-reply-to:date:subject:cc:to:from:user-agent:references
         :dkim-signature;
        bh=ff7TkTuGuELDZ75dKYbl/t6mm6j6yduwDcqGH/5y9Ek=;
        fh=bK6HWTkBOyM5KIaTPN53H4+O0/wt4Gn+uOMybiIhQAo=;
        b=jvc/y/fijLoU9oJoVlhDfszLTl+wlZXvfOCyftDR2NdVVEuEJ9XxwLeoydzhGtW5UE
         ksl51IES2rqWrI17v0k4QYNJuqe0Tzu8TQ88hYBk0m0SwqZmypjDESzf6gU4ByaP1oRe
         wv0Gcym3XUZQuDQMtuCrgtgItgk9vkpI4WY3ZCA0k6kGV+u5GalxEDB9b8VfS2bkwZfy
         /SZILfVF1iQj8dpex0XQKClaINA/OMLySI2Hjg0DDL6zToFmeH117aNjce29LBI8dHxf
         YScYIaEvPmiScE3hnFO5aV520lKdfGtjCd3wUBNUGJ/rUov8sKxpr+f6h/nRCqbu+QXw
         qp+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=so0k2mO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a05622a180100b00429c839fb21si4113449qtc.396.2024.01.13.02.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jan 2024 02:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=so0k2mO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rObRy-0004y9-TC; Sat, 13 Jan 2024 05:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rObRx-0004xu-Vs; Sat, 13 Jan 2024 05:41:14 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rObRv-0000Mx-UO; Sat, 13 Jan 2024 05:41:13 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 85B6680024;
 Sat, 13 Jan 2024 11:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1705142466; bh=XsBfk377Hx91qrk58snQlKdvUyxgU/0p/5F+skRQh7A=;
 h=References:From:To:Cc:Subject:Date:In-reply-to;
 b=so0k2mO88xfaEBgdwt4NI2lWvCS8iy7kqRCwTUNvQJIX1KLZPyt59clZZoVghWY8g
 3Jnh0NrX0qVPV1dninf6MUVZ5Z7eMCQFGDdzoeLFwCASoC5hWK0DCrcWBoQ/j57kNT
 ySH2mvkWpieLYi/hIcn2MUtJp+tMqEGgnTohu6pkJEqjegTu+0fp5kTjJzVrqvEVgA
 nZ89CtoFAmnN+cm4OgBHbxbryDcFUyTItGPo76Lg08qCLwZE6pstoL8y4oolXYQ+d+
 lC1ThQuPRhn+S1L0K957OD1ZWZxGp7eHsJ12FLaIR8rB1FQuwLEcsHxAbOu2LlJIS1
 OTizmpZ81DjzA==
References: <20240113102913.18278-1-arnaud.minier@telecom-paris.fr>
 <20240113102913.18278-8-arnaud.minier@telecom-paris.fr>
User-agent: mu4e 1.10.8; emacs 29.1
From: Samuel Tardieu <sam@rfc1149.net>
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?In=C3=A8s?= Varhol
 <ines.varhol@telecom-paris.fr>, qemu-arm@nongnu.org, Philipe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 7/7] Add tests for the STM32L4x5_RCC
Date: Sat, 13 Jan 2024 11:40:24 +0100
In-reply-to: <20240113102913.18278-8-arnaud.minier@telecom-paris.fr>
Message-ID: <878r4th5x9.fsf@rfc1149.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kFHBKE0n7Atp


Arnaud Minier <arnaud.minier@telecom-paris.fr> writes:

> +     * The procedure is taken from a program by Samuel Tardieu.

You may drop this line as I used the same procedure which is used 
in other tests, this does not deserve a mention here.

  Sam
-- 
Samuel Tardieu

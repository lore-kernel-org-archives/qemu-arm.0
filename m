Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp97152eji;
        Sat, 16 Dec 2023 23:37:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/QVCJbTH5qxUy5fsozc+YWFILnR6X4ygq3qFJyGmwWUGR6SzkNsyeV+H0N3Sr3DQlUBRx
X-Received: by 2002:a05:6214:1d0c:b0:67f:fb7:2682 with SMTP id e12-20020a0562141d0c00b0067f0fb72682mr9057616qvd.92.1702798657709;
        Sat, 16 Dec 2023 23:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702798657; cv=none;
        d=google.com; s=arc-20160816;
        b=l87yJwgQgF4n9ABlsPFN7yS2wnqrSfPgITR5vIO0rR3nbRE2RkptN0rtmzOTNs9V07
         3Kq6RELk9Yx/PbjX42R7mus17CBkJgrnbCye87O+1mJWzFeIR50eiI7v5GZ+vSS8mKJ0
         jw7y4ZLQxWztiu5WRqY6bTc1lox7B8wDnibgAWnFt4hx6pwSmf58iwjpiL4F2Ka44J1w
         6EQx6HGb1TGlSn5CEWp8GwojUvvAQHm20ICFDLT5K7Eegi/faafPu/KNRJI1o8zuUc/N
         In0FnNVaeQnBHLH2GkpdujMikjlkKrKZI8G9q1GCR8onIKfKs9n4cZPytsVnksbs35Rc
         j8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id
         :in-reply-to:date:subject:cc:to:from:user-agent:references
         :dkim-signature;
        bh=dlZjSMWDWHREKUidbekb7umWZ04pZAR3Pyj910J4ATU=;
        fh=OmnQeEymekw3dQih5C0z4lb2caLiS1xlgMHXeeYMNWQ=;
        b=QMwsJ0SRBjUBGXvLWklv+oUAZXMoxCA1I409XCCgZG5SQe9bLSmuIsnFcgD9mHce5i
         pZqXVizAzoLOCzMX2jO2n8jRjmMYjekmEqnizPK0pExbOUrYnlj9EeIe4qp3VJi2L99h
         vSiclWmml9XrW4Sz6XsYMfxYWQQXVy4Aj6IU9XT8Oadl1+TwqV8fdfP1QjiyC2G8uzNh
         LyGES6x7KppJm3qTdVpQezdcnPT65iOAF2gvYil09+1/5tAbyAvlN62Nbh7Ic7pW4kWm
         Pe44vHUnfaBXpOAVH/ETSQbopquWJR/iMljxNzGtUoZeYBPgR+96Gm4VpDsxN1hmtOLf
         XVMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=c1ZmcisY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a0cf042000000b0067a96376456si1356559qvl.299.2023.12.16.23.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Dec 2023 23:37:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=c1ZmcisY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rEliK-0001RA-Uj; Sun, 17 Dec 2023 02:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEliJ-0001Qx-NR; Sun, 17 Dec 2023 02:37:27 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rEliG-0002a0-4t; Sun, 17 Dec 2023 02:37:27 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 995DE80025;
 Sun, 17 Dec 2023 08:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1702798638; bh=WJtvAqRs6pqgFMDIUz7FqRnqdA6ge5oy8hsHAq+8alE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to;
 b=c1ZmcisYoBZZrAFU83G8C/0FieLZt3yQYXmRKUvS/FrxY13D/ZnldKgLzO8+uCR97
 /YdaLFBNTeeqHCZ58gcg+qxC6pjF8tAA86YQbumdoFFsiwibu04aqm88BFadVMYzqX
 i2dtkXNZ8R2I3xctIvnMa+K9P2s4PEINaz0+dviaN6aoNH05HEX+rAy3LrwT9ZzfEg
 9nHPoRpOO/R6HWSR70LG0RYaiZEGPUgCQ4eZ+KUxww9RD9JR7g2nqP7ydP1IqdWEoz
 BbVNxsVjaG251N/RcmX0rhvVHFPLji75d9FNSFO1kU4BzQLvmmGogpb+yQWr78kWfb
 E+42aJHJrNiPg==
References: <20231216182740.3305724-1-sam@rfc1149.net>
User-agent: mu4e 1.10.8; emacs 29.1
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org, Alexandre
 Iooss <erdnaxe@crans.org>, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] Add "num-prio-bits" property for Cortex-M devices
Date: Sun, 17 Dec 2023 08:35:31 +0100
In-reply-to: <20231216182740.3305724-1-sam@rfc1149.net>
Message-ID: <878r5tqnyu.fsf@rfc1149.net>
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
X-TUID: 9BtaY9Uf5QjV


> Samuel Tardieu (3):
>   hw/intc/armv7m_nvic: add "num-prio-bits" property
>   hw/arm/armv7m: alias the NVIC "num-prio-bits" property
>   hw/arm/socs: configure priority bits for existing SOCs

Any idea to why patchew fails to apply thoses patches? The mbox at 
<https://patchew.org/QEMU/20231216182740.3305724-1-sam@rfc1149.net/> 
applies cleanly on master AFAICS.

  Sam
-- 
Samuel Tardieu

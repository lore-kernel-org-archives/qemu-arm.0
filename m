Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1618543njn;
        Mon, 13 Jan 2025 00:27:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOpzqSSxGLELMHPxM4HeczG/pqmT/CSQShR3bHJ+iSYxUK1kzoY3c6yM7tp2psXFEI68P+BSmz0nrIrA==@linaro.org
X-Google-Smtp-Source: AGHT+IFeiUlf7Y8RMPIt9l5mD3KPPGCt3fkm4F0/F0C534Aet/0E7mtbz2dAWDFJ2NLlmVihwqf4
X-Received: by 2002:ad4:5d64:0:b0:6d8:d79c:1cbd with SMTP id 6a1803df08f44-6df9b238518mr325071926d6.15.1736756876128;
        Mon, 13 Jan 2025 00:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736756876; cv=none;
        d=google.com; s=arc-20240605;
        b=KVS44DqJxKqzomFvpyprxNhn3iWLqfE9JJgtBOr6b+G91XlgB5fC/qQy0DJKPWk8vf
         1Ekr7gzlVO8ELYjmuZPxcCAwQ+Ar5p90wmn3KKM2aZ56J/2aPg8Fh8qEOiEeckvWJNlu
         UuWyLBPaTxz6CPWg39MIuJCrfzQ2J4/vTvthn5XtaaEj6dHztSDzEFYuj2XDHWiMEylg
         n60z3tdCbwjYOMEhYrJX8c95PySI1mNUxmp26sc8MUBwVqJqdVVt9i3DaILl6qqTtMGz
         z+GrH4edXrFKVutA5/KxGSN4vykNxScVVpXqQwvqVSHWCkRX/xPAAQvF025IsFsKBGOC
         PVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=171NA4ObttKY54K4Vx01NswlNwiQJc1fA9xz2eOSMCI=;
        fh=XVa6n8mAbhd090OZ/xCdIqGDUKMgrti5G7wE48bkEhc=;
        b=etnQbhTJjkfRJkY5I/o0A49nWD/tupWbXApgB+7TmWcLxjs575TosOZg5j9u1fJdIp
         7nNiOcL7k0lSM3+gft6HTtYQw/+5BevcHQv6CFQieHrZgt7VX9q95FCZaoIqRQ23X9Os
         HpzS7YW76kAcZ78y0kwhtFse04FwXbZvf2qc1GVwKUbuljtHvnkw65dDZjf0IoNxTR1f
         rBj9jDNM5zFEpYwptLtfkddC06FeSugmNZvXgQqcmDM+pPQTowNMc02w/d0SasTkypOk
         +1vUyFIa2CK8MU7/zj07mljtGvIMdwvUZRmeaD2arj4yd2KZyLuxONpnXZzSEnHHaw2c
         pgdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=anu4XebC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadfb5accsi81975566d6.387.2025.01.13.00.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2025 00:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=anu4XebC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tXFnO-0005d8-VK; Mon, 13 Jan 2025 03:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1tXFnG-0005Pl-MP; Mon, 13 Jan 2025 03:27:30 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1tXFnE-0002qr-6x; Mon, 13 Jan 2025 03:27:30 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 905E080026;
 Mon, 13 Jan 2025 09:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1736756838; bh=171NA4ObttKY54K4Vx01NswlNwiQJc1fA9xz2eOSMCI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=anu4XebCVxT05MPQvgD1RoT0loY9qgoaT8ztj2Yy0RkohVkvQqnvNGEoAj16ZvF9D
 mkEDCxYOMdocxZ/AAu0LMdN9H89RwGoDJCjh8h8WK3g8dpHm06PAbStDuYmjqkX4zy
 yDyQjmg+orvUESL6u2INKtRatOZ1pEW9vA/B4//DV0XwifqlaCKX3NFod/gVR3dVFo
 vbQWTzfjDoUEJGgbcvslg2Z6FZBqGeCXwU1AA2PC4g7KWS8tuYVusYNRynrGLcvJSx
 /pnN/GW+dzs+ukFKDKlSm93uPXsHT9em7tmUJ8turrgoiHLmkcKa2XT/CvbgocfaHn
 k532XryGCtZKg==
From: Samuel Tardieu <sam@rfc1149.net>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,   qemu-arm@nongnu.org,   Peter Maydell
 <peter.maydell@linaro.org>,   Felipe Balbi <balbi@kernel.org>,   Subbaraya
 Sundeep <sundeep.lkml@gmail.com>,   Alistair Francis
 <alistair@alistair23.me>,   Joel Stanley <joel@jms.id.au>,   Alexandre
 Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH 3/3] hw/arm/v7m: Remove use of &first_cpu in machine_init()
In-Reply-To: <20250112225614.33723-4-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 12 Jan 2025 23:56:14
 +0100")
References: <20250112225614.33723-1-philmd@linaro.org>
 <20250112225614.33723-4-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 13 Jan 2025 09:27:18 +0100
Message-ID: <8734hnt8yh.fsf@rfc1149.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sHQob31ZsYHl

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> When instanciating the machine model, the machine_init()
> implementations usually create the CPUs, so have access
> to its first CPU. Use that rather then the &first_cpu
> global.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Samuel Tardieu <sam@rfc1149.net>

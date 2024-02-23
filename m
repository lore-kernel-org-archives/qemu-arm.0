Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp696854ejf;
        Fri, 23 Feb 2024 09:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNqL8qDUBAZEeGqYdDCuIEfjd88IlzE5BFOmRAkQFARpGb8G8E7n8vA1Rww4bppt7Fkglm6x5S3px07zOU6nKMAHulkV8Z
X-Google-Smtp-Source: AGHT+IHk1Zksj0bzqeKAGSc1/IFFLsjJQEPORXxTLtfSz8JJTrt8U1RmG4ivrJI8Q1hV2V9b8FKu
X-Received: by 2002:a05:6214:4b04:b0:68f:5d7f:6a8d with SMTP id pj4-20020a0562144b0400b0068f5d7f6a8dmr902523qvb.3.1708708295488;
        Fri, 23 Feb 2024 09:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708708295; cv=none;
        d=google.com; s=arc-20160816;
        b=gUzcgG/mBBimybNTlfPTby13tFaytVbl+PxvRWuFkvzF82YbLry6U0V5i7eZZEkZrf
         c3CeMh6CX68NED7PpQLCkGCDof1S7P8KEwQe+Mmau5LKolGLrzBcjD2yYZV0fA5LAIGg
         rNM7053UaXgUoDojdtLecA8ALcpSdWdsLIpF7MQZMkRQPlW6MSV+ziLea/dAoflHRMRf
         TgDEe0P3lW3OJ37jt0X/6cT4KMIFMUOB+P8UcH4yreKPd9zcUE/t5awp2KB4zwIWoL3q
         cOLAVoMLFCtqpsz4cPsQUYBYJH+JZxwD7Ds5k/y+1XOVXIHhscnVKZaVJvdpeve767DI
         wlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xsDhYDGOw5CqhnAyZ1mUQnkbXRXKZJFQMDnbXbJP7ck=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=RYBpEdjInMPini+xLXXNRlSLjq/nbDarzJoJRBWKUW1/szXBEobYJf63EKrncs8+h3
         ZBpkK6pkDnn91ipdww/jUSBuC55wTATZxbeQFd1TR0g4QV+C583VndBb6gt0F4k1uUk8
         Hso99bqi/oSr74Hm4vGwghzQPDQuFp8RmBGlE8fqJs6WCRDCzoXr/YI7yez+wCMAVT60
         1PKc8oBVu0rfahk8VoJXcoHIdfMRaA9rZAAM4WvEZNUz99HM4CDDXnuzm2uOAH0xbKTU
         OSX+jFgGm/PMtrrd1zKHDEScAxdL86dGqF958+cKp3sNk3hM2vc7Q6MwHkFAx+zpMBfL
         MOJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpvI2nBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk6-20020a056214508600b0068cb7b24a38si11397586qvb.339.2024.02.23.09.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 09:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpvI2nBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdZ4F-0007mQ-Gl; Fri, 23 Feb 2024 12:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYrd-0000QW-VD
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:57:34 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYrO-0004LK-Mw
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:57:33 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56533e30887so756699a12.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708707429; x=1709312229; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xsDhYDGOw5CqhnAyZ1mUQnkbXRXKZJFQMDnbXbJP7ck=;
 b=cpvI2nBY9jmCV7SHejOX8n9n8JG+RlrFnju5+Ocv5oh6dHBE5+m6wdtqEnKd6sB2Uu
 ldfnTpp7hjcTsMjkTwLlz+2HN9W4y5IUUC+PxaeQgMxITKPlfmHGwKLZD0Wvz9iaNEWr
 EmNaEeCrEJZ0HJmRlrQSOQkbBn1gQ5aaKaZb0C/C0X/UR8Pds/tGQ7TzCHq5SWRvW6SD
 X/DrbP1WZF8ZBTUNAKI/TR+gRzs09TM3R4aABV5l5rRhZTxBZEunle1SjsIFzSzFJiin
 O0AtPr04adN7p4se0MhzL6pkuI8VsZQom6ihKs6+/73sXkWClPwapNpY0qTa/aPK6Ccg
 w3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708707429; x=1709312229;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xsDhYDGOw5CqhnAyZ1mUQnkbXRXKZJFQMDnbXbJP7ck=;
 b=qoYlGzHwcoNediqzvbyQ6ysxjEE0jj6bwi3dJrgtVM6OxLnGyNfHqaF2zwBxl/1keP
 +QIPmknO17LqYpQWuDFxALSRkw1bkgUp9CeBLyUCnKjDbkstse/ELzgw8p0mnk6vQ9HE
 y1n5Mq0grHyoLzPU8BwFZ2Gf8eU5H4tM7PlqkawMnaowXWCPJIUWQwEqjxSNkYew1XrC
 9DROSbP9W1NQ4Xwyg1MSZ4D5Sve45MrI0gxRznvjRdS+yTU0JpxtOHKI+By7M3GxyCFy
 8wDpnGXhHs1RxHWlTYCQdvTDsYkVsziy2/K3zGt+62v0cSSmY2XMRkah/o2tKLZe5Hxn
 bFAA==
X-Gm-Message-State: AOJu0Yzhkkf25MiSOng9qgqyZYSGC4oGG0JKZ0hYMBmdERk+zV1otWac
 /iFVLslLgbQ3mfTz8eDzeA6R05X37V/huA/WVcLhh62EJy58XrhuHLJ6pDCunIaWRVe9EZVfJdG
 QVM1jTT1NK18ZuNpnn0tTuAU6TuF+DwtzdLE0/Q==
X-Received: by 2002:aa7:d0d4:0:b0:565:665b:9c82 with SMTP id
 u20-20020aa7d0d4000000b00565665b9c82mr247097edo.8.1708707429234; Fri, 23 Feb
 2024 08:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-42-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-42-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:56:57 +0000
Message-ID: <CAFEAcA9Ly8PVajPtjuPiuBejwjTf34sgNArJjL+vxFUefwRmMA@mail.gmail.com>
Subject: Re: [PATCH v5 41/41] Add RPi4B to paspi.rst
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: g7u4fA4FM8+k

On Mon, 19 Feb 2024 at 01:23, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  docs/system/arm/raspi.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Still has the typo in the commit message subject.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp640188ejb;
        Mon, 19 Feb 2024 03:59:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUemG0Xsbl1O44gyc4N+nTaUmSxJJR0EwqvsTk4xb6sz4wYje2nmpOBrWsthK5BeYER6wRexhHplheUBI0kM+i4BKix2XVu
X-Google-Smtp-Source: AGHT+IGk23G/LV8M6b6LJ2zKO5Dn384O+n9Eoi9bRqO1GzO/LbrLo9qm32FaGUkVhSqBYGqyMfSe
X-Received: by 2002:a05:6808:23d4:b0:3c1:578a:9a17 with SMTP id bq20-20020a05680823d400b003c1578a9a17mr3906131oib.4.1708343989125;
        Mon, 19 Feb 2024 03:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708343989; cv=none;
        d=google.com; s=arc-20160816;
        b=p2lDBoDAsZa2+do9Q6fjc+8rSRpRk19i1svkrxm3bijLoSafvr1Lli2hJ8K2xcRmw3
         mo8mJ/M5v53feZ17g9izy4fsMMFqo5kfHfADyQ9sK5c4dLei9Src6jSs0IVqNIxTPbJn
         cI2JimMfnKpudUHwLrVY55lowsXKTb3kPi2KfdnEUuA9TnfXHet8zLIKwkuD4BnTefn8
         88gs7/qMrKhhZFATKTG7pN2XPc9v8fLKlFH3yjSxo3bmwLXzv7lV21y9JnKL+dN7FqiW
         4Ya4tHuBA3vM1TWh1efvvI1tPLsA0LysbA0SCTMdf5iUEklMnnvNW5EPNNjG8cdEn6hm
         I92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=n/Fk6y2y09w8y65NaOgWtW2+8pkTitKt0znH9ReCj7Q=;
        fh=byQIDlh+NLakNuK1fOLCtl65Pnc+M+xpz6lf/4BneC4=;
        b=GBbwejVd7CcxZ4BB9Km8Hk8ITByqsSYdT3Ga0jRXpS0uqpqa2YvU8aFZFI0LfyqPl4
         k3V/rn2XVIqoSvKXZO+6+m9jhXkla8cmgDEHRNiPNPEg7gJPyaYo/0oxANkw/pqlxlMS
         +MBkDfSiP4JOexMY52sH02ELLWiV+uB2QpvSIraJVh6/IHN4yVZiYmV9i5fxne6lpuGN
         yLKtVDXasDknyF6D50rjdAqHHqfgWTTw2jqLK3MYtOU5BLRwj6KKCQgsYyuJ3aIAM9dm
         cz+y6HWrrdRgJ4fo6mcInVqJa51U6hWuPfc4Gsn689OatijPydzSJl9DXJna9NSXJ2wO
         LLOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=F6teIfHu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05620a148700b007873abc7a7dsi5840421qkj.483.2024.02.19.03.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 03:59:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=F6teIfHu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rc2J0-0002dl-8x; Mon, 19 Feb 2024 06:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1rc2Iz-0002dO-8q; Mon, 19 Feb 2024 06:59:29 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1rc2Ix-0005P4-BT; Mon, 19 Feb 2024 06:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/Fk6y2y09w8y65NaOgWtW2+8pkTitKt0znH9ReCj7Q=; b=F6teIfHuqQRx30FlzQ8eu2n9km
 8OHmZfy7jOTS6y/PgfaINOD3x7N8f7hNXQHiIRTOr7/PnZDufSwsNibTgjxO+As/lvBtAB9NCoa6/
 vSVnOHTW0SVnE/Bj9iSA/hdwe1/8zaQqxuzK+HiBnPhdENKbS7JKwXE+XYx5P1eMgZvY=;
Date: Mon, 19 Feb 2024 12:59:11 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 04/21] hw/tricore/testboard: Use qdev_new() instead of
 QOM basic API
Message-ID: <xbyrix3d5l2tbroqoow7umnwiwxq5akfr5rltmbcfmwz6deu75@27r6aiyljgao>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216110313.17039-5-philmd@linaro.org>
X-IMT-Source: Extern
X-IMT-rspamd-score: -25
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2024.1.27.235115, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2024.1.26.602001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
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
X-TUID: 922KEInYDMCb

On Fri, Feb 16, 2024 at 12:02:55PM +0100, Philippe Mathieu-Daudé wrote:
> Prefer QDev API for QDev objects, avoid the underlying QOM layer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/tricore/tricore_testdevice.h | 3 ---
>  hw/tricore/tricore_testboard.c          | 4 +---
>  2 files changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

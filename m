Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp3967814dlb;
        Thu, 4 Jul 2024 20:33:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXOoPU5GBp9OO4Jfxj3uHuwlQygWdpM+jZ0aY+59W7he8W6cVKrkdVFmf5Imq5Ywaf0+6WBQ8hycPiVpJxR/O06KqS89XR
X-Google-Smtp-Source: AGHT+IGXzQloGSB/N/gQkZN+LfdelIh49jZcS6MQHttCjuESibKhThsuhJE32s8bDRkTCmYO696b
X-Received: by 2002:a05:622a:451:b0:447:c7e4:6b42 with SMTP id d75a77b69052e-447cbee2e10mr43632241cf.22.1720150398943;
        Thu, 04 Jul 2024 20:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720150398; cv=none;
        d=google.com; s=arc-20160816;
        b=KXWxyinNaNtRLKCF+CPFt8p/8oG3jCiILjoujKq3udr7TKeGW9PC5OYJvK9JIGDoVT
         IdejrnROmNcimlgy3xzkLH1zi8aVWmQxWjgXqm8AYQDSGOj+uZ8ZdTuKVsItXhyTReEr
         +V95t+GG0IxNlbIPN3pQ5Ub58WqJFhAc5W9UP0cboO5kJPPibC4cgnoxDHXsru5DRvyh
         N3j72jwVUR0CDAiZU19NZFBT5aTbOyqwi3qpT0UmaW+ses2TGI/U4Az3ArqKuW78iBI2
         iRC7EZ/Mx3zx8LZaz/g/wADR02XpOPIR0+MUydjf5F7B7ROp8tQ1bJXMc0bitjvcmTE3
         Mr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=rn2Yzaxu21Pytvb8nxB/BQME331CBEVyQ1+oolTZvXQ=;
        fh=XYd3nlz1imZB8xXeQHM+01qZJ8iudtgMnw6k7asy4OQ=;
        b=vieB45G6D2dY1ZZ7BxjqnBc32hMOqsyV5wFC2FKEBXZCdTZp8P+PkHLFv7EPq5hf/T
         tWrUgjhww/hROqk/KxIW+4d5sO97PC8QHuTobzijVbdZBZ+X0ZpU9w4aeDQDpB2x/cyj
         WOSCxCHfwoLzUy6hfSyjOd8WTaD+xALQixUfAQVYAAUKFxiGRe8O+53W33R13R2GoD3r
         JzlrCNKwnhTzrqJUwAXl2LxXzWCqSOzJy7IiulCS2FS+wp/1NmJnw/fjKi26F/5DDBir
         FoEI+a9Ue7YQuVQFhegwL1ozn10Ta8D68PzzZPN5wOcU247k2mDY7RBS245KDnXTDQ41
         b3nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=dCGit+Ra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4466dda217csi125548761cf.102.2024.07.04.20.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 20:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=dCGit+Ra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPZhC-0004dp-8G; Thu, 04 Jul 2024 23:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZhA-0004Yl-2e; Thu, 04 Jul 2024 23:33:12 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZh8-0003jy-7W; Thu, 04 Jul 2024 23:33:11 -0400
Received: from [192.168.68.112]
 (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.145.155])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 661992014E;
 Fri,  5 Jul 2024 11:33:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1720150387;
 bh=rn2Yzaxu21Pytvb8nxB/BQME331CBEVyQ1+oolTZvXQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=dCGit+Raa74S1yXN4+56h/nNGy59Fw3n4A4e/iMYVe5HIP7jN2DyVH1uc4xLmvm+4
 9aJnmcDDrBLtioMyruBkCxPjoICGb2Y/TcDw2Or5Z0NAIYszvS9E9cvPBPP5QR5qak
 wHySX8QSE9uUNW9Y4qFXHIKYi4XObPh2fhiroeA6KycIqke8A8AU/a9/OwOHK7vrkr
 HXpGmUSmJOc7WPjy/5ss9sHCsbv+x2WgF7upeNQ72Adwx9E4ngVtwlaEMtFPOvBFbA
 Vm/KFq5sswSjpmd9vw+6sKro9yHthNqeM7pa7CcqnEK83F3BSZiwIRGuU301pZgT2+
 AFKq6xRaS3mSw==
Message-ID: <d33ddb1a32b0987193f60f82577d541cf81c1c3b.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/8] aspeed: Load eMMC first boot area as a boot rom
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Fri, 05 Jul 2024 13:03:05 +0930
In-Reply-To: <20240704053651.1100732-3-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-3-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: 7z6mgP+SzjjW

On Thu, 2024-07-04 at 07:36 +0200, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> The first boot area partition (64K) of the eMMC device should contain
> an initial boot loader (u-boot SPL). Load it as a ROM only if an eMMC
> device is available to boot from but no flash device is.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


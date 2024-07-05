Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp973402njb;
        Thu, 4 Jul 2024 20:45:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVxs/xdAEYM+YWvKZL4ZBWXk8H+ZhanjlrK00THheWESJ6jglHDF8XBbtPYa6VzOqgKJ6H3+pUNj9SfJ5SkPTFzpn84Up0
X-Google-Smtp-Source: AGHT+IFXTzCQ9LLN1ZODH8V5n7euZZtqc0S/3KX2iuNvmj4TeL0/gtpFHtG2ZDxedv9iWxWFC9sq
X-Received: by 2002:a05:620a:1707:b0:79d:4608:f4db with SMTP id af79cd13be357-79eee1ac17amr433161785a.40.1720151130113;
        Thu, 04 Jul 2024 20:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720151130; cv=none;
        d=google.com; s=arc-20160816;
        b=zWKg0OEksPlumcKejUSOKj1oU9na7lXarJKGokzMI35UbIIleLKe/1TXdOrFGbphfb
         XKWP9sT1mgC6ALhUfvj7xId3R7usIv+eXpFP6/zhD3NbtV5D9ciITPple0U8iOO8m1Kz
         0gBZP1RRkNzM2Coe+c3tq+DzwviEePA3tX0nu4y0VyKvY6/i1do7CsrKxOs9VzvPRvGM
         O9ahieCl4w+Q8mU7xDp7l9lM89dYRKHAu4OEvb84nFFwyQaNj3Mh34Radl4r/0TwgUS6
         cXgniqqHT8Sj9G85qLn16fxk+bbpDMMBBPXM7LwBBix2drgINXKBZVsDTnd66jJYJv2D
         bzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=QzQOpJmrRW+bYjgk5GUYIdI7oypAD6beAHn4u6lRFWA=;
        fh=XYd3nlz1imZB8xXeQHM+01qZJ8iudtgMnw6k7asy4OQ=;
        b=HZdcSA9YEYaah2YSa7aaVKPfiUxlagjXlSfRDDkY9FCNyJfK5JyIceFQNwxhxUkTXA
         86iCjC4u/5Z7OtsjUnsBMRiDFh5+zZugmFpot7AlOAsHuDztck1drVDQa21riYA+R8wz
         qSJOenJ0/CXGEa9SuDN4CEVuNCUu1DjR1zB+tLMHU/ZbmlL6hy7yz0aC8F6eMSAwoaqe
         Iekcwr2w0F0UUIIV25gkeBJbfdnBp9CcqLwWwIW4JfQSD0xbwtzrH1NbS+fjFp0tuaMl
         TQN9b0Jqhd1mgdG8V17IT0sAiRiwCgnQmkUDPYKwjPpUN6GlLHjHQIfbnSmKeMORj+Al
         Tbiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=lt0UdEU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d8db25eb1si964959385a.549.2024.07.04.20.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 20:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=lt0UdEU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPZsw-0001YI-4E; Thu, 04 Jul 2024 23:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZst-0001Xo-90; Thu, 04 Jul 2024 23:45:19 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZsr-0005S6-Mu; Thu, 04 Jul 2024 23:45:19 -0400
Received: from [192.168.68.112]
 (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.145.155])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F06EB20127;
 Fri,  5 Jul 2024 11:45:12 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1720151113;
 bh=QzQOpJmrRW+bYjgk5GUYIdI7oypAD6beAHn4u6lRFWA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=lt0UdEU8sZU/Rp0s5VEgMtg8/xw6ZHnyh3F6tkr94CfBzUkKB4etihJ9owpWv+z1L
 IANFC7vS1M8xjortLF3ZziGWeHAdj+rvfI/BLCTCcOm/PRGcIwfFp9nmKhz1XQK7hf
 cjKXedI7oZMP8GoRPwehN3HyXeP9edC4t85Z+DEatfoSatSZoJtYwkRKKXRupGq6dP
 VmtHCPr4PaJ/YImc7UKzK+qMxAhe90I/AXlyfRCuttlGED1hEaM7VMwSHjc5oNTHyU
 D5znMfWF5mpcTcHFDY1AYWAzIFii/Hof2V0eVSL6vCX9vTanWFWBMdKiMIFEwIDTTD
 NYiJCSMs0fUhw==
Message-ID: <e2ac439d3ac356b0fd83f08fb554b8663ac5eb89.camel@codeconstruct.com.au>
Subject: Re: [PATCH 7/8] aspeed: Introduce a 'hw_strap1' machine attribute
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Fri, 05 Jul 2024 13:15:12 +0930
In-Reply-To: <20240704053651.1100732-8-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-8-clg@redhat.com>
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
X-TUID: VewYYXcVlFkG

On Thu, 2024-07-04 at 07:36 +0200, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> To change default behavior of a machine and boot from eMMC, future
> changes will add a machine option to let the user configure the
> boot-from-eMMC HW strapping bit. Add a new machine attribute first.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

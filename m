Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp386424ejm;
        Thu, 21 Sep 2023 00:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEAGv3Wl+/PBZuJohecgcDi9175YsXlWOO+WBTyTnXqT57JDUcQh2/yRZQj2QRyt4mwamS
X-Received: by 2002:a05:620a:172c:b0:76f:24d2:e232 with SMTP id az44-20020a05620a172c00b0076f24d2e232mr5710442qkb.47.1695280241141;
        Thu, 21 Sep 2023 00:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695280241; cv=none;
        d=google.com; s=arc-20160816;
        b=BORrdlknT3tSY1eXJrFQPF+m2pfXTh2N+rdchGo2iyVwgE5SqGQK0w6RaA8iBA3n/c
         Py76PPD8n/dO4CClN4V8iFuo45o7VIDJ7tMLqts6iiD73bj8YG63TkDdH5suYBYGUkFB
         MOWRpM9US7fGm/K4akgxM2/7gQKeahl6BCF/OYUgnZ328Fqe61F1wim7joPFUMxVZ1Hi
         T9YmtCOXWUwg6UADbXUTX4mqs7GXT9/MzjrOrEJf9wbCGi6SU889q8RGHqGTwRJoD8i0
         MpbNq0nJfWAT5Kp5Jqax+iV/p6hI41uDKfaqmMDUg/Qwadq7L1B4+c9ut+Mq/Tba4B7X
         imEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=zNhPAkS3+ZKQtWljj/FcdgEAeiV9fyUjTcloCkaC4Ws=;
        fh=AeEbYRKZYO9kPF6/mmeffzKtIm7KU3WDJTeXu4lZmDA=;
        b=t+GAHWlo3q/Bc/sQicCFzaD21vNEybyEI+cERp9cCSV2HIzUVrkxauTsqlwKQDYb/C
         z5htOLkn31cgVp0+q1Jxpu2PEKLzFui3ejDfsLTxu1sCjS02F2P0kLRz4uuIcMpruPeN
         JGlUhv6JatdC3MCnK18ptrt3rVAioB1ZR/LER4cocqQBjyjxcMrc5Vc1Iw630UCgkDf4
         3a1mhRqkkNqHoJPNdrsFzgCboCUIXfLy9o6KhbZeAZX4Ce0mrK9Po31wWxCiqZgm6yCn
         7svlVqPb5xpNJfRepn3uA/4VWKTOTrapwnEFDj15AOnqf/S1q3ktz25zYIqwV4UN9fNV
         gUMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=RJAOPtLA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05620a240900b00770ffaa4769si561672qkn.299.2023.09.21.00.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Sep 2023 00:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=RJAOPtLA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qjDpZ-0002on-5A; Thu, 21 Sep 2023 03:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qjDpM-0002mM-Ri; Thu, 21 Sep 2023 03:10:20 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qjDpI-0000y7-DL; Thu, 21 Sep 2023 03:10:18 -0400
Received: from [192.168.68.112]
 (ppp14-2-88-115.adl-apt-pir-bras31.tpg.internode.on.net [14.2.88.115])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CD4F620034;
 Thu, 21 Sep 2023 15:10:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1695280212;
 bh=zNhPAkS3+ZKQtWljj/FcdgEAeiV9fyUjTcloCkaC4Ws=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=RJAOPtLAS+eLMEjfqrByDU9BExM1OB22GC0g8nARIawVZL2Ev2drbOHwglsXFjfKn
 cG1v+aEZwUaF/bSZuazz1Xz/7X6qkOV1SnhKA8DNXXEpEYL88CZ3KkbxKnZpfZnXIr
 jiYdpegYB6GrVpRnmwzQpZI9veVDb4isBpTBapl6LoceoQLw7DXgox6FT2H2iTp+c3
 9lg5V4IVl6cUfP0sZ1mLN3V9bFjABtRcykUROj8FZdaZCjhTvsI4ncIfjqlJ0joB9a
 NtDWrSEJkxx7RniKes+lxTfIm4wosFrbFOiDcMc7LwMd6SsLJv8laSLyyIuzps8MWP
 I3PJOEOB2Qq+Q==
Message-ID: <f4d33159a0b002624571b6a6ce81e08df772eada.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/3] hw/i2c: add mctp core
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>, Corey Minyard <cminyard@mvista.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,  Keith Busch
 <kbusch@kernel.org>
Cc: Lior Weintraub <liorw@pliops.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>,  Matt Johnston <matt@codeconstruct.com.au>,
 Peter Delevoryas <peter@pjd.dev>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Date: Thu, 21 Sep 2023 16:40:11 +0930
In-Reply-To: <20230914-nmi-i2c-v6-2-11bbb4f74d18@samsung.com>
References: <20230914-nmi-i2c-v6-0-11bbb4f74d18@samsung.com>
 <20230914-nmi-i2c-v6-2-11bbb4f74d18@samsung.com>
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
X-TUID: bLkJgoG+MSkR

On Thu, 2023-09-14 at 11:53 +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Add an abstract MCTP over I2C endpoint model. This implements MCTP
> control message handling as well as handling the actual I2C transport
> (packetization).
>=20
> Devices are intended to derive from this and implement the class
> methods.
>=20
> Parts of this implementation is inspired by code[1] previously posted by
> Jonathan Cameron.
>=20
> Squashed a fix[2] from Matt Johnston.
>=20
>   [1]: https://lore.kernel.org/qemu-devel/20220520170128.4436-1-Jonathan.=
Cameron@huawei.com/
>   [2]: https://lore.kernel.org/qemu-devel/20221121080445.GA29062@codecons=
truct.com.au/
>=20
> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Nice!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

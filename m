Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2699912njb;
        Mon, 21 Oct 2024 16:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTUrzYyys7mS4oDV2eRDjqLogrPdfcJCCj75ln1DE9tWM8rmeJu2G8ivASCOIXDf6N28anXbYpzyG0gw==@linaro.org
X-Google-Smtp-Source: AGHT+IGeS9OhB7oL0ft7NMe+DKV/V1YH9rlZYSdQFbPJEzKH96SiGj6cDNMVBPZswe6ttGm/IiLq
X-Received: by 2002:a05:6214:1385:b0:6cd:ef75:f5a6 with SMTP id 6a1803df08f44-6cdef75f5f6mr106323896d6.53.1729553693257;
        Mon, 21 Oct 2024 16:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729553693; cv=none;
        d=google.com; s=arc-20240605;
        b=ZOAeCuWlI0knToDv5MsKMcTLabpowBo/L2ZTywoDsrintUAHu8Uws2lqoWwS7SiYbK
         TKJ8C6JTBoH9BjemS1rBu5DK6VIH0Lh2H8S2cIlIGCr5FJFBUpwObILfsN+BD001Ty6+
         fCSd+tfAq1kd4l3sYqAQKHWweAmh+xGGvLyCh2/f78u8wL6dRovRKv6s02gwUa+0V6Ck
         rzS9/EL6wjWFvA4w4TPR9UbfxusR9hor3xt439jnTAUeLctP4qdNTmZ/0Zd4gpzL+mlH
         uMdCb8BHGYhooJv4cyF9ZCVTmoZri/ch4cGuUXJ0dC+eBLV3zpVX8PtBsNVMPYRloO1m
         +2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=d5JG5wsjW6g0mdPZ4zU9j4RNCbMgtN5vhJXF39unCJY=;
        fh=lTWrlTNJ41uQSa141aPKpH+JtZDf8UAVGofvC4DJwVs=;
        b=fzjLze2I7kk27eEEGfpDGWo2O+5bLHEAWxSNA1wWTbfoT+Kkq/YOHvKlF8WngV85zf
         SZLt754Do1MrdB7YEejrsvJJxFEs0aWA/1XXBf2g+jROVeN/5R1ibfHG4ZUCu+bs5Xji
         jJFvtQUIsEbAl68tYqgse+5SIMAQ5c5xhBADIKiEbjz+MBixnHy9ZdEwX1BqOccBB1AC
         xrqi18GABfje9Jvqy6aKjKwqYuJcVysGBmW+AHlgNILP4MNyX5afiK13mklp1AvD0rRr
         +jTli6EOtXg4tsQHe7itSaTjEc82tpH9H0otERRxUUoVKfnElORmoC5dqjnMhzVlg9n9
         K4mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=dJFw6+bb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0098c23csi52754266d6.202.2024.10.21.16.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 16:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=dJFw6+bb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t31ux-0003uX-S5; Mon, 21 Oct 2024 19:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1t31uv-0003th-2b; Mon, 21 Oct 2024 19:34:29 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1t31ut-0001IK-0m; Mon, 21 Oct 2024 19:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1729553655;
 bh=d5JG5wsjW6g0mdPZ4zU9j4RNCbMgtN5vhJXF39unCJY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=dJFw6+bbE8K2hVjPq0+GMFMViwTaxI8L6NmHSCR4jkZCmshsZM0oUGEkFYxnUlo8I
 gu4ioocE0FN56C75emwEE92WA8HsMyVLB93vwzOpuPFXcD8cw+A0IAESg5lln/PW/l
 5ZdBkcxshypDuA8yW7DD9fYa4M89k+vDyn7snrkkQHtB6SpTV3wmx9lYh6mce7HGqI
 +j5C7ruJThqcxZq7im1nsgRG6hdjsqrN4iYALqIguf7QiFu8cupNmXXLbGd3ayzTzB
 sdy4pVCJqNvO2l6fxk0W79DrWZ6T4rJk9FI+yfLfXo1LpWG5ENoCgz+GySA9bRTIZg
 In6kjSCjM5G9w==
Received: from [192.168.68.112]
 (ppp118-210-184-223.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.184.223])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0F7D2649D3;
 Tue, 22 Oct 2024 07:34:12 +0800 (AWST)
Message-ID: <df7845ea9bb3b4841ba18dbeb10e9b109a28af51.camel@codeconstruct.com.au>
Subject: Re: [SPAM] [PATCH v1 11/16] test/qtest/aspeed_smc-test: Support to
 test all flash models
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel
 Stanley <joel@jms.id.au>,  Alistair Francis <alistair@alistair23.me>, Kevin
 Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Tue, 22 Oct 2024 10:04:11 +1030
In-Reply-To: <777c3650-5e02-4ab0-a900-ecb0e425b935@kaod.org>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
 <20241018053112.1886173-12-jamin_lin@aspeedtech.com>
 <777c3650-5e02-4ab0-a900-ecb0e425b935@kaod.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EmpMQA68rT5B

On Mon, 2024-10-21 at 14:39 +0200, C=C3=A9dric Le Goater wrote:
> On 10/18/24 07:31, Jamin Lin wrote:
> > Currently, these test cases used the hardcode offset 0x1400000 (0x14000=
 * 256)
> > which was beyond the 16MB flash size for flash page read/write command =
testing.
> > However, the default fmc flash model of ast1030-a1 EVB is "w25q80bl" wh=
ose size
> > is 1MB. To test all flash models, introduces a new page_addr member in =
TestData
> > structure, so users can set the offset for flash parge read/write comma=
nd
> > testing.
>=20
> The commit title and description are confusing. By "all flash" models,
> do you mean "all Aspeed SoC" models ?

I think it only relates to the SoCs insofar as the AST1030 embeds some
flash in the SoC? Otherwise it's dependent on the flash model
associated with the board?

>=20
> Since the change is introducing a 'page_addr' data field. I think
> this should be the title.

I agree that including something about page_addr in the title would be
an improvement.

Andrew

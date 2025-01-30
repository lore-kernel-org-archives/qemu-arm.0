Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp72821njl;
        Wed, 29 Jan 2025 20:31:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcUkvifsakyp0zqTaMIcnpfIfaAO7fIjwHHnH65llTspS+yzL2ilAYyyczLhyn3NM7U7LbsSIX3cAeZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEQd1ix7Qgo/Ga34ULH4jx+Dbd8yzmsRynVxV/oRcwZzInGqJSzyi6LjoAI7ZJjuXgITTXq
X-Received: by 2002:a05:6214:27c5:b0:6d8:812e:1fd0 with SMTP id 6a1803df08f44-6e243bb85dbmr87554476d6.15.1738211492265;
        Wed, 29 Jan 2025 20:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738211492; cv=none;
        d=google.com; s=arc-20240605;
        b=jBndDtp6gOZGYkQ1KdazcuuIjKBX0PjmVWzfEPahSZIikoFSr90k8cEflUmk15ZR+9
         a3kklAYPTrSPQy8cZh59yilvJEQFN0APtMwwUrMpxmBwes56zG8iJcgZeoV+CAPNBiYE
         onTZD5boJnLdG2gUFquP1WZp+lqbSSfNGgeMdr+IfrTW1zGvBZ5QHXUbt2uYJ3xvoTzW
         keA1nX8SG49LqTcBBArbpaGy8KXJp1t40ZE7N8D40rIMwpskQ+EPpYKdzUVmCx6C0uz4
         X1iAG++QOIm12ZcJLZcMNz3mJdLTDOPnbClLy6RIn0p/75lwwE5ilbATTCd+8b1hisz/
         NjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=3vI+VlhZYbMJPmUFLHeG56Kv1kAthBUlu02w6Dw8Tz8=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=k4LFesbbdljaFBnlsZEZK3O6J7LwvPfS1GrQ0ZP6xT3A9ESEBIcrKtjFQaOFdeR5aY
         mUmUDB/T83qT4UL1EmGK4MDV7mGJlNxDeYjWoMOveYKIKabEyfYCSvubTa7DgUpKB/Dn
         OpQ4tcF5JM5gegRQag8CiLPp/sGXg4kDuBwpMAdTysXl1JCoLVvDF2R4XeQp7vQEQX7P
         GmR1T4pVICfaT5SIPdE1jUdMvWKupKSY0gV0X71PaHsnSj4xRd0WrknWtJ3h7AwpjrN7
         47pQo24cWGDSppW45+V7AXzoL36OtULT6/dXBwvJrxs9ENoxay8Jlithcxzt7mUVZGLI
         UdkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=QCO2sCjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e254839dbbsi6750876d6.156.2025.01.29.20.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 20:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=QCO2sCjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdMCt-0007iT-O7; Wed, 29 Jan 2025 23:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdMCq-0007i1-Qf; Wed, 29 Jan 2025 23:31:08 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdMCn-00070x-IE; Wed, 29 Jan 2025 23:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738211460;
 bh=3vI+VlhZYbMJPmUFLHeG56Kv1kAthBUlu02w6Dw8Tz8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=QCO2sCjUMaZAgUv5YeyjcVOHYuOWqRsqA7SH6IEOxqGEuGv7kycWyFgfxS7gcWnzh
 HlxVY2Zhf2MI7/ekht+yFKu6rl+5NNadxlLFL/68dZtfR7PntA7+6vJ9lVANUtuP/W
 9r96zFnkyo3jXuqtargsWq8BsKXD5E9q1uxwgEQXLZvYMOLdlHsmODVryzAcPLQuUN
 cYzRdkv+z6nvpJ9HkVhrFWeW8EJnurD4kRySeQjh0ST6QkG9uW+NFay1KZqQSGDq1T
 LqW8zMsCbou9+vnixO8mh2irtP+dm3iOMQgXBVG3Yg5sZht5It6uZl9f24MvpXlGdc
 zOGIj3xBVv/mw==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 342BB7383B;
 Thu, 30 Jan 2025 12:30:59 +0800 (AWST)
Message-ID: <d9fc0a6b9db0c9d7b80c3a15138941d868a53a6b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 16/18] hw/misc/aspeed_hace: Add AST2700 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 15:00:58 +1030
In-Reply-To: <20250121070424.2465942-17-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-17-jamin_lin@aspeedtech.com>
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: BXHucA6Wtt/y

On Tue, 2025-01-21 at 15:04 +0800, Jamin Lin wrote:
> Introduce a new ast2700 class to support AST2700.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp612744njj;
        Tue, 29 Oct 2024 16:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUn+ndE+DVETr4ny5uRhFiuRQ2/L6DA0KP/60Rdr+PP4aLNFnwGlmoCWJLpB6Wk4Ud1SzMlPGnNIn0/SQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFn/0WY1QCS6QFHWCOYfqBm8Qw25uIuzWq8wWQ2XzLIYM7Q4BpD5vdBn4bDDxU2bwkUmesW
X-Received: by 2002:a05:6214:5d12:b0:6cb:ef36:5fbe with SMTP id 6a1803df08f44-6d2d91a52demr72297636d6.3.1730245442144;
        Tue, 29 Oct 2024 16:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730245442; cv=none;
        d=google.com; s=arc-20240605;
        b=atWCwTUaQo/FqefvU6sgZtpUBcQgWTTftufhqJOrqKz/Ljs/wWhWadLDp82If7gM9S
         rE5hPirMH6RZFfN4yyjDQuS2MAIS3xULJRFu8STgwvwjsP4zpB2oWeZY+kikkcdiBfAt
         /8y4bvrmUbRGzzZDkw93zgYGzSKrRfPEzWlXnhriCvg1Cvx46KuVivoS7SZh1ODaJM92
         YyYZPRSLQCcJKi4BGumX9oHYP4Uw3B01CXuW3VNbE9evzZ2BcKnxre88MDqpOVi/UtK2
         DnXHqmDTztolk5EcJfClL/BFYEyqMTTcTPYTE8a2kIwkSMDB6gpg9qJlzAcbthrNPSbm
         nD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=Xso3sElEGkFiueOKiSwOZboNeXIBDkpOIXEJKbLNR4o=;
        fh=y4EeVZETOsLS6IHxSda6Pskw5F9JjTwTea6toaMC6Ag=;
        b=jAxC9IVDWTUJUDlGnVCm4e4ArisaDmV+yxBJtnnAjZ+Na3HAsAdbiA7OOM2V33/0fj
         3KwyVaasvQYDNEmCEGnsL7N//4OWIX0kw7bKEoCpWq2tf0Vv+RTwVDfmIKY2TTQHqwfd
         kclOUrGnhxJnBgKMcGNFIKTu7WlH41fWGY/X4JjPK1uWWJc+9jzGIsNXVJVxcX10YNfz
         SdnkFZepejzlyJop86Z1u+EgUkW9bVCNF+ReQYn/RnjwJF1sW3dgyLzMvYnwN0/abF6O
         QcgbzOsPrvsoqCmQwb/rWIN73j+yPb3M9H4dsQUQXIzzDhjdQub+UY793QfHTjfwA9kD
         tBDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=AN0iIpU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a10a23si125642646d6.204.2024.10.29.16.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 16:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=AN0iIpU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5vsF-00009r-2c; Tue, 29 Oct 2024 19:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1t5vsC-00009N-O7; Tue, 29 Oct 2024 19:43:40 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1t5vs9-0006RL-Fx; Tue, 29 Oct 2024 19:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1730245408;
 bh=Xso3sElEGkFiueOKiSwOZboNeXIBDkpOIXEJKbLNR4o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=AN0iIpU7fiFeK7dqdcHJXRydv4jUQ7gV/vrqV2ey1ssSJ5S7x2b76/mrh3gCE0aDv
 +elGr+Or38vqxW3Eipt1oma9+kJj2Zn4ZXbKz0Gnw/0ZQj5qZXBqM3y7EHrBMtvI/A
 t032z4jo/vpUTvor/oHQjgu/yOPx7JCemhpidKasA3Mw0ok7Ew36GdwavAsVbKqW/i
 bM+7G7P8O19WOqpL2X5D2B04fkzLDjUqh5FgTyon4W6QYFkrY8ICtuk5nc7bTHqv+7
 PEC8kG8Ynlw0JoHF19nGqFZtP4ni5smkie4sie46T1H/rSDXtmjNBx4ugAJ06WRJ4X
 KNvUpJzPI04Kg==
Received: from [192.168.68.112]
 (ppp118-210-190-243.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.190.243])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9AE8F67E6D;
 Wed, 30 Oct 2024 07:43:25 +0800 (AWST)
Message-ID: <7e1b21bf2f0c0654e63cd4b3c39f39162a3e3485.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/8] hw/timer/aspeed: Fix interrupt status does not
 be cleared for AST2600
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>,  Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)"
 <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Wed, 30 Oct 2024 10:13:25 +1030
In-Reply-To: <20241029091729.3317512-4-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
 <20241029091729.3317512-4-jamin_lin@aspeedtech.com>
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
X-TUID: PfxIn8mLJvuy

On Tue, 2024-10-29 at 17:17 +0800, Jamin Lin wrote:
> According to the datasheet of AST2600 description, interrupt status
> set by HW
> and clear to "0" by software writing "1" on the specific bit.
>=20
> Therefore, if firmware set the specific bit "1" in the interrupt
> status
> register(0x34), the specific bit of "s->irq_sts" should be cleared 0.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Hah, the datasheet table for the register uses `RW` to describe the
bits and not `W1C`, but there's a foot-note in the table that says
they're W1C bits.

Fixes: fadefada4d07 ("aspeed/timer: Add support for IRQ status register on =
the AST2600")
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks,

Andrew

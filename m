Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp3967158dlb;
        Thu, 4 Jul 2024 20:31:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdgcblq98HW/kKtj4+zoII9zTjshOJE2bDuCGQJ4TRas1gZquYOPUmo8SABAoiiQq2yvjCcJx/Lo7qlTOdG9t3WzmU7hGC
X-Google-Smtp-Source: AGHT+IHJzt/lzaJOQSj6gV0lt0m4dIF4AfqoKSG09SKr09Fzrd57M4JQ7yYNzk1kq5d5zFNnD0b1
X-Received: by 2002:a81:ae18:0:b0:64a:e220:bfbc with SMTP id 00721157ae682-652d7095ec5mr35663807b3.4.1720150291670;
        Thu, 04 Jul 2024 20:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720150291; cv=none;
        d=google.com; s=arc-20160816;
        b=I6+IBQn6RMB8UfbRPidaLaAGWzTLiAg7lfLxxm/ldxndnXcMRcRbYDQMmPrCLhoQnR
         fn6Y77XoLys/+tRExpFlqpCHQ089/RX7zJcxtbluKncNNM5VkSCXuG+FSG6dq4IbtG0j
         DcaOcrh0Mm48LbvhYpXzT83YwQqOktlJNRqob419kwesBWKwfRMwzThBbhKJnCq1HWX9
         rWpAIullOFFKP7KqtYLaO2bqgHcLSddLD9WlVpBPyYP2WqqxjwgT4mMTJ6WC7/gEFjAQ
         qBxlOo/el1f6TvloCKLnV8sxasUejdEwzWLw/QgxkA/GbT2vJKn/7zU36gPbo77dKSmk
         Zw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=6PwNK3OI2HkUU9dXP3ZtkQsGk+9b1NekUDGDXB2jedU=;
        fh=XYd3nlz1imZB8xXeQHM+01qZJ8iudtgMnw6k7asy4OQ=;
        b=IcNrHqR2y9aijFU+vwSGO//eT6uqpazS09WT/hl57v8TGAogkW4WoJltUkcZwH2NMA
         LyCIgvWumDTjgtQiyil79AF0AfhmoontQDoPPAEXtBvtvcBj/SGp9h4s2C48y9flFnBv
         l/7WnsYVkYtrkHjn6ifi45U7eWQP67KXb2GrAuaZoAO4O5/nAtMxKkxO+o97U9u/H+9Z
         32+aJ5ARAxGkdC6yLatoNGrwIAEArqALsMuyqSWu/EzcevXNjWorKuQwBlgDpHykLztj
         WXlnl2LTxWoc2LwNlCYM2lTTLImuYIswozE9LU5XpJJm9WB4zzslyO+BNcamLouOVtHX
         jNsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=CHqHkv4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69287689si1565613785a.158.2024.07.04.20.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 20:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=CHqHkv4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPZfC-0006yS-E3; Thu, 04 Jul 2024 23:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZfA-0006pU-Cx; Thu, 04 Jul 2024 23:31:08 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZf3-0003S6-Hx; Thu, 04 Jul 2024 23:31:07 -0400
Received: from [192.168.68.112]
 (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.145.155])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A670B20127;
 Fri,  5 Jul 2024 11:30:45 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1720150248;
 bh=6PwNK3OI2HkUU9dXP3ZtkQsGk+9b1NekUDGDXB2jedU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=CHqHkv4lgNmDic4iGcOwSX5l4QR778aH5pcoluPaSk4V6ihLz9Ch7jH9Z7SrItLQu
 bHnQwd+XO6SbddNV9EYLHugpbWrXTkTvhE0nden1qoKwTDMWQJxCI61oKBFDO86Sy8
 FRgWbZDK8V6q7VsI5e8jGgWkAAyciK4KRIVH1IbPql5WnSAhv4ywML2nxrCYxLAi0e
 1IvJDTsSCW/5+7/neZdGcF+Wk59sS+42GHGV2oJ8lxwz2H0g/+BZsVyMMFEb4X3WXq
 KjO5zZAjZI/TIXjMmGYin7dx4dZ/gcV0GAmsC0bbM/jSWT6f42wymygTMiTPLOsT0F
 5h3wHg+bg20wg==
Message-ID: <81efa65ae28ef47d3cb3a1122dd64be175b2bedb.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/8] aspeed: Change type of eMMC device
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Fri, 05 Jul 2024 13:00:43 +0930
In-Reply-To: <20240704053651.1100732-2-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-2-clg@redhat.com>
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
X-TUID: 9fUbh0ls7QG6

On Thu, 2024-07-04 at 07:36 +0200, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> The QEMU device representing the eMMC device of machine is currently
> created with type SD_CARD. Change the type to EMMC now that it is
> available.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


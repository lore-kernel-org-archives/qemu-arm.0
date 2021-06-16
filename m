Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp794339lff;
        Wed, 16 Jun 2021 16:16:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcoE3Ue3P1y+Q027E0OQJ4LLLkLrMyW0+p5hpDtPR+EG4yEd5mrNkJqEAwtFnIRO+eNrPi
X-Received: by 2002:a67:f659:: with SMTP id u25mr2009796vso.9.1623885381955;
        Wed, 16 Jun 2021 16:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623885381; cv=none;
        d=google.com; s=arc-20160816;
        b=jew5tja07I0ixontsGVHe/Fgf5o2gRqPRnOq0pGfJB2RkEUJ2L3q4WsRAiarvpCMEa
         SV5xC0pMmNA4WvUiuFl2ZVUEZ4zVZiETHMxH6bNi/70cxkh4B74uhv/3TXEqqsWqAIDA
         S7yqZrPUndlzR+8YXM5TfjugyPtmAP9f5caQnoEWHRpbHajb2DNGG15wsutnQKAb7IK0
         ypaScR4BuKmno9kHCwRl/RE9ldNIQnaBXePUIDvp32irfqKtSapqllv8rlr/D79kvel2
         Ga3meVnt8PzA2h1w87biR5urgU27rcRLEKNkyBB176gks3Y1eAKbRTzIBCQiTZaxssBa
         QeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=y7ZNZ1dtRsxhK+zVc7IByL6mmNZW1rKZCOAQ4gvR8rw=;
        b=gmK0VVHX+sDr+Zy/0hzUkvZrsMJ4Y180CNgHLdOqAzYsyMI0QHqnsOaR6I4BRDQMZ+
         i4fl6RkMQPxItY3L0yJYeIg20REX6OdSKV5d9lDL1DtbVS8IMe+nuP0VH2RTdicYTgdX
         9CmuOCsSb45c8+FWfVNrNEhkx292CJNZut8ZSXqIstZQSFLajJhQn13/oNp7ihp1meap
         zmFwNc8gZW4I3F5cJ76FCZPi3d4w8lYGEkoIdEZuuYo3FGzw8g54BPsdTr35dNoc4zTS
         IM4SftM6rs457esqpdPvvPhfvxPZtUM4zD4OtCQyWogXQOhF34YFu96g8rL1HprJH8XT
         iYBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l64si2767447ual.99.2021.06.16.16.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 16:16:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltelh-0007fK-5b
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 19:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltelA-0007OR-Cl; Wed, 16 Jun 2021 19:15:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltel7-0006nr-DC; Wed, 16 Jun 2021 19:15:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E955774570E;
 Thu, 17 Jun 2021 01:15:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A99E974570B; Thu, 17 Jun 2021 01:15:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A7F957456B4;
 Thu, 17 Jun 2021 01:15:38 +0200 (CEST)
Date: Thu, 17 Jun 2021 01:15:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 03/15] hw/display/sm501: Simplify sm501_i2c_write()
 logic
In-Reply-To: <20210616214254.2647796-4-f4bug@amsat.org>
Message-ID: <8f39606a-eaab-aac-48d0-b9307aba496@eik.bme.hu>
References: <20210616214254.2647796-1-f4bug@amsat.org>
 <20210616214254.2647796-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-165660671-1623885338=:97089"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ecr/9LQjqp+6

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-165660671-1623885338=:97089
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 8789722ef27..f276276f7f1 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1036,8 +1036,9 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
>                 int res = i2c_start_transfer(s->i2c_bus,
>                                              s->i2c_addr >> 1,
>                                              s->i2c_addr & 1);
> -                s->i2c_status |= (res ? SM501_I2C_STATUS_ERROR : 0);
> -                if (!res) {
> +                if (res) {
> +                    s->i2c_status |= SM501_I2C_STATUS_ERROR;
> +                } else {
>                     int i;
>                     for (i = 0; i <= s->i2c_byte_count; i++) {
>                         res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
>
--3866299591-165660671-1623885338=:97089--

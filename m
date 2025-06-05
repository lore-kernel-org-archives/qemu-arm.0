Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp539283njc;
        Thu, 5 Jun 2025 14:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQbE1Jm+/SNccM8UT9hkdsv2NS3yBK/LZN3i0gRHvyn3NOsQ5XKgIQWXUIN/ATP0vXzKH9YiVzeOqeAw==@linaro.org
X-Google-Smtp-Source: AGHT+IFfaAUHGg7y0qzTY1JePX0qSoibo8fXylSd2lodvtxHQl4A+Y93Mau7YTM1Z8T25wTWqUax
X-Received: by 2002:a05:620a:460c:b0:7ce:bd8b:2d08 with SMTP id af79cd13be357-7d229862b2cmr165859585a.10.1749158617836;
        Thu, 05 Jun 2025 14:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749158617; cv=none;
        d=google.com; s=arc-20240605;
        b=ghTx1jrvcSCYtCTOz0jfkfiubN9YFLAsQGSFCGoQ3XIvsq/oumZn+fv7jvEOChSwx3
         dS3sLdIiRQFOlfVpbgwdbsh1ZA8Cd1eHj7eccqplIYZxoykguJ+bfKiOHueb8WaWp+8W
         kEvAkrrIKQdhV/BNjg1ThnIvjx7En8jnVQT9p0NstVTerthZd4JHfvYdRRJ2QB+1GjS3
         X6GKV5lEiHzBu/GDqaHYvXxhICE4aEfR3QZ3LK10o7+JJ3DZYwozmlCLvX7VB0ZMziGl
         mSoHLOFZ5dkBCbHsgL/c+lt5Sjhi0Ah9uOgbKwLnA9Z+lr7y04ejZja0Qxc/MC/KXN/I
         M6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=wcgHGbHMkjYvL+9I+rOf3iRHWmowD+CuLt82uOXjO7c=;
        fh=CW1z82Ak5HHDevDrc8K2dDGZtC8PL3QcQq7KEtRwC+s=;
        b=NXC7vhZjA6uPRBggybqdihOIZoS7wSN9wzsacdikegHZtY7LQERlOM0+toFf4Hwqc/
         lp4yCKjXPHL3InVReoCRB7QbeQ5a7IYRGMMXnt1aGl7K41LSngvGkGYhAwlVQ5dbMtkd
         9fTqGF5UJT1PYwWG82ICR9WmLx3pGyIhAqO/B0U/9/lpYIv4o6x8jd7ESkyybRdgvrxJ
         5BCwHgRkeNrus1q3bcWeQb4UbzKf8kk4BHRK8OLJVV7XoZCViXYAvXdQ7iKuCffl3kAa
         zvXlew+jsumRcUoJoPIIIb2C/bCZbC///9XEosT0egwsZReFRBqLJ/UdFHnofoJlPNNc
         1tBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3cba56si33270085a.82.2025.06.05.14.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 14:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNI3K-0008Bd-U9; Thu, 05 Jun 2025 17:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uNI3I-0008Aw-Tq; Thu, 05 Jun 2025 17:23:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uNI3H-0007t5-4f; Thu, 05 Jun 2025 17:23:08 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2669055C170;
 Thu, 05 Jun 2025 23:23:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id SZkuC1gWXOkB; Thu,  5 Jun 2025 23:23:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1187355BC02; Thu, 05 Jun 2025 23:23:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D84A745682;
 Thu, 05 Jun 2025 23:23:00 +0200 (CEST)
Date: Thu, 5 Jun 2025 23:23:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Glenn Miles <milesg@linux.ibm.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/4] backends/tpmL Avoid using g_alloca()
In-Reply-To: <20250605193540.59874-3-philmd@linaro.org>
Message-ID: <a4ed62b2-4bb3-a78d-c833-a58bedcc95aa@eik.bme.hu>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-266257179-1749158580=:78760"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: aj0zIGBonnUc

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-266257179-1749158580=:78760
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 5 Jun 2025, Philippe Mathieu-Daudé wrote:
> tpm_emulator_ctrlcmd() is not in hot path.
> Use the heap instead of the stack, removing
> the g_alloca() call.

Typo in subject L -> :

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> backends/tpm/tpm_emulator.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 43d350e895d..4a234ab2c0b 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -129,11 +129,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
>     CharBackend *dev = &tpm->ctrl_chr;
>     uint32_t cmd_no = cpu_to_be32(cmd);
>     ssize_t n = sizeof(uint32_t) + msg_len_in;
> -    uint8_t *buf = NULL;
>     ptm_res res;
>
>     WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
> -        buf = g_alloca(n);
> +        g_autofree uint8_t *buf = g_malloc(n);
> +
>         memcpy(buf, &cmd_no, sizeof(cmd_no));
>         memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
>
>
--3866299591-266257179-1749158580=:78760--

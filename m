Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68DAEC1430
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:32:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNz7-0000Uz-9X; Tue, 03 Mar 2026 06:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNyn-0000QQ-9u
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:32:11 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNyi-0008PT-PJ
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:31:54 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64c97997b0fso3764700d50.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537510; cv=none;
 d=google.com; s=arc-20240605;
 b=GsYX4RhEsimzwl4t0N5bYFy/ox+M8Zg1Py+XkaCdXFfJ1Zyni8ords38plS2PUbPtn
 8RX2tKXfkv9L/5wNvdVF9vfvdkPXWBQCjuHV42t8ztAiy0cIKhlYTjfnR5LGH2YW6PK1
 5M7Cl+h3YJgyKF66RAzMApVwmxzcny8oKR02nRu6j2dO1Eq8FxY1au/zFtlqLIfxe7/W
 154PBGAqYyR8znBK5H5OAa3Ec9lipiQq4PdUmwjQ5FLa9S3kpPzb6HzMbTu7t3T7PGSR
 5T1bwObkzSo/xIsPIdWm7EHMUA6L7U8uk52TI1pqW7dP/dnxsjLf7Ibhq2Bplr+UUns4
 pN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JHXfHR3rs04a5cc5C/jMgXKlfnt1eqHrGzpqZ7zi+vs=;
 fh=kXPEvzfUfB2AzRYKVomXlKCNLA/ev/Rr9T+ttvhQ/yE=;
 b=KIeOekcAHIWT1wN3AansKnQoFb+SPZml2AsGL1z4EHWKX3fqlEf+bR+YNDj608/FrZ
 NjXr5DcFpO6NoOHF4N5Kymb9fCjj2XyI6f1Y2n5tVTIrmI1Bt7+2gJ7YybMw0PzF0TAx
 f41JaWGY4NarOw49u01M6EavIWh3rnEpPxGp7hy/evw6eZaFBc/yEoYqm7PR2clVJGak
 onBU4eRtntqdT5inHfyWLGqsg/xjM1LkXRWrYu7XyDdMrBR4gtGBO2ML52p6gellHRTp
 upbvbxYyyGOgSL2Ap0KNXlDClCG592Sj7/DzTa7BmvM2AKFaZjAhpd6Mu3trddTScCBd
 RqPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537510; x=1773142310; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JHXfHR3rs04a5cc5C/jMgXKlfnt1eqHrGzpqZ7zi+vs=;
 b=iGUJ7xGzuPOP07Rr8LLPRt4a9cBhIvWlZqkOkKTN/8JWU4IlG19pkcZUA24p7MI7sK
 IHOBkUIu9ru2cE/u9XIntrcdkM0TLEjHOv5QXUN1DJ+OXdNFY1Ls9H10DRvF/f8DKx7A
 kikgko0R8KgEtQjVWqfLtiiHlx324ZbW4WjEpCvbuVyHq/fc9+smw4hk5XEHtPyFTXbV
 g84HRFqzo1jOgEtEoc3dVnsggnN7P1hG9higovSpBNbdlLbuxvbF/GgCwCbSKsfGpWl7
 TpPwPln9CXp8CnyeJ4jyOSMLPrE3RRSaNR2CvnEcFPIqExncXVoQ6gP8I/pVUJ93Aftq
 ULHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537510; x=1773142310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHXfHR3rs04a5cc5C/jMgXKlfnt1eqHrGzpqZ7zi+vs=;
 b=U0qWv+eu4ghxRMLnPS/lARy5TMJoEQhk4SVxv8vtWwLy2epYIQk8YLYyopPUQo1uub
 C+df5fOOGMwHCET6pe5Bjtnvz9gdgtN2jU9Q9eKa+djoSwKJEoFu9sYPi1b8brYXBdep
 Ci8zvIFsQmXE52EgU7h8PyrJOJdEqZr4yqNg1MFK2KIManf60x0gsmzk8qMAPa4yqj4b
 I6lvsIj1jDSMrCUo9IwexfrQwG5EaF1qb+G/GuhHtBA5aTkWnD0O3EiRrUfbfthOMQDQ
 2MVAluKgJeAVHox0mopLMq3TGpcCygnSiM9Zs3gJVRlMf6WPtUgU4h775+ZaMxF8bNjb
 vIMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9IrOcXUM3thoSpQfwGJ4MYudoBW0wvZvD1tG0SjMr0KiD5KJbh3WycUegflv1hC2c0pfioOhl+Q==@nongnu.org
X-Gm-Message-State: AOJu0YyW7vI0h2Q9wuCYsAtkcgsOZHqPd5QreYCUvhsGud5uKpM2Nwez
 up/u0R4lFZwBuMG/pprkna6dIuK9fHyJk9Z+VeM4dHCBfCyRy3kTFuYbyli52kfJ82/id+kKHHU
 6NvrcUDL9XgUBWNZIQMfsjab2tMKkly2q2EbzDBjMIA==
X-Gm-Gg: ATEYQzy2g43Uem3CKetoy+2bKTLMhNpeIaS5C2oPMni7XMqbzBfMs4g29OAGCxRu7uw
 hhSdR+9xWAcFvsDk2WUBvtA6VoEv37N7ejAdBgZhZidL/6p3N7qn4WkcmqsoZAC2NJ4cejNcCqL
 aSRTeVd7/SFHUriappTFbO1JjINFBnEuVl0ZJ4nSB4pceocyxrhj7WB01PlqhVApz9YhwXN1ETN
 cUwiymGswqc/P6EJQXwwKbLqM1gGTIsgdYKdOXd0g9JkFJ5HtIXcGvTiocRqviXvo4xj6+yPF1t
 GZZVh2s/Hkserc6TwPBAn0MMWY3NTuPQdhuStq14nuGRnuwAS10VRlx2Dp/McDOfpOM=
X-Received: by 2002:a05:690e:4488:b0:649:c308:90b8 with SMTP id
 956f58d0204a3-64cc2025934mr9848749d50.6.1772537509877; Tue, 03 Mar 2026
 03:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-8-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-8-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:31:38 +0000
X-Gm-Features: AaiRm50yQbep8sAM07nVs53xXKAgzKqgwavS-IHNVmMD1nNXzsQYvfYhSoWOjQ4
Message-ID: <CAFEAcA_g=GJ1MGLak7muj2fvGm++Q2qZoqEKtJGqORWkV0c6iw@mail.gmail.com>
Subject: Re: [PATCH 07/12] hw/char/serial: Remove redundant reset
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> There is no need to invoke the reset method in realize since the reset
> framework will do so anyway before the machine starts.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/serial.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 485b98f03f..0f3469a1e8 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -934,7 +934,6 @@ static void serial_realize(DeviceState *dev, Error **errp)
>                               serial_event, serial_be_change, s, NULL, true);
>      fifo8_create(&s->recv_fifo, UART_FIFO_LENGTH);
>      fifo8_create(&s->xmit_fifo, UART_FIFO_LENGTH);
> -    serial_reset(s);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It would be nice to make this not do qemu_register_reset(),
though right now because it's a direct subtype of TYPE_DEVICE
that would imply having all the devices that directly
instantiate TYPE_SERIAL arranging to reset it in their own
reset methods.

thanks
-- PMM


Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp656191lft;
        Wed, 29 Jun 2022 11:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMNpd/q2FwPw0dBl8DCxio7uHWBsvslpz///CfhufGjvvcDs5jPhT23NtFsg7P4v7w9lX8
X-Received: by 2002:ac8:5d49:0:b0:31d:270f:7fc5 with SMTP id g9-20020ac85d49000000b0031d270f7fc5mr2664432qtx.151.1656526060716;
        Wed, 29 Jun 2022 11:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656526060; cv=none;
        d=google.com; s=arc-20160816;
        b=kN1N7BWFdutf/m9ipd1v6nroAnuIQlP+yCIcjpMJG28sjkHgJFBerC/3k6xL4Me0RD
         V+9Uw5sf75X5lnAw9vKM2AvMajMfK9Mx4xAoR6d2cuAPWgzywJoX+ELheW/jfhJQjsfw
         BUoFERcwWTKggwQcXtlz9007RUgOvKOGg9PBCwdZTVVsFf6qS8dxm6dS8dtG2ffgZGox
         GsrPn+gqsz9gjknGbWWY84ft0s2PxobP22DnNmX7TKDGtsRAb6lfxnCDIQFyTv++oYl/
         i6Qg2jlMqL0ZFmmEyiK0nKhuH+qERADb9JQZPQHhBt5+pWTmeHPKO1dL2UwAeYPRwPKR
         yDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+R8M0154sNEv9TGtb4HMBK2bwYjnHt1Fh49zIt19pLI=;
        b=Lu04VsEmyFutSYsA04CUIGUxc1hVXdaq/eKlt2sbl1dobBnek5vBGQBIO9tjF+APAS
         ZJpZ+ynlmbcJ96/wVlu0GJ4GAmsMcV9UfGL039kCTjyzD0NQDxu3i4sBG0IoUMCHk6Og
         zjwr9zv8+GMSwagX0lnQcYK4P0AKJrY4Ixnt5QFwF8+SVuup8VkCz2/hIVm/+lQYpeNk
         lh+yTAyegy36w2GWiFvKgFaGC66irhAt2d8MnyY00CIKfHUbDL6ffTz6NF24SRgUUhWg
         FKjrqNE4zDUB/dVvUIvICfdugFfla9Flf5Fy+Ydwyxls9aUPGrksgfSq3h6e2OoGekMQ
         msIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TSnKvl6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05620a258f00b006a6d28f482esi11149094qko.738.2022.06.29.11.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 11:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TSnKvl6d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6c6F-0005hE-Uo
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 14:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6c40-00042y-LP
 for qemu-arm@nongnu.org; Wed, 29 Jun 2022 14:05:21 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6c3y-0003VA-SS
 for qemu-arm@nongnu.org; Wed, 29 Jun 2022 14:05:20 -0400
Received: by mail-ej1-x62e.google.com with SMTP id mf9so34264287ejb.0
 for <qemu-arm@nongnu.org>; Wed, 29 Jun 2022 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+R8M0154sNEv9TGtb4HMBK2bwYjnHt1Fh49zIt19pLI=;
 b=TSnKvl6dFsttkMt0Ui6Po/r2Jh+MZ0NBRapzz+gL2z+VKnnKdJf7cXwKqEvl2urvmD
 tITLgVWgdngd6sAISAemU7mYBnq6znhL8fI85YRClenuTYW4vilxHR5SOzUkh1UtbQ7n
 M3nWNhVvNQmbKpWs2EayCdMTvQ5FjVdZV/7HKejmmJFCo7DhZ2KZswH8TI97ywGXzrmx
 1IKzeNq9N5wye6arreO1TeuHnvwPLf4Sky949SaPdAzFBH9TwpiwSdjewuuNFMYvMldi
 X7XlUkl6sDwH3XJbVwhmqYMbccg87f7ZUP7f02qytW7FgLeP5WGrx+FPdMLcDerWFi4L
 lxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+R8M0154sNEv9TGtb4HMBK2bwYjnHt1Fh49zIt19pLI=;
 b=xW1xODdsoMclRDrhgqThQz8nmwp4C/gJypjxa6ulUqF8mQjgKdbpXaZDU0DdSxL35c
 LUeZaLBQhufUOwKHtAV0unI8uaoL6betQp+P5emjjASdHfvxdyufDw9svwcuNaXWctIF
 YEwNVhdp66I+/oXwNSmeAsegW98lYtsODEYOiuDhlMyoRRnhpUhsD0CFgBsz0tkYQpXd
 bdry3jB23bwQ9WyneE4iiCaQSpQMHHrrRHeOuWC8YnO1Dyr1JGstxcDi7prCblV0z6Gq
 OAHh/tLXSj8F4uAjoSyKFZgiezwI1n2xCwSNvVCUOFbCzUMnAr1++xiRVA5X+9p9F+xt
 OujA==
X-Gm-Message-State: AJIora8tRE3JC8d9fNHRPYDNTifZdRzIrf+mLWFBsh5w59jAcUGNYPr6
 SsBpqoNUmHg6kkXqAO4ZWxi4aqU2cDnheogGlvaUdA==
X-Received: by 2002:a17:906:830c:b0:726:a68b:d1bc with SMTP id
 j12-20020a170906830c00b00726a68bd1bcmr4671569ejx.305.1656525915962; Wed, 29
 Jun 2022 11:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-10-pdel@fb.com>
In-Reply-To: <20220629033634.3850922-10-pdel@fb.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 29 Jun 2022 11:04:39 -0700
Message-ID: <CAMvPwGqmU+bsDb1fHraiTzdg14An5QiKUazSweyzVvbwHeCM=g@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
To: Peter Delevoryas <peterdelevoryas@gmail.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=titusr@google.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YqQ1V9VTWCsx

On Tue, 28 Jun 2022 at 20:36, Peter Delevoryas
<peterdelevoryas@gmail.com> wrote:
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---

> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>
> +    case PMBUS_IC_DEVICE_ID:
> +        pmbus_send(pmdev, pmdev->pages[index].ic_device_id,
> +                   sizeof(pmdev->pages[index].ic_device_id));
> +        break;
> +

I don't think it's a good idea to add this here because this sends 16
bytes for all PMBus devices. I have at least one device that formats
IC_DEVICE_ID differently that I've not got permission to upstream.
The spec leaves the size and format up to the manufacturer, so this is
best done in isl_pmbus_vr.c in isl_pmbus_vr_read_byte().
Look at the adm1272_read_byte() which is more interesting than
isl_pmbus_vr one as an example.


>      case PMBUS_CLEAR_FAULTS:              /* Send Byte */
>      case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
>      case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index e11e028884..b12c46ab6d 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -218,6 +218,28 @@ static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
>      k->device_num_pages = pages;
>  }
>
> +static void isl69259_init(Object *obj)
> +{
> +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49};
> +    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> +    int i;
> +
> +    raa22xx_init(obj);
> +    for (i = 0; i < pmdev->num_pages; i++) {
> +        memcpy(pmdev->pages[i].ic_device_id, ic_device_id,
> +               sizeof(ic_device_id));
> +    }
> +}
> +

We tend to set default register values in exit_reset() calls. You can
do something like in raa228000_exit_reset()


> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 0f4d6b3fad..aed7809841 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -407,6 +407,7 @@ typedef struct PMBusPage {
>      uint16_t mfr_max_temp_1;           /* R/W word */
>      uint16_t mfr_max_temp_2;           /* R/W word */
>      uint16_t mfr_max_temp_3;           /* R/W word */
> +    uint8_t ic_device_id[16];          /* Read-Only block-read */

You wouldn't be able to do this here either, since the size could be
anything for other devices.

Thanks for the new device. It helps me see where to expand on PMBus.


Titus

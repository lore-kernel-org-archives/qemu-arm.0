Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp646997ejb;
        Fri, 31 Mar 2023 06:48:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350axEjb1g9YmoAGUhWrM6vzOt7u9XUSXZtiXDJxtDgxB0cCezgwRXw+iLvKO3MZWZO3lcC9D
X-Received: by 2002:ad4:5b83:0:b0:5a2:d726:b84c with SMTP id 3-20020ad45b83000000b005a2d726b84cmr41026149qvp.19.1680270508922;
        Fri, 31 Mar 2023 06:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680270508; cv=none;
        d=google.com; s=arc-20160816;
        b=JONzhZOH3RLg72ngNkBKDor5Ixl/CO6GeqzNXyRb4OnKkfflpONRHrQS7r43h80p6W
         zrYE1ubhUULoiose1Bhnzvbwqn5g5tQdVlh12/5mLKwUMJaxOZvGo+vDIoTzJG4iV0dE
         fK4OrJKJWh7TwIHsHhAs1Q46cC0rLsAuzc1UlTatssGp/vwfgINERJpBdsCj9bKAdw/V
         rzIGZQWta8+4o7WrDxTjyxXjTTf9dFgFTIKc0MvHXMSjpX8UZIPXAaDbvKsoQfD42oen
         glGsxf4qPi5VUe98iro1CTmUlYt4UcnYnjH05QmmPXoVNVBtcDG6/7pnbYZ21Rk3sUGc
         gsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=UtTcpFAr4uqZdwdUrNDcGWVrADZo3W2MkTPT5uPYlkQ=;
        b=RW+vjr0qZT8q/W4yJRxMbOGCf99IpQzbv+gLnbH8MFy32PQ4H+5VyzNhcsz6Jsz75S
         qctW8SAYLAclRKVq9pPAtpgU+/HHBk8fOuggj76qxgoTt0VNn/sh6H0ijBkUkWA9MUEq
         Ru0/F7hAJum1vm9webUdzmWeiyNqYdqFTU8iaFa8J+eyf/RkrVoBU1zAw7am8bUmpWrb
         qvz4SXOJXdCTz5N+buX0ajiySOZsoUNg0Pf0caKRdmgWE78yv6u4NkijJT5XJTdu9BoV
         lqxAXTUoXQeWFP9v/3PneCgNZ6gtb9SC55kKOEIh49kmSfi64OFe0lbtmXCdtnZzKGav
         C9kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="i/5y4fnM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq6-20020ad45fc6000000b0056eaf46c7e4si1473532qvb.196.2023.03.31.06.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 06:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="i/5y4fnM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piF6g-0004bD-Rj; Fri, 31 Mar 2023 09:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piF6f-0004ay-0x; Fri, 31 Mar 2023 09:47:53 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piF6d-0004aO-Fi; Fri, 31 Mar 2023 09:47:52 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5419d4c340aso415311537b3.11; 
 Fri, 31 Mar 2023 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680270470; x=1682862470;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UtTcpFAr4uqZdwdUrNDcGWVrADZo3W2MkTPT5uPYlkQ=;
 b=i/5y4fnM5ckVP4L94zADHtoDAtjysCIVERMIwJOG7zF0C4QWn4fF1CtHyXhXFGDmfy
 /JGrQYq18gOGQVu8E6oo5x/f5RHc9m6Z88OU9kXnKOuaCm6L1lBpxuu8Yeqfd8bXeL5e
 4sT7yMU5ypXPnGr8ujK8AFx8GhsGEP/W2S/UWu1vt8A70/oHR21G2OpREfd8aXzyu4ob
 YBKUzLRpGA3FP3Q3d8d/HdAHzoUpMXb36MM7em6mgkCCrbNZ48f0wA4n8H1NJzS7t6D1
 4Qg4sjSKlEUq7ps6UwHr961Sr80t75fv3srMSZy5EPWjfg7K+s1GXp0HXibeLh5UchBm
 6amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680270470; x=1682862470;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UtTcpFAr4uqZdwdUrNDcGWVrADZo3W2MkTPT5uPYlkQ=;
 b=A2YTKrAbcIozjqv5joc4fhCMjX1iOC2gU7jVdDxXt30hlQDsskANEYUKfnGpjt8Vur
 R1MWbPEyt1OmbSFzmoTQ4XslKLgCW036tOtN6mIxPQ7/2eAyNV38WwaEprsfAvt6GSVv
 ODW2yYRwMI240KWuBdAQOAyltt/2f7kueMYMzc+c/i+VwBclp4SrbP7ekJv7Pm9eNLMJ
 N7r0oBA0MsZUiifdbiqFS7j9MS9+Sj0xEnjsomlDkLDqKFIDoY5ld81ho8udNKB4Y+Uv
 m/Ht+hL9Mfv1ftv851NtdrwBKQu2Tk5KQcpnWk+BVZBJ/JTGsa+g+qgZUHPMSYL+UsLp
 /BvA==
X-Gm-Message-State: AAQBX9e6/LxTdTd8GMrHL+P8TMALU+TisUlpOUZlckSzHFjltV3XGpui
 BBJ1tI1k9fNtUufCVnRaFA==
X-Received: by 2002:a0d:cc50:0:b0:544:cbd3:76fb with SMTP id
 o77-20020a0dcc50000000b00544cbd376fbmr24653832ywd.27.1680270469837; 
 Fri, 31 Mar 2023 06:47:49 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 y135-20020a81a18d000000b00545a08184f0sm524582ywg.128.2023.03.31.06.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 06:47:49 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id 54DF91800BB;
 Fri, 31 Mar 2023 13:47:48 +0000 (UTC)
Date: Fri, 31 Mar 2023 08:47:43 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 1/7] hw/i2c: pmbus add support for block receive
Message-ID: <ZCbkf2Fx6nrMsFw+@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-2-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-2-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=tcminyard@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n9mDwbZZmQog

On Fri, Mar 31, 2023 at 12:07:50AM +0000, Titus Rwantare wrote:
> PMBus devices can send and receive variable length data using the
> block read and write format, with the first byte in the payload
> denoting the length.
> 
> This is mostly used for strings and on-device logs. Devices can
> respond to a block read with an empty string.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/pmbus_device.c         | 30 +++++++++++++++++++++++++++++-
>  include/hw/i2c/pmbus_device.h |  7 +++++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index c3d6046784..02647769cd 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -95,7 +95,6 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
>  void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>  {
>      size_t len = strlen(data);
> -    g_assert(len > 0);
>      g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
>      pmdev->out_buf[len + pmdev->out_buf_len] = len;
>  
> @@ -105,6 +104,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>      pmdev->out_buf_len += len + 1;
>  }
>  
> +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len)
> +{
> +    /* dest may contain data from previous writes */
> +    memset(dest, 0, len);
> +
> +    /* Exclude command code from return value */
> +    pmdev->in_buf++;
> +    pmdev->in_buf_len--;
> +
> +    /* The byte after the command code denotes the length */
> +    uint8_t sent_len = pmdev->in_buf[0];
> +
> +    if (sent_len != pmdev->in_buf_len - 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: length mismatch. Expected %d bytes, got %d bytes\n",
> +                      __func__, sent_len, pmdev->in_buf_len - 1);
> +    }
> +
> +    /* exclude length byte */
> +    pmdev->in_buf++;
> +    pmdev->in_buf_len--;
> +
> +    if (pmdev->in_buf_len < len) {
> +        len = pmdev->in_buf_len;
> +    }
> +    memcpy(dest, pmdev->in_buf, len);
> +    return len;
> +}
> +
>  
>  static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
>  {
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 93f5d57c9d..7dc00cc4d9 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t data);
>   */
>  void pmbus_send_string(PMBusDevice *state, const char *data);
>  
> +/**
> + * @brief Receive data sent with Block Write.
> + * @param dest - memory with enough capacity to receive the write
> + * @param len - the capacity of dest
> + */
> +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len);
> +
>  /**
>   * @brief Receive data over PMBus
>   * These methods help track how much data is being received over PMBus
> -- 
> 2.40.0.423.gd6c402a77b-goog
> 

Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1517421lfg;
        Fri, 21 Feb 2020 00:26:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYDcH9wFTjjiHzqXeXGLM7Ua1PSNiuLp4kNKC51JDeI2uO7T5RKAfE4aJ3/RagAKS9pFEy
X-Received: by 2002:a37:9c5:: with SMTP id 188mr7337907qkj.248.1582273571725;
        Fri, 21 Feb 2020 00:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582273571; cv=none;
        d=google.com; s=arc-20160816;
        b=KNR++f7Rlyiy1gV2QwFhfAO3Rk55dL929mkETDnMooXXsSmphlkAi+sNOK+zvUYOb2
         kFJBNntWPUB6bbCByEH4WEkQvfr6Nd45nJeuHzbpKA9SQqJeKnnZF6gM5IFASqYWUKdi
         lWSPcsoDO/8UalKM244urm2gSL0UUAVtcDL+Or+PVOEqbwNg1iMEO7rLsh2wn7WdQNF6
         cBcRue7mczjdOG4/GDFELE8BDk2d7FtplZYCa7j4QZnz9r7OeGYxmW2o/ggICzTjSnY7
         8QlBcoBTPVnrc7s/w4YRrrk5ztuy43OJf2Z9Zy+9f69s3QnQlMRl6MtdKOQuLXRWAIcQ
         eXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7KoXbgVHVj4oM2Uzto/agKsBDKFhabk9A1pD39By7/U=;
        b=polnemOUOrlnQdTx+Cg89lFCLZ+lkoHdsN3yBE4GqGDZ3qP/4NEnpxM/oL97z9C4FZ
         OST5G48zP1TTOr54HGhGXP2qj4PPE0535xCGnC5iMDproJyzrnK6vShus3XZPnt6f1jX
         5v0bGhs3Dn4KYHcdEzVpKQEHy7bil4y4J37vqm1f0JzYRkyuxqHv+Uuqt6A2VVsIvlIk
         cDx8tWFGqGNPbFJiyitCKBrqDrZpQutvWdEQlkGs8sF5/IWCSw9QNGjAeWJRTvTjHq0t
         UUEIM8bRJ6mI4olyeVLcMLn3jSR4k6xDDzdCiKppGC27S3b1DjZMf3PF0mbRfDw3UOcB
         LtIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UjjgwOD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si1110592qki.62.2020.02.21.00.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 00:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UjjgwOD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j53dT-0006it-5H
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 03:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j53dL-0006hL-5p
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 03:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j53dK-0003qa-3M
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 03:26:03 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34111
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j53dK-0003pt-03
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 03:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582273561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KoXbgVHVj4oM2Uzto/agKsBDKFhabk9A1pD39By7/U=;
 b=UjjgwOD/t0pv9X5aYVzjGWrSFp/WYrXdLmMyorUAF1BC2hl7T+bfp9EW/GTeOYDKWbATZZ
 iw+qOaOHmEieSnV138evl90VlSS3yy9YIASPniDWhaZgR+C+6SalL8iBTHyFrtrcdTSy/P
 xUb5t3xSxiQtS/I3H+D/KqUOG5g80Dg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-0r0Zez3BMZSPDn6j9_jo3A-1; Fri, 21 Feb 2020 03:25:57 -0500
X-MC-Unique: 0r0Zez3BMZSPDn6j9_jo3A-1
Received: by mail-wm1-f71.google.com with SMTP id u11so308671wmb.4
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 00:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KoXbgVHVj4oM2Uzto/agKsBDKFhabk9A1pD39By7/U=;
 b=qVmM170tLLzJUbcW1WYHqGzJLxndotNvJ1TDzjxFCT9NG/WuI/iC7sx3RxncWIsXow
 3km3kQ3JAyv4MkR6k0OkxFFPzX1l2XB0f+CgPWHbaLmU6BYbslnomwvTZ57kRNIm9Nbv
 aD+WHxAZmJrj/gGM22SKVeUqRk61HKngvIA640siV2dooWisy6/vS9XF0GbT/ojYZlpG
 awLYqSFfq6xG0WbGgq+XLRq+xidoMH8+ahrT389lJTbRn/S9hPckK4leg0YNYwuNlYaQ
 MAiAttVxptPZVCovxRHvIfp2ih8XgkBNAKvv3pKlBqcz233a1agO+pfD1Niq9N958MfE
 A/oQ==
X-Gm-Message-State: APjAAAVBSlVa2eGD4w7szErU77MCxjYjJ85qF+FChHyuqjmdNqAsrPXy
 Djfh7FXbH9yTbuvS6syVQSB/ktYOyHBs/4ADK9PCtlXYswJ4+z3C4+phI5+Mwvl96VPKOcUYhKQ
 R+YSa+4I9NYK2
X-Received: by 2002:a1c:c5:: with SMTP id 188mr2160423wma.187.1582273556812;
 Fri, 21 Feb 2020 00:25:56 -0800 (PST)
X-Received: by 2002:a1c:c5:: with SMTP id 188mr2160375wma.187.1582273556428;
 Fri, 21 Feb 2020 00:25:56 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
 by smtp.gmail.com with ESMTPSA id r6sm3065160wrq.92.2020.02.21.00.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 00:25:55 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: Enable TxFIFO and async transmission
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200221044908.266883-1-gshan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <12b3d4d4-736b-e861-6b6b-5b6885b7cbf1@redhat.com>
Date: Fri, 21 Feb 2020 09:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200221044908.266883-1-gshan@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, maz@kernel.org, shan.gavin@gmail.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: miRamJndBv+0

On 21/02/20 05:49, Gavin Shan wrote:
> @@ -306,6 +362,7 @@ static const VMStateDescription vmstate_pl011 = {
>          VMSTATE_UINT32(int_enabled, PL011State),
>          VMSTATE_UINT32(int_level, PL011State),
>          VMSTATE_UINT32_ARRAY(read_fifo, PL011State, 16),
> +        VMSTATE_UINT8_ARRAY(write_fifo, PL011State, 16),
>          VMSTATE_UINT32(ilpr, PL011State),
>          VMSTATE_UINT32(ibrd, PL011State),
>          VMSTATE_UINT32(fbrd, PL011State),
> @@ -313,6 +370,7 @@ static const VMStateDescription vmstate_pl011 = {
>          VMSTATE_INT32(read_pos, PL011State),
>          VMSTATE_INT32(read_count, PL011State),
>          VMSTATE_INT32(read_trigger, PL011State),
> +        VMSTATE_INT32(write_count, PL011State),

Hi Gavin, please add these two fields to a subsection, so that they are
emitted only if write_count > 0.

Thanks!

Paolo

>          VMSTATE_END_OF_LIST()
>      }
>  };
> diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
> index 14187165c6..aeaf332eca 100644
> --- a/include/hw/char/pl011.h
> +++ b/include/hw/char/pl011.h
> @@ -38,6 +38,7 @@ typedef struct PL011State {
>      uint32_t int_enabled;
>      uint32_t int_level;
>      uint32_t read_fifo[16];
> +    uint8_t  write_fifo[16];
>      uint32_t ilpr;
>      uint32_t ibrd;
>      uint32_t fbrd;
> @@ -45,6 +46,7 @@ typedef struct PL011State {
>      int read_pos;
>      int read_count;
>      int read_trigger;
> +    int write_count;
>      CharBackend chr;
>      qemu_irq irq[6];
>      const unsigned char *id;
> 


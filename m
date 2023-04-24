Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2929678ejm;
        Mon, 24 Apr 2023 09:28:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350be2rHV4UTMNRUOWof7tgWT0TgJRoCF+t8A5wX57H7rK68zmZMmT5GBJtEyRfHMvgiqgLC0
X-Received: by 2002:a05:622a:1709:b0:3ef:65b8:57bf with SMTP id h9-20020a05622a170900b003ef65b857bfmr13129431qtk.32.1682353699488;
        Mon, 24 Apr 2023 09:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682353699; cv=none;
        d=google.com; s=arc-20160816;
        b=jYKfz5J76RC/dow6K6IqV+OIhq8TEnHJI9rK2w5QIfkZkTjkcJVj6sT+PEnCTK5hax
         9OZljg1mAeRs+qhutza94YmH0L5VZbndhLw3TtKde1KEs6+Jcm2VashZIAROuaIVuVQo
         JOEGIwT+wZhZEP7ZUEXTY+g408Px1VpQ9LHmOW+wtIR3K/Q57pZnAtZtYLvxFgtwAZ4C
         x7ZG2MYs+OoISOdaQp9MoF0PnfRNsrHgnL1eImc+4QkxTmIMp00JF2sydWUlppVCjbrb
         KtXYU4P7FSeJBfdIUThCDkF+OnIjZd/KF1ejnf7jUZ3rrNa9gOLPNb+BFvBnuETF0kmx
         lwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Wb2iTLITE/bUto0SOG3AjYW6klbWdDBsSr5RZno75sM=;
        b=rhhh7TiAbKDQrLyHEOd6HD3BPumDYncMJCSSqdtVrsJs3mK6lNRnmIM/E4baUtSbdZ
         KF6IOPrmIV4bGyZ3nk1G5rUhrLYrQ13rlD6qHlS2ChKTmqrzSd+9LOTycZ0JIiLdyWA7
         Leab040aXx2o5lndp3c86v+nEekJEUUWxw1U7bea54m3+l9Sv10MGViifem70SkYpe9u
         3Dy3vY4eEIgQINwNoIaWWoIWUls8h54t79ePKHjQzjmOwDhUcg2EIJAuSS1DUNjJYL59
         GazRuGf7TYBQ70MQBI/HlsaMDLnZyXUkvuEln0SX8dyVraWxLyEbJhd5fsuwmeGVPyEt
         oGNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h5DxOsUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05620a2a0a00b00746996bb5e9si7958207qkp.405.2023.04.24.09.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 09:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h5DxOsUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqz2Q-00067p-Hz; Mon, 24 Apr 2023 12:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqz2P-000671-66
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:27:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqz2M-0005Fh-5K
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682353653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb2iTLITE/bUto0SOG3AjYW6klbWdDBsSr5RZno75sM=;
 b=h5DxOsUUb4eVsrLfyfU3/XBWdkQfIMAVVGR7M1zturbz/5tfrH1GBTYn3mS0dHUQ4YisGh
 jak9YmSbxrkzu1dtT8qzMNGntGg9xts4ptkqwdWw/ATRetQPDeK5Dy5vw1P01+Sub5UGyF
 oBm3dISiTxUjN7UL0JAEkJNNE1zl7Ws=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-sIMGJZmlNiWE3FPyV8Fl8A-1; Mon, 24 Apr 2023 12:27:32 -0400
X-MC-Unique: sIMGJZmlNiWE3FPyV8Fl8A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso15953755e9.2
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 09:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682353650; x=1684945650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wb2iTLITE/bUto0SOG3AjYW6klbWdDBsSr5RZno75sM=;
 b=MXIU8zGqdk8vdeAqhuy/S9iqts4Wcx/oyP/6ZeFYlwV0SzU3mTUdA9BcVZic9ORley
 iUBpPCcqCq5QIM7rxRmOrss9qZTdKVSlxSlhsUBb8D9DrY5OcOOpq0eBCTNyXmULJCVa
 szxqJL32t0zZWXtta24iKCtWDkwUmPkvyxOm9C/63rVhlAoI7OfrerzBDXmHOfaM4PD+
 vHEONqhc1BoB60YuV9dcrBgYUC/3JKkQzXMhJbZdExeminbgJROnd69Z6DQg4iUbK5vo
 Slwz7N/YSPXmTgv8w8CgAZ5VXWSR8/N3HnBGofZFGYRbML47gPlJQaJgyjuuQlxDoMKW
 fBBQ==
X-Gm-Message-State: AAQBX9eCqV7n8c1JG93wsqimfbJ+pNkW5eFoHD7YaskDFygf6tJ1rhHS
 b3qHHyClkYgYZP7N+TqVU7dQIN1afTAzaLYM6IYd0935tE5eDgRS6zr8I/EeL8Yk4qdfQfZXmB2
 EghTkJ+Pe7Olw
X-Received: by 2002:a1c:7505:0:b0:3f0:373d:c32b with SMTP id
 o5-20020a1c7505000000b003f0373dc32bmr8128592wmc.30.1682353650770; 
 Mon, 24 Apr 2023 09:27:30 -0700 (PDT)
X-Received: by 2002:a1c:7505:0:b0:3f0:373d:c32b with SMTP id
 o5-20020a1c7505000000b003f0373dc32bmr8128579wmc.30.1682353650406; 
 Mon, 24 Apr 2023 09:27:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b003047297a5e8sm4494170wrr.54.2023.04.24.09.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:27:29 -0700 (PDT)
Message-ID: <a38b1bbd-1c46-3ea6-d7c1-f77e414bb6bf@redhat.com>
Date: Mon, 24 Apr 2023 18:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/net/msf2-emac: Don't modify descriptor in-place in
 emac_store_desc()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20230424151919.1333299-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424151919.1333299-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Zun1vW2KzfnN

On 24/04/2023 17.19, Peter Maydell wrote:
> The msf2-emac ethernet controller has functions emac_load_desc() and
> emac_store_desc() which read and write the in-memory descriptor
> blocks and handle conversion between guest and host endianness.
> 
> As currently written, emac_store_desc() does the endianness
> conversion in-place; this means that it effectively consumes the
> input EmacDesc struct, because on a big-endian host the fields will
> be overwritten with the little-endian versions of their values.
> Unfortunately, in all the callsites the code continues to access
> fields in the EmacDesc struct after it has called emac_store_desc()
> -- specifically, it looks at the d.next field.
> 
> The effect of this is that on a big-endian host networking doesn't
> work because the address of the next descriptor is corrupted.
> 
> We could fix this by making the callsite avoid using the struct; but
> it's more robust to have emac_store_desc() leave its input alone.
> 
> (emac_load_desc() also does an in-place conversion, but here this is
> fine, because the function is supposed to be initializing the
> struct.)
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is one of a number of issues that prevent 'make check-avocado'
> working for arm targets on a big-endian host...
> 
>   hw/net/msf2-emac.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> index 7ccd3e51427..34c1f768db0 100644
> --- a/hw/net/msf2-emac.c
> +++ b/hw/net/msf2-emac.c
> @@ -120,12 +120,16 @@ static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
>   
>   static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)

You could likely also add a "const" to "EmacDesc *d" now.

>   {
> -    /* Convert from host endianness into LE. */
> -    d->pktaddr = cpu_to_le32(d->pktaddr);
> -    d->pktsize = cpu_to_le32(d->pktsize);
> -    d->next = cpu_to_le32(d->next);
> +    EmacDesc outd;
> +    /*
> +     * Convert from host endianness into LE. We use a local struct because
> +     * calling code may still want to look at the fields afterwards.
> +     */
> +    outd.pktaddr = cpu_to_le32(d->pktaddr);
> +    outd.pktsize = cpu_to_le32(d->pktsize);
> +    outd.next = cpu_to_le32(d->next);
>   
> -    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, d, sizeof *d);
> +    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, &outd, sizeof outd);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


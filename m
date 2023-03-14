Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp1674374ejb;
        Tue, 14 Mar 2023 10:44:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set9zRGAxYSmFuQMSfGpSbMhZj5rnNEppLYhBc+TEOOMj9uR/MIrBgUsRxTKWitRE7rd5lTpA
X-Received: by 2002:a05:6214:2389:b0:57e:866e:ba1b with SMTP id fw9-20020a056214238900b0057e866eba1bmr18542875qvb.24.1678815870827;
        Tue, 14 Mar 2023 10:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678815870; cv=none;
        d=google.com; s=arc-20160816;
        b=ycZe2pJkbYuWCUhz5KkF2mHkTC12xXh1iI1GobSNWBlrcEk0sYKln6898qI54eQ3Wa
         JjoaF4CgxaZ1X9AxZdYtD0NBrdK7pJ2oLl92F3LcvFhlB1mm8giYhmRLJvRYzdgEMpqC
         Nxwpo5EwE88q0TaFBcVGhuarbAlc+6emuN4nlxDi5RJu0QArV+pw+lAXjB8Cl0wqLUeO
         3iktqPv3SRWLtRWA7krn2bdsS6wF2yvVhJ9mnwMu4q7/Zk9CZwFEgLyM4Zad8rifV4Ga
         9i5aV67ccZYP2QsJ4rSaXhcDvdoCFlUlqOJkaNjpnSR/9QuPBTbMRyYDtrFI+3nJ4Ls2
         bXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Hoh/6fVTgkC+hIf5af+HPk+Ejg7rHi+S85OzvtFgdQc=;
        b=K4R+QWtTqwk6shv7C5euv892Wlzm5Inl92vF1Oe6AuvZVqEOQCu7ag2ljPQwq5/lqg
         7US+pI/5GQlR3cO/4F5f8rbcZvWpMTwxqh6bJ5Mja+SxUFrGIOXADqwK8qq1eU9MmbiS
         zmBl1WqghlEWtxhRR9PqJr4sVWE17istJMe/Jh2gIRusUJ/lvGrJIMKmMqtK9uLGTFJh
         6LR917j8xHag2Z/UorzTSdLd+vRXhzS6Bf67V2I8JIVmA0MELR4DO5BhNsPuuklB6FGU
         BRw/l8YBezocHbV4dnBhFJ5uIM72sM2vK9g0K5532GmPMsw5/52rT6nbOdh1pLg1TXZG
         uPeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1eb8pcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a0cf006000000b0056f02945e03si2303065qvk.171.2023.03.14.10.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Mar 2023 10:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1eb8pcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pc8hE-0003Y7-9l; Tue, 14 Mar 2023 13:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc8hB-0003Xt-63
 for qemu-arm@nongnu.org; Tue, 14 Mar 2023 13:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc8h8-0003UC-P9
 for qemu-arm@nongnu.org; Tue, 14 Mar 2023 13:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678815857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hoh/6fVTgkC+hIf5af+HPk+Ejg7rHi+S85OzvtFgdQc=;
 b=J1eb8pcGTmdQT26ry4XjvPLIkZ9u9IiINQSvFjeDIq55QgtqnPRJK1LdSSlVPAOH7MM47u
 3QDshWVGXhGnekKVEB1ev0M6xE9BWbs+actIL7SY7q9kzncX+cBzK6plS72hEheS0Xi3w0
 kCpWLMGjfKplFGIGL9tkWj4rH/CsQsE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-1AYWjQoaMtCPk-pounoDWw-1; Tue, 14 Mar 2023 13:44:16 -0400
X-MC-Unique: 1AYWjQoaMtCPk-pounoDWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b8-20020a05600c4e0800b003ed2d729092so1069775wmq.0
 for <qemu-arm@nongnu.org>; Tue, 14 Mar 2023 10:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678815855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hoh/6fVTgkC+hIf5af+HPk+Ejg7rHi+S85OzvtFgdQc=;
 b=BSmY23wAPgWH25VhL/KHjT6jbbUgsqyAefdb8tT0Pcj71qTeXaHTjon8vvm0Fna9/+
 OJPGgN45RR8GiwUihQ9P2KFU9xu5c6nr+8jGbT1b4wmJxPNAXqxXeRVIEP4qj8bb0CTP
 AYQ/z8SPyomTo518V6AuyvJOVggBmmmrnOvhZF2dDTDZmH2U65UWxdZCnZ0OLNL6/rYq
 hlH3/4jTuNOaFNzkWBcOmRmfDcK84o67p+C36maItCYspuG8TgNoiGn3u5HmM+iIeZei
 szDh8XW7c+hJGbD9ZMgH1nWKeuH9Hm74YDCo72QZkUIdpsQSF0+wkX7PbnQKfYdCUB6z
 O+eg==
X-Gm-Message-State: AO0yUKXL8/uW6QX6lJICC+J+nA7umCRDKFCR4C191+FTxphsr5NBqC2J
 wv/mKFzeWivFUOKDCGeNVHcKG+/FQmt1iIT9q9nKUC4eUdQ298d57UVJChQ0n0xhtWnLtJ0+mAY
 nTDbCu5O6rWh9
X-Received: by 2002:a05:600c:3b9d:b0:3ed:2e02:1bfe with SMTP id
 n29-20020a05600c3b9d00b003ed2e021bfemr1600297wms.20.1678815854958; 
 Tue, 14 Mar 2023 10:44:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3b9d:b0:3ed:2e02:1bfe with SMTP id
 n29-20020a05600c3b9d00b003ed2e021bfemr1600288wms.20.1678815854732; 
 Tue, 14 Mar 2023 10:44:14 -0700 (PDT)
Received: from [192.168.8.107] (tmo-099-230.customers.d1-online.com.
 [80.187.99.230]) by smtp.gmail.com with ESMTPSA id
 f26-20020a7bc8da000000b003e2096da239sm3598301wml.7.2023.03.14.10.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:44:13 -0700 (PDT)
Message-ID: <30ea43e8-0245-983d-7efd-eeece060ab02@redhat.com>
Date: Tue, 14 Mar 2023 18:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: ns+Ma77dYnRO

On 14/03/2023 18.08, Peter Maydell wrote:
> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
> 
> Do the mask before the bounds check instead of afterwards.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/cadence_uart.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c069a30842e..807e3985419 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
>           }
>           break;
>       case R_BRGR: /* Baud rate generator */
> +        value &= 0xffff;
>           if (value >= 0x01) {
> -            s->r[offset] = value & 0xFFFF;
> +            s->r[offset] = value;
>           }
>           break;
>       case R_BDIV:    /* Baud rate divider */
> +        value &= 0xff;
>           if (value >= 0x04) {
> -            s->r[offset] = value & 0xFF;
> +            s->r[offset] = value;
>           }
>           break;
>       default:

Reviewed-by: Thomas Huth <thuth@redhat.com>


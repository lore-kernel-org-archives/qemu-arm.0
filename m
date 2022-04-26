Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2796842lfk;
        Mon, 25 Apr 2022 18:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzj8y38XOvU8RHSxt23hJ1+YDyOlU+s76flT3ppJiR0jMJ+I8EPYIqFCQqqsaMXnGP+xaO
X-Received: by 2002:a0d:dfc1:0:b0:2f4:e5d8:3352 with SMTP id i184-20020a0ddfc1000000b002f4e5d83352mr18368705ywe.28.1650937422832;
        Mon, 25 Apr 2022 18:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650937422; cv=none;
        d=google.com; s=arc-20160816;
        b=FXs66x29KpZ5/ZDmnJX7IoHwqoGznYW0l121r5cSE2AgU6yeef5u9gf1Wwlh0JxDMi
         zqhuVRI1wC9VU8zFeibmzVLDxS8K43Iw6sw5bxlkEzb1GijifiQsyH/sx9iYAiHWqzfK
         7nQ8lgzHCEu7J+eT4dm40kiM+jevSDzUiBfbbgp2uLV7sbaJif8yCMVLaGk42cTrTkbO
         6gSCIWBx0PK1xdnH+NVts8c53sQmTiw3u7OnOKeq1Sdx2S60SmxLuVIhEe11P6nt7/zB
         +UOVVKrgUU+pH+mfoQO+k1S3WXtm9jkaOOtsfnJ40wc7SDk5godfNDNsi9XCBgIjHSEj
         qA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=NTmoYPx4zEpKflyBrNzv33uI1q6QrWTz0PA33UJ9byk=;
        b=ulApXRQgvNzP+roc7Wt+W4JCAWCXS5yfWiliQ8iw4rQrs1ov1TtIzpW2DPuAYXJq+C
         PVqwApZnXvzhKlh8NIYxQQ4R1Mmk4PpIuZbZRxxVRu+m9LxM6i8dDi1eKfldt95Y/1W3
         xGxGHsiKF2k8W6iofTLrOdupsyQUDbWzKRnd/XwobXDazt5KklU1nl60Qf5rw59OIFht
         QP8hmohXNjWe7YfcR35poLISZJeKIt0eP4lnKvKgsfEmno6J4ovXANq0FJ1yVASLhp1e
         haixzP2EqIkGPjPSLkCQTSAEXRBJ0iVaVNabsp+hb8MqGOXSB+qSuKEEtI4GU1tz9OPp
         NBTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f186-20020a0ddcc3000000b002ebcdd2c7c0si14427117ywe.485.2022.04.25.18.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 18:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njAEw-0003b4-9c
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 21:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1njAEl-0003X1-9o; Mon, 25 Apr 2022 21:43:31 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1njAEi-0007jd-51; Mon, 25 Apr 2022 21:43:30 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23Q1UDAT071938;
 Tue, 26 Apr 2022 09:30:13 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Apr
 2022 09:42:39 +0800
Date: Tue, 26 Apr 2022 09:42:32 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 2/3] aspeed/hace: Support AST2600 HACE
Message-ID: <20220426014230.GA2615@aspeedtech.com>
References: <20220422051909.27540-1-steven_lee@aspeedtech.com>
 <20220422051909.27540-3-steven_lee@aspeedtech.com>
 <17d96382-de18-986e-877c-d87092c0816d@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17d96382-de18-986e-877c-d87092c0816d@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23Q1UDAT071938
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rq1AgZC6HKzh

The 04/25/2022 21:46, Cédric Le Goater wrote:
> On 4/22/22 07:19, Steven Lee wrote:
> > +/**
> > + * Check whether the request contains padding message.
> > + *
> > + * @param s             aspeed hace state object
> > + * @param iov           iov of current request
> > + * @param req_len       length of the current request
> > + * @param total_msg_len length of all acc_mode requests(excluding padding msg)
> > + * @param pad_offset    start offset of padding message
> > + */
> > +static bool has_padding(AspeedHACEState *s, struct iovec *iov,
> > +                        hwaddr req_len, uint32_t *total_msg_len,
> > +                        uint32_t *pad_offset)
> > +{
> > +    *total_msg_len = (uint32_t)(ldq_be_p(iov->iov_base + req_len - 8) / 8);
> > +    /*
> > +     * SG_LIST_LEN_LAST asserted in the request length doesn't mean it is the
> > +     * last request. The last request should contain padding message.
> > +     * We check whether message contains padding by
> > +     *   1. Get total message length. If the current message contains
> > +     *      padding, the last 8 bytes are total message length.
> > +     *   2. Check whether the total message length is valid.
> > +     *      If it is valid, the value should less than or equal to
> > +     *      total_req_len.
> > +     *   3. Current request len - padding_size to get padding offset.
> > +     *      The padding message's first byte should be 0x80
> > +     */
> > +    if (*total_msg_len <= s->total_req_len) {
> > +        uint32_t padding_size = s->total_req_len - *total_msg_len;
> > +        uint8_t *padding = iov->iov_base;
> > +        *pad_offset = req_len - padding_size;
> > +        if (padding[*pad_offset] == 0x80) {
> > +            return true;
> > +        }
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +static int reconstruct_iov(AspeedHACEState *s, struct iovec *iov, int id,
> > +                           uint32_t *pad_offset)
> > +{
> > +    int i, iov_count;
> > +    if (pad_offset != 0) {
> 
> pad_offset can not be NULL. or may be you meant *pad_offset ?
> 
> Thanks,
> 
> C.
> 
> 

Yes, it should be *pad_offset, I will fix it.

Thanks,
Steven

> > +        s->iov_cache[s->iov_count].iov_base = iov[id].iov_base;
> > +        s->iov_cache[s->iov_count].iov_len = *pad_offset;
> > +        ++s->iov_count;
> 
> 
> > +    }
> > +    for (i = 0; i < s->iov_count; i++) {
> > +        iov[i].iov_base = s->iov_cache[i].iov_base;
> > +        iov[i].iov_len = s->iov_cache[i].iov_len;
> > +    }
> > +    iov_count = s->iov_count;
> > +    s->iov_count = 0;
> > +    s->total_req_len = 0;
> > +    return iov_count;
> > +}
> > +
> 

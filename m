Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2006445ejb;
        Sun, 19 Feb 2023 22:36:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8IwA2v86hBBrQ8SRw4055k+NYvT7FvU5cLIGaxNI1K91Y6mAlfN6SX3nFY6/opbxncQ2bz
X-Received: by 2002:a05:622a:1a24:b0:3b6:a1c2:f63c with SMTP id f36-20020a05622a1a2400b003b6a1c2f63cmr14548117qtb.33.1676874997927;
        Sun, 19 Feb 2023 22:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676874997; cv=none;
        d=google.com; s=arc-20160816;
        b=AijRyZG8Xwm9kVBkFqP0RiNmzPTGOX+z4hK6CAIF4arh+Dv0kx90UMaUoutP++9KBw
         Mx6LoNQYjSkxNouRKSX8mVOGGgeW7+sClaNt3tbm83lu7n73yA5vXU0dR010gsnrIjsF
         zlnxj8TQIDZh0I8R4+9uNGlIOMTOrTER3jD7g5bxee4EpbSnBABvtC5dMXWsB7cZcdfG
         HJbrkicW1k81j9J42Oan1RcldZLUTJUh8SFEJvjUQJnLIoZfXvq1JYBZeY4i1W1UNLvB
         X9BTKUNNC/+km/hCuFTiV/2BlYkzcyYqP7kduD/JEXfziV1LNE8upaSrzn3wRS8F9wVj
         9bdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8MLx2+rnNctmUvlbrAQiG3fA5GIkOmb98UUo/wH6si0=;
        b=VF4s6Sq+ofA0+rm+FNvel54FcSszz8pZSD1P85sESBgmZe8J1JdlcQ33HX3DQK1DgY
         47Tm4NTIj76OUIbel+0fIIxkSB6aFfAh2FShxRfhlsr58kS0/xaTDo5hgJ/5ygMb20la
         QEan06DYiTuyMSon2fsqVlyGXT3IsaM5gidc0TS4KWP0Q2O729GboKTOVFlx6ihIFMjE
         mneajHogvPzLtroyEMDfPuJq+JXGaod8Py3DG7bOezNBZ9zMiWXUSwkmQF2cGAKq/1NG
         uFyOQspkrx/jPYP7wmiRIDEC2R9oshq6fp54bg1X+Y3PgdOsStkGH/44ZiU/9ADXa7b5
         9jXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LeGYi/y4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020ac87fcc000000b003b9a5ba03c0si9285572qtk.65.2023.02.19.22.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Feb 2023 22:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LeGYi/y4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pTzmP-0004xq-Rn; Mon, 20 Feb 2023 01:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pTzmJ-0004xM-HJ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 01:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pTzmH-00016F-UN
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 01:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676874956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MLx2+rnNctmUvlbrAQiG3fA5GIkOmb98UUo/wH6si0=;
 b=LeGYi/y4yeeCV6pLpkcWM+UtqCe253QXr4nI5/hxAz6hPH8WoLHyqWj4MkDQW6jignh1SY
 aRJk3tixdR5wZ5RdeK+yRclwLWWRNujlQgm61WDPsCEGUwpydJ1gpiUS6MwlCVa2aQ41dT
 yzn+PICLN+tWpzm5XAmV7bcmrxBIYhg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-Diz9SCaAMFCcDfj8wPQt5Q-1; Mon, 20 Feb 2023 01:35:42 -0500
X-MC-Unique: Diz9SCaAMFCcDfj8wPQt5Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 c2-20020a056000184200b002c54a27803cso122970wri.22
 for <qemu-arm@nongnu.org>; Sun, 19 Feb 2023 22:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8MLx2+rnNctmUvlbrAQiG3fA5GIkOmb98UUo/wH6si0=;
 b=yLXbpxeXsP2f7yRfGxfg98xyhSgRRVcpH/oIQrayRI6+jz50r64xRcP6tvZXl0esPd
 OxAvm0MuOEqSoDC77trciW4X66obmXNsxVWzd6qFuti2qBeB26W2mgXBlLo4BeicEzXb
 lXgJFUmS2ytU8cOuXRkizTYdnX5YITyn8qej9Troo/4MQxJ+JbvzcPMIrhJCARv49FE8
 QGh6jVQ0LarVc+EffOE1o+2mU1+2N+J9UtGArxQwsNlmC4hIsubWuDx8BlfaYSjHJ/YI
 uAum/HCJv2BoT8sf8PfkABvD5gZJyU1OiyOttj9QIrVK3kxmld5xcGvj5CnYWCsncb4W
 aWGw==
X-Gm-Message-State: AO0yUKUA+0Lb4fBRw/dPYBILmjSV1sI/pn7WMnM7vh6B8wCtOOL/B5oa
 3qQFBwVIIBIyrVAtx7Dn+35AfXOuhYtfFAZyknGNV6iNhr/Dr0jloYCm+25KH4ASmGZllj7OjHJ
 Yy+Ctq7vpXAi2
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id
 e19-20020a05600c439300b003e208f17684mr10993198wmn.33.1676874941479; 
 Sun, 19 Feb 2023 22:35:41 -0800 (PST)
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id
 e19-20020a05600c439300b003e208f17684mr10993183wmn.33.1676874941179; 
 Sun, 19 Feb 2023 22:35:41 -0800 (PST)
Received: from [192.168.8.104] (tmo-100-40.customers.d1-online.com.
 [80.187.100.40]) by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b003e1fee8baacsm9214780wmq.25.2023.02.19.22.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 22:35:40 -0800 (PST)
Message-ID: <45496628-6a2b-cdfd-666f-a7a9dca887bd@redhat.com>
Date: Mon, 20 Feb 2023 07:35:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Vikram Garhwal <vikram.garhwal@amd.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Thomas Huth
 <huth@tuxfamily.org>, Francisco Iglesias <francisco.iglesias@amd.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jason Wang
 <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217215836.40328-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/2] hw/timer: Rename ptimer_state -> PTimer
In-Reply-To: <20230217215836.40328-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DNjYb0KD2vWT

On 17/02/2023 22.58, Philippe Mathieu-Daudé wrote:
> Remove a pointless cast in ptimer_tick() and rename 'ptimer_state'
> as 'PTimer' to follow the Structure naming convention.
> 
> See docs/devel/style.rst:
> 
>    Variables are lower_case_with_underscores; easy to type and
>    read.  Structured type names are in CamelCase; harder to type
>    but standing out.  Enum type names and function type names
>    should also be in CamelCase.  Scalar type names are
>    lower_case_with_underscores_ending_with_a_t, like the POSIX
>    uint64_t and family.
> 
> Mechanical change doing:
> 
>    $ sed -i -e s/ptimer_state/PTimer/g \
>        $(git grep -l ptimer_state)
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> @@ -154,7 +154,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
>   
>   static void ptimer_tick(void *opaque)
>   {
> -    ptimer_state *s = (ptimer_state *)opaque;
> +    PTimer *s = opaque;

I like that you also removed the useless cast here.

>       bool trigger = true;
>   
>       /*
> @@ -198,7 +198,7 @@ static void ptimer_tick(void *opaque)
>       ptimer_transaction_commit(s);
>   }
>   
> -uint64_t ptimer_get_count(ptimer_state *s)
> +uint64_t ptimer_get_count(PTimer *s)
>   {
>       uint64_t counter;
>   
> @@ -294,7 +294,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>       return counter;
>   }
>   
> -void ptimer_set_count(ptimer_state *s, uint64_t count)
> +void ptimer_set_count(PTimer *s, uint64_t count)
>   {
>       assert(s->in_transaction);
>       s->delta = count;
> @@ -303,7 +303,7 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
>       }
>   }
>   
> -void ptimer_run(ptimer_state *s, int oneshot)
> +void ptimer_run(PTimer *s, int oneshot)
>   {
>       bool was_disabled = !s->enabled;
>   
> @@ -323,7 +323,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
>   
>   /* Pause a timer.  Note that this may cause it to "lose" time, even if it
>      is immediately restarted.  */
> -void ptimer_stop(ptimer_state *s)
> +void ptimer_stop(PTimer *s)
>   {
>       assert(s->in_transaction);
>   
> @@ -337,7 +337,7 @@ void ptimer_stop(ptimer_state *s)
>   }
>   
>   /* Set counter increment interval in nanoseconds.  */
> -void ptimer_set_period(ptimer_state *s, int64_t period)
> +void ptimer_set_period(PTimer *s, int64_t period)
>   {
>       assert(s->in_transaction);
>       s->delta = ptimer_get_count(s);
> @@ -349,7 +349,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>   }
>   
>   /* Set counter increment interval from a Clock */
> -void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
> +void ptimer_set_period_from_clock(PTimer *s, const Clock *clk,
>                                     unsigned int divisor)
>   {
>       /*
> @@ -382,7 +382,7 @@ void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
>   }
>   
>   /* Set counter frequency in Hz.  */
> -void ptimer_set_freq(ptimer_state *s, uint32_t freq)
> +void ptimer_set_freq(PTimer *s, uint32_t freq)
>   {
>       assert(s->in_transaction);
>       s->delta = ptimer_get_count(s);
> @@ -395,7 +395,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>   
>   /* Set the initial countdown value.  If reload is nonzero then also set
>      count = limit.  */
> -void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
> +void ptimer_set_limit(PTimer *s, uint64_t limit, int reload)
>   {
>       assert(s->in_transaction);
>       s->limit = limit;
> @@ -406,19 +406,19 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
>       }
>   }
>   
> -uint64_t ptimer_get_limit(ptimer_state *s)
> +uint64_t ptimer_get_limit(PTimer *s)
>   {
>       return s->limit;
>   }
>   
> -void ptimer_transaction_begin(ptimer_state *s)
> +void ptimer_transaction_begin(PTimer *s)
>   {
>       assert(!s->in_transaction);
>       s->in_transaction = true;
>       s->need_reload = false;
>   }
>   
> -void ptimer_transaction_commit(ptimer_state *s)
> +void ptimer_transaction_commit(PTimer *s)
>   {
>       assert(s->in_transaction);
>       /*
> @@ -442,27 +442,27 @@ const VMStateDescription vmstate_ptimer = {
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .fields = (VMStateField[]) {
> -        VMSTATE_UINT8(enabled, ptimer_state),
> -        VMSTATE_UINT64(limit, ptimer_state),
> -        VMSTATE_UINT64(delta, ptimer_state),
> -        VMSTATE_UINT32(period_frac, ptimer_state),
> -        VMSTATE_INT64(period, ptimer_state),
> -        VMSTATE_INT64(last_event, ptimer_state),
> -        VMSTATE_INT64(next_event, ptimer_state),
> -        VMSTATE_TIMER_PTR(timer, ptimer_state),
> +        VMSTATE_UINT8(enabled, PTimer),
> +        VMSTATE_UINT64(limit, PTimer),
> +        VMSTATE_UINT64(delta, PTimer),
> +        VMSTATE_UINT32(period_frac, PTimer),
> +        VMSTATE_INT64(period, PTimer),
> +        VMSTATE_INT64(last_event, PTimer),
> +        VMSTATE_INT64(next_event, PTimer),
> +        VMSTATE_TIMER_PTR(timer, PTimer),
>           VMSTATE_END_OF_LIST()
>       }
>   };
>   
> -ptimer_state *ptimer_init(ptimer_cb callback, void *callback_opaque,
> +PTimer *ptimer_init(ptimer_cb callback, void *callback_opaque,
>                             uint8_t policy_mask)

Just a nit: In case you respin, please adjust the indentation here.

Reviewed-by: Thomas Huth <thuth@redhat.com>


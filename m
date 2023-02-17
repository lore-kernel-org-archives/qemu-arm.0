Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1366245ejb;
        Fri, 17 Feb 2023 02:32:23 -0800 (PST)
X-Google-Smtp-Source: AK7set98Lro3iucu92j3CrJMNLUNtaCKs6rlqrv7TiCCrhSQ5sLWxSFAOzsoSNtK4jYuCPTcSWVq
X-Received: by 2002:ac8:5c07:0:b0:3b6:5fc7:f554 with SMTP id i7-20020ac85c07000000b003b65fc7f554mr8761137qti.7.1676629942997;
        Fri, 17 Feb 2023 02:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676629942; cv=none;
        d=google.com; s=arc-20160816;
        b=zJgYXNns7gHqMeL2nirC8HbsHr3vu1jjLmCvZPpsM2J6MBeHCa3jhzhLlRu/GgyWWc
         3z0/SS4dJWDkrccfbk7rtklTxwxiEHAxqmVsa8DfVkWtMCM/FyxsoDvnsFbnlt0t9WdN
         lA+5DQUYU7fl3HdCnZlu9sTM19mzU718eEz52VK9f1hmW7eKdZX3Oh9W9xk1PdPYV/gV
         035RuGlUFrVeUhCXmUsWZk1SAk2Ofa9rQf5rnDqKKFIl9OjrOki3Co4/LTSu55eLA9sa
         /1AuwAgWSr8kRat0MaUfd21sGjLno6FtzZ0shikkGMYrDug2yBo6INPyTOo/9zhxY2kE
         2low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kCTlagYfWgLEiXnsIz5tTMEmvqpOXp/IYE2XzsBlc6E=;
        b=SrPZRtbKBtAjmy8oi/r6/OIJLrAbujItgPnLH265DRDIb0YKSUxCt4xHMWVS7s/MPP
         JS9xzvcQyxA9BshnN8w1x/Ute89cH2t5/uyFRfk8Iwc7O/p/ewPlhVvrx2hABNYZdFjx
         8z3qriS0OlZfrjQvj1GKfa7UmELUObRKyZnio7tK4rOuG+jNU4nNpBM2Ojmko54+JpCr
         2ISf8ln4/rpLNKS5gsNCXEVY/QjOE4aBxpGSwAiM957dr7NYJbsdIjKdvG4JesiS7rov
         wMRg6QTv9YCThL86ODM3ILKEit2Vcme0E5KyJ1+fe/0Gsyrf3Hc88TXdFwrYZ33B9D80
         P8ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlLNmN8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020a05622a060d00b003b9a61a45a9si3073333qta.470.2023.02.17.02.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 02:32:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlLNmN8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSy1g-00022H-BP; Fri, 17 Feb 2023 05:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pSy1e-00020Z-Om; Fri, 17 Feb 2023 05:31:34 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pSy1d-0002CI-8Q; Fri, 17 Feb 2023 05:31:34 -0500
Received: by mail-oi1-x229.google.com with SMTP id bg20so262646oib.9;
 Fri, 17 Feb 2023 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kCTlagYfWgLEiXnsIz5tTMEmvqpOXp/IYE2XzsBlc6E=;
 b=AlLNmN8aRlcCmfxD2qlxPQK4T996KOWzUxmjO+Y1rcUgL4nCrjytYIqP0n0P0VfxCB
 ygKe4YLRSRUhU7LfXx8XBxqovHazVIFDlC9s14b7RhopUmP12yBgTiLb3iisl5Efsjjx
 mtB+Y2DQnx1tklad9ba08gxRUNw+Y6fNDQIAc7JAh14e+3nGI66v61V6rkegTXS3nOn9
 d7ko5oLG4enhMNb4Bsn1a0FR08QR3rHbcy9M/TR3g2ypBHtulovQyYaM926xRq1iPeiI
 AUNA2Mp2vnJgSJSHCTBSKqI6uPc8graTh27EuCx3eFzA7BInAaXjGSagHJb4cPJ85WPR
 CHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kCTlagYfWgLEiXnsIz5tTMEmvqpOXp/IYE2XzsBlc6E=;
 b=6rMLODSu5t1EKmr+BmHsEkaGxdgzWhElUAwn+So2yxnhSQlN/UdEQmGXlC81n24eDF
 9ChI3FhLTPEIzdfqeGEFC/yPu/tCQeSmKawucyhQ9P19tbYp2HdBUQQUFURTKm5l+oIx
 Qu4+c+KnsIOfuXO6evXPRO7mZn0SeR/LerEmSprFlQdtAHOntvXx4y9he6ypL+CSnamF
 8XyEMKjSbG8Yfz/SSvs1OXUzs/7kLX2YXFy968R42g/lOP2IKxHuMwNNQQV3JGeWKoz3
 j+w/Bq7lb3mkrrvtEPOMf/I3ofRBFzceLR0lF6eJ7HsEfRg6X2MwZdPlnJQGqWqRpX7H
 ywGw==
X-Gm-Message-State: AO0yUKWaRuWAmjmeb6osDWvBCLftxIXkdd9tSRTbQbbWBvXmtoEsAQ01
 Y6JV1SAy3Ahb8CjnS08AI7I=
X-Received: by 2002:a05:6808:bcd:b0:37f:523e:1da6 with SMTP id
 o13-20020a0568080bcd00b0037f523e1da6mr2685885oik.11.1676629890314; 
 Fri, 17 Feb 2023 02:31:30 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 b65-20020aca3444000000b0037f879e46b9sm1602280oia.3.2023.02.17.02.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 02:31:29 -0800 (PST)
Message-ID: <8a573926-42d8-4e7f-7c8e-9c2b39e32bd7@gmail.com>
Date: Fri, 17 Feb 2023 07:31:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/5] spapr/ddw: Remove confuse return value in
 spapr_phb_get_free_liobn()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-3-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230216122524.67212-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1rfh757FWm1M



On 2/16/23 09:25, Philippe Mathieu-Daudé wrote:
> The '1' returned value isn't used because
> spapr_phb_get_free_liobn_cb() isn't called recursively
> (it is only called once in spapr_phb_get_free_liobn()).
> 
> The next commit will convert object_child_foreach()
> handlers to return a boolean indicating error.
> Remove this value to avoid confusion.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr_rtas_ddw.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 7ba11382bc..98f1310c6e 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -51,7 +51,6 @@ static int spapr_phb_get_free_liobn_cb(Object *child, void *opaque)
>       tcet = (SpaprTceTable *) object_dynamic_cast(child, TYPE_SPAPR_TCE_TABLE);
>       if (tcet && !tcet->nb_table) {
>           *(uint32_t *)opaque = tcet->liobn;
> -        return 1;
>       }
>       return 0;
>   }

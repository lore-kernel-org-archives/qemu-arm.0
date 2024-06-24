Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp446373njc;
        Mon, 24 Jun 2024 07:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3T2KJMwpMkBC5kFjoFNoSOJ63+WTwTZc1nAmxj3pSLn+yiFAOZYRkWRT2ZYLLAObhvMVkyBkrc7bq32CC8m45RoJCgfSO
X-Google-Smtp-Source: AGHT+IHN2qkl3hMAqtbRvU+4oGwr97I9tOlXbmGOFwMaja8j22cWGgidfzvAlMS6DwouYYiPogcV
X-Received: by 2002:a05:6122:4a1b:b0:4ec:f018:ee1e with SMTP id 71dfb90a1353d-4ef6a7394ebmr2708382e0c.12.1719239483072;
        Mon, 24 Jun 2024 07:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719239483; cv=none;
        d=google.com; s=arc-20160816;
        b=p4FcifyI9nG1KCCWqxPB3LyiUCCfYJg9g9Btsk06bEvD+Ak/N9ZcAZZTysSydr6O+l
         00m6xXy7cXms/WYWbSLR3zdK/oKdt6QkVTSbUQ/0ww6o2+xrDT4xwizrUE1/Hy3FdTi0
         grkQiIt9XBkhggfBGI1KTrDFoQTG2QHjYURM1prwPQiGDQTuokBa+5NTjdpD6v8OXaP3
         Z673O3rTWp0/xfAmT4WbPF5gJv8SebDBsGMJ2aqxBd+7kDvAzz2F9A8xR8u98P25PsKW
         cKKDnCXwPCjjfdxbA/AEGBMTG71vHbmW/rOYMK4PH0g40qR/ipIE3EgmWWqEDV/webJG
         h3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=h97R74bC8049p7vZmEF3CL3xOS8kcuBIAD3n6DJzrqU=;
        fh=zHVD9+77Ue0EM77bAINcJcJYtUyn0AokKotS6ukS/rA=;
        b=BblfxSTqMnQOOzNPd5YRLbvGoKgrBscqHS05DPOC27ymazPo00L0G5IB06lJlJ5jPK
         dJgs8wimwd8cXbbFDo6eaEdJMix+H1HsxbKgW4pCuM/sMbt/AYQmb7pg4HeWSgDZAWuB
         DLODRpST8i4OFr5iPDVUBYFpTp/tqhhzZ3TY2nYUVIW66y9Pi/f1OoyQ7l33Jpn1ehUt
         FNGnMhEO4rfUhnHQsx7OYJrrnLrBFEjh8qAuPDF8CLzXof/xVx2H4XReOpg79+cVnf8G
         rixhcK6DMJIxJ4dA/hJC8JroS7SBbxCrsJqFl7HyfEGsYFKVwA4ysYm5cAQGKnnFi9GS
         R2PQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4ef5877fda1si766006e0c.5.2024.06.24.07.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 07:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLkiw-00022R-Ma; Mon, 24 Jun 2024 10:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLkiv-00021y-9i; Mon, 24 Jun 2024 10:31:13 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLkir-0005Vn-LE; Mon, 24 Jun 2024 10:31:13 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W79PN0YL4z4wqM;
 Tue, 25 Jun 2024 00:31:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W79PJ2qsTz4wbp;
 Tue, 25 Jun 2024 00:31:00 +1000 (AEST)
Message-ID: <e246a4e5-fe45-423d-8986-88f75fe6799e@kaod.org>
Date: Mon, 24 Jun 2024 16:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
 <CAFEAcA8tTHusKOR7JhyU+wwA3JJWq1o5wVaNXugw2S9SjAsESw@mail.gmail.com>
 <b013bd79-c206-446e-b482-91eeb926c70a@kaod.org>
 <CAFEAcA_fWTUpfRvYjDDXnXBoFuiZZubzVaKDbgKpmsDr98uXtw@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_fWTUpfRvYjDDXnXBoFuiZZubzVaKDbgKpmsDr98uXtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=voaC=N2=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 92SqASTykYCN

On 6/24/24 4:01 PM, Peter Maydell wrote:
> On Mon, 24 Jun 2024 at 14:58, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 6/24/24 2:18 PM, Peter Maydell wrote:
>>> On Wed, 19 Jun 2024 at 10:35, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>>>>
>>>> Fix coverity defect: DIVIDE_BY_ZERO.
>>>>
>>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>>> ---
>>>>    hw/arm/aspeed_ast27x0.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
>>>> index b6876b4862..d14a46df6f 100644
>>>> --- a/hw/arm/aspeed_ast27x0.c
>>>> +++ b/hw/arm/aspeed_ast27x0.c
>>>> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>>>>        ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>>>>                                            &error_abort);
>>>>
>>>> +    if (!ram_size) {
>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                      "%s: ram_size is zero",  __func__);
>>>> +        return;
>>>> +    }
>>>> +
>>>
>>> Isn't this a QEMU bug rather than a guest error? The
>>> RAM size presumably should never be zero unless the board
>>> set the ram-size property on the SDMC incorrectly. So the
>>> SDMC device should check (and return an error from its realize
>>> method) that the ram-size property is valid,
>>
>> That's the case in aspeed_sdmc_set_ram_size() which is called from
>> the aspeed machine init routine when the ram size is set.
> 
> True, but if the property is never set at all then the
> struct field will be left at whatever value it had, which
> is 0, I think. So if that's not valid then it either needs
> to be a different default or else the realize method should
> complain that the property was never set.

Ah, yes, and the issue has been there for while. I will send a separate
patch for this.

Thanks,

C.




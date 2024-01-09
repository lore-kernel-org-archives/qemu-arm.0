Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp229932ejs;
        Mon, 8 Jan 2024 23:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAMUrm5vL7YMglXPueWC51OmSjo72AM8aFw7i4D9chY6O/au2TzjlFaXInvRk+FtOA0VIL
X-Received: by 2002:a05:6214:2589:b0:67f:5184:8e5c with SMTP id fq9-20020a056214258900b0067f51848e5cmr5778415qvb.10.1704785952670;
        Mon, 08 Jan 2024 23:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704785952; cv=none;
        d=google.com; s=arc-20160816;
        b=adRKAgxy9nQ+RYdmCC65N2cafdFP0ZwN7//MAthUbaMcysrDv6av/ggwMUuaNYFoAe
         sYJrfcwQ2cqhpi37TZadxxkB/2LsBMbmT/PhwqGjMRs5rxnlCNKSd+43oi8SE0YjjXen
         xqTdL406QzG9SyP6iCayq2mOekcwCAyUB0wpdaYqHi+Lp1THD97HOL1gvOnT7Au0mSZw
         SpaSvlkGULQje4bQmbLZCgfO2B7nscxSoMOscKnlDTZNoB0unEqC7CPrpV0EHADKAfH4
         CzBiVWjX9fMzk57lzrDcg/n0rREJ+mgX4fN6/T+QTKsc+RtHQBDtqF2v2TMhUGHtH0Er
         hXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=WKmBiQuWkgirno5G7g7BacL2Egwj25dyEoXRiurxKzg=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=w3jbVQ1GEwnjz+tup0F9vdDzmTWfvPZQDzDIxEVv4vKivyZnTTgED7zk4eZvbHyz0Q
         MA0VJCZ4uDPVlbaNZgBCCxxG2I8TVQQt3b+fLae8Lsqeobq+3CjJ+DucBed03gAKyLu6
         SoDEQwt1EuIwR2x5ZT5RBvRgNCxuD8xb3O14nJj1NN+v4QmH1m4PbDr2m3IkqPqlUXjX
         lphdHr8uti66qjjJG2EOal/FgAB2Zozpl1ynUC5A7U5QG7Ow+V1bbHi19/bu5m/DJIN/
         tbWiP/RzrIJ8PZMhloEdMXnZowM4vj6QNykEuStnlfcsyIYNzp2jcR6B55EtL1f26bZi
         bfNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a0cc549000000b0067ae55821adsi1696327qvi.243.2024.01.08.23.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 23:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rN6h9-000852-Go; Tue, 09 Jan 2024 02:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org>)
 id 1rN6h7-00084C-Ck; Tue, 09 Jan 2024 02:38:41 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org>)
 id 1rN6h2-0004nR-OU; Tue, 09 Jan 2024 02:38:39 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4T8N8G6Fdmz4wcg;
 Tue,  9 Jan 2024 18:38:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T8N8B6qDZz4wbQ;
 Tue,  9 Jan 2024 18:38:18 +1100 (AEDT)
Message-ID: <e09b5baa-8147-4450-a899-e015a9fd0f35@kaod.org>
Date: Tue, 9 Jan 2024 08:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v8 06/10] hw/fsi: Aspeed APB2OPB interface
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20231128235700.599584-1-ninad@linux.ibm.com>
 <20231128235700.599584-7-ninad@linux.ibm.com>
 <9139c58e-4a76-4b13-a1da-c1aafc37fad2@kaod.org>
 <c617be9c-c923-4228-81f6-bc492cc3edfe@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <c617be9c-c923-4228-81f6-bc492cc3edfe@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Tmhyjk8fSE5V

Hello Ninad,

>>> +static void fsi_aspeed_apb2opb_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>> +    AspeedAPB2OPBState *s = ASPEED_APB2OPB(dev);
>>> +    int i;
>>> +
>>> +    sysbus_init_irq(sbd, &s->irq);
>>> +
>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_apb2opb_ops, s,
>>> +                          TYPE_ASPEED_APB2OPB, 0x1000);
>>> +    sysbus_init_mmio(sbd, &s->iomem);
>>> +
>>> +    for (i = 0; i < ASPEED_FSI_NUM; i++) {
>>> +        if (!qdev_realize_and_unref(DEVICE(&s->fsi[i]), BUS(&s->opb[i]),
>>
>>
>> s->fsi[i] is not allocated. We should use qdev_realize instead.
> 
> I am not sure I understood this. FSIMasterState fsi[ASPEED_FSI_NUM]; is 
> inside structure AspeedAPB2OPBState so it must be allocated, right?

See the documentation :

   https://www.qemu.org/docs/master/devel/qdev-api.html#c.qdev_realize_and_unref

Thanks,

C.

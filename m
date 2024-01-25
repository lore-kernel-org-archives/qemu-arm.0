Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp670951ejq;
        Wed, 24 Jan 2024 18:16:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa1gvXWPXnUw451e4j1WvwcUJMqBeM0vombOARzV/Oe5/dCA0+LDgIYaVYuUHf4Yff9Euy
X-Received: by 2002:a05:6358:9101:b0:176:493f:ad4d with SMTP id q1-20020a056358910100b00176493fad4dmr351547rwq.10.1706149007597;
        Wed, 24 Jan 2024 18:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706149007; cv=none;
        d=google.com; s=arc-20160816;
        b=MNKWs6/J+dlaIsvqW52R5jaNScr2i2e1OZD7JU1uo+9H09rTAdrfnXGlyF+4nB1ngv
         ye+SqpspIq0bZzX0ZsvAvwE+YVe2g8V6kE/tKgokkYrhRDRauITaG2nlP6WaqSjP/m6V
         uWrq500Nl6JSvdKfqNg4XfRRzm0Bvb6MyeZRNO63cmyo0kD+nHCBQPDsn3uDQdUTEWcg
         PLHqKdsLOXmL15bRLHDdr+4NCQRBsgj2PTShVWxTtlpgDhi6RhFHRqR/rXMOnrst7KV9
         m3XkHsVGpG4mFMX5jtH7Rm/BHks/uT6Pb/cYsPzQ8J/h6sBDsvemoHn1CRG0bng5jVoo
         SODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6vpnNM+Osb1cuffLTQDX3yT+27FTgDEjj47KNyhUk4U=;
        fh=39N9WEP22ZX5RpcHhH9m770ca1Njks1d53douB51LrA=;
        b=dBD0ycPjwPz/XdgHiGsKsFshNIIlLyQG8z7yWtHblZbg6NPJc1iGs7xcDuGwhxDmKh
         Mek7Nl0dgBzG8bahnMOiroJmFPciY5zwR+F30DGfEOom67V1pzW/SwRkWBvebVowdoFF
         jhK2ECaLXYV2D7JYnP3H0XIYgdbs2iizIN7QxMJWCm1q0sOV2/q09yMjRG2FgLPsSZu1
         UeokvpPE6zLkFq26nmBEOwgYuT25aUoLMVgFGIhz1k1pjsuENcERlAHdDKJ+xHpEBlmw
         BuxXM5to1IUZWFiKP7NHtiGcjB9pJbjMYOqaju51PDP7SNlP8yB4EUCqmxS2dzEcEVoH
         58mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="P/S/B85H";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a0cb30d000000b0067f0540d19asi11818865qve.444.2024.01.24.18.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="P/S/B85H";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSpI5-00046o-Ir; Wed, 24 Jan 2024 21:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpI3-00046L-Rh
 for qemu-devel@nongnu.org; Wed, 24 Jan 2024 21:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpI2-0006J1-G4
 for qemu-devel@nongnu.org; Wed, 24 Jan 2024 21:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706148985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vpnNM+Osb1cuffLTQDX3yT+27FTgDEjj47KNyhUk4U=;
 b=P/S/B85HS4uTPpyz2Y3yaP1xvylBDEixruJCR0N/PS6lSejZdHLPJU2zh5x+T4ZvozZ0Wa
 a7Q2GleEUbVmiZqwC7wRNkZRbRm5kPNNnWk/hpR4UwsujvAhnZtYLjtziMHfQj6KDullfL
 Sn6rZ57IB8GCKPdWVMWlAKjFJXePzO4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-6mP7KqojPWyBUpvgBkKnMQ-1; Wed, 24 Jan 2024 21:16:24 -0500
X-MC-Unique: 6mP7KqojPWyBUpvgBkKnMQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6ddb83a5deeso1073366b3a.3
 for <qemu-devel@nongnu.org>; Wed, 24 Jan 2024 18:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706148983; x=1706753783;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6vpnNM+Osb1cuffLTQDX3yT+27FTgDEjj47KNyhUk4U=;
 b=Boe4eHKvK0DPBZt8KEVq/FGZvx1EHyx9192ojRRTIUshye1ZuaaqHD1IOkQ4qH5LVV
 V+KW/3SiHoOYNvEWLgM5BIpBmgu4tI5XQxidOTX/3PN3lOH4IpZvJVzKgsfhgHMWgRcB
 l/UeUqE0X1ABo9wYwBeYSdBqAoYvj/OEIhSeQh0rGM4zctCwOCZRIILnZpp7al/VcBB0
 HtrLW9jOPK0nMZmr0yPdaQ8z2znSNOXPZbnFUPS5Hu0HAE63uSa6xpZR8x//yKKBmQ7Z
 HmaEOlXGCn1gARlt3sLpMP4+kLY/uU03uAxXV4ljhaVPu1/4n1sW6mdSzbIuzsFakBs7
 E7gA==
X-Gm-Message-State: AOJu0YxeYQA1Fa3JVetX0uilgBxMmN3hwylYPeTdIBzVRWun2Mpb31HK
 iy0co2JXj4jzKVgVvdHb6Kaxgn4Z6l8VAWaAIsh3QbZp7rfQPqBmqfkIFyCS+KkQdAWWJ9G9gbL
 ECc0K1gkcJYZSC3OpVxb/Lq9bq+BOoTBV8KitiRZNuIg1yWarCyyoDVIOxXkD
X-Received: by 2002:a05:6a00:450a:b0:6db:d0f2:a3a7 with SMTP id
 cw10-20020a056a00450a00b006dbd0f2a3a7mr191780pfb.59.1706148982901; 
 Wed, 24 Jan 2024 18:16:22 -0800 (PST)
X-Received: by 2002:a05:6a00:450a:b0:6db:d0f2:a3a7 with SMTP id
 cw10-20020a056a00450a00b006dbd0f2a3a7mr191767pfb.59.1706148982709; 
 Wed, 24 Jan 2024 18:16:22 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 b19-20020aa78713000000b006ddc661a619sm423036pfo.7.2024.01.24.18.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:16:19 -0800 (PST)
Message-ID: <b217a233-6012-4877-9b0c-e20c6d58ed6e@redhat.com>
Date: Thu, 25 Jan 2024 12:16:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] hw/arm/vexpress: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-6-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123222508.13826-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QeTmc4iXYtYl

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU types.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/vexpress.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


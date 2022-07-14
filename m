Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp848132lfp;
        Thu, 14 Jul 2022 14:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvgTd6B7f3ln2XbPX0iWpbKEaOAxRx1LQ8CHLj6hFf7AuuhvEOyYDmrELRj8y/l7P0crFN
X-Received: by 2002:a0c:a9da:0:b0:473:9721:232e with SMTP id c26-20020a0ca9da000000b004739721232emr8235211qvb.118.1657833272431;
        Thu, 14 Jul 2022 14:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657833272; cv=none;
        d=google.com; s=arc-20160816;
        b=tUffwoTfCnuoVD4fc5/nY5G7mfC+4SLyrqXfSqmlSjA6abamDHHrMxx2p2WQzt5SdS
         wJM1Gv6mO/UQ5A67es+53OebUkhku3u1AV51sviH9nwA1eQ+Rm4h250kbwX5HMxAoPab
         czKdXkfOB8fqf+9xrqCwMbGvx/ElV0RzqTmobVCmTOgOpC72glH6XFQ7oK7yu5fe0VaF
         USZK1v4dx7t+s49audXZD23XK1O3X0vyrDv8/i9R6wKWPlOTLz7NMSo/dKQz1UhXlZS1
         V6F7yyyy5pq3AFTPFLR3GJrr6+ntIjudns8T0zVJ5DTqNFIHBedpsq2nFi7CWwLU1Kgm
         Semg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=BMAYEKoLOJnNWxOnE8jB32STvxOvxUvHOlez6K/QupU=;
        b=S2PgRQx7Xh5Xy5Z1a1Uto5e2AZz/7oDUtonBqRNAmCHUawefj8cT5d7kp6b/UTOpDD
         rRyYQY5ArJhZ03mcjaqfcruydWrrxzpCyEPnQroOi+ZN9sHWHS6bQF6yMfXa0qWF/bTs
         SSn/lZKV+7Za857QePHxcLpvaZUK5omcJe+jd3fj9TCq34z2spwy+qAnX84NUmmM5tfH
         rv1fKGEqiRj5Bq3V+sfzJlZzuHrkFTY56ngYAwA7YW1UN3Bxcka01EQR8IRYEzaTwxHL
         +ac/99RneEwUsn2Wc24CPs00boTu9shDHfdIjaX7JAerxUJvMQKo1V5apLHuEcQq5iFy
         JS+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=U5ym5iR3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a05622a009300b0031ec7a7e600si2091589qtw.625.2022.07.14.14.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 14:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=U5ym5iR3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC6AJ-0000kv-V5
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 17:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oC6A9-0000jX-RX; Thu, 14 Jul 2022 17:14:21 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:24915)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oC6A7-0001in-HF; Thu, 14 Jul 2022 17:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657833259; x=1689369259;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BMAYEKoLOJnNWxOnE8jB32STvxOvxUvHOlez6K/QupU=;
 b=U5ym5iR3WfSfWYLM3mFni+czqtOrJBYxXssWyueN/8O1B66b64pi91PD
 njS47tW/NiDppld247+aO+CwjxTJvmyREC23bPiCRXjzAfKBE7tjW0f18
 QIsf/QtkohoXaueHOWQ1STLwyEldUgsD54ilJ+1NxnyS1oYp6e0ShlwRz k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jul 2022 14:14:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 14:14:16 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 14:14:16 -0700
Received: from [10.110.110.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Jul
 2022 14:14:15 -0700
Subject: Re: [PATCH 2/3] hw/sensor: max31785 : add fan status, tach target,
 and tach input object properties
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
 <20220714015637.817066-3-quic_mkurapat@quicinc.com>
 <CAFEAcA9MZ-yNSY0c7MiXex1U-t3XNzQRUwXiMhJg84tYVMeyiA@mail.gmail.com>
From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Message-ID: <a285e9f6-9ae6-7abc-eedd-22ec1919ba99@quicinc.com>
Date: Thu, 14 Jul 2022 16:14:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9MZ-yNSY0c7MiXex1U-t3XNzQRUwXiMhJg84tYVMeyiA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_mkurapat@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A62l3zvRvN7x

Hello Peter,

Thank you for the review.  Please see my comments inline.

Thank you,

Mahesh

On 7/14/22 8:10 AM, Peter Maydell wrote:
> On Thu, 14 Jul 2022 at 14:04, Maheswara Kurapati
> <quic_mkurapat@quicinc.com> wrote:
>> This fix adds object properties for the FAN_COMMAND_1 (3Bh), STATUS_FANS_1_2 (81h),
>> READ_FAN_SPEED_1 (90h) registers for the MAX31785 instrumentation. An additional
>> property tach_margin_percent updates the tachs for a configured percent of
>> FAN_COMMAND_1 value.
>>
>> Register                property
>> --------------------------------------
>> FAN_COMMAND_1 (3Bh)     fan_target
>> STATUS_FANS_1_2 (81h)   status_fans_1_2
>> READ_FAN_SPEED_1 (90h)  fan_input
> This commit message is missing the rationale -- why do we need this?
The STATUS_FANS_1_2, and READ_FAN_SPEED_1 registers are read-only. I 
added these properties to simulate the error device faults.
>
> I am also not sure that we should be defining properties that are
> just straight 1:1 with the device registers. Compare the way we
> handle temperature-sensor values, where the property values are
> defined in a generic manner (same units representation) regardless
> of the underlying device and the device's property-set-get implementation
> then handles converting that to and from whatever internal implementation
> representation the device happens to use.
I am not sure I understood your comment.  I checked hw/sensors/tmp105.c, 
in which a "temperature" property is added for the tmp_input field in 
almost the similar way what I did, except that the registers in the 
MAX31785 are in direct format.
>
> thanks
> -- PMM

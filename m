Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp672460ejb;
        Thu, 16 Feb 2023 08:45:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/UWLYmEC7R60tlLeHUOFgaSo/RLUOB9LpKQR2XfzVJyUskGdrbqjRFI/e8I/DnX8Om3EQS
X-Received: by 2002:a05:6000:1864:b0:2c5:4ca3:d56c with SMTP id d4-20020a056000186400b002c54ca3d56cmr2736576wri.0.1676565945132;
        Thu, 16 Feb 2023 08:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676565945; cv=none;
        d=google.com; s=arc-20160816;
        b=rRTsDU3ybpgvFes+Dhj6cwTpj0Dyic7RzH+OipvtODb8OVj8qtVVqAkYQ3Gxto89Bm
         tQV3Pl+XM/8k8IrzGyxBBV/HVOm9C/NMsWx3l0/3W/LOyCpYEYeQAmtVFRS6kU7PgEnD
         RiIOzdc0QfOkp/8OUd2UPWsbqdrhd/ETRpOBhmMHWmkRWaU+RXtN1nOUmwFkQc+Bvnz/
         qe4C7mcDDWYF3cv/I1OaFPBRIs4RriG/9pxx141+oBL2Ma67KKam67FJSWVc7yE4xH3t
         axX5h/V+sv2Gd6sHFohALE3VY4eFlroxBKL/Cu+X1P88rfA60o2x6CEcZSSecAds0K9H
         gBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6jKBB5luktFpl6+1rcCPPHBjLthAo14aQ/BC6htff34=;
        b=0wX/AhBlRsbr7gMP33Nw0FxCj8D3rz0fK2+cMg/7h2xUcqJzR1IzlFrDjo6jdNW8pJ
         qv+ZJ9ZYkeYWeIXE4LNEeS9lDTSWLAJyaodDfRfy65lj9TvgYBWuixe4TV+FZ3e4M74o
         p8lEaD9fCDL5k8zqMMj1yJF8ieimrWfhCb95n07f/NpB2IifKT0m0aqakj0engA8Kca9
         Xd94WIlDp6uUi1X/q5aiUbEVU/+y0mGSc1puPbZ6BSbDs3T4pTcetnSoS0lu4bqtTW9C
         EI9RlK/OkNStb6ApYmpR89Cql2P5WJN1WYAREGBSLFwXQhWHVKJPcuLubhO5HeESxqzq
         uKRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cyAaudBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a5d534e000000b002c58f199a4esi1456245wrv.992.2023.02.16.08.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 08:45:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cyAaudBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pShNx-0006Dj-8L; Thu, 16 Feb 2023 11:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShNr-000682-CE
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:45:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShNp-0001Eo-78
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676565920;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jKBB5luktFpl6+1rcCPPHBjLthAo14aQ/BC6htff34=;
 b=cyAaudBQs2WYkEJD0saPQi32UI6ZYifdoTz1HXsQD3dYrEsrM5BAZgVn5LmGf/9MQDDCMa
 ccFka41FZJhjg1lrm8zphGKfHhmPPb5+Ea/iBNhKQTxaeNC0MXrg8rItCo5AsOMjxyxxrY
 Q/Siy82FsjTj3fGnUuAWL6Vs9MTKL6M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-UEUNEwiCPgmww0xVrxnAzA-1; Thu, 16 Feb 2023 11:45:19 -0500
X-MC-Unique: UEUNEwiCPgmww0xVrxnAzA-1
Received: by mail-qt1-f200.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so1535661qtb.1
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 08:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jKBB5luktFpl6+1rcCPPHBjLthAo14aQ/BC6htff34=;
 b=NqLJRXiWuSvgzAF79oM8fgV2mdu+QAOsYOUNtEGfGL9zBuRIXl81pRl6p/LCJU4/b1
 1KBL1w1Nb82Q2+Xwe05bFr/cq5AN1J/2j8abzj+1r9EX1QK0qfH1EvR3R3SWHtZPtDvN
 E+dYkO/BQIVeI/JQaPfCtYWV1N4o8SYeo6EeolHSvjjcDNewNnqAv0bK7EarzcksrAnB
 6/yfueH58R2+5p9TL8YBwnXOEknIngVUyPvdA6NLrZGyCe9MywJHC+WxtB/6fywA8OXR
 O6jI9nr3V4RV7qrkHrP6Aw+viHWjGtBahdUwEj8hMwKFPS2q6LmjKJxlTObes8dzGcAo
 UotA==
X-Gm-Message-State: AO0yUKXWyRJ8J0gcv3R4a8o8CE0Txh38Hm4barEmhj30DgsrfaQIEYFd
 Henx6+Vcg/FxjPacIUPFYB6igEgGe+dVJcB9ohOGcyZOGXKaDx2s8+ZjXc5p2PdHV/5eERMFMUR
 Pra3pg8g8GSyV
X-Received: by 2002:ac8:5a01:0:b0:3b9:b1eb:ad38 with SMTP id
 n1-20020ac85a01000000b003b9b1ebad38mr10699793qta.50.1676565918858; 
 Thu, 16 Feb 2023 08:45:18 -0800 (PST)
X-Received: by 2002:ac8:5a01:0:b0:3b9:b1eb:ad38 with SMTP id
 n1-20020ac85a01000000b003b9b1ebad38mr10699767qta.50.1676565918606; 
 Thu, 16 Feb 2023 08:45:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 18-20020a370312000000b0071b1fe18746sm1530786qkd.63.2023.02.16.08.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:45:17 -0800 (PST)
Message-ID: <5f49ca57-003d-132b-47c2-e6ead5e92ff3@redhat.com>
Date: Thu, 16 Feb 2023 17:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-5-smostafa@google.com>
 <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
 <Y+4ofnf3wWKenB7T@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+4ofnf3wWKenB7T@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qhJkgBQP67Iv



On 2/16/23 13:58, Mostafa Saleh wrote:
> On Wed, Feb 15, 2023 at 05:29:04PM +0100, Eric Auger wrote:
>>> The property added arm-smmuv3.stage can have 3 values:
>>> - "1": Stage-1 is only advertised.
>> Stage-1 only is advertised
> I will update it.
>
>>> - "2": Stage-2 is only advertised.
>>> - "all": Stage-1 + Stage-2 are supported, which is not implemented in
>>> this patch series.
>>>
>>> If not passed or an unsupported value is passed, it will default to
>>> stage-1.
>>>
>>> The property is not used in this patch as stage-2 has not been
>>> enabled yet.
>> Usually the user knob (ie. the property) is introduced at the last
>> stage, ie. at 16/16.
> I will split this commit, move the knobs to the end and keep features
> definition as it is used by other commits.
> I think it would also make sense to merge the knobs commit with last
> one([RFC PATCH 16/16] hw/arm/smmuv3: Enable stage-2 support).

OK!

Eric
>
>
> Thanks,
> Mostafa
>


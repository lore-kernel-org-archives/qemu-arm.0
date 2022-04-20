Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2999823lfk;
        Wed, 20 Apr 2022 02:51:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx66VNKChgUOaAifEz/gB+qhAxM41Lhhp1Oi1qPvYdbgRpaTMYNcNX6463rFLe5MfccdOxm
X-Received: by 2002:a05:622a:1207:b0:2f2:2b3:ab05 with SMTP id y7-20020a05622a120700b002f202b3ab05mr8091128qtx.374.1650448310725;
        Wed, 20 Apr 2022 02:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650448310; cv=none;
        d=google.com; s=arc-20160816;
        b=lfle+Eyn+83OeOLdnJTdUk7/A9RlT4/GoVUnMvJK8YClV/4N5dD37R4IfTlCzI7rCJ
         o72YUleDclJdZVk2N/i35DExn39bQQqdnQhnqMwkDz+a9M/MTI9Y+RJmfzoDT3q45ELL
         MqAXdWJ7aiwWTv3UOMI1t1uYVf79O74R3Wl6w5Ko64CRug6rnsXiD8WWz76qIhxwn0rQ
         CYl5yvFbWFj2NBqf2tDlOepT7ZKbw6oEr3VnYbo0HyMehqt5u94Q4WFhluAukx4vaMWS
         0pPiKjwd6I5yXXsnc+QrKnmQbLgEylPeB4wPLjAoBjzRbNa77baqQXg42R3M6fniH3Mi
         8c6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Xv8402LDxor12nVki9nmsAHMSsUKPlh+18vYXDWtsYU=;
        b=UY6TeJYd1FzLVAmmnb7VPaF2p755liBuSS5w5nIwiPFO4xRO1HaCzmbDGIeOFlzmTV
         /vijwpLbHvcXJ8b1TJg+F3cn2imp41HS71VSZv532bq+8m0YdROy6uj4PNa/3ootxzeC
         roqd9YVJwYWvibVEmLTHoI1n93xsh6uIjnmhsgchoJKz9wDzeRe17F8FVdnvxWjJJB5J
         02ztpN1XWhhIXO8F5xEGtM7Qp3zvaznnlwz7s2jDcnL/ZQo/V0tKqDSYCkLGnw47uJ3l
         cgjJRfVucWNljmLeO5jhcjP6NkDwvH8iYzpJRc4Eh8eki0HrqvVPsPBz0OSDQvYACui3
         ckkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rm33e0ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv7-20020a056214262700b0044b8110443esi93186qvb.552.2022.04.20.02.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 02:51:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rm33e0ug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh702-0000ru-7j
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 05:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh6yx-0008V3-Sz
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 05:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh6yw-00009m-98
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 05:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650448241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xv8402LDxor12nVki9nmsAHMSsUKPlh+18vYXDWtsYU=;
 b=Rm33e0ugfKVNteT+q0JMgrei+dR0qFLTPN6lOfVVp+91r7P0tRUUi7aBs6ETfcMXguOmvc
 ORTXjAvVV3FUs59BVSBXdvj5BwPHMERNPZskN9UcaYnZVax2sUvxiKDEfI2nGbuCGDaSs4
 wcQonYGd4CjyPXlCcrftdP0vCQcLaMY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-WPzQPC_FMVKKRaB3f3PsYw-1; Wed, 20 Apr 2022 05:50:38 -0400
X-MC-Unique: WPzQPC_FMVKKRaB3f3PsYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a12-20020a5d6cac000000b002079e81d09eso242496wra.4
 for <qemu-arm@nongnu.org>; Wed, 20 Apr 2022 02:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xv8402LDxor12nVki9nmsAHMSsUKPlh+18vYXDWtsYU=;
 b=RngdTmVhxQDzX6RLur6rgOiCrid8f9b0KrbyZ1jZU9M9tfU9SiMkLayYGemk1Dxabv
 zgIdX96IGiBTjXq9RQmDtjidEhG38aLIoCCQALT0NUyLFrMsxijlApGQxvXZGjaxUPDF
 yNE7AGZYOXbM/l/Tx6aGMYVoNV2T8axveAs/MN1LMOFtP7DvqxOA+IdyPWmI6fzz+G+k
 WThTEAOeMrbBx8V1CBI1Jo2rHt2qArsiKa/k4Sfqpy7lCCIY5cKRBrB6RqZJCPuy+GUT
 N4YdN3LS+nLH1fZ7QtZ7Dy/kMUgobMCAnlppoGnS0/Y28euCBXXvHzVzdDDlEbf1RVeT
 nenw==
X-Gm-Message-State: AOAM5324d3dMuoak7Hzmec+JLp7fUK17o0o2zlETKm0GmA1gBI43kE6+
 3SBXjJkA8t1AWUrhPs2p2poR6puy7ILN8xuN8OF1dTt8ENaIlgaiDltUHveDwhsM93jIrlC3B1V
 PtIFl6dgeoFIC
X-Received: by 2002:a05:6000:18f:b0:207:a3ea:4a42 with SMTP id
 p15-20020a056000018f00b00207a3ea4a42mr15188676wrx.147.1650448237144; 
 Wed, 20 Apr 2022 02:50:37 -0700 (PDT)
X-Received: by 2002:a05:6000:18f:b0:207:a3ea:4a42 with SMTP id
 p15-20020a056000018f00b00207a3ea4a42mr15188643wrx.147.1650448236751; 
 Wed, 20 Apr 2022 02:50:36 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a7bcb84000000b00389efb7a5b4sm21661700wmi.17.2022.04.20.02.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 02:50:36 -0700 (PDT)
Message-ID: <9cc22799-e9d3-5bbb-180e-39e83e50101a@redhat.com>
Date: Wed, 20 Apr 2022 11:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 3/3] tests/qtest: Add test for Aspeed HACE accumulative
 mode
To: Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220331074844.30065-1-steven_lee@aspeedtech.com>
 <20220331074844.30065-4-steven_lee@aspeedtech.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220331074844.30065-4-steven_lee@aspeedtech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1K601HWU2IJ1

On 31/03/2022 09.48, Steven Lee wrote:
> This add two addition test cases for accumulative mode under sg enabled.
> 
> The input vector was manually craft with "abc" + bit 1 + padding zeros + L.
> The padding length depends on algorithm, i.e. SHA512 (1024 bit),
> SHA256 (512 bit).
> 
> The result was calculated by command line sha512sum/sha256sum utilities
> without padding, i.e. only "abc" ascii text.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
>   1 file changed, 145 insertions(+)

Acked-by: Thomas Huth <thuth@redhat.com>


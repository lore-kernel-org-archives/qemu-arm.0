Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C29CAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 05:24:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4BnE-0001tA-SX; Thu, 02 Oct 2025 01:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v4BnC-0001rv-JY
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 01:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v4Bn0-0001yw-2Y
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 01:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759382607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I3hvp6ysHwiiYUbxCdh3ovQc529NQsMN4ZF14wv10+I=;
 b=idm7SIQzry00sGndB/FAWEjIaz5BpY/wdAxHaZaq/SHsS6pP7bDspED5GTmvtUuPaaom2s
 ijvAn8dWwLi9R+SvZ+l9ibpUCeeVRS+aAStFdE7NJeQ0/QRvGguMCTEa7IBrPDJl0KBsA0
 nJaTt/rA5fogF1zkXibn15vrk9evKVw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-XyinpvYjNgqRZhuWhAtrug-1; Thu, 02 Oct 2025 01:23:25 -0400
X-MC-Unique: XyinpvYjNgqRZhuWhAtrug-1
X-Mimecast-MFC-AGG-ID: XyinpvYjNgqRZhuWhAtrug_1759382604
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3ee888281c3so481983f8f.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 22:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759382604; x=1759987404;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3hvp6ysHwiiYUbxCdh3ovQc529NQsMN4ZF14wv10+I=;
 b=OSEN0mt1r7xaEpeHL55f3BMDcdHUp59j3KfYfRw+vgq0bgMoOSyABlz7SC6sLzwzZ7
 eqf9MIAMVUmUkvkxLx4LjobnHYkQGHxyJkJ8TjK859AOXWXjqO6+HMxhcoTIOcgaoy0w
 8Ua/yEnmB+0RC7oozRLsUEiSBJZm39LllZ6KJwDqRSwVTwUmmPEYADI5tjsLwS7lV3G6
 j/7khK7s3qwKGo1ACJ+OLh631n5KNIZu5BajCyRJIjSaH7YgyrFnSbKIVJal59j2DHV3
 BwmKPolwUIR/mQKkQnBVzzPb1koqRCR9n+CDpBEbMWjErjENRXB/Z9EiO1lZ9R1VIib7
 FDQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6dxjol34Wde1hBrYDlFTDk4uAgGnUrbXjtZJ5ws+yWR5h2w4196+Fi4RE6RQf5pBeoVBc74qXBg==@nongnu.org
X-Gm-Message-State: AOJu0YzJt7QU2T7iP4+AmE3RPi38or8dI6HyVxTMqcsh15dvQf3LYmoI
 y4oisJUa0mJZXcH6uecJr1sVWy7RnZhhlz0AkM+neJEoBPsEXzaICDlZW1bcxZzzbqKF1prmISZ
 frq26eJn6ew8KEK34blM69sbZh+Gg+Kl7VIDCa4debN7qCFO4dIC5rA==
X-Gm-Gg: ASbGncuTX+4TGxSSC2Gxq3os6kZ1xhqqjrOkXuSNADIMCKncoPldyM8GgRH1ev7fBK0
 YBV1xHQOJkK7jly6iuDX8YKymI2KgmEpiL51ybiwkHKUtW98KSGIiMSLmfwKJ//4uaHq8CrfpGF
 hwnj3iJ1R88ygSyp/aws0J0nXmlomZf6v1rF4riN8SgZdvDQtMg/z2xLrHyI9wvBckSPZXUAiEd
 qhau4NRSEXboVTDXExW9mEQY7kDFfqovVDWH07WfW5c9mZ4Zn8t4/p32Qzb5RAmzgZiUV4yXPE4
 ShIcjOf7Cuw/nOE/UrfJbuOK5TUYPJ0TqAp3VWmceB7CdZTpgTvbdtb9JD3tswxkrOaUH0I4vY5
 1E+NCDlhKvA==
X-Received: by 2002:a05:6000:2204:b0:411:3c14:3a97 with SMTP id
 ffacd0b85a97d-425578196f0mr4202144f8f.51.1759382604539; 
 Wed, 01 Oct 2025 22:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPy5NoCv5Eb49drYn8yC9MU3N8g2sFdNuX8ViGkn0soWFb8BoFuOt6D2R7Ljm9wzW0kfUt3Q==
X-Received: by 2002:a05:6000:2204:b0:411:3c14:3a97 with SMTP id
 ffacd0b85a97d-425578196f0mr4202131f8f.51.1759382604116; 
 Wed, 01 Oct 2025 22:23:24 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f0170sm1944416f8f.49.2025.10.01.22.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 22:23:23 -0700 (PDT)
Message-ID: <6aa88a56-e9e1-474c-b23f-49022de88471@redhat.com>
Date: Thu, 2 Oct 2025 07:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] tests/lcitool: bump custom runner packages to Ubuntu
 24.04
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
 <20251001170947.2769296-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251001170947.2769296-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KKfGUZsESX5KuSJpBtSMT74597IfL4_K45bAPN7Gy6E_1759382604
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.518,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 01/10/2025 19.09, Alex Bennée wrote:
> In anticipation of new runners lets move to a newer Ubuntu LTS.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/ci/setup/gitlab-runner.yml                   |  2 +-
>   scripts/ci/setup/ubuntu/build-environment.yml        | 12 ++++++------
>   ...tu-2204-aarch64.yaml => ubuntu-2404-aarch64.yaml} |  4 +++-
>   ...ubuntu-2204-s390x.yaml => ubuntu-2404-s390x.yaml} |  4 +++-
>   tests/lcitool/refresh                                |  4 ++--
>   5 files changed, 15 insertions(+), 11 deletions(-)
>   rename scripts/ci/setup/ubuntu/{ubuntu-2204-aarch64.yaml => ubuntu-2404-aarch64.yaml} (96%)
>   rename scripts/ci/setup/ubuntu/{ubuntu-2204-s390x.yaml => ubuntu-2404-s390x.yaml} (96%)

Reviewed-by: Thomas Huth <thuth@redhat.com>



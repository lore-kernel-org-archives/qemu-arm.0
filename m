Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FFBFF885A
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Apr 2026 06:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGWiH-0004Tb-TS; Sat, 25 Apr 2026 02:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wGWiE-0004Sw-PO
 for qemu-arm@nongnu.org; Sat, 25 Apr 2026 02:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wGWiC-00039L-Jx
 for qemu-arm@nongnu.org; Sat, 25 Apr 2026 02:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777099315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q+e64NFmAD68oggXK6Te0WPNk6cwZLiisHVj9/F8tDw=;
 b=be6loxnTQs8VSLcEKeVczaVKi/MgCU88RchlZHf/1bei3FbhWUXXBex8U9CbHV+9OTcYCf
 DWcKfGS8HWa/LAirAVnzTVb5W+ahmjkhxrCRfH3gCcpJ50IXuhhpQ8ABYsUQJbJtE1Nniv
 Mt4Ui7+asrlJVWclsP5O7j0/SRZ8QpM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-QnEXaDnkNUu8MHnMPdbS6Q-1; Sat, 25 Apr 2026 02:41:53 -0400
X-MC-Unique: QnEXaDnkNUu8MHnMPdbS6Q-1
X-Mimecast-MFC-AGG-ID: QnEXaDnkNUu8MHnMPdbS6Q_1777099312
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4411a529bc0so4842296f8f.0
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 23:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777099312; x=1777704112;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+e64NFmAD68oggXK6Te0WPNk6cwZLiisHVj9/F8tDw=;
 b=deTfox8QTwm2qfyi4eBQe4AYkRxa2EDMzBg+kt0n8UW5Sy6t1Ow1mqZsGVjquVOJjQ
 pLvjEVn6BVbEuBg/RqOtAmo9+FCB1KYTPvPm3G0OF+ThHW6IK0E/OmP1kOoyL2TLQJxg
 /p3QVKKVd3BFQuWnmqR1/e56XX4xai8Ua0sYqmscnRuWx/p+J6sMPtJMMSeb8PeYdDde
 7/fp3tHUGKXThJrq9Hoa23Hqdsvum1wLc9SxIyuRGl11xy8USCudPqpnV3LW/2Z03dEc
 Xh2ZBa1Q9hJVGYj6lDbkR1H25Vdm+VGCl3aAQOLXIESD+WgTygloCIQyAhRlMLqIDSQp
 bEcA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DfuHYrsNW7pnOJuUJM7WjcHmE8A7Dy6HzK0KEQcjiiMYe79Uz70ljTAOUC7j0QxsPQteVIx/sSA==@nongnu.org
X-Gm-Message-State: AOJu0YyfVIr9V1vZtPj3t75VimXqeiI0lJADp/1gEhR1aLtgJbxZLMlE
 fEJCB+Gl+bWX2QDD+ef12tbXc+NhVSrM5ywtThP+HHmh8NcUMrbanyxk0ABO7E+fJO2V270T0gr
 zuJqJPVu6ly8XslvOW0TOhim1ZMFXrbrAUHONyQYTSusaD8f2uTLM/g==
X-Gm-Gg: AeBDieusb2RnQ929AtK0u1sEuQJtsjorHSCDMbjYNvJvqjGrfVZ54ZDlk2q53wEKqMx
 H9ulL6LZKey0XaLZPdBLTNTFfbdFcnYGmTRIV6gkCv7Cn4IjIjpd688egS5OiOAmZSqGbSC9snj
 zuVKo+OUk2erjLOcsKBIePs6bWNkFDc45+nYAP/167iPnM3Vs6okeAjJUEPz+UK6g5DdN6bNuTS
 fPGujRuG1cMMJqIqOItCeFzd8jNLTDmfWUcKbgrm0cn9yeWfGyunZ5ZFoJXFYyoXFnqfUnVtSbY
 mUm6871wMjAEpuQUVkZltfTSQYf7gqrW2GoHrA+m5lOk6rf+kz8Ht0RLBsKb47skit9aS/ZIoAe
 urxNqUbHfxk3Ia8a5AYpDTCOR3nsqyw==
X-Received: by 2002:a05:600c:26d5:b0:489:1c1f:35df with SMTP id
 5b1f17b1804b1-4891c1f3715mr227971795e9.10.1777099311889; 
 Fri, 24 Apr 2026 23:41:51 -0700 (PDT)
X-Received: by 2002:a05:600c:26d5:b0:489:1c1f:35df with SMTP id
 5b1f17b1804b1-4891c1f3715mr227971605e9.10.1777099311442; 
 Fri, 24 Apr 2026 23:41:51 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.147])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc10777csm723077695e9.8.2026.04.24.23.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 23:41:50 -0700 (PDT)
Message-ID: <b39b576f-e0d6-43e2-aa72-18ca53d0cb1d@redhat.com>
Date: Sat, 25 Apr 2026 08:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/core/register: add register_array_get_owner
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Frederic Konrad <frederic.konrad@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org
References: <20260424155646.533334-1-luc.michel@amd.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260424155646.533334-1-luc.michel@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZsuQahxt4jzLlJGGiXUugierK73jjE-gP1bevJVBmYQ_1777099312
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 24/04/2026 17.56, Luc Michel wrote:
> Add the register_array_get_owner function to the register API. This
> function can be used to retrieve the device owning the given
> RegisterInfoArray.
> 
> This was previously done inline by some devices.
> 5c6367bc1c8850f74812eeaaf87cff9911be58de modified the way register
> blocks are created and parented to the device. Since this is an
> implementation detail of the register API, it makes sense to have a
> function for this.
> 
> Use it in the Versal OSPI and Versal/ZynqMP eFuse models instead of
> tinkering with the API internals.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3421
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3422
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3423
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   include/hw/core/register.h        | 11 +++++++++++
>   hw/core/register.c                |  5 +++++
>   hw/nvram/xlnx-versal-efuse-ctrl.c |  4 ++--
>   hw/nvram/xlnx-zynqmp-efuse.c      |  4 ++--
>   hw/ssi/xlnx-versal-ospi.c         | 10 +++-------
>   5 files changed, 23 insertions(+), 11 deletions(-)

Thanks for the fix!

Tested-by: Thomas Huth <thuth@redhat.com>



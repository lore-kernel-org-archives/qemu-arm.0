Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp60430njb;
        Wed, 4 Sep 2024 03:04:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhXmHDIk9icZxATlNho5OtCeRCo1btNl/QCW/rLfPulDqqrc2IhKkqfSjwWT2lEWQYzTjWhJMXwaiYww==@linaro.org
X-Google-Smtp-Source: AGHT+IFLPrY5z972AlOkFOvZ5p5IYUXRUaDD6IavAy+taMZk1ECr4UG94mDRQE6uRQZfXmdvHErX
X-Received: by 2002:a05:6808:3985:b0:3df:3c05:ebb with SMTP id 5614622812f47-3df3c05196amr12872177b6e.21.1725444293780;
        Wed, 04 Sep 2024 03:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725444293; cv=none;
        d=google.com; s=arc-20160816;
        b=mBqS03VODD/Jrf4pS+h62aO61xh0NchzzrE1d1Z/5XOcmYkipgzRbS6SOZjmUknmUt
         /s5khEHSUdmHl6U0B7V6BhCPbZm84pG2SKfBIjrnxW6nm5nu2OMBif6Sx1sOno56hbYz
         lhHpuOXGRxRuqKKMZaV1lYxMQ9qthOI7tnOa0RN89L5L+cCxoEzdorIAC4YHWX/ldZ+O
         IL/jlnzJvslJhcB9wcxdB3BBKSCzCmFdeT1zZmAmFgQWCS9nrQqJlGpEUiJGQuJmZLVY
         XfK5JWMGEUi1PmS87JFaxlmJv9sg7vN9daczJIQJTarPSXIg5KaqxqfpzsMhlH5TA413
         fn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Jjzop/srvHm0h25kmQhlzo0tw4k5Y3gFI8C0it+8WQM=;
        fh=T5vxTjlyL5TMupTAsvO8+kFhD9KBQquvkH6OVmv1cE0=;
        b=dJPm52rFPvGpHAC74Radd75d8tnm+v3ho5x7LDGxZCpQi199A1AJlG9OcNfoNoP0xl
         dQBhqjPs8P+FfSxymqmrp/2GgusF5lbgzz4kjiSn+UESyuiW6vwGp/Uo6pfamM/vcKzZ
         cqwr1iASJDqKcnsmmMySfZFf5RUrT1+nA1jdewPE2JYwFqd+WPIeCdaMyM+Kfqrla3VK
         j2k9SrHUVnXN1uvQcFyDWPhpR9aTRqzPFw3nHHYnS4+TGLccBqb+pPRppdk1RmHZayOm
         eTHinaf/UxW/mAuA4zDJW/FTw175DpyfDeJf99Vait8nF32xi5ajteWZTLsKO212i4R9
         6lBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ES7ccjbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d450b4si148527151cf.324.2024.09.04.03.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ES7ccjbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmsC-0000zV-Vg; Wed, 04 Sep 2024 06:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmsA-0000uL-2M
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slms6-000699-Ev
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725444257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Jjzop/srvHm0h25kmQhlzo0tw4k5Y3gFI8C0it+8WQM=;
 b=ES7ccjbEto0rn/dQh0FF0yMgibMyBEUMz3Pp+T8s++Io8BGY2Zzj17lPwIQ+c4nnTg/Nbj
 RuEuyRSVio0ZFp43rqCTmQXrMVIMRzpBCuL772cFwVc8loFOzsa3A5M4kCtdTTTx6HYmzf
 8rbWfIFxZgAFHTjaxQ5Kb8MrbTA85Rk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-yCXGa3IPPOurrY_KU0rv1w-1; Wed, 04 Sep 2024 06:04:15 -0400
X-MC-Unique: yCXGa3IPPOurrY_KU0rv1w-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3de10cb25a9so7285311b6e.2
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 03:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444255; x=1726049055;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jjzop/srvHm0h25kmQhlzo0tw4k5Y3gFI8C0it+8WQM=;
 b=qU+ODABXMFxH4iggJ2vqqO2CgEiYC5yHOnTYB1tnWNYqmblfwTxgMLDptY2FR2ry9g
 Nl0xLjF0/GfbK6fr1/ajUY9M88Vbk1EE8eDszfYca7z4l7Tk1oitP9gGmLvEcOtHwZa0
 hMF7tTyHrQZHyyal43JppmMOt5YiPRLBj4khsCeFrAwlB5rUsEVKWZpG26grvdj6oqg3
 iHpv0Jgq7PveSjn3OqAFe3w2HR7+e66S+AMEJPruitYYi2TmrFtWqv8Hx/v8qyGDth6H
 13e8P1sJ8bj4fd3PH0fGBpgatPbVYyMG3EbvIsT9+xjvu5Z6dDjg+Wr8ZJAJ18FLEZOz
 3deg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAWWHOJgOusERg12W5FGtvV1E8kbT+8BUrXRFv/svt1EUhOM4qT8PsP2eIrNdbhOneI2Z5NN/7lA==@nongnu.org
X-Gm-Message-State: AOJu0Ywgq172jYT9DsMa8MBxubWvPLSaZZ7piifVX8Z3aHHAobi6PEwC
 bHs1bCYj4X2EW7pjxUN/waTP5pzpGA3AQd4cYAfsV4wRBSb1LdgbCixfWTcHdGLn2We9hSYsIO0
 em2rrWDrbKiqkqQktSlwehss42TJizcxv1Us47rUug55/EtSHCw==
X-Received: by 2002:a05:6808:11c1:b0:3db:331:9d41 with SMTP id
 5614622812f47-3df2211090emr13707767b6e.23.1725444255187; 
 Wed, 04 Sep 2024 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:6808:11c1:b0:3db:331:9d41 with SMTP id
 5614622812f47-3df2211090emr13707735b6e.23.1725444254809; 
 Wed, 04 Sep 2024 03:04:14 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45682c99509sm57395581cf.24.2024.09.04.03.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:04:14 -0700 (PDT)
Message-ID: <b5330a1d-3a52-4894-93ce-99508788a901@redhat.com>
Date: Wed, 4 Sep 2024 12:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 30/53] hw/rtc: Remove twl92230 device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-31-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-31-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iIpou8uY26Oz

On 03/09/2024 18.07, Peter Maydell wrote:
> Remove the TWL92230 RTC device, which was used only by the n800 and n810.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS        |   1 -
>   hw/rtc/twl92230.c  | 882 ---------------------------------------------
>   hw/rtc/Kconfig     |   4 -
>   hw/rtc/meson.build |   1 -
>   4 files changed, 888 deletions(-)
>   delete mode 100644 hw/rtc/twl92230.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


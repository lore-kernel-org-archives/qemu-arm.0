Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp794915lfk;
        Wed, 9 Feb 2022 04:54:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwj+Hi17aP7x2e7Og57tHKCLQf9bMqX9KBGM6nX3jeqFZME18Iokbff/ld8MiFekl6J1wsU
X-Received: by 2002:a81:aa4c:: with SMTP id z12mr1743498ywk.446.1644411288256;
        Wed, 09 Feb 2022 04:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644411288; cv=none;
        d=google.com; s=arc-20160816;
        b=sht1oMUjHysRaharcgTFzylRJnU8EwWkqcw5joa5MLZdfQOWUPWAdidnDLu6eE+FTf
         Fg4nwoaDchhTFjIlUNIk0iCB+lV6iRxixsFiYqtrVQcC3V3Wql1m/5Ls8wcMiHQ4oE3W
         9Bz5Rnni4uyJdyKKTj8T/OziQBw7ku8y+/2mU4/pDnskd/oS2PXegcG+145nzSbTpAf0
         aNdnPKUViV1TaaNQmxfyVgVCNe/CTrEPjmg7OE2oIzdsGAilA+JsE+bKV0AVk5uhNNn+
         y7ZnE5ql1y4XSsHsctEBIvh/lNg1KMBYikZp3i1V1+JRGtfwOCpCrxcBtLT+3BSd1AQB
         FSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=cwlYwIfAODLg9KoB/EI4oYvRtIqj/s5OxKf7vNDzgNQ=;
        b=GcGh/6MYfah6QJBtGsMwNy+AR9t/ObO0whgK5qaygNSPoAHhcLGys8mdHc2dSMvTM8
         vohAg//gbYVWKLvjnMrECVtGRXculVTGUy4YhfVEDVrnFotZxCZx5tkt10VuwdxnoT5W
         ZqRfM0oPzX09NsIXxBwEJg/yYGjHVgydpgkKrSr9Yc0UX9UUPJ4NCEehfWiurZCPzNgN
         DKlfo9DSgqMnEBmlXyQMAcs/xzx5+b9YFgVJcB7nz4MONYCg9BT3dStzbNFiwjAXrXtv
         cnr4dRkY3/kFV0eNMUcu3H8jO4dXLgpsIsSomuvxSIgYwgK6Q3mvW1GmIGPyWlsiBbC/
         6E7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si10644826ybt.584.2022.02.09.04.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Feb 2022 04:54:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHmUh-0003VD-M5
	for alex.bennee@linaro.org; Wed, 09 Feb 2022 07:54:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHmQ8-0002jx-8U; Wed, 09 Feb 2022 07:50:04 -0500
Received: from mail.csgraf.de ([85.25.223.15]:35102 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHmQ6-0001d9-3t; Wed, 09 Feb 2022 07:50:03 -0500
Received: from [192.168.106.118]
 (dynamic-095-115-119-071.95.115.pool.telefonica.de [95.115.119.71])
 by csgraf.de (Postfix) with ESMTPSA id 26DCC60806B1;
 Wed,  9 Feb 2022 13:50:00 +0100 (CET)
Message-ID: <a3c45c0a-83be-57c5-cab0-98ffdaef00cb@csgraf.de>
Date: Wed, 9 Feb 2022 13:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 0/6] target/arm: -cpu host/max KVM and HVF fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPR8GNoMqJT9


On 04.02.22 17:55, Peter Maydell wrote:
> This patchset fixes various minor bugs in KVM and HVF
> -cpu host and -cpu max:
>
> (1) KVM -cpu max was incorrectly adding a 'sve-max-vq' property
> that wouldn't work and which doesn't exist in KVM -cpu host
>
> (2) HVF -cpu max was using all the TCG ID fields and thus
> promising the guest more than the host CPU can actually do
>
> (3) HVF -cpu host wasn't setting up the PAuth properties, so
> it defaulted to not telling the guest about PAuth support
>
> This series fixes (1) by moving the '-cpu host' code to
> cpu64.c since it's aarch64-specific anyway, which lets us
> reuse it from the '-cpu max' init function. It fixes
> (2) and (3) mostly by making HVF use the same bits of code
> that KVM does for -cpu max and PAuth.


Reviewed-by: Alexander Graf <agraf@csgraf.de>


Alex



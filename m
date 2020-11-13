Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1264820lfb;
        Fri, 13 Nov 2020 03:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7dx5BxDKeaBShU0blkRff4lQe/NKscci+tGx2wVjhwBdJxVVYzTGhJ5yJvC6uBNp+G2Yx
X-Received: by 2002:a25:d049:: with SMTP id h70mr1960138ybg.190.1605266303885;
        Fri, 13 Nov 2020 03:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605266303; cv=none;
        d=google.com; s=arc-20160816;
        b=y+b+mtT8l+Mj8031b7F02Vdvws1WhtFH4aighvDbNd/R7DM923RXVfWpano9HKFQoK
         dDD45pxqj2xIoYc8qCDSmJRp9O/Ykpmj0uyaVd12G8belNGKHA+DelSwDXJ6JpB8zrqL
         yHfMEEQ04YaLhttsETk+qorcqsK2VFRtGxNwp3yhjJqTWM2a8e3Ol3CMlRyFZNNViSGC
         IANoZ9+sOgYeGLjRMt2BLmkyTv/3FUqdkN3dqn4bjXtSoWfQ1CsRYuAeRV5zOaavzjkH
         USaFcuB9uom34MS8JUcDV6MyjimrjdCG4/zKwgcr9eCLp04llRcm/XZpXA/Nya6GXxIs
         szeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XTWw0Ele00oDA94ovqRiyW7RimoqODaWzCRNHen2pSw=;
        b=EElQ9kt9AobDiAVS0DEC70wc1BMmlVYzC8PPc6VCYtyHLpuHO/CS28xOclas4ZkX81
         9SUo/Q54VP18sLXu4whz3gAqmji2spzeIRLCtHSIODJiP9Kz12kJn55VkW5hHKre+sXK
         Cp3soP9aREj5BRpGqBqanf/wYh5sbpk3/EyH8QeK04unr+SUBpLRQ67TdRcqa0ciQwDs
         j1+41ios3QcdH9QWSkpAKfoIb32Xlw8vHi3vbpHuHTOnk7kLutpMpMo5X1KDSoRMBUb0
         YPqACuFlNekTCor1obrQG1lKzntyWEhwDcKYb8K9Zq1ZHfUSZQkI/iIqMC3WOH+Oj42b
         hN8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q4os47LM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si4560793ybk.123.2020.11.13.03.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 03:18:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q4os47LM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdX5z-0003nd-9w
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 06:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdX5i-0003ln-2W
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 06:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdX5c-0000qC-3Q
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 06:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605266278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTWw0Ele00oDA94ovqRiyW7RimoqODaWzCRNHen2pSw=;
 b=Q4os47LMJz5zyxAxgEms/dBbgD7UM6qXSz03e67b7YwpiWb0FC9uUHu/CPpDUkbNOSp5l2
 OyyVMqIAHBC+FCVx50Y/9D5lfGhbyktcP6VbWNOAY2QQ3LgG9Zbf2Tv7oAXvRaII1it/wi
 JYOheW/1V6lNHiO4NI4yhIPnLpU7m+M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-bx5RXND5MeS8SNZ638h_Pg-1; Fri, 13 Nov 2020 06:17:57 -0500
X-MC-Unique: bx5RXND5MeS8SNZ638h_Pg-1
Received: by mail-wr1-f71.google.com with SMTP id h11so3626172wrq.20
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 03:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XTWw0Ele00oDA94ovqRiyW7RimoqODaWzCRNHen2pSw=;
 b=erRJct1FOdanCmbC1GtilhWU2cJYmKjBW0JkBr0VM6GGLk4DFFyJOFLxcqweZC69kM
 PHFibUhosbkm/2zmha7fUSsg4nBLo04OZrRpDda5A8sBoLJn8HBHNou/y0Ix8WToBU43
 9R5MmqDvsJM5pFeFc7J2jqcx6YsUi/clIZor+IS8gF2MAEfR2GUGLiMjts78pqQLYcTV
 d03JYJ8YYNndmWvvXHcGc14v8xHgX4mgTF2sWWB18eOfu5x+EtK6ye9G9y6KNg2aTJ3T
 w4rG6k2H7gzWuSu/epLxRv0ivVZbv/bRiHRD12P1XJ2Yp9HNGQImDDW2uZdhVU3pfpF+
 h2DQ==
X-Gm-Message-State: AOAM5305I7FCE7wPuM94aM3WHwsQBUGG9FanEA7o/d9Mqd0wB1PPrOZd
 7hiKYj3VGJAvL9PvI2/knaFYQhT21eezHt8i3nhLpBgp5y18pUFQb2UqH2nZamiCl2eOKDous0d
 lQX+fVlkM04Wxu8q0zNXmEcUZuFsxHUi0LmX/4lBwdMfn+W0tfq/KIRYX77KBo/L3
X-Received: by 2002:adf:fa82:: with SMTP id h2mr2814264wrr.24.1605266275630;
 Fri, 13 Nov 2020 03:17:55 -0800 (PST)
X-Received: by 2002:adf:fa82:: with SMTP id h2mr2814236wrr.24.1605266275338;
 Fri, 13 Nov 2020 03:17:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t13sm11073965wru.67.2020.11.13.03.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 03:17:54 -0800 (PST)
Subject: Re: [PATCH v2 006/122] m68k: do not use ram_size global
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201113101704.1438368-1-pbonzini@redhat.com>
 <20201113101704.1438368-6-pbonzini@redhat.com>
 <38677358-6eeb-830b-6248-343267eddc8a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5b0d7a6d-0e17-527d-9b25-a1dd9cbad062@redhat.com>
Date: Fri, 13 Nov 2020 12:17:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <38677358-6eeb-830b-6248-343267eddc8a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bym4HcKcVyoI

On 13/11/20 11:44, Thomas Huth wrote:
> On 13/11/2020 11.15, Paolo Bonzini wrote:
>> Use the machine properties instead.
>>
>> Cc: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks -- of course this was just an unintentional send, but I'll note 
your Reviewed-by nevertheless.

Paolo

> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


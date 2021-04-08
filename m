Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp543111lfr;
        Thu, 8 Apr 2021 07:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/cMBd3Qwlocng3eUeUZZq574scZV79tabO37aVnKWOQM+ukeW9ttPCcxcfG16gXhGtUSM
X-Received: by 2002:a05:6e02:501:: with SMTP id d1mr95769ils.76.1617893630117;
        Thu, 08 Apr 2021 07:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617893630; cv=none;
        d=google.com; s=arc-20160816;
        b=tg9bQ43K+iNjTKZMqNI+t16nAkkAFHAXRdNDf+YdoqDaPGhPPSA9GzC6GSLNMRybpf
         6Gp5OCw4+py79s8AvEkzSK/3Fa5NonvvAdJ+vyI7NqnN/LY38kJm9RHApdxLSECJgSwT
         5kpK4TJZc4fEv66VZs85B1OohEutXq9+tChnGP3PucH0w2brJH/I63g7H6vxvRuNmIRV
         Jd9XHsn56aY9zibgWpo0k1PP/Wou1Djl3aPLtNkqIAcZoUtxvoU4XNYRViRx9JMGhqgP
         WIICjfJZBo83YN3AcxhM4VxNjeMyTtCLLRDspXt+hqfeNlRnbvmZmoN/y82MOfrH2Vza
         j4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
        b=iAMrnr0cYd4xdJ9B7TfM5riVUwJPNBjVm5SEOZce4V00rd6IMBedkYnqjjPWCzjZym
         CfGo5hSLCXpg/eh2BIu2a77bGS4T88H7ba/j7m61dGCxMHT4exb5smMjEncl9K9OXz2u
         eCt4W3h5nRZbD/PMt/LXTqFpGh713l5ZUUJT1RFLxAtAfakFgiD84Vy18bq0Tnb5dmad
         C3F7CuPLsoZf0Dse3NbrHQvZAMODJPI2SzBJkDiPfvD//1NO+G2QG4nzAzqjMHcHDw77
         5gPo7fWUS10U7xmyPxSeLG7tTttjGy3r0Gg5Xak5zW0b0RmX2orLDJMILFuEYk5RBxBq
         Y4jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fWB4KyCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si22290851ilv.96.2021.04.08.07.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 07:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fWB4KyCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUW2X-0000cP-CV
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 10:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUW2G-0000NV-QD
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 10:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUW2E-0000Zq-V3
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 10:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617893610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
 b=fWB4KyCGXXcoLTGSZz2nkOtQZ8Wn8ZIfZQ5N3TbJ6UA8V0pRNQ2oI+9aDbv92H7sQb/DiD
 EXXte/4rfNGuo9h+AvZzNihogs9kTIxqpa8iw3g63dLVsZGGMrX48/w3hGMB+t0CJMf7qB
 c68gH2q/XMT9dA3aq0HNgaTeF6XJzj8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-ce4PpQ7BPByXBROVArxX4w-1; Thu, 08 Apr 2021 10:53:26 -0400
X-MC-Unique: ce4PpQ7BPByXBROVArxX4w-1
Received: by mail-ed1-f69.google.com with SMTP id bo11so1148015edb.21
 for <qemu-arm@nongnu.org>; Thu, 08 Apr 2021 07:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
 b=ccvHy5I1KcNUnRxn5cXFmr0Q64mdGWyzzxlbIOY57w1fVJXoO0xZlztX6ZrC0chmw4
 ROFXs+C8pxkuBlhBReTPxHg8pC9Y4cQMFx/WHbNh6A1+oqsMcUDQe3SKSqp/CLIAr2xk
 4JrCDGJ/X8AicY1z/a5l4EJ3qhY748CGlFePbvZl230930AhOtibvuXUxQUrhkD3ARH6
 1Q5V7AYf8sGVuWAXWc4fFmd5EjDv36ugWk2Mq533mk8v5AroPs02CKVQ6mT0VzwDoFsW
 6sfBo0PEXSNwLIEJ0r5VU2OujU0pBXQvOZNoEY5L2Lw7qHjnwnsz3CTeia8rT9ll6cKF
 qJSg==
X-Gm-Message-State: AOAM531Zb96OXnWEBO1zaDblPdMe+QfeLulQjIUfOog3nyptsR8ysvZV
 79Mx9NbsDXJjDqSNCVvunrDoqlvG2Z1AlK9kimPlIVOYzZG487NW3ygyOlV+tQSGvejYypH/Vwx
 ajFdKQyOiTI6F
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr3244200ejb.308.1617893605541; 
 Thu, 08 Apr 2021 07:53:25 -0700 (PDT)
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr3244180ejb.308.1617893605363; 
 Thu, 08 Apr 2021 07:53:25 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f21sm4352240edq.55.2021.04.08.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 07:53:24 -0700 (PDT)
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae3656dc-bb31-7881-b87d-c04de07df4d9@redhat.com>
Date: Thu, 8 Apr 2021 16:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IC7rI3iXLFta

On 4/8/21 4:07 PM, Keqian Zhu wrote:
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/block/ecc.c           | 2 +-
>  include/hw/block/flash.h | 2 +-
>  target/i386/cpu.h        | 2 +-
>  target/i386/machine.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


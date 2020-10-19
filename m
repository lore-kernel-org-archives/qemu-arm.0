Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3744624lfa;
        Mon, 19 Oct 2020 03:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGnWeI4jLHsJIfiR1f9UyyteFSScCxqE7gYUndQAv3O1iH6Ik06AbAsVR8+9fXNJpdAcJK
X-Received: by 2002:a25:a109:: with SMTP id z9mr5346895ybh.169.1603103734266;
        Mon, 19 Oct 2020 03:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603103734; cv=none;
        d=google.com; s=arc-20160816;
        b=b+IGbpsXBPGg7zg3keGWv1sZ4bjiwD7aku1FA3jb+8qtA8rVqExV+7p3z3b6XSmAzo
         ptC0qpmBpR64dYyzkv8gSac3Cf+z+rFoAIQyVRA8/x796CDGTZTfw2dCBXL13uVxki4R
         TPH3FtZfZQpyaRx+TVwwj+f3ur9FFFxpERwemGVVoVPtPBt5Q+qMIizJyu+DitxRRpij
         Y2CDhAtm68g/lLOq/LqGKxtcaT6B4HzPHpyrirJDicsi/rP5LNSfc8Rc04Z5wmb8cj8Y
         Hh8tQfxiOyr3dewYSWetThLJqtJ0muFgNcsaYj3yWLJ6yBxqOvF7Z9UVdsnTBh8oZFoN
         r42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=auHnQuL3FOrEDMH2QjEI/Yo3nXp1WUImC/u2fKGbNjY=;
        b=zTdrjtWH2xUBcb3aQCorrMUQfQ+g4loE9K2cvAnNtZM/15JBFWV5AUZyy3eND1UiHx
         FbwGwIYCxj0tUr7H6f/b5IdORpcqC0+zWVWNKs7iL0AzdiEkRZV6uxxQnDBrGIktxLPf
         uTKlxuCtc/ErF40S6TNoEZj27g1GJE1Rhpr19Kz2uyGk4FBxmxwAeCW/0hYFJ+Cj8aE4
         Pf50uSw3RSWX766wHXHAHiKxNd10mWuHoLBKHo96Gz5ti7pqxFEKnhsFuAdLAGRXqsXB
         NnVUZ96+z+btSBB1mHWZ0knLh88KIsw0vP85Cbcjfr+uuJbuxawDvkM451gEmI4lu7O4
         jslQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrTEFQ5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si10830358ybe.392.2020.10.19.03.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 03:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrTEFQ5j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUSVo-0008CZ-U8
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 06:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUSVT-0008At-E4
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 06:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUSVR-0007zK-UJ
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 06:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603103709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auHnQuL3FOrEDMH2QjEI/Yo3nXp1WUImC/u2fKGbNjY=;
 b=LrTEFQ5jUHuNAJP+fEa4UFWTWPZu2CR8edC7F0PlLXGMve2o+RMT0aA60TfGdQHzvHtq1L
 ad/PUw2sJ0MCUsDGiBRb7nYA7cITdR2bN5U+/PXSd1sjvBWwRuj+dJ6uO+ZlOhcWILq/fs
 USOJjnfxCnmgmYHOF6OQWh63lHTPHZc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-QnBkNseJN7m-7wEQApuyYQ-1; Mon, 19 Oct 2020 06:35:07 -0400
X-MC-Unique: QnBkNseJN7m-7wEQApuyYQ-1
Received: by mail-wm1-f71.google.com with SMTP id r7so378215wmr.5
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 03:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=auHnQuL3FOrEDMH2QjEI/Yo3nXp1WUImC/u2fKGbNjY=;
 b=lkyDepLAzHqp+ux+oE7ZFcrVi01qzv105OnJ6+G+PkFLy4u95FfIlvvBMj97EoDPJV
 FM8HvNLkeaLfLvAOfoShKr2efwbDvn4rQ/3S7M7/xuohmjr8MebbJqsCBrFLFRBzVnck
 dcWJVoCZNu8c0F71PChnia2rGwUqm6Dih2TzAVWUC8+nHLazC2ZYM2DBSTT6Vd8YAciR
 hJgncN7QBMz9tgyD2TDE8KjpFfznVI08NWX2Xk91vQWOWeUyGG72DBrbEFtIgLDff21I
 b55xFcSEOPYcbhaVxDSp8Qg6vMbCGkjRfDP7s9hp44fqavE5BEP/vfWGWirwcMa589WH
 kvmQ==
X-Gm-Message-State: AOAM531XjfRWHo26aq7/8OR4tIwspFnSgawrFFbOyHxKpUiiXkICdUw6
 xTJYszsLPa9gmx7WwCZ7U4sNVvUqAvg1OYUtexBjdU1yFg53yY5G8h9sh05JVI6iGff3bbl2qOX
 cizQgC5d7TMwD
X-Received: by 2002:a1c:7f0f:: with SMTP id a15mr16439547wmd.97.1603103706178; 
 Mon, 19 Oct 2020 03:35:06 -0700 (PDT)
X-Received: by 2002:a1c:7f0f:: with SMTP id a15mr16439518wmd.97.1603103705898; 
 Mon, 19 Oct 2020 03:35:05 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id o5sm10474287wrw.76.2020.10.19.03.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:35:05 -0700 (PDT)
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: Peng Liang <liangpeng10@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
Date: Mon, 19 Oct 2020 12:35:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201019093401.2993833-1-liangpeng10@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wno6kzZfhKUC

On 10/19/20 11:34 AM, Peng Liang wrote:
> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.

It might be easy to add a Coccinelle script to avoid future errors.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Fixes: 9d68bf564e ("arm: Stub out NRF51 TWI magnetometer/accelerometer detection")
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>   hw/i2c/microbit_i2c.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
> index 802473982082..e92f9f84ea81 100644
> --- a/hw/i2c/microbit_i2c.c
> +++ b/hw/i2c/microbit_i2c.c
> @@ -83,6 +83,7 @@ static const VMStateDescription microbit_i2c_vmstate = {
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32_ARRAY(regs, MicrobitI2CState, MICROBIT_I2C_NREGS),
>           VMSTATE_UINT32(read_idx, MicrobitI2CState),
> +        VMSTATE_END_OF_LIST()
>       },
>   };
>   
> 


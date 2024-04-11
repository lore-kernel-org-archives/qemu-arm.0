Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp669121ejc;
        Wed, 10 Apr 2024 18:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1fisAjPK445AqtqTs8+v66k6Fb8dlcuEKnh6+BNfE7P7VrowuAeVT5aV4Dc1e2KG2/bfwwchamv4W67wq5bCjIy5Q9MGM
X-Google-Smtp-Source: AGHT+IGyUqbKqcKkkDdACc00ckcFzSiRJxAdMw0K7qM3GKF8JoDz2JREeLzVvrjNIAgtPfjTH1Jq
X-Received: by 2002:a0c:f101:0:b0:69b:1ae5:bc2e with SMTP id i1-20020a0cf101000000b0069b1ae5bc2emr3861111qvl.40.1712798022536;
        Wed, 10 Apr 2024 18:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712798022; cv=none;
        d=google.com; s=arc-20160816;
        b=KOdEcKg9GmcmXlM6m9nssJUM77uCa16cfKGANNFg6iqlOwi2a+fmYFXUHCGs+seCwP
         dAThTkvz+DhfdwVIuuiqoBIKXZEK1lBY73Ozcj5+D3w96qOD+mQVBhmW1vnx0rHQ0t7s
         J+uOOK/+jHgXqwa6NDcdeSnYfnbM46YUhzxKKF+IGcAxnbkTtFhUsF1UuFUFT8uDsqpV
         ixZMA8eXsrYWfGAMfIOlIAQAQu7N358oQKbxoRqDCsXoxh+q4wEG+r99q3Zo7v69z8SS
         /C1+j4NRNro9KK58NyYJcK6vWZ6yK552uDKhyw4xkuypCBi0h1xd6bkR6QSvLXifGpmm
         LUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=Vi+yPXvdP8/4IECsq3t3TkhB1mnpXd2csGGrbeCULMA=;
        fh=/MSHAyhUJiTYoT4ekOyS/HopHNLqBW111kC/699+MBU=;
        b=vBMJrqkOIa4IIBE9/c7Je0IKWR2ij6Q9ZhgqQ3PlMInV/qHkFBwg+Z/tH3jDBH45PC
         0Xjclq102FtPqPu24kQc7GuyHobikU5oQIv7rchc3Iuo5daK1sjAL0C5R5kjPtLa9DIk
         pMlJ35q9LQr+4mROy8Ms9VgOfBHpmYGz7jw+YnkHo42ufwy9Gd8OqaZPybvjm6mEjThT
         +evgjNFXNC1NzDUHLqWFVipUizt+zzPcnR1RzBAr9WWuTY3zqMzz1648afrWIsJbpKRo
         5TqNQOskxmTI0usqbyc23ur0CYkRl4QGfjx197OooPdSpstOYjXOcQ2NGyQV0zRl5VzT
         5g8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020ad44d43000000b00690a5754ceasi465202qvm.245.2024.04.10.18.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 18:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruj0O-0000qF-TB; Wed, 10 Apr 2024 21:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1ruj0N-0000oI-Ga; Wed, 10 Apr 2024 21:13:31 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1ruj0G-0006fc-J2; Wed, 10 Apr 2024 21:13:31 -0400
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VFM7M1fS9zXl2g;
 Thu, 11 Apr 2024 09:10:07 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 5ED9218007A;
 Thu, 11 Apr 2024 09:13:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 09:13:15 +0800
Message-ID: <bc91e886-16c8-d76b-5e2e-79c5af31d778@huawei.com>
Date: Thu, 11 Apr 2024 09:13:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v13 00/24] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
 <5afa6458-808a-df3d-a734-53dedb0f5aff@huawei.com>
 <CAFEAcA-TQxXR08YkijF-WW8mP1LcTfyRy64Rhdh971OnVrAmJw@mail.gmail.com>
In-Reply-To: <CAFEAcA-TQxXR08YkijF-WW8mP1LcTfyRy64Rhdh971OnVrAmJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.441,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ezO241gpXYAP



On 2024/4/10 20:58, Peter Maydell wrote:
> On Wed, 10 Apr 2024 at 07:19, Jinjie Ruan via <qemu-arm@nongnu.org> wrote:
>>
>> Ping.
> 
> As I said in my reply on the previous version, we're in
> freeze at the moment, so this patchset is not going anywhere
> until 9.0 releases. I think it's in shape to apply after that.

Thank you! I don't know if there's any other minor issues.

> 
> thanks
> -- PMM

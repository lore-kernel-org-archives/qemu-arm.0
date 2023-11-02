Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp278121eja;
        Thu, 2 Nov 2023 03:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKzHBstukYUcW/SHPa97PJ2nlHmwOCCgE1kMmpfUkroH0S7NVnOZGJHvGBPPLZEFpTFLxP
X-Received: by 2002:ac8:5f4f:0:b0:41e:2227:6abb with SMTP id y15-20020ac85f4f000000b0041e22276abbmr22274056qta.60.1698920364566;
        Thu, 02 Nov 2023 03:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698920364; cv=none;
        d=google.com; s=arc-20160816;
        b=ToeM43hjceeuE8Sp+I1GVvb+Vl8inekXzI5S9LsigmF36Kxjb0ZUWCHZngeInXVCfO
         yR9+1592VhALqy9viLXyeT6HKWtjy8v8bdgfYOqRLuS1gueHcaeR6PV9cjWTWq3RErhF
         XBqUVT878xWGmjhSCPvp/+w4CFfV+svpop5g+8O0EIW6xSNbJaSnfpC0A2MrZ6mmb7/P
         n5TPbh+FPaCcBDq4molWAHqMFLH5GFi7c+jSjtLdRo6fsI0M0OHpZrHJJ9SYXS0NxhcN
         ljZAmgfB3ZDy5OkS5a4eIDmo/oYeyAtYakxQTLkjBIU5VOrMdWW7Oue5y+R0UT9xigBv
         rORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=KY0QFSmPxFSM5KOaDah8B+QGG3gWvGcejNUw3rL2bY0=;
        fh=TvhRkOcjcUKQyMEti7N+YbZo1DjgBQa2pLoAut7TYJ4=;
        b=cqnqoTLyZn0PBMCt4tPnGxlTW5axR0N7h3jNloC6Q0dlHntbU0RMldaSQEdNydSHEc
         S0E1tZCecAg21lrc0XSvwoXf95FmmjstBuqk4eVVocGKWvVfyq4bmocuXUY6tzdpGxZh
         QeWLdv2LobarHKkypH+SnhUQivfTmssYyiE2KURpYIC9IL9mba8DB837pUTND4WoA5vj
         YCNi7RLZaL8AT6DYIInCTlimtdHK+VlXWSCxwDrV5QpVaPudb90zf0FBvBBugy70ZqaC
         zWhOX9tNcXZCsy6DMR8K3iRRxfrG3N1m/5/hTgFtvGEVN1bRftky6qDeM/lt5pqk1VQH
         3SKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020ac85bd0000000b00419930eb09csi4276464qtb.190.2023.11.02.03.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 03:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyUnJ-0002j3-49; Thu, 02 Nov 2023 06:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qyUnI-0002is-EL; Thu, 02 Nov 2023 06:19:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qyUnG-0001BE-DI; Thu, 02 Nov 2023 06:19:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 838572FAF1;
 Thu,  2 Nov 2023 13:19:14 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 4826632DCD;
 Thu,  2 Nov 2023 13:19:07 +0300 (MSK)
Message-ID: <52583b0b-f756-4807-8ed3-9de3b57abb99@tls.msk.ru>
Date: Thu, 2 Nov 2023 13:19:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FreeBSD 13.2 installer does not see AHCI devices on
 aarch64/sbsa-ref and x86-64/q35
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Niklas Cassel <nks@flawful.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>
References: <b7e00b36-2ac8-44fa-9847-b2025ebe05f6@linaro.org>
 <F1D854EB-9C6F-4A54-BAA9-D75C40DBE86F@flawful.org>
 <a6cc110d-132e-b3f3-0b64-368bcb5c31a9@tls.msk.ru>
 <ZRx8iLkWE5fwLOpE@x1-carbon>
 <7fea290c-5e11-44b2-b670-a518464b5d05@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <7fea290c-5e11-44b2-b670-a518464b5d05@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
X-TUID: SncZ+ElKuB6a

02.11.2023 13:16, Marcin Juszkiewicz:
> W dniu 3.10.2023 o 22:41, Niklas Cassel pisze:
>> On Tue, Oct 03, 2023 at 08:11:39PM +0300, Michael Tokarev wrote:
> 
>>> Were you able to take a look at what's going on here?  I wish I were
>>> able to help here but I know right to nothing about ahci emulation..
>>
>> I was away on a conference all last week, so I didn't have much time to
>> look at this yet. I will debug the problem this week.
> 
> Did you had a chance of finding out what the problem is?

The patch has been posted a month ago to the list, see
https://lore.kernel.org/qemu-devel/20231005100407.1136484-1-nks@flawful.org/
Thanks to Niklas for the excellent work.

It's still not applied neither to master nor to stable though, for unknown
reason..

/mjt

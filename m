Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1548448wrg;
        Sat, 8 Jun 2019 12:38:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybtDsTOMu3u/0/S8OACVs9oYZ8aagWytFQKF9Sn6PrlX4iTnU95tXom0r/IpM96ec9lKri
X-Received: by 2002:ae9:e30d:: with SMTP id v13mr30135547qkf.148.1560022690320;
        Sat, 08 Jun 2019 12:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022690; cv=none;
        d=google.com; s=arc-20160816;
        b=R6ivmNcshWqxYn5vuLCIwKb5nWW5w5W5HMe7u/+sYSMCkY8hZHl3aBcPtQx2Oh36cf
         1s2+gMXLp7RgjKVJlzIeCyVuSExThdxYuD0G6aKWMyzy7tUuNTqAy85JvPGP3c0PPtfo
         FdAbreJ6UUEd6Ij80QY2fpdvl5vAS5DTS+weGMfKX6iiHMrRoWefDPIBuJ3Tt//BYb9S
         ORFEH0WbQPTemS90/f5CSZvqcFLqHe21oZDaLy2VDKvrhqsTM9VwqjXehdjmWkNu39qT
         WWIHo81LBAQjsmfEEt7Bv3QhU7kYtjHVN3aQuG+vx3pCvzGLCrQ5EYBBRqrnbdC0JEFq
         oA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=d/LML2CpWzrbkhyg8j4ROCDBN6DxwDlM9TuSJqOhLBY=;
        b=hkzS/3rOXMVypWAzD6gAfqNd5AsRyjatxEoiYzma2Uemo0K6w9tAHY+jhrL6a90qgv
         8MZXwle3doTh7+DsJh/4cT/SOyQelNG9NxkN/EoovRn3ZptcpoNJ8ZDiWfCEMvEWuNjs
         uuAfoMTAvC3K4/66R0uah6JhqjRRGNY/Smy3MfVToT5/Fi7m8YlsbpAb9QT9DjfhxiZo
         H+b8o4yO4YXWmu0q7iPv40+DJ9Y94tVMTNnQeYoiFWLkQbGnQ9swFNcQnYgh43i9FqNI
         DPgZuhluNqeOPZ8MDHte6XzGP97kzO9jKmVi8WMnxeHC4xDglo2lxFEFByo15deOJYmK
         R+Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WsvY6f2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w187si3429814qkd.12.2019.06.08.12.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WsvY6f2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhAH-0005xo-Re
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37457)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh10-0006Jg-Ir
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0y-0006wE-Kq
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:34 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0y-0006vO-DE
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:32 -0400
Received: by mail-oi1-x242.google.com with SMTP id g7so508852oia.8
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d/LML2CpWzrbkhyg8j4ROCDBN6DxwDlM9TuSJqOhLBY=;
 b=WsvY6f2Ua9it1EHTVHG+V4GiYpGW/GG9HEtuIpGZlGiRv7HrLjL/IXhkwI9uBqTCt6
 lwGB1pjElGgWtGaempVuttzCSFE/syQ8302B4hnEDvleGpkmlTFcu3IpDwkSq+HlKB1R
 wp9YeYtMGzDchXT0iNij8FPTMQMIVNN6N6jbU1Twf8GKWvVlEhwACARhVvPcjZmStXOM
 w5rSOgpnqiKgx4GXks0knrtbf31DCtLEHMBvBKalAr9SA0x0/7tT9r8NcJDuV5aPfP0z
 JuKRj2Y922+1vlc41vsIRDtvcu5hLWjgrLCcYzJCL3fZcblfvePA8t41iYI5/LpoETL8
 Beeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d/LML2CpWzrbkhyg8j4ROCDBN6DxwDlM9TuSJqOhLBY=;
 b=OF/9TXmyYccapBXfC3WFf8A1Vnne3I8VyPS4JPetEYDpJ4X5P6ZaqIdOpOFHVgv5dB
 hjXabd7qPSFpGObtHrNqRaxeekPUxICpvleiBD6qk0b/TwwGy+HYPpYw4JgGQRHcRPVm
 eRxnnKyFA612qLSMIexNoFcXUdP78LSknNCv6LmhjB8l7953Ws5uik8X4uRBYqCeu0RP
 C0HBOK0JzkL9/eout01liDB9FMmbIaC/wVXCFGvZyNaPq48Dliqp7akkzLdNhkDQy2Xw
 1wqwxa7lUCZiVEuA6Tg9bVViJzh/J1lxOwicjU6KlCr7rZufu8lbbYFhrALggE/Edy9Z
 rWVQ==
X-Gm-Message-State: APjAAAXpe3zh9zejcHGzHF04ZsSPq2oD4Ad5mT2XQXPH02TSJ6OCMgNQ
 IeOwl4FZiQkqzbC+PS+257rao60QtOvhwA==
X-Received: by 2002:aca:a896:: with SMTP id r144mr7355410oie.105.1560022111255; 
 Sat, 08 Jun 2019 12:28:31 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id 37sm2562161oti.45.2019.06.08.12.28.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cad1bb4e-0143-1f88-bdc7-9d06929900f6@linaro.org>
Date: Sat, 8 Jun 2019 13:30:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 25/42] target/arm: Convert VSUB to decodetree
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /j0m8n3b1+TC

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VSUB instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 10 ++++++++++
>  target/arm/translate.c         |  6 +-----
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



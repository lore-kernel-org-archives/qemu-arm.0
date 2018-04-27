Received: by 10.28.4.212 with SMTP id 203csp1052803wme;
        Fri, 27 Apr 2018 10:53:40 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrPcHBFio/Bb0vYuGEFpEE2yFDMY0CJ0vRIcSqiFm26jIYHjhl7zl8/A9m4saVS5SDe96/k
X-Received: by 2002:ac8:334c:: with SMTP id u12-v6mr2977479qta.127.1524851620513;
        Fri, 27 Apr 2018 10:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524851620; cv=none;
        d=google.com; s=arc-20160816;
        b=iS+RkuAXNBTj7mHhNnMJcXMbpjLYAXwg2PEeUBL9F34j5eYg0Z1Sqt7T1toz+MfTmB
         950AkOeQLyjRc9mnS8bnOm0Gc4SO26YxKT8qKH5pB1jVCDyH8odNa3bx0VWleRaJXDjL
         DfYL7a3RpuNvrG5oD6Notk2LrvXbgUzcBq4+rZ6k2yCh8vLPOUroZ6MdezTp+nVK0Ezd
         M2UycQvGHAq8meUwJhFYDiGg7+RxmyQ4CQhLZB0wevhORSvRYRLocW2oY+Otf1fXAHFf
         ADeokjPspu82BZsb6j7mcH859Pua2ONYejaKh0NXzIAIqHec1B3ddkCQzf9TsQyDqHyn
         TTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zEPmv5pLB7qhZ2KxbRKDzxYkxrpsWYQMUXJGc8GImtI=;
        b=fHn3MjY5ApbdVyBW6TJq5p1eD8rH+5PnDVbGoDbxV9B7yTHb+0izxvAjISGJ67frGT
         ox15+ZTqvyixCfkW436AU7lNMhEo5CCtFh1YFWBkf8ga2UlqypV6/P6Bn1CeU7OB8tRy
         eFEYLjIcRME+wwwQknXrOgwFBzCER7DPx3zsKJV+fEibhectfGvjAZEdfQgkerHMdOJe
         SHU8iOfmVCGNBfe3PVUlez+UuTFdx41sCAgBUsGNcBLjAC6gcBFC897NOvXoMO81L2T9
         a8eu8u1utdqJpmrHqb7aX35nXsuCJ07SuRertVNnNmYYSb+HjB57RzUpgUf4jQaDyxLc
         7kMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eafnTDHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16-v6si1873606qtc.386.2018.04.27.10.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 10:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eafnTDHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC7Yy-0003kH-39
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 13:53:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fC7Yn-0003jG-Ly
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fC7Ym-0006k9-Pu
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:53:29 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:41596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fC7Ym-0006iK-Kf
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:53:28 -0400
Received: by mail-pf0-x243.google.com with SMTP id v63so1998105pfk.8
	for <qemu-arm@nongnu.org>; Fri, 27 Apr 2018 10:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zEPmv5pLB7qhZ2KxbRKDzxYkxrpsWYQMUXJGc8GImtI=;
	b=eafnTDHqb1RbgB9gvwnoyeGPbAbjOXe9xRurpRE27pCYwRO8ZavqalUh32jm8abZeu
	a81uxmoC8Unz+15DqyEJEi71n5tEaBaHxjYCAXvUW1ELNtZYN2NtRYs+41IL5VVUjnud
	7WWXrfOGAxh/l7rjuPqZKY9EMyqnqhX1labCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zEPmv5pLB7qhZ2KxbRKDzxYkxrpsWYQMUXJGc8GImtI=;
	b=DD7vxkyn90/Mnn+bft59WCGubiX4dJ2v9CrRiq2JTp92H5K3SyJQVFqBZCRJJ5ixAZ
	XF+XVFyh5l3gFvtY79cXVNSVinvyM1lajEUqCqYgqzPtQAoekOhUQM83r4D23cZF4FK5
	DYZPiS6jD+8J3CkpJ1Pca80yVTORbqg5xjnJBDGbkMNR7y8zalO1/XA/uRzy9Cst48WG
	qs5u9kHYcDUwwB6wZEl1vA6ENfmui6T6rkeKqVp1bS34KhKLIwVSuyXpHefGSNy1aVg1
	9xinmVHTmVfiln9M2ukyZ9klhSrciYYy7BUoVJ1UWobui5mM1mzdYOTugWeftT14KP99
	fqTw==
X-Gm-Message-State: ALQs6tARyi+Y7EUX6Kb2wbvrOqzLYBHWoJdGZlJm6aVcSMfv5DUPoIQV
	TLhVUGg9hui1CF8c1+PzKRs7GQ==
X-Received: by 2002:a17:902:b492:: with SMTP id
	y18-v6mr3130701plr.2.1524851607426; 
	Fri, 27 Apr 2018 10:53:27 -0700 (PDT)
Received: from cloudburst.twiddle.net
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id p1sm3637970pfp.48.2018.04.27.10.53.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Apr 2018 10:53:26 -0700 (PDT)
To: Michael Clark <mjc@sifive.com>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-6-richard.henderson@linaro.org>
	<CAHNT7NujtwKtCtsxG91DtgriDd2sjVZwyqKhAp03LR=eJjdMtQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <45076b60-a2d2-281a-3c85-6c21d87a49ff@linaro.org>
Date: Fri, 27 Apr 2018 07:53:05 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAHNT7NujtwKtCtsxG91DtgriDd2sjVZwyqKhAp03LR=eJjdMtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [PATCH 5/9] target/riscv: Use new atomic min/max
 expanders
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Emilio G. Cota" <cota@braap.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ib+YinTjam2

On 04/26/2018 09:24 PM, Michael Clark wrote:
> 
> 
> On Fri, Apr 27, 2018 at 12:26 PM, Richard Henderson
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
> 
>     Cc: Michael Clark <mjc@sifive.com <mailto:mjc@sifive.com>>
>     Cc: Palmer Dabbelt <palmer@sifive.com <mailto:palmer@sifive.com>>
>     Cc: Sagar Karandikar <sagark@eecs.berkeley.edu
>     <mailto:sagark@eecs.berkeley.edu>>
>     Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de
>     <mailto:kbastian@mail.uni-paderborn.de>>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
> 
> 
> Reviewed-by: Michael Clark <mjc@sifive.com <mailto:mjc@sifive.com>>
> 
> If you give me a remote I can pull into my local workspace and test. The change
> looks pretty straight-forward. There are tests for amos in riscv-tests but no
> parallel tests (i.e. contended case).

git://github.com/rth7680/qemu.git tgt-arm-atomic-2


r~

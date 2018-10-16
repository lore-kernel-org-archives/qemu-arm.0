Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5861016wrt;
        Tue, 16 Oct 2018 05:58:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63lu6tZHVixF+pKfWteuLA7VLhLOc/AbdsgV/q9m2EAZSDW/7XIcbb8zH9P5z7nJLoAXPa5
X-Received: by 2002:a37:6cc3:: with SMTP id h186-v6mr20274426qkc.49.1539694735893;
        Tue, 16 Oct 2018 05:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539694735; cv=none;
        d=google.com; s=arc-20160816;
        b=CN3WzOMYlQSJTNN+s5WmzpSFQaj9CY+t/e5t4faPhAvpOcYFRQVHcMMK7Cm8C9EcQW
         nAyHWtYAeD/UZ71FUXPnBJrnYEo9GBCfjblF23KSYLrVpdvSGYQ03A8qMP7uiv4SOcH0
         ql0gBsSog9AQBG4Bv4esdQ4wZ6w/r/BhLawteicfwi4T65BDdBqYWw2giIZ6XDw+MbOa
         AGaWi+W7fbadGnmJJP570GQ/Llj3Xa6mkR6vZ4jl28mJ8ytj5f4tWah+q3EirYfTnzPl
         /fbHWOxb/l6tVIPOfKGwjkTuYqi9RKEA+tBZVU5VmXa5ZtP5FDLRziw1R1soR7Nbfd2b
         CmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=6O27V9m3H/J+5Ltn4RkXYcq5bbI0Jj8FXykAQMPL2Yk=;
        b=w8bjU9uGu/uw3TzqAEZCIYQwoAK2rlhACzGFLf3nsxiVobuFGxkoC7PBu63CJwa01c
         OOk9l/0a4QVgsuqn61IQfoH2pfREXyqrWnWziSIvGe5wJKChJsQKK7zl9B0xSHWEFhsV
         9UBhatolgH7p1+aqwDzuArDbI98MDW3Do0uw9K/v3h8oQMocWzAwLEAQuEHZiZSNHHYN
         z05KoOQ6kiMKFLOoI0BMutuqTSyza/GHjwyHgLK7/Ixow9SlymjR3beTqPS0FQjGOBsE
         DRwvKzHB07pZbtpHLERkJ6n8q4Bjcph3UNMAzEcSBqEtNAn1ULk5/n0xb+BpDWT0fukz
         PiWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TTzcvQO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13-v6si1810156qtm.292.2018.10.16.05.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 05:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TTzcvQO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCOw3-0003VD-DT
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 08:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCOvs-0003UG-3e
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 08:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCOvm-000402-DW
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 08:58:41 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCOvj-0003Po-Fi
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 08:58:35 -0400
Received: by mail-oi1-x241.google.com with SMTP id w81-v6so17929147oiw.9
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6O27V9m3H/J+5Ltn4RkXYcq5bbI0Jj8FXykAQMPL2Yk=;
	b=TTzcvQO1IwUv9crcXsA95S477NnMgs8Zuhv8vsyIPVQ3eKPvfxxobNHcGMVtS4/3MG
	yNfJC/el+oYycfT3Zcji1JPadGXwrEpAPMRubIG82YooxIyQu1iltpyJSL8CxGunFHPC
	MuIGwofGQMVpl8JGP2hm8uPNrnXV73YTfTHrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6O27V9m3H/J+5Ltn4RkXYcq5bbI0Jj8FXykAQMPL2Yk=;
	b=h0oDhMq5m4bphhU6zR5frsnkR3yHdNgDTViAr5uvRQzuxyWOm0UlYa0AEMVOi/qkCg
	kSKZ6AY+oFHLnlILhwZwllgqZDdHLwPyblLNGbARGfAadvusvkdGDn/N78ICiYIcfNPK
	74iGHFKDX2YfNNCLEMrmAZp/WIvToredzFZFrFC+NV7vA6R4dY8Kzw16nHe7anRuYSvY
	/ig19ZgdcbU9PM9mLxWLGTypHMnY/AXJ3YK4y71Gozh7e4X6ZjDyogczOcYzRHeBaREN
	c51EPT6L2zBook4ox8kTkO/I+lZk0kQEd8pE5gfsh1bMFHJPEe2twy7M0ZnqtQQgSiFJ
	H/Gg==
X-Gm-Message-State: ABuFfohcPlBrThd1GYb4uTcDZZyJerZnkcOGn3JWonciBlK7O11drd+i
	AnHHEyOJgV4KJVBcSRVT/2yulwkqIptmepy34ldY8g==
X-Received: by 2002:aca:fd14:: with SMTP id
	b20-v6mr12111734oii.337.1539694690875; 
	Tue, 16 Oct 2018 05:58:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 05:57:50
	-0700 (PDT)
In-Reply-To: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 13:57:50 +0100
Message-ID: <CAFEAcA97eSpOzU_xJZLFgFBZUCW1Z8mYDMzYsdpK99S5WiPf=A@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH RFC v11 0/2] add support for VCPU event states
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
Cc: Zheng Xiang <zhengxiang9@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vqA55gneXvhm

On 27 September 2018 at 17:55, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Support KVM_GET/SET_VCPU_EVENTS to get/set the SError exception state, and
> support the state migration.
>
> Now the VCPU event only includes the SError exception status, it can be
> extended if needed. When do migration, If source machine has serror pending,
> the target machine is also needed to pend this serror regardless of whether
> target machine can support to set the serror syndrome.
>
> Note: Because I do not have arm32 environment, I only this patch in the KVM64,
> not test it in the KVM32. So I need someone else test it in the 32 bit KVM platform.
> Thanks.

Hi; could you clarify why this patchset is tagged RFC, please?
Is it just that it hasn't been tested on 32-bit ?

thanks
-- PMM

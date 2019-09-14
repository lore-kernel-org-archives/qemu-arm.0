Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2032899wrp;
        Sat, 14 Sep 2019 07:36:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxX5J6HzGMYTCY7TW+Jt3IseKSE8R3LE0T9DTY4VRVCHjCO6HDrVe7kKSB8qNABNQwOiH+S
X-Received: by 2002:a17:906:e0d9:: with SMTP id gl25mr44382516ejb.101.1568471815868;
        Sat, 14 Sep 2019 07:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568471815; cv=none;
        d=google.com; s=arc-20160816;
        b=E/XnUkqe97KyIMgdOT+kvpx4fcp2P7LKqVoTKxx4vIpodzTYSxcKrocIn8HYIzqhrj
         LTdQhs1WzdJ8iFSMPF4etZ3Xxz9j5IjS630qNhPvh6U57TWVtdKKr6zzCJ/AMOYgIG1U
         hTQkf/t6kTT8T6VPf9auYzoa4jXkiq85RKmkzj9zebgc14gSzUhq0YsY3y4/r7TnZq/C
         CUK3ChQSZ974yfqKBJuIxqdALzugNmS8XSLFzf2N27+GDMhgA61SrT9k7eEWt/zEYzsU
         i092jvtJAn5bGcIyezKbFXZd4WKgeOyf7+s09SkLDcCjJ611L5T0+wMBGs++8prSqNHq
         gyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FTXQSoe2zNg9nL58Q9VRPf/acbfi2EIOqGSUKRdWuFA=;
        b=Vu0XMGfnQnHoob50mPTl7wLDfWsYizJQ1MQKKBuJncpzRG0xpUkVHYmgObVCxsb8Rh
         xkJTsTscyJft7gK9Wr9lMD5qvsbLyS5yZjBh7Jy047Mgi/ggi75lXdJZGjTkz+/cZ212
         LaiiI8WEKOr7IOZl0M1MeBEThIrHo/Axqf4MQcPWTpf41IFzt8BwjJvCgpZUNs61+I9y
         nkQ9d6hI668/2K8ou5pQuhcsg7LDG1YxX2aPNxDlVMNXSdsTeyxvLsdPPhrogfhPnZyU
         i+QqeL+LeWCy+X0KsE7yBl8BRoswJCcYF30bVOq/IFVkwe8WueURbl/EECf71O95V2hA
         JaGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nprppdDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q46si18632545eda.44.2019.09.14.07.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Sep 2019 07:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nprppdDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i99AU-0004W4-QQ
	for alex.bennee@linaro.org; Sat, 14 Sep 2019 10:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i99AJ-0004Va-Vg
 for qemu-arm@nongnu.org; Sat, 14 Sep 2019 10:36:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i99AI-0000f8-Va
 for qemu-arm@nongnu.org; Sat, 14 Sep 2019 10:36:43 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37203)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i99AI-0000ef-OI
 for qemu-arm@nongnu.org; Sat, 14 Sep 2019 10:36:42 -0400
Received: by mail-ed1-x541.google.com with SMTP id i1so29459335edv.4
 for <qemu-arm@nongnu.org>; Sat, 14 Sep 2019 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FTXQSoe2zNg9nL58Q9VRPf/acbfi2EIOqGSUKRdWuFA=;
 b=nprppdDCmzQG2Ymb9prptc95fiTpMOD/44QKPikfJZhKrK9RYL4GhoD6iZd37vtK5i
 Otkfukr/MEz0VHmPmIYWWyv9Ug+N4fbacpCNyMu6bSTJd0lTlB6Ac/s2FSQYUUi0h6+n
 4DCXFuEEYN1Ou2TkrL8QdvhAARwSmizNnVjS9gTEfv3Z0cOpb7TtSRd7WDV6qiUhR9G9
 HujeyDp9AWvyUukPQErVkVayXwexmcQVlRE2iM/N7k4ajaxcbHof5sh9VDDA1B8T15mP
 iTB3nIaD5cY3nnwKI3ljd00Oy7WhdkTpE8ybduLbNlBy+yvwdsgytGvFFcP8EpVE4QyP
 tBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FTXQSoe2zNg9nL58Q9VRPf/acbfi2EIOqGSUKRdWuFA=;
 b=fURU0jLMdmrGREMNowAHJhttT6tTRotAxB2k+afzrL3Ulmbvf27e40v1Oub3z3EwA1
 sPfLTSK09FKwMY7WoXaO++DAjfRMlEtgoOIY4hw4jGXN7vu2nTaZmYFbkNsIQzEBB35m
 m2wlFSb7LYe7YaoDl9EKcUMVPwhUwHCPN0kJX89NHxvYZrGbnaA47wh3nsxp+WrmhET9
 XuN/+WOOIxY8JOvKxby1FdEAJWWYkzaTsBJQE77BAz+9FYkf8Ic7Y4g1IVjDI5WEHaRV
 TNeM6gYuqhGljCjiqm+n9x8/oDVLomZo594/M+Mtba3mWxfFnKa98+9rF3lumEc2LJ0y
 33WA==
X-Gm-Message-State: APjAAAWcQuJlmxc36M8zsdwv0an/bgXxqO/7WBx8v2fbTHtwyKjzKLtd
 sLra9ekpVUQPsklajD0/sO2Niw==
X-Received: by 2002:a17:906:6d52:: with SMTP id
 a18mr21816681ejt.56.1568471801537; 
 Sat, 14 Sep 2019 07:36:41 -0700 (PDT)
Received: from [192.168.44.107] ([185.81.138.18])
 by smtp.gmail.com with ESMTPSA id k10sm5969406edb.68.2019.09.14.07.36.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Sep 2019 07:36:41 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190913095639.25447-1-eric.auger@redhat.com>
 <20190913095639.25447-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <70edd388-1dc6-5382-5dba-09ce732a608e@linaro.org>
Date: Sat, 14 Sep 2019 10:36:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913095639.25447-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 3/3] ARM: KVM: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ORhMZopHET6K

On 9/13/19 5:56 AM, Eric Auger wrote:
> Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=512
> for ARM. The actual capability to instantiate more than 256 vcpus
> was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
> vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
> a single KVM IO device instead of 2.
> 
> So let's check this capability when attempting to use more than 256
> vcpus within any ARM kvm accelerated machine.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


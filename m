Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1626075wrm;
        Wed, 9 Oct 2019 17:53:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySBOVQMhfmWRMr39dONIGkeAlLPVPAxEsXw84P1uvIPre8LkduEunY4zDO0pknQ5TFbWOw
X-Received: by 2002:a05:6402:2025:: with SMTP id ay5mr5595726edb.93.1570668799541;
        Wed, 09 Oct 2019 17:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570668799; cv=none;
        d=google.com; s=arc-20160816;
        b=tsQyyOAqSzycZTnnsAYQJJjjiK6SS4Y4ABNjfB4hM6ZHMpVa50IG4wJqRjkF7xlr2f
         mWoQ8w1cUPPFukaDLzy3oFQwDFrrKwKKgGI2YsA7zPDpQ+X67KM1UX4fglCZ74wKW4o5
         E5SImWjricpO8c7ONBoZsIgwG4ySKJkv8v6e74TkR+FKezf8v6TvjuX9jQuhhRuJxxHe
         Wj4Nf02qeaX3B+nDtnWs3F1J8j0/sn77Z99uSTUxby5UP91Pcl3aToKfpQLl16n/yuAt
         L5YFbDOtcqmpo5MxuXa3W/eJnNApA3JxJj8Oqq16loLCB7vYK7QwJjwX8tXozwusvVV/
         pJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=5cAdBszWO3ycw7CajRtiU60zkj581kBwr+ulfHGBmyE=;
        b=JfBCoua4AhHT3yFgALmy/t/yv79XovGYYdob+eL2zURULqEwTO1WwFjymCeH3TUMp1
         sl4XMq+lXjirrGKrNrSpA2H65DCIu1ifYA0Yc+BbVIUJM8JWbCGjJ8JbfKda8f/4dc3+
         mT5WFrwyviFmCMYZGaSoSdIzqDrE/2PgdTcsLEQg2qXRKjS/lXan9vHQrzgAVuAUSXhz
         /j+5LUmUhozJrrOSMOuNT3FGTKbc1+TWQvIxKf0BWAdqXxIkzjqbkZlSHcXFgton6L+E
         aN6ORGPhfUeMGHSflwDnljrU8o0Xtp3CkNJtWioSXTxyIjHlKOclxI65XlpRTKhFIjyh
         BZFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePnmr3aZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si2085526eju.298.2019.10.09.17.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 17:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePnmr3aZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMhi-0006ZE-IQ
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 20:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMha-0006Yp-Hl
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMhZ-0006CO-Ja
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:53:10 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:33857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMhZ-0006C4-El
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:53:09 -0400
Received: by mail-yb1-xb44.google.com with SMTP id m1so1385822ybm.1
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 17:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5cAdBszWO3ycw7CajRtiU60zkj581kBwr+ulfHGBmyE=;
 b=ePnmr3aZymWLHNAIStyecEElrE0/Gu6oeHOf2FMxrvxAsztFZWc02sIZOamQdH/nuv
 OAfxEuxGYLdE723SE0EFdg9IlRiH15s8bHvzCr8JdmxC5sJKzxhEiJYtZJ3jOwRUOSoY
 T9FJsN3h8G35z0rmO0inQ55ZGDI18Xeq8sxu5QcNd+YnEZsYnBgU6pUN9WSQfuQGTy6w
 Pgrq1vyTDLftgS7AIB9CN+3e8cfX/nSC9wmqN9ghb6OHJK9YeA1Wb+Cs52RPGeesDhtc
 rTcCEzSrlnXhmGFJf84UeXVyQX6k62ZItsefi3CPzcKxDdR2s0Oru6TBItd86L0yuMYl
 0Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5cAdBszWO3ycw7CajRtiU60zkj581kBwr+ulfHGBmyE=;
 b=XwHvhLnGxwnwL+So+2+lcndojyUZEOe+6xRycvGrc5VUuIRgnZNpmGtJ+wmGoKYQns
 8FJEy7+mv85WfEqEP+MISTqBGefQPWoFXrLtJ9bpKJkgCXG8WgFMolEzqfiXEwihIthK
 HRVlaOnju/u5fLOpJ5RrgdTiFgRtrYmpTqZ671CVRGt3Rfj7+jgntQ/R8o6fOXjCx1CQ
 fpgrsKtCpt1MtlW/Hav6sY0GgU8p7Qjn2PwJsC/+kSB3YyrfLEWF+U3RdVPkK8YOl88k
 KmpFMAbI5pkXZCt+ZQNIshSE5uhmOOf/4AVFCAddq1MJi3B4Z7gJtmW2Oi/P9HzjNIna
 TmqQ==
X-Gm-Message-State: APjAAAWK83YJoaTeeeigPtzawCDI+Mdd60oAoI+A5szT0hO2O1k/q2qy
 upzWT1ZLn8VajiXjCm26ijntBg==
X-Received: by 2002:a25:58d5:: with SMTP id m204mr4106114ybb.325.1570668788588; 
 Wed, 09 Oct 2019 17:53:08 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id s187sm998401ywd.27.2019.10.09.17.53.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:53:07 -0700 (PDT)
Subject: Re: [RFC PATCH 5/5] target/arm/cpu: Add the kvm-adjvtime CPU property
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-6-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <53e8d0a7-1796-5caf-3774-38f82c1c8ecb@linaro.org>
Date: Wed, 9 Oct 2019 20:53:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007170622.1814-6-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EFqwljSVsadK

On 10/7/19 1:06 PM, Andrew Jones wrote:
> kvm-adjvtime is a KVM specific CPU property and a first of its kind.
> To accommodate it we also add kvm_arm_add_vcpu_properties() and a
> KVM specific CPU properties description to the CPU features document.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

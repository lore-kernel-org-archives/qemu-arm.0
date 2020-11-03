Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5086097lfa;
        Tue, 3 Nov 2020 11:50:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJQIBUhCpqf0utlP2Ko8bqfzd5DjCU5/WFYcWoB0O+bn4tEwbKl0Y4knon1yMaOsUh9urL
X-Received: by 2002:a1f:3ac9:: with SMTP id h192mr6550537vka.15.1604433027556;
        Tue, 03 Nov 2020 11:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604433027; cv=none;
        d=google.com; s=arc-20160816;
        b=gB89im6XrP5HXsxDnVrtN51jHU8RlR9XWWzhTU2JzFzNIbH+02WY3Fv7c1QzYLn6pN
         IPj+EYAAceLMKLqCF3V1RsE66KFyQ4xoRDEogNLYZXKXAWk8MT1+0A0dX3ZmIMVBr9Pq
         wRx1/CS84rn/job+Lm3d9lWlw8CZ8meTSrTX6gEJ4SbVnbQiBcS13oE92DAxolEyEQN4
         jMT88VCuKSwuxWU0tcBBObl8Yf9UkM092PUF12nyf0D/zWshDEz/Tnjkj/SAlxQj+z3M
         Sr+Jz5g2fPf8blUYnnr5WH8DrvxamRijqxmKz9cAmZ/HO0sygh4+1zHG7u3yui+dY34C
         t3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2LMBnzvWuNA2JsKt7iJqIrETp+IBDVE/GRNCQ8E8aBs=;
        b=PlsMF6cNR6E6Z2Qg3dHzWJMEgNDxN8mT2GED2qLhKWXx0nFCmqeWribTTZ+ovDB1Rg
         57ZFCtMeOPpASuAzZkkuDRd0yG8PfIw9vy8DxZk9F2jNz05VTE2gNQaiPT0KqTDHdg5y
         td4DKITI3rT3zRxyBw10FyyqH4kO8p1VVh+7oqt6tqgOtxz47PLWLA6rgygKj8qymFSx
         k4r0Pcj+UqrPg7PmzNP9iTdiU73ZqmMfvm95YnXsZvlvcgDqkNR2fNndPuHHYz/RO3hD
         4zQ4kv2HDIrtdK8QAlLMLncmYG8vTG9Zf/K63e/plmHiVc8ZU7xA7YeEX2Q6YsaWLZAm
         aMjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IGaDN2yd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si2707948vkb.24.2020.11.03.11.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 11:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IGaDN2yd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka2K2-0002uh-TG
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 14:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2Iv-00021u-T2
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 14:49:21 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2Ir-0000iN-TR
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 14:49:17 -0500
Received: by mail-pl1-x643.google.com with SMTP id f21so9063078plr.5
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 11:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2LMBnzvWuNA2JsKt7iJqIrETp+IBDVE/GRNCQ8E8aBs=;
 b=IGaDN2yd+hXfu9O4fM7eGugQ3v/Fh7dscL3PFQmFvNp5h0VD22U5ekmXk/alRBTVWz
 JCiB0E/4vS7SI6mGjbI47g5wrEDp/utyVtR1XSDJ+a/9s+FpcQNGwd55UhW6D98GINmt
 VPSxuxGgjkpOGkwj34prvPYoHdsgE5YsmYMfrsxf5q41o8WGe+DyK9KTpTF9tFtHpdLO
 VEQWi6j4nVISHZpaGRLOKJbP2cqiivujKNepaRw0lxZd2auwMONwuTlqNowY7Vjd4ZCs
 52sPXSX9xXtkBvTY+p8O/Mzm9G881suY3grKeFWdNuCe981lxO0nzREkjjfe0/kqsjHU
 iMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2LMBnzvWuNA2JsKt7iJqIrETp+IBDVE/GRNCQ8E8aBs=;
 b=U5KcD9pdZw55NzibJWlvnntham58Ib1faZapnGmNoNk6S0o0rmUS/sbcUs5Peqd/pF
 pV0Tvwnyr+OLPukcJiEULGNoBuusK5TDLt29+UqrgdBAQZRU2qNtvDeiOWB2URNnxqKk
 owEpgqVmrSPLZQezULCj4WEhqkPXYdg8NU5+bzF1HrVuAXTl30Ie70qRAABcrYlH6/H6
 Qzwd6IWVs3dCkAEUCoFlBq1ggx1+6iXq2GM8ecXvUZjidbbYhZxyNTIuJ1Z/9fOOo0zr
 /CK3YhMScsFkj9pkXwZTarutiS58Ub2R3Aw3sQMca9XhdPVcKAcRd/YQqMbvd7Sr9eht
 m1zQ==
X-Gm-Message-State: AOAM532xRny2l0PeZ+tq1wukYAczK29sqpFpgLr2aCEE4igqCiFBhPPt
 pIh+pqfnvRwZxnfSXULRDzkwjg==
X-Received: by 2002:a17:902:8bc7:b029:d6:c40c:9015 with SMTP id
 r7-20020a1709028bc7b02900d6c40c9015mr12724006plo.17.1604432951954; 
 Tue, 03 Nov 2020 11:49:11 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id s11sm7548834pfh.128.2020.11.03.11.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 11:49:10 -0800 (PST)
Subject: Re: [PATCH 09/14] target/arm: add ARMv8.4-SEL2 system registers
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-9-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d26e76be-9be6-e658-48c7-0f5246508517@linaro.org>
Date: Tue, 3 Nov 2020 11:49:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-9-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbLJPIQdwx4F

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  2 ++
>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)

These need a new VMStateDescription section in machine.c.


r~

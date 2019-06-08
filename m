Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1550863wrg;
        Sat, 8 Jun 2019 12:42:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9zFqbwQpvG/meOVAuoiGTVsukYGMf0SHr004sdJ9lAdZ83cMdB1ZzePa3joT2FmPIy2F+
X-Received: by 2002:a05:6214:10c5:: with SMTP id r5mr8679701qvs.224.1560022927215;
        Sat, 08 Jun 2019 12:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022927; cv=none;
        d=google.com; s=arc-20160816;
        b=M1gZJFuQxDYeDhca7bdoTsXK/fcO9NM6GDBgpNyaYCc/OiYVQSfCv//C4TAvNtlEw+
         RU+6MWXlpMLty26NOTTzBLOfyARYseV5qzwH4Q//s/5PeW1EqzJW5amg2+XJBvqS8eS+
         3wQFnzrn6+Os9YD4MEv+ckF8o0gMe3VSxE8qV4sPMUOaAETxRuiA3DqgnA5c/yV/EBiX
         qdkNcfQNAKcCbNHepD2XyR18kgQTKWB9D39dbJmIktDRYALDaVjTz8VZJj4gbZc/YabJ
         SkYwYC6gQb3ds8rH84K6hBZ+1vLtYGdoPlcejMmIxcqlKfL1k6aRPPkTO0K+sKJdQJ66
         Uksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TAJ9CaM2BRx0z1OoTQRHPE4OMAZbSfV4DTPBoBvpTIw=;
        b=jfY1EgcokToTgnaz22oLZgHNdyhAtUuhQr7ByjrTsHqwnAU4IHfpHgzXTWIWTS9X/y
         Zq03GU3GCds13z/w+R1tErZ+oC9w7MsS5CY9V5hsB8Sj0QD6mCuDBB6jFZndBPX62IEV
         xZfGmrhmwGegEQ0gEdFBBqW3zwEdCXLCiD1RZSZ/SwFdYJtwQjc+Mw8/QQN9C1Y6yzqP
         Zk3uAWabmnVvcFC6RimKrZk0S6PdfwJB7L8opo82Oq+Qe6jBcVQnkoTAx5qC4gnvLvGk
         8SdcBCEfWyxeF+s+Ce9pfyvWIj6WhSjVHSG6wjP5IN9Ihh3zvfABuSwaQZo8Mk1Uoqrg
         B+iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T0dcImXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si3557327qtj.256.2019.06.08.12.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T0dcImXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhE6-0001wF-Nw
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1I-0006sU-Mm
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1H-0007AF-Qn
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42308)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh1H-00079q-LK
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so4901823otn.9
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TAJ9CaM2BRx0z1OoTQRHPE4OMAZbSfV4DTPBoBvpTIw=;
 b=T0dcImXaHxEWxlK6Mo1x42hlJU6sl2TcAIkO/rxj/Zzqk/gKUoixvxFfuksPpRxKpb
 OlH9fqM4JqT0ecBBB874yYkcdrP4WmFENpPEvk7+HFp8MHQIceczHq7AJPjBwCkAvoM4
 ToL8r3uCCEtv5Ot7hjZ6N6HYF59104HX3JOsbhH8Y0R87fqRIuhOMQmm8RVGHm29O4AT
 7OkVDMVTseDC+kE2Z7qZlZ/ay3ZNjpO4fWVdLvWLJF0PKOeZbs3HIPcqHJ1lYvnfuJqf
 Ea/1Mh4iTEi1HRQZoOXtxnbAxEbAQV+3+VH1Ad+vu9+yf9kLGpcK/Wc0zXvTDpc89c4F
 UHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TAJ9CaM2BRx0z1OoTQRHPE4OMAZbSfV4DTPBoBvpTIw=;
 b=CtKiyyvh6ztr4XZKVUnAdugvjYktcDLVhoZhVIfRjQ66w7zm7yNPUz6niOL1XTx8uc
 sfZfe66Q57O68yIrXo65x1l/SZz9MhlkuWRDm27mwiqGWxGu/eXX9lSeb4/rAOt5XOPf
 CYHBwGm5cWiPxLZPh1i9+15NQdfzVXJqtUVKgIbsA9sytn8tVe64X8IiZAGlBX7GkUA7
 9C7WgBDByTni48y+zVoHbwQUlRXnS8KKJfwQTrTbJGgFCbdcB373oQaWogQnVbBx8lvB
 /cl+nrhIaLfyLGO7HTaheQ0OAfymi/E9twA1NZBeYUXLYjepoHabXb+Va9aXv51jM0Lo
 JGFQ==
X-Gm-Message-State: APjAAAW2axI+qp9JEq/A6kCSamIngehOczRYVRuEVHhHRg9t25/+MTEJ
 KNSrHPgZPtNbkOetbxmhygFQkA==
X-Received: by 2002:a9d:350:: with SMTP id 74mr24805765otv.309.1560022130998; 
 Sat, 08 Jun 2019 12:28:50 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id k25sm2063405oig.5.2019.06.08.12.28.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1b151559-67e2-3806-aa62-2b2d0d0f1b1c@linaro.org>
Date: Sat, 8 Jun 2019 13:40:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 27/42] target/arm: Convert VFP fused
 multiply-add insns to decodetree
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
X-TUID: 9bWHO3QCat4g

On 6/6/19 12:45 PM, Peter Maydell wrote:
> +VFM_sp       ---- 1110 1.01 .... .... 1010 . o2:1 . 0 .... \
> +             vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=1
> +VFM_dp       ---- 1110 1.01 .... .... 1011 . o2:1 . 0 .... \
> +             vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=1
> +VFM_sp       ---- 1110 1.10 .... .... 1010 . o2:1 . 0 .... \
> +             vm=%vm_sp vn=%vn_sp vd=%vd_sp o1=2
> +VFM_dp       ---- 1110 1.10 .... .... 1011 . o2:1 . 0 .... \
> +             vm=%vm_dp vn=%vn_dp vd=%vd_dp o1=2

While this is what the ARM names these fields, I wonder if it would be clearer
to rename o2 as neg_vn, and o1<0> as neg_vd.

But what you have isn't wrong, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

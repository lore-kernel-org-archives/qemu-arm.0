Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1563957lfb;
        Fri, 23 Apr 2021 10:51:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzxtPPzEfhGAfLoEmeDIO8YoO0ZkmrmwA6TNOer1d76iY95KfobbC9oy1pphl34mzfD+ms
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr3887812ilr.124.1619200275282;
        Fri, 23 Apr 2021 10:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619200275; cv=none;
        d=google.com; s=arc-20160816;
        b=hKEkMBC58GNQ2Kna9X+6T3bJ0aIviIpxYjm0VCMkcJ/vInPzrzKoQA/AzA3LrIPqCO
         ZVUFDJxch7NpFhZJYtnKu1uhzinPvLP58+KH9eEQg7UoXtl68+ko9M2mjFAPGIVKDko1
         m+pO5PgR8BJc3+OF/Bv7beitiW6rLzOClC1K4WX3NShEU7+czv8HojcdZjp26OGrErum
         Qcx7yZIVKQh9wpibcBXE/OLPySjOHqfR2keYcCRQYiZ1B0smuTPepulIyso8m3brMGkt
         UrIbxpqRKfhl1lr2PyCP3m8UZl06K4LxAL/+4U0qtPaS9X9eBT91I4UHV4Jn8KUqncTd
         dGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L+B2VZYSDiHJ2Lzb1rf1gu0HsHxxaDSIMaGwAQ7pHFA=;
        b=LWahSRZ8056cs1jXuCUK1mFaN8Eh8mv9rRVU1sbaAwzZlpnEnnbFtLfP7JV86HVJL2
         7OT4uoDUGFYOOQ266WHIlzTStF80y4+PS8kORxvl+4F5i8CCxhjvajkLqD24RCs21uix
         ANY72XeeYGYAAIyN5iaU2uSPv+maeMmkQJF1YQb/B1B2txlP7k3vWnte8q6Vp9nCQgvL
         B1HOHolYLSfUiY6YUMZZl5Vq9M8sTDZUDoypLod5nq6L8QItDZIKa5AbvewKGYa54oEg
         b4j1fLkLzOxuaSI/rJC+4Cx/npM8GIwHUmziomKPvk9G1GS7mIvWKoPp8zOpO4wQpHVT
         EDYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DA5eGJx8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si6251601jak.43.2021.04.23.10.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 10:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DA5eGJx8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZzxS-00066N-K3
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 13:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzxJ-00064w-Po
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:51:05 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzxH-0003BZ-7p
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:51:05 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m12so14973598pgr.9
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L+B2VZYSDiHJ2Lzb1rf1gu0HsHxxaDSIMaGwAQ7pHFA=;
 b=DA5eGJx8YCw1ehapSljDgqXVAdFxDzFMKYinzKXYpwhB3MkqVmCMzF8xPpGThk+drO
 PeTPap3Nr+tfry3tRg5hc49Eg+ws3RaJ1cQfLbCRL5zVXEeoEugQBDHjUaH6hkQqGFTl
 onpNbAfniR8pI7cezk7DPnu0tMDEqlCnLH6vWbSMUPQm9IrO7ytO3s4KfIX03l99OYyi
 F4aa7HpndKg/esdoAOLF9Y77nNxB/dhlFzYE8qEscSqsg6SHNI2HnCb6WqHLvCBRKkHJ
 EgGbO0q5jU2HXP2UgoGrNnaG1HpbKKhmXY6y83GKyV2nTIka26GyRaaPD2xqSBl3NE0Y
 jsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L+B2VZYSDiHJ2Lzb1rf1gu0HsHxxaDSIMaGwAQ7pHFA=;
 b=fBmaIPU8PPzGP1eBsWpCOFQV2kbDsiYDVE1OsnXwJAnLmAe0QQiXP8/8moYxuVInqt
 Drc7o/bDZKDuWsT4XU7Z2zZlb/LCEUj79MEDRnUJDtprk8JbADC4OWsInVDNFI8xbFIH
 YQG8qJznlQ7uI5cWKrlXKZD0kmhZbReZR1s1vS35xgTd9gMGRBVtP7gAA/MpspyHyjov
 uKxKG/27oUP5PEf9BcnJeYyPk9LGbYBpKp3gfWVghlA6I9HcLe73vDwrv/ngSmSyFyi8
 oUMgBli2P5qxiI35YeiSPd2eC9IfIYVaFEc6W/RcZ8j57jrUrILwM+D7V+1CaSLtEpqE
 rG9Q==
X-Gm-Message-State: AOAM530X5B3rBULMPX/AdKckUFIPosRTtJQEB2vm9i2IUf13g4Qlq8Sk
 eeCBkaSQp+nH36HkFduimO8unGyFgRvJDA==
X-Received: by 2002:a65:6a4c:: with SMTP id o12mr4825586pgu.371.1619200261772; 
 Fri, 23 Apr 2021 10:51:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 14sm5126681pfl.1.2021.04.23.10.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 10:51:01 -0700 (PDT)
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
To: Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
 <20210423123111.0575608e.cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f84d413f-6f25-eca0-e963-dc11e446f38a@linaro.org>
Date: Fri, 23 Apr 2021 10:50:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423123111.0575608e.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ulXENyR6zuBt

On 4/23/21 3:31 AM, Cornelia Huck wrote:
> So, what's the way forward here? I can pick this if I get an ack for
> the arm patch. If someone else wants to take this, I'll just ack the
> s390x patch.

You've volunteered, so that means you get it, I think.  ;-)


r~

Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp685525lfg;
        Fri, 14 May 2021 11:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwlJbJtC2X+aYS84wAaM78iZKm77ehGmMhb3hbwlxdBLju3AAG49KkKPGIZDTDa9ItOBpm
X-Received: by 2002:a05:6638:10c4:: with SMTP id q4mr1165780jad.29.1621018067757;
        Fri, 14 May 2021 11:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621018067; cv=none;
        d=google.com; s=arc-20160816;
        b=hArdlq3kLBiWrrRFKwr2LS/qIAEREnxVJ7ya9kfpPdn3tfUFivOZpIMs326wuTkrqC
         0vKuHTx6oQgrImbRIqSYTXrjgBJBLGAqaUDEajH/em7GNh4t16Iw7nsjbfcp+l93TQFl
         M0QH4oNOCunygFKtBdyIEkwDGcfLJExD1zuJh3DGHk5RmQTFSdKB1mQpJjMBWPj42HXh
         j14I1uUb+bJfzEY9Xd3CSn/8yC1SAJ4kZNrPPwF/ZRWSiYCMM0nhwQyIEvO+3mUe2p/n
         EHFP/NqoACfGrKQQ7mUCXkqfKaiH31R+Yij0PO9YWKgwQORLfDaKDBTp90dLZDMYnIqj
         w4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=00UNbHG8R9AgyWWp8PjGmvrM0CuNWPLsA/rCZjsZ8aQ=;
        b=p61iiaFBo9hNy0znTAQtAmGEEsyN2qFb+9RyDR8qG5mA0pWefsy+iL1JkWdDzk5a4k
         EJnZlKCZOspbMiqdT3Z9qreBoefJpiojO2XCnYURX719b5NgwzQabtXLxkh54f+JlTxd
         jU/0DWlSuK8nrD1Rjhj5LM0xjgWEa6Nx5gBte+HfE3z28efMPGcFHwr/ia0hR5vkQ3TE
         NmJo2q74nDOI6aGtVKpejgHYZKzUhq9v7/5n/xvWanG6bTHgiffx6BFjnhrXD35rNzJ6
         NOsSNb049Yz48w94BofZXljCGiGW2QH6NoS9v4fO/07TQXuB0zfBGGMmi3XovTgmzGGF
         OmNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N3yRHhvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17si8155568jat.5.2021.05.14.11.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 May 2021 11:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N3yRHhvx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhcqh-00053q-3L
	for alex.bennee@linaro.org; Fri, 14 May 2021 14:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcqZ-000538-7y
 for qemu-arm@nongnu.org; Fri, 14 May 2021 14:47:39 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcqW-00050a-FJ
 for qemu-arm@nongnu.org; Fri, 14 May 2021 14:47:38 -0400
Received: by mail-qk1-x729.google.com with SMTP id q10so25498057qkc.5
 for <qemu-arm@nongnu.org>; Fri, 14 May 2021 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=00UNbHG8R9AgyWWp8PjGmvrM0CuNWPLsA/rCZjsZ8aQ=;
 b=N3yRHhvxxnbKqYGnkNXh/5/DtMoOHdOzDcQUY3RtyORpQhHHsxQar1K6IBjvQqy0wd
 LLfZGdke9NxN6ECJn4hx0QSGK8yj0zMecpaHZKha4CW8iTpdnFZtq2DliJPxc0MLaxtv
 WtCKtGDHDsIw1p2Z6kAtgrWKWGXmRLZ1AyoWN9sfsMJy6PKN2nB//UoSQiExlnziVz08
 CmpBrldSOz8eLOeWPZN3u1DgoD0Ds81HX9HKyQTrkN3y8cV8b5/te5otNVLXC62FN9pl
 EiNJjuh/CNlG3uBCmk8vfuVX8AKsSaKKgNEfbPB7vZ6lUob+6YpoOiBj4chOxXYFlIIg
 2kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=00UNbHG8R9AgyWWp8PjGmvrM0CuNWPLsA/rCZjsZ8aQ=;
 b=OfHIt1AOlx/R6aesb8sB17kOY1TWiW3GXX74YzXmdg7LwjzD1kQ9RI1arSBuD8A28i
 ge1Gwt40MxQnzd7s9PXPzU8YqfFdpTtSX4iuLF6cVfTdlnQqHJjYPw0xeF11lAGBohgx
 Do4d3YMnvlbwxv28HERYG1on4LVukWkv/OZjL2lKAphHaEIzRvYvxD3eL8NS+c0UM8WJ
 EkfIY1p0Yae9P34J0EWe98DDHMwOuLx0UXVDtsR6kOkwypDvKWmlN1mTmgA1vq8f2ND7
 xEjsjgVb8XyReHzeNcS1dkGNFC2kGOSguzXcasiqj6WZN/QXiHZ4OrNMIQXMZNQGB9EN
 EBCg==
X-Gm-Message-State: AOAM5324ED4gvZ2UEbSgTZTUv1PEsdki32Wk78thI1K4ooZ0e+unUmsq
 m0B65T20Oq4acn68iK1hBjbRQ3OLPgwBYio5
X-Received: by 2002:a37:9042:: with SMTP id s63mr46147958qkd.324.1621018055449; 
 Fri, 14 May 2021 11:47:35 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id q13sm5308610qkn.10.2021.05.14.11.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 11:47:35 -0700 (PDT)
Subject: Re: [PATCH v6 59/82] target/arm: Implement SVE mixed sign dot product
 (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-60-richard.henderson@linaro.org>
 <CAFEAcA-_SNn6bM52KV5z5v8tLS1e=-Si+KiC_gi-3oykV1Rzkg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fad61fa6-cb4e-99bb-ba54-f24cc95a6c60@linaro.org>
Date: Fri, 14 May 2021 13:47:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_SNn6bM52KV5z5v8tLS1e=-Si+KiC_gi-3oykV1Rzkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OMgF8p2WOdmm

On 5/13/21 7:57 AM, Peter Maydell wrote:
> Maybe we should macroify this, as unless I'm misreading them
> gvec_sdot_idx_b, gvec_udot_idx_b, gvec_sudot_idx_b and gvec_usdot_idx_b
> only differ in the types of the index and the data.

Done.

r~

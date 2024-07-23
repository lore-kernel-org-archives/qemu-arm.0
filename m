Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2228019njc;
        Mon, 22 Jul 2024 18:11:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHxiB1BDFETldVx77FitrHHTdpamvqP+zuFSZjrAtC/6NHETXB0Fsyo/rdLn1OpbK6cTdk1mnViWqS0ifJLs1paU0H7CZ7
X-Google-Smtp-Source: AGHT+IEXiTOe/WaIJMg1Fuen0Y5veVfPQMlCcj1+/Faj1/DbY4JZK9hM3eFhkABdYE1lkrSsnUWx
X-Received: by 2002:ac8:5848:0:b0:445:32b:df03 with SMTP id d75a77b69052e-44fc552ac40mr17716561cf.33.1721697075031;
        Mon, 22 Jul 2024 18:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721697075; cv=none;
        d=google.com; s=arc-20160816;
        b=ouYmFthrADIDNGyiyLREIDY2VQYcoERF3P7KQizGC1Jh8xqNwoqSHneX82QZv6NRom
         dLSNaHUbunnvvJlEzIwcoaDB1pkCvL4qahtOjU8yPslOavV2AXAOBR6AKutUg1crW20J
         sUbJn0g4lw58Xr/FMCPnWF7/qp71ff7tSApXZd0pLHpPTC9z1wyq+WNGPHB7YTX7n/3V
         oFdz98rYCamjMc4/pFDokmH3jmcqYp4/MuAk5NGbruhF28Vlc8ws2hl47QwldI/qVPk4
         7iwdL5KA7d/1vsWqidTfs851Ov5oq8u8TRRWuGVfnoqdnv9BbAJ+KxUC0GgvpPqjOenm
         H5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MBTeDaGc4dMe5APyzo+CnhQbmnC84mS6gTDqDcVaWc8=;
        fh=/C5mXO/AroHdoy8koVie6J1uojXopjROZ9ZH57o/m2s=;
        b=M7uUmii9mv0YzT0tf7fjPLd0NIref1NYvlGVcwzmOcx7VW2xz/kvPr7JMZDvPfGi0e
         ollhQmCY5ZPkX/04rQn7hz05kuKA4D20+2kakdw8bao7HKKdjOkuETzAXy862+opfD1l
         TFTh/CzHW0r7EtOE13usapcY57hSI/B00uaS0E0WMu2DiVbCB8HM9Qkr1kCuzR49q1Pu
         S4urKvRzLsBQXVfzx8x+pC2/FB1aNjR3ozAEFyWEJs5P4TGAXdjRb8v3y8FsBkIJXwWE
         ycssTyWeLw9WbqZaK9x9R9cn6kiygi66ASlF6xg5YVrrQuKb3OMZyUs+uGD+RCa8o+MP
         BYzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWn9eLZX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cd27dc0si92311621cf.165.2024.07.22.18.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 18:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWn9eLZX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW43T-0007ua-52; Mon, 22 Jul 2024 21:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW43R-0007m5-5I
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:11:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW43P-00012G-Hl
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:11:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1fc658b6b2eso2365615ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 18:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721697058; x=1722301858; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBTeDaGc4dMe5APyzo+CnhQbmnC84mS6gTDqDcVaWc8=;
 b=JWn9eLZXEFhH9mfQoGez7wS9rcrXGRsXL/Qi0z/dHKzT2udgeMcGgeDJJRgWvFoZU9
 6eec3eVjSGY6rD9OPxQIYsRXcNhrdsrlEasHkbGoOZE7Znb18qRhlLm6QztL1m5F3KTB
 wY7eCJLqC47IK+K/u9QrP0j0AkEULFUTp6AQqyGPqifkzR5zB5QxsWVyUVZVQxn9gOkD
 xzD/ZGBElqIyEG94S1SFvzjEdfRnVOiHxndw4IEPlPt6l/MV3ZjrKg64aDNZpUNWNJoU
 rjuDRZ2XOmQNqtvecp7Vfvpvh1XCMUjLvm4YdvyKjUaq1ojYsVnrjk2Dbfo0mq6n6Hc3
 aZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721697058; x=1722301858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBTeDaGc4dMe5APyzo+CnhQbmnC84mS6gTDqDcVaWc8=;
 b=roZcqMtUeSGMcb4wNQuB4PXTQZJ5q7tPc2FPfpBccqoWCmgUnEMxLY75T74hxp8whu
 LfcmYcBNUSD/NLBEyXg6zy+CNM1chuMBNmh7s6Y7PVxiYz0+zUj+cCWK4u/cS5kOpBIV
 8JFgkbnUqD9fLXMW+AAChnKbORz/nc9qpdivmYOTIx629pQMl9qh749eqMRvs0tmUj+S
 pw8Q/XaXs46fnraFp15Ptaksaj/iBMOClBqPEeZgAanGHQBf3af6HYlunQ++CNquS81J
 Cp+Q9++CDBLAoKZEdkFoAJKPnSwsZsS/FPX4qAb4DRtkigCXvYwQHNWdvCjbVCXQFZID
 TYqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmz5g7nKJ3Hqgt7kelJ1G+A8nkvq09r4qUzyycT2/W3R9bNTNpa4YzZgQ3zGxCBIJCWJmb+JifpawDZQppX2G6hUN
X-Gm-Message-State: AOJu0YxJwOnUi9+8H+upmUR7eXtztilO+u3u+Mo8OjYkLWzq8zq/yRFG
 ROh2m8eIULVjFuRZ01v25xHZh4eo++7rf0mmC1r9oq6nLqloJg1OFWS0Y9Zmw40=
X-Received: by 2002:a17:902:e54c:b0:1fc:3daa:3a3 with SMTP id
 d9443c01a7336-1fdb5fb1cc5mr13110735ad.39.1721697057572; 
 Mon, 22 Jul 2024 18:10:57 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f29409esm61526145ad.101.2024.07.22.18.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 18:10:57 -0700 (PDT)
Message-ID: <11297acc-de3d-4e74-9e1c-5f08ed219269@linaro.org>
Date: Tue, 23 Jul 2024 11:10:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] bsd-user: Hard wire aarch64 to be 4k pages only
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-11-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722214313.89503-11-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xNTV+aKOXA5/

On 7/23/24 07:43, Warner Losh wrote:
> Only support 4k pages for aarch64 binaries. The variable page size stuff
> isn't working just yet, so put in this lessor-of-evils kludge until that
> is complete.

Hmm.  In what way is it not working?

What if we limit this to bsd-user/main.c instead?

   set_preferred_target_page_bits(TARGET_PAGE_BITS_MIN);


r~


Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp2045141ejb;
        Tue, 6 Feb 2024 12:10:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFV4KtMNnIRofei1NPvcDG5RXQXkcl+Js/KHI2KqeAPRkmQmRaO9N46koBEsg8B6AlJEO3B
X-Received: by 2002:a05:6808:2126:b0:3bd:9ab2:fc5a with SMTP id r38-20020a056808212600b003bd9ab2fc5amr3915077oiw.54.1707250247418;
        Tue, 06 Feb 2024 12:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707250247; cv=none;
        d=google.com; s=arc-20160816;
        b=mZ5J8P5VAnKCyJxQ/gKVwskX1vQJkN2PdzuMGOV2PgkFeO7MAYJcT2Nzj3Ex0ECmIn
         fv1BcS32k5QR0KpVYaM1zU5HjFfJpcfrrwvmwBsrlgQxi/o74/aOaWGwxYZ7xo/cEm/s
         zDasAmCmjEZ1feXWzU1lO9yyGaPuh4tF2fFRO2pZfbVyyNL+F57frKGFJyXz4fkjS/fk
         mwvS1cJfO8Us2gXulq3H49XroZ/2uU/+qH2hz85J+axleQhrZkSYsp9UqYP+9KMHbg52
         0EZjgiy+zor5GcVHVXNH8GKD8IrwmtRsaPxBPczfIo+st4Ne4N00c+4WKcuwUDXHzdrj
         AfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LDrV8/y9IikSi52rZDgFDEB1bT0pc+4WpLRznZfIRUU=;
        fh=b5QhVFeX/UoSl8aigUy86hpH+j/3F3CqQgJAM6rAoJA=;
        b=ObVdUgGGKeB5mXC7sVQwVDTAXQgQ9u2sVaf5M+1YAXwVLXGOZJTMmTWzkyk2Pr47K1
         uwJvUNfbeAs07Ki74wDxrm+2W5njlgn2s3D1Q6lfa87+cYWEREZDA8oYhHeMZ4MvoJyQ
         BH9RGo66zdxKl50FMWkeu9Spsr2n4kMAmGTgk5OfVuvmkQt6ykhKJU2Rta+gJHyNV9Hx
         rkm2DnqxSsKbmUBcNQQpNQrn2pFL367xxdsvw15nvrtMEBOafnvtlkd9WPoQfci93cTP
         I3ZBN/MRod2x9E5R74xsi0Eb6KnqeUGVFbH0GRKePLQtJCOLBktGKy2MZ/bLD/aORzNO
         vntg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVmTNPt3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUn4PG46ijfKzQQyNGXQl2KUG59awA+/0hz28e50FCZrshFkSNyhST7Me0JLH+IBepZHrZsTslOIgwErvAFQokCU5PdyJY3
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a05622a034d00b0042c1cc467adsi3255825qtw.218.2024.02.06.12.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 12:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVmTNPt3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXRm9-0003fD-7J; Tue, 06 Feb 2024 15:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXRm6-0003eq-KA
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 15:10:35 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXRm4-0003aP-7R
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 15:10:34 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2046b2cd2d3so4524575fac.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 12:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707250230; x=1707855030; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDrV8/y9IikSi52rZDgFDEB1bT0pc+4WpLRznZfIRUU=;
 b=nVmTNPt3Dl7By3wv1QVq4n65E/hxXkmPJxHPs23QCowheUD57xNTBEdjlx1NoaN8m+
 fYhFCFuihLPeLqWzgz+CgipcigL2zjGu31UosmbiNvQIKvdVPsna+KUe8ZdEXWX/vEH1
 h37KNzOaNApCiHu6KP4/6A47XCJfRpMlUHtb1nMdjWdkBoYYuq6QM9wkNIMh6BLtTX+O
 RwNnIlbA7PL5ADnZLfns1LtCgH0LGUpmr7+5fbPA6kYAB83gzbJ+J2bChiShAhk0DvZR
 m0wVC2IkxahfjE00PNequXk+X7SeGrK/78og0PrzLtHRvchaXNbPQfQwLe8LtlPWNY50
 b4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707250230; x=1707855030;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDrV8/y9IikSi52rZDgFDEB1bT0pc+4WpLRznZfIRUU=;
 b=O7txvyb53pVAqJrBWXxEPFDDK/6JEcoVOxPcbptinXlwZJJp3q36zQuhZPjL/a1p8i
 OOC05KmBRiS+uK4AeT/PIcxc7/X062CwZ1+VvHRcrbQPE5Nb8FhbO5n2vczpi8c0z1c0
 BBvmMDHC2k8FL9d0KzuBCL4s4AzMhD8sk2Pm0oR54lOQBC7uBLPS4xyjwBXAUxDQgG/g
 DVSfnO/ilDZmo0tuOhllA+Gr7s7lBvuoYocWFXafR/XL2LeoTSXSi6gk0uhHjxm4GulB
 tspHu03NlC0EI1gxhJ6LZnh+qA2p+9vYY9yHKfJLyzGccDqJHu/GSa6hSI/c+uHCUS2P
 YV0w==
X-Gm-Message-State: AOJu0YxTyRQliQhJmw2Q4WQaXTumetyxd0r1Z0lU2K7cDAewjX2kxoJQ
 o/tLW50uLJ37p8UXDdcEfaP6uo/9a1OHQwhKtfr3LPKGMoNAM98XwyLCTqWsafn3w/VvUJ8wN9I
 vkK0=
X-Received: by 2002:a05:6870:6112:b0:218:dfd5:a5a6 with SMTP id
 s18-20020a056870611200b00218dfd5a5a6mr4105910oae.2.1707250230255; 
 Tue, 06 Feb 2024 12:10:30 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVsL6rOckra9+qOn0K3O+8+SRDdYEjkBsYFPcRTNWCMcpdFEDdKfMZ/ozFlqjWtcZT4OqypvJhba0P4WnsvLpRkAIbpbqrurzC8aM+CWsMVXKZmfru7ojDh3t6/cpqw
Received: from [192.168.0.100] ([43.252.112.200])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a631a57000000b005d8e30897e4sm2518063pgm.69.2024.02.06.12.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 12:10:29 -0800 (PST)
Message-ID: <75779607-c0fe-4a3f-8555-db26d9894b99@linaro.org>
Date: Wed, 7 Feb 2024 06:10:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] target/arm: assorted mte fixes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <CAFEAcA_+H-HHCN=WiwNjvOKRuVU=A-TnsosCSf9aTF_VjSgR8g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_+H-HHCN=WiwNjvOKRuVU=A-TnsosCSf9aTF_VjSgR8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ebv3W8M+Fgs2

On 2/7/24 00:54, Peter Maydell wrote:
> On Tue, 6 Feb 2024 at 03:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The first patch is unchanged from
>>
>> Supercedes: <20240131003557.176486-1-richard.henderson@linaro.org>
>>
>> while the remaining patches replace
>>
>> Supercedes: <20240205023948.25476-1-richard.henderson@linaro.org>
>>
>> While digging through Gustavo's test case, wondering why it
>> should be failing at all, I finally noticed that we weren't
>> overflowing MTEDESC.SIZEM1, but underflowing (-1).  Oops.
>>
>> But I did find a few other points by inspection where we
>> weren't properly handling or supplying MTEDESC.
>>
> 
> Should some or all of this patchset be cc: qemu-stable ?

All of it, I expect.


r~


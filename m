Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2332092lfp;
        Fri, 14 Feb 2020 12:11:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxfU3u8sB/ZMI/eLwtunY1wjbkHyt9aMGYWzMBSrRnDiCSwggamNk+0vmGm4J6mg7CmAVXI
X-Received: by 2002:a0c:e150:: with SMTP id c16mr3730176qvl.51.1581711116814;
        Fri, 14 Feb 2020 12:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581711116; cv=none;
        d=google.com; s=arc-20160816;
        b=pPV/tHKBGuI3swbOhbfS9gtfXpUKkW97t8wDwzLESxE8BdOrplGVtNU7DXNzIZOaMe
         GLLnjyCNeLObJ1jNDeMu5lSCEBYBkGz0EV8VucdhqmkXwzEPAysev/MkNM52jBhxvB9v
         rleEtZSZAU+lH3bm8PLbEK/0bMDw/69eabVkM85xMnpZ4Oni+Z5Z5FBMMzjvVry1mWm+
         rarnBHBBdsjT5vGJb96oAq3PE6JSVk3XICB/81JPW+3ziEJaAQbInoaJ0/go649a6IM+
         hDeLf/BeP5AmYmsu9mWsG1lwBYx/L9kXwnClveRebFruira9TNumrM0s6XXpuZJ4pgMU
         m7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TkrvTu49HwWJpVtG/5gPH62PDMKR29HZzdS6ge7jRuE=;
        b=uOAhb33BlsGtwZBHiZtG54NxKDfYTP1xkV+f3GuHNKr6Lw15I9rm2SUEkio8XOmWu9
         G3xtPvuSBxcq4Lk/jqlIPCBjIbUtVSYXoQ47AZ9ZhRMfLmox1vLDdzZy+zKidlnmqvR6
         dussrR5wOhg7YpJs057sL7uhRGJtLZJN4c97Aox7Y2XBFn8aSTztwCMTU/xD5qbC9wqF
         rz9OCyFQuQVWOdb/KetP2kPOZwVkvdIPhqqVp6fDe8rZIBhq5b9t4+BJC4uy4VdSiLAD
         LErQIEOSoN3o57BU52l2nwxSCcM02o0101Tj9irGvkXZoMpT9b3rdqOZkghajQvofXs4
         u8Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfS4YDWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x50si3108866qtj.224.2020.02.14.12.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfS4YDWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hJc-0005fa-7K
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hIS-0003y0-Vu
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:10:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hIR-0000gK-Pv
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:10:44 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hIQ-0000eH-Sw
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:10:43 -0500
Received: by mail-pf1-x444.google.com with SMTP id 4so5380464pfz.9
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 12:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TkrvTu49HwWJpVtG/5gPH62PDMKR29HZzdS6ge7jRuE=;
 b=OfS4YDWcIUhGTXPrB76n26aeF+1PDrNHzmWTXDbIkl4nIaDyrRs8omk8XV19JOt8C4
 ODXIJRQB8RSFLTk7MCoLUQwyUZ7/mpTDcoFwqEbDl3rWUMAIKXucnUs1GaVy7fRIvI8/
 iY3hkZe3NH9VYhhD+oog4fW3CNjP/qTB1UrZ6ZPF9xF0pgJTF5eOPOY1sVihS6hjDwxP
 5rbZzmj7QzK0QlrBCJ08ZcYQYph7S47oDJmAX6NtedBtrPO2c2VUvMnLTcj+Bq7sZn2y
 uJrPCiVZp6U3uGcd+SsduL6snrZGgLJp/uWEWn888EQiVrX9gluzj4Hl6Q2hN4VokbxV
 uXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TkrvTu49HwWJpVtG/5gPH62PDMKR29HZzdS6ge7jRuE=;
 b=Rah04/CtB0HAz8VeR3BBPdwnLdCh7bbqg5EeuhuBnobBIBz5LHgY4vWHOW7yPm4sQ2
 yMRWUST9Br0THpTfQYDaByveId6k6jIL1CjomkLnmbTXE5lO+KlOWxUaucvjNINN6ZB3
 BXyqfrAmJbVb0lre/E8ZcxS96PCIL6diMNlFcB3jw+w8CS4iH5bfPmiDIPsegufEeWf+
 CFV020pgyqFb+Rr9Y6272Bst5bhPo5k2YjDm4CecGQnAFeCsVyn3FmnisJPcnh+j2Dtk
 uYPK8KG3fM0N0vFce+7a88hqSlDQQ8ZyOQa0cUUomPSrfUouzw9rk44j0CK3OkAMoEu0
 xp/g==
X-Gm-Message-State: APjAAAXQtzMDuOS+3O9+zf9u80+8wh8dT+pC7TCGegbAJ2p8XEJBzVpa
 XiZ1PpkYfVAkfl8Z09W0u6wjpQ==
X-Received: by 2002:aa7:8502:: with SMTP id v2mr4917249pfn.232.1581711041551; 
 Fri, 14 Feb 2020 12:10:41 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 a19sm7374576pju.11.2020.02.14.12.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:10:40 -0800 (PST)
Subject: Re: [PATCH v2 02/21] target/arm: Check aa32_pan in
 take_aarch32_exception(), not aa64_pan
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <384a16ff-1251-5ef7-bdba-5470a111665a@linaro.org>
Date: Fri, 14 Feb 2020 12:10:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y4Xa0ovgKXh9

On 2/14/20 9:50 AM, Peter Maydell wrote:
> In take_aarch32_exception(), we know we are dealing with a CPU that
> has AArch32, so the right isar_feature test is aa32_pan, not aa64_pan.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1563808lfc;
        Mon, 22 Feb 2021 00:42:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi3z+X3pfqwue8/4PY5PiKSo/O2t3t9vypdMLlzE+uFRovj4rFOM0m+huZ91vgvB02uwak
X-Received: by 2002:a25:c749:: with SMTP id w70mr30611267ybe.393.1613983368374;
        Mon, 22 Feb 2021 00:42:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613983368; cv=none;
        d=google.com; s=arc-20160816;
        b=vUuVE13Jk44gsxWFWRMx9kCye9fJ0MBqDP5dLKGjcjTeq4HyHkEolfzoXTlD5oK1pk
         og2QT6z/lZ/FidzJi8sX7qPSFvpoEuM4RoYJiw8SI2kZc906X0RveQ0xCANMcIHBZliY
         wW0kyJiBhGELMzrEFVDA5nFG/OGbys6I+kT7TPctJuJhcMWXUJlUaeOikfRjQsRtdKi7
         hsSSxqgNl/vgrUV1NKz53JsOq1/tg29TsDTpRjkJa0KR8DDRDLbtR24RFnuPT4KE5Z/6
         MO33Ef3n+b4mtdPcl5gQ0vPBjmrIc7u56xEWZD04FIBBo/Pagr3N7OJLZ0xcsdkZoU3M
         c9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tygrm846ZW6orgUpekWbujy4yxBMfasa9rICgjuq7VM=;
        b=LhpEznsj9DXqfX59RKADumz69MQRvMQMbndyezK94y3GByH4owjbDKBx+8G4jvWQ09
         NDGV9UEQQnJIFsmFz58/VC+vuya7HU5WnS37HBJ9+hO8zoZ/inTP8X79ZYJUr+75rbk+
         C68C8TfUgkrL2XyunJA4gzqeN0/4MW6zPMsaHRj+9dSO8Ri1wyg5vLQC02dUQX9nLQu/
         LBW4oLc8g5g/ZUCr+raMAdL7s9MsneuLdrYtol5cSmbWsfXcMw4DYIuBQPY6dVvKX+Uh
         MZMrCtR47weQDN3bSup7LUbgnqI3etriUIbyrSVk+MY5EypQ5H5aizP8zWQKY+EVVfRp
         q9Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rL9mJtua;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j198si19343354ybj.27.2021.02.22.00.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 00:42:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rL9mJtua;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lE6nn-0006uy-Mv
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 03:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE6if-0001Mi-9p; Mon, 22 Feb 2021 03:37:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE6id-0002qr-OB; Mon, 22 Feb 2021 03:37:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id u14so18130728wri.3;
 Mon, 22 Feb 2021 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tygrm846ZW6orgUpekWbujy4yxBMfasa9rICgjuq7VM=;
 b=rL9mJtuaMNq7Tgfkp/4a9BCRomcxofKKBBRNOgAcE8qBMC1SuBO52xB9p/UH98RJ7f
 VJsvnDVq9LofGprPwX4dVrzPPE3QZmhi30K86WhsMQJyXyO2svI/wjvj4Lfj5gIZvNht
 UOY9745Lkke1yDLJwzHUKLvf184zRAIfcLzeinO2HJDSgngCmk3kmSk5kvMljHNT7f7R
 jBT6Oaspy0ZKY7IN0ys/KkksNlLDbFoEJpDn04hBYKtAIwran0iq9/Hnd3od4xc3U/cv
 T2TbEE/BkHGPe54W6h2R0DQIyVkiP0uAo1YsQL6H4VLzMLvbUl4Acqx8wpcky6SkBWON
 wekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tygrm846ZW6orgUpekWbujy4yxBMfasa9rICgjuq7VM=;
 b=dqZ3ZFaxyQu0LkKX7p5+iLM8kRBtYJAzFGcf1WaIplRdcs1/u5NPclKq3e59TaXxqQ
 XTsW1LhQKlZhfhLFxAxgudA9zgHgvaH3tJxesu9sR7jSyiGMsz9ZBjxt7hge0sHnfFLh
 gCULd6ykkOQr+MYlcpNrN3kPGG6topjzg1vyCNPwdaEw+VgFweZcIRSzjtjebjbIXw6Q
 EnWkvqD5i9kkTf6+KjXPFrnh5FNMdS/reS7PCNn6A901oQeT7WdXdItXN1pWdkToRbPu
 VDOamReZWSoHbTyv1A6oxOZeqHUNy+LE0WDNfAPQAxWD88eA0uQITZKy1gE6IU5AvURu
 wrJg==
X-Gm-Message-State: AOAM533ejlMywkZOoXtokqfoETG/LNrzqAGRPa+f2FzuyOZ+0nbEglvO
 HkNpJoPEIvSVauQRXjHeBa1Dtikz+qM=
X-Received: by 2002:adf:de01:: with SMTP id b1mr19996579wrm.369.1613983045948; 
 Mon, 22 Feb 2021 00:37:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q25sm19890185wmq.15.2021.02.22.00.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 00:37:25 -0800 (PST)
Subject: Re: tests: n810 arm failing
To: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 avocado-devel <avocado-devel@redhat.com>
References: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
 <CAFEAcA-yLQNLVUPZPRnTTNupkUrgcTRHVR=SW1Yb6KEUeQjkoQ@mail.gmail.com>
 <85acde21-88ac-1925-b6f8-ce12c649556b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <605e1cb5-a9b0-5c96-f2d0-33f14755feb1@amsat.org>
Date: Mon, 22 Feb 2021 09:37:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <85acde21-88ac-1925-b6f8-ce12c649556b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GazxjtqrWeqX

On 2/22/21 7:25 AM, Thomas Huth wrote:
> On 21/02/2021 20.33, Peter Maydell wrote:
>> On Sun, 21 Feb 2021 at 17:26, Philippe Mathieu-Daudé <f4bug@amsat.org>
>> wrote:
>>>
>>> Hi,
>>>
>>> The n810 arm test failed on latest master:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/build/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/
>>>
>>
>> It passed on the gitlab CI run on the exact same commit hash
>> as 'staging' before I pushed the merge, though...
> 
> Looking at the following run, it failed with some timeouts as well:
> 
>  https://gitlab.com/qemu-project/qemu/-/pipelines/259425956
> 
> ... but in completely different spots.

This one is "read ASDF from console but some char got eaten
so ASF was displayed and Avocado is reading infinitely for
ASDF".

> So maybe it was "just" a global
> slow-down in the CI farm? (Which sounds somewhat worrisome, too ... I
> hope gitlab-CI is not going down the same road as travis-ci.org did
> during the past year)

The question here is how can we detect the failure cause? Is it the
CI infra or our test?

Currently Avocado only dump log for "FAILed" tests.

I sent a patch to also dump the log for "INTERRUPTed (by timeout)":
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782782.html

Here we got an ERROR result (SIGTERM) so the log is not dumped.

Regards,

Phil.

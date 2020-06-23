Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3880064lfm;
        Tue, 23 Jun 2020 00:46:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/aTwFpc9+FqPUzQ4Wi3Ap/0p4e7XzmcWLepx+LwE2IPf9cskMXVOZN8soI8c3SEEnu5z7
X-Received: by 2002:a25:cfd6:: with SMTP id f205mr32924187ybg.363.1592898375130;
        Tue, 23 Jun 2020 00:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592898375; cv=none;
        d=google.com; s=arc-20160816;
        b=EYPULcSFlFMkBDJ6qZuLHRJkhDzp5Tvi90Ypf9PpnBD6WKAEKmxMzGvnMWsWFT5L3E
         dEdvDLXOqCKoG7gpkayRGC/KdfBFsVBv3281Kb8sGqa8uJyJ94iDvIVWt8sgS4usBNBY
         bE4XyXrtpAu/SUKcEtZHZrXlV+su3VUBmKW3RxjOrPIUZU0gLBSdOlXsNAYvxOeMP2fP
         05vQFt660c9c+SIHG/64Pk6oZn42kBXFEswBqehTrR8kFZJ4isY50rn33cau1OzkaLym
         z1D5XcbRjGZ5pz/bVYS05ADTgvxUtEH3p8T0ZZjC8Olz5SnAvTWfVnUQR0lwALpzdENp
         t47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZvcA7g2Qkj1AOQ15Z8eg4byP0PCtRVIbTzCf5HrSQrI=;
        b=pW7iEGguiPFD/jY/mOv9dygaAxApvQ5P0Cplyz7bXywqbV8xJHrtp6AabBb3M+VuGi
         H4pHCy9Lv/dxmcbmOtZaJB68icRCXRd1ORGFn4uBAQWuNi1Ti0LCRTdRCv9+NRJS77X/
         E5NNFgOsWmrbVQWqrY0409QbgLLpBrgZpJYuE7QlK+vPQgTKau5YsjwEyO4CYJURoYPU
         utL7QTyKWtoBiJv/Y+0M0C+GNCcu6znKr0Hl1/UkvTKWN1dqYcsCVSfm1sSYkEUeo7cv
         mpFFibmBD46ZOG7LSHRU1FXN+gNdiBXsbOl/99YnX/6V1Uwlwy+cTZWl6PcMU4a+wkil
         uY5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h+p3+zqT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 64si14309537ybt.471.2020.06.23.00.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 00:46:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h+p3+zqT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnddG-00005m-Fa
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 03:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndd3-0008W1-S0; Tue, 23 Jun 2020 03:46:01 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndd2-0008IA-6k; Tue, 23 Jun 2020 03:46:01 -0400
Received: by mail-wm1-x344.google.com with SMTP id u26so1606021wmn.1;
 Tue, 23 Jun 2020 00:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZvcA7g2Qkj1AOQ15Z8eg4byP0PCtRVIbTzCf5HrSQrI=;
 b=h+p3+zqTF/Z3YnFztdYCqZFnqe6qx9wzVvSwKFgT9wFpZHxHagHuJpjqafe37rw3i/
 oZYDc/jzETWUKzR47ulVyI/C//j862XpPXW72vVlkkQm0GIp5eJtXGpVMijJ6/AbvQkR
 Kr55o2Bnjh9CqZ2NKLJBqZWMqGpYlfN5+2PRYKfRLixdxO7tKa/Ru+r2YmY4pwiW6avI
 FI/aUDnBHJVUa0FIBsue3OC6fJTpDwmB3FPoiMcNICrkG8uXVRPRvq2t2UhSQCDMJF02
 hv0qKmQ7A0vfcYpYBdwpzQ3eFg022HM7PRdKOnCaY/Hj7JEflgjzrwHg7dR8Kz476Pxs
 yhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZvcA7g2Qkj1AOQ15Z8eg4byP0PCtRVIbTzCf5HrSQrI=;
 b=OYK/82U3Je11NlpUXaaipkw+9MzjXJNB/o9KKKxXHASmgeJxo+3FuEGrcYC6gTi2Ie
 1Nibm7MIPPcy5izyhUfgriyTNp51kqdvBg8qpdUw3Rb2QF0EuDNJjpcUTFpA+ejKrp6G
 2HHImU7epqqLzBE8yHXawqGu4gw9nKLNl1n8YJd8HmapklnVwQc6YIXUTOqTtXBvJh9N
 P/uo9v+vLXpgWPUR+3RlhwJoxO4jIt3d78eA5X+4zSsRPkFTAPvF967jp+7x7UA20ZCd
 8+uLNQgoaKJjQKvb+bKR4hLDi5kkUl7agnVpfHAmLDOiQcf9NOIL5/KupcUvxuoDy03B
 HUPg==
X-Gm-Message-State: AOAM532+cLQ31drqOSRU87w7LrsVU0dqyqD3pAg+9I6HlpgUpTYW97kf
 wNBq+ESJu58h7RzDWNhx54w=
X-Received: by 2002:a1c:e355:: with SMTP id a82mr11598858wmh.165.1592898357801; 
 Tue, 23 Jun 2020 00:45:57 -0700 (PDT)
Received: from [192.168.1.41] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x5sm2634104wmg.2.2020.06.23.00.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 00:45:57 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] hw/misc/led: Emit a trace event when LED intensity
 has changed
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-4-f4bug@amsat.org>
 <ae4a7411-7042-3530-3faf-e25368080820@linaro.org>
 <c9e3897b-c711-f59b-d400-0bd01fd320b5@amsat.org>
 <191eaa28-7ff4-38f6-9489-612ac984f20f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1cec572-5645-65fb-95d0-a3ed8a094181@amsat.org>
Date: Tue, 23 Jun 2020 09:45:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <191eaa28-7ff4-38f6-9489-612ac984f20f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ogaENQOxm6N

On 6/22/20 6:48 PM, Richard Henderson wrote:
> On 6/21/20 3:25 PM, Philippe Mathieu-Daudé wrote:
>> Anyway I switched to a percent value. What is better to hold
>> it, an 'unsigned' or 'uint8_t' type?
> 
> Might as well use unsigned; you'll not be saving space with uint8_t.

Bah if we want to migrate the intensity, we can't use 'unsigned',
so I'll keep uint8_t / VMSTATE_UINT8.

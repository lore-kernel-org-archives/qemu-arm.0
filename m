Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2963710njj;
        Tue, 6 May 2025 01:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVG5CQBRwXHE2UePqkixfizXIKAOaNKU41kkm5rZxj6d8rSBtw34vNgwSnuP5yoiIgE/anU0X9oSvRzNA==@linaro.org
X-Google-Smtp-Source: AGHT+IHXEAfyDJV+w5lk/3rd943D1uzY6axBFXGJdDY5peDFPUxw+JuO3a2uxCqdfZFf5MuQzQBD
X-Received: by 2002:a05:6214:dc4:b0:6ed:1da2:afac with SMTP id 6a1803df08f44-6f535417389mr43582526d6.32.1746520116117;
        Tue, 06 May 2025 01:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746520116; cv=none;
        d=google.com; s=arc-20240605;
        b=Jk7z77BF+YlDb4jxLUoDqM8/tjbySOYBHcuVNXTpVSHsTreipllx1vOiFaPmXkNAw8
         Rl8SoyK/wB1GxG58H0x4WkawlbLVQNlxT+i9wigKFqVrQTpWu3q7pSk/3oLbZYw1VWyH
         NVSZiM90eo6MtT/NcQOfCOtwvql55RywbiA3RRqJxQced0YMpGQbs6vdAxYSnAY0DhII
         VZCTjIW4T90IDTuXQYCCiCXhMbXGfMkmO2v3Wei4QwI35PikYJ2sli588w40PeBOc/dM
         iMgM0f7MAw66zdkzBUxiB5KPvYBcq6hL9+ZSBtCQ+UKAJXY9cwKBcAuMR9CThBhUa7uo
         e0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HwswrxH6SBsq7PVPAe/NgpnmfxJaQYszpTfcMj3HvF8=;
        fh=28YH1fXZ1W+a4I3eBYuWnVAMFeuN1WDd6pFbJCF1hgc=;
        b=bxP8+e3a8ZG1TV8d13zOFOR7iU/L9A/isVVDn3kmUrSRj6c2smZZ375oeGwtZMQMi1
         EbJNSMJ6DbAkG25IQvSjnY+en7ym25+5sHelRXlnxm8RSxDaTRgt7jjgRoTkT9D4V+dW
         WJbGWdszBasJCuZ+D/tHsjAAQcdv13zAdc/gIVoYQ8hho2Xe1Q3vLNTMoPL9VKfA0tCx
         dP2zgj/vpqpuVoiDq+au/5yASjLom8X/pL9jDlehJJj2D46TxCT3PA0pWyayQZmyS9Y6
         dO99kCuA0h7aYfbrBhgRRIztvYqu2TE5Baxhet76xWFVxRTwlpValIBjcmdUL2k5Ua/P
         9RpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acH3uGyH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4abab7si113146446d6.437.2025.05.06.01.28.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 01:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acH3uGyH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCDex-00051Q-4D; Tue, 06 May 2025 04:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCDev-00050y-9B
 for qemu-devel@nongnu.org; Tue, 06 May 2025 04:28:13 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCDet-0004JU-CN
 for qemu-devel@nongnu.org; Tue, 06 May 2025 04:28:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so9356699a12.0
 for <qemu-devel@nongnu.org>; Tue, 06 May 2025 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746520089; x=1747124889; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HwswrxH6SBsq7PVPAe/NgpnmfxJaQYszpTfcMj3HvF8=;
 b=acH3uGyHOISccKhy153snqlBNmi9LOnspFzIHzGnKqBc0NjN0RCfUtwNUkAKyr6kbC
 cAjiA9Y0006V3YBXuUfmKcRPZQDpsh/yQX9+/RrbB/04pTGcecpxvx5uwAqZw8QLTQFk
 /TS5n2lu74HdLjggIoGLnITQWCQkYtk5s/nZoFVZWxcF5pFZDCzgdFq3pNE1Zsp5a0Xy
 uaKe6ekmA++AcLCRZUdXcAcBEobZWKmcdjkXutQJP8yJxIn3DbkENc2wXKiIHj+fya9y
 YJgQuguqHzomg5e7ayYXmYaPbdhXmRbSsKiH2WPAmV+n2BmYGXIjeMHqdgz+musAI7JX
 KdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746520089; x=1747124889;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HwswrxH6SBsq7PVPAe/NgpnmfxJaQYszpTfcMj3HvF8=;
 b=JS9sJMbF/Jq8pSrZspXjRvsRexvtPvjT1Nj4iFZ9DLquCRCTSQzoffJ+WZSgNS1qAO
 3MIvVlIspzKmKJPGoP78c42FtZI3Be2qSGio4S1lp5LOCxCzt0aWZGPPVWhsR+ifuDlz
 KEfJQARIVVixJzi+W/jAccc93AdHH4/2aCE1RQOFYNea+cyj/RFggJB3z0F+ULKSSY94
 kXZiDOFsOPhxTFmswuMcauJ1k/mVKrXYlncVC66RRU9ai1CaucGldTUuQntegUJu6b+P
 MPebOV8D5l5gMA0rgYKzGW2a/iXUL7HSHdrgof77HCsk8ESC8zPtlqQq8/FsPSbJHWJ2
 50+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZgQv7apiZgGl/qQJzx8CMrQ8lITHlnWWCjJsK3q+fyjkgUsLaE9x2nLJdaocrZptC831jdfc6Fvot@nongnu.org
X-Gm-Message-State: AOJu0Yw+/o+rOCBBTmkTd1iAJd+XD/BRQZL4hfysjMHXsyC9nAzP/E2P
 dqK2hBAK+O6nGAIT9Kjngr0Vf4hSiP8WwKEyHP2mcXcIkiJTbK7gul2//PGkKu4=
X-Gm-Gg: ASbGncuvqglRSjnIOItlSKJ/uzFEuVfQMiHp71Qt7rSSPHcoLxGgFmqmbtHzjTshAX0
 bh5BKkTsQ9zS6WRuy/uqoaDmqw4BYQwXmBjwpzJdWJ19jULheaGp6fVKg67CuVP3K84pHME3Mrm
 /gE7WB8MKtH6KiQ1lKlDCJNKRXS1BMyLcJuGi8RM+2Obn72n6diNxUMoMay9H6GZDsfY51y6qzH
 1cI9dCsey8fZF626y/MsvQtPhWpiFvGyD7iqxHgUzvfkQdpo5J0dPh5e8l91RR9ZJS9Ex3RsCPB
 bbrvviMNKd+6Lw9eJrVfrX4JlDxAQBRIPniVbuFl2LBB4+U7ishoAMyLvx8EAnxhKpXIb4XSYFt
 5+O4=
X-Received: by 2002:a17:906:d542:b0:ace:d7af:15e1 with SMTP id
 a640c23a62f3a-ad1a49afd2dmr947322066b.28.1746520088793; 
 Tue, 06 May 2025 01:28:08 -0700 (PDT)
Received: from [10.194.152.213] (238.21.205.77.rev.sfr.net. [77.205.21.238])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a5e1dsm668353066b.55.2025.05.06.01.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 01:28:08 -0700 (PDT)
Message-ID: <af2cf890-6a9b-4715-9fef-4ec7416baba6@linaro.org>
Date: Tue, 6 May 2025 10:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest: Add qtest for NPCM8XX PSPI module
To: Tim Lee <timlee660101@gmail.com>, Fabiano Rosas <farosas@suse.de>
Cc: lvivier@redhat.com, pbonzini@redhat.com, wuhaotsh@google.com,
 kfting@nuvoton.com, chli30@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250418091208.1888768-1-timlee660101@gmail.com>
 <874ixzgfc7.fsf@suse.de>
 <CAJG6D+hRQQq6DaoPVs+VU-sibTSA1OSwYkhgcNy2xy1Da3BtRw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJG6D+hRQQq6DaoPVs+VU-sibTSA1OSwYkhgcNy2xy1Da3BtRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yoTqNcQzciPc

Hi Tim,

On 6/5/25 04:14, Tim Lee wrote:
>> This fails on top of current master, please take a look:
>>
>> $ QTEST_LOG=1 QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/npcm8xx_pspi-test
>> # random seed: R02S03f79fc48ba73b76c881f93f90b015e9
>> 1..3
>> # Start of aarch64 tests
>> # Start of npcm8xx_pspi tests
>> # starting QEMU: exec ./qemu-system-aarch64 -qtest
>>    unix:/tmp/qtest-32530.sock -qtest-log /dev/fd/2 -chardev
>>    socket,path=/tmp/qtest-32530.qmp,id=char0 -mon
>>    chardev=char0,mode=control -display none -audio none -machine
>>    npcm845-evb -accel qtest
>> [I 0.000000] OPENED
>> [R +0.034918] endianness
>> [S +0.034944] OK little
>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 10},
>> "package": "v10.0.0-530-g88d6459dae"}, "capabilities": ["oob"]}}
>> {"execute": "qmp_capabilities"}
>> {"return": {}}
>> [R +0.037373] writel 0xf0201002 0x1
>> [S +0.037396] OK
>> [R +0.037417] readl 0xf0201002
>> [S +0.037426] OK 0x0000000000000000
>> **
>> ERROR:../tests/qtest/npcm8xx_pspi-test.c:45:test_init: assertion failed
>> (pspi_read_ctl(qts, pspi) == CTL_SPIEN): (0x00000000 == 0x00000001)
>> Bail out!
>> [I +0.037909] CLOSED
>> Aborted (core dumped)
> 
> Thank you for testing it. I think the failure seems to be related to
> the following commit which, has not been merged yet.
> https://patchew.org/QEMU/20250414020629.1867106-1-timlee660101@gmail.com/
> Here is our test result for reference. Thanks.

It helps and saves maintainers' time if you group related / dependent
patches as a series, i.e.: patch introducing a feature with the patch
testing the feature.

Alternatively when big series are split, you can mention their
dependence using the 'Based-on' tag:

Based-on: 20250414020629.1867106-1-timlee660101@gmail.com

Regards,

Phil.

Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3090056ejc;
        Mon, 28 Aug 2023 08:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi7Wu1+fIAHO8Z/UAT9Gx/Z6C6J6/PGEkClcbMa7Vm2vwmXsIk3Ot60QAoWEFZoP0WGr7D
X-Received: by 2002:a0c:f50d:0:b0:64f:50e9:74f8 with SMTP id j13-20020a0cf50d000000b0064f50e974f8mr18223957qvm.2.1693237841018;
        Mon, 28 Aug 2023 08:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693237841; cv=none;
        d=google.com; s=arc-20160816;
        b=yzkhL6DBMBqU+rozokWVyLPz8hkXgiZHkaazEAqQhBi+C36H5GuGrrBvzEtFVtNebw
         zuM0oeRsnIhQXA/3KfiVko7YqH55+jrm5zepNhX6bpdayEUk1FpKAFc44YHCElkzrHcf
         wTKFIZGNwl+eyFYaV9S2gUSg7brncyKtCbln1uLluLkTCwaJcwIvd570a4rZdv6V1y0D
         bw6aUckWe8j+Wv+t6xBHGCSUFmtJosurT+LOkZb5woyJxFiphDvD0hVnpKnE9bmAFjIW
         YiGQpnmbFyTlFUld0/CuHQNnwKjDiZsbOUKA5ncxRAJDKqTtFIjmf3Wd/gnX/IPkaHAk
         6oaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fB13dQzoy/cyjXqKhkaGiJLy4e+dgduX7PEnLozQMuY=;
        fh=2tkeK0Q2qH2QDpBXU73AgrIFaWbnFZwPg8HRAUJ8jUc=;
        b=uth797SlbNlUAHMWYYc+d8Q0oiElLhSyIlVKEX39qLc+og2ErYTJFjs3dPbOQkN/4N
         ghrZu7yKCjCufNSguCbHXw6w0gCiUWtPbcTlKFsgFdKy4GpWKRPSgahe8f7HShoJMfO6
         BL/i5fHYKkun5Go+ynkKhgGA3PEFJm2iMVXEGrruqgeGIhyZfzNg7T6NWVgAKHb0hvKy
         +hDMm0w7KLh1JNXGFlxv3MZQxJujMKNCWgrOqbsZ1j3Ocz6vX5kWrW2MzpZ/1mJd/rJD
         DWKJgfal6md+nO6TQ0jtgazzhe7DRAPOQwwNWKSqZHjXf7lwJ1obumLusGIsKAYtKdlD
         mrdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toongC+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a0cda02000000b0063d16b31fd2si2705733qvj.371.2023.08.28.08.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 08:50:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=toongC+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaeVY-00076G-15; Mon, 28 Aug 2023 11:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qaeVX-00075W-6i
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 11:50:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qaeVV-0004a5-3X
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 11:50:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31c71898109so2890093f8f.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693237823; x=1693842623;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fB13dQzoy/cyjXqKhkaGiJLy4e+dgduX7PEnLozQMuY=;
 b=toongC+agvNjLmLASDpACR1qbwdIUrGpziAya32zA2TcYtwmH6zax4i2p5LzNwpLcB
 Eq3a9FS4s3tSkc46k4opb1B5uvQSpRQMfiuOJztOa7WNr9FbT8s32lqOHJppZ3Z2jMIF
 rk72vSFg4IXf1x2zGMA2cDC1utKGFLVaT2+57Xsj2QqTLfTNMscEUQovOyI42mDLUBRR
 PfDkTqPWnGxnoaSCbo0cSF/8DFralV+U1VzY4dBc0COkcbZo1QVSLTdu76H6/mXtTsqR
 DhRBhFTpAPlu0MgyGdnuIxAmkNva5tKaxK1AUHOWhxv3OHwqtaGWeBxXsMmhklzWoZgA
 nKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693237823; x=1693842623;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fB13dQzoy/cyjXqKhkaGiJLy4e+dgduX7PEnLozQMuY=;
 b=QWWOITEnxgTcDEYPs4sb7h+Cje8shMbCQWMcPiN82KWVVCHe2HrOD7D3foXP5UUx+C
 acdljvkBiHxRDvbHYWs1Cy8c22MqKAhXSbPb204bs+0Ehe4nebS5ApIn6nOvyry2Z8UB
 oI1NBdGyFa4tUiRf7zk/W6QDqQ8nOqFGhh6LVBmS1FtV6ADNOnWxbHvIIYYvYgBiuA/9
 CiyvDM1W4OAXmn+XuL8HZJ8MlIydOEsyjNQEyUSwFsN1KpNS5M1wq5uwSCEhAc7gLn0Y
 VLBChWV5IcX4DliDv8162ON0puWrnpM2cvMaJhk5yBgVnKd1SvUXwHqEZEdv7SV9TdL3
 zEZA==
X-Gm-Message-State: AOJu0YwI65IbTbYogHT+S1HSEAIfusZMx7ADwMeAcK6m4/HzKGB8RBvB
 sGVtyVcVsajYwOHWY5qZKnwZEmp1L9HTLopnniI=
X-Received: by 2002:adf:f08b:0:b0:315:a32d:311f with SMTP id
 n11-20020adff08b000000b00315a32d311fmr20256934wro.14.1693237823243; 
 Mon, 28 Aug 2023 08:50:23 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a5d6804000000b0031c77c010e1sm10813899wru.96.2023.08.28.08.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 08:50:22 -0700 (PDT)
Message-ID: <eda0f3ba-d000-e3e0-0edb-cba9761a89bf@linaro.org>
Date: Mon, 28 Aug 2023 17:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Update SDK images
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Hang Yu <francis_yuu@stu.pku.edu.cn>
References: <20230828090101.74357-1-clg@kaod.org>
 <CACPK8XfMn5PJaM9dBkck=jxhLuusJmGnAv_RE3Dp-kdezYM+-A@mail.gmail.com>
 <7930d670-8d1d-04a2-d8c8-83fa48b19681@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7930d670-8d1d-04a2-d8c8-83fa48b19681@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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
X-TUID: 1pMVQznhgTxC

On 28/8/23 16:33, Cédric Le Goater wrote:
> On 8/28/23 15:54, Joel Stanley wrote:
>> On Mon, 28 Aug 2023 at 09:01, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> Switch to the latest v8.06 release which introduces interesting
>>> changes for the AST2600 I2C and I3C models. Also take the AST2600 A2
>>> images instead of the default since QEMU tries to model The AST2600 A3
>>> SoC.
>>
>> Is there any value in testing both the old and the new images?
> 
> For QEMU default tests, I think using the latest version of a test image
> is just fine, or we will end up with a very long avocado test run. That
> said we could make an exception when a HW feature is only activated in a
> specific version.
> 
> I run pre-PR tests with more images (buildroot, mainline, sdk, openbmc,
> provided by other vendors) but only the SDK v08.X images have decent
> results. v07.02 and v04.05 have issues. It could be a software issue.

I'd rather keep all tests committed in the repository, only having the
latest one picked up by default. That way other developer can reproduce
maintainers pre-PR suites.

My 2 cents.

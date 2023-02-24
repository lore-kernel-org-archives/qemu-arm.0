Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2224181ejc;
        Fri, 24 Feb 2023 14:23:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+GwrL846t/5VKL6JOxH4L7Vdmkhk56OBF236hmlR8P9ocnU0Pa67ljyHII5JBsNhu3CjMF
X-Received: by 2002:a05:6214:246d:b0:56e:9210:e34c with SMTP id im13-20020a056214246d00b0056e9210e34cmr2235712qvb.23.1677277439646;
        Fri, 24 Feb 2023 14:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677277439; cv=none;
        d=google.com; s=arc-20160816;
        b=as21Y8N5jNhdbrSYcXmWO8o/iGOEAYAGqmuFM4j4PVpXcDQlEP8DO4mC5qFE9AXfHS
         81nuYh2XIRKTMejw5w0Kmsxh0lgIr1qkSOR8IQW+1UJlajJJuA6W5ZFRqXmycd/BRiFx
         A9An0pdUavnAfIIpQOj8IfddeIVTVaCl1F+UzSQaK8nAJT+T8z1mc6kN094Ybh4IDlgL
         nYlB1I0bFFQ4EDFKzFT9pRvGB8oLGeJPYLPqtfVRuXYBGAeCSxtqqEnT1XhxIy6I2vtH
         bNKfTKAjI3S5vWk+oHIGj/8doihFr9lvfAQqNqQh2yeu1WS7acOuD+J2kc1236HZO+Ol
         8aLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/OGhX04bm3n/OF7eQLQqMBAZjPMUQ1JzfCAv2X/SsAc=;
        b=hel98McVel9CDMt0yoDqtiNgZAgEW6UyPaTrTqgJ94w0LQFA02zcg4S3SrVb8oUuI/
         8sg5X+kaLQi7gP8hL7uDqD70xK7H3RdMw3cUtwIiqXKnDwcPjzc5XOs12cyKPcSPe9TL
         ZkqHVVevw1IbnMcB9eyX5+6ROVxqWm3yts0zYy6Ec4C5fl7ezGW08fH9eTSCJ7nOYgMb
         7RSj+sP6FvX+BRFPvwT3WTURXRgnprWHCJbBiN71E+9aGOjDuHgMvg2Sjf6w0DOWiG18
         IcR2kthpKYQwn9kFrUzYyi1lOs8RSOpHwSFqGvZaSqQD86UK80pj5l1Yc4E1vsQDPfVH
         2/uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYrtMVD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020a05620a249500b006fa57ff8d78si257175qkn.67.2023.02.24.14.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 14:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYrtMVD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVgT6-0004GL-U1; Fri, 24 Feb 2023 17:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVgT5-0004FJ-QH
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 17:23:07 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVgT3-0004Oq-5Y
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 17:23:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bo30so698825wrb.0
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 14:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/OGhX04bm3n/OF7eQLQqMBAZjPMUQ1JzfCAv2X/SsAc=;
 b=iYrtMVD2Qy/U/pvzf4zNOCP+y2JoMMLIcsfquq4pmRdWV0Zpqned9LH6mI7AIBVNZt
 IEMTpYiDkG6Fhb8+EWi9UNjR+EtAf3Xcy3FWYsAYr3L4aVvEcAHars2W1OteTv/LNC5o
 VxGvUQ0Ho6nhE76MBkcBnUZXlxqcvwuGoZ/+OtJr6SplZIo/qym34ZESxyQQgl5gJ3Fs
 DcqtrPnOUpcpZ3KaKiV1WTl/MIcUqJjDYLe3PeAR/WpHdGc3roZzbomyMnCYhcZq7Ig/
 EToQ48IlyP7iE8LjNDGImSybMX3LgqH1mr7prU1K0vBQuX/HW1pJ3UyZM8XBgHUpZURD
 e2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/OGhX04bm3n/OF7eQLQqMBAZjPMUQ1JzfCAv2X/SsAc=;
 b=douILinUAcPjXVhNBgRk4rqs6eKOzoAW1FBMVnYuuCKtV99whT3/awRIKYAir5QBEJ
 j6GXc8I53CWplbzc5WbP6dRb03B0BuLBDfgicgderWVwW9FYRU9Wn8cugO5pahbqV7vs
 7+eLli6SOy7uTFHC+LRVrIvPmHkepQbeR8W6/yDyITgyUtmeQyrnvybgjlwR8fNFQHyN
 fu2koDYrDu9xbgRaf90g1897plVyO87XubSIki2jcUE8/7rzjL/YDvsbLjEYD/yA7XFM
 L4ydGudswVWI/2k7rBpmTncodM64IQ+WoRqqrJYAUqTGwDdv6cjCUejikMdmvTa7MX90
 9wEw==
X-Gm-Message-State: AO0yUKVEgg9k5zx0dBTpLcnQSLgYzT8XKI9+DQumTwtMMJ6yPMJ/6RFR
 LX+euXiQJ6jXZG0fcafB1v/AvA==
X-Received: by 2002:adf:f5d2:0:b0:2c7:bbe:456e with SMTP id
 k18-20020adff5d2000000b002c70bbe456emr8289169wrp.56.1677277383502; 
 Fri, 24 Feb 2023 14:23:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b002c558869934sm20859wrs.81.2023.02.24.14.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 14:23:02 -0800 (PST)
Message-ID: <b5fa57d6-cab4-3f81-d941-0de38783bec3@linaro.org>
Date: Fri, 24 Feb 2023 23:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/24] hw/ide: QOM/QDev housekeeping
Content-Language: en-US
To: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org
References: <20230220091358.17038-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: ye0AN4CnK4QG

ping for 3 patches :)

On 20/2/23 10:13, Philippe Mathieu-Daudé wrote:
> Missing review: 2, 17, 20
> 
> Since v1:
> - addressed review comments
> 
> John, can I get your formal Ack?
> 
> Thanks,
> 
> Phil.


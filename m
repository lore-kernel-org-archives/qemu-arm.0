Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp987399ejc;
        Fri, 20 Jan 2023 02:59:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJ7DOxSGAEKbx3fHw+AiyZa06njgGTldMXCl4/MkdT7v7S7G3ZHbYZaDCN+pfRiAKsH30l
X-Received: by 2002:a05:6214:5197:b0:532:287a:ac78 with SMTP id kl23-20020a056214519700b00532287aac78mr26772214qvb.51.1674212352894;
        Fri, 20 Jan 2023 02:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674212352; cv=none;
        d=google.com; s=arc-20160816;
        b=fcenpenluHVfi63dl/ROKebSjccfY5yHWEucAUpfxTHdEb2wmjravdfoYarnQwlVYk
         eWG6pcTeZ+q5FWKUEP2HC6Up8o0TYRkfA2sN0HiQJCluPQrsRAgbiA4/WE38X1y6J7Wg
         x9oZgU77t4HliO3+RAeRnv9MBLpJYuG/0icth+kLLJ/7THMyE0KI0vaaxfe75SK8meQb
         nN+sedCrGnsWQYZzouesh0eGoNAgHVmBWlVnm3qudKAysFv4Ct/yRhASNBSQapS+fcAq
         9yj8/jtQ4LfOvMtYBh6N0H/UagQoDLSvl7XcKwC98H5lyVUdqzbJ17of2wdlQoFEdSr7
         kDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I/f1sg3P/2lcuYuObTBT5YGVpQ4/JMdwB2zdQuVNHn4=;
        b=XfJbflsSRxJGx2uuIoIs+w90qMdrUETHGr4mRCkU+w10IWP9ofDpmKmZOqvfjcTCIT
         s4mt7Cjtx4KYBJoyPCuL8w9TrHlPIYI0dKf1FAOsJWB3VqeJocPl0b6gsAWH+RIeM67D
         BWve6qCvl2K6J5pFzvBV1yp8sQdgJTuwXaZt3cAvvLs03zAXZELLi6Xg6HtBFXY7Brdq
         ajCng2ArHF7QK/+2pMV39XTe4U/9A8jzBk7mcgtAyutYjym99DLKS5Ox8YMBy3KFas2t
         wA3P08oynyz3tf5FS74ZivvZGkld142J8rUGVzSKtFmM/qMzdXRGKQYx5fFyrQ1BkTLg
         bADA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvLSMx6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a056214076600b00535242d763asi7276073qvz.561.2023.01.20.02.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 02:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvLSMx6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIp6X-0001Np-Gy; Fri, 20 Jan 2023 05:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIp6V-0001Mu-HQ
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 05:58:39 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIp6T-0006mw-UG
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 05:58:39 -0500
Received: by mail-wr1-x435.google.com with SMTP id q10so4517410wrs.2
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I/f1sg3P/2lcuYuObTBT5YGVpQ4/JMdwB2zdQuVNHn4=;
 b=TvLSMx6gmHh46xtJ/VPP4UVdo8AsprkmUCUP8e7X02KJ2mJmuWIZUKwg4otYCEG0l7
 +k3q6uFPF1cYE67d3uUb387Fw1bFXG+kuGXgm22z7QxdfWv/9FuDzU0ytwozpOwZHx9p
 q9CcZsl3RYWlQYtLAIkO388zPyoAdsPm21uRongcL5NYV2uLtRBq/bol3vBbiw9W0Nno
 cPN9rYy1Bb/fZVOk8FKPL4v40/b9QtJWpYWpPW5dLc3F9H9/uCMpn+ZVSVVluyu0Ufdu
 J4w3cd2o+4iBGw6YibPxww7xam3hMe7+z2OIpG0MjSXGpd2bGSTnNSWfHP1bEZxGyNEc
 UcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/f1sg3P/2lcuYuObTBT5YGVpQ4/JMdwB2zdQuVNHn4=;
 b=hizu0mE6uVvztRzRvSGaWb5hmErudN7lfeNpiDnRNj6lqLR/K9jwaUMoxA7Cggngi8
 DPrz8ifnsvFN8ZmyH+koolHYA+VsM/Qii/r0h49um616zTSIJX9ZIUf5jRn7mUGptbtI
 GR7tQEvm3axJdYPVK8xu7AhWoFjbO9WumkOKnEyHFh2vrJsnk6QjniANpa4cn//EIXmU
 L6I5pMAX/UXgabaV2ALS+DN5nx5TeDR8tPancenlLgCFEmapxHvYI42lWY0Lajn79O51
 TjlAcBkQCjjn2QsAI1EnRcM3IjYyeds8yimpCWEwrRtYOJJt/1V+hCx65GSdDlj/AG/5
 UWBg==
X-Gm-Message-State: AFqh2ko8wDvGqgHLQEGn7/ZEbx+ThQs7bq/P+AETYDuI9FBdK6Lsny2l
 nIujxgJx39278yQP2dy7QdMieg==
X-Received: by 2002:adf:ef50:0:b0:2bb:366b:d5e1 with SMTP id
 c16-20020adfef50000000b002bb366bd5e1mr12291537wrp.30.1674212315787; 
 Fri, 20 Jan 2023 02:58:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b002425be3c9e2sm35024405wrt.60.2023.01.20.02.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:58:35 -0800 (PST)
Message-ID: <321c1dd0-4354-ed38-6b3c-6be3cdc1e481@linaro.org>
Date: Fri, 20 Jan 2023 11:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-7-philmd@linaro.org>
 <cd802b6b-1fe7-2640-1ae0-0227c3e8e335@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cd802b6b-1fe7-2640-1ae0-0227c3e8e335@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: 1q4SG9nxJa1W

On 20/1/23 10:02, Thomas Huth wrote:
> On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/migration-test.c | 29 +++++++++++++++--------------
>>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> Missing explanation in the commit description. What's the benefit of 
> doing this?

Reduce the changes in the next patches to ease David's review.


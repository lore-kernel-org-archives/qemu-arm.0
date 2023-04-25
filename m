Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3588512ejm;
        Tue, 25 Apr 2023 08:46:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrcadFJMrCBqxvZTB/C1R/1KILNWRkwF2FBlDWRLKIB1e2HVKfULbcq2xkWW+iuxo7fGEo
X-Received: by 2002:a05:6214:124c:b0:5cd:1adc:30e2 with SMTP id r12-20020a056214124c00b005cd1adc30e2mr30909347qvv.11.1682437591634;
        Tue, 25 Apr 2023 08:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682437591; cv=none;
        d=google.com; s=arc-20160816;
        b=oZmrUzgGauTOsWSU3tSjrAI8L/0OpZDbm4v0Qbx6JS2/HEXqnP5YPxFtFIHtUJ7JP3
         q6Dmr4bMXOutOyWGdVlCOioVt6E1tSRWCG97qwCbwP8zfvg0ar6HHBtutYJphXJRGVgJ
         gSZrf1DRb/vWX34g9byXJKnS97cUtlUgId/4CNKf9TVM63SwVmMH9wjOnBRpiWGMculF
         lAJTwLpLkg97h4ei6HzLRuvd9tE9IpxAF7w3EECanaRs5Pg2bXKR2x313RwV1OjZVSSf
         RQs95Pzsa85YcHUzDuInt4O2IYKxbgwqGd3wkEpiOzZBCm8q3ruNdBl5PhLSYtjU5Nth
         D+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=owTRAImrSSJ5pHEuNd25GTEw/B+rmHU6gF1l4I84TX8=;
        b=Y9nSC1pXqNhGD76+oAWKOM0wcnGjbNv02CHlDdVSxJL8mvVwj2CaSIT2zqAG7qP/WR
         7BgFgk1splmPbvSYckXPoYoFCpDXxsk3ruXmxbmEe+al6E3KPuq8YdxsnOxwqVCREa4P
         W9LWisshB7RlnvGsHhNyOV4715vAreLJDxLuTSEzXtFmY0buRTW426+6DCpwzVr2cZzw
         W7lOwhpL6EZvI43uIMGgjJkd/ojhqa3quTgr7twf1u4ihjQuTvkw3/ofalWjmN9n5FDD
         Mat6vjsUb6utjYC/k0qMdV0TtDgPMnlo1DKduQCbKyN84uEILs23HnxGP2aI8cFlmr+K
         0/qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AW46F8a5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140d0e00b0060307170b36si7337749qvh.144.2023.04.25.08.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 08:46:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AW46F8a5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prKrr-0003vK-CS; Tue, 25 Apr 2023 11:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKrp-0003uG-HA
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:46:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKrn-0006JC-3u
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 11:46:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so45222275e9.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437565; x=1685029565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=owTRAImrSSJ5pHEuNd25GTEw/B+rmHU6gF1l4I84TX8=;
 b=AW46F8a5hCuq88kBXE4jTU+FtcjoTdfctqwSRIM57UV6Uwtoib0XGzN0277utYsugC
 QI7IbOTpqFntTL6ofIMtmnRIyUpa2WuNhRo92Kyq/KELyWQOh6wmAuyZif/9HCXKJWdg
 Ybghd3K0nXOjxm9zozRSmeYGNYNiyfxVvMajcXOzLulw8q6yMAOl5B9YFLBueJKgdCvP
 rabZKXakCs41IpIJQNTLy9Xbb0IhgiL4vN4PMZNuGCjSBxrwSIRCUqr1wwmQq+Lqfwcq
 z6XmeXq+61oHHShMMk3UJxQahvexHROyBye35PhpcTKTYZ3VOABd3yBExo/N3xSPT1Cz
 LHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437565; x=1685029565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owTRAImrSSJ5pHEuNd25GTEw/B+rmHU6gF1l4I84TX8=;
 b=MNIJwFGNKIIge2HI22k1e10Iq9JtAsYSLSZlr3jQo7tv/EwRoywcVkRMeYY1e+ReTr
 8lyUwybiZUI24vB99DeHw83Ke/GMl3k1FOXVmcWN0qeK779+0kMBcNmXXQG9vDM/2wDv
 YcHMiOMhwg6mXBFXFptH7Ry2pIIFzgdw1jMdSw13RLpbXdx9JjTINFquKtNmd3It72wU
 /PCBY611/IhYMOkDAMsmaGuQl5fH0cwk/H/twZFXlufpGgIlx9b5Zh1tzy8wbBcpPqt6
 2zVFnrESI+fUNvSCawfy88KhyxbPKKnpH/GbLzcjJZIbYpgTBFup86qawWLHGObVjd5R
 Gv/Q==
X-Gm-Message-State: AAQBX9dejvm6HDi1miyyl7EfSzG0cQy4PJk8lT3SH1FPN6w8drS5fk78
 UNHxQwRUF1bLjSWPlMRievHgtw==
X-Received: by 2002:a1c:7713:0:b0:3ea:d620:57a7 with SMTP id
 t19-20020a1c7713000000b003ead62057a7mr11552782wmi.8.1682437565604; 
 Tue, 25 Apr 2023 08:46:05 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm24743883wmn.2.2023.04.25.08.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:46:05 -0700 (PDT)
Message-ID: <6f8f1a49-8b93-db34-3e07-b4e9fdd43c06@linaro.org>
Date: Tue, 25 Apr 2023 16:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap descriptor
 fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424165053.1428857-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aq5v96niL92x

On 24/4/23 18:50, Peter Maydell wrote:
> In allwinner_sdhost_process_desc() we just read directly from
> guest memory into a host TransferDescriptor struct and back.
> This only works on little-endian hosts. Abstract the reading
> and writing of descriptors into functions that handle the
> byte-swapping so that TransferDescriptor structs as seen by
> the rest of the code are always in host-order.
> 
> This fixes a failure of one of the avocado tests on s390.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/sd/allwinner-sdhost.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


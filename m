Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3214221lfg;
        Sun, 28 Feb 2021 19:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1s6klyxaiqWAKvcBHkCBFg22mBiGrSpS7NFJhU55RhDdLH2KWI7B4KuN7H+Wgd9bSvv58
X-Received: by 2002:a25:105:: with SMTP id 5mr19629956ybb.133.1614568742542;
        Sun, 28 Feb 2021 19:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614568742; cv=none;
        d=google.com; s=arc-20160816;
        b=ILjo+7XHIzzl2V+GqREqwd53+zJXJ8lFM2xzB7TucwTKDayqknjkapnFNwxh1ElQ0d
         SXIr6NSraaDR0WCmMBPfArwCwtB7IzcGMWl28KF4EKCXhUG9vMdfkd4XZFvVI86QER2m
         kvleh74LKwTs2V4OsAQOM/Nd4ecOpciCAs1ODsENwnipT+INrTCjtPliKrYCB/uBswoj
         EcK5XrB9Is5jX+D6QuVz/Hg78fK9OFo2wMFJ+xWPoojGAvO9ThsUeCpV7/svdSU+df5E
         i+hU1mumNEElZKc4HBsbdsjD+MrDW52Fmv3JzKuLo+4LyvQND7MfPySNrDPZ1D+zGNws
         6giQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=F2vA361O26696atm3QNil/8O3h07L4NEMDJ4GbJI+Cg=;
        b=jxY7Pj7zWc6mq7D47ynnIdgEFMXV5q7OLUIi3BXog8Si96dV9IyP+tgrgSm5aNZzFZ
         pv6KoxYtFgsb9sxdzOrI1YRw4oN2FFSD7BhnWkAdnivktGi92dj2MC/qsXQbo2m1y+jj
         gsQCp6t+8UqZwNfMZ73WI/dRoXP9m4KeIhHjju7Pna3tvUOTKfvDzB04xHIvbY4Cacs4
         2bnM7IWi/8PFDlxC80k5ewxdyOzD2btuo7ksZrygTaf2gQg/9NJw1KoJP3ESp2xe1kQl
         Vc7CrrIZoFJN4RUahdpA0RmjKTO+qP0aWzUqcphP6IhZfL5YtORPS86f00P8oG+W7tNe
         KkCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxy+q7xX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si17827144ybl.418.2021.02.28.19.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 19:19:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxy+q7xX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGZ5J-0005ir-SO
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 22:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ50-0005iG-3j
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:18:44 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ4s-00013O-EF
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:18:40 -0500
Received: by mail-pf1-x431.google.com with SMTP id 201so10543991pfw.5
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 19:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F2vA361O26696atm3QNil/8O3h07L4NEMDJ4GbJI+Cg=;
 b=nxy+q7xXhAxLJaAgFVXVO87RXXgZAbk1XAm33nP4YZ6F2AxpeDRsoL9k44UzkfUOb+
 jXFNNY2bRvM/nTa6llu/QRSeeWtKfJpvZ4rX54hkIcS9cUhHmRbyW5XrGFuBq6VKgoNS
 ZrajozqW/jrLA9vF8cTJdSbEVd5E9YbQNOg+KeDTWbJh0rldWMQoMA/bLioUroWwCoc2
 XOIYPHJdkPFSvHdK3HZD85hRQCu4LGpoCn0bv0WnrrWXOB6GgnTVmwxreb0mrcQmO4O5
 B+PzIMKIF8U05O5Uu6sg3+Bw+UCTqpj4NqXr5GHVB5ZZU5lalfQI413qNGi7yFKpsb8V
 xWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F2vA361O26696atm3QNil/8O3h07L4NEMDJ4GbJI+Cg=;
 b=tHBMZsZZV3NMfC8u0pMsTXLvXt+o7IsXjhTxlTyu7yqWE4IBr2CquA/m1O+T/JPmV/
 r5lwGj+OStguDWCVusgkDpbyCTO5sH5lld7Rg0QgQ8cRiwdm3PE/oEcBbLVSgqzXFH1n
 NkL2Uqjy4b8PMDwNRNr0M4Wj2fMMGN9RtxqRn3ZgNLFl8sKJy0snJZ5tiLbw1/BqpqLu
 7rhgL4epk1vI9o9DMZ8DJW4zq5y2z2sTCX6QDnf9/FzcF8Pbv9QwpArkfilrNH8M0GNT
 fpKNQE1wF79U0PdXr4LcjfqtjvcLEI9za0nCjcaZ4sMXd1G22MyktwwBM5FVVFZ5pa+E
 aStw==
X-Gm-Message-State: AOAM530s/8OvbYVCUgVLg5zphAsPIXvGg/MzGm0otwgY/WSh1wyQNb/Q
 uTvWmnyrREtOZfsnB43vM4nitw==
X-Received: by 2002:a63:5444:: with SMTP id e4mr9094503pgm.426.1614568712783; 
 Sun, 28 Feb 2021 19:18:32 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id s11sm14871560pfu.69.2021.02.28.19.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:18:32 -0800 (PST)
Subject: Re: [PATCH v2 09/24] hw/arm/mps2-tz: Make number of IRQs
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adcdf431-cbb0-2471-9f4c-a9119bb5cf52@linaro.org>
Date: Sun, 28 Feb 2021 19:18:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yJs0x0cQ9tOX

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has more interrupt lines than the AN505 and AN521; make
> numirq board-specific rather than a compile-time constant.
> 
> Since the difference is small (92 on the current boards and 95 on the
> new one) we don't dynamically allocate the cpu_irq_splitter[] array
> but leave it as a fixed length array whose size is the maximum needed
> for any of the boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


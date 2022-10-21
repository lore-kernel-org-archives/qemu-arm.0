Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1012864ejn;
        Fri, 21 Oct 2022 03:01:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VCSQGk4PSFfNYj83S0aJ1jgE9eEQ7ThWAf7ZDUv1AtHYTVkTO836/yIWHMw7Iw4EClJF5
X-Received: by 2002:a05:6214:1bc8:b0:4b1:b217:cce9 with SMTP id m8-20020a0562141bc800b004b1b217cce9mr15768821qvc.31.1666346507097;
        Fri, 21 Oct 2022 03:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666346507; cv=none;
        d=google.com; s=arc-20160816;
        b=LpM8RZRTLISI5t6W0WNp0pmReo2P4wp+gCroe1oYlYbjTA6dkQurNC2NRmDQX+Fm0J
         o4J6Gjuv9xJw8wVSKHKkCj/8aejREHXx0AX6nTT5AL6yDJae8aZQumSf8Mb+zFEdDhVC
         9jHMEnE3EAp58qfuJAkAiETj9Ez7VIQtZzGWdwn4UYqZcqghpfcQ7ai332E+nTG/xZL5
         qOvHq8X/xONfk8LUyiyhOq/6nDMdpinPDnVj/DrqkCIFmvfJluK1UWOWQZ7y8T2+FFfS
         Rto2+UIL28IUxT51KHhQjtgjDF9SFuPsFMErrhdO53D6XmITymVbU8Jj98CH+MrU+DJ0
         PqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=y7UgkPpVzTuScWF5Q96hwc28pMPHkRMxjYk8/0j1FrI=;
        b=xKvZ0y0k1JpsB39IwzGpgRbjw1WFBf4vrcUP1jG2lJ9GZFs+8xtQICLlCPjPImqTmp
         yg5S2PB1yTq9vF809Lz3MhCTiZVLpAY72uvKrCwzUYsT2HiIY98KSZWuTddPJ+ws4zG5
         OR7Y++FzH3C/W0tn8Kw494ya0KJYaP5Sr8PdLJuZfm8TQlNCbPZil3ohoMfckH3KD06C
         c9KOG+8pqp70gjURT/qeUe0l5UCKPKlcYa5z6jShT4JIjVPG7Cr6vjKFfckdcEH6Bi4+
         GncKBqX7xmPYS3pC+cVMP/g1OIPfrR27WYu7y83d+9ntS148RoaMI0MyWua78Lk6R9q/
         j+kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zT9svUu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke30-20020a056214301e00b004990014e668si11816087qvb.188.2022.10.21.03.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 03:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zT9svUu7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oloqV-000095-V4
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 06:01:45 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olnyX-0006pX-SR
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnxg-0006Ws-5L
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 05:05:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnxd-0006uf-EZ
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 05:05:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id j7so3861322wrr.3
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y7UgkPpVzTuScWF5Q96hwc28pMPHkRMxjYk8/0j1FrI=;
 b=zT9svUu7elHRGluminfWonbfuDstvLNYfoJsMttme5Oacylsz/6UfM0cjYxOUx/9e/
 SLiZBeebNscTLi5JKp/3p7jhE0tUp1W1zyM+fWucfTdoEEjAblgKznRQgXCMonPPRo5v
 viM8XCutW8U4uEYTX9K8jjU51CNtfiBPfGuFkkI7UqvwCYljUMDn7nu/lAkzFdB/sLvh
 MAoyGIRCd15rljP/GPYy4v9JTaMZKoHZqrE6ou6IaZZ6g9UoEXrZSkgjKzI4uoU07qn3
 42LeMYVsqptXlNEJ9hpgE/s5M80vt8ZtV+9ZPctiwBhXVmDc4ZBb5HahoCnIEAV/WAcI
 jqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y7UgkPpVzTuScWF5Q96hwc28pMPHkRMxjYk8/0j1FrI=;
 b=vbncrNsQ1prUUyD4unuiKC208lx300NO1xYcwGO7gnL1e/IxygL2olgQCVDHqfa6kJ
 MfFkry6YdPAbuzTEiwrpaVxo/BYW9p/o9Gh6M5SFaQSS93G7zjk/oNRXYRK47hi2qMil
 ztoImbdcp/jXTUtooMgZOl3+7NNP3Cy5bPiqzC9r8gUl4vECMA0bjqcxlJwH8KjYH8Qm
 QqKnkhU0l+5d0C8yD3GhVYFimA3iRVFhwROk81LwA/SbBEfkCtcJfD+yvsHfXqhrRKWs
 x9NIvGTL81Nm/1iP8qp0izQp5CweQt1e+DqZMg5+kLYh0g/PdPLtgF54L/GAIRYETt/a
 gzRA==
X-Gm-Message-State: ACrzQf0kwNDzT6HzoCqeCMuleH2Yz2yFROTu5V3LC+0c0JAX4qXUyMe4
 +DA37IHH3/zk30+tBulPXAhijw==
X-Received: by 2002:adf:ed91:0:b0:22e:4f88:a9fc with SMTP id
 c17-20020adfed91000000b0022e4f88a9fcmr10930385wro.669.1666343097128; 
 Fri, 21 Oct 2022 02:04:57 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d6acc000000b0022ae0965a8asm17972793wrw.24.2022.10.21.02.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:04:56 -0700 (PDT)
Message-ID: <cb274017-85af-c603-778f-f2017e59e1d4@linaro.org>
Date: Fri, 21 Oct 2022 11:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: add qemu_fdt_setprop_strings
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021070047.225ngzlqqwsvgbqw@kamzik>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021070047.225ngzlqqwsvgbqw@kamzik>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYGh6sRPjADi

On 21/10/22 09:00, Andrew Jones wrote:
> On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
>> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
>>
>> Only minor updates from v4 to fix a couple of minor patch issues.
> 
> Please see the comments I made on patch 1 of the v4 series, they should
> be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
> of the series, but I don't see those here in v5. And, please CC previous
> reviewers when sending out new versions. Finally, why not generate this
> cover letter with git-format-patch?

Or git-publish:

https://github.com/stefanha/git-publish


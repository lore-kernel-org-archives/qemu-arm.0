Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp9955107lfb;
        Sun, 2 Jan 2022 14:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFKFqwSPeSEQyLDhu0UEOpctcMwNNrj4nN88EjIxaEhs5wxNKVqG0bUS/xZQtgr513g3rL
X-Received: by 2002:a25:81cb:: with SMTP id n11mr40628014ybm.462.1641161684363;
        Sun, 02 Jan 2022 14:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641161684; cv=none;
        d=google.com; s=arc-20160816;
        b=WI/EzZ+GUakNZ2b80YJxVXddxjFTZOyjpoPEC3W1eQJQLuKnJizdUZUuIcRhMWGUpG
         LQqwE9UG/+rJOSH0mcLDO5ibzZ5thbxVQsNqcMvN/w2OEH7F3WdxUYYAFhIPCWpJDlNi
         bCwgIqjURAgVeHaYZEd8nx2uLDh9f6wn7ys2BWn3CmlCdhfmkwNAYlWw25Z8BDTQ2me1
         fXQyic+h7h43TFKKfKl/f6rWv0ArWinwj8SrPdukNspNeBVqLR30L6E8ycrvba/eVOux
         AS0Qz1L/JQ08qr+gbnGCXKuo88zpOhdmEboRNgMxMy8BCvgWJdF01bXVyS/i3xrXlh+H
         rRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sSCQ4qeYio2I597L9EkmqqhfLUA+xZPKozCZ2QUETAc=;
        b=VO2xi0wFulDclgeHm+twfbwnU/zUOl2Ye9bGKugg/+tr64l7/vVDwtz+DAJCNhdOf/
         Kr7br6JLoWCHvwYVqQE/R3KkByxXfQdpmDqJFr40YosdrQN4pUoOjnBCl6C5XHJdNWQR
         6jPuunPs2PZTiyrGL//TrazZpxx8B9yBFJZqqXz7QoDyQs8+ULc9AMi0gzY7NCpuHIbE
         7cpZHIjpN/SaJyWOLCR8XZuJQPXEPfXMF71EChQ0UV2arv8FsVX846LqxOp8uIoS6NDN
         fXz+5A+Rn3Y6IJ6anpHvBd/gp5KDlBjbzozPukdF6Jtk9GglkBl9wtiWxEdk0Cw+IXmJ
         Sjww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Uf5mmRtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m204si19176063ybc.356.2022.01.02.14.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jan 2022 14:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Uf5mmRtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n497j-0000k1-Pg
	for alex.bennee@linaro.org; Sun, 02 Jan 2022 17:14:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n492a-0004PP-Lt; Sun, 02 Jan 2022 17:09:25 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53206
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n492Y-0006ya-Cp; Sun, 02 Jan 2022 17:09:24 -0500
Received: by mail-pj1-x102b.google.com with SMTP id co15so27485657pjb.2;
 Sun, 02 Jan 2022 14:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sSCQ4qeYio2I597L9EkmqqhfLUA+xZPKozCZ2QUETAc=;
 b=Uf5mmRtXI1O2q5nQ7x6vFuWW92H28KutLySbflXQDHe32OBX8xbxWzupbdZVqfkMic
 oCf6CBxFKRDTdEkTj+mmrdYrsHCA414Sh4My5JXGw3a/vmxc5NtOYx4dEA4RgeMIVL4N
 jTdi2e5NYasIr8ywwJiRDk9mqtWXkYGZ5N6jYgnHotJ990qZcwTExDDhonG1BEyElAL/
 tuZbtfp5f2VShlEQXyPdkNeuWGvVOdiV9AZsR8DT8Bt3TKWA4h7VlL45e2CRX0OOlwxa
 d6/qVtXXFutNno75lVi9CpbZVUYpPoq/MMooqVgYTAY5xzfh7PwFKndyPeFjVT+QOMjx
 RL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sSCQ4qeYio2I597L9EkmqqhfLUA+xZPKozCZ2QUETAc=;
 b=DCUx4IBI3w79/pAM1G9dA2Dqb54wi7+1kKCQX27pLVa9ukSEKG6I+x43PVm4xo0+GL
 349Z//7XXZGblTLbFwfnHvKVyZAEojrXuUAxHC0PJccXZZ/PGI9RJU9WpgTrKuO6ixPB
 ESHLwfXJFEElxwMVhLcR1gQZrKLZxH/aHAK56IPe2EOoLUo792XFldB3TTHV2D9WQqQp
 24DvOf1TKDLA5XWxOpMxvw36/0aGCUqrxZkV5aPWC4Voj8eAfu+hf8+BIhm5VIQgoT1q
 1Png2QVBZtR3HIHubL6GnMVkwh996kFiLmjWlLHj1Lcxz/slKMGPD39g7kxXeQZbYOKm
 Yc8g==
X-Gm-Message-State: AOAM530kCDYU+mXXqk9Yi++oUCe90oemPeZfU3AgoNtnSSry+FhEfblF
 KLqCiHljCrAso52ibRHd1EY=
X-Received: by 2002:a17:90b:1751:: with SMTP id
 jf17mr52627750pjb.172.1641161360756; 
 Sun, 02 Jan 2022 14:09:20 -0800 (PST)
Received: from [192.168.1.37] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id s8sm34770632pfe.196.2022.01.02.14.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jan 2022 14:09:20 -0800 (PST)
Message-ID: <4eb532ef-9260-334d-fd54-c6589e563849@amsat.org>
Date: Sun, 2 Jan 2022 23:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 4/4] hw/arm: kudo add lm75s on bus 13
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
References: <20220102215844.2888833-1-venture@google.com>
 <20220102215844.2888833-5-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220102215844.2888833-5-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wuhaotsh@google.com, titusr@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, crauer@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EQ685tJzvBH2

On 2/1/22 22:58, Patrick Venture wrote:
> Add the four lm75s behind the mux on bus 13.
> 
> Tested by booting the firmware:
> lm75 42-0048: hwmon0: sensor 'lm75'
> lm75 43-0049: supply vs not found, using dummy regulator
> lm75 43-0049: hwmon1: sensor 'lm75'
> lm75 44-0048: supply vs not found, using dummy regulator
> lm75 44-0048: hwmon2: sensor 'lm75'
> lm75 45-0049: supply vs not found, using dummy regulator
> lm75 45-0049: hwmon3: sensor 'lm75'
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/arm/npcm7xx_boards.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

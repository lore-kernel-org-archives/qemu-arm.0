Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5057879lfr;
        Tue, 13 Apr 2021 10:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHHGh0c5LdRoCQNQjvN3B++/2vUe1I7fltBEvG6nJQp8WTo+KmVDKZUVg9Qg9tPqEYZkgV
X-Received: by 2002:a5d:8ad2:: with SMTP id e18mr27799549iot.51.1618333493221;
        Tue, 13 Apr 2021 10:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618333493; cv=none;
        d=google.com; s=arc-20160816;
        b=zioW6eoxkkwBQKtpzLUQCYufyuMxuiuOmdGA2UF3ZB9Z6V7qhHA0B71Je2G6BNI4s1
         /bG07DhuqDpC753/M++PI9YRBTm3+lzblHTotS/Bjg7kawjEmHcuDeWtX3daP+ulliAD
         g4wK1GI5mIXkEGM7Rv7gYpJQ27v2bincZhYLL9LyN6pkr3MKt/ZDIezGVjRBRdGEjOmt
         YIGiPsnHRRLp0MNNUMmDV26C8AtBZHsBY6VYUYs9N73sgFkLC0sBjzDwh4EZePVUMIRY
         aLyU7KUG8XQrFNbfZCzniD7ScymqXOUksK1P0UqNE7SiGl0xZGH7/juSIc+C58oAp7AP
         25mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7XYCtRFOROA5HGXrMLsOH0TG01WtSY1Ep3th0Wl1MU4=;
        b=Xg7/7xsidKojr84z9tLxtZvB9F+O0tXVdT4KyxnycWcZ1jmwY/h6rBaE6ICkYbAd0k
         ZpuhQMb56H8HzDkHOJV2MQaq4X2ReIgzDKUiBX9sriZ2tm9f5yUshviGV/m/qB+OnPg2
         erqBHg8lh8URfMAK0pGjMa+l9CemSmVrrPQu1wQPrf2979XLO3gZOfZyWTxu3/jkfIQa
         SQKXg8q59XuQrqWdiek/WPYMphLi8F2s0vaL2MOR5chfeg2wugKH276zmpXFzsRYqdmo
         G85kiJXnhXWc9KtwajpwhYrLYjZ2tdNy+K8AWe1UlkLSyYWGnL5il5dde0DqsLyCArNE
         cB/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eJiojgce;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si16358401ilo.127.2021.04.13.10.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 10:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eJiojgce;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWMT6-0001Qa-E0
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 13:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMPR-0006li-Vo; Tue, 13 Apr 2021 13:01:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMPP-0006WK-6x; Tue, 13 Apr 2021 13:01:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 s10-20020a05600c318ab029012d7c83637bso590154wmp.0; 
 Tue, 13 Apr 2021 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7XYCtRFOROA5HGXrMLsOH0TG01WtSY1Ep3th0Wl1MU4=;
 b=eJiojgceqguvBpbSOag3CfQZnSlbcVWoW0cnxMwLwaxFqdcSfLSLtuIwUlC0y+wmz/
 FliXMyEC1UKIpkRoSd4qjoaiJohgL3jnlDIX+LMM7WUZt73zzgPZEUFAaF0hmKM5vutQ
 RFTTLN29EW8vXF7CjaBI9pWSbLnWLOLY/1CVTSv84au9Mioxwu+Em8Ks8j6Re3QWhRPH
 XOrYzTgPUbMsfl0xr0HX9y/Wfu8pwY6lqb3jYlc1M71eLxMMmNLfbFhnh+WFL8pX4DUG
 LjM+RnWi1YSQUWH4EyS5eVacC46NHbnNBr5ntCNdL4rvGI2/VT0iJVFnMwVVZmJ4sRf1
 nhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7XYCtRFOROA5HGXrMLsOH0TG01WtSY1Ep3th0Wl1MU4=;
 b=E2NpJgptWPwjkWwaCWR/riaip7Ji8+NsgDxfhEhtPmmVeLXfqCJmPnh2I8k8TO14mJ
 itJiFKfb5E5xk71O1FeMEmc8Nb/gh4HI1FG8/cCP3PlpbWJQWWIpI6KxChen2PEC8ox/
 lc1m3p/uIKaywhlap1xu+Qm3mgPYLxAbSZZj8ork22Z2Qeeg6pfz5rtpMcTBIqne6+rn
 A5EwCiQHA8mwBMXcC3HqUg4jTUsr9kvAmLX6bKOv3+DvJWE+2zBgpaSyyTZ+IB8Tliy1
 7i+oyDxO8lzWGnLVKnUF6Ly821fRaNFjxWt/502Jw+BMZQ4G2J5nqCkq/H0Oqzh/m1oa
 njxw==
X-Gm-Message-State: AOAM533t3oHfri9RFhpwBdXGtguIo+0MhzWf3iCcF3Sam+WcYXyN8Iql
 uq39vjK7gWXhyCu0BMM6L1VGvk+/dGY=
X-Received: by 2002:a1c:64c4:: with SMTP id y187mr943244wmb.162.1618333261170; 
 Tue, 13 Apr 2021 10:01:01 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm2649066wmq.11.2021.04.13.10.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:01:00 -0700 (PDT)
Subject: Re: [PATCH 06/13] target/arm: Move vfp_{load, store}_reg{32, 64} to
 translate-vfp.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <576b7d0a-9a75-0699-356b-c070b8ac83c7@amsat.org>
Date: Tue, 13 Apr 2021 19:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XLgkxDE/BTmo

On 4/13/21 6:07 PM, Peter Maydell wrote:
> The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
> and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
> them to that file.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c         | 20 --------------------
>  target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
>  2 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

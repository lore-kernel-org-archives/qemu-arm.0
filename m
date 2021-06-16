Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp614160lff;
        Wed, 16 Jun 2021 11:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyemElTQovRrqlrGPBZUz4hFJCc/9t/LWfW/5mirMDKoSyk3A0kjpOBZLUWvBDWthlD0V6j
X-Received: by 2002:a1f:2fc4:: with SMTP id v187mr717220vkv.4.1623869574683;
        Wed, 16 Jun 2021 11:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623869574; cv=none;
        d=google.com; s=arc-20160816;
        b=SPIYupcF1MRUbPJu5dJqi4iFpQUHOajVBGoY7Y5S7Y+LrylqztvmnPOavG46/OvivB
         QctnPVbYNQWnCUBvnaz7qZXm6Vqg/v+xjpQ+O8ZPgZpmQuz3EaIeTvYwxoKUcoYVBMnO
         0UDlOsDeqc6laQhFxVB/OWP3xMqB0+uWhR5foKHkpL7BpYMEG4tfdYzLoRncdGE8EYT3
         X8yzukR3a9SvuCkBq3h0dIEaH1SEXsFw1n5J7DfXOliUHSTiJigfcZ0ES3a2fn3+wFD4
         afakhMXS7Nvd9Xe8LYWhoCrbOzBZ4k7ya2iXLm1BPBR6KsVfK/VLH5WkRVj2W2GwQjTd
         wF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4mE13WGFzO6pilOTGTWR0QI3ypfChUaCFHC9H69ijbg=;
        b=kjPN5PkEx0CQqzGGsKCevN6GXCdVCoU+4QptU5iWf845cYDUUh17nU43T/zqgKGY3J
         xW4dCMXH5aWGalEH+B3RtFfY9QfY9iGXJG9fdEwKNYJs06OdoKqAtRkIH7zQjnc8RqDz
         mmKC30sy2YFop0xbK9vg3yCA6R86hSmFiTAUjU+xgcX0fH2//3zI1gsbnINq78ecKq7r
         H2ijfdnTIaX9sXQZdU36pxJagOsHOlFuFrrOUqkG9V1xpUG6TdggvHhPhhioSqr57tWy
         9OYmmnjfcmKrR4dl5XlTlf2NBoyyu04WAPteOg3jSCEibywsFe62sKUcqns1Q+hMxLCo
         d7pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7itFNAS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si2128847uaj.44.2021.06.16.11.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7itFNAS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaej-0003pa-7T
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltacN-0001yw-NS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:50:27 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltacK-0000n0-Oo
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:50:27 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so4366473pjo.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4mE13WGFzO6pilOTGTWR0QI3ypfChUaCFHC9H69ijbg=;
 b=e7itFNAS8N3wA4GoPxakgBSTslq6BUsxS76aDq84HsvK+uioWX1Wb8YZvf2ZJYoSFL
 0Gzi4p8p1SGj7qTIGZ6yk0Wl8HbNqWFxPNeaxj6Cce7K6iOXt4YeOOrOSZyCHXbDTA4w
 Tv0ar1giyLgD+WxKVS8Etv59tFlb+vUOpbn/Ojl3Snr3UFyCXGoxJnhygA+zXUCDjS89
 K5gji7NvDp5olhLYR7xfiosgtz/srfaOd/zyGZm0U7/Pc/WkwY55I3NgmSh9CJzMSrT+
 acFcF2R49XkHgZIGy0nZqLVRMaXdbSVs1w8jtLu9pMc04pWS+bo/2vLKfNOHVzEKfmfQ
 NkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4mE13WGFzO6pilOTGTWR0QI3ypfChUaCFHC9H69ijbg=;
 b=aaMVxFt2NxnBFKm4XiOcwT+v/mDC3MnNGOWGSzEz7gDgTLFz2NQ7zGWVNspt2u8AdU
 vtHK9ReI+XlvT7vMQs6OGgVPmxrfzkvUp2LbV/Bff7AAnN1hDwZ+JL66+2wEyfeII0+f
 iyAIO5myM9ofjofwPKMFSvMXclBD33G1oZcq9EC8FO4bjnBVuV5yjwUvK39OPr45kMrq
 E3bzA+NQE1wVi290v9cx7Ltr/Lc6tTfv7nG9//KjRKfkR79m7klNmebXa9GG754vfHNf
 kPVOXXlXR8hPjy/OvvwVmC3dRPmfvZwznqeBD4TVGOWs5VP27Y1rbHZzi4jZwNzDU0wy
 A1Hw==
X-Gm-Message-State: AOAM531JadgItP7GL66GSa5IwSfX8Kk1khX5abJAxh1x0i/oUZF0GV77
 GBUsFLCzdOZ2gG52RdXLLFvtzA==
X-Received: by 2002:a17:902:b218:b029:11a:bf7b:1a80 with SMTP id
 t24-20020a170902b218b029011abf7b1a80mr878623plr.82.1623869423251; 
 Wed, 16 Jun 2021 11:50:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v8sm2810676pff.34.2021.06.16.11.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:50:22 -0700 (PDT)
Subject: Re: [PATCH v3 12/13] hw/i2c: Rename i2c_set_slave_address() ->
 i2c_slave_set_address()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7691838b-df33-2179-0c5c-4209312426e4@linaro.org>
Date: Wed, 16 Jun 2021 11:50:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kyTMHQcOvyrn

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Other functions from I2C slave API are named "i2c_slave_XXX()".
> Follow that pattern with set_address(). Add docstring along.
> No logical change.
> 
> Patch created mechanically using:
> 
>    $ sed -i s/i2c_set_slave_address/i2c_slave_set_address/ \
>      $(git grep -l i2c_set_slave_address)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

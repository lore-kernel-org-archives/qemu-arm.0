Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2254909lfa;
        Sat, 17 Oct 2020 02:22:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhMLA/xEAwi7NTnVGGeVS6JkFNFuHlqjKYJLqwkThTZ1YOZTxJWaZ3UDG+Qte2vGHVMOXv
X-Received: by 2002:a25:16d7:: with SMTP id 206mr9754427ybw.284.1602926564319;
        Sat, 17 Oct 2020 02:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602926564; cv=none;
        d=google.com; s=arc-20160816;
        b=m33tXIHct6HCWqnHyP46J37Krha+ZkgogKesB8ZhbzqgFtCCc9LRJSwdy6fmbk6uDY
         R/AOZ2Ciq5XgLxHVwTo9VNmkUMqwqhnr0rwZxpJmzJWG7hhE3uw41wWRwWPHpQDvYWRj
         zt93u9VrDkEI183ijWU+mEWlIIunoCpy9hKjrpzo26lFMdTVRB80i2pbMiuUkThhagoD
         C3+iC2lx3d6FxvrdyVzzhe/ub2g/XFydQMu3Pk1gPMevJIwtM4DeV+sdV2cExeSibZVA
         sxgccPqZZIGSb9xwFJibFtnBhsOYIhgwuaIfNf33/GeD3IHrFYee5GDmr5JVJTrgcxKM
         Nxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=b3KJVlv6ZKrLsLLJ38DkzIkbIH6u5WC5iTmysjHUCyI=;
        b=GuplFopqjb9RCfmvMKWiv0XLA5ypz9bKPe3l+nsLG7a141vJfuX2Up/H1WaZ2pu6tw
         +LZqOrqinABPJqEwRzSfNIvixxS7hFximqJG5hnESSZPke/XoURA6B1cn3bGmv5cZapz
         TA+y4uvHoHv7ltW079Biik7pZL3rykG0gVD0Ayi4LbHXpecHl5pnsfMQsYLt3Gpicdlt
         D7YxGDkM+H0R3aHKO2F2PmM8Yvkt5kVzvWH63vgPYVr5ii6kdlAP9AeS+m+3kPC1FwVk
         GS7HBb86OXKCpASw7wJSsmIoXuP1u+fw5jcYmCbPaoKbXgFw6LYHyECRUKWx5dSKGPTz
         CYqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZSPnWPcb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si5659014ybk.401.2020.10.17.02.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Oct 2020 02:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZSPnWPcb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTiQF-0006SP-Nw
	for alex.bennee@linaro.org; Sat, 17 Oct 2020 05:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTiPq-0006RT-Ca; Sat, 17 Oct 2020 05:22:18 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTiPo-00063I-KF; Sat, 17 Oct 2020 05:22:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id h5so6094688wrv.7;
 Sat, 17 Oct 2020 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b3KJVlv6ZKrLsLLJ38DkzIkbIH6u5WC5iTmysjHUCyI=;
 b=ZSPnWPcbJTXa6YZz2A3RqdnG/7H4ZNwwm+vmBnBVNotjldQyjUAPOObaRS2JkoGOcQ
 49naTMPhLA9N+mcbcIPzBkj4hlbZd4O6tzg3jLOCiZoMch5iVK6oBXqbdbMXdVJ52ZI1
 eMvUrKQIVDOaIfVrON9Xkr4oVQMuVvClvIv3Swl6B3i15ZkWXJxZWVSmlHjwaAz8SwDx
 Osib1RYeZSP2eFQUl9IAZttFkotOOwC78YPNvwKEVPebvIZl0L6zgme7jGkVS0xHvgr6
 1KUXDAuD4rs8iCoQm6r1bNdWoobXOAsZr/zk186SsfKnDYA9pYshthho0DngMCZLOT+X
 CFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3KJVlv6ZKrLsLLJ38DkzIkbIH6u5WC5iTmysjHUCyI=;
 b=ny/6mWPBZFkmeTENl9SttHC+KBIpoXfONyLUzJlf7n6V0liQzK+iyINbmvl0YMFqdr
 TPsHfQ0UPMOKmsp3reA8SmRjSfrR5Pa7KS5Ird1i9fnKKyDcgsP4vuKkLVX2QlkeB1Ou
 JvwEiYgZl8Svm7+9YgDswycVAK3vCgeNvww1fKHUfp970bOLs26OdsvnXs2sFYW/GjxW
 JtxKDs3mFMAvM17td6coOre3r3AaqJr3G/Nk7p69TVifIWhHsxlNRHwVe7Y5fyx+Kg/g
 77v8i17nX7ky8OXezsrtjhHSZyeQkhg0WWCg4Z3iwQ1SjdmGn7m4uMOKY7qjGAFD0bi8
 NsBA==
X-Gm-Message-State: AOAM531dkBMjmh0ok086IooVcOHcB1Aanp6WJ5pXmsbSXFrfRKLupA9P
 0Qf5keSNqu8KNTuKdiigo2Q=
X-Received: by 2002:adf:fd49:: with SMTP id h9mr9726694wrs.115.1602926534100; 
 Sat, 17 Oct 2020 02:22:14 -0700 (PDT)
Received: from [192.168.1.36] (117.red-83-52-172.dynamicip.rima-tde.net.
 [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id t124sm6556659wmg.31.2020.10.17.02.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 02:22:13 -0700 (PDT)
Subject: Re: [PATCH v11 09/12] linux-user/elfload: Use Error for
 load_elf_interp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201016184207.786698-1-richard.henderson@linaro.org>
 <20201016184207.786698-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d93a9d0d-1816-9f7a-e190-3e4a66679bc7@amsat.org>
Date: Sat, 17 Oct 2020 11:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016184207.786698-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.253,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 561Zi/ava3x7

On 10/16/20 8:42 PM, Richard Henderson wrote:
> This is slightly clearer than just using strerror, though
> the different forms produced by error_setg_file_open and
> error_setg_errno isn't entirely convenient.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

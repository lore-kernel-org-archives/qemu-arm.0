Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1454704lfg;
        Mon, 16 Aug 2021 08:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2b57qPj4wrbnATRsac24dhlGi5g12r1E7kJdj1oMseYZbhrdPVZPb7e9LrmBbVLcKFMff
X-Received: by 2002:aa7:d815:: with SMTP id v21mr20694755edq.262.1629126748521;
        Mon, 16 Aug 2021 08:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629126748; cv=none;
        d=google.com; s=arc-20160816;
        b=mpZCFQ3dPHqRxeJUrsNDB+YB1hqjGt4je10Nev/KxWd6azJP61YwGjOMJ6Gd02j8bu
         Vo3i4y15WwAshMv6XGC8rLDvycb7BOOCVsd1BH4A4sBunmaEycCaPT6Nr+AunhWpszJm
         ovSYVa5/d8ozs2hmSVcuHnKD1iGX1yW1Gpj/cW+LROrbf6FZzW3AljUUEXoJCFFOnQiF
         BN2yaHDSyD5L2wu2RCqwaZxfX4UxqjYkp3mtg4KWPq2EGZWIzhTK+sjUF3xLVcvIxi41
         HGAsY00RHozTFFh/EjYQ13aN8ZWA6UBzkmvKPE23gADRcwIEEvS3JvGVp3JQ6eYD56xN
         XHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=88h3na5Wae3JGFzV3UaPER4PrVtMNd+s9mSPPesndCg=;
        b=laLUTfUD8WwMqBQbGuu6wyDsox+G0xPtjj5fr4BL+RiYV2HEmT2N5JdyKZThFaDOXB
         vi0Xih7C/i3AbWt8gQw0jxGzjc+NhtBcZ9we1htBRkLxczar01lRbvwnX77lVYBUNTbY
         lX1vfPOUYUcWS+EbuVL0a36IJ5rUx/clOyBzfFnFJoELSgnvfyTBGOJ1UmpebDsfq7tc
         BI+vdJIbqcDsLE9kX5fBz7PP6E4e3WtuIl9gHdH+12c0NBJMJMWdBpdKkSsUKXmnofAI
         FlydeWjy4sfDoVnfWNDnz/9GowqQgtbmputDFZCQmW56vZ6WOQnOm9OV7EdeXS8Gz18d
         8NEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cx3z7D8N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si11554088edi.195.2021.08.16.08.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 08:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cx3z7D8N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFeHr-00043w-Ie
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 11:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeGP-0000xk-SG; Mon, 16 Aug 2021 11:10:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeGN-0003uT-9p; Mon, 16 Aug 2021 11:10:57 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so215493wma.0; 
 Mon, 16 Aug 2021 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=88h3na5Wae3JGFzV3UaPER4PrVtMNd+s9mSPPesndCg=;
 b=cx3z7D8N68bNcQmSOfzrQojnx1sSCWHsUpsAYEuZEiF0SS5NJZoGRv0zq66uOjBiYE
 XG41FZr9fuz/tUPH+uWzXf4SqlZZhlm78+NsROKQtAF/LBCSI+RplehOpmZbay5ocA2e
 2u+aISOPjpOB6lwMNbhTB7quhk/eStLqyvw2SgdyrjMv52cH5g4XMZMHLPrKx/pjU9XE
 wRsJXqQL+y2gitCPuuM3IUAjlhWJZ2zJUq0OLNZbPefMI9a5lot59QH9INajqUsGDvXQ
 zUsrT537lzinVLCzSqRavEcHbmjaC04WYJZzI2T8yOt639/c3l0FVJjk53/5VarjK74s
 f0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=88h3na5Wae3JGFzV3UaPER4PrVtMNd+s9mSPPesndCg=;
 b=Y4yVABvSp6Yll3frTp9ciPC/2WjRZhg0Xzc1NkVDVQtEBE2GWCcNC/N0Bp74IplnNf
 rHhFSZgCUMLrhVmg7BEO5OVEeL2iurmHPyFy8h4B7PK5ln/uCGoZzKMSJ0Ye44A6A6Dk
 7p8aQUE3A+Ca0EUiMKn7ZZIPf6xU5sOL9UBiyaRO0btpoY6td6zddJK02ByN7pVhxhNW
 knVxKolpKrbd1Bzs8cQOw2PIL7ISKv363KHbrOikFWAzT/9mRltqOWuOA/uDT+tOswTJ
 IW81srGDMhq5umvny776k+qzlO1Pkbkebv+S54B9LNihpBqXVqDlDRTioWsfR+nbNAVY
 Uxxg==
X-Gm-Message-State: AOAM5319vgGwMME/+wBVIsWX+h8eAq99IGBqXxLRWe9lCHOD0yasaOt7
 4XCUKTuC2nZasAaZCxnBtvY=
X-Received: by 2002:a1c:7515:: with SMTP id o21mr15875701wmc.150.1629126653669; 
 Mon, 16 Aug 2021 08:10:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k6sm12183686wrm.10.2021.08.16.08.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:10:52 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/arm/virt: Delete EL3 error checksnow provided in
 CPU realize
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816135842.25302-1-peter.maydell@linaro.org>
 <20210816135842.25302-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6d45d23b-c536-6c00-b9e6-5c1872aaefad@amsat.org>
Date: Mon, 16 Aug 2021 17:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816135842.25302-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/hW1W6X4GQN

On 8/16/21 3:58 PM, Peter Maydell wrote:
> Now that the CPU realize function will fail cleanly if we ask for EL3
> when KVM is enabled, we don't need to check for errors explicitly in
> the virt board code. The reported message is slightly different;
> it is now:
>   qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled
> instead of:
>   qemu-system-aarch64: mach-virt: KVM does not support Security extensions
> 
> We don't delete the MTE check because there the logic is more
> complex; deleting the check would work but makes the error message
> less helpful, as it would read:
>   qemu-system-aarch64: MTE requested, but not supported by the guest CPU
> instead of:
>   qemu-system-aarch64: mach-virt: KVM does not support providing MTE to the guest CPU
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp564800lfq;
        Wed, 9 Sep 2020 09:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK7Mf9NURr7AcJtZzUK5uyTIcvTiQYWpdLJArLV+y6KjjFegZhVNoBZehhn6kxfZbyaC20
X-Received: by 2002:a25:3453:: with SMTP id b80mr7087372yba.237.1599668884631;
        Wed, 09 Sep 2020 09:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599668884; cv=none;
        d=google.com; s=arc-20160816;
        b=VFG5iMBTC4zOFH5kiMXpY4/glWWErspaH4kVn8sx4V7clDGpeoScduaa+IB0mSDBF+
         vD+jXbdNGrA3GDf8EzxWbLjIrjzC0/EBXTf8eMzOBxJRiQusWwS9WEqW7Wy2CJNtSHiD
         Pl9Ic+4TbdSPmr2+k2KsugzIQZOXXpufdLmBtsFl/hO6FUvjZ3Rfmzuj6Z+GAbQrrQuq
         aZcsahDbOBYPKcpVc7q2oqvYqOY+zyYLiG8oVdLRbbnm0vehALWhoy6bEF5Se348Khjz
         uUetFZ+Ag8Kdp+/bAMudb1pZsXWqg7jY/P5j8ZU97IOXK3z7Mk5SZRXHjRjv43jfEDyU
         f19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+slD6iVjN/ljxVLGr18dBu6NG9xCNi0MEhdUze1ZLrI=;
        b=i1jvEHAG3wBYkPl8+hPpVocKbnYN02+pr1HM6iWiU0OGBEao9r+NwRbB1hN1wTgfQx
         WmoWTkK9HGZBTJ6FYJVgF+DtZ6AqmQnNkY9YRs4XwH49YK44MtBVBlUCDwZWrUnBsgan
         M8seLCSnUCTFCnVbPuT7bdVfaISAHoZZ1MqU/iEHEp6IVVkDCpZElz+9Ux/h5CSksx55
         f+PkiYmTY7BF9K/a7cnZiYNl6S89hVSgBB70c035QJdUaSWctym3vkOflKYlGG0cniOC
         jGpoN7paWvCUuYlPzghhThGk4lvsmlb6CS4Aa6JbJKYn0tdq/DvqrVVm0Ta3N3tKSSK5
         zwoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UdwL9rIT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si2982070ybm.474.2020.09.09.09.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 09:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UdwL9rIT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kG2x2-0002XO-1B
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 12:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kG2vs-0001E2-DS; Wed, 09 Sep 2020 12:26:52 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kG2vq-0008FY-AA; Wed, 09 Sep 2020 12:26:52 -0400
Received: by mail-wr1-x443.google.com with SMTP id w5so3622381wrp.8;
 Wed, 09 Sep 2020 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+slD6iVjN/ljxVLGr18dBu6NG9xCNi0MEhdUze1ZLrI=;
 b=UdwL9rITPuhHuSEe55gw4yqQPOwRE+UrbL2BVYumKirwoi5egETbwkuFzvDVp1zK+F
 RpcJc+DShuVZw1JtTGt+h7mTtTNXGitDgPhpezGEAfORK4GsIrd+V9D65rHpomjXdKJK
 iUTerDlki+PQvZL3Gcq9JWmzOHq1jJzPhtPWfVtdKsG3qHYoo97E29nRRA4szag+cTcf
 hsQ0rjR1RllYFdlCgQfeSWp7oDrAgq0JW6WJBIVVQq1giq8vfw1lRcv9TpwkLf7pIXXb
 RKDYcwyN9mio4hN8c8d9bZDzlkmjB9xMmCcVIA0yoZyejqPqpzFn2ZBjL8H/ZY6mgcxu
 8dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+slD6iVjN/ljxVLGr18dBu6NG9xCNi0MEhdUze1ZLrI=;
 b=HDbgtBdjKaBtjkFYHxrzBuFNevF81axSJBkbQ5FFqHh6PH8MuQHtzT4NePNbBY3rVd
 Vhjm+Te4OmVdQvwytKR1psiYyphY4CyYgPxfDPEXSYBtCTs3HfDHajMcYhl3tJhRUzBh
 bWH1rGuCi4SDKpLc/JZin6ZBURP+j6nYr++FbZJG25In+BN6oT3Xlivoxi2+OAhJbpdi
 JBmdZXktGfuTxePnYZdJe5jEEWVXu/EBuGV5yktqOkPvQy+EEXojbFLSPNR0ZXEqRxvt
 nnCVGrYr/DEv5xNtevDvNrGr5oWhc+7IkIB++AHkWBGQJGct8tiPNYTJh4F9CJADQZya
 K6QA==
X-Gm-Message-State: AOAM531bSDZ/iEj6e/4MlZQFKTS1y0+5+SaPUucEQNql34XK8emBlXx0
 QVYiUZIrJvgla32tojsjOvs=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4646824wrs.227.1599668808158; 
 Wed, 09 Sep 2020 09:26:48 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id i11sm4658512wre.32.2020.09.09.09.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 09:26:47 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] hw/arm: versal-virt: Correct the tx/rx GEM clocks
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200909161514.622998-1-edgar.iglesias@gmail.com>
 <20200909161514.622998-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6b413810-f302-35f5-4b2b-2c22565c3d5b@amsat.org>
Date: Wed, 9 Sep 2020 18:26:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909161514.622998-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.576,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kzl0JNuwCWsa

On 9/9/20 6:15 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Correct the GEMs tx/rx clocks to use the 125Mhz fixed-clock.
> This matches the setup with the fixed-link 100Mbit PHY.
> I also avoids the following warnings from the Linux kernel
> driver:
> 
> eth0: unable to generate target frequency: 125000000 Hz
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/xlnx-versal-virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 4b3152ee77..43d74b850f 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -212,7 +212,7 @@ static void fdt_add_gem_nodes(VersalVirt *s)
>                                s->phandle.ethernet_phy[i]);
>          qemu_fdt_setprop_cells(s->fdt, name, "clocks",
>                                 s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
> -                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> +                               s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
>          qemu_fdt_setprop(s->fdt, name, "clock-names",
>                           clocknames, sizeof(clocknames));
>          qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> 


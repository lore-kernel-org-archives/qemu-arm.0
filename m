Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2739964lfc;
        Sat, 5 Sep 2020 21:05:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywY5zYtKpKdMEw1vOBfs+DWPFwLMLIVMaMNFUhKYkxxg0SlxYKlKvq1XEmyS46JA+xsc8N
X-Received: by 2002:a25:2315:: with SMTP id j21mr15197260ybj.58.1599365106559;
        Sat, 05 Sep 2020 21:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599365106; cv=none;
        d=google.com; s=arc-20160816;
        b=lKmaPdpyJrSQztZF5SH6a/RGqB7UnWMRrRTZ4w/o47WdGj8gwQ739WBVtkV6u7fzUN
         9qn/2rt8CyRAl1x6JSamqsxIHkCFWx//ovLilb/7hxvHcesoDDPOoFKRuJjph9P8wFOf
         v1kyaDyRdkygTlb1gBJy50CFcFjcvfRiQBbwxpzokJXjKL4t/WWXf60coPMZzS9vCNkV
         4gXyb1NW1V8o0qjY4rv8AklK4mtmVW2AuOdZE7owgidQ66+2iyqIWEFh5D4HNDvBrNtY
         5MayV6Tf6kVwRGcL3O5uQXPuuMfXz4XEAQnK4rTOTlEPKbYD+hkuPgnwFNfe4n0Tpp0S
         axQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NtelkJGO2Tkjn/RR1lc9+zOYCVkdgigvMmftX3TmclY=;
        b=0j/jqz/28t6A5dR0/5cx3fSLkCscwcmfLOk01IEBVwoKcXY2rvNFvP7QDvSnVtWa4K
         PK5XMfm2KA3ppzVdiXSRj0Rkzh4QZNxZjkYS0iA9HgXUg2iy5HQ4WyawyFTXh7bXy/Nm
         tHXBKDU4P8LKZn8Sba9CRmazK7TkRZ5BvnN79KR4Q7OPOwxeHWLhvNP58FmxdzBmimFw
         Xz8C8zxukWWWnMddvLessLLZ1L7WeykZo+37n5d4grn2yOkyX3ibKFak+a0spFAYVcct
         p+o9wQsIyKJj5Z3PWuGkPcsslTg2wWscs3bptzuC+kNQn2ECvOWuqK7Ad1EqLJ3Sy5gr
         yKng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eO6lrUMd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l65si13322069ybf.282.2020.09.05.21.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 21:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eO6lrUMd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElvN-0005S4-WB
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 00:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElul-0004sZ-TD
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 00:04:27 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEluk-0005Zd-Bh
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 00:04:27 -0400
Received: by mail-pf1-x444.google.com with SMTP id z19so4639541pfn.8
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 21:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NtelkJGO2Tkjn/RR1lc9+zOYCVkdgigvMmftX3TmclY=;
 b=eO6lrUMdaKTvov9ciYIJIBFjZkkommZHg5vFkVVJsLudq+QyUZAm20VK3GzX1rmJsP
 mPb2eeOpvuPag9ZY1FqC3lQwHtwCt0MSBr+nIogkyqbqVRCIa3LGnhOej7/bhmb0PfRK
 ZVOTOncGVxzrN0K6SAA0yj7Qc20R1MQQRONzE8zVAXlNIMac/OTpe19859GfLbrxrvks
 GGRTyyJPeidbLg+hLSKUryQKIwg9nEnYDlIutedeXMSH17Ux402dNiLCh9CkGJipjZYA
 B8TXORQT8Ntyah370VbF29MRSvMGilj/MgoKLaiUEdQsOZ/yV+PBc0CM3k3QAtjruBTH
 j9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NtelkJGO2Tkjn/RR1lc9+zOYCVkdgigvMmftX3TmclY=;
 b=jHUT0/4wa3KU/7oh/MvR2wNMrVBjdzB1OQuM3lGic6MjtavH+Sek7vQMy18nsTvmyP
 fszkp8gUVNnFPjfXk1GIhhv/qDDYPKz5ooAI7jDL/jEwLcCFFZTC4nA/ORKyqnG6t7Vk
 hAStkozUuCjS+1ZzacXgU/8ie+ky4/xikSL/HeXsZhjv4akC7z5Lyv62KMdl9PhGwCh7
 WFGUcEhvQFJNVGJ4t881/xEjPlPWMJ4AZR4+nxiGza1CoWzqQKMF+Ebyc1uakZ/9q4NV
 S5g6YYPknFbEweSIACeX6ZxP3QYJcO+4l1jlx/v0J4xu27SPjZMt36mm0eyTsVVjz5Pc
 QoNw==
X-Gm-Message-State: AOAM533b421BjC+2DCKDcGzkDz0WxnjqSkAA7VbdsBT8wgmiZc5+FKj3
 KJbmStE+TbOcws3PyvVf96jLpQ==
X-Received: by 2002:a63:d157:: with SMTP id c23mr12687398pgj.281.1599365065014; 
 Sat, 05 Sep 2020 21:04:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 63sm4078147pfw.42.2020.09.05.21.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:04:24 -0700 (PDT)
Subject: Re: [PATCH 12/13] dma: Let dma_memory_read/write() take MemTxAttrs
 argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-13-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e4102bc-f477-c367-aed0-243532f06207@linaro.org>
Date: Sat, 5 Sep 2020 21:04:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JxKribFyF07H

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling
> dma_memory_read() or dma_memory_write().
> 
> Patch created mechanically using spatch with this script:
> 
>   @@
>   expression E1, E2, E3, E4;
>   @@
>   (
>   - dma_memory_read(E1, E2, E3, E4)
>   + dma_memory_read(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
>   |
>   - dma_memory_write(E1, E2, E3, E4)
>   + dma_memory_write(E1, E2, E3, E4, MEMTXATTRS_UNSPECIFIED)
>   )
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


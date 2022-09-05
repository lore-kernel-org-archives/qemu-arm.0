Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2590723ejh;
        Mon, 5 Sep 2022 14:09:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4iIuwIC+B1zEAQUV4ylurH7esPbun9ijtV0VFVkTu7P4hUauNTg2bHgaj1SCBbQoxwGqJX
X-Received: by 2002:a05:620a:461e:b0:6bb:b3af:f5ce with SMTP id br30-20020a05620a461e00b006bbb3aff5cemr31886980qkb.681.1662412186946;
        Mon, 05 Sep 2022 14:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662412186; cv=none;
        d=google.com; s=arc-20160816;
        b=LY87tDxhQUp24V6FKJbjLOo7vTFCPmhC9XGXbf+zQKIdJGetv+hzGFBEapj1NMshBq
         9yLnkLx88iirgdrzciQR9ZlPGHxyql5AOovj00HOG9QlleZIM8ykoOMuoojFL9AZXTml
         M44dzybiTwRhJOZw/KAchTBRlrkD2mKN+uNYnYo7Bb7pCwLMHHfVlYg03i9DH+R2po6Y
         jZeiQ5pGkTATVU2hY+VmD2KJ0jwhtIrIs8LoNPbCs//1SD8dupLVdXFBgMmWhcvCFKLv
         ig9t4ofZczaK11JAFpJAsefBZ3rFWmcrES85TiaP64aOJH/sx76vumxs6p6sx5xzQrFi
         mHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3cje6uTO0v5sT7fwp6ARvf987BH3oN/3AOEDYn/lX4w=;
        b=m9fisP5v+gh9kPlkFWdVVslHM0eEza45+F/juWncowa5T1Xturg7v1ERrRxIq3c56n
         nD4sjKg0zFOCesIrSA/o7Qg4xpmdX6kVvF6vEQjcIQkP512ShLUmfkr4TCNJegwGNLho
         2is3Y0Tldi++LihrExcXZShkJIE7vwVQpLpqrrVYERvhwydPHkb7udB01EXlacJHmwwJ
         s1F2QGXQaZdhjBTABF+eL5JZerU4cBez7NFGqbWnrBMsY8p0PeLxQWZAlXy8XUYXYxSh
         eo+HM3bjzYo0u4YWv2X+eEWDBhutmZeTA7Q++MNUhyFJP3fLpAYT2sRJVUZnTJuO1VzJ
         YGPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SX2+O++f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c143-20020a379a95000000b006bc422bc925si5946363qke.148.2022.09.05.14.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 14:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SX2+O++f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVJLm-0005tf-FS
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 17:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJJW-0003jv-7P; Mon, 05 Sep 2022 17:07:30 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJJU-0002IJ-G0; Mon, 05 Sep 2022 17:07:25 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r69so8914756pgr.2;
 Mon, 05 Sep 2022 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=3cje6uTO0v5sT7fwp6ARvf987BH3oN/3AOEDYn/lX4w=;
 b=SX2+O++fN2GzDfXo7VY9l0MYjNr1xvSOPiNHyvmcOqoOT06MonQSiaSjPEF4EIr0kh
 RgjlZd1L6PB8kYCbzo0CKvDoWW7nuZ87mBGNNACExxhERmuiXot7ukJYqPVw92YlYwK4
 sfp5m27b9ItscodMSAkY9Gq9BPahcep154lj1PFsabKSMIrGD/MWuTCoiAfJhdDMJVW1
 2kXYDr5Qu0l0+t4SYZ75S9lXehuAoexck3L1dojYJSI5njmvbSLCew/DQTlBtH12ZQyH
 ZxQfmxEZxTFWZaFEmXjB5P/SDKVTrWzAHZ+hAX3EdwZIHuWVanYoHaqGVJmTEZX9eyEZ
 6KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=3cje6uTO0v5sT7fwp6ARvf987BH3oN/3AOEDYn/lX4w=;
 b=AohAwG/mHW4oRF+RgpkXqnvXQwx3q5UKfNUvTS2A30PTicG7eDIDPclsqFqepIpw1i
 0pQvRWBagSFbACXzb34bU7KBkn0p+3QYIOAYhN/vHB+zBIkn5rMbYQWEJDg+xjx/Nba6
 1bjYnETXUEcXGeyKXMDSzZG3QYbaIHR4yYiSSC/HGSqr7ZB0wyuvqGPAcStC3sZ/gdv/
 PWxIcOnq4/4zNqIV4UT5cyrnqhSaXvgjsXWUcpo+ETRDRnAVM3dJy6NPr3zEDNpV0OiD
 7cAqRFxGESespe8rCYC3VS0zzdQNcKWoutGkXllum/40ELE8LbJOlqbL0KMxIu02wXnV
 zISQ==
X-Gm-Message-State: ACgBeo2Mgx2ECysRDlGZEUBlrniHkE2rWUpiYRjqabrR5aMQGtSnylwF
 LRnihx3uDyL/G18/qZF4+bs=
X-Received: by 2002:a05:6a00:bd8:b0:537:ea87:45f3 with SMTP id
 x24-20020a056a000bd800b00537ea8745f3mr47553889pfu.55.1662412041686; 
 Mon, 05 Sep 2022 14:07:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170903230700b0016d785ef6d2sm8026012plh.223.2022.09.05.14.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:07:21 -0700 (PDT)
Message-ID: <0db0dc36-75be-514a-47a5-d050a958932e@amsat.org>
Date: Mon, 5 Sep 2022 23:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/6] accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-2-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: 8n/LLfgkLEdD

On 5/9/22 22:22, Richard Henderson wrote:
> This structure will shortly contain more than just
> data for accessing MMIO.  Rename the 'addr' member
> to 'xlat_section' to more clearly indicate its purpose.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h    |  22 ++++----
>   accel/tcg/cputlb.c         | 102 +++++++++++++++++++------------------
>   target/arm/mte_helper.c    |  14 ++---
>   target/arm/sve_helper.c    |   4 +-
>   target/arm/translate-a64.c |   2 +-
>   5 files changed, 73 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

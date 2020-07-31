Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3350393lfy;
        Fri, 31 Jul 2020 02:38:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZQKI0nxxFYfoCxkYf2Gf5PFaBFO5eiNkRojlR5E/CsZEhj8cnvq8xgrrGeJxdJh9WFRwI
X-Received: by 2002:a25:3155:: with SMTP id x82mr4972172ybx.492.1596188311284;
        Fri, 31 Jul 2020 02:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596188311; cv=none;
        d=google.com; s=arc-20160816;
        b=eHec6XzmlO252ceuNI/eoUGUbqXHbiwvqkA45JKvLFlo9+nwPTVybqV1F7GL5VtbJn
         Twha7Zye8rRc+wDcro9Pj0um3dKwvPB0boQr8qoELT5gETW/yR1Jt4bp7ujYDdPy8Knn
         sbPWX5v7nEpqxCirondnpwyoRzfUw+tgN/Lm+HtEYh/WdDuWM4yAnDeBYKpczb/1NgsV
         zg8wwvRkPl57Pnb/j0mV1T8xnCRF2Evorocg0mAYEz9Q6EOOpcSR1ld+s1TnxRDkrdqg
         FJuKP2KNZtgJDme/rQDuR49Y2Yoss3x1LTtHglLhBNaXPLqh7WfFtBnA9GeJ5Z7Dl1Jr
         aplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=7C/j4Mvfg2V+l4u3oExX9TC73jju2ckGlf+faiAe4ug=;
        b=FW2rmEHfrST5x6dnUUsUdyyy35OMpYrdzgbs/02nV8gwfP1U5y3AEopnj5NT5QGLFr
         C+xqj0QxBrklod+1UUQG4VySBhes2x4sfzOV2iqapuyMlVzzLArHxhYySGyOzC23QF4h
         GV0m45DfIF53jGAVmCg1InOxVX+W5p8YFJOMTkpKZzXEqW5gQ15FM2/dxhAnZl4zH+R8
         /GQPfgiXXLgyfx86258Ngfed5Q2WeHfeAdb/Oo4jaySlEjfoME9chO4JBLGeknHCi7LC
         llm/txFlSmRraCoKEIyuMo+Y1Jg3nMwiYHYsV9K0RsFXY+L6dBcGXvRpRVy/v0J/34NO
         5kvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d74si7176550ybh.58.2020.07.31.02.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 02:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1RUk-0007GU-Mx
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 05:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k1RJu-0007xR-KC; Fri, 31 Jul 2020 05:27:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44456 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k1RJs-0003JA-Fr; Fri, 31 Jul 2020 05:27:18 -0400
Received: from [10.130.0.69] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH93p4yNf6fQCAA--.40S3;
 Fri, 31 Jul 2020 17:27:06 +0800 (CST)
Subject: Re: [PATCH v3] target/arm: Fix compile error in gcc 4.9.4.
To: Peter Maydell <peter.maydell@linaro.org>
References: <1596186433-17364-1-git-send-email-likaige@loongson.cn>
 <CAFEAcA-yTM7=Q0V1_8fSUa7KnsgQawcP=Jnh4J4oCrhFAt3dXg@mail.gmail.com>
From: Kaige Li <likaige@loongson.cn>
Message-ID: <998cc5aa-c637-9456-985d-4272a05f18fa@loongson.cn>
Date: Fri, 31 Jul 2020 17:27:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yTM7=Q0V1_8fSUa7KnsgQawcP=Jnh4J4oCrhFAt3dXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH93p4yNf6fQCAA--.40S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyDGr1kXF45Kw47Kw17KFg_yoWfXFcE9F
 40ka1kGr1UW3y0qan7uw45tFyIqrZ7ZrW7CFZrGayrWw1kJ3yfG3WkWF1I9Fs8Crnayryr
 uF1Sgry5G3yj9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbsxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr
 1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x07jYfOwUUUUU=
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 05:07:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ghJhx/GowVw/

On 07/31/2020 05:20 PM, Peter Maydell wrote:

> On Fri, 31 Jul 2020 at 10:07, Kaige Li <likaige@loongson.cn> wrote:
>> Error log:
>>
>> /home/LiKaige/qemu/target/arm/translate-a64.c: In function ‘disas_ldst’:
>> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: ‘fn’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>       fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>>       ^
>> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: ‘fn’ was declared here
>>       AtomicThreeOpFn *fn;
>>                        ^
>> cc1: all warnings being treated as errors
>>
>> Add an initiallization value NULL for fn to fix this.
> As I said, I've already applied this patch to target-arm.next,
> so you don't need to do anything further. It'll get into
> master probably on Monday.
Ok, Thank you.
Kaige.
>
> thanks
> -- PMM


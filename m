Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2575175eja;
        Sun, 5 Nov 2023 23:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSb9vwAknhB0P3KV+uHD73naFyxa9XuJxeyuLuJCCaDpNs2SlXPvh8iGkpQ1AYsm6fFC1n
X-Received: by 2002:a05:6214:124b:b0:671:43fc:c275 with SMTP id r11-20020a056214124b00b0067143fcc275mr18908201qvv.48.1699255109932;
        Sun, 05 Nov 2023 23:18:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699255109; cv=none;
        d=google.com; s=arc-20160816;
        b=o+Iw2ldZGhg0szkzukF/U2Wojkfycc4fJlESlW/djEy9ZpRIuhfANRdOl2dClvtNIZ
         +DmWIFKUvrv/bCZyMZszSZ4QpmJhEf9DUcrDW/6U5M36VkCe8lIkdRGuX6s4ZumQxbqr
         F32Fc+4/RYs6d/U3gAZkDJe/1atwUqHUJ9ujTy1KZ7SGPt3FPn4UQOpSfsc2Z73I2t4H
         UhRVTmD94CNJgEYtYtesn/l3ZIoDPnfDHRsQeb8IWCcuKvI8dzqBiAz7gQUQJSc12ZdG
         kFxUpQPU7U4AV8JWDPr4c8/2RZcHKey8GyD035v+oFPoFtLv5FHWJxZeUkhVNwSKoMK9
         tEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hodLEJrIrf1SgrJbrg7bPvIrnsFm+jWdxqkcAuAiGj8=;
        fh=D9Zy3Zo6Ngtij0ADD13U6lCyN9zlgWdxS2svbWoLGjE=;
        b=t3lYWkNvX+u6BGgdkCRIciLx21ZalH8pCKTOoqHzHMiK0Qxx44U63uF87A1VsZijWK
         ajRSZkrOMBTbNmgzhqeQ91vU8eX0dhOsNiSbqiS53LXT2reylBRsl5QKK7xgnFrLL3yV
         1Jnn8zqJ/B9TrHuDtxEcOYTWN/oVH9HgKUzRPvme5m6GzECxlh8u33lsNIQqCFebGqim
         oiJts2JhJCC+nID86wXc/V8ysifY4ve5cdd3DbvXa6GA4/I1pVcQ3jy5RnSSS9wTtjEj
         M63ADmhpthTT5dlhpCqDQ3POqn5iH7ygFgt9XMIbFX+4zrM12D8bNKjzhqRX2WFAo5MG
         wUTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGju9Cg+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ad45bc1000000b0066d296fd731si5725343qvt.113.2023.11.05.23.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Nov 2023 23:18:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGju9Cg+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qztrx-0007Mg-F1; Mon, 06 Nov 2023 02:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qztru-0007IF-U0
 for qemu-devel@nongnu.org; Mon, 06 Nov 2023 02:17:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qztrt-0005PY-DG
 for qemu-devel@nongnu.org; Mon, 06 Nov 2023 02:17:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32f7abbb8b4so2654758f8f.0
 for <qemu-devel@nongnu.org>; Sun, 05 Nov 2023 23:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699255072; x=1699859872; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hodLEJrIrf1SgrJbrg7bPvIrnsFm+jWdxqkcAuAiGj8=;
 b=nGju9Cg+nxKNJaQaET2IBil0SW6qEqnZvG+HpkiZ/GeFyO1QxUBcciWYhkxkxUs5/7
 E7rFYA7A0lKDe43Mnv9qwY58hCSeNYHgLUuQ0Lw8x72xnZflEafBAoM4Wiw9a1WeegJI
 kikLHYfFP51XTy+BqOt7NOvK9fNopTAZuLNu0Yj32vytJHWb6oI22GkVfxS/DypsnuhE
 jsWQM9xQUI+AdlK07sxaCiMlKxahElw42c8LWsB1ee9n9CQpY9NA8Cn04dJOL4HQP+E6
 VeAsBmxV3O/FuzBO+ni1Amae74Se7KvD5TIwOhTnlwsJ0/hgXwYGEtTVq+cr75ScpixF
 hllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699255072; x=1699859872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hodLEJrIrf1SgrJbrg7bPvIrnsFm+jWdxqkcAuAiGj8=;
 b=Vw2xzo2DgHtb74x+gSoe2tsArsFz5V/YBlUzqwXregDozdvjhCXhlEUG6SBNO4H/wd
 fr7eqdFWhxrjQzOrU2Bswf+DWwLowo2697UuGIVPWrXhnwMlWxIiCet7d1ITw/NpHvgQ
 K4QGSY5tYcuCNxJXG5dsYQ2SgpJ5/dD7NuweL/NmzKaImV0Ty1yz858wc/NFYft67DDG
 IAYhbg9YoLdVkFJVnaZpA2aRRxEzwQQrRGtRVhLeZaHWmTR0dbSWFoE31KlyHdMuWlPZ
 HSmgP2DJeFQpyGHPRWx3huCZLhxa56Tw4XpOv840h7vICp47lhXzC2qqCqmFALE2H3XV
 HkwQ==
X-Gm-Message-State: AOJu0YwUGPqIXnaLAE94G+Byzu6mzQvqtheBFjgharr1wzg5gKteLGRm
 KbmPTjpT7dW5uvzmqZgtfTNXLg==
X-Received: by 2002:a5d:47c4:0:b0:32f:c5ea:72ac with SMTP id
 o4-20020a5d47c4000000b0032fc5ea72acmr5258933wrc.46.1699255071432; 
 Sun, 05 Nov 2023 23:17:51 -0800 (PST)
Received: from [192.168.69.115] (176-131-220-199.abo.bbox.fr.
 [176.131.220.199]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfa352000000b0032fb9c5aa24sm8066371wrb.93.2023.11.05.23.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 23:17:51 -0800 (PST)
Message-ID: <6c39fdb9-1a77-3982-3ea5-00f58ca15e2c@linaro.org>
Date: Mon, 6 Nov 2023 08:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/16] target: Mention 'cpu-qom.h' is target agnostic
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <20231013140116.255-3-philmd@linaro.org> <ZTIo4NpORQvvRcED@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZTIo4NpORQvvRcED@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.137,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KgqXv12RyCCV

On 20/10/23 09:14, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Oct 13, 2023 at 04:01:01PM +0200, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 13 Oct 2023 16:01:01 +0200
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH v2 02/16] target: Mention 'cpu-qom.h' is target agnostic
>> X-Mailer: git-send-email 2.41.0
>>
>> "target/foo/cpu-qom.h" is supposed to be target agnostic
>> (include-able by any target). Add such mention in the
>> header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu-qom.h        | 2 +-
>>   target/hppa/cpu-qom.h       | 2 +-
>>   target/microblaze/cpu-qom.h | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> Why not mention this description for other qom-cpu.h in this series,
> e.g., target/i386/cpu-qom.h.

OK, will add a comment in each patch.

> Otherwise,
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Thanks!


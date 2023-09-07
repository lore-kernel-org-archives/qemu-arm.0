Received: by 2002:a05:7022:12b:b0:6b:57c3:147a with SMTP id 43csp193977dlk;
        Thu, 7 Sep 2023 02:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIJFhiIL/GDPLYI1q0ffPFozJmD5ECRHZ9PfjkPOTxPHTfu5d0eCcFtjFaz7B4XNT9/qQl
X-Received: by 2002:a05:622a:1c3:b0:413:5df3:9347 with SMTP id t3-20020a05622a01c300b004135df39347mr21457378qtw.36.1694077147802;
        Thu, 07 Sep 2023 01:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694077147; cv=none;
        d=google.com; s=arc-20160816;
        b=UaYqIxIqfDSr/WdvTeJSGBEjhP59Hkp2AdYlUTOYZ6YRniLDQ03OIt0R3//hoBhXtT
         rVfpA9xTACe/9NTXcqYdSSrO55+kXSdFY6oMrpq12exU4K5CwLDJYMO92Qwn5xesXVU9
         mgYYzp8uu8/50olktJomRytSBMp8zgcigbNu77Fpgq7OEFpKbYeiYzMWdVdlPHYILp9x
         Oo8+2xCby9C4P5TYVkRWSgYC0U9kY0bgcnOeuS+RwawnCTLBl+PcJlPTO8qKWsTcx7ca
         Fh14OwEQjtYTBUU25nIXjfW5Hm56nF+QZC08JJdHQtl8Rgz7XtBlMjS/uB36nLsD6Q7b
         GqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hREobUNlWVPYzdlt0N94XWuJ37kHY6R7TO/8WXMn0Os=;
        fh=IgOkjrcilc0xkoP5YFLtGNcQdAFJIcpaUjEHlrWyehA=;
        b=FwM64lqKT48bxkygAiQoHtgY7/zy9Mpvf/O15p/AzBr1w91vCU8ruHvPbdrPHouFEP
         kJM3jiMCqXGihF6RgxFu4/CIoHtnyfCN6x2Vi2oYjGNmdWEcesNtZwBxfdoYz63TGV30
         WmmXPvy5/t1petTzOdyH42OJsx2AMWgOulrM9///k1GmpGF9nRWd6nvz2vwLEd/XDupk
         7fx1EN6Pm7AkFjHXSxr6GRaZenPVAowNGeOLHTjRc+yboJo9l/BMG3xYwrrd30MbPldn
         RpIATGIIymNwPPI8zOul+3CoDIpuwuCOKQNw/xkyHLF/lWjX1JoglnWasd+hyqI7gLvA
         v4Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gc2BDcsD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ac85dcd000000b004100a4a0d6esi10997625qtx.710.2023.09.07.01.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 01:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gc2BDcsD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeAqL-00063Z-JD; Thu, 07 Sep 2023 04:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAqE-00062n-Lg
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 04:58:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAqC-0008GO-He
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 04:58:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31f4a286ae1so672113f8f.3
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694077099; x=1694681899; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hREobUNlWVPYzdlt0N94XWuJ37kHY6R7TO/8WXMn0Os=;
 b=Gc2BDcsDWjw/yRR54WFV51we1xAGrFeCYp1b6BEA8mMXJe/c59ESKPIfipz1+g60Bh
 2Yz/myBRaiOFYTznGKQlYhSWEnIoh8FYWM7lMRNnxogcBuX9NwZetww9wYM2/LDC9s16
 ci17klth/wygSnYg8G/rSuJwTRO9KHeRJ5Rd+5ju2zPcTrpGiVUzL/QrTE8EoE2u3Ekt
 XQPT8h1QXZy8eo3Mfc9KBRcjd1QX5AujPyyEFl3eaGxcJ/8NQUa5Gr8lklDBMX8BJYw4
 GeKP0KKu1kT3GF+/ayYuuqr/Fk/WZNlJAU74g0ZVkOGDjAUDP05iSw4RLUoALaH/H2w3
 LNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077099; x=1694681899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hREobUNlWVPYzdlt0N94XWuJ37kHY6R7TO/8WXMn0Os=;
 b=Te3oSHhO0giFAvfX8SzY1X4kiGUUrJO8HY9NH05tBtNBVlKzNPnosMSEtcDQgWv/z2
 PsAo85DvabCdGaVsybq5cvBtXWiTcDOsktRGOk6drLyf5PJmqLj4aRvJH6LYUE/kZPvr
 gDnycSCKTx9sqcQ04JSoLUrFa2jBRyGTnqSyZLT7We/VWsnnYFjNmtr0C7l8MlPdsAvM
 BYH03hc+9SgJZCTiAufgZk9nHp5GuDiCkPnzGaV6NLfCMQHoITeppY6elTbCp+zCXwPm
 2fzvBN8IT65YMTB1W/rdNtO3xW56VP4id7N26vTyFcYYGINxPTzOpAkT8wVsKQOiJoOQ
 Vw8w==
X-Gm-Message-State: AOJu0YyA7YxHdH6wr9FHUIsnQokllRmQZeYjMXR4hrCa19h008+DR/al
 B+nnu4VH+QBMtE/cgc3aG+QU7A==
X-Received: by 2002:adf:fd0a:0:b0:317:650e:9030 with SMTP id
 e10-20020adffd0a000000b00317650e9030mr4496356wrr.57.1694077098822; 
 Thu, 07 Sep 2023 01:58:18 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b003143867d2ebsm22749786wrm.63.2023.09.07.01.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:58:18 -0700 (PDT)
Message-ID: <072f8179-01f7-5575-9a68-88a2bbffdc3d@linaro.org>
Date: Thu, 7 Sep 2023 10:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 24/32] machine: Constify
 MachineClass::valid_cpu_types[i]
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-25-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907003553.1636896-25-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 407z2HjUOM2M

On 7/9/23 02:35, Gavin Shan wrote:
> Constify MachineClass::valid_cpu_types[i], as suggested by Richard
> Henderson.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/m68k/q800.c      | 2 +-
>   include/hw/boards.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


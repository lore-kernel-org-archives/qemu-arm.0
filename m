Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3603495ejc;
        Thu, 16 Nov 2023 08:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEavuWdtnVcpAQT97RodQiMqcjhQ2WQTGNMXo6kW9riCHnUGilWyrJR09ApoQsdOOPJsS0L
X-Received: by 2002:a05:600c:35d2:b0:408:55f8:7de with SMTP id r18-20020a05600c35d200b0040855f807demr11611966wmq.28.1700151664319;
        Thu, 16 Nov 2023 08:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700151664; cv=none;
        d=google.com; s=arc-20160816;
        b=NFfxr1tffrxRs3IXV9pM2lOSgUsW11DZN9X8w/sT+sXr5tgj/cdrpzSvtnHtBidUkG
         vMd9c8DoTfsK+JiGQGbPI8/6+FuCossZZK33LuGq6dOwEj3X1sln4Ei5l1S+E3lo6jpR
         fhfSdksp0PnyFasWZ0DwXJHknZlTzfOYAPu6Ucdm/cFyZbi52Xqpn0nvkTkBUDUz/HS3
         aanyLiCKKfK/TwN0TkwRswTzbNMqIlrqrCZwYwUg8+DYH334ggCVCJ48DDH+D/AF0jIx
         3Tw5D1av+OkT6TKkmg9IxDBPA702qH2KCgxkDNm9O1jqy30pzaRaiUyc3kBA/ES3piad
         H/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zU0y/oNPBlXNKcCKBdzv6P0WXp12W1o/8xvu9k23CBM=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=uZcqn6lPKkcR+rbFLGj4eyShs3S70Ah1gKf/VeJj+ibeVaG92Cq1qn7x8zfBCr+UkW
         XV/VhJJgPk7tG79QI9LcZ1I75FOefG+tkpQn6mHefwGEE0l7NyiDj+QIc/95BpFh+ta9
         Me7hgRJHKWVXbrwsxflKeleCwjNYj63WBvLXKbP0Vt0Q6LlhMvghZOYEqfgmjUXlG9e7
         TsS7SnLMdifJWQWiv6bgNk42wyIXOEtZsbLvXd1u7cAGTcgoG1o+0zsb5z4Ev+cebQot
         sa4MN08bFTvuTBqMQ818gzFeyG6qIKjFrh12qT7ZTKuj1E2zifV17EnZ3C9VsTc24frs
         ZCoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yy1gmrnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05600c469000b00407774682e8si1531251wmo.13.2023.11.16.08.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 08:21:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yy1gmrnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3f6v-0006ob-PC; Thu, 16 Nov 2023 11:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3f6u-0006ns-Pj
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 11:20:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3f6s-0000rQ-Jk
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 11:20:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso723514f8f.2
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700151652; x=1700756452; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zU0y/oNPBlXNKcCKBdzv6P0WXp12W1o/8xvu9k23CBM=;
 b=Yy1gmrnTty4pzUgP3ZdAa1oMxBGi1bqVzDsHmJl5UFZ2Rok+U8jpv9Ett2KIB8HF7A
 L4i1MCOxY3j6PnqhQWVGcaIFoWU2e32C3NSLV/MaMVU/PV7DZKjjdyxQveC8upITwB67
 x+4HWz8/E29LyighsVyFbxQZj8EW0cY5dE9jbw/o9iN4vxVfQFloLVO1hWhx6wuNwc0X
 1Uqff6RwuzmfZZvfABVLEAoq36yFjugYsCC3Qx9f2YxgedNa65f6YNGSXGEwxs/hxvpR
 +cMeywP2QNHJpk/7uMNKEE8ct0PFSPMdc2tbvu1oZwQAzo1/0580kytjKbmyw0tDcQsI
 Mydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700151652; x=1700756452;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zU0y/oNPBlXNKcCKBdzv6P0WXp12W1o/8xvu9k23CBM=;
 b=a01NdzXyPaxQcT/kGYEeWTYip1jkNXpQqWlBc2ZDjQrr6bmNweG3C62C1i5q1+J2b6
 Zn2z/m9xApxN6Jy6uLHXPvmgU7CuPpJILepgyNbOtw5XKIadwXsdCEg5auz0bfe6SxMb
 O3jNIcL98Dfcss5TT95Dc930IuR+7+N0uecDdlv0ndqxMMJL2fPVwcEcIKL7R2lxouIE
 QZ0rA3uj0V24ucjNeA+ciyVoHTWDmtniqLjTkuYhgLyjlZO6IugK1s1GjKdJJaZdZYH5
 aB2Ss+rs5TrzFqVKTmV//SfbtoOhpb6mbNaqhhIhjLgbLKxfaInQH8/z7x+9EYNahiKz
 lhdg==
X-Gm-Message-State: AOJu0YzZtIeblbbfariH0kYkXoFZjF2vs53QdqiNlYMNinSu4oEZhg4K
 CW59C6qMYZ6Mt8YY2AoxyDQEcQ==
X-Received: by 2002:a05:6000:1845:b0:32f:7fb0:de13 with SMTP id
 c5-20020a056000184500b0032f7fb0de13mr12173865wri.5.1700151652383; 
 Thu, 16 Nov 2023 08:20:52 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adfe850000000b0032fb17c65desm14099905wrn.19.2023.11.16.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 08:20:51 -0800 (PST)
Message-ID: <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
Date: Thu, 16 Nov 2023 17:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
In-Reply-To: <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qOf7hjOJjyUE

On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
> Hi Gavin,
> 
> On 15/11/23 00:55, Gavin Shan wrote:
>> There are two places where the user specified CPU type is checked to see
>> if it's supported or allowed by the board: machine_run_board_init() and
>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>> series intends to move the check to machine_run_board_init() so that we
>> have unified CPU type check.
> 
> 
>> Gavin Shan (30):
>>    target/alpha: Remove 'ev67' CPU class
>>    target/hppa: Remove object_class_is_abstract()
>>    target: Remove 'oc == NULL' check
>>    cpu: Add helper cpu_model_from_type()
>>    cpu: Add generic cpu_list()
>>    target/alpha: Use generic cpu_list()
>>    target/arm: Use generic cpu_list()
>>    target/avr: Use generic cpu_list()
>>    target/cris: Use generic cpu_list()
>>    target/hexagon: Use generic cpu_list()
>>    target/hppa: Use generic cpu_list()
>>    target/loongarch: Use generic cpu_list()
>>    target/m68k: Use generic cpu_list()
>>    target/mips: Use generic cpu_list()
>>    target/openrisc: Use generic cpu_list()
>>    target/riscv: Use generic cpu_list()
>>    target/rx: Use generic cpu_list()
>>    target/sh4: Use generic cpu_list()
>>    target/tricore: Use generic cpu_list()
>>    target/xtensa: Use generic cpu_list()
>>    target: Use generic cpu_model_from_type()
>>    machine: Constify MachineClass::valid_cpu_types[i]
> 
> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
> repost them, please base them on my tree. I'll follow up with the
> branch link when I finish my testing and push it.

Here are these patches queued:

   https://github.com/philmd/qemu.git branches/cpus-next

I might queue more patches before the 9.0 merge window opens.

Regards,

Phil.

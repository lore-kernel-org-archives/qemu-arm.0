Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1315511ejb;
        Mon, 4 Sep 2023 05:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBk+VS70yeeGGP4fnnhb2Nz4Hh4uvVGz7QP/0+oWjaPsCG7vpet7H7swXyzdvBAfw/y/Uc
X-Received: by 2002:a05:6808:2018:b0:3a9:9bb6:7fe with SMTP id q24-20020a056808201800b003a99bb607femr11837372oiw.21.1693832038811;
        Mon, 04 Sep 2023 05:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693832038; cv=none;
        d=google.com; s=arc-20160816;
        b=pwa8TvDLYchyQsUMM1k9vaMhhBYYxBtnwLYzVEMSOps9UmlvhWMbeSlqjgCQQJKfxt
         5Ei3DuTl6UjB22HgrMXt/fz60I94ycYyEqkJkWd9MxIFWZxLF+wGlVuqgZwDDe9e/yFo
         COfL00/3yuE07sYBO7ftQWllkRjPadyp5PYCiB8KABAxN+SZhqHMScB6fgyu1W/LqZWa
         Yl69v1o0JLjyJ4AvD9hNi1va/0Q9qe6pcp6BmsVJL929ptRFGPVfBqWs/9dSxgMibzwh
         +c+7GL8US6t6XT1WYy/B9kh1j2ywfXAV/EJNGCsJ5/qMk3T4AYsSRuyQXCSOnmWBbeH0
         GAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mLLrOInlqhD57AKDsb6eUt0pbNKyEYyMysQZ94xnQK8=;
        fh=u/KEU0++mrGHjnNdb4Gahb/MDjUSg2Iq6R1ujSlIFW4=;
        b=BzZbBqJZXrVyEI5ZVM++TbOPN6X3EOUrHiN5YDh84mgHXnLBhAN2gXw47vhPznSsEF
         OvLxX3Kb5v4P/HOLAMXTSqovJ2V0F6k3xy+JlmD6umhiN2Fa7AmuZzHhwxzOw+ZGqEg5
         pW6WCtPlUHGAQY+B4pAVzBEAT9ou/l/LwtZ+U0XhfnH3Cv1k6jVsfwwD3EtMrNnzk2D5
         RER9X/yGDH+CkNEnbPgaBn7ctbYwqK/jowSJIVzfWJc2TR457CMESAS1tDXC7vUYcfT7
         a8dgXSHr+/u87aWBCTPu0zbxlBvYML0c4o5wdd7FWLqfPQMK8MTFGZz0Bl9TGb0APwAu
         x8+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nh11GYnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17-20020a05622a035100b004049e9da5b3si6459470qtw.104.2023.09.04.05.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 05:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nh11GYnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd958-0007fw-OW; Mon, 04 Sep 2023 08:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd94i-0007Ji-Vk
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 08:53:10 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd94Z-00085n-98
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 08:53:01 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso497668566b.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693831973; x=1694436773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLLrOInlqhD57AKDsb6eUt0pbNKyEYyMysQZ94xnQK8=;
 b=Nh11GYnH27/eV1W8sMVstjJSIK1chYcFEqkoNehYGhSL8tV3pTREC0UGRIkObLuDXJ
 TYnP2r2u85pcJyGs4K/ig7d4zxuqzd/iLrhxcRw+Dc6rLBLJ7XZYkgv+MDJb9BroB9rj
 weFcEFu86J91byGFULIrvYiEicaoT8QNWP3yZowNkaL1Rrt96cXp55TB356mJFk5pL6m
 T03lBaE53nD5gcCXAFGJ8t9hthnUkf5vLbQkEFd94bu22+E1hD9mMTwcLg0zrNwifWiw
 dlgFXUIOgT2+NAZrkxRVMb7RxaHNMT0IHS/RyAG+umTpbnMZ5S3PYXgHGiCuDHHYo2nb
 aXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693831973; x=1694436773;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mLLrOInlqhD57AKDsb6eUt0pbNKyEYyMysQZ94xnQK8=;
 b=VI6zQc7C4J73KtQZFmzbOpsVzTUY6rJ7OBBCfrbAa2Lz9KKxbbpVUjrZyWQWHIs+tX
 LgcOnmZAFXE4bVwpdXql4SHjVjKidUF37IRvZvPcKBU9CbN4FdnGKNh+UjuNayxvo0+4
 eQqnZGPxAOY8Rx1YGASd70ytbCA58Tp87stLs2yZx4dvOHZ87qoH7M6fm/o8X3whc9GF
 PVhEL5OBi7uIKw6TVWsnWNRIV1lIKNAn42xTpoO/gDrpqgvHpC2Z/GA8vR+Dn6MGFF1h
 +roGMRGeHBtHAW4huvJ877OU0vsVvAJrmLag5CqHnTpvfgdrbRm7f9GUpEE8ANfxRJRk
 GpvA==
X-Gm-Message-State: AOJu0Yz8E3WGhZMcGhkWoxCIViX2iURaX4O5JyPz82aQiTR0t/5fBB4m
 51umwKiD7GXLJbvi3EV0tX9l7YdATf6XZu+t0Aw=
X-Received: by 2002:a17:906:30d2:b0:992:2f67:cd34 with SMTP id
 b18-20020a17090630d200b009922f67cd34mr9888804ejb.22.1693831973385; 
 Mon, 04 Sep 2023 05:52:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a17090640d600b0099d0c0bb92bsm6129118ejk.80.2023.09.04.05.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 05:52:52 -0700 (PDT)
Message-ID: <f9e162d3-1a7b-a037-0a61-68c044914098@linaro.org>
Date: Mon, 4 Sep 2023 14:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 01/11] tcg: Clean up local variable shadowing
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-2-philmd@linaro.org>
 <91f8724b-1f1d-6121-afc8-cc6446bf9359@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <91f8724b-1f1d-6121-afc8-cc6446bf9359@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: R3xHf7qMIypU

On 1/9/23 02:38, Richard Henderson wrote:
> On 8/31/23 15:55, Philippe Mathieu-Daudé wrote:
>> -                    MemOp op = get_memop(oi);
>> +                    MemOp o = get_memop(oi);
> 
> mop would be a more descriptive replacement.

I went with that first, but then noticed 'MemOpIdx oi' and
renamed as 'o'. Anyway I'll change to 'mop', thanks!

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~


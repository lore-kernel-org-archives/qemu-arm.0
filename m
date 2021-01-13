Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp513479lfq;
        Wed, 13 Jan 2021 07:07:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzMHlh6fcGS5Q2x8OLBZShxyNVmpi1twXNnKlqk/l6dpzhH9k9/gm33Dn+frGLuCMrVtlZ
X-Received: by 2002:a0c:e7cb:: with SMTP id c11mr2706157qvo.19.1610550472641;
        Wed, 13 Jan 2021 07:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610550472; cv=none;
        d=google.com; s=arc-20160816;
        b=Bg+6QCT5odmbKCQ6fuDNHMCmPvT6brUxbAyAdzr9ZvkJVb4TtbONpwXDlYN16chQTD
         rcYmZI45VAEJIM3iqDtImQFtsBtXJ73kEuHSYsbZ9KISxyEdgpOZkMbTWo8lEimGOPlq
         b7AllNSBL/kd8CkYU8jeo30ZLTq8nvfTFHnrLMZTJ+maoILcQ3wvcLZ2J1OdEjg7cSEq
         QoYA7pTF9R++nAveDxipWKWsLljaL69GCh8wVJMBMEVjmcE4VQ2RXC206eUg8crInx3Y
         Nu7mYCWpS9xbmcT10knX9Bp2YAAkqG2z+ZrI+PXu+f/Pj+T5EQGan3krxAW9FbxrG19H
         UMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JU0rEPktICofuJE6bNsBeUhhODIrPOx5iYAwhAA+TxA=;
        b=an/kuuX0AvCHD0wt3YnX5AbFMdZ8ykGlTiykqj4Q5iFSbWmM12X+BWjikM2PlzTJ+O
         +vBusGZfR7OPIwqA7CttLpDObj3pegasL9cNm+1FZzvxKU7vrkCdSe/bh12Xv0MEd6bi
         tKCcMXZ8kV6WG8aM+WJtoEKMiUbh+zJpEE5mc7TrdZlD3pfkifnTzCeiETQxXfKpkaWb
         PXqoTulBfURtcwl1JByWbFrtdYk9cakK2XoSt2W+18n98f1+P0PlIqt5AGJiOzH05CBF
         /8HmesVuURoPR8D0mdEt9S0Jxso56RU5YkQT1waVUi8ojP4Kj8m4+FPOMKV7aNi8D0rb
         IHyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="O/U7LFZy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i140si2756610ybg.20.2021.01.13.07.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 07:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="O/U7LFZy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzhkV-00016B-Vd
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 10:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzhkC-0000vj-OG; Wed, 13 Jan 2021 10:07:33 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzhk9-0005I8-US; Wed, 13 Jan 2021 10:07:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id h17so1707945wmq.1;
 Wed, 13 Jan 2021 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JU0rEPktICofuJE6bNsBeUhhODIrPOx5iYAwhAA+TxA=;
 b=O/U7LFZyilzoQW4LIG4QWlrsUeChNs7uMCt67VW7rC88mfEE1aGGWSUucUzPBsEBqc
 QeQlirP7pVprIvpJZVSqt6St7L1bo3r54j9GfxX/hPjYrSKl7e2oJASgzWTZnnTYimt4
 yiTvmnvjiOzFk2Bo69e2dVltdN9eVBOqEYSmRKzdb8yTuF2HUbGvPuL2qsw/5vzqSJUm
 56BBSeLEW3jogwiX0eIZ38DrNcR/LLIO/DBW9AJFqcDsCn8l4YuI8grg2KDug/OqaT15
 oGB+FMoFTs2BqvBoHpDQg40UD1b7P761FlwnegHA/M9oSVYgatm/1wK0T48AIoxtVhso
 1Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JU0rEPktICofuJE6bNsBeUhhODIrPOx5iYAwhAA+TxA=;
 b=IIwBcNfOlCJgyp7xYpIioya8VkpyBup6I+NVw5uI+FR7SZDqDHOM+kaisLMUlkMFsm
 +7kgksez4FarPf1/eplXXg2ORNOOWXebx2wPQ5R6J0ruEXDyQa0j05v5VtMSkzYJv5d0
 GXwyS4IL9qT0+t5YOt9ElbZ0dyO/LfxXiNYUuTFwtGsvLqfKzWlGLIEYX8tq9dlX5FYs
 80MQjng+M5q3Yed/wc1HzYpA++d0DWwa2QoIgUleK/Xvy10rYSdG3gAV8bhpPeM71G1O
 yuJijNYLk0fSlyjqg3NUSil1QlfMAKgOmUkZ8RSNgk5sainF5Xl3K4oqKulsZ0F3Hg4B
 1RsA==
X-Gm-Message-State: AOAM531CRAY+5RFjwgbVrCxvYgWdB4OjBS2ej0VF2YjIFadvLb0stWIv
 M2jrFux0l8ig15/ZAZ+On+0=
X-Received: by 2002:a05:600c:2292:: with SMTP id
 18mr2652046wmf.181.1610550446101; 
 Wed, 13 Jan 2021 07:07:26 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u26sm3244203wmm.24.2021.01.13.07.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 07:07:25 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e157e0ab-1d96-040c-5329-8ebb8064c7c2@amsat.org>
Date: Wed, 13 Jan 2021 16:07:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hRYoy5s1YnP6

On 1/11/21 6:22 PM, Richard Henderson wrote:
> On 1/11/21 5:01 AM, Philippe Mathieu-Daudé wrote:
>> Attempt to fix the warning reported by Miroslav using GCC 10:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html
>>
>> Philippe Mathieu-Daudé (5):
>>   tcg/arm: Hoist common argument loads in tcg_out_op()
>>   tcg/ppc: Hoist common argument loads in tcg_out_op()
>>   tcg/s390: Hoist common argument loads in tcg_out_op()
>>   tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
>>   tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements
> 
> I've been trying to figure out a cleaner way to handle these, but this is
> certainly ok for now, and avoids the Werror.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Will queue to tcg-next.

Please hold on, Miroslav found a regression in the PPC patch.

Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4416307ejy;
        Thu, 6 Jul 2023 09:39:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEJ/L+DgkCQEuqsvIbR161TY2YBOCZPzjdvk/l1LZBWIE4JyDR8uxxRUvF8s1Wvd5dmgpUp
X-Received: by 2002:a05:620a:b5a:b0:767:9a35:73c7 with SMTP id x26-20020a05620a0b5a00b007679a3573c7mr2111729qkg.42.1688661543746;
        Thu, 06 Jul 2023 09:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688661543; cv=none;
        d=google.com; s=arc-20160816;
        b=kR0K86sUvSDDY1uZkpkGZXd2dEjDsgYB4YAMKBFij42p1CIiR5tanrgTlpohW1nn31
         W2lK4lNdD9B8222f/LdA00CLU5YPqWlvJGR76a5qznjISjjZLPmnttuB/X8TNoOT1pXm
         fhAtNUTSKCGB1Yoi4sIZ4rlvhs3ozEmA4gn/uz6X+j8WlIf2ulwYolg6+jD2J1Bh/GQv
         dyUGjuJYv0L6ZXwgBUUsxB1PcCupLx6IlgSxR4UJ0wkxymw/mfOo1FbeOLn4Ycvx4K7k
         Dk9YSBsPp2DMZSHEn1K0jgHzFn+FWxL6ceCG6bOdfAJTYyZziPYnM9l1RE/ez+8TclBJ
         w6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=U7xXdNB40/K680n7T99wTqBVhWHJISv/bcehHzHAZWk=;
        fh=L9y2vbKDaAMkKgIwN8z2eaYz1xR9lKBR6/GAbMEXzo4=;
        b=NYFJnToU2+J+QcqNinTQmg+7Nzu1pgQIgayYEQPMToWDzq678+uUV67kwd1JDT6F9M
         E4UrLf1ulXh6dZ3onhr9eeVruL/ZagKJdThNDpPYvUorw22Cv+xg96TDSjy4fQrgbOWQ
         MUKH9ctkIYP99BmiqPE2hsloW78OWvw0Lci91HuQaxm3oyAD03bKHJdElXVZ/aEG2yT2
         +GI5Tj971yZLKKIgGFiWjBCC9qSmsGSOy49l4AXaVbDVm2YmoTf3BV++kc8RZV8AM05Z
         0qq3ZH+ZiphTtNiFJq/E27jIPlC7xUiZO0kw3GHHVyVW1nN4IfJa3qsOmbxOUSjnv3zP
         Z0Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJrEQT29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi34-20020a05620a37a200b0075cc804eea5si1267852qkn.678.2023.07.06.09.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 09:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJrEQT29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHS0R-0006EK-Bc; Thu, 06 Jul 2023 12:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qHS0Q-0006EB-CW
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:38:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qHS0O-0000eO-UV
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:38:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbfa811667so786095e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688661535; x=1691253535;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=U7xXdNB40/K680n7T99wTqBVhWHJISv/bcehHzHAZWk=;
 b=zJrEQT29k+IfpqzwOVClBSREw7cHQTm+SG1AT2XGOdZLmnma1n2W8bXx27EjPjB9B8
 yxOWQ03CGJy//H5aK8oy9xmF30LMBFx3n63V59etXeB+dzMH5F2TWzNp5mt2O8w29Seg
 JgQLuDM+vyIc57c9CmKlzeRegxNi9OOYs1P3j2oQyif/z/DMHvrASwwqyPIbizF9vG1b
 HJHpXr30T07MwAe+a8VJM2AuWpkQ8GGOSdVi4W4DdKVyaXgHBJlC5IgoybGdbfFp0E7o
 nI3NLrtXKY6BuaEjCEor/yEnU5YBBs3ZFAyNEkKz2Ml0CQ3E7908rSQFnfWTy4Gg/CG4
 2rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688661535; x=1691253535;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U7xXdNB40/K680n7T99wTqBVhWHJISv/bcehHzHAZWk=;
 b=BQ1+r73YDYr/fbmBQ2nJ1zYO/pC+JHBPUqyBFD2KGNZdaAK6qENmT1IIQk72s/6SEQ
 4viHtLPR64naihzUhGQ20zeVU/7ZID0DBuHqxqwXMbyFfBl/pbKhgurfUQzGjt0dneiw
 ilYrMjZxkzlfy0bkSNYJnCEwiyv6BH2xoNcXBD+gIJ3ugPpUN59j2PIGz923PkRz7WCr
 AEdCO1Y8Ks3C4B6YeBTIgLuV4FttCHoBjrdSMB1ltJM8Lip+FxxFvVt4cCpjkDyzy/f8
 p+CDLF/AjB9h/CMkLqkNKeO6NvMcDlDMNQSTmGBk1VBVTJCbcFmg65ijtGzrfDVhZ8no
 bgUQ==
X-Gm-Message-State: ABy/qLYtx4ocdPjA4259HF0Lu44/jkHfinbgFNzjvJ9OFS+0GPjbzqH9
 ZQT5f+SGtE5IDjhQ5uKya1+C0Q==
X-Received: by 2002:adf:f30c:0:b0:314:1b87:b76d with SMTP id
 i12-20020adff30c000000b003141b87b76dmr2375499wro.30.1688661534855; 
 Thu, 06 Jul 2023 09:38:54 -0700 (PDT)
Received: from [192.168.200.206] (83.21.151.197.ipv4.supernova.orange.pl.
 [83.21.151.197]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d5608000000b003142c85fbcdsm2317816wrv.11.2023.07.06.09.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 09:38:54 -0700 (PDT)
Message-ID: <7128e56b-0f52-3ec3-f4f0-34a6f11de308@linaro.org>
Date: Thu, 6 Jul 2023 18:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] target/arm: Fix ptw parameters in S1_ptw_translate() for
 debug contexts
Content-Language: pl-PL, en-GB, en-HK
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230706140850.3007762-2-jean-philippe@linaro.org>
 <CAFEAcA8h-VXZkD0SBrjOYg-FFVk5AW0RrAs4AL4w6RXWZzWUsQ@mail.gmail.com>
 <20230706152543.GB2570588@myrica>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230706152543.GB2570588@myrica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: bWiNXM7XRKmb

W dniu 6.07.2023 o 17:25, Jean-Philippe Brucker pisze:

> (Note that there is an issue with TF-A missing ENABLE_FEAT_FGT for qemu at
> the moment, which prevents booting Linux with -cpu max. I'll send the fix
> to TF-A after this, but this reproducer should at least boot edk2.)

Which reminds me that qemu/qemu_sbsa targets are still out of sync in 
TF-A when it comes to enabled features ;(

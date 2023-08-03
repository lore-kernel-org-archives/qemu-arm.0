Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1093342ejb;
        Thu, 3 Aug 2023 07:42:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFSKRLJ9lnaq4UljFuRkXQv/HtUbNratZWBoR20ae49rNYlDQoyQl4uDOTnmKFEM7xCLp8y
X-Received: by 2002:a05:620a:288c:b0:767:ff8e:74ff with SMTP id j12-20020a05620a288c00b00767ff8e74ffmr22244157qkp.25.1691073775151;
        Thu, 03 Aug 2023 07:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691073775; cv=none;
        d=google.com; s=arc-20160816;
        b=idJ3+WftTn//Cwry9I96sZMUNRI3X7URZhE8BmCIn+QACllXZwZn6TG3yq/JxhDdUo
         LAM2GnX61SSt6fQyAmvFslkHVwQiH6HovPGtm/9O3uWVMDY3NjuJEkcLW6GPFM4Pp9fg
         53TkKORrlgrX5B6gZygdY3/H2EH23ok+Pr0mzajhUlqE+Gc/y5bU8McrzmbQ56clQKN8
         JPqBm+yr8R5SNZlXcmZxUraoSbRB3QXQNdInXhSuU4krXNZGH1W91e2nw9h40q9HkVmY
         x4OIwW+kPuCULBN5JPLMt6U/JuIkCXymSJephOMjOU5LuE0cYExD/4ow60HjQ0qRa2wJ
         14yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PyBTREPnb9v79YmmSsZjS8fc4YuiIoSGwE9easkBt2g=;
        fh=GhRAajmaXIVQSCYRsWh6JKKj25My/ZfgM6mKi1yjbAE=;
        b=qHdPY11p2Bu9pYWu/lIgy9K1+6ez9thY+36QXSzmSOoPDvQByV0pbQOf9VBbaBLsTF
         ZTm+IahHPMzmDUAyOUDxfH3WP7IXFx/NntH0u/N6qpyrJua5NWrBRYIEoqjvC0gdSiSt
         BkrsQJtVkJz40QaavDfVPtpGG+zF5GufxpGLPEifyG266nMIz4rHymOoBE3F3Dd18R7p
         JCSUqxHCwSswetwDC69H4PUAPGC+UGabwXHQcFKAVQt1DyjBLyUCBHYPTjA6wYJGi9X4
         xCBq7vqfLdwM57GeHTH84r1SwrnldbFKTbtKkEdzdsWEtWDu/TvzJIyD5UI+Hb4uBQvO
         sn8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bXVHXkwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05620a450d00b0076ccd9d5ec3si2794234qkp.391.2023.08.03.07.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 07:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bXVHXkwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRZX4-0000Ar-DP; Thu, 03 Aug 2023 10:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRZX0-00009W-CZ
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 10:42:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRZWy-00060Y-Sb
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 10:42:26 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68730bafa6bso1484918b3a.1
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691073743; x=1691678543;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PyBTREPnb9v79YmmSsZjS8fc4YuiIoSGwE9easkBt2g=;
 b=bXVHXkwODt+41kklBPa79YU2CI6quXdoQefu5onRZFfv40qdjViFiCo5NbzAHgMFgv
 NadXO9M1nxATN7N2vnTAlfgqDlfDh55md5dPZrQ6mrDUDfczZLY2728O+HT3Wol6Kwyo
 ALiTXGRYGInfrRy7pYUGuTTA3pz3DPHjdzvBiSX3PYMxsw+c7FYQupZG0LxRepQtJiDb
 BFJWs1rADg2jPVDoUTvFCIyUpprJmsEVwWkRBjBBqyvj9u7RxJLVyaYDX/FnLXSpzNua
 p/nYk6OgLYuUKN8PrYGhh+g/nikYxFRyqZSrrlejJRfEPH5So1+wmBSEhuJ9Utfr44Dl
 Hopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691073743; x=1691678543;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PyBTREPnb9v79YmmSsZjS8fc4YuiIoSGwE9easkBt2g=;
 b=DssA9Zb+DeOsLUCe7pF5uJKNm831jjVQbgJ1jpXZAR1x+d+W5Nls6/3xpkJnHX93ky
 fC4jj2gMAxtJwDpIGIGFEVsTghj0xmq1LY6MMw9GPJIX/X6zVEF6jaOz6430CPzjvoLa
 YPcu39gfnK7Pq6+mIiRlUk4VUG79Qa99NngRhm1Y88C2PhtOpcmCIBOuIkFqFdkjyoWb
 EAY5d2Y3xJOKI+euE2zzLp9AweYHvm9/iamqGolO4KTD+IrR88fWp7VXhTn3bXE5Bf/p
 veKSxiG7ZEZhHHFJbLbXyn0gGtsru74badpQIHuqGPARNshshPr9Cnb7YTVef5oTox4K
 VicA==
X-Gm-Message-State: ABy/qLade762XDw93AiBpwUE59zwSydg6LxxPWBwHlUdSCTh3ZxyFePh
 M8JylukJLXsQrcl4bW/SDqY1Dg==
X-Received: by 2002:a05:6a20:748b:b0:13e:2080:ab91 with SMTP id
 p11-20020a056a20748b00b0013e2080ab91mr12497166pzd.28.1691073742717; 
 Thu, 03 Aug 2023 07:42:22 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.144.105])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a62e518000000b00682868714fdsm4788403pff.95.2023.08.03.07.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 07:42:22 -0700 (PDT)
Message-ID: <97884811-7b78-286e-fcec-248430a877b1@linaro.org>
Date: Thu, 3 Aug 2023 07:42:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/arm: Do not use gen_mte_checkN in trans_STGP
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230727162621.445400-1-richard.henderson@linaro.org>
 <CAFEAcA_wYBSiBRy6HQaRh7k=UFrnQ=EwSQQ2e=7PJUzfyVp-ng@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_wYBSiBRy6HQaRh7k=UFrnQ=EwSQQ2e=7PJUzfyVp-ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: V5cSiYKgt9xz

On 8/3/23 06:10, Peter Maydell wrote:
> On Thu, 27 Jul 2023 at 17:33, Richard Henderson
>> -    mop = MO_128;
>> -    if (s->align_mem) {
>> -        mop |= MO_ALIGN_8;
>> -    }
>> -    mop = finalize_memop_pair(s, mop);
>> +    mop = MO_128 | MO_ALIGN | MO_ATOM_IFALIGN_PAIR;
> 
> So here we're implicitly assuming TAG_GRANULE is 16 and
> then relying on the codegen for a MO_128 | MO_ALIGN
> operation to give us the alignment fault if the guest
> address isn't aligned to the tag granule, right ?

Yes.

> 
> Previously we also put s->be_data into the MemOp
> (via finalize_memop_pair() calling finalize_memop_atom()).
> Don't we still need to do that ?

Whoops, yes.


r~

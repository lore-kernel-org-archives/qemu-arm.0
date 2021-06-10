Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp513600lfa;
        Thu, 10 Jun 2021 06:44:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaY0jD9aSCc9mITK9kn/4WMIc/VuofOYneJdsChIHAnNgue63dD9qgi9dqht016cpAFu2S
X-Received: by 2002:a1f:9106:: with SMTP id t6mr4054006vkd.19.1623332697425;
        Thu, 10 Jun 2021 06:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623332697; cv=none;
        d=google.com; s=arc-20160816;
        b=0gURY9md57dGiN2Et+cNKqP737fyk9GCbAMpK6/d/vUCEnLwzqu7uWaYaNX3L16/Ru
         KsBkKxAw/tpj67BmPLtRBMyx6fpWqSoHmUAFX+D86j0/nb6AhW+C/pbT7jYGzCGokJl2
         4cftgLmkOAudSZM7aXA2svaiq9kWB/GMNCc6NMWkKcjAlOSKaLSMmlOV9yqPmNwIfznf
         Wd8eElZrfaOpDvWfRbkjNhZ7rUHASwIVwCFTgczp6TMhscQv1DfAZM+/HcgLJB3Q0/JI
         0sVQOkQAEwg5eFjljtAJihlJzyK9DkTFtUsDi3/uapnpa4kFbWSevrm1Z0PjinoJcP8z
         ID6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sCg9rMWLXZ1Ei36TMIqeQc39+BJ6ZEsIzi1a1Lnf+BM=;
        b=FBqjQxOT/itcIv+BeNPucUFoj1sLFzM3t/twl5VYw3n0D7o69oXUYpylECGHx1riYq
         xmrr+p1MH44iou342piIDoJ7mGfnJnMkJdK5B+PJyb6IZcptLoxmZcA0nq9fx21ivbk3
         Y3HYlQqrvjPH7iGX0m7QRCEOcUGyTkWDWI36nbWpBkAHacS+VQESc80mY7yGSxtiy0+h
         FlYj6hXXivPjhqSENkA0ggTiEkSXx96Uu223Dxefizh2ELsMI0YQezP9Tg2v4x2MkHD7
         oKVa7Z9g+wh1VMPvOfj6dgBObl+Ub/+Q9Sd8EuffT6RrAJB49wezTMkemwTpp/u4LEXb
         VdWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IpS+an23;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si1375754uaw.242.2021.06.10.06.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 06:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IpS+an23;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrKzQ-00051r-NU
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 09:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrKuG-0002yG-NW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:39:42 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrKuE-0007tF-5G
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:39:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso3839514pjb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sCg9rMWLXZ1Ei36TMIqeQc39+BJ6ZEsIzi1a1Lnf+BM=;
 b=IpS+an23YEDk3YgkdHCxeZ+0bZEl1uwRmCWRuPznJsM7Wj9sOhoOl+u7OgEIhsQcxu
 cFaQD7Rb53kprPlUYkjfLuWsHlj3JjR0Z3DO5aR7U1eZnigXmWHnJLqx2LgeyJltSlwU
 yDSbRkoKqTNVuJff9z+XBgFIsSz5wgFemuPnKrWysu73lSYMhmFpwCg5YDCcYjwdpf8d
 hl7cvXPK1x44hWldQ9/xnJp20/OJuBmzGe+pORM7B1DK5LidCUx5J0beiG3D1toTc1WH
 /RBhev9Li+ZzbNuo5JTbuZZ4/13IVQuh07Re2vEoZ6lh7hdwDEUUeiJM2zWFqhWeuc6b
 +FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sCg9rMWLXZ1Ei36TMIqeQc39+BJ6ZEsIzi1a1Lnf+BM=;
 b=UB0GrvszcDQ3i50Y7hcff1PTMA+GcD4M2icG0vLO7EOo2P5CNmzgA4ffVb60UxyzdP
 Btk3rcwpylhHv96U2vZ3r+V3nO36VWxTxcDq4hPDvXeomLPD0paJ7QCq0P2tkCPwH1yY
 rjP3PzBgfeFUznV8AZaZz734bDWPd2Hd3MWCzIJg1WTs8oEkvwNbkJXOeTl+WTA3Bjls
 SoC5OrSO8YaeUIVLupUNcbboeVkuyqjJHRsIT1rGpJzqV1+KJpE9Qc+Q/BN0tqIhjb4q
 v98SdeX7Un0nBuBTM/t3zxuHosgnaoxCsCQGF4RyTLIe9B3P51JmKwXPSqc2jQJnB6DQ
 MwMQ==
X-Gm-Message-State: AOAM5337+RFOIYa3t/8531qkZIqguxRrnSWJByecclmxAfHkymiHafWN
 xRYOqOfBfdACIdPQoSSSeumDdGnlZjMWzg==
X-Received: by 2002:a17:90b:b03:: with SMTP id
 bf3mr2175072pjb.47.1623332372583; 
 Thu, 10 Jun 2021 06:39:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o8sm2558975pfp.48.2021.06.10.06.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 06:39:32 -0700 (PDT)
Subject: Re: [PATCH 04/55] target/arm: Add handling for PSR.ECI/ICI
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-5-peter.maydell@linaro.org>
 <d54b1117-b25a-ff6f-3166-87fd282b674c@linaro.org>
 <CAFEAcA_0P=3fE8arF3j90s1z8A-3TJGnmHjHLThxTALvqt3PXA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f0f0caa-aae4-efd4-0bdc-8076343e25b1@linaro.org>
Date: Thu, 10 Jun 2021 06:39:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0P=3fE8arF3j90s1z8A-3TJGnmHjHLThxTALvqt3PXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7mkdESeJfUAh

On 6/10/21 3:17 AM, Peter Maydell wrote:
> Can't use tcg_constant_i32() because store_cpu_field() wants to
> tcg_temp_free_i32() its argument.

Yes you can.  I thought I documented somewhere that constant is silently 
ignored by free.  Oh dear, now I see that I have conflicting docs -- will fix.

> In fact, looking again at the accel/tcg code, if we rewind to insn_start
> that will delete any code emitted by the breakpoint_check hook,
> anything emitted by plugin_gen_insn_start(), and anything emitted by
> gen_io_start() if this is a CF_LAST_IO insn. I think we want to keep
> all of those.

Hmm.  I guess BP_CPU does say DISAS_TOO_MANY for execute only one more insn, 
and the plugin stuff.  Good point.


r~

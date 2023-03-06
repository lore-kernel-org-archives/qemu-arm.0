Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4877820ejc;
        Mon, 6 Mar 2023 08:55:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+vbjcNODJvaAsv9mbdFWQFVO9xP/5T4AAHfEnn8T4EPpao98Abv2h4Nb0j/JiDh52DfoKC
X-Received: by 2002:a05:6214:1304:b0:584:8c13:3041 with SMTP id pn4-20020a056214130400b005848c133041mr12382045qvb.24.1678121729177;
        Mon, 06 Mar 2023 08:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678121729; cv=none;
        d=google.com; s=arc-20160816;
        b=prTsHBAe3CTAWiwLWhikrMZ6E8cqoamnjPyqn3rT6yEuLdnNxb3QO4RTvp1lEB6hDs
         18b5R+h6LmtLx9CfePpLVPe9gYB3T6g9I0bH10QN3rS2dTsQd/wcbuqi0ktrU5GR8IVA
         U3c9mDxwQZoxh9sA2Eu/84LkA4429aITmtIV3YWv4+2LXfKBCP/aN39SAMyvQsUOWMTs
         2edaWANN2voqIcUqtaIHFQIqKr8rr8tI1k3pViBtooFeooZM5udD2r81+C6OHyhHInZU
         C5HIuCbPYRnaDq6xNZpZMNz/Yw4AJtrFUHd6bTNZAUVaXwHgls0KROiX7LtnVJ8Dyfyx
         SbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JtDF3RU7jMzqIqV3K4q6YKDOYZ+qOIfKmkzQId52Pm8=;
        b=HlwSkyf1pJP3HGtaWd2d05Ohf19o8opK7H4L0mwbGj6ezqDxXFA7LjdrheShAUJfk6
         EzxEhp8bdzAPVNJyhxfasotxM/D51Fv+/PvR7vWnINTp7InZNThqORwS0042QlcbwX86
         afCfIejiZS1xOHFtP+5t2eF72nB2KVQKe8e8Ptxi0kh8sE2IXYY+6VUZx/tZbzi80y1I
         LMf7bHfzdGV6GkQGOyyeu6JHkPo7HVm/xdsbo+BuGtlWwRLFh+WS/EhvDqnNqTBK60as
         xyTTA8dg1EwlPAoh+rpdayxrRu3rEX52GpIbxo7L2CGlVgWLpEjy2nQA5bb4kfcflIdq
         zS2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uXodVpsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a0cf54f000000b0056c1810dc9bsi7316747qvm.331.2023.03.06.08.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 08:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uXodVpsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCpt-0000yT-B1; Mon, 06 Mar 2023 10:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCpa-0000lZ-RW
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:32:58 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCpX-0001ar-5X
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:32:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bx12so9222279wrb.11
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JtDF3RU7jMzqIqV3K4q6YKDOYZ+qOIfKmkzQId52Pm8=;
 b=uXodVpsO+p2fcqAdg7ZMl3CMU/gTKz2QtR31qMWFVe2R7MUkPMKLQQIHj41ri9BJqe
 RodkHXjGdECvSRSOaRM2UoaZmqQpOOKbzZqAFc6c9jJczLqM+diHC4L9QM2orv32nGlg
 jDI1SYCUMRpMrZgkCtl0KGbzbAxELY2aXHtbEqbu0JyZomn+7vcHxSKPu4DSoazzqZzL
 1UOnDUYriJH0D/WnPCOmKoup6CpdR2RHV19HE68aT3s0LYnCPPb7Z9rp9kxwQIQ+O0U9
 IZFAhw0KKqQb8AXixNxZtJOE2KEgLzKFbes5e2b5ebpk8z3XZMKZfTPx/ULzAGqQAreR
 +W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JtDF3RU7jMzqIqV3K4q6YKDOYZ+qOIfKmkzQId52Pm8=;
 b=o55Kz8Il+xQUTglCccGdEuCHm3gBHEus4EGwQ2oaTLaFnmOnlBKn8tF2yaE4uh/vof
 8C/mznT6NQA59vLbJimeie02201QJw4TsLJAFBVkHy0xVrqDfjxOIVN5bqhtp+kGjJtW
 eH6h28eLBszZ8a4QeFaDP+7TBAIsqp3yirdaxSxgn1NqLgAQT0nB65Li/0yO7/3nU862
 jdHn44NxajWsaDLa0bLL38kr9BTx08ZydohenlEfkSOnPB1ulQ4u6HJH/V1aHuSNKbah
 QdF41FonPXCUbcuoh1vD8deyp46J4zZLLkONhBdYRKChfaKaZxII+WKVAYbnU+JSbAVs
 B61Q==
X-Gm-Message-State: AO0yUKWENZbYwvRBcwSGD1XbnxEEjJx0IZLhWyn/WgvmUtr8QXuW3YcH
 h2PiTveDtRA84DpMTndhSKixRQ==
X-Received: by 2002:adf:e34c:0:b0:2ca:8995:38d with SMTP id
 n12-20020adfe34c000000b002ca8995038dmr8035183wrj.16.1678116764263; 
 Mon, 06 Mar 2023 07:32:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b002c705058773sm10617333wrp.74.2023.03.06.07.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:32:43 -0800 (PST)
Message-ID: <89a41cc8-16fd-38d7-caa4-aa0aff51696f@linaro.org>
Date: Mon, 6 Mar 2023 16:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 69/70] tcg: Drop tcg_const_*_vec
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-70-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-70-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: gqpOQwbk7UHf

On 27/2/23 06:42, Richard Henderson wrote:
> Replace with tcg_constant_vec*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h         |  4 ----
>   tcg/tcg-op-vec.c          | 34 ++--------------------------------
>   tcg/i386/tcg-target.c.inc |  9 ++++-----
>   3 files changed, 6 insertions(+), 41 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


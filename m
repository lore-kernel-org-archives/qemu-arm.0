Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4665813ejc;
        Mon, 6 Mar 2023 05:52:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/RfwJoxK9JBmoTQg5j6oIpdO6yvkXwiQjRvOk+iiYj2jEuCRaO+CGRFgoOjY+dFILKP0e/
X-Received: by 2002:ac8:7fd5:0:b0:3bf:b75a:d7a7 with SMTP id b21-20020ac87fd5000000b003bfb75ad7a7mr27197036qtk.7.1678110725672;
        Mon, 06 Mar 2023 05:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110725; cv=none;
        d=google.com; s=arc-20160816;
        b=RiLWzM/xBy6VEu1p0AZFlrmX53DYHaNfowNKiRcI8ldOkTQlqdODkQjr4FYtbyiYKU
         6hyXGPhbpvelp18Cmi3dg5BwmVsfn0r4QKcrftz6mMPXuOrJ+gP9OKdNAAqTpvJnYaR2
         1OamScJRio8rSTVl+kv7CqJoqVJP/iuUoaEZeiJVD6WgoYa4T3fp+v36GIRgs5iAlb6L
         +vnsGxXYgIcSBvJbJxKSI7RL1d3/9du3QpP80bfDsBJEvHhNo8RKUXrs6m+8bj6DuM4S
         oWjQU4i4wijkCJcD2cz+zgnuX2MV8omfyFMhn/PLkdQcpYjBy6opsaq8aMAP/kzQHhWn
         dkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tm5wyMoeZT7Hze5SiailHbhj+mbt27BZ3Y9F4zK+rHM=;
        b=ZgDY1VlreCHzWwhIJa7nTzp6HPdwidrc1Kws6e5f/u4Dft0eeNvkpYPsBc28G67yyO
         08pG5gLStyDPjXEXrD7Wnt7coGlVtya88x4btWXosaWmeYIPuh/n3NsD5kZovjLLEDHT
         yPl31pbtHWzF0Om2+9PEN0KMziBBzK5VWUO5SimsoVVChjUFGR//xDSJrrvPfP+e7RtO
         z9uV7zLpY1s4mXiIf1akJxXel8khHvU6BcHeuQAQk5MSSN/y4wh0PiEnAw/VyJyv07Iw
         vnsllHtusyvUEG+GuG/JJI43EJoev0CxF8Vg5DYjOkA/tvRoGpkvRyPgmOp2cryk/vPW
         WG7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1PvHo0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p191-20020a3742c8000000b007427117bca8si6877056qka.440.2023.03.06.05.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1PvHo0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBFm-0007Lv-TB; Mon, 06 Mar 2023 08:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBFj-0007It-Pk
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:51:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBFh-0004QK-HG
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:51:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so5232075wmq.2
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tm5wyMoeZT7Hze5SiailHbhj+mbt27BZ3Y9F4zK+rHM=;
 b=Y1PvHo0Zz6w5Ikug2W+0ELb1PASI0hvPmkfluvPBVtgPVC5z13kmB6Pt8rUGghjcZa
 0dat/pltSfJ34gJSooP+2gmNHyMOCNK28lL/9N7bCwVBk52Oylbzr1Wmi3kgvNOBAH1G
 qLGYNiLIQbCvgE2La0UDpQIqWgCGZhS/Wn2/JGLIFO9daK+yfNunzYkOn41l+DjcsM0u
 okq3PemyDDme3Kgwh7sEUuPXuhYhgBIgtsIRqH32Nne3TKY7xe9dFxLOrbFqyywdWHYC
 T87hb4cu5Eq9h7F4GsvmExklLfwOnwRU9aneZErniP6dESvlr7qm5AWmdxagtZ+3ttWU
 bqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tm5wyMoeZT7Hze5SiailHbhj+mbt27BZ3Y9F4zK+rHM=;
 b=ZlgoCCqLTgTTkbyiVso8EYkQSInL1PC9O+Gbb3bInRy40RzpLDsbJ4wrnGr5FGJ1P+
 LhVNBM2tclWHAUV2eDpt4RuBxrFQH5TBQ/LKsvb7diTMzkkb9C+Kfajb4Dvrzs09KIvy
 P/9nep9PCm7ObUGO4JnOP/PRXhIlPwgr4R8vUyIrSg74ZDDJJmlM1MYZQyImhCMpJE1e
 w65oEyj7Z9jk1AdLsKXX7lFYi0/Pjb0WZL1Hnj2SQR2tryk9pap+otub9+Bx83W1JDtM
 xnp6viCTbvyPEHEvY6vBBOXv5DFq6uSH/ViKv/dNAV3niFx3yS8C609GciUlakPrYcEj
 XviA==
X-Gm-Message-State: AO0yUKUL9CTK1GFhtj2VlzqZ9z184QJhYkRVyiYFqiidCPNmLJcMxbUX
 KLzMiRTmEK0P+0JChMReKRG2og==
X-Received: by 2002:a05:600c:3d8b:b0:3eb:578d:ded3 with SMTP id
 bi11-20020a05600c3d8b00b003eb578dded3mr9823514wmb.35.1678110703804; 
 Mon, 06 Mar 2023 05:51:43 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c47d500b003e11ad0750csm9882776wmo.47.2023.03.06.05.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:51:43 -0800 (PST)
Message-ID: <4d2f292b-85ce-3943-7fd8-efa9d87587f4@linaro.org>
Date: Mon, 6 Mar 2023 14:51:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 12/70] target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: 3T5sN5XZ4o6v

On 27/2/23 06:41, Richard Henderson wrote:
> The use of separate data/port variables is existing
> practice elsewhere, e.g. SBI, CBI.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/avr/translate.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


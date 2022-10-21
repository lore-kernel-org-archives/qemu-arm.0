Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp998257ejn;
        Fri, 21 Oct 2022 02:35:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4uTyEp4FPkj/xttFv6UAAnbutQk4/cDw1yPa6Y+Z+OO/ywvIgbBdNJu6jzNXc0LcI2GX7t
X-Received: by 2002:a05:6214:5181:b0:478:69bd:38c5 with SMTP id kl1-20020a056214518100b0047869bd38c5mr15074908qvb.59.1666344934431;
        Fri, 21 Oct 2022 02:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666344934; cv=none;
        d=google.com; s=arc-20160816;
        b=M9Cm1nXoiE9VveGmZ9nNZylWbnDyQxz4ZHki+YXlCQ6XbscdgpqT/5GZlif/1pSPUc
         wdvOf+LQbdL4HWOqseqsOfn4FH/xWrIgDfkRvXRlshV2kYpElmmYs2Tw21m3XshvMlXb
         EnWMAweez68kiQ+0SIwNNJ1l8IkXfCT8XYT1PQb9zLJJPq+KRmwRPtjFi2/uF0B8S5N6
         3bfHMEFx4ayGnduAsGE0Oi2W/hU/F4ZW7W7Q7yfILBc0Nj5b0NcYZ0sMi7iQZdaqiVNS
         Mkd6LNqsHUdpANzIU3Wzy11/esx2IlRgMkbVZxBIOQSDyRU7kBB5jZi6WO+Skb1f2VnH
         u6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bhkasDf+xRkJVcLAstxQYa8JpMtDeQpL/dvxlK2qwUI=;
        b=Xe0vQ7+fkt3R403chD4u/ZsODENAnyEMUcij0DKlrsYJ3WQugluGpjG26o0TDrgARv
         6PJjGo2hUqQ0o1swGV84kBPL7iYqMK0IbjFtzM7cxuFV7gDrPotSMqZwydLm/IDEd/J5
         YedlVwCdTRrFrBdJbxw8Pgp4xMlDIEIgauiMSCYI+lXH0Mqd9wMfjki/Pifq6MMFUkYA
         zJiDJBfXF1gN4xYMqJejidpu21bRU2TddAwj00i4K+u4BzqFp14HHUV6YMuES+WhNUub
         ebZcB5bQtokBmSiEmLUIuq+hyV5R5SyXDJ94aY7gk2d0WK5il9gyQtTDkTxdTvF7bXC7
         +MMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVS5C5+3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo4-20020ad45944000000b004b1d5bd71e6si12059815qvb.369.2022.10.21.02.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 02:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AVS5C5+3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oloR9-0005Du-Ip
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:35:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oloBd-0007id-KS
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oloBO-0007SY-6A
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:19:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oloBJ-00040B-K2
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:19:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id n12so3811393wrp.10
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhkasDf+xRkJVcLAstxQYa8JpMtDeQpL/dvxlK2qwUI=;
 b=AVS5C5+3hQsYo9JwqYAX2XE1RDhh9jkZkTjpFZ5UfGwV5Iu2+AP2qAJoB+mCyT9zEB
 7p2J/F8aPWs/j7KoDggaDRwhUYuB6zCfbo9vNZGETMkZP4PTEeFZt7bvyEleIz6evy3o
 FqhYRb/IXiIe95SdKPvf/a2Ggv03KOEK2KZU4alUyWlT4x8kq2kQqM+u474pXvNDLMyo
 SFQyIayPhpvVSTo9gSxu27YhyzocFTxqwM99b6lTYkVd4Cokg1iht8eDa4LBegyfZDl3
 eC/M4GyDd0MZsnYxDXfVxAUxI9YCS4y9syreVQxFJeNmdLSL3c7rmUuteVpkVCTg+DAS
 8CCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhkasDf+xRkJVcLAstxQYa8JpMtDeQpL/dvxlK2qwUI=;
 b=RM+ac2f8mo2/Dj/yhWqpSGVby3fix7F5XmrgnNta4yTF5HBgR9qzQJXdagr8px846V
 pcn3L/W6v7HpwP6AphuXKzH1QeFvATe/0ojgt0QZx/uH/3TGz1buYmmvStj1P13KRu27
 TQXIPnzvzddgePCv1b4C80f77ySDjDAV/XiCCNdnV7FZUUCEDCTwXOk9MQTzQrHYjZG7
 YezAv0IX5pZBneCfyf45uxkKe4+iiE6sUP/4ob3WsHCF9YpXWfuEg9POh76f6suxqV5+
 SDk9tcfX5Wn7n+fK6m0ZyWP3rYCdTQOVvf6DEC/BT6nwcqrT8Hv+JYcOtnihogSvLpjO
 T7mA==
X-Gm-Message-State: ACrzQf3YfeY9BlEZrE4B1aebx2NteYVE4DaxkiNxkCak9dMkyhjbg9a4
 mykSqPbpbs+d7jcRYaYM+EpugQ==
X-Received: by 2002:a5d:64ab:0:b0:231:44c1:32b0 with SMTP id
 m11-20020a5d64ab000000b0023144c132b0mr11599593wrp.255.1666343944815; 
 Fri, 21 Oct 2022 02:19:04 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b003c452678025sm2384526wmo.4.2022.10.21.02.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:19:03 -0700 (PDT)
Message-ID: <a5177035-344e-72bf-4267-d7b753cfb2fb@linaro.org>
Date: Fri, 21 Oct 2022 11:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 01/14] target/arm: Introduce regime_is_stage2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020223548.2310496-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kSAEKprp6E0Q

On 21/10/22 00:35, Richard Henderson wrote:
> Reduce the amount of typing required for this check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  5 +++++
>   target/arm/helper.c    | 14 +++++---------
>   target/arm/ptw.c       | 14 ++++++--------
>   3 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


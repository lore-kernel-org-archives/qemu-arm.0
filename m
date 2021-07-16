Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1687004lfc;
        Fri, 16 Jul 2021 15:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcxmtNeXntEI3Kj+wVuwKMv5FnTUSuByu+RyrJ97oeo+pzJYB44wOiV2ji1qViuLALUhxN
X-Received: by 2002:adf:b605:: with SMTP id f5mr14994507wre.419.1626473031591;
        Fri, 16 Jul 2021 15:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626473031; cv=none;
        d=google.com; s=arc-20160816;
        b=mwIEBB3xE8YIU6iie3ip2xMpQLNmmfpvT7DaBroGHxeHDdMpGZWoXO2x3jxtKlduGo
         A2RlLWNq++oPjm5SAbxitDSqZD6mc95cyjFm7DuYa7OGdqu/JR7aivY3J9iCIsEoeqd8
         HZwv+KQRD5PdTG9danL9pG1V+qNRVX3bUTEoiuQhYFiTQACrVWATiLYspHnaeQ8/Miun
         px6rhCbpjeBzEpUtYRKuZftGXtRBVVxAm0maVHcV5Yi4ZWOTeoO7PQ4HullvwMyJBxGc
         dKGlL5cRNj7XWB2ku9SYGPQxXRZlTwaIy3KEzrmToLv8rDKD9Qdo3089WjmIuVsuBXP3
         nWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=75CbBi3qKSMlzhLFkGPBCnP9v234XTeCUQKVcLwl/Qg=;
        b=pEKaLQAsMpGx4pWIQak0lseVb4aHJ2sQ1RoJnuDzXgYqEk8R+TOFE0/fTXAIP5rsNK
         rc21nXjjBzs8MljCE5YZpUmmR0EenUpwMQeh6YLeSCEegL4YoW4E9kuo7ZzEfVTn8Fbi
         zSnBbXyQ3Rs82R7RG+kcgTnhwwuXKglSqLqMIrMr8FZUXO7//OySoWMJOBX7SOOkh20L
         vHxdDRMPeLaiDGNc0yXPbMnHnkHmz91ixL0Bo3t4jQ+jP3l8p8zpymf0+1EYMuHptk8F
         1hjV6Vf3BbrAQnPm2YpahcINLJbfoDOkB+a9+1WOrcoWvXE61Gg9Z0ydwGKkou6bGc4l
         GljA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PUckA+8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si13458757wrr.35.2021.07.16.15.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 15:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PUckA+8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4Vvy-00023h-NR
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 18:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vvm-00023W-Qx
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 18:03:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vvl-0005z1-Au
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 18:03:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso8280476pjt.0
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=75CbBi3qKSMlzhLFkGPBCnP9v234XTeCUQKVcLwl/Qg=;
 b=PUckA+8JJS/1n/yRLKf9vm+WhSOPORALQR1f/YnZbCbX1pZy4tUv5KFvBlnfneKzwz
 OY+IrJn5/g03W9Qp1OZiYm5NZ2sbPwZLB0Txdp9dWXmH0jwa/me0PY6AZS1Ui6AYKbT3
 u1QiR/GBvnilx5EeSmqxIudiHWFvaNjHjNH8r4CKVDEPi/DsGKkPkZh5duTkJ3M9Slt8
 4JXDbhEZXm+wq/b61OVR52b2FPPFz8MX9S0RVQxntg+vhxSKRQ9AjPPkTaHZ7ma4dkb/
 3i2iqLo6+EKxxd73M8hyobMrOblnJMrUTjnTaAr78jSOtSe7PaP329mtmAEVtRknn8hH
 0pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=75CbBi3qKSMlzhLFkGPBCnP9v234XTeCUQKVcLwl/Qg=;
 b=VB1bYI7bCCdPvXxKqlBjPET+gWeVT4T5SZp/V2GU0pqG8CMHknNklMW/TlcSpi2Am9
 D3EQqFppOoZ0RHlQEU3TZwwSmAtDGBekjrG6q0mP/4x8Lh+9BQSlj2Tl53vt9shrVY/E
 8umRjug1MqknIGy7c0zYYU5rRGhWiqijM9YIEqDdLebjZFZY0LWvFHgki2DTfUtXwrmZ
 4fl3UHUW0mQh3ZRh6BT2GatsGktXWEsZTe+qJXeV7xO/QZVtXu9tK3oxY76e65dWnOvJ
 v2X20Ud0mczScwZZdahveYGt+MygSOlvaMug0mhRnKDAr7JMeZY//wNs3ZcK73CUxIKe
 ju2g==
X-Gm-Message-State: AOAM530eK3VT1asBpMSQLCvuhDEqK/aiJHNvI/fgae4m6YoGC4uM8Mff
 ZfwAGdZS9w3YiWjzyI5e9zYN/g==
X-Received: by 2002:a17:902:da89:b029:12a:d3d7:a8ab with SMTP id
 j9-20020a170902da89b029012ad3d7a8abmr9344198plx.78.1626473015756; 
 Fri, 16 Jul 2021 15:03:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c7sm11709678pgq.22.2021.07.16.15.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 15:03:35 -0700 (PDT)
Subject: Re: [PATCH for-6.2 16/34] target/arm: Implement MVE VPSEL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccadb40b-633d-a9a0-cb60-6e819094b0a4@linaro.org>
Date: Fri, 16 Jul 2021 15:03:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KBZzFyoPba4d

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE VPSEL insn, which sets each byte of the destination
> vector Qd to the byte from either Qn or Qm depending on the value of
> the corresponding bit in VPR.P0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  2 ++
>   target/arm/mve.decode      |  7 +++++--
>   target/arm/mve_helper.c    | 19 +++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 28 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

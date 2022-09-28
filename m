Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp453135ocs;
        Wed, 28 Sep 2022 10:26:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KpXVgfK31Zp59fCQe8PJQmEoxQEDXuXyq354HtpHBLBvnz8oLcCGOmpgcP0I2+LKE6JeQ
X-Received: by 2002:a05:6214:dcf:b0:4af:a1e8:51c1 with SMTP id 15-20020a0562140dcf00b004afa1e851c1mr1175455qvt.36.1664385980727;
        Wed, 28 Sep 2022 10:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664385980; cv=none;
        d=google.com; s=arc-20160816;
        b=mwH4ieUhKjdeYdEad+WoFR9dADenGxesaM/tmV1JVJdsSpvhKUFNw7vy8HZcz86nqI
         msV23h2MIL/PLzyg+x7AKrjhb6i8eiblma+g07VmyP0rWWJXipg2x/zS9EwhysgjDqSw
         0ZCPbEXSWlm+PchKWnfwi76TSWEObzlCOEtlBUdP6CauHTwYjAfhgycqeZj0MJyuMZk+
         rbLLnWX1eRbgFCZYhwUP/HH3m3Cc3h552/o0W2u3+umZebTEHAPPwOp2jrF114+fA1Q0
         r5oGzXzC0tYXXuBhAfetaIxBSn7XzvjwhWQPdyV3nYQjQ2hdHwtZScm9T+ioLnHaOsqA
         kqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oKNZNoOq+eipuHj18XgaM0oVQ3+KHtf+JUXq7MW5nF0=;
        b=tGrBimSvcDcJFmG9MbInn/qj06LAvPkCtfWsxvmomTSTXN/BJblZNAWeawgfgAfAgj
         lfQp4nScYNUCOatpXN43ZL1wqyJ3EwBhp4+POe7eMatjGmAc1Qnad35Hkng4kvV6wMIU
         0FK2fR4sMcFqNyUE8J73F184rb0YEUmDrlKeUCTpoa01Eey658JbIoEZBTT60GemTFrw
         +srflTuEs3SEer8IeHB3UfgeqzMa6/wcpA0xiBtQM36Qi13Pb3ddzFSaZH2f107P8r+a
         kKFFcrGqy4/qoWuuB/Cd4SplJjSnRTSZh/GDliHlxIoSxnF1ctAPCs0U11HxLeeCHBJY
         1sMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sGQl0fh/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a056214212a00b004ad7b54e002si3436957qvc.102.2022.09.28.10.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 10:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sGQl0fh/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odapA-00083b-AM
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 13:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odakV-0005AJ-Gn
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:21:35 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odakT-0007zz-7W
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 13:21:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3201326pjq.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=oKNZNoOq+eipuHj18XgaM0oVQ3+KHtf+JUXq7MW5nF0=;
 b=sGQl0fh/5gzlRpi+L2jjN+krDU3ktAwu/QcWpBnw2rUhsZJ2sHxypm2q7UjzG0Myy1
 YN+3FZUpTwKETjREj5d8RVVw8NdB0Dsm0gFx9h8MkaL7q7Xn+I8dWx7rajD3u7f5wEFd
 v9YgaCrEthVKl4/yNXFke9VqJwKB9q3/KPoKjKnBhL4IZn9vzFj59SV7Y9IyA48y1URM
 fUYI+bZ+TocHBC8EkBcdR/cRkGOGZIuhI+v+quN8HZT59ZoMlpvq1/WiBnLPpBJ29Vq2
 XXs2DOMfCka0j1gbISBmJPbARaMBRHkJXyJzAZnAJQpiR8HPlKa5YoV7OeGHehVF4U5w
 MnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oKNZNoOq+eipuHj18XgaM0oVQ3+KHtf+JUXq7MW5nF0=;
 b=3arLx9ePuaeZF8NxmPIL6+u3ke0WwVbkolUD0gVuKXbKKoQPKaQBGivNV3F4qhIlwK
 iupI84Z//eFm7ExttydfseWQSzRFF433h+FGj8WiCzu4nLLgLhYuunKMKW0iknqKgvLy
 UoARZbuEaB7j3Tatm2/FK3z16yOwDL5p2gwGirYftcxOqyBj812MgioOQrJiTde4u6Uk
 Ks8q6NjT4VEfPg1zHb2gg8G5YrWwwcP1AR8w9CpJFjd/VQc1vCjZuVetEGZ/FaYsYvc3
 K0k35uRBj/fd0BwWxgR7DvOSg1JQ020pARPBXqj5uIbcLIGScfZURQDAeCDAzHp91VGa
 DIfQ==
X-Gm-Message-State: ACrzQf3ihwJyHjv6Occs+ivmJZAaWmeD5Vhh3ckgl3jBarOFxeZlBb5z
 zA6qWQ5bL52N+vnI8XqFx7l7Jw==
X-Received: by 2002:a17:902:a611:b0:178:6b71:2ee5 with SMTP id
 u17-20020a170902a61100b001786b712ee5mr807730plq.53.1664385687528; 
 Wed, 28 Sep 2022 10:21:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 q26-20020aa7843a000000b00535da15a252sm4216495pfn.165.2022.09.28.10.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:21:26 -0700 (PDT)
Message-ID: <b2048335-768b-b3b7-d51e-c96ae8d0763b@linaro.org>
Date: Wed, 28 Sep 2022 10:21:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220928164719.655586-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YzQWmj3CD6Xi

On 9/28/22 09:47, Cédric Le Goater wrote:
> As the Cortex A7 MPCore Technical reference says :
> 
>    "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>    uses 16 double-precision registers. When the FPU is implemented with
>    NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>    This register bank is shared with NEON."
> 
> Modify the mvfr0 register value of the cortex A7 to advertise only 16
> registers when NEON is not available, and not 32 registers.

Looks like A5 has the same language, while A15 says that NEON cannot be enabled without 
VFP (which is the same as all aarch64 cores).  I guess this is a decent compromise.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

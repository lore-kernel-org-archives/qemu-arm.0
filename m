Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp392512lfu;
        Tue, 26 Apr 2022 10:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW0SPVQPfk3XzghcW+cGYQDyqAPZ0z6Lb/Xh6Y+fo6UUWTQ0ahUqkMM0FoCNWKVVjZLXoB
X-Received: by 2002:a0d:d58c:0:b0:2f7:d506:ba8d with SMTP id x134-20020a0dd58c000000b002f7d506ba8dmr13858298ywd.422.1650994023403;
        Tue, 26 Apr 2022 10:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650994023; cv=none;
        d=google.com; s=arc-20160816;
        b=gSyAZhROmQaWSjd9Rhu474Nstt/Blpzh9KxetIhGYKaFGgSlgl2hBx++07iqEi4Qc0
         ehpjltzcJ2yhKKSrwJZpLUQkHvb7H+TqLWJv/Rmlt8TI8y1c4OTCiyfgPXjM4W5NBo0q
         R3xXStRDGcBQY1vvBsr3Xlqk/zi2m7DNKoZQODAV625iZ2aEocqE+qmwJNK7gjH709FU
         l1Z/uPD8i5VAPuww1r0kKRvCp22gsTVnJuXt8KYDTDqxFjrDxnbDgglQ0b2obI2ygVjZ
         ZMKOtw/EMYXqv6Wr8w6jAH+F4c+8ABoBofpDeEXLU72ukWFSsxei6vfeewJLRSAuKrdS
         3STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rGd0K+W4DQNlqs6PatQiqVqFEhBsc0JWwMYMF5xmlCo=;
        b=VBfKUupxV/Ys2OBqamtiwV05nDDtp57FCoK1Ha85vrIFajhgKxp6hpQEag7aswT9aC
         b7YE8+jZd3C2PbDb6aCTY+s0j3hRoPbAa4nSxBLs1uhkfUDFBaaDEZ7Fe4dc8DjnYlku
         BS+d2RnKngpeob8pOJ5jcGqyTuRPxu+i/VHUMO/kdiSchJ2p/+5IggpndspckjQ+Rxjs
         vq45JbNfRAc4deXMzyOtZg+0Hw/q/Q+IZ0lA60keo2MgF/5itT9l1bzyZQ1QCkaqEKke
         rj8hTwQKQDM0c9GPTUi/Sm5NvwyuTaOEZOP3F6kWtkRUQ+lL5iBwz2TJr4Ld0sVCaprp
         L2Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYw9+Nxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a25370a000000b006484d04895dsi6840268yba.652.2022.04.26.10.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYw9+Nxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOxq-0004Pu-RO
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njOxg-0004OX-Ss
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 13:26:52 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njOxf-0004Rt-C6
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 13:26:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id bo5so18579355pfb.4
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rGd0K+W4DQNlqs6PatQiqVqFEhBsc0JWwMYMF5xmlCo=;
 b=VYw9+NxxYmKfW0b1+SKRsN2iY717PAuqomTvM3AD8a8Q9Zvu774o34zfQFiqgVUpY2
 gJItU2moAYhx2b4gWqk/QKb3jvnKb3OIRC1/5qV8UE4Det5klKQdQbvhO+abWaHZPoae
 zto1s65aOYWTk/95Ej7rAjV6Ol4jf80WOTNFoKIbHPj2imquNoChgX67LBXQfaOTQdbG
 E5Fm3vzskxnCdgyTljUvg1rTGEs3ROhbVjQOpq3dkbjoOmnJuIybh43oJJVlzD+8j9Mt
 XeMd9XnfSp19J8BAMQnBZEBX/x3xQuY7omtXAgC9s9Dx1qtMDE9llUV/Zx4xnbV/gy+2
 eSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rGd0K+W4DQNlqs6PatQiqVqFEhBsc0JWwMYMF5xmlCo=;
 b=rb+FEtPuuTNWOc18y7ZvOks0s09Ry3Bjo4sYSw4GeDk5OmOQZhu/2u2i1+cwIUsQVG
 GJcTlwfZr4+H33aobHc8qVqLTQMSN+8RYxzRXYEuXsofNDdN+L0OJzRUu1YfPPiZ04+L
 PPF7W7mq/e4042RtsBAjEc10dD4bYdvRzjWgc1wYCuIcj3p+qR9CBw8ItZgQKDzGSOyO
 Na3RX1J41k9imH7cgXtGW91YRa3PHEClsH+aglQM5EVq8rvAb1OAgycTtDURQrfvWlUF
 6RHHcQ2XqpCofulDOAid7lThqiR0SJx+y2TKAvu43UBU5d6fvB2DQh1pb9mV+rPqRTip
 3nlA==
X-Gm-Message-State: AOAM533p/oD/0mY24WfCEYVkpvp3FrmkDfUJ2nxVDRlQydiaM23Bepw4
 C7ESl8QEViDGofJJWXr2HoiimQ==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr20551624pgm.470.1650994009642; 
 Tue, 26 Apr 2022 10:26:49 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a631815000000b0039fcedd7bedsm14667379pgl.41.2022.04.26.10.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:26:49 -0700 (PDT)
Message-ID: <ba8756a5-9b89-0275-caec-1915b4a3ee6d@linaro.org>
Date: Tue, 26 Apr 2022 10:26:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] target/arm, hw/arm/smmuv3: Advertise TTL and BBM
 features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426160422.2353158-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qRXjiXma72cR

On 4/26/22 09:04, Peter Maydell wrote:
> Peter Maydell (3):
>    target/arm: Advertise support for FEAT_TTL
>    target/arm: Advertise support for FEAT_BBM level 2
>    hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

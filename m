Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp649002lfq;
        Sat, 9 Apr 2022 13:35:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/gSrDg6uHWsGwlYcG5FBFcK6S9O7ZpVH6dfLoA97KQrZ9RY8ebfCdoAryXZTEVj9VG7Nh
X-Received: by 2002:a05:6214:21e1:b0:440:fa7a:493e with SMTP id p1-20020a05621421e100b00440fa7a493emr21314173qvj.55.1649536526509;
        Sat, 09 Apr 2022 13:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649536526; cv=none;
        d=google.com; s=arc-20160816;
        b=opqi7SFl5K+9XDJDSBDTAFmSLJo58oWp0mU0R4vm5pRvPxthXL89FLbzqrOQ8B0ISZ
         KK+tewyYLoUGW/PKQHJdt6Xr4CeXy/SFgB7jxrD6v912FVjMUeE9Zq19odWX6rqzP2/v
         H3dAW/MPlWictjoRChYgkLDLnEoDEo5YmjOfK6KgtQs2pn7PNdZFym2/A//dXhpvbGP4
         MGMmMG1HEaJ9LYfgLmim4pdbL5/k1MNfFC3bVOVLDiJve0H0g0f6l9hATgeu7goxptiI
         Y02kTtaXe4fJmifnOzdNeod6By0E05O5GmuPtZB88L3H6m2qyyb5VlzA7wEU+bpLGGKH
         5NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hYLTGxA5YoI+jfTgeViKB7T2LtvC9eCNcON+OFMF8jI=;
        b=dO5JnwDJPuqEW7sZcPrwd0ykl0shry7SQ4oC6HQc/s6h5WCBWdcOZHlrJe4DHYox7V
         6UWA3A3Wm30WuKqZbzGLd8alH4/WPlRh/ty7B1xd+vTZTUdKQLn+G1f28WQ1HP0zWcyG
         tWfHpFL3n4mI0da02YaxL1qdC22LceQpE3Ictn2XWCQPt3TDvOZMUw1l/klD7s/kxtrp
         v1nB6gVvH5lVwRQ2576/LfOtqomS+QP5Zl4zPKnidlH5XTzkG6KlZN0IUdWb3AEHrdPQ
         7rWZobwM96b/w2QNnfuKpgc4hhpFq5ub7W+YFMuW2RHWTfLpiSTLuAi+YbYKCIt+Wddo
         WWaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pnr/gRQM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs11-20020ac86f0b000000b002ed13188be2si778650qtb.750.2022.04.09.13.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pnr/gRQM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHnq-0001Gc-27
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHnJ-0001BF-OU
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:34:53 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHnI-0002sY-5a
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:34:53 -0400
Received: by mail-pf1-x432.google.com with SMTP id s2so11319599pfh.6
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hYLTGxA5YoI+jfTgeViKB7T2LtvC9eCNcON+OFMF8jI=;
 b=pnr/gRQMp2tH/RbnwDk+ZdQC7j7LwnAOl0CKko+mD1+XgyDGabcVg2A9bCtxbi/wGN
 Cf3AoPl7tzv5dYl06hEW0E9RF1F1gwAspJiaQEX2NoLyFsqVmhDY8LJCe8LA62G5XCce
 pibDMZxN6xed/p89UXGGn2X4lXE7hguzDZ1XkpaAdsOE+PZKsy4ucNhEdEIHaBqpfSj3
 7a+RidPwKcKtnoddSxbL2x8VrvgBwBYzP71H1HX6L36KAthJ8uTFE9m9XyZFzulFvw0c
 Q6NoMNPuja1iZQab51T2p9E9rGagGjPdig02eo1MeV75/hH6HfPl7p86wv2Gx28VZMW7
 3LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hYLTGxA5YoI+jfTgeViKB7T2LtvC9eCNcON+OFMF8jI=;
 b=dD2WbDvyUVs62skHWHCV6uklDPHmZUD4J985Q/RvKyqeNk7wY6NNTK7lilHXE+zhcR
 Pp2e2X6IscGL92dECfCTT52B3E3n+I978DfBOTpuGZCffgzFOBlo8/6liI/w1lnEoMjB
 AKEB3BM+eKPzew4GybICV6TgeQHE0SBbO5T5fko+5j0bPrf2JgKD1vOVE+/xKROEqhFn
 Y8sQU85C0BijhIYluTQ6DuVig6Tj0OXuBGUILiI9ECoAaJv3fK0qLq9zFTCd9NXDzNVm
 /DHdedcbxpVGatXdWr1eo0urDmshLiWXaqnsrkAdIlbz8AuqUdR0K6BAlT+YTDm0pFQ0
 oD6g==
X-Gm-Message-State: AOAM532q8XPaze2/qDh/Onm1i7JU3U1kDHFwZq6MmsCPQr/BdkZ44A7a
 Zlt1x5vaCXqH1/jrpjIGmh+mjw==
X-Received: by 2002:a05:6a00:16c7:b0:4f7:e497:69c7 with SMTP id
 l7-20020a056a0016c700b004f7e49769c7mr25317852pfc.7.1649536490264; 
 Sat, 09 Apr 2022 13:34:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a63ae4f000000b003995a4ce0aasm13923684pgp.22.2022.04.09.13.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:34:49 -0700 (PDT)
Message-ID: <e86f4b1e-7bd0-d038-f6c4-a56b3ee60b07@linaro.org>
Date: Sat, 9 Apr 2022 13:34:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 33/41] hw/intc/arm_gicv3_redist: Use
 set_pending_table_bit() in mov handling
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8PsoF4b6b9Vf

On 4/8/22 07:15, Peter Maydell wrote:
> We can use our new set_pending_table_bit() utility function
> in gicv3_redist_mov_lpi() to clear the bit in the source
> pending table, rather than doing the "load, clear bit, store"
> ourselves.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

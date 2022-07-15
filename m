Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp223137lfp;
        Fri, 15 Jul 2022 08:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5A6hC+RFk+xbRVeyuBSWtn+/sIWYPhdNEngIBwCLtU8Samo4VYfqQnk1U9D5jDtCoT8cG
X-Received: by 2002:a05:620a:468e:b0:6b5:af5b:6e5f with SMTP id bq14-20020a05620a468e00b006b5af5b6e5fmr9660168qkb.288.1657899463357;
        Fri, 15 Jul 2022 08:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657899463; cv=none;
        d=google.com; s=arc-20160816;
        b=0PEoZpo5zeyGbn0B/NzpUkYZMkQLN5PnSRkv2K8WcQ7guOUZH4vNGQg2iJ5P+gVtCR
         ccceXN83RZmcft/vUQ2g3g9Z2spBA3keh0vANg1AUm5XQaZE0FXylRCRaRGdJNu37kbO
         Uc7hQQCqjeNegY850VJHyrNOB5i9YWJPeLC5JUYHl6EDZ4tifuyEHptefaQDfq7aBTIg
         1WlIXDctaYpUmWs2gu97px8Fr/72Pa1YBP/ANV2gpDK07o2MNs1Vqjo+ECghU68glFe/
         WW+N0w1h7KfCBChAdUB3r2ss0EISvc1NwiwcF/0jzEPaBAXL1teooUHjA9bd5rwqAdxO
         jg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qFr6h49n4HTvrei/G3kkjtjB9MT0qj+/xJKpu1oZjz8=;
        b=P69cUCQm6lqH1NznOGANWYk2lzUQ772oDhLP0BABxupu2vJ17PQ5uucNZjptccHWSF
         T8nsjom5VDQGQFVydNeGrQaBjI2AIq7gUN75PuheuhW54ob2ciG+eP81kh75HfJAVLNe
         Sd8N5Hi0qQ2V9TamkAAiq0g61HRKfstPg096fddbg7CHcmZkm6rq0ci/4cRMqmePeCOa
         RHQC6et6tPeXF7NyE1RAG9G3USp96yId7bx/mFClrFQayRrnJhA4xOBwCkQV+kBkhm5j
         suuw9VqGXAMjiTQG8IRRIAzl8qzNmaLVaYNcJZu4dvBCoCaQJbZC5ElkSihhIacBPLJR
         SU+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LyqgGvV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a0562141c0a00b004701c375a4asi2749448qvc.30.2022.07.15.08.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 08:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LyqgGvV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCNNu-0000WK-R3
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 11:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oCNNh-0000U8-V6
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 11:37:29 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oCNNg-0002US-7r
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 11:37:29 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 r22-20020a056830419600b0061c6edc5dcfso3714045otu.12
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qFr6h49n4HTvrei/G3kkjtjB9MT0qj+/xJKpu1oZjz8=;
 b=LyqgGvV4gg9jsbq2fKVRfXP1t1Vm/7koJKEzpn4epoaInkElYTUMnHHx9rt4zE9gjQ
 75ZEdhZb+f2SYjxvichZhUNSIDZD1zBkrq13N75Todzz/siU8vBU7uGIC9oYTErVWGgM
 9LUFGqx3fVPg9FVHjmqB4p6+okdVnJh0W4ImtCgoZ3TZPf0R7XPlJ9af6I7axVvnlu2N
 xjpQSfvHOUYoBonyKfZuwJ4w0MQy9uW6Inrnf8yKwJCMpHGxQ1JSK/aRyVE4ew29RfbI
 oEXIANHyx88p0T0RnsULZtgp2xQBcxTtoP5KKTK6sh+B5W3oLEJv6H/Fy5KVfU0itHbu
 Xlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qFr6h49n4HTvrei/G3kkjtjB9MT0qj+/xJKpu1oZjz8=;
 b=xQlFYSSfAsFMtSAnpCQRA1LxVOIArEWvb/xyIRN3nejnc9cWtiB3QhDe0to2+o2bjc
 9A9Xfdiaq75/rLS+am0uA5l/97LZgBpZVJtRHzvL7/i+rW5E5AeGaLgQ4BS8vRhblSN9
 GxGsH3+3PwPkS9RdbvUsrcRr2Li8eLQtiyBchgAY+Qer4f7989EzVRl7CN19HH16tlpD
 Jlrmx/8RQTRtxI5Vh6x2V6eqvnn/iW3cbgZmfUQrFHr1tpkFlIcnpmDjtjECJfFuk7nk
 nfV+scazxb5G25+t+GVnUkEuB2nGTGkVdQ+XEy7vNgb5vE5/WPxrhgIIGmPU3ItmfJ6d
 0vdA==
X-Gm-Message-State: AJIora+78DzNH9kzRYJMONOgmnU+yG+oSsyp2wpblTdYPX0VqfmOfBAP
 jvVoS2vXtNq8zp6BDxamkxxoJg==
X-Received: by 2002:a9d:2663:0:b0:61c:7ef9:c117 with SMTP id
 a90-20020a9d2663000000b0061c7ef9c117mr2789518otb.170.1657899447103; 
 Fri, 15 Jul 2022 08:37:27 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.176.74])
 by smtp.gmail.com with ESMTPSA id
 1-20020a4a0301000000b004357c1d1efasm783098ooi.21.2022.07.15.08.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 08:37:26 -0700 (PDT)
Message-ID: <d5dd076a-1a93-61cd-2ae8-5204b516d4c7@linaro.org>
Date: Fri, 15 Jul 2022 21:07:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Don't set syndrome ISS for loads and stores
 with writeback
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220715123323.1550983-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715123323.1550983-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Psr5yke3IQg2

On 7/15/22 18:03, Peter Maydell wrote:
> The architecture requires that for faults on loads and stores which
> do writeback, the syndrome information does not have the ISS
> instruction syndrome information (i.e. ISV is 0).  We got this wrong
> for the load and store instructions covered by disas_ldst_reg_imm9().
> Calculate iss_valid correctly so that if the insn is a writeback one
> it is false.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1057
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested with RTH's test case attached to the bug report.
> ---
>   target/arm/translate-a64.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b7b64f73584..163df8c6157 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3138,7 +3138,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>       bool is_store = false;
>       bool is_extended = false;
>       bool is_unpriv = (idx == 2);
> -    bool iss_valid = !is_vector;
> +    bool iss_valid;
>       bool post_index;
>       bool writeback;
>       int memidx;
> @@ -3191,6 +3191,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>           g_assert_not_reached();
>       }
>   
> +    iss_valid = !is_vector && !writeback;
> +
>       if (rn == 31) {
>           gen_check_sp_alignment(s);
>       }


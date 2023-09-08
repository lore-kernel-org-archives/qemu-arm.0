Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp680418ejb;
        Fri, 8 Sep 2023 13:51:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESGRdi22ipg6RtsqeyWXgOwoG10sR8QUlG5GGgI+g+gYF1RH0mM7ak60v7PMjnkA0e2ruS
X-Received: by 2002:a05:6214:21aa:b0:651:66a3:64bd with SMTP id t10-20020a05621421aa00b0065166a364bdmr8837076qvc.29.1694206294922;
        Fri, 08 Sep 2023 13:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694206294; cv=none;
        d=google.com; s=arc-20160816;
        b=KewnOwv9ctMr6vhjERDp9GNO7VGBQ/h8b/orrumKk3uUaFa/Bu4DU94ZrUa4O31HBJ
         UPA7TBW3L6TiJTVAdpyTO/0uckBaKsPCoUChAvZyCT7b8UpoJtUsVRPkc4kgEBeS5WHV
         0JBEdIxuv9PUxCi0b803zZWfcI9xdRPFS17k1SVclx2oppX2qD1qqhULXavi1ag3SQOf
         /E1iJUYkBOje2U7N0fO/aZPmo70rYI7DkwZXIK7WBoPqHlhBGR3UPv9h6z6XznZnFYTp
         HgO5ZnDwb3XGSBiezVFTuaiJ1GQ4u+JkFI/iLkKd3V2B+qqpFIwsqnT7/P3vyLpxPgQc
         h++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=E3h1NzWZ+PlVyRsy8pJqbgheTOeQsn8cWPj3t42ko4E=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=VzLtIx2tk3P8OnEDjYlighN7KJhXg3eHjVytQPeddsbBQA/CJnn49dqbTVEow1dUQs
         FhqF3IIcwcAEWZg4K/oiB1CrZln8x2Lhs1uB5VFVeC85FtglwYE0Rn1K6AkClkDwFWwz
         ZCwNGrurBeBxIe82HdnK3KD/p5yCCz2eeQW4bLAio0ybL1ZHLYieCvpWxtZjZiwFsNqh
         ApWQdIhbPWvL4pA8BQ2Xm5Rx6a/aGg2L39QtvjqkAk/J5vA6nAee40P4DQhhphL1ICLo
         2MddtxS0wpA1E7rfWNGrwyYt2Zi476cz87aQ6+kj9suSaUhPvfn88KrJc2Rqg5l6e4s1
         vEfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwqRXyNe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a05620a408600b0076cc807c25csi1656642qko.33.2023.09.08.13.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 13:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwqRXyNe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeiRt-0004wv-MA; Fri, 08 Sep 2023 16:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiRr-0004w7-0h
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:51:27 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qeiRl-0006W0-Bf
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 16:51:25 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68e403bb448so1487594b3a.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694206277; x=1694811077; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E3h1NzWZ+PlVyRsy8pJqbgheTOeQsn8cWPj3t42ko4E=;
 b=GwqRXyNevtKZCsu4UydPBuL69xcycUWD24sfnvhzPMYYX8TsW/ZByXep+vqccZWJbW
 yYKb1nybZCt4YThPURgPMYMgcIusJXxiXKN+GCwzE9zrl3sH61rDNfviht2W+MI+JIrS
 fRJYPNWzjtQQF88MJkJyZb4qQx0wsDR7c36JgEz6eogNH0f6rBYNW93A+s36RgQGpI6J
 q98enlno+gFLdpDXonTyiGrrVO74J9HdqxY/mDNX2aH10YgLbuQBtR1tozWOxE18gsAk
 tWmk0fOiqjHiyuAhuk/IuGCm78PsVMHRjSAcSQlozC6fIZoO661YWneQrKaok2tQvCwr
 j/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694206277; x=1694811077;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E3h1NzWZ+PlVyRsy8pJqbgheTOeQsn8cWPj3t42ko4E=;
 b=GNbONi7MKgrJb2K+FoLcHB3nQ7oj5T1Wus8f3crvgybWnUEwDgLl9vtiyoWkFe2ybl
 y4zg1a9DevQSOXo+G+WguL1m3YPfGBCpkNIw1QW31Ckbq3OT8T81+N5x5Fj9TxmMdWwv
 W0P+/xucBLkUUYIttJ7E4+4qrI+1I5vFTdqAApnVJ2PpPXt9jZYGFdzRiLRxPz99AdP5
 nD7hkbvxCvNcrI1HVSukOJeLgysAdpxuTR+/x3iwNHqNy2ZKX7Esizy2VPCFNpMrg2xd
 COkOFP28t22M9SmhVXk0Y6MZSK2CJZudrDIrfGpLHoJA+gW9T7wRkBeNqwjP7qNogJ/x
 P6Jw==
X-Gm-Message-State: AOJu0Yz/Iuyn/PTqVKnUpQH1IR3bVc2kJstY0WVZowK0Tyg0WtzEKiA7
 D0kmEtVaqsBgYcWBqPSZuKPuRlrIqAK2wz2ZUA0=
X-Received: by 2002:a05:6a21:338e:b0:13f:13cb:bc50 with SMTP id
 yy14-20020a056a21338e00b0013f13cbbc50mr4629136pzb.25.1694206277042; 
 Fri, 08 Sep 2023 13:51:17 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a62ab06000000b006870721fcc5sm1741553pff.175.2023.09.08.13.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 13:51:16 -0700 (PDT)
Message-ID: <0b19d3d2-8798-1641-152a-e86d979edd67@linaro.org>
Date: Fri, 8 Sep 2023 13:51:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 07/14] target/arm: New function allocation_tag_mem_probe()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /s0p/8zzX1Ff

On 9/7/23 09:03, Peter Maydell wrote:
> @@ -198,6 +215,14 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>       return memory_region_get_ram_ptr(mr) + xlat;
>   #endif
>   }
> +static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,

Missed spacing.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

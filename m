Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2671345ejc;
        Sat, 25 Feb 2023 02:10:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+JTyvtyJv3QMbk5MGd5/Yx4NzBeWEQF07xLQZ33XzNP1E7Diob5r6OcgZjGQmDlgR8Jmkj
X-Received: by 2002:a05:622a:18a3:b0:3bf:be7d:b3e5 with SMTP id v35-20020a05622a18a300b003bfbe7db3e5mr7260464qtc.41.1677319834465;
        Sat, 25 Feb 2023 02:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677319834; cv=none;
        d=google.com; s=arc-20160816;
        b=G9KxEW3N3e0vK8kBp71/NalrS+WTuAanjU9ZnqeKn98tewT8Kmvmh+CsUpC4kp0cfy
         5748VUoYoryXC2T8oaidhLKLOM3hh19EwnWhSpiMucXurGKGlhUbp5uB+itNnKzJkNkf
         FWYvGgRxjtiOxvK6Y52jKgBYUTtjLT1eG1RIt+ZAZDIQa9YruzjdYk9eumde+ThjiR02
         Q4E/Yotpe+r3h0QK916xYd6VMQzHEo0swjhjkQwpFMomCgitBkhu4i0n3OLCzxP+C9hv
         IeM6iR+nQLwsYp0OPcuRzX6FdiPxKw0fNqIsOHiulyRvOmJeP+R01xjeMyjG+AbugyL9
         l4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R94glz4xTzI7Q1O7q2zHk79NUtEKhfWvQ4ziaKgWhew=;
        b=sRUmVPtW3iFf3Pc+Z/9MlYPjqTCs5k/dAIGUimXZjZmhAnmiOfSebdOMZIDCxUrDZl
         kYYkT9ekfh9nSIB4styekGYnmg47OAnNfPRlzKtQXcVPsC2y7BKJ1ONfSdLcdWDvtSMN
         MAsNAH04Vp2drrxoSs61Mzewlluv1KeZxA6W9KHDLl754jmhZ7CfANQHuRmoamrkbX5r
         dxJPxAdTfsakF4E39jmufhLDWYeHUM9xlxCfr+2fiyWn18mOH8vQGTu7T5fZW3fzdgBu
         DzONoY9r0y0+tJ59yEAyfMjuwDWqEqdOPsp5c1MgJEY+kILv+rEGepbib0pFNepLUEX3
         yk7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G7JRPR/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac84e82000000b003b88d38366dsi1872427qtp.371.2023.02.25.02.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 02:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G7JRPR/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVrVS-0006QS-E7; Sat, 25 Feb 2023 05:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrVR-0006Me-1h
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:10:17 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrVL-0000uU-7R
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:10:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id 6so1566457wrb.11
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 02:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R94glz4xTzI7Q1O7q2zHk79NUtEKhfWvQ4ziaKgWhew=;
 b=G7JRPR/DjS7w5LAg05V+jNyI5Q0rxl3ObtA6P6Yxcqzwn2WHUNLWISVTJ27i1IxsIt
 pXsycoeeJBy6fcHdLc7w3aHknXVD9t47qeXkAvdgJ2fAWYXyk4plnDT4v3YjyveqrFHi
 6DZn+ORodqkarh5yUrFZhL8JXb5/oBZr/gsU/Eg+D4fUyVy/3JAewPvmEsUkoriWFi+y
 EWOmsBMD81aWrvgDz4y0z1Y7q+DTND6VFxUfqJWtdbfkLJ2kppax+ikLkFI0R4ZN6TSo
 9thoXqrqSJLszkrwAm8Tr1FZ6IHPlTJiGuqNQLYLVX1QJLntqiIsE43EEQbP4ISlXY2R
 kGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R94glz4xTzI7Q1O7q2zHk79NUtEKhfWvQ4ziaKgWhew=;
 b=rG6pRVBmpO3d6IJhiKrb3fqv/IEcQB52IMDLQ9eNqVt7derE6HXXZb1WCxZ23IzGia
 d3wEUBPVUcMk64yvNhwLIN9RtYHoUsD6jiGxUt+HjfThYpNPrjwUJO00NKqJ6YUTtBHI
 gt80ybJ8bvObGiHgrLidKFzCyTTs7djLpsNFw4vB3Txf8UlJG61Wb/XAWD+sWZsLutkf
 fs2kv3OwH9dF9LYD6L266YnWObKmqLnswVDj5bqnmpqAci6z5S45jLl62HzmrBoEIEtw
 ReAjtTXqfB5KrbHeZPp0a1/qWP/YEErs/5uXZ9Hjfpg4fakK6YItBUk6Lfi/OyohDjLM
 /4Ew==
X-Gm-Message-State: AO0yUKVnJxbVB29Fj31ThBBfnNO2H8ECz0tIdWTx/riFZulhllfI1z1a
 SIhYeDw79x8qwMGXfjDw0qb1ZlUcGSKyNAC3
X-Received: by 2002:adf:e58a:0:b0:2c7:d6a:cca9 with SMTP id
 l10-20020adfe58a000000b002c70d6acca9mr9068495wrm.23.1677319809025; 
 Sat, 25 Feb 2023 02:10:09 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b002c5a790e959sm1365784wrp.19.2023.02.25.02.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:10:08 -0800 (PST)
Message-ID: <6b17a5c3-143a-42ca-ec87-dd8108aac9e9@linaro.org>
Date: Sat, 25 Feb 2023 11:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 00/76] tcg: Drop tcg_temp_free from translators
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FojfPxczFyNR

On 25/2/23 10:13, Richard Henderson wrote:
> Based-on: 20230225085945.1798188-1-richard.henderson@linaro.org
> ("[PATCH v3 00/30] tcg: Simplify temporary usage")
> 
> In the above patch set, we changed the lifetime of the temps
> allocated by the guest translators, and eliminated their reuse,
> so that we have the best chance of reducing their strength.
> 
> That we don't reuse them means that we gain nothing by freeing them.
> Therefore, drop all mention of tcg_temp_free from target/.
> 
> This may be the most negative diffstat I've ever produced.  :-)

>   94 files changed, 471 insertions(+), 7143 deletions(-)

7143 + 2 = 7145 by removing tcg_const_ptr():

-- >8 --
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 43ce4bfa7d..64b88268cd 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1020,6 +1020,4 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, 
unsigned vece, int64_t val);
  #if UINTPTR_MAX == UINT32_MAX
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
  # define tcg_constant_ptr(x) 
((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
  #else
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
  # define tcg_constant_ptr(x) 
((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5bf80b22d7..ce40fac557 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4210,3 +4210,3 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, 
int vofs,
          TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_constant_ptr(NULL);

@@ -4288,3 +4288,3 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, 
int vofs,
          TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_constant_ptr(NULL);
---

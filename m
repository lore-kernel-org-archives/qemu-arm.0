Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp245850njb;
        Thu, 8 May 2025 00:32:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcXqB76V5IdrhDBdifGLflG0dX2OSD4GUzoBMf9m4PHlvQM0xa6R5SGFPs4lMgAN8x40LinueUl1nuiA==@linaro.org
X-Google-Smtp-Source: AGHT+IFd90slZ9KOGOtM/eUkdcRzOCD2Z6fFMI3BRV8xhXoVORDnHRJGEO3jKUM5bJXOHoKVHPGM
X-Received: by 2002:a05:620a:17a9:b0:7c5:4b91:6a42 with SMTP id af79cd13be357-7caf73a0772mr882378085a.17.1746689520896;
        Thu, 08 May 2025 00:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746689520; cv=none;
        d=google.com; s=arc-20240605;
        b=OV8yCwsBXrPqacqPoQiZU5xBTC7X98y1UlFOT19sVOWQbZK5YSzM8OCOTZlrY5kKdq
         feAZnByaKIwrfBHpKetagy2x0ZGul42XOdbPPjgKarm6mvd5WIydWdMmiiVb4M8oeTif
         6BbgB9WPq7cOmai2GXfLxZXVxi0ALFuRZPEepygFGHPMLbUFLERGFK+cPP7Xj+mqRKpS
         Xd/iFgEb5k6TB6+4HUXfoY1Dng08zLuPepO/BOR5SPb5YB+fT3lv4n+LTQd4BxX8TIOd
         +oqcex0o3PBTS7idFhRkj6MQCE1IX75YkjFVREo2h1aD1pgCeJwWF5vn8fSGzhKZc8PV
         bUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=RR4R+NqtH3JRkNvtJ/ste6SGY+OYWjistTCpDsYx9uE=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=Y3/jLAsfz6avt0bopXBNdrP7Y48m4dgHJqV1/GEiLSlWVnltRAtt3UeXSV7zPIWcQe
         LjGdvOzmK3SC48yNYetPX4s+g1p5yeYDQ0S+DsL6YBdYG0ItmFSdJ0vTqbUxqj9hwDf3
         4pBFFi2syDv4DGIgZzy8rguucE4p2DZJCVcIIy0aHCIuAGPIezlzGX0Qtd/BSlT8mNMQ
         Jv9djz7cC55v2CzXrQniyV0WwwQDGtlbDsiAElhYxRywDLeNclTg0K13MtxOnZ66h4Zc
         v6DqOOnbQs4bWdrvNBTU6EXUF/KfZpVFRdoWxycDBDot6JXb9JhyTLmBLot7r36ao+AJ
         5OiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf7594e2bsi416838485a.216.2025.05.08.00.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 00:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCvjR-0003YK-5k; Thu, 08 May 2025 03:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1uCvjK-0003XQ-JQ; Thu, 08 May 2025 03:31:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1uCvjH-0000zc-5Z; Thu, 08 May 2025 03:31:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 048DD1200CE;
 Thu, 08 May 2025 10:31:12 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7F238206B4A;
 Thu,  8 May 2025 10:31:25 +0300 (MSK)
Message-ID: <f337d662-9eea-4f8b-b2a4-38a46e64732e@tls.msk.ru>
Date: Thu, 8 May 2025 10:31:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Don't assert() for ISB/SB inside IT block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20250501125544.727038-1-peter.maydell@linaro.org>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <20250501125544.727038-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zcd6FSa8hxDZ

On 01.05.2025 15:55, Peter Maydell wrote:
> If the guest code has an ISB or SB insn inside an IT block, we
> generate incorrect code which trips a TCG assertion:
> 
> qemu-system-arm: ../tcg/tcg-op.c:3343: void tcg_gen_goto_tb(unsigned int): Assertion `(tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0' failed.
> 
> This is because we call gen_goto_tb(dc, 1, ...) twice:
> 
>   brcond_i32 ZF,$0x0,ne,$L1
>   add_i32 pc,pc,$0x4
>   goto_tb $0x1
>   exit_tb $0x73d948001b81
>   set_label $L1
>   add_i32 pc,pc,$0x4
>   goto_tb $0x1
>   exit_tb $0x73d948001b81
> 
> Both calls are in arm_tr_tb_stop(), one for the
> DISAS_NEXT/DISAS_TOO_MANY handling, and one for the dc->condjump
> condition-failed codepath.  The DISAS_NEXT handling doesn't have this
> problem because arm_post_translate_insn() does the handling of "emit
> the label for the condition-failed conditional execution" and so
> arm_tr_tb_stop() doesn't have dc->condjump set.  But for
> DISAS_TOO_MANY we don't do that.
> 
> Fix the bug by making arm_post_translate_insn() handle the
> DISAS_TOO_MANY case.  This only affects the SB and ISB insns when
> used in Thumb mode inside an IT block: only these insns specifically
> set is_jmp to TOO_MANY, and their A32 encodings are unconditional.
> 
> For the major TOO_MANY case (breaking the TB because it would cross a
> page boundary) we do that check and set is_jmp to TOO_MANY only after
> the call to arm_post_translate_insn(); so arm_post_translate_insn()
> sees is_jmp == DISAS_NEXT, and  we emit the correct code for that
> situation.
> 
> With this fix we generate the somewhat more sensible set of TCG ops:
>   brcond_i32 ZF,$0x0,ne,$L1
>   set_label $L1
>   add_i32 pc,pc,$0x4
>   goto_tb $0x1
>   exit_tb $0x7c5434001b81
> 
> (NB: the TCG optimizer doesn't optimize out the jump-to-next, but
> we can't really avoid emitting it because we don't know at the
> point we're emitting the handling for the condexec check whether
> this insn is going to happen to be a nop for us or not.)
> 
> Cc: qemu-stable@nongnu.org
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2942

Hi!

Is this change applicable for older stable releases, besides 10.0
(currently 9.2 and 7.2)?  It applies cleanly but I wonder if it is
actually needed..

Thanks,

/mjt

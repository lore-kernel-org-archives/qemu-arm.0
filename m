Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp563644ejb;
        Thu, 7 Sep 2023 12:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhPTJlsZEvZ71JxZZUlGPVNDxCdD6AQs/C3xRlTUM/xmCCsnjVEjCQLT9ggDAl5kb0ci3X
X-Received: by 2002:a0c:a98e:0:b0:64f:4041:3d67 with SMTP id a14-20020a0ca98e000000b0064f40413d67mr218673qvb.15.1694115098043;
        Thu, 07 Sep 2023 12:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694115098; cv=none;
        d=google.com; s=arc-20160816;
        b=Di6EHtE0DX6lJ4sdVjU6IkSzBOUbv14w5Kr0L7/+YLHtpHSpGI+u8CL98WcFSSXC+c
         lmXlWX9WMwz1wM9hu5EzfMGHRchaBp1KB+N6JnnPkPVzhkYZnJ+E3Z71FQofSbU2UIHA
         KUCxlT4t17iuch9TNtDYGadtD4gUiFbX6duExfXS6ojnNNzMK27HfcZw++sufwEH8s3L
         7LVt++QXQBg+S0oanbZApCHE1iStGAjPz7xrOyts8/NynypC9vCf7hQ1DUIvsCLQKMMH
         Nv0bQxmHGpUSZ2Yt+3SzIIMNcgmG08VbXJKVWwZgERQxWJqwNOq51joBbL1aWbVVEoTV
         jcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=2SCijGGL+YKIc6yw8nAB941mncqRDiJ491WtQ/XzSm0=;
        fh=+49M985T9iuWZ82PDFWCsxI6y3s0oCS0V47JgBkSH14=;
        b=B1LbhgEn1Gb9VqiGGDaT35EqSfONkAuP5AWynqjRooHayr8NfeqFif31qDJEYVQgFM
         cqshnTahTrBcx3xpc09G8WME+OXb4mL5oIrYfIGCxUsy+ujCUiixaX6nGheAVCJF+lel
         WR2vFFUW+S4m2fn55fnhJdyxKw9tcXp+bN9Jk+UADrU58am6VFcmibLG7YtxEW+L9S96
         jI5+bGbrIcwQ9brK2n3Fk7hupGwA3/6NWLXz+NjB662B/0lHs0v7KvQdE1hyhf0gfe5j
         /xW34f7WQOy/TNM+S9a94QnxyEr+dtImKknqvzVmrTt/g1o/tttuFMSYek2m48t77Hmd
         ENwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a0ce449000000b006473a4dde27si94342qvm.11.2023.09.07.12.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 12:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qeKiw-00039P-W8; Thu, 07 Sep 2023 15:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeKiu-00034o-CQ; Thu, 07 Sep 2023 15:31:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qeKiq-0001mo-7u; Thu, 07 Sep 2023 15:31:28 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CAA891FE03;
 Thu,  7 Sep 2023 22:32:08 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D8932266E5;
 Thu,  7 Sep 2023 22:31:20 +0300 (MSK)
Message-ID: <7d3615d0-d501-a28c-eebc-b3f7a599fc23@tls.msk.ru>
Date: Thu, 7 Sep 2023 22:31:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Content-Language: en-US
To: Colton Lewis <coltonlewis@google.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>,
 qemu-trivial@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
References: <20230831190052.129045-1-coltonlewis@google.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230831190052.129045-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gdddG2R/TG/o

31.08.2023 22:00, Colton Lewis wrote:
> Due to recent KVM changes, QEMU is setting a ptimer offset resulting
> in unintended trap and emulate access and a consequent performance
> hit. Filter out the PTIMER_CNT register to restore trapless ptimer
> access.
> 
> Quoting Andrew Jones:
> 
> Simply reading the CNT register and writing back the same value is
> enough to set an offset, since the timer will have certainly moved
> past whatever value was read by the time it's written.  QEMU
> frequently saves and restores all registers in the get-reg-list array,
> unless they've been explicitly filtered out (with Linux commit
> 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
> restore trapless ptimer accesses, we need a QEMU patch to filter out
> the register.
> 
> See
> https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
> for additional context.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   target/arm/kvm64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 4d904a1d11..2dd46e0a99 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
>    */
>   static const CPRegStateLevel non_runtime_cpregs[] = {
>       { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
>   };
>   
>   int kvm_arm_cpreg_level(uint64_t regidx)

While this patch itself is one-liner and trivial and all, I'd rather
not apply this to the trivial-patches tree, - it requires a little
bit more than trivial expertise in this area.

So basically, ping for qemu-arm@ ? :)

Thanks,

/mjt

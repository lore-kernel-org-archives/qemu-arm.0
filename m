Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp3160340ejb;
        Tue, 1 Aug 2023 14:48:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHUPFs1A48KmHwbOXaFvkk63VfI1QP9EpcfXqlQLPUDTKeWsRbyHEsbbVFqbsK2Uu4iCNAC
X-Received: by 2002:a67:eb89:0:b0:443:7b05:ab23 with SMTP id e9-20020a67eb89000000b004437b05ab23mr3604959vso.20.1690926539024;
        Tue, 01 Aug 2023 14:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690926539; cv=none;
        d=google.com; s=arc-20160816;
        b=YuDjmsk2QLuYIouOhRlJ8NHgkxV2iqsve4m40e3uAIpMvWVnW7jmmM+kLr/3PyaBj2
         VtgA1y2HpV5Qmz0Q/uFUSYY5FHLppo2ygEYle5u+W0ggkCzIaIJMCH+YznvksluVpOca
         Ti6a2LCXtk9+zVR2DfPZjvMnUWhrUmif7UUi2YXzHded5UNDw+a13FpU8sHSw7XZPKd2
         ryQsoHWAlRtGYaa9IILPChIeix2/1z32Bze878eahSLxyRAIAPzrK+jDD4KTB6vZ74GY
         DlT65++fUGF2eAh532NuOXwfbqVKommg9vv5XzkEXWkOtKoM6WwmNT4KHNmsoTnxl/10
         IfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fG70qcc+1kQrlSnAh1H0yZsx4R6wJoKoDd2s3u55gh8=;
        fh=dYbBGCgGTocyNmrgaL6yD9QGcsN13jYupk7i6wm77Cw=;
        b=ijXJA1aviXm7jg2Cdl9gFp1pv+bQTf60Z82ljt03np1NHtTZDpDX/d/r8tVzkUGPuu
         ZaxdZc42wKLSpVoVDEgeyxArP0vgbuex1XqLlWWn+7XlQk4p8Z9markOVh3r0Od7TCDa
         G2hUkV7e6YhrHQx0oNOnaEaxsoGR/6g3knoKLqLjOW9EOFWrUYj/CK4EeQk7EHgRrqye
         8CmiL3CbY8DO87Bl0Lg25RbIBP75a4ygJrANR0/Tgx1pPCLlM0L1JXIrnrnW4XOyUOdC
         ajOFDhvb+BsTq03gO4eAgowy4uldWgjhSnRsX3uayntIT5PXI4IQmJkWgC7FwYTe/Dzt
         01Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nR7NhdNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a0ce14c000000b0063d35a7acadsi7547839qvl.28.2023.08.01.14.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 14:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nR7NhdNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQxEU-00017l-2J; Tue, 01 Aug 2023 17:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQxES-00016h-7q
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 17:48:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQxEQ-0003oR-OC
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 17:48:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-314417861b9so5226792f8f.0
 for <qemu-arm@nongnu.org>; Tue, 01 Aug 2023 14:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690926520; x=1691531320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fG70qcc+1kQrlSnAh1H0yZsx4R6wJoKoDd2s3u55gh8=;
 b=nR7NhdNNx1gSO8um4jMbC2UsVzyIb5poMeBomiTtg4rlmLFM0pOJxK+061YwankVqf
 rAHGXTq96w6P/kAGU8ib4cJgi5kxW/YztqdzXg6FgFEI634C1c9iaT2tSCCiRExh1Byr
 oLNbpgkqacuJ9INz8tNV051Gq0Ric9WfcF4eyd6pPAKhtKBFVdW44OWcoab7dqZStSy5
 +CpGqydPT//tdUqJrd4xljkKfBM0X1rG6ZiesZw680rDW/dvaEw0TlG4N+WerlZ1+uho
 972Xj8vSRcQVYq0P4mRjUJN8EE1eArI4zKaB+PCm+jvNsDUT0DMhGTA7pKHtL1rcRT5d
 l1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690926520; x=1691531320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fG70qcc+1kQrlSnAh1H0yZsx4R6wJoKoDd2s3u55gh8=;
 b=iFbCcJxj4WU02KBcToZmAnCH2ue4pIVQOaWA/BPE0MKeHC0vE0avPjoAVPF7D6oky3
 7WYwkdUgg398TdsZMYOHgZKji24NGjJuHLlFMO3jSemtkAX/WXAXnFWtN2r7hCH3BXdR
 Yuq59BhzKl0/shEx/Kr59Ibvy5fR04LCkusKbMr9EBtNA5eV4+fCUXnRWPNQkl4j6Inb
 z78hgdcmc+WxA20MEDjDdO4fNAtoL7glPNID5W0rLkjP00hN329s2KYYzgmzzS8Q4IYk
 ECO6+HMivQl6g21E0BzC7mrRXPf7H2quDZ0IzlvyaZ+UzblgapjEpyxd0zkV04Dd2K6J
 bfhg==
X-Gm-Message-State: ABy/qLayK9TqBFf6QJWpIA4mLNT3Asn8raOIxLiuyr+zGrLPlQWyCNlu
 s4TDqE1xv6mQbCwsOFcQ6yP3ug==
X-Received: by 2002:adf:e9cf:0:b0:313:f61c:42b2 with SMTP id
 l15-20020adfe9cf000000b00313f61c42b2mr3061083wrn.69.1690926520487; 
 Tue, 01 Aug 2023 14:48:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.174.59])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adff2ce000000b003176053506fsm13386334wrp.99.2023.08.01.14.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 14:48:40 -0700 (PDT)
Message-ID: <9de18290-27c5-c269-31c8-5c371a7858aa@linaro.org>
Date: Tue, 1 Aug 2023 23:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] tests/migration: Add -fno-stack-protector
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20230731065904.5869-1-akihiko.odaki@daynix.com>
 <20230731065904.5869-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731065904.5869-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a5BEXDfqwexH

On 31/7/23 08:58, Akihiko Odaki wrote:
> A build of GCC 13.2 will have stack protector enabled by default if it
> was configured with --enable-default-ssp option. For such a compiler,
> it is necessary to explicitly disable stack protector when linking
> without standard libraries.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/migration/s390x/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Queuing this single patch via misc-fixes.

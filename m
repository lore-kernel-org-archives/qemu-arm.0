Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp531046ejc;
        Thu, 10 Aug 2023 02:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFNH5Kt6g94bxtOOUtgSbFFdLumcQqGvo3sAOp3PiKeoc+dvsRWCjW8gl3s29V6IQa7uBO
X-Received: by 2002:ac8:7d10:0:b0:40b:f548:affe with SMTP id g16-20020ac87d10000000b0040bf548affemr2238725qtb.51.1691659073826;
        Thu, 10 Aug 2023 02:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691659073; cv=none;
        d=google.com; s=arc-20160816;
        b=rtTc+yIEG7IUZMUCWlOIyoKgGAslc2FGRE51oYeFDTk5rPPaLAXt2d+L3mlHIYz3jA
         Uhg2MoovLJUavPgTvyGTUd+TXZLVxBkfXExOadkqWGUuSlAakz/Qa/qURNnBT+db9u1t
         0bvFuDAx0USCrSrXzU9/BNYeUUg0bDWNs9xj4RmF8HvSigtPOsgYXF5Sf/HzCbxi+wwP
         +onHQDaqS8q5El09xX9cKTHsDN0Y0sMcm2352BB2rctBbBGP7fwowaArGz0fx+5JYnsV
         uJ/SbvEcISJGkEwm1Pnw3o2wKpJ3CgY3iaAc6RCwR5dgQK79CyQcMYTc8CY/Ui3wYXuE
         Vt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QQf4LquBd65ySTnhKk68cIBvF8eXymDszmhfrBPoOXM=;
        fh=zlpASWiFX/cotIFAyrriCRJDmFpobIKVCGxuAsr+eCQ=;
        b=c+oQHLsm65E4TM0Ig8KYget2Vx8bwvblStK1lqml/BEoOP3/XhvGJbPaYAo3EfejW4
         yTPUErL+Dhx0DOfXDRDDB+vRvvsdAtg90HHIReafPw3FACNsNZl1iOPuh4Wd1BW8nVC+
         Yha+LMc6+Rv6IvgL8h2QYMUUbhMmgXOi+ZuMEadQAwZkB/Vj6r5rZN6pEs/n04FQWYj6
         cXuSQTkYKWMwQX6o6wKA8lb+MZHUqkvcFSEuN8FqtCRtwR9lv9s1F7Q4Eu627ox3NDfy
         CAb5kG2ql8l2cbbhwt5mI4KKMreZyHlPIjKdeUQNJFhGNy2HmeC9kfcEsZElKVeh5ORL
         dicg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EzT9qs7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f35-20020a05622a1a2300b0040fdf118c0asi661103qtb.67.2023.08.10.02.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 02:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EzT9qs7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU1nf-00031C-EX; Thu, 10 Aug 2023 05:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU1ne-0002vo-BY
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:17:46 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU1nc-0000F3-RX
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:17:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso5914885e9.3
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691659063; x=1692263863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQf4LquBd65ySTnhKk68cIBvF8eXymDszmhfrBPoOXM=;
 b=EzT9qs7EF0FCAf8FT9mNBnTxzVfbxzvYti8Z4cfty3I7+xW+D+IxjrdVbLbmLVNzzc
 r3LCTYuY+aSbieOgqUrFI5aBI4QRMDjeoq565fhZT4vokXEbzR5D5lF/tmq+PQec8M5A
 5gsNG4TNfKPdK1fTBQn3LU9/QpYX64r5KdRKsKtfuw96ncNoaKf7a66sAK7g4+S4sidQ
 72ORPnxU8jcYlVIH6OAey+eI5JYo+auC3oJ27H5vHeR38bv/L4Z3XivRPhZFWy47Oep3
 VAWEf2yNPO8Y5J+mKQ1pSpWYXjrCsroclNC9IzUx+Qnl7uT2HKLNeic+Sd2XIPCwi4dK
 2oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691659063; x=1692263863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQf4LquBd65ySTnhKk68cIBvF8eXymDszmhfrBPoOXM=;
 b=CThzZHihjWo+Na53/p6Hw5sI9quvYHU8CYXxsfYJTGqOinS54ZEQfnzK/SIVdkV5/d
 cmssE7lcEXHlQbwFS5ZtA4a+eaNl5tW2yif7nRMu2JNpbuegg/4rmze7YeLoQbAae2AH
 J9IK0BTRsObAQAA9/YP19GQ1spoLKgOf7PrW2XWRuHB2Jk3wUtHua391Ml8Qfv6ji+/a
 nElUzgqVO2VRQbAJx1blIMEgOzXCUZHongF91yp+po7L7XiKKlVMdMEuD2dbQh5hdPsp
 QHTqVj0MNFDoHLpm52rDoi9hvPsxXYoIIZhSdjkiZUg6qvrdbYcBInYgYk4COuZd89hO
 ApSQ==
X-Gm-Message-State: AOJu0YzHQgGa93UcRa1wN/FgutjdJ1eDnrz6taoIvm5NdQ2dWLlDHQTa
 af38oD4Y3WTsc/8RgapZsWJMCA==
X-Received: by 2002:adf:e689:0:b0:317:690e:7b39 with SMTP id
 r9-20020adfe689000000b00317690e7b39mr1643959wrm.12.1691659062935; 
 Thu, 10 Aug 2023 02:17:42 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.65])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a5d4d42000000b00317ca89f6c5sm1499244wru.107.2023.08.10.02.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 02:17:42 -0700 (PDT)
Message-ID: <183b3243-e61a-12fa-0460-73e417bf029d@linaro.org>
Date: Thu, 10 Aug 2023 11:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/6] mips: Report an error when KVM_VM_MIPS_VZ is
 unavailable
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20230727073134.134102-1-akihiko.odaki@daynix.com>
 <20230727073134.134102-4-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230727073134.134102-4-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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
X-TUID: KYy2iO4ngXpV

On 27/7/23 09:31, Akihiko Odaki wrote:
> On MIPS, QEMU requires KVM_VM_MIPS_VZ type for KVM. Report an error in
> such a case as other architectures do when an error occurred during KVM
> type decision.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/mips/kvm.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


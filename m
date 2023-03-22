Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5409068ejb;
        Wed, 22 Mar 2023 08:16:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+aVW69RIxKo1b+5Qgbp4QjWPxi3Vbp1tncGbVnRUGvmPcHTrY8ZvoXwiZaMWSB6m41KykZ
X-Received: by 2002:a05:6214:2303:b0:5cc:c4a8:a5e2 with SMTP id gc3-20020a056214230300b005ccc4a8a5e2mr6121284qvb.1.1679498188686;
        Wed, 22 Mar 2023 08:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679498188; cv=none;
        d=google.com; s=arc-20160816;
        b=Xo/IP/39658NXDRrLcQY1dsiXn91qh1JfRTs5rvT4xkY9PXs+7S857cgbpuK4YmElK
         BhVmTV4IJeO21Vh3bG0v70Hk+H9y6OrpAJ3MKRycf0lN0/JCubCutHAn4c/4zaXXXlYz
         Tp8QDZUj2tjGzQBRZVwjv4X3cjPNOHYIciPE89e/OgpcH+2eAJKZAsixY13C7RDR4jpH
         RbYR48Sjek4BEVtPbyoPvbD6eWuf/4JUgplrpusB6Qqyqk8axm84YBK3TRoOHXDOlmS4
         O7cot0BtnyHpJYF3fg60Rd90GDis6Gr1Q8NqxS7iK4knKPWH9EdHEVvlKtJtRKwubq1l
         yauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7cchShHRXBc1jyZohxMKnKYM0wwjzpottY+XY0NIlmY=;
        b=0p31nID6O3x8PAqUy7guvieZE4MXTwGlbl8ny7SqifpMM/BrWfnxyCBGKVXCXT8bLN
         BiTbNlDwtQSyH2hE5Ifw4OnWvNMxSk6HVHhQtUUL8HpR4XbMMNyh6WTzrAVolBej8g5f
         Lo3NvC6OgFPSrtFcLrnpp2vZEfDFnQep8CRdslNm15SkO8wvvPRZukPt+7x1cQGmigYt
         snukglV35uz5arjfTIFbdwif3cFzud+Hp+5lfPlv7cHGY2ZzkU8pEiad5h5wKq3/UCM6
         5YcHfd189LMuZLBMmFQQJlg7HVnP5koXX64zmfUupVW+Gs7gwmx9fHptg+PBlKUQ9lTH
         W+hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8hZ7WpS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3-20020a05621421e300b005bbeedd15a1si5456659qvj.584.2023.03.22.08.16.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 08:16:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8hZ7WpS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0Bp-0006Jq-2w; Wed, 22 Mar 2023 11:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf0Bn-0006JM-AR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:15:47 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf0Bk-0006ny-Mp
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:15:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id c18so19558400ple.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679498143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7cchShHRXBc1jyZohxMKnKYM0wwjzpottY+XY0NIlmY=;
 b=J8hZ7WpSqmUe5jFQeu7aYn4qld/xNTgY82A7AifWtdBVuNKTQBLA7KCm2PMOAL2274
 Eu0NdL0AoXdofC9Jc3QXHgQomrm59saxR/LsI+y70iC2eB2fCkzKFV2B8qKgMHYW6eEE
 SXsQiJIsnHkP9IAg+RYFOuFD9+Lrh9Hf0IE4xUarDkxbTbtbpZqV+1q6gQ7iLrxN+3th
 8GvBxCxbn6kNbJkKfW28FUwCTI56k4O5TmscfU52Al92QpbMSqvcR2QNQKAdYpPF+KTH
 Ur1xCzt1+SOqzXEYNzgXEAvs0576aO7qVU23mmPMrOAnIpXTYstwtlJ+JVlcUu7P5VAq
 SO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679498143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7cchShHRXBc1jyZohxMKnKYM0wwjzpottY+XY0NIlmY=;
 b=3xqetkhRcrMUgNyIujA0CTdfO11KfyM0VQPzAbXrsZPRARe5zjj0cSZUpImX8h/s0V
 UuKfPkLRyhWlroKMN22/75XrWBoN9XjpkX/VgDxM7qYbUXnTZVRu8SO5eRQNOv9rlpU2
 BAS5oEBvcr5+jLgqULa1PEhhgBDiNOD0sPRw8NYxMq36iH92+Gl+Xau2W0/4YK3pvgmw
 L+aCN1172YRNLuDrPmUTGe7P87BFABZA/NMoi7rl0YURnRLdNHJl0ksan3gGlH2ZvkI/
 a8jnxP5KuM6V/GdGr+x80+MFTm4+MjdA84AJm1ZFHB1f1XYBpwwnkYk9H8wYEmaYlb02
 lJBA==
X-Gm-Message-State: AO0yUKV/qFq7Z7VL8HdvPam1bCuKBKCIkEZI1RJZitjnPsFKV6z/3tOv
 nE5SnEXysABNO1twZSDmV8B6X78YZ3Sx1d+Ecj8=
X-Received: by 2002:a17:902:fb50:b0:1a1:c945:4b23 with SMTP id
 lf16-20020a170902fb5000b001a1c9454b23mr2746606plb.65.1679498143000; 
 Wed, 22 Mar 2023 08:15:43 -0700 (PDT)
Received: from [192.168.7.182] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b0019aa5528a5csm10696384plb.144.2023.03.22.08.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 08:15:42 -0700 (PDT)
Message-ID: <f4d1705b-6163-37d0-8516-637aaf7cc796@linaro.org>
Date: Wed, 22 Mar 2023 08:15:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0 1/2] target/arm/gdbstub: Restrict
 aarch64_gdb_get_pauth_reg() to CONFIG_TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
 <20230322142902.69511-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322142902.69511-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VjdJPdFCcX6M

On 3/22/23 07:29, Philippe Mathieu-Daudé wrote:
> aarch64_gdb_get_pauth_reg() -- although disabled since commit
> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
> gdb") is still compiled in. It calls pauth_ptr_mask() which is
> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
> 
> Restrict aarch64_gdb_get_pauth_reg() to TCG to avoid a linking
> error when TCG is not enabled:
> 
>    Undefined symbols for architecture arm64:
>      "_pauth_ptr_mask", referenced from:
>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>    ld: symbol(s) not found for architecture arm64
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)

I guess we should move this function somewhere else, because KVM can certainly use pauth, 
and we do want to be able to produce nice backtraces with gdb.


r~

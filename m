Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B767DCCD1A5
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 20:13:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAwG8-0000l5-2t; Mon, 20 Oct 2025 16:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAwG4-0000k9-NM
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 16:13:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAwG3-0002g7-5C
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 16:13:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so4256368f8f.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 13:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760991209; x=1761596009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+zoKNK2w4s/QFCCtn6WgxyW0olNXNFTF+1SMk5AG7iY=;
 b=gsHDArmwTiOCkwXHtco8rqenRvVZM0E8Oc8wX8qK7TBDJ6Lw2d7ajIHM+Kpi12xuYf
 zdtPq7a9gWyl8KyzUHTX653RTRzhowCWaIc3O+xrKBaEv2n04qe9iuk2VQEkTAm5h9t1
 IffXqvO9/VBK1H6GluCLHtBvPlT3nRVlCMIWFLfK1pxkuVGhVua36qD8olbRIkNmp3M2
 6kyy5UHhd7nVQxe6HEU2R1xOM21PTfZhKuawwp+AWNAWohypwc9Rmbw7st4KPXSLHlds
 UAGLw5J/NxX8rJ+95/7+OOyehT6dTEUH61T9WT/zfEm/Y28nEj4piUV+X4Wv+xcLSTAd
 P//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760991209; x=1761596009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zoKNK2w4s/QFCCtn6WgxyW0olNXNFTF+1SMk5AG7iY=;
 b=N/Spt1BGoTswfDYPzuI3xeB3QpR7ihqvr+Sn8gDCS+UI/Kt72YksKC3iKWnKqy3W2b
 mSUOdlrML8rarg3d400NkuJUJxDffOhfk9jAKQYUl8UkxphM9dU9YB12F2o7tfiK+aFc
 WuqjQt9uNvJM/phQmvAWh2d+EmsjsEQuBrzUSakC817asQoRAPW73a8Ff0GW5fV5GTvF
 /idnSwtLLJWTNFbdzH2Mq6/Wqn6q29aRKrumy5hw4cPmWw/yke6U9uQwucu9yhZgyr/D
 xbGJjTZ7hkmkT6nw7MzWrSalhHIvW2wCjIS1d+1VJMaB4nfN3Ym3bdSwzM7fNOviAovD
 MXzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuGO0gZQ7sDkuOQIAb/ZrqMtL6UmjQKhbjiusiM/GWEoOo/cPH59LIVFdlu7tmDtKcAAs52bFaOw==@nongnu.org
X-Gm-Message-State: AOJu0YxPFOtOoF0fCJYLUNzKqZXlQnfW3fJatb7f7Y9r9T76VMPseSSs
 3B5lO1j5OWunUadShUe4E5L0Rx37bhFucbkFUbYm75iuGd8pIPuj44Ps6gtn5WRtQ7HhjUS3l+M
 vJZx0MEU=
X-Gm-Gg: ASbGncvcbAKgvm0q7afqL9gwebvfvOfXii4zX7hXnYAGSuuHHDYpGMfBJZSPEnam7IT
 zN6jyVcnH2EA7nQos4fc9GcTmWjCWUtS8SZ5OQty+4lKV1Isx/C6Gs4OF22tKjMPeNKUIieg6dw
 gzGzc63adCh+uf+V5kNR1mBbxkUEOHGM9XHUBQNbrqOtNUPFEiWINPhFtdrWLP3PNfr8IDHpWkQ
 o1cmaFKpwLZh+6R/dcpCKDk2bT5b+lziqN45AMt3oo+KYE83hjHv9zuTVLp25gy6+rhonwt5IfA
 ni5iHk9Td3Ei5r0DEY3o/M8TpXg9lXPT4/HCCabwEtk9jKA8Tt638gABjNi3KFhB+JJBuUeYvrL
 iV3VSJlLnBteRzEUFuTvbyn5RmAUhdWyeWEgSzPUmamaPhckjwUQcLHSouNZ20PpNieV9W34zVJ
 uCFbnKRdA9AACzis9Q3N7Q7JayEKVcgsaqUw27a1SwA/I=
X-Google-Smtp-Source: AGHT+IEqPB/hRgkPJ5+R53aF58Pg77t93tw9HmMNwktTH+cUeYXHWw/J2BomTHalAZd0cwpuZqBthg==
X-Received: by 2002:a05:6000:22c6:b0:403:8cc:db66 with SMTP id
 ffacd0b85a97d-42704db5bb3mr8800830f8f.32.1760991209208; 
 Mon, 20 Oct 2025 13:13:29 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496c14a26sm1216815e9.4.2025.10.20.13.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:13:28 -0700 (PDT)
Message-ID: <f8c2d8a8-6d9f-465c-921c-1871ca40b111@linaro.org>
Date: Mon, 20 Oct 2025 22:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] target/arm: Implement SME2 support in gdbstub
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
References: <20251017153027.969016-1-peter.maydell@linaro.org>
 <20251017153027.969016-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251017153027.969016-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 17/10/25 17:30, Peter Maydell wrote:
> For SME2, we need to expose the new ZT0 register in the gdbstub XML.
> gdb documents that the requirements are:
> 
>> The ‘org.gnu.gdb.aarch64.sme2’ feature is optional.  If present,
>> then the ‘org.gnu.gdb.aarch64.sme’ feature must also be present.
>> The ‘org.gnu.gdb.aarch64.sme2’ feature should contain the
>> following:
>>
>>     - ZT0 is a register of 512 bits (64 bytes).  It is defined as a
>>       vector of bytes.
> 
> Implement this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configs/targets/aarch64-bsd-user.mak      |  2 +-
>   configs/targets/aarch64-linux-user.mak    |  2 +-
>   configs/targets/aarch64-softmmu.mak       |  2 +-
>   configs/targets/aarch64_be-linux-user.mak |  2 +-
>   target/arm/internals.h                    |  2 +
>   target/arm/gdbstub.c                      |  6 +++
>   target/arm/gdbstub64.c                    | 52 +++++++++++++++++++++++
>   gdb-xml/aarch64-sme2.xml                  | 14 ++++++
>   8 files changed, 78 insertions(+), 4 deletions(-)
>   create mode 100644 gdb-xml/aarch64-sme2.xml

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp560006ejj;
        Thu, 23 Nov 2023 09:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGHVq7hLfohKcbZ7+Mj362M8+xSWzXg5c4/KSnMmWtM5+L9P5pfV44HpNZnmZvDrMWo0rC
X-Received: by 2002:a05:6214:952:b0:679:e611:c84b with SMTP id dn18-20020a056214095200b00679e611c84bmr171672qvb.57.1700761231635;
        Thu, 23 Nov 2023 09:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700761231; cv=none;
        d=google.com; s=arc-20160816;
        b=Rkec5GEFX99gq00xFKrPg9w2/P9ljDmNpIfU+Ky/vX40YffSriTPwsws9rjfcZoy8F
         7blfNx7vVNQpxLz/s8YbkwB5DDmD6Nau4Sd9sE7u7w1I6awQuARDU56C3E82lCuatJbZ
         pNYmXHpNncXq4xi+fjJa0JpiiWlflKLNFGGEdbfs2CUwAcLEwXKmBEI3z0OOlLTa+u6S
         LEWEJ7wmlItzSMVw8wxi/mXv4JOweP9uZ8d3wsD3+c/glr9K8vcuridpDFv8Z5ldHvXl
         nbm2wGtPlTS0Q8zqVMexsZMr9SIwdy132yjGVQg+VDGRskoQSFHtRfAB4Fno67PhIm96
         iZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zoQw7LR6l5Q+I59aE8lGQNHXwu5AaRNtWtfQmuWK56o=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=w9+r9bG3LNYudUTRIsWPlWg+npJO2sORcDGvtxZPhaKP38C1JiuIXGb/r6zYsn+Q9i
         XOR3AwXFwbBQF1L8rkK0oRXENz1RmFOdTl1iWHVfxVexFlz4/Tv/XhZi+PvZrEYjU0xf
         wqmW6XE8gB5EcQ0liT3offpBQzK1m2Q7H/csCg7lFY+dqGaNKQgg66tp1XTeHocBzt/b
         778nS+xaoHG3dypaIJ/8LKowbdvxlYm3EKzRf05rGhK8EUVnbrn66zDhwXmBHNszZB0F
         JJYgbncL82MbMtT5TV4iFCBi/gnIMak2bmPUq0JhQNp7O89BJEYmYxLW+kK61fUQ+Ukc
         rMqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TOdIsqWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ef20-20020a0562140a7400b00679fd40f6desi1508004qvb.407.2023.11.23.09.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 09:40:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TOdIsqWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6Dge-00025Y-KV; Thu, 23 Nov 2023 12:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Dgc-000239-0p
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 12:40:22 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6DgW-0004oC-MD
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 12:40:21 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso723168f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 09:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700761214; x=1701366014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zoQw7LR6l5Q+I59aE8lGQNHXwu5AaRNtWtfQmuWK56o=;
 b=TOdIsqWJ3lYkGiF/NRJJwFTNWMdp7/mVq9phkKxOxqKR/u2vJGNQFxn7E3sFUSMkXB
 LFs6ut3cDHK+8RB5l8GB0+C/MOUtUPzx3fmELeRY5VVNUNWWLwiwhQY8rTdkeowKgPo0
 YKpKOYPz8LWWVD9wxV/ULCcSO4rjKYP/GXoqGdWwLT55UKh8UnhKMKPANuBAPdeqNnQN
 pdMYLnnqIBo+NwFCVy3mFwT0CjtEkNg1OL0mGCkb3pQBiiEdF/VjZaJLUwTs1azVqki5
 98qrPRz/RINrxhr921ZT3LevAQ5EQb6Rxb4K0wUCILsINefSoRHfb8eGRIEGgIcjFeLA
 oBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700761214; x=1701366014;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zoQw7LR6l5Q+I59aE8lGQNHXwu5AaRNtWtfQmuWK56o=;
 b=fDQUUE4LEBPaAzCjQM+2VNrdXQcSKzClaTXqsIj8Ff8CkusQGy/yJGLzYg0LzF/njE
 Q1PiUhiwfSelw4si23QRYZJO5Jh+6cPk1Cf8MFIgZDQlHUpOH5TbVr9RDMuQ1D4kT8aK
 l7H25Dkk54nvKDh5fjSAjaIcLPB+hDg8zqLmzIuzVOO8lQUs+EUodW2ZpB2v0hR7tPbI
 QwGvR7VGoPHjZKLZeUh7Q60YO5hvkuiwrrsZhUyxs5GdkSxWkM97n+EKNfjDZO6OVq7I
 jIvIof9vUZ0trRjBVN+s9hXI2jvOngrkkoec/rY2r/nTu4tG5uEbUAg/zby/3mxWg6Xo
 EVjg==
X-Gm-Message-State: AOJu0YxWGhS7pU/cPnRBNgLd2Y9bpIvrIT+ePTDfvS6NICEVDn+5Epuv
 lDXdU6uHO9AxEikTO8Rq7Qnc1YWSC3S4nsCYwz4=
X-Received: by 2002:adf:ec04:0:b0:32f:7db1:22fb with SMTP id
 x4-20020adfec04000000b0032f7db122fbmr125168wrn.28.1700761214373; 
 Thu, 23 Nov 2023 09:40:14 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4209000000b00332e1fe6ebfsm2232662wrq.111.2023.11.23.09.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 09:40:13 -0800 (PST)
Message-ID: <cb8808dd-00bd-4569-be15-9d8f2e20b1f1@linaro.org>
Date: Thu, 23 Nov 2023 18:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 00/21] target/arm: kvm cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: viXndkw54Q8R

On 23/11/23 05:41, Richard Henderson wrote:
> This is primarily concerned with merging kvm64.c with kvm.c
> and then unexporting everything that is not required outside.


>   target/arm/kvm_arm.h   |  203 ------

Unrelated to this series goal, but I notice half of the API takes
CPUState, the other ARMCPU...

$ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
       16
$ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
       14

Since this is ARM specific, I'd expect it always take ARMCPU, and
call the generic KVM API casting with the CPU() macro.

Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3320349ejc;
        Wed, 15 Nov 2023 23:52:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXxTbkU+y4ntTNmMOneIDm2eY8Hc47US6T3xy0pTpEFOOLLDHXK55D/JVfk6L1HPZ5vbZt
X-Received: by 2002:a25:ac48:0:b0:d32:f2e7:7786 with SMTP id r8-20020a25ac48000000b00d32f2e77786mr14257079ybd.56.1700121131815;
        Wed, 15 Nov 2023 23:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700121131; cv=none;
        d=google.com; s=arc-20160816;
        b=eAAmRRZHLGlsSM1w9uUoMW5mtXjX9In4JKRybTkJpmnZeg55/58ZzjmNpsvoICEUMQ
         7nEKzk9kNDEwdNj6kK7YpS9AF7u0487A2hLSVaPkHFXv/YQ+iUayY+zg3gqRElPRMufs
         L+GrBV78E3m2pkL5Rmi+f+/IwUTkoD81ku/k3ULrhqJc+g6cG46OkZFWrLVJ9WyapS2n
         ecUEgxTDxcSG+BJ/bjKDkx7TyFzfiaYUd28ASjyo6U6KLzYByN32Six72yjK+fZ70hv3
         P3xwi9tbUJnsq8D59gl5i064yeRZKeyd/3DBsEXc97psClK8wpAVOXgb6OoNGlHIjQee
         DOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CcGc/F3HmXGhqHi4Jn0NHvvOKQ2BV2fAcF7rQNbl5bw=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=iTyPv08CFQJB6yOEzZoJpKRCUXn9jIzweWKYfzRzrt2tthLC7Q/TrxFMqVTN6OGpIa
         9n2mEuybrOdp81CqZ5uNE4EfwIASUd0HyExrzFqpS7cMnLvuePrqtgiXHyF0smsfCAYk
         lpYH7ejv0viwTOBugTTQ656MCrK1UsO/fm/KuC0JGKTAhkIK0+Ik4tXAkzQP5ulsytdO
         qn6tJoYihCH3nZd3Xw3PyQNZCC0rNJh/zbeI6pBteNl3w8XJ7EKjKy2ugwe+me6HPmLG
         mx+mNcCpPcAn4hKIr/7SCwKZSri7YIYtTrLCxkI4eKIdgw82L5S53CVjsqw4fiu9AIqG
         bZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4SBR5F3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020a0ce60e000000b0065af7163b61si10809775qvm.82.2023.11.15.23.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4SBR5F3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3XAV-00020n-9J; Thu, 16 Nov 2023 02:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XAT-0001ww-Cv
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:52:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XAP-0000oy-85
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:52:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32fdd0774d9so370789f8f.2
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121120; x=1700725920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CcGc/F3HmXGhqHi4Jn0NHvvOKQ2BV2fAcF7rQNbl5bw=;
 b=K4SBR5F34GVApzMFdlfIDaClS3hVyw1LhXmdf5U3SYkQbDQfmFWRbwEOCDSwjKhsig
 6zVp6hndJtpWbomvkWqPA4p7b5B1BPkUAZ2347c0k9l2ZqVi2dFfz/T5O2MaIg5+n1p7
 ppSILkUlEg5RlS4akrJ0KREqEVL44X6TUTpKh3G1Eq4FYpTuYxBFC+5HkO5Ggl7NjEub
 iDftdoXhNuwIMP6brqgTf/CmpIDGu+yuh+KMEAOHDG6LF4oBRhraPvKy+B1FyYmzX58L
 m6+O+904zvYVBOVe8tCGqobihhoUNXEGKG6Kdpv0QZI4VlTIMU/2mQyqgwo1qbrxcaQt
 I3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121120; x=1700725920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CcGc/F3HmXGhqHi4Jn0NHvvOKQ2BV2fAcF7rQNbl5bw=;
 b=BFrt7tf8TSMiy0YQwRFfeC4D1G3Bcdcy+kSdi8pBZ33OBAGjBl7XVqQtc1UtTCQGKX
 ec0F1v/4lfiumki6CoJD/Z/jw/CkINgm5NdGASM0h165fTwOT7qiSne2H0zSvMs1MAN7
 jIWRc0BerWRHzz3YhJPMOUJYzLEmE6J1+tUNdXNcMPs6zghT/Fgeq9SyCruNCUXgNZme
 vPrDTh6Jn4doJIhTkBwY2XDIopyQ44hoP2lSJQBpaJP96157JSfJRv8hRXKcGF0+NQ5l
 fm9ydkTB/28PuxU9UX1EiE2EcgTWy0VNnoGlZstDlU6ji+s2bM4WzWrz10ZPeX7dNzMS
 tcXA==
X-Gm-Message-State: AOJu0YyhgidgdCH4enweplqYde6vgcZq3dEfj95RpPdsOOttVFKw7rJx
 92HaxeExDz6OkFtRtAIU/c3L2w==
X-Received: by 2002:a05:6000:144d:b0:32f:8008:bdbb with SMTP id
 v13-20020a056000144d00b0032f8008bdbbmr12413103wrx.51.1700121120029; 
 Wed, 15 Nov 2023 23:52:00 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:51:59 -0800 (PST)
Message-ID: <0bde6643-6df4-4a6a-88b1-d9501840a47b@linaro.org>
Date: Thu, 16 Nov 2023 08:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/31] target/avr: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-10-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-10-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z6k8Eeb4in2/

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
> avr5-avr-cpu
> avr51-avr-cpu
> avr6-avr-cpu
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
> Available CPUs:
>    avr5
>    avr51
>    avr6
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/avr/cpu.c | 15 ---------------
>   target/avr/cpu.h |  2 --
>   2 files changed, 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


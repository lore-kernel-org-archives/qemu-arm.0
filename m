Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1559939ejb;
        Tue, 19 Mar 2024 14:05:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+PkzOI/sbSqPhxFvcEuFRrjoKl3G/V57crJeapPEMBqN8gTK3SmNhZP9EmMxv7FdA2bzfNi1iO8jUDx8gbuS8PwjfepKQ
X-Google-Smtp-Source: AGHT+IExk+emE9TAk85FIAxG7dfIu+oPICHhF/aIdfrunKEb8IKGqACdhu6ncjtsDarZx6Gkllke
X-Received: by 2002:a05:622a:28d:b0:430:f049:ba83 with SMTP id z13-20020a05622a028d00b00430f049ba83mr2173327qtw.2.1710882350678;
        Tue, 19 Mar 2024 14:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710882350; cv=none;
        d=google.com; s=arc-20160816;
        b=yG1lbq4zxXtP2N+emS2ebFDlc85igVk9zKMuTBi652z0PotsaXzJNXHZOiG4jEKT+y
         vTLcNjwN+hoeAoj0yJZAmWQKeOzbJNioXNrqEEYFxPFQOcb3oqIR3SpwJyqn3R8I4ud7
         pAilkgkloUWPtv7p/FHrDCB5KeNV6F8dQwaA7wU7d+u35lQVmGmMhUmwj/5OVf4nuxy4
         MBkBn/8N/ixHk6zc3jRh0zOAhX7SK40Pp1G+j6K2nob4UoCnbWBIS4rO4mgiUlstiCgV
         D6QS4+xfaMDph8+CpRc4GTnQVQjfp5zukweApTTyArvc2TbMXoW6cEwOp2qFkJ57+CrQ
         ajBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xLFiRG6i/0q7cUBe44fypC4IiXjI+3Tqfxu8KSDo9D0=;
        fh=2h5AlPox5ZEp+GPyzFi/cdLijLd+gjoQrCktOJ6ZkTI=;
        b=deCtCVaI6GlFnEP/e+PYuuzcB8wrCDGo3VUl3w8uv+q5tQNFxfrZYQDL5L0jsAlfaH
         HkSSvziuzcRNPf1P3GXhMUnZqwdhE9Z91G3sQXhmG+VjmR9equMhuN6mcZ3ofvK6T8RO
         xGYl2DsIcQrZGRAaHmAUzILY/vrQtTUS/l4SeqGK6KslUb3SEXKGSCGLMV5nVgB6y7k+
         cUwlxGQXWM6JyA4/AwRd6Ko5Z/qk2EeZclhMUAEqnDbgeJfJfnTgO6ixhNEwqWej0IZ2
         B6KzubUVoQN3d+PC2MCXHmEHEkLkEhdNRKMeXI9DoW4I7J+jBMZIIlwjU7zHz1HVxexy
         7dzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2BBTP7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb13-20020a05622a1b0d00b00430f9aca00bsi613601qtb.341.2024.03.19.14.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 14:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2BBTP7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmgeW-00070F-16; Tue, 19 Mar 2024 17:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgeN-0006z9-1a
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 17:05:36 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgeJ-0006cS-S3
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 17:05:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5e4613f2b56so4610257a12.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710882330; x=1711487130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xLFiRG6i/0q7cUBe44fypC4IiXjI+3Tqfxu8KSDo9D0=;
 b=b2BBTP7w9KbnZLnFqXxeIMfBA5w+NcYzWffWdJzvhFZrzG+5GgO56l1ah539S+7Hjw
 5pnenc7eutQuFHUjTt+GB+zfdB6kt/Zubnp/h782LLWPxonBIQomxmOIofUTDjT0QtL/
 zYZTtUjifwbxm7J0QGGWBLTYXbKLR0B0DrP9IGuwf6RQV2EZY2f4ag57KdRY7SxQyych
 laFgAHPO5icQHKyNIRwrY647lLjf/OrG0kop/cNNEBpJX+5mrOrBwYnDqNEv3JT9AV7q
 miXy6ANNZNJOGaTzsp5brKHzATOVa0Q1MLY+VJs8T66ac40cavU6ziDt8PcjCsW4xViK
 nxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882330; x=1711487130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLFiRG6i/0q7cUBe44fypC4IiXjI+3Tqfxu8KSDo9D0=;
 b=Hry76JsvUmUmMFFNDpJiDRegi/dWlBdOPZ2UZVSHsBaHWD8cLd5vw23FwiYTvxYhCY
 szdh1cLjYGuJDllT/AjQIGcRLhfC8b/P2ko5ytUYRXLngRn7VXzxYUxq1brj47cBlDEP
 Iwb/PaBBY4FRcNeKUcn8m2EobPEmOgvTWwmhI4lni8+1+xBqhcKTq2syRes9imlEnoZe
 oqwgNQhs3wW7HuePyC8qxbRz7SZckjmodQSGKdp4CcnpKWRSfTc3u/Nugy9WB1qXZKiF
 eGu/xUYCOy0ni8ljEJSMpVA9QEED3Q99blkmQ+wqWH40S+tJG5KntRjEy1sr7RaKejEY
 mJlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7eF6we2nX+gIc9tCVLUfx9oxfxniDCMjGzIIuebCp6o5ZUl5rmtdEkxvanSaYzasApbyOhc4Gl3lrYurqDk23tI/4
X-Gm-Message-State: AOJu0YxfXA43rPtn5tXYrIKrn4IqyrpCJFPJQJhgs6yNDCvtPuObq3Cy
 7wNFcUyewfz1p3hp93wCGUTFxEyYi1Z2kdBSYEXt+QiF4EqaO+4wwsNJh/gy8gk=
X-Received: by 2002:a17:90b:46c8:b0:29b:f01e:b72b with SMTP id
 jx8-20020a17090b46c800b0029bf01eb72bmr12080415pjb.8.1710882330511; 
 Tue, 19 Mar 2024 14:05:30 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 w19-20020a63fb53000000b005dccf9e3b74sm9299393pgj.92.2024.03.19.14.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:05:30 -0700 (PDT)
Message-ID: <ad0792cc-a782-47d8-9a18-c66883d9f6d1@linaro.org>
Date: Tue, 19 Mar 2024 11:05:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 22/27] target/s390x: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-23-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240319154258.71206-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: qBLxKij8Dulw

On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
> 
> Note, now s390x_get_cpu_state() is restricted to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/s390x/cpu.h            | 30 ------------------------------
>   target/s390x/s390x-internal.h |  2 ++
>   target/s390x/cpu.c            |  1 +
>   target/s390x/tcg/mem_helper.c |  2 +-
>   target/s390x/tcg/translate.c  | 23 +++++++++++++++++++++++
>   5 files changed, 27 insertions(+), 31 deletions(-)

Why is the function in translate.c, not cpu.c (with or without ifdefs)?


r~

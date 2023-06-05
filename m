Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2999928ejb;
        Mon, 5 Jun 2023 12:21:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Dyf/vuhSPwbLa5vidq5HETDviUUaCP6HEU9TWhW+NOnFlFRVT030pjoJzEBlxwZHjtzlm
X-Received: by 2002:a54:4884:0:b0:39a:4ac8:34ae with SMTP id r4-20020a544884000000b0039a4ac834aemr3461412oic.12.1685992872757;
        Mon, 05 Jun 2023 12:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685992872; cv=none;
        d=google.com; s=arc-20160816;
        b=XQ4pmTv5kets0KQc1hyDFmSbYsw80gBjLgWx3dwUSGIZXeAwGwmLD+Jh/S+bBNXRGK
         dQEmsbywiziIAEoTAu7J2Mb34qYk3DEE4QErckrF2pXNbNvWxlZ+ovj1areu8cE2KwhY
         8ejaUfdvH896hlRVAAI7XQI4IWzUd3vzEmTsFAYpgLq0QmOeFfiouwzWZFBeVEtipJJL
         EzQxhtRmZsao/73i62hPCjWv3/hX7MfZ/6rrPhaoIJ1C5g+G3PMO01AXYQLVB26JEuU+
         IZLEW+Mc4qla38vmaf5+cK1YTF29Qaj9VHvLYC8QLVM+MA6jdlQBVIb21nBOW0dI96Hw
         aczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WKvUxMDBEDqa0NynW+IFv13QAzQLNVdLC9hRa2sG6hk=;
        b=DeJp/mr0dxf9jlgaBkTEGlwNziXR0VQHyfYZGXQm9r1HvCREzL/QjHGy3sU9FcLpxe
         uK1/y4WQIYQ8oK5ZC4/lz7BxRLk3q48+EF5dHhxaQ4czLLvHMzgiZMDrirEQvUlHn6B0
         IZtyqDl3KWZYO2g18Tu4kg8hr+HCKd9DJRo5RiB1NNDCHsKH2T6YdCbHz+E4ELsOvepf
         tFASh51IkZiDTt1J0ADarbmv3UOzMSOd5jTm2jMijSpQFY5t1orxsndEKYi2N9R3TGfK
         yZqRqccJPNuIoaqgj6rW7mtrl0zQ3Z6TdTarX3ODq+z+EwzpVOoyJad7aKvMBba6v7Nq
         8iVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zZ7OyjZh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05621419eb00b0061b5862a2a7si5171865qvc.595.2023.06.05.12.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 12:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zZ7OyjZh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6Fkz-0003vO-Bg; Mon, 05 Jun 2023 15:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Fkx-0003ub-AH
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 15:20:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Fkv-0000Dh-9a
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 15:20:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b01d912924so48709315ad.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jun 2023 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685992839; x=1688584839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKvUxMDBEDqa0NynW+IFv13QAzQLNVdLC9hRa2sG6hk=;
 b=zZ7OyjZhDmDhBL5seKlhL5/bwuksHZdDI7OR7VjQ58ZFapHEUtLWtY7tGEccwmhS4Z
 ViPXfMKw0FgUZQAr9C4ij6lJ2WlCYhpgO9XJ1Lwrn1ZQ9LFcgSdDShULYYd/rPRU+afb
 XRXsW26m0ZJShuSrVWR4Oq56wZU5tU9u44IHf4bsSnmyytyq02tqyuDd+J2/DYWJzKHP
 ABw6ryTS0497xHdeoIMypcYiPLH6th808Xr+42utnXvKOZ7nGlhEOhIjvFlt/Afp8rec
 SxJfVGVnEPzr1mU0NEVBpvYMZKHdMJzBYivl2gbPCFORPx2GvmooMMRr+IBbp6PCSa04
 3Swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685992839; x=1688584839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKvUxMDBEDqa0NynW+IFv13QAzQLNVdLC9hRa2sG6hk=;
 b=Br22YkhXtgq7SXuDvyGk6WFOPTGAoy+Qn2MFkbxMRnBHIFVMBLEWW6w+UxpfuoXVKV
 gPzfFmV6DVdBLUdDzSMHFyBHrviDWyA37xo0c/DoS+LirStUdUe/79LLrOcIiFoR5DkR
 tCkrr4PQ2OGisPy7xhH1VHjoDmOk4dVADS001rjAE2ILSObfh/C1Wf6l6EPpWutyTwlF
 d0ZmwEzVF5OXonnn46QD+oOw9i1KseiLGcNG6pth/UW3eKBAfc1WZWDPagbBmirM8lR1
 4j7PzC8Psy9l1Mp/cXH1Oqu9J/XuAt7gJYR3p3/RCPTGNs4EGUUq+swAKyx6InV/g6X+
 cMYQ==
X-Gm-Message-State: AC+VfDztXg/CTIn0KJ7Q+IE+bgulFOIeBUT//cDT62olO37SqVhO3f6j
 ZoYVsOpcDAhyHGVWHRiJiLIpQQ==
X-Received: by 2002:a17:902:7607:b0:1b0:25d2:6f11 with SMTP id
 k7-20020a170902760700b001b025d26f11mr7480432pll.17.1685992839638; 
 Mon, 05 Jun 2023 12:20:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3f85:a600:6a3e:e465?
 ([2602:ae:1598:4c01:3f85:a600:6a3e:e465])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b001ae7fad1598sm6934938plk.29.2023.06.05.12.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 12:20:39 -0700 (PDT)
Message-ID: <37464104-a3ec-912e-0ae8-f0771d8c4f1e@linaro.org>
Date: Mon, 5 Jun 2023 12:20:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] tcg/tcg-op-vec: Remove left over _link_error()
 definitions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <20230605175647.88395-1-philmd@linaro.org>
 <20230605175647.88395-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605175647.88395-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: yekjX8xbuMXr

On 6/5/23 10:56, Philippe Mathieu-Daudé wrote:
> In commit d56fea79f9 ("tcg: Move TCG_{LOW,HIGH} to tcg-internal.h")
> we replaced the "_link_error" definitions with modern QEMU_ERROR()
> attribute markup. We covered tcg-op.c but forgot to completely
> clean tcg-op-vec.c. Do it now.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tcg/tcg-op-vec.c | 11 -----------
>   1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

and applied to tcg-next.


r~

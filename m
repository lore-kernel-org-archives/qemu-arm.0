Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp151992ejt;
        Tue, 20 Jun 2023 02:07:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PcqYtr5TtNJSz6cTks3u8px2nlOsoo6P2u1rwWAvOW2jE4bU9Jxq9K17GVvaRD0J63yyl
X-Received: by 2002:a05:620a:6648:b0:763:b1b5:c610 with SMTP id qg8-20020a05620a664800b00763b1b5c610mr1016655qkn.3.1687252048631;
        Tue, 20 Jun 2023 02:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687252048; cv=none;
        d=google.com; s=arc-20160816;
        b=Vi9rQINxed3f5EdMoIUx9A5w8R61J0LMXeP62aMCWatmTkEY5wnTvLZAeVxdcGba69
         9+K3uxgNMFOQEq6rJlXl7hcrIg7I25ZpPdsByNrIwqQXA4ovec+0Xh+oFfX1u/bMeg+o
         4+Cx9nKyQ2zO/7s5jfM8dBez97qUxwh3W/dzLH5SFpdwI0W2sWw6xy4sCCk+0fML3KAq
         QnuUfk1fliw5zlY1RfLMXV1Y+AJxuGjh/ZpIoCHwGOFIBoYSXvAWkB9YD/GSQ85Laesb
         V8QolF4reqs1QAXkfE08eXcDANQTgJOXGXYNEZBdi/WAW+R89Yh3UlZ14OPaNqv4E29v
         jbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uEXy/sFbNilZkusZAAfg0sxo7ANWRwlcWgIGsfEGbpE=;
        b=oLTR3BXiO58YOpekz64QapUfKmDtOqja9Nc3LWmyyvwfzV4ijjuCRE09EftEQEY1bq
         6vBSrfSP2qFGRiopJEeJTqDNDNawAVCJJc3V8muQmilGqHURqWUMfHvJAnnkdAfbLT6U
         dqBW40hn6xnVclyX/j7MITjdmU3QaG8dCgOwZFCpOE7LSswp/hed/8yfLnHaDqmj3Mdd
         gDmpOpz3m0wID/zfIz5dzPXeCwqky22L7oMAjgy1rFG/jKANZKj0gIKVTmRhx3k+66Uj
         nyVURMhMRykuI+JPnStTNB8IJws+yhEZaiGyFMRegCjCHjwR0US9/3PyBWhToA6gwz76
         R/bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ECrUITd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23-20020ae9c117000000b00761fae866b1si644592qki.0.2023.06.20.02.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 02:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ECrUITd9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBXKJ-00010B-OI; Tue, 20 Jun 2023 05:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBXKG-0000zI-8k
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 05:07:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBXKD-0007qE-ST
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 05:06:59 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51a4088c4ebso4164029a12.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687252016; x=1689844016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uEXy/sFbNilZkusZAAfg0sxo7ANWRwlcWgIGsfEGbpE=;
 b=ECrUITd9L5kwoLST9rrbIvbOCvORuaZuBCYN/cXF9mb0PViwibuE/YiRCL3yByQn87
 w/j5WjS81wnEnrqMoVhxxp0XhE0ys32Aprz4PF7k3hMLG6kfkoCYSredIMFMiv/Vb6i0
 HY6l3zWTrffuU0SLC+U+Peigoagx0zZfizFAO42Ovt41p13Pwfrj9y26G3hzPcCmPCd6
 0H+TDmukxVR71ZrxPa8x6ep0RSydP5Hnlg4BH69YPm+LbqrPkVIhOVt7BeQeqsju402B
 11z7NM+GIZyJhomKSgE97L9rG9fmcBu4b/bUVf6GyxUC7ZrVguku8VxMwRpZ4D+Ouv3K
 aGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687252016; x=1689844016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEXy/sFbNilZkusZAAfg0sxo7ANWRwlcWgIGsfEGbpE=;
 b=fUa7slVCIxbrvwPqkN5abzkQFe7u5B5wovIGnfIhFF032QcnEQF5KM3d91UHnjWe4E
 bbnA6F9U+pOacuuE/0kAwRUtPRwZL2IqH+aX6c7FxuX2v7IXWuppYJAFxrvLnL0GNo7w
 gFRpkRD1QiTaghqkPtD7YuEMedFB5SYB0AHH/1Pe6OGLfQJ45tCJCKSgvTpgeLg7DqSH
 nxQ2msHV+jJeMprGoZmiPmiL87rVr2eYy/fIcvFwGjtL4IlU2gdUXZtblqo+Q8w+MRdQ
 uEVzqqUJo69LlA5vWHNmHtnbWzHG5M9luA9Sk91vm+L3o8qoia7kIoJpy1yY73Z5cHZL
 swqQ==
X-Gm-Message-State: AC+VfDyqI9cS8b8kwWrYnyqTfpuUfBEwET+kpOQHZq+A7cl43KZsZEOX
 bghXaDtliNoO7yv6U6Xucv29eA==
X-Received: by 2002:a17:906:da8a:b0:96f:e45f:92e9 with SMTP id
 xh10-20020a170906da8a00b0096fe45f92e9mr10060744ejb.16.1687252016017; 
 Tue, 20 Jun 2023 02:06:56 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b009663582a90bsm1019233ejt.19.2023.06.20.02.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 02:06:55 -0700 (PDT)
Message-ID: <9de0430e-c74e-27fd-6f8a-c858a70fbba8@linaro.org>
Date: Tue, 20 Jun 2023 11:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 08/34] target/arm/tcg: Un-inline VFP translation helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619154302.80350-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619154302.80350-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: BBVVn9rjrPfI

On 6/19/23 17:42, Philippe Mathieu-Daudé wrote:
> In order to restrict lookup_cp_reg() and set_rmode() helpers
> to VFP translation, un-inline gen_lookup_cp_reg and gen_set /
> gen_restore_rmode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/tcg/translate.h     | 22 +++-------------------
>   target/arm/tcg/translate-vfp.c | 21 +++++++++++++++++++++
>   2 files changed, 24 insertions(+), 19 deletions(-)

While set_rmode is vfp, lookup_cp_reg is not.
However, you could uninline lookup_cp_reg to translate.c.


r~

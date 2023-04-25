Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3721675ejm;
        Tue, 25 Apr 2023 12:45:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350aN9MQ01t8QsNxXhTK9rx1XzH0dmtcN0sAnQacyFvQ0aDgJTrfceR8B11zxvJOCkr2byKkB
X-Received: by 2002:a05:6214:e6b:b0:5f1:606b:a9ca with SMTP id jz11-20020a0562140e6b00b005f1606ba9camr25534401qvb.37.1682451900586;
        Tue, 25 Apr 2023 12:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451900; cv=none;
        d=google.com; s=arc-20160816;
        b=k3NCJ3ZVnDr5+jNAp2HRAOW5ydg6aBUONi765DtU6WQnCiKIgqYpa5cZfddoO3lVQf
         spP4ZvEQ0PFaTSaDJjeIUdqRqNLISbaEbwURTLpgnEahHoFEL68+/XWAWgv3VbSH0JEe
         VqhV7o4/ZzFnF3W9T4h5G4tir6Gml8lKcSExCSyUhD2rZa02ra22o+R5H01jhtC+Yty7
         WKQGF31/V4RTPWfiOpKmSe0jDrv0VngW3KW42WyAZegOVUTc7j9u5logO7zIkRnhUfKB
         DWWZ+0wuDIt3VxQVD7AFVfZcm9hv6Fjk9IlrJOkYk6BQ0OMRYzgFt3XHnt9uaEWQqBoJ
         7nOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xanJqR1ST0PgxE1tCfwv6M2DRF/CKI97TFDu2y4rmfM=;
        b=PcClavT+AD0nLdxdLT+XPQDNQe57HF+ySslZhiRN+kRBRcA4B+cZXU8qa+SbOClCsy
         OXZusZm1rb/6MbiRK1YHz0N6GfXx97S4lohcB4bqcez0N0jEUx0Lw1gtWuMLuABRK4qa
         MNW1/+azVbnicYLVcYZC2rmckViIip1pe/3QMC28NCUbmavzdBNSd7fz/u6nhgIS6Yqw
         U2e/gZjvD7t4rwwOGfIBVLSYxX81WoqGn5lHR8INje38ZJLLHt2MltwzLNhdnryfGL3k
         Ho5a57LXVTniLIEnEccIDTXozCE81eCW2pNKTyuZBwSpBR77//JTHJ23oxO3ErT7n74l
         ldzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxjQjwUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf14-20020a056214250e00b00571bfc39612si9669863qvb.346.2023.04.25.12.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WxjQjwUZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOXG-00024u-2j; Tue, 25 Apr 2023 15:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXE-00024R-HM
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXC-0007C8-L8
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:41:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso3759766f8f.3
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451665; x=1685043665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xanJqR1ST0PgxE1tCfwv6M2DRF/CKI97TFDu2y4rmfM=;
 b=WxjQjwUZHu0H5TMIeAH+QZN8my2K/KJ6zUfSaFH9ewB3Ddb6kNyJ/UXwtHh8LKVufz
 LuQABdHw1GxzQxJLvxpFhXd7+M1A4vDAMWOeW6csmoxbTxzG05X37qBoPxbPYJdQzld0
 FJpUXd6zIZf+rpaQ7lz2Um/NhOOAxrKO3cKbDpOE8ZwWP844cgZE62almH3slpgiZFXV
 VgljRksZ4/UWb8FYJh2Nl90XF35NqTma/Yx6PpEmAb7s9AWwkB9j0IAO/PxphG7j83YC
 KPKiluZlZEnlyEfRKqDmlJby9cmEzTWsS4lwCQK7OIVoTRAzVw+9fITjGl5KCt02q/RT
 2VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451665; x=1685043665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xanJqR1ST0PgxE1tCfwv6M2DRF/CKI97TFDu2y4rmfM=;
 b=kv7ZLnmyOom8fMhtJR2GhpPbb6fdGQ15841lptCpK79pOxhrpU28qY6zg5UWXGy5pS
 d2kvZjImoaml83Muc1jBv/+59JKYpnizhz4OzsvQNX44Z1lwOIGaTbj0TCiIRTE06kyc
 3/lGiIUE4/c8ouSPrT+qow6pHQzloFevXkqMa71qCjm2dn446CoRg5CEOFc5FzMaZ+fL
 qP9jyK6PTeEALJgfQYq1jn4oVJELH79WapLjTlVI5vtdTxlOs2dkoqV3go1t8LTBZ2DV
 xsl2uwFraEpJwkNjpg1XcMZobhNko2eYF13ufJ09BMpvObq+8JzOJbHGlpSKY68gD/x5
 us3Q==
X-Gm-Message-State: AAQBX9d/RAb2iPc8KpjbS5m5x3+sRwrntQ/0htV0YD2snLSOCyTAx95+
 ncbTev8k6t3jinj8NGleVymj0w==
X-Received: by 2002:a5d:428e:0:b0:2f9:b08a:a3af with SMTP id
 k14-20020a5d428e000000b002f9b08aa3afmr11021689wrq.49.1682451665224; 
 Tue, 25 Apr 2023 12:41:05 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfeb0d000000b002fb6a79dea0sm13961731wrn.7.2023.04.25.12.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:41:04 -0700 (PDT)
Message-ID: <b663fa7b-6877-97bf-d624-2196dc5aba55@linaro.org>
Date: Tue, 25 Apr 2023 20:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 02/57] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
X-TUID: Vys8PyEgBAfc

On 24/4/23 07:40, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
> extend if the register matches.  This is already relied upon by comparisons.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


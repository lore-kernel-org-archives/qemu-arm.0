Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1438931lfg;
        Sat, 8 May 2021 09:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTPRJCD/2RIDakJ0/tfamMCzQ30hbymQL1uM22tUSmDxOgwA1WGocqT3pzByvCtwrw64Mx
X-Received: by 2002:a25:9c88:: with SMTP id y8mr6406005ybo.294.1620492418026;
        Sat, 08 May 2021 09:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620492418; cv=none;
        d=google.com; s=arc-20160816;
        b=VhAzbt6Iy1BpyRS5wpNxHZ+B/Sg8lqkLt/rijI1NPgI6Hktir1WB7roYEWWbtsud7K
         bkY2GNTiU5rF/jUOlAMQsAfmQdqpthOkksn3LmZl8YyNkWvjR2K5nVkOfywqPEbIxGBD
         4aZbl/3Bln+fA4JsSdxK5eKJtEErhI+ZczGzqezwM1+lS/PvVrFDxIOcYX8w0RSIFuAa
         xWzV9j2T1RcMEZOpI7HrBeZmwJQi2NxIVEsmTlXx+JvyTxSKZEWYHO1VO7+xEhNDO9BW
         JBUm1YBRr/JHgpyj/hjJorPzCPvJ9F8wnQc7r7S79mRKgH/N48SJqksIJmqrUHXvLwgC
         g13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Pv5f4r8AVzNTxTbK2qo9dmP5mL6LlOL8gTSTOL3Evmw=;
        b=nj153NtmGburydt+D1uJo9CAiuE7Qwu/DqSQNEg697AgI7OHF66t+VqLiZQS+ZSI0g
         KAgx5TnUp4/KY1Yo+PIcNMfkXt+L3mhNDONWVg5DBpURT++whZ0qmzTa2UQpS0VuR3TQ
         oSZQSqheNOb9wD8zyrAsgbaZvCN/+QbnGg/T3qDPtENfEgErqCIYGqGkp1RlkW2N6sOF
         tE50ZMcu+LyLcJzlhu6Ayn8THncVDd+1fUzzkrhMGb6DRXPjx2whpNE6wniiLgkAnTyS
         T/UhvwCaHmMuG105Pp3eesMUAYY8hHekznDH63zPOV0MDuAkyGBGJYzSo37u030eJCIF
         NOzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QAoQwajc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si8273688ybo.392.2021.05.08.09.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 May 2021 09:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QAoQwajc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lfQ6T-0006vv-DR
	for alex.bennee@linaro.org; Sat, 08 May 2021 12:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfQ6L-0006vE-2Z
 for qemu-arm@nongnu.org; Sat, 08 May 2021 12:46:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfQ6I-0007WM-Ll
 for qemu-arm@nongnu.org; Sat, 08 May 2021 12:46:48 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b21so3101252pft.10
 for <qemu-arm@nongnu.org>; Sat, 08 May 2021 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pv5f4r8AVzNTxTbK2qo9dmP5mL6LlOL8gTSTOL3Evmw=;
 b=QAoQwajcPgceJxoS4qs3Kc/v8UhjiUCaK34aqESfru6UselHjZkZuXiA4TpF/jmczV
 EtOkI9OKpCRKy4LSqVoyLY34ygKidc2r81NSksAHY//v763schB0EyNqbHbZ/zVKJrms
 JSjmiBgVJdc7x4/yKiLQ2bTqFlfXGh6k0dEgwuRTfQGywp5oYJMK8eDyE08vtDqM4jGg
 G7UG4Dm3BERLqz9qSDmGGoHBfEmkvIefClXI1TGFEcN5jfczw01tWriMkhq/Tv1RlW4a
 PIIDuMpNC4BwQciQBz3RasVeHgoH4Bg/r93OCQrgj3eC0RP6u0xKj0wh6zRD0YdCKJsf
 FNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pv5f4r8AVzNTxTbK2qo9dmP5mL6LlOL8gTSTOL3Evmw=;
 b=arCsAPdMXWJ9odaIqT4TA5QqWcw8NGv+AL9+jv+4aDqA7vYrKYU6cz70doFtRteuFa
 nNk9TAq+ovQH3r6RuuWIMVcXH+mSMlRWzVA9H9mxUVmMf9F6CcbF0n04vV09FeU5xb+k
 PBRnmDXSyGr7WNbEEoE1UFkJsCwfZS686wtjxClZsfyIZtZDzFKdAJWFjXowTBk9gtZe
 FP8xq6yVGIy0IT7ie3AHG3zHgXrzIa9+89b6sQccCY8AZA0OeBABBNDlmgQH58hJxEOf
 zx7SjcA+JnTk6A3kN+6RJvZickcm1w7wnfiBAiT/WG5n4C4TlhTbeMHCd5DyER7KIVhN
 nOIg==
X-Gm-Message-State: AOAM531xFTsRSbbVcBjnUek2Yuof2gAEmwAS+rMCcKqE7DwhKLubbZtg
 b6lxnwujqFTP/NpX9Rs+Suv2ckl3tfblWw==
X-Received: by 2002:a05:6a00:7d4:b029:28e:2b3:58bf with SMTP id
 n20-20020a056a0007d4b029028e02b358bfmr15958939pfu.77.1620492404950; 
 Sat, 08 May 2021 09:46:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u12sm7321767pfh.122.2021.05.08.09.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 May 2021 09:46:44 -0700 (PDT)
Subject: Re: [PATCH v8 3/4] target/arm: Add support for FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
 <20210505030443.25310-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6017145-2862-71a6-7f49-751551e457a5@linaro.org>
Date: Sat, 8 May 2021 09:46:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505030443.25310-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cgk8SVU/8wLO

On 5/4/21 8:04 PM, Rebecca Cran wrote:
> +static const ARMCPRegInfo tlbios_reginfo[] = {
> +    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
> +      .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_vmalle1is_write },
> +    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
> +      .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_vmalle1is_write },
> +    { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
> +      .access = PL1_W, .type = ARM_CP_NO_RAW,
> +      .writefn = tlbi_aa64_rvae1is_write },

All of the RVAE*OS entries should be in the tlbirange table.


r~

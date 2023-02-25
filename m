Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2699323ejc;
        Sat, 25 Feb 2023 02:55:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9l8i8o+kS8rcqUL/fxn5y+Jmt7pC0H7AtW8Xx90aWT5EuVbntO2Y+23abNmonnGs+wxobU
X-Received: by 2002:a05:6214:da1:b0:56f:87f:d92c with SMTP id h1-20020a0562140da100b0056f087fd92cmr34378749qvh.0.1677322543870;
        Sat, 25 Feb 2023 02:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677322543; cv=none;
        d=google.com; s=arc-20160816;
        b=r3O9E1iYsPq41KBhaUq0BGLbfTaONwDk48UVQdn7OK5NvoBPk86ZCliUtqUBg/Ad7T
         SgVhVOgtep910RolOhyDeYgz1A9P0wYjx02zPCt/7wi/fhVT4iTE2ogGRQbBjoRpVOXF
         6iEDxrtS2CZerxKx0S/NxCFURN3mDia0bzAMqqi4/1Fe4qPLHwJFtCh0bK3et95sFxOm
         q1Td4qIjm5nwunAQRNMfsdwcqtZ/QDC0mb+JFgB72N6W0y4Lrx2t5/+jxuk4OSYsb3pJ
         OhL8WHL91kEyoNae8oCAJ5PlqjAocmlATEknWPV8rPpCKYL1WkNoeWe17PE0xp5L/ty4
         QjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TVnsxfYaBt2CtBMAa7FZVDvRgmthwIxPRt4F1C7FdkA=;
        b=zRAvmHJFdZF/L2zeMDdjWmKS+UNslVGRS9EEwEDgyS6VOBrjLdjLOc9qwYB+d5sseN
         OU+1dJEkbf9gAkUzrlyKi+GjXbDwTM2fao+3RoNjGxMoB1L0ZUc2A6TiDHuR4bwfQPhx
         xu4Nw/mXXx+WyhGz0Zn9E+PPtRC3lPijmBQgiL5OQhqwMrp+67tnFrAEoGGo18oFIclm
         4T0FK6laM2krIx9KlsR+mzZ4nDgKZob361JK6YmZCkr9+rTeQMtUau2QNt1P3KxatBIq
         36HG8dz1W2UXxl2lCa01YK+44KizQwMp0EzSv+HlQ9x5DdlaPzs+y8ClX/hYSgnH58z1
         0blw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iwFvvx3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17-20020a05620a299100b007426d8d3815si1696426qkp.237.2023.02.25.02.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 02:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=iwFvvx3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVsDC-0005gO-Qm; Sat, 25 Feb 2023 05:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVsDB-0005fU-0V
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:55:29 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVsD9-0002uJ-H0
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:55:28 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1722c48a773so2463782fac.2
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 02:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TVnsxfYaBt2CtBMAa7FZVDvRgmthwIxPRt4F1C7FdkA=;
 b=iwFvvx3jjcdixuRgy7SVgkh5SX3nYNOWPFAFT08pb1QHGlYBBQafM/tp3x1h81Z2yg
 U6wmYmJdu2IOqG9ELL5A9C7Xx0yjulpuKhLgvBHVsY+i8/M44HdKQcVSQRDLUAbd2vnO
 d3HNRp0wxxs9B+rD7BWMrC7ZnaOLfVsfFCXnlfX2BJOIyYOiGuzSLuJ1AEBj+Q2+q8+x
 tvCuy1MVabv4t5ZMJEIdzEUTOh8RgdP5Enq8Zwb1IXbICaWbac2Yxl6fwvbhz8aHcQpt
 bhc6z9OZM7iq9cWQv7tjGT0BVHA9tkKkjtMhNqmO/Sx/V3N3uBQr6vgUFCOnKlsj8/qQ
 pFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TVnsxfYaBt2CtBMAa7FZVDvRgmthwIxPRt4F1C7FdkA=;
 b=hO80OBrXH7GHfjzJzbfvUZnfEHkNxxklz3KQfPwybBIUM2Qm5Bu/NxtLN7cUO/jnpS
 Yy+5gH6V2VhokY/Hd/8HWLTo3x5gkSonej5WX+3rTqEGvRKu4oLVQ07JVwxqwrKBY+Lb
 nCJcLYMaJI6cknupMcD+IP0c8pPCfaxm3DsUVau0QvCs/WHnZUsPckKk/Ngj5qIoFH26
 ig2B8g0Icezyb3o+rQV2EBEbz8dJSWIsaR84akSaSKdeXBQ1lEnYGKGJZP0BPVTyUF71
 zS9D5lHoqjiNTjJ5nc9QtAHH3yQIjFQJ5k1FHRYqHpKfq5EW/cSgdgTlp7HrXMwSVAiy
 ovLg==
X-Gm-Message-State: AO0yUKWUxXSvdOHgnArdtZqBdd8fyfsX2RivaD9Sp641FIztobW3UyuR
 yAQaAAS97ckTaxO/mrsTdtgW9w==
X-Received: by 2002:a05:6871:20c:b0:16e:759a:6ad9 with SMTP id
 t12-20020a056871020c00b0016e759a6ad9mr15675666oad.25.1677322526203; 
 Sat, 25 Feb 2023 02:55:26 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 c82-20020a4a4f55000000b00500c1100651sm573486oob.45.2023.02.25.02.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:55:25 -0800 (PST)
Message-ID: <e4f6bdb0-2af7-e7d1-1e36-407610f7a355@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:55:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 76/76] docs/devel/tcg-ops: Drop recommendation to free
 temps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-77-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-77-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: 3U2+i5vLH49T



On 2/25/23 06:14, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   docs/devel/tcg-ops.rst | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
> index 561c416574..f3f451b77f 100644
> --- a/docs/devel/tcg-ops.rst
> +++ b/docs/devel/tcg-ops.rst
> @@ -951,10 +951,6 @@ Recommended coding rules for best performance
>     often modified, e.g. the integer registers and the condition
>     codes. TCG will be able to use host registers to store them.
>   
> -- Free temporaries when they are no longer used (``tcg_temp_free``).
> -  Since ``tcg_const_x`` also creates a temporary, you should free it
> -  after it is used.
> -
>   - Don't hesitate to use helpers for complicated or seldom used guest
>     instructions. There is little performance advantage in using TCG to
>     implement guest instructions taking more than about twenty TCG

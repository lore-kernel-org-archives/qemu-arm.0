Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1436581ejm;
        Fri, 21 Apr 2023 15:04:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZIiwlGR6HPXXMRkIuv1PmBmcTxP48LbgVBb2rvgt3nHiD3R13bmxMnN+WBPV2vxYIaK99s
X-Received: by 2002:a05:6102:2833:b0:41f:5d5a:b34a with SMTP id ba19-20020a056102283300b0041f5d5ab34amr3671754vsb.10.1682114642019;
        Fri, 21 Apr 2023 15:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682114642; cv=none;
        d=google.com; s=arc-20160816;
        b=nZJHRLrdgifZefAGgMUGPBRWWpH5eQGEoUulfRyz3ioKjobHPZ9mhFVz7kkyQdjoCM
         UlqWv+aF5oYavCbzQiE4/QF5pR0zSbtBNql/IAHM28VGDhsDavLFoMaD0qAw/32zUQxD
         u57TTHII3vNoaj6U7EM5yQVdJmaWDipoG01blSykORUCNUFG5crDph/cUGOlGOlsasLu
         UTOhPdt7DqbDUjGTXSPV6P+BbyvAodgNMHdrrZqH+9EzhQQQRip1HpDEjmjVqnMU9sxk
         +Vj42zhoFKXfb5YBk6aQvUMJg5Yt6WyZo2kvEmnhZIugieDAJQb9Mz8VwBk6kuimd8XV
         kmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MqdHGJnraiAb12CY7TpGU8LSjCrhPYjbFG/Cw8yt20Y=;
        b=VjdzgThDX6DA7bCRyjy+2UIQJecbI9Ij8us0cpXGnXBlEqdb/wz6adtbNiHoCUgdSN
         076J10jzCt1h9rZmXnRf7mRZIEaGHo3TwB5vIYLZYTQkalRdfeC1lyGPH6XEJ3TSIIkZ
         KDcKWXTY5JIIKKzgymN1BCKulcJDU8MllKPHfRF3bRpoNVX7aXlD1wyb8G66KDUx0C5Y
         Yt9nXfVlg1EWCSvgRUvz26KO+JZiHTc/4x+6L/ovNA19GdY+BwAMxe0nMv7WQGS4dymW
         cUs9kbO+LPS8d0C0pBhzoeFDefN4wWTFo+1G5iNsCzdePyE8uwhl31MWsap+geu+9lXM
         7WKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RYNe4BmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21-20020ab07495000000b00772efe53a93si1167746uap.131.2023.04.21.15.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RYNe4BmK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppyr6-00012A-BK; Fri, 21 Apr 2023 18:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyr5-00011o-EE
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:03:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyr3-000059-Qe
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:03:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so14945395e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114624; x=1684706624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MqdHGJnraiAb12CY7TpGU8LSjCrhPYjbFG/Cw8yt20Y=;
 b=RYNe4BmKX6cbKNFdZ/7EwJ8VdcpppsFbBSLz4AQKA+HIR6VCPznua3LrMvtQrHkfU5
 3gMn3JFsOgCsED4jsm6nudqTTlEz5o+/f0/DbJG1jQ2X434PO/kgppxGsGBHnXeD8UOn
 icfPOwJdJn+jLbRXot6YyK16mllB707WxBXxSt5z9SkEmVId7/yBBSf4jGsJQqLla9Nv
 eXwdbxFCiwYFZF1WVw/4SQlNCBZsmJ5U6IIueDWKMANAtVCoHI7d/75frRLhY23cnZ79
 q8ehGktrY1VSyJ9Q2NElqNgdc6qduVz3zhxgz+KevevVZTV7sMttN6cfv06zziBXRrj6
 XVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114624; x=1684706624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MqdHGJnraiAb12CY7TpGU8LSjCrhPYjbFG/Cw8yt20Y=;
 b=Y0SEv99X/aI6OKCS+JD2WenxY5DcjuKM8Uw+W+tDqUwjooBj6PtSp1VDy3OorhBfpV
 QrpjL082vVngTXLa4dHiWkI9IF52sRqcq+qxQn6/q6slr+iX7Dx6SEqlxCcdosnqWiYs
 AT3ssSaF20Q4mK1f8CBnxLSu300WW/3ePrtBPWOt7T7C00VVgyybIpP1z5rj6yTIpLg1
 sTALUCVOMLLjIf8Ogui5eRNdUMARyMxd4e4lVbFWoTn5dS4Df1y7aEuUoTppr3CxiPMi
 fKVLroKVgN8NL7BFncusfVeff2P1PYQ5HxxmIZlBHUC8r+mwurE0mx7P2C8GpMSQeims
 +VXw==
X-Gm-Message-State: AAQBX9elGsVhLBJB0Hd/n8G+/pIGjZKh2rlvUZe7UJT8+Br3cjcK6p78
 hG2CScdKHjLEfUM2T5p8p5vwFg==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:94fe:65e2 with SMTP id
 n25-20020a7bcbd9000000b003f194fe65e2mr2161093wmi.33.1682114623909; 
 Fri, 21 Apr 2023 15:03:43 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm12442322wmq.0.2023.04.21.15.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:03:43 -0700 (PDT)
Message-ID: <69a9c5f4-c1bd-d0ca-ce14-7b21ec7c35d1@linaro.org>
Date: Sat, 22 Apr 2023 00:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 06/42] tcg: Split out tcg_out_ext16u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-TUID: auk6OfIUJHYg

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  5 +++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 17 ++++++++++-------
>   tcg/i386/tcg-target.c.inc        |  8 +++-----
>   tcg/loongarch64/tcg-target.c.inc |  7 ++-----
>   tcg/mips/tcg-target.c.inc        |  5 +++++
>   tcg/ppc/tcg-target.c.inc         |  4 +++-
>   tcg/riscv/tcg-target.c.inc       |  7 ++-----
>   tcg/s390x/tcg-target.c.inc       | 17 ++++++-----------
>   tcg/sparc64/tcg-target.c.inc     | 11 +++++++++--
>   tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
>   11 files changed, 66 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1451457ejm;
        Fri, 21 Apr 2023 15:40:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZevrnL4IgVrNbtJ7rDRPOwFXwXECDtotH5Lo9GJKv7cCVEeBUvO3tRNhMGrerZL8IE2KOp
X-Received: by 2002:a05:622a:1a23:b0:3bd:140c:91ed with SMTP id f35-20020a05622a1a2300b003bd140c91edmr10786036qtb.52.1682116836667;
        Fri, 21 Apr 2023 15:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682116836; cv=none;
        d=google.com; s=arc-20160816;
        b=cVWR63kXgz69KO9pfQFP5/18Jn9HiPIW7H5RSYYEHD/VEIC67IwQjO+14P8ZwQ+ayj
         Fv9dDa8XdWW6VKCUCxt/leWWJqQ7WNRfZ5sOG2FoZ1EPxMB4kY0GUkJc6/2R0gAPmhom
         uCUs/ubRirh+YseqDNGEJqphsOeDGc75u1mhnOc6g95BnRQdrRXPOagKFCJkxXymkACC
         2JMRMCIxEx63cqZGG6S0Ph77ivbO4YuGIUCgDesW+Gxpg6y6jdfOvkQuYPdvgaH5/7ex
         VKGTRXVWn3dwSg54m0mMBdtDWeSXjGsha8bGGtShEZi5vkRrv0iPMJQXUC44jisPEX8c
         6caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
        b=d5eXLhU9dGPUh8sa6TMBWX/priffQh3Df/mzPhNDfs9QZIePQ6R8ta5HJ/GNYNfl1F
         iGsHx9qMOnHFgiWGCtRkorzQN/lsFkoE2HqUFDOVeXLRwou/WPzUDvloLuHSkKgzZg0f
         aDIc+FhwN3uCsVzgvzoxvjiUsnrCX/Dxrl+8DplhYyUqsM3WbGvYxbrvySgP790hWRTF
         WMRMbNX2gvqWLK12AFhfRe0HA2cbY+cfpnf+fqcdBe8492n33dw+GcjbPDVAqqi8w8vl
         70VAM3OaMlbxb/leorzdcj9XIO/LbHb73wQCL57fLWq2fmlEUhh6Of6/kmFMSkzTM3pc
         eSyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GV1un2O/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05622a05d100b003e6325794bcsi579350qtb.551.2023.04.21.15.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GV1un2O/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppzQV-0001x8-2D; Fri, 21 Apr 2023 18:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzQP-0001rK-1B
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:40:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzQM-0000dJ-Gw
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:40:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so10007965e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116811; x=1684708811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
 b=GV1un2O/iIOz23DpTe2YQWXQF3000aalUd6NufmMxr3d8mDQtpgfX2SO6wnokXLhuK
 9luCN7LrAhmUsqyHXGR4uvWxKN207Pc6qoVnZaQ4iufZUbEk9NGALOw8D26ScIxjpF0e
 mxRpxobDP0hMEtTRhPr9y6VU8tT9SaS4EUtZRw/S07oDmXVTOaZ7u7iFGXtaF435RkjO
 R2gFihrkF9fGXfWN3XdFZc5Ah98b9xotM1IWqhHoIOMthdxUYAjOSoyyydZCl3+FAIE9
 LBcahI6VmZ0KBH9J+mVUjDYR9N2L/P/jBgDxXGPCaCoCPMJRZKfOr3cgRFOq2sIzcj+C
 dkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116811; x=1684708811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOmOI5bhybaH2l8KUmk7CRxECVlXysRD1MtBuA8x5wg=;
 b=eqWctarin6coL5YTjQ8GvFAnrfdQkqev5i1L2ebjGlPZbSkvWEHFjGAt7M3lsZaXsP
 UNjUQ92c4HmFNOvYxrCrVEj5TmbyRyWKdihVKUKGn6ZiNmrAxodRR6W0tDYjs+wwtdDW
 nbQv8llpTONhg3eyDKNsys7wViB1lD2Lux4vrctTuhTP2CJanQyJKss4TXriTPHJntEO
 LqoeJM+90SfPuu2Du3dAlp+J+UN6IV5GTbONTKHTkCazz8Nl9kmVhcvx/Mzlgflm9eGz
 rgLA/COqE7oI4BRST083LtzQabXfq+obfxXDJukQFIaeWJa/y2uVBp0qL5vfZ9RIdVZw
 lzAA==
X-Gm-Message-State: AAQBX9fwCiqob/MhzkGzPl3qqj5OsJmu3QAxdRBv1ax0HGdQSw61GiFG
 fcz1yZj2sjaPzw4in8u7b/KwpQ==
X-Received: by 2002:a7b:cd02:0:b0:3ef:d8c6:4bc0 with SMTP id
 f2-20020a7bcd02000000b003efd8c64bc0mr2897673wmj.40.1682116810858; 
 Fri, 21 Apr 2023 15:40:10 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003f195d540d9sm1496439wmo.14.2023.04.21.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:40:10 -0700 (PDT)
Message-ID: <76538c93-af56-a80c-48fc-e3b8e0ee5e3f@linaro.org>
Date: Sat, 22 Apr 2023 00:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/54] tcg: Split out tcg_out_ext32u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: WNKVj5NwEdCL

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 32-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  4 ++--
>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>   tcg/mips/tcg-target.c.inc        |  3 ++-
>   tcg/ppc/tcg-target.c.inc         |  4 +++-
>   tcg/riscv/tcg-target.c.inc       |  2 +-
>   tcg/s390x/tcg-target.c.inc       | 20 ++++++++++----------
>   tcg/sparc64/tcg-target.c.inc     | 17 +++++++++++------
>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>   11 files changed, 54 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


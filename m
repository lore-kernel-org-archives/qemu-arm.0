Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1866856lfc;
        Fri, 28 Aug 2020 16:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ1Pt4qagvRpISvoDksC5gz7wTqIsfE0ezo93H5uCqFIW+XdpdZSuN3tQxR1Frlmhxu4Mw
X-Received: by 2002:a25:780b:: with SMTP id t11mr505244ybc.490.1598657933220;
        Fri, 28 Aug 2020 16:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598657933; cv=none;
        d=google.com; s=arc-20160816;
        b=pKAsdf37R20GHMJEON3Cdnpa6TQlwI19Otk3ZbfE6HKKOf799/5RPAqgMiiYQxqTDq
         k/1KZLgaqEENjagu8530N/OpKkbKRHJfzJVXpUkRB+FrXIzrw4Lg5CvJIMR1zL7J5NwL
         7zILScheP95dIemi9y1CxPL1jXpcyc0pUkqimA3ahsqjKMAR9itP+ZG7NdXoknmVC0/e
         B8WP/oj5jYh+9yC4ueULbKMHvj/ncQWKyXjiwou/v9pmsSLAf20Q82hDdoSEbvphFTcu
         wHNQ3bTBaYtn65jShkW5SqafzobiGZPOrBw1ij9qPFRXO3ULfKka9SPwQXE42FMX0XBD
         BP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SwniNxok37/LYegTpNsKUZatfoKXxfsEbk4JpSC6o1M=;
        b=UddTtTRGIRDlzCYwu31wZKBjgloU8PtDuWRQAUdV7iTiZdrQCm2FJhTBEMWS6DF1OR
         faadGZSrOvQmfUDlo1vH1rchlWpjV1YHWlq5jAn6wArEz8PJT/D6/mbZZD3HE1sKkoKu
         V0Odbn54eEu+qSl+bEMc6uUF5cwGvRQpPKHyIUc0hZCat3s1AohwxKGvr3+WamoL4Ixf
         UJ/ScPP6MnFP5ckWHO5y0pE+vdEZhuppo9rsbhvpKUkZc9zVWqutl+ANnpOSIGIRwGOo
         FpxwiCiYvS9xzJP+7NcXvVJNkSAFfbN9gNJUdxsvoufW3QO72JqzWHWgixbDiJee/Vtu
         IvNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYRvyv4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si680973yba.110.2020.08.28.16.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYRvyv4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnxM-0001Rm-IJ
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnwy-0001QJ-9N
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:38:28 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnwv-0007xD-Vi
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:38:28 -0400
Received: by mail-pl1-x644.google.com with SMTP id j11so362944plk.9
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SwniNxok37/LYegTpNsKUZatfoKXxfsEbk4JpSC6o1M=;
 b=bYRvyv4jMwTzC1k68TOzPDXdwe9ft64TlY6F/5czbnRrCiKeXdTiZoK71IoRnePCwI
 E8VTzblGQv/lvA6CHjtXWTy9P36suxcRqhy/D6eENo+TKNzY3kslMueLzsXVLGJPQZo2
 DrdYXCkIY+4TJFsUFG6XeGqjFXqTIps01L64MqgWu7TPt3U/tn3fi0WI45EUbWryjATS
 1pSWP5CN/Fsh3u3sfJ+LpMBsHrtyEnnFk14+/REpnBTYVKCPnjd4GKa+rZTk9CnoDUX/
 LPz/G6DHoaPRjSnE7IpVYxODwYFkcQC+4evp7/E1ls8G0XGMAoX5+aM0RqmBDuA4OLy0
 rZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SwniNxok37/LYegTpNsKUZatfoKXxfsEbk4JpSC6o1M=;
 b=Na13yL7cJ2ZmfKek3KWyWO5CDndg2JubFcD5gw2JV2V0psBzwz6b5qWjNOOK4De4dv
 s8R2qypRAvA+agIwkCB8QKPpv0ZLN7DxMn1Ezl0jpeaPevFUEbtjARrAq7IjhXg1NMez
 YBYLIU8dwznkkEGTCdPidE7/3ZSDZ9l8KT+N19h47fUciTV7O0dAYVNVMMvQhJgVIg1+
 ijIXNPBf3OISHq3y1ZUap6Yf+8+Qg2VbGMEDC2yjy6SRniOXK5ef79N/0REo7NqoPd2/
 kWi+jb6oS++3Uv+eyojrfGPn+R2WbIY5eN/8KZWynjQ1dtvuD6oKfV85TAt5mg+irjAS
 1aQg==
X-Gm-Message-State: AOAM532jvd/BB6M90A4Gbv2cETz+0YC74ASvUctliNAAXY4kT8cGeKod
 kkNz5AOxLbIqSc0c+nO9zaKEbA==
X-Received: by 2002:a17:90a:ce:: with SMTP id
 v14mr1081444pjd.123.1598657904447; 
 Fri, 28 Aug 2020 16:38:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j4sm540587pgf.8.2020.08.28.16.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:38:23 -0700 (PDT)
Subject: Re: [PATCH v2 44/45] target/arm: Implement fp16 for Neon VMUL, VMLA, 
 VMLS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-45-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1306a667-216c-533c-9107-e42aa9ebfa24@linaro.org>
Date: Fri, 28 Aug 2020 16:38:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-45-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ahz6qJtlHlZB

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon floating-point VMUL, VMLA and VMLS to use gvec,
> and use this to implement fp16 support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    /* a->vm is M:Vm, which encodes both register and index */
> +    idx = extract32(a->vm, a->size + 2, 2);
> +    a->vm = extract32(a->vm, 0, a->size + 2);

I know this is what the current code does, but I tend to think that this is
better done in decode.  E.g.

# SVE floating-point multiply (indexed)
FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
                index=%index3_22_19 esz=1
FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5 \
                esz=2
FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5 \
                esz=3


r~

Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp532567lfg;
        Thu, 13 May 2021 07:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNxx5dEMvd25dGjZB+yWPEvyRxu1HlxpEvSKv+cR+FuuG8Pktcp1dFWb+n4wQmYEwYP4cF
X-Received: by 2002:a92:6902:: with SMTP id e2mr36718579ilc.172.1620915027440;
        Thu, 13 May 2021 07:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620915027; cv=none;
        d=google.com; s=arc-20160816;
        b=aucPtSDOrWTY84Njzqll/DnQKbEEdJ0Jk+kiCFGlxklffqnxIJZIo/LJCk5pkN5FyE
         lOuKgYZRa22xBsVvMXLODDNS/1zlWSb9Ho4btkGyFbFrMXw4aS+kF6zratuC7HRcTKi6
         7JYdpHZZd3m+4v+QC+GnkSTsekEkMv5D7Zm+fwxEbUOXlb9YE58Pw53OXRFAe9bxS++W
         lvdbmLEAYL53ay63UAlwOmjFnh8jQi2Rn0cuETluSTDR4w08JnJJtLVQ9FdqUtBTpn9t
         ByDMWQbYiX83j833JJvbRC5pP1+Mpoh4/ZzX405xBzNFMXL75GOvvT+M0NWNsofDabXm
         A5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5YTBjGwJOJQ2IHRnPkKum6/YvFM/lhlyZXdSqf/IQU0=;
        b=UIfMuyGO9/jxS2GxdTDYpkqpHgh3fFexioAF7rscjwtNyWwZmfVLlgVYVJVl4L6xdr
         zcoVP6m/fmHR/KEysPDlKGfttYRJDwiJZng2f+YGuwrCbkIVxcojDU079Vi/NrvXI/WX
         QTZ4j4N5TWqoipQGPqksp6pzUKUcVNYVRa8dU7bKmK1oMIvvYfhdZW3+VAIWeLAvRDMX
         G5axT6gIQVn10TUzfyMNWvE4R0aXVNSvfArRboqEYCTK2ln019gs0OU0f+bxMmuQ+Yv2
         izD+YtBelgQQYp+c5ekU4igCjjCYwDwr73p7MtDfY0L2Y5eiFhLdoHbFWIQclmLLoZHi
         nVDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RKYo7F6p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si4070299jas.106.2021.05.13.07.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 07:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RKYo7F6p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhC2k-00042h-Mw
	for alex.bennee@linaro.org; Thu, 13 May 2021 10:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBzQ-0007cs-57
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:07:00 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBzO-0005PM-Hw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:06:59 -0400
Received: by mail-ed1-x535.google.com with SMTP id f1so8895745edt.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YTBjGwJOJQ2IHRnPkKum6/YvFM/lhlyZXdSqf/IQU0=;
 b=RKYo7F6pumVMYo5/DvJJAR+kqjZI8ZjQZT9wy6cy8Q+iaancXfCsmfyyFsiQhyCOBP
 gv/SnsPOCY8WBrTJ/VaB8L613/LoUBdK5jJ/masyTW6rJV5POdAW1Rs3RoyovYzfVfQo
 oICXTrr04ulSOC9CIp4oozLj4ihJLsJGEzvvWQrvfGCvku5C64me6DvwzXzLJmxbiYs1
 UQfwRIMNSHsPHIa9TQG4nSA0sztTbZ3/f5JWjygVQ0HUwSR+LpxJ4vJBcI80jHFGr+o5
 VoqwyTjNt1m1rsLUUKWG2UUqhHwoprcen3sXnyXf6rRbcT+2xuI9zDvTw0D713BQIz8Q
 /ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YTBjGwJOJQ2IHRnPkKum6/YvFM/lhlyZXdSqf/IQU0=;
 b=mhgv3XMYO4DsxCQ+Z1swYPCpx4M38X0h1up9sPO22QKxUT6fxfiaaTU8x1nV3INxlI
 oKWZ21gJrxjfs+QfinFZFvxs7QwEEEHbO0jtvbhrDRblXS5IAgIOx22L4i/bR0FPnO9n
 AnLrA5mIRHrFader37/MvnrVz3WqeYB5yDqy+0tc3M4rbY+u8JsMY54rIOqHYSgkwxRW
 XPt3716zftebhE4WGnCE27jPNa8DLGVAzGR87+i7ipjD3CU529VQ7KDhPMqplRoV54ii
 FDbo5M74OL8QKHctxDA2G50vkAml9jkNQf2DqVdFX+1elsRLyf1NjXzDL8M8XcUz2n4J
 I0uQ==
X-Gm-Message-State: AOAM530G3WzDeW6E7tGmdLi9Q6z76DISepgCbkesJTE0+DTj4oRH1amo
 yNHLzjv/9l85+15wgF108L26Wraip2aav4Qwsc8Vpg==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr49942219edd.251.1620914817183; 
 Thu, 13 May 2021 07:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-68-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:06:45 +0100
Message-ID: <CAFEAcA_jpcD6cvVHd8vbr9w_fHXd_eWWG2RKPwuBqvjvbTgEBw@mail.gmail.com>
Subject: Re: [PATCH v6 67/82] target/arm: Implement SVE2 FCVTXNT, FCVTX
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAl4Gtn2rkDF

On Fri, 30 Apr 2021 at 22:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
> [rth: Use do_frint_mode, which avoids a specific runtime helper.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  2 ++
>  target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
>  2 files changed, 41 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

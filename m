Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1182388ejv;
        Thu, 28 Mar 2024 07:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVonVs9PwOM7qkbT/3xmgkDwBhgdEULor23luzl1uQ5JqXBYMUX/IShUWiUBXBVCaws0bK92AVYpaK9YNSEYydQsnmiZkL8
X-Google-Smtp-Source: AGHT+IE4wMt989V9VMUxK4H1BwBdk9+a/ecTP2u7jESey+7390ARwd9knL3TvXisTSRv47oI12tt
X-Received: by 2002:a05:6214:8e1:b0:691:3c1f:f855 with SMTP id dr1-20020a05621408e100b006913c1ff855mr2003661qvb.15.1711637808236;
        Thu, 28 Mar 2024 07:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711637808; cv=none;
        d=google.com; s=arc-20160816;
        b=JxlGWkz+HCJR8l7G6TlUvohPck8GfTHaZrke4sTCqV8jCphSD7hou353srDWwi+4PR
         EpG8hQYZ5b7PM5mtjMNpeIfwGcczb4PuKET8MaLnTh5fphD2C3/6wdWEO9j/X8UyrZ9r
         XVqFG28/7HSJtjzPBWS7dmAYspaGXP3sWGJPht1KX6qK014h7i78xh8WO2C3oH1Cqkmj
         XJ2QvIpAbeOLb9KsxeFXdsqiYPToQZbwi+LZLcrIHkkJikjzXoyDXizMOflyOZ7C0DYu
         dX1CGUqFbBGQSo3HCEfRvledN6hhQOll9U7vLXk/Kj5oLZl9YSzkmLW3nQC+uXn5Bzgi
         dr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HBHpgXdLbvJDJait0Xg2FzYJIp/klWMuNnFTbCAHHjM=;
        fh=44oKQ/8XuiM3YL+fLiAAXoWw7IERKIi3WNbkrxX1igU=;
        b=rKoUOvH5yGx1JtU6WMiycjXeo09SEamN5mZJyLta/lReoyOVLDsh/6rRnBGIXOWlje
         VYgNtU+lB2Icnjovh2WcawMn1isWypwyaJh5kAE8TkcpixftJCkJanPcHOgBKgBrKncw
         2PcE4SyPZD1zvb8aPy3fqip9YZxHxBk7185eIwC+5r0eZL3fjRDQ+J5ToUPPsIaV5cSY
         i+bImsOC2mjqfv6ZW0Xa93lKwXQypmYp/X+TCDqBhsBd6zwVMLF+H9C3xw1lf/PeIQP0
         rmC7bFxuKqVNLTvp7SXMSKgYkwi3Is9wyPH2q4JyXaUTuRrX1ypBOa1PMK6oFvyjOqnn
         NTVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x61ByZJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a0cea48000000b006971f65b493si1583507qvp.35.2024.03.28.07.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 07:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x61ByZJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rprBG-0000he-MB; Thu, 28 Mar 2024 10:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprBF-0000c5-0A
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 10:56:37 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rprBD-0007Ng-Il
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 10:56:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56bf8093dddso390792a12.0
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 07:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711637794; x=1712242594; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HBHpgXdLbvJDJait0Xg2FzYJIp/klWMuNnFTbCAHHjM=;
 b=x61ByZJSLDPkZjxCXsx+ecOvHP6wPRYwmnrpg4cWOXqXHBO/kP7uxIgk5p40BaRuSE
 656j7uQaVXRud3BPdfZWMV3o8XoHAZTl0NAP/AbYxM33XE2RsstdUv5R+g/f8sPh3+fH
 YFgo+ia32CM5vofzTrHuq4ITbAgevDHftEKVPPcSnjEyX2kpzRjc2o1OJWPzVFsrBHOA
 yp1F/RLBik+D7bCL2MK6tXwILZiYc7Ot2JRTJvsSf9z4HNy9GpRejsHrkaZnu8xvFOUq
 IkNoLSzLr3k+k2f1Jhp8CT10JfL4uDUEO9QKjPHIwH49OBpIfc+mNUrKt+P1g5piCGU+
 DiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637794; x=1712242594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBHpgXdLbvJDJait0Xg2FzYJIp/klWMuNnFTbCAHHjM=;
 b=VHpph8cTltYnew5tDTstTpag/XaDv9atocFrZ5FQxjrxZiU/6UY0t+iM2JUaRUhs7k
 l+1Ikd1m//RWsC2nMt+5/0xXv4GCfzaBCnifFL/QszOHyy9F9M2jYzvHte47YlBz/Rz8
 SxlZn04jCK68T1RiNRzCMYJqyAxF46zlIxYC9Nfiq2sdwYOOi1VIq4lDMPQV4iZ/uTfn
 NZdeVeMAgGzXAetKCk7CIYEEMVYupe8o1rdZcgYHKaT+/gSvmMTkuz90YhYrJlMikGn6
 BI4TqZAJCkZ1jOM3pymByZPAfXahKUvI2dmsENJcb8NGBH6w+vrFuXkZe/4Vd1fhd5e9
 qPgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8CXmjJ2uDdHeP4CjolqpUjLSlUzGGKBOK9vF+FOpD6M1s6AU0+VlPV4NwETwFNgLsjsCI4HtUbRJIOi0ZjNzk9aDc
X-Gm-Message-State: AOJu0YybmYIGpMj38z3ErocgdVbtuUmcDfY+6KFk7w7co9xo5nNZijZR
 Xhbx1/0QcYsTLhpVh4PfPmNcG0X8bGVIiuLCZVFdj59UJ2eyDv+e9w2WuDH8NACCi87MH7c+lUt
 5o0pX1/jRdG6U2Y+CZyEOVfPM+yOFDAtvsyFaaA==
X-Received: by 2002:a50:d6d0:0:b0:565:bb25:bb7b with SMTP id
 l16-20020a50d6d0000000b00565bb25bb7bmr3190440edj.6.1711637793925; Thu, 28 Mar
 2024 07:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
 <20240325084854.3010562-16-ruanjinjie@huawei.com>
In-Reply-To: <20240325084854.3010562-16-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 14:56:23 +0000
Message-ID: <CAFEAcA9OTf9eOXpJFPANsC9kNdXUuo=WPkdP1ipJvTV6rwRkAA@mail.gmail.com>
Subject: Re: [PATCH v10 15/23] hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: ddrRUsWFzzpk

On Mon, 25 Mar 2024 at 08:52, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add GICR_INMIR0 register and support access GICR_INMIR0.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v10:
> - gicr_isuperprio -> gicr_inmir0.
> v6:
> - Add Reviewed-by.
> v4:
> - Make the GICR_INMIR0 implementation more clearer.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

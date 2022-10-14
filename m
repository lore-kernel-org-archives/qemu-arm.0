Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp571738ejn;
        Fri, 14 Oct 2022 11:14:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xQNoVsoeQS5yoIRER6tYahe1K7EOTByrHLmXWiZZl+JYQJKKqOnX+OcHyNTGOCyO1V7zl
X-Received: by 2002:a05:622a:1904:b0:35c:c657:14e4 with SMTP id w4-20020a05622a190400b0035cc65714e4mr5331117qtc.65.1665771272133;
        Fri, 14 Oct 2022 11:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665771272; cv=none;
        d=google.com; s=arc-20160816;
        b=czBHPMUWuUAuRxbnIL6x1/QyGXL3I8p8X6t5OzLjn9sABkQWmv7Oe2T/kwhBZeThve
         xuCujFylDuazIFsguWSmRg3RqTZh0xD3O5tJ8M2gWt/Ut2w9+1XNSHYJWF7ua+SYUbUr
         VgarurJqimJ9oN3dLdfqzgkuuToMO20hqXQi0bu6OfcruVjdFUH97DCtjbOcnJcASlBt
         Ld/9Deh9zxpo5ry3uIudPULz9yJjUCbohSkB4Pbfpb0OiA/dEieWMKdAsT1E/aKjZMWg
         x1m37DtwNTTS8HPDm+ax+5Y/Sp4UdXz9TtWTZkSMK++sXzls0PiJTBlBV+uKdPrBZea6
         pUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RXTkHQY/TJUr6fU9hsg119+h3aly7J/lbQUytQzxvNs=;
        b=K6AL28yHAoXh/1IwIAdn44kL4hEuY4lXeFeo/Nwe5AM+ZlsdUPO7rp96U25/tDF0nZ
         1dTAjNdGOx7UEAC+GOMb60VbYOSPvq57i3FC2CGdTA55CLjz2mLp7ptXKv45h6jjSqNk
         S6fHgLuP6xilIX+a3RK/oSx64rCaj9E/Fc9zTldQgkro+myxc1CETEKqc3wg4QEn1V6I
         FEaZHuutubkJJY2UXCyAcaIUv5Bq+zCRplu92PmZLw42wNtGHvXSA6tAbRmhil+cY6t+
         YNITXe6li+MkRX4uK5XH0+B+kaX8xDyhTPaobjJqUToT3ihquGNS7K2cF/iPkz4J6dJY
         gmoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xllkxr8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020ac8734b000000b0039b1c91fddbsi1687522qtp.166.2022.10.14.11.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 11:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xllkxr8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojPCZ-00061S-Kk
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 14:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojPBF-0004FK-L9
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:13:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojPBC-0004tF-6j
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 14:13:09 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 78so4959481pgb.13
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 11:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXTkHQY/TJUr6fU9hsg119+h3aly7J/lbQUytQzxvNs=;
 b=Xllkxr8J+srfHNkHpDH48aOrdBDojo271dREC5VU7atrd7WGyCwn4t4IN46IWZBUvV
 yGiW9Qw5cEnD4XIWz7c5TsFv6/7ZG0UqdhdRGKx6cHpSNuYf1OTed9/sAqv/c4GuL6Jf
 W2qerINWfX/Z9nFxoKe+xAQbVVrJF+JXB8eQ5XD8WEtFgTiDOtnox9AZALnFV32C3qNP
 xT6xJ1MCev86RKqjUfqovQTnZY2fpK1K29mwCn++YuodZETRwz/cP81AzWviXjdAe9f2
 sXjTqCgdo+IgCHATbIcqc2JKM7O8yULE+41kSu0uoB4Zi/jwDb4CjwUUY86bpjJ2mLxX
 mQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXTkHQY/TJUr6fU9hsg119+h3aly7J/lbQUytQzxvNs=;
 b=BtujJDrUmgwhi6Q6YUi3yf3D4TaMcFZfCoISIQroTKZ4NUyfbEcB+e9z9D8TkCY9pI
 DIapGxUVaOr+tOoDf1bajH5jPTqFb06PXWpaYna9rhoWZ0j3VaFa9Ne9D3MdNn8WpW9q
 Pu0H9q05hF0b787GVfY5X63FQfmhbAerBlpRDMWt34Zc/Srz2v78ALNV3yJRVGqFakFm
 9cJrGdubbyh3ZvXAdR/PNytqWn0tlqGUtuVUgJT13SnfuHXYSEKZUEKBNYtEuLFnfV6v
 P2A5Fs2V1n9z7ow2tK+wKvKvVZZXkJEpUvATTNjqOY3+zqn5ORfeNd/iRsLyy0H00ZzW
 72kQ==
X-Gm-Message-State: ACrzQf39aCNUYPIlb0QBlZOZ5ZPkklkhFFUBdyaXYRZ1JPtMzPqModVZ
 xzwpm9DuN3Do6p3BmHFFX1ZZbG4mRUF2hPzH/BqNJQ==
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5620011pgi.192.1665771184817; Fri, 14
 Oct 2022 11:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-7-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:12:53 +0100
Message-ID: <CAFEAcA85XY26GpBNMA+LT72Xg4f_QfSdRh4Z3zrZpEUZQ5nusw@mail.gmail.com>
Subject: Re: [PATCH v4 06/24] target/arm: Restrict tlb flush from vttbr_write
 to vmid change
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4j75l92h+sn2

On Tue, 11 Oct 2022 at 04:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Compare only the VMID field when considering whether we need to flush.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

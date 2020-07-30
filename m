Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2570878lfy;
        Thu, 30 Jul 2020 06:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQkh2NbKU8hF3PazCIaUK+pLLVCApdoaObAZaGcn4cl2VnGxHJUNP3qdrkoJaTZ+ObPmXz
X-Received: by 2002:a25:ba41:: with SMTP id z1mr5120390ybj.33.1596116356169;
        Thu, 30 Jul 2020 06:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596116356; cv=none;
        d=google.com; s=arc-20160816;
        b=FkefxJDxQ2H+s8in9iWnR6Gk6HpvF6gZlQ8B6ZrkqmsIl5ouaEvldm1JjzrBclgrx1
         aFIps6ou+zOcVxrzWLkN/EUazzdSbORFC8jfpgOm0QMnqJpYTHJ1eI94o9VtXfurHsl9
         FPkEuDOcVSzTh7vQWy2L6CzRAzTsJzQ6GhIkHR4uxwcVkaLJ5Sh/kquQTKY2SoamCGMb
         0lyhdZwB9eGB160A9kKaRZ9WOaE7YAD/avi5cIFbK6TQ1XXjpeqNwvRoAjCNY8olJ77j
         cdC6xAaAA3qJ3bEW3JT+5qIt+Bdrdi8THUWZLXuJWJ3rK+0KKACeYTnGTbbmDSDyrc7D
         WB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6bWr4DdkxGZRPzhYMgici00p195qNqidDZzgpfDv1v8=;
        b=Tl0R4zMXrPjlKw73fezcmfwjLM60iTjzXwi7lMiKGyymp+9fvU5IL1MHNnBcr4pXGa
         cczOvdjAMO7JUKwm0zPtCJMOtGHtA5gAcByfTEbKrI+gwxwAYfUxp5JtqiUeREIQhtd/
         HecrldgB9cu9Qm4x9wTPsojYGggQRxEF9cSnBtr/eyxz4ovTDOVyVpIzNLxX3dGmbSGD
         poTBaCaz7iwRLHdNXv623Rud2D4HS+oJUzoBAKlm++/m95WlRxDdt3FTXcB8TsqEYMvi
         BurKiSIxaZDo/Y2cHJm/nQ29HxctlRJfU2XF9H2nxxd7MERtlyqOPnFQDYNUfaKe/xke
         E4rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qbk/AU5+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si4665130ybo.33.2020.07.30.06.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 06:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="qbk/AU5+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k18mB-0002hf-H9
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 09:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k18m3-0002ga-Mi
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:39:07 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k18m2-0007ui-09
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:39:07 -0400
Received: by mail-oi1-x242.google.com with SMTP id h3so153182oie.11
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6bWr4DdkxGZRPzhYMgici00p195qNqidDZzgpfDv1v8=;
 b=qbk/AU5+g61K79+ORD2givsncFdonDZKfl6+WfZttAdC2mOLOFxa9twb95PeMRDKFB
 AfR9txB6knwIdj2ewjfLRYAJTk46bb7yPM4X8r+gFb857ASl6EnxwQ0+RpQIYlijzp8d
 lpNlHdOSWvbWZ89aWM3KwJf5rq4adeR0Q6Jf6ivoArUcYcRTjIaG8B+FqwnifAgyT7xw
 YbvYQoIYcwf5jgV/D2iR2v5wqVtBa7zxxoLhzUeOdl7+EcKqxLcqUmRLqUJwTlebEpBM
 KCInO7w2c00XrQSD6hYbVVSDQ8vrvriad5McKbmlc4pxTDtmtFdNOJqsz9n54yfbM+tl
 hniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6bWr4DdkxGZRPzhYMgici00p195qNqidDZzgpfDv1v8=;
 b=MYMSBLR0XmUzpSTop3gYGG4t9ipLzuLwxh6cqWIRu4fXpZUEaTe4jz72Xhkc1pPRUm
 gqyu39Rlwklms7d8DyQ7ILDDIHEefFKo7p1wHwXdt+pS5uOx7Y1De+WRjVpBzz4LP1vW
 jSFTqPHeAygWMmNxiPEyD2Y5jeDQzOqj2uE4ri4rYeqi03wuYOWHPn+6KpRIlEbSZKfr
 vLOWSGqedXDBpbFDc1BZBHrhSrSnqvEQlbEFw1qEUOS0sjuCBCYs2e2C57TRjEUHtCoX
 R8+SSKGKsZPYVrKuohQW+7wHZGPY8zqminudO1v02B/bZp7e6UoKdNB989oynrzMaHfH
 PcsQ==
X-Gm-Message-State: AOAM532lhncgYZBoDPQgy9cOMH1L0TKVcYLpGRCNCiMKgIs1EDx3V4Pk
 1hzIO1+daQt2nTyElkr/s7WhdCt7vTiu1a5FRX30oA==
X-Received: by 2002:aca:48d8:: with SMTP id v207mr4628338oia.48.1596116344513; 
 Thu, 30 Jul 2020 06:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200728150815.11446-1-eric.auger@redhat.com>
 <20200728150815.11446-6-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 14:38:53 +0100
Message-ID: <CAFEAcA-gMh43545mnHRoRLuAV63o3r-GWFBF+zYZfd4apfw_mQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2 v4 05/11] hw/arm/smmu-common: Manage IOTLB block
 entries
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbolGMKtiZOM

On Tue, 28 Jul 2020 at 16:09, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment each entry in the IOTLB corresponds to a page sized
> mapping (4K, 16K or 64K), even if the page belongs to a mapped
> block. In case of block mapping this unefficiently consumes IOTLB
> entries.
>
> Change the value of the entry so that it reflects the actual
> mapping it belongs to (block or page start address and size).
>
> Also the level/tg of the entry is encoded in the key. In subsequent
> patches we will enable range invalidation. This latter is able
> to provide the level/tg of the entry.
>
> Encoding the level/tg directly in the key will allow to invalidate
> using g_hash_table_remove() when num_pages equals to 1.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v3 -> v4:
> - also use the tg field when computing the hash
> - in the key equal function, compare the fields instead of
>   using memcmp()
> - fixed a couple of indents
> - added Peter's R-b

You say that, but you didn't :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

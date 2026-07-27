Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F2EC5321C
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 10:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woIwV-0000is-Sv; Mon, 27 Jul 2026 06:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woIwJ-0000dH-Dj
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 06:52:10 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woIwA-0003Cu-P3
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 06:52:00 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66807ba2f0fso3171445d50.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 03:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785149517; cv=none;
 d=google.com; s=arc-20260327;
 b=ZOdk8qNDOgT+BAzv7oS2FHtFUZL+Hh5wzkw/SFK3JFV1dRUzhYYMLcr6feU4ohyCDK
 5TbLEPZbNiekxhDuRa7T2WCv5R981i9Wi5ORlGwykV2asf+5vbeVTvV1DM+FDzOAsTwd
 sQgqoHGyCRMIWeT+HZvaEQSJ9ym71TNoXIN9yBE6SzRQhE0wiqVlaHEh2nCc6UeBK0l/
 MF2bty2yMpVN9pPN5NS3YA24Qny0rlBmaGiZRKUHmZc7PlVYXzlZ2DuA6fcGysw0PpeB
 OvmsAiSTsFh78TlvoQB9mMjkYh+R1Xr5VxY1OntIsnUppBOkbKgmZn+HCy6+N07MsyXy
 TqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ff/BxMSzKTlyWyEKFqqDKCnrdAATxliJpkC0anLLGh4=;
 fh=X/0M8Hipi4oCnDiC1rXYRLNAP+KGnuM2DB3qE81F9Nc=;
 b=YACYjx+c8kNJx9XBxS+lPBZGc9kBuE53P/PeolgvWcV1douFeQ6BwxsKlpiNBMRFgm
 RxKc3dBP8psgZKyy1h3Ln4IBKIH2Cw76vkvOY4/V8anEAXZb4r7qc4uygiprIgycIugo
 FEd8F3zkokkWJKcJwVNRjbCjO2Gn9kxW/Fhe1LUo2U3n004zzZ/RJlsjMF3N58mCv+kN
 Z2zUr1v11Gg7yVhK5ht+f5GouuuOX5zRtGVeT4JgWrCQoD1RGiogvFWcYbWIu/ho18yO
 QbYT4CDv+i8km3bMZMZlzp6WjhzL2ahrbWnmYmL80mUiJEnZdWgWI557iuE5iUJQ0rzn
 eKpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785149517; x=1785754317; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ff/BxMSzKTlyWyEKFqqDKCnrdAATxliJpkC0anLLGh4=;
 b=tcj2cohCjS464Dhmsl8DMqih12l2qs/lfQvnnGRv52MTgBPabO93jhuGpZlWQxZ/bH
 x8Xmpw++YI9TDTN82Pf5MS1n9hDQlwIwrEdoJfq845iKErUJOR/Ri8r6FNGab9k41+D4
 /Pv7+hQ5lV35jRmOmYvG+Bn5H2SaN2lJMXpW51plPW2N6W2+yaNJkxz4R/rxQqRrFi8T
 U6ojag5h5uufjnEZCCAqP6u3xxNKsaQ22LgHLwi+nziT12ALjT2WtrM1UQvnfCirFg4P
 bFL633bSgD7rXpreldPygvBuewxa7z5WWycev9AtB99pWeBoRtLTaYqOhwjqnbcnwqet
 +7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785149517; x=1785754317;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ff/BxMSzKTlyWyEKFqqDKCnrdAATxliJpkC0anLLGh4=;
 b=Mi8B1tCbU4O8eAQGMfB7aPMRxNg1iiy23dFUDRbMoKaneTaV0JfMKIBXYmaMTpQJi4
 OKeVlBDrsvAfICAnWKJAKlRO6cm6lEohDZNb0nlJQ1tjpYX0IYEGao9YweGwArnjf1Yw
 bTI4CuFcd1Jkg3zqJsNEbmhj1oOdIU0+wtFBrhLLS83z+eOdp5l802TWBszHkuFdjInk
 OR1Pj4wMyazZouJ6PoO/aWCs4nfZXpNiM6y/J/O7HwZsLgt+tqNhSInuGMdAwZB7iaAB
 6SX7ns1etbXd8hFKHNnS2/yY8yEl++eXd9i02WyKNgj0mGDabWqTW0jF7+XTEwneyiMR
 7CDQ==
X-Gm-Message-State: AOJu0YwP+bI3FE5F47GwGvCVtGm5wjISTKaMqtsmLcXsrPIdQDqxmXdI
 DZfg6fMk7Zpu5Pw8vRnpH+5yxSFvln7rxRm0DN85eNcheKaj3LKwfC2tDpQzq5aePmbbmZKfZny
 Pg3pi4qvrkQrzqf5NngVKaknXJz6Ah5jdV4v2HO1rWw==
X-Gm-Gg: AR+sD10bxbh+1pZWTSu2SbVA23J7B0pzxZv3524TY2B0Yo2uHKFITjWLky29VpfA72w
 z6wwW8II3bgwvXskHnhZe9lxvSLaTQVc5H1Tz4Oe7JC6HRNPH61stp9vEZZsrwUNXhcJvdzdh/o
 idO+acFgNuKd2j2qhym0D2k5ratiCb79H6TRg+mgLER/+Kk54JZYo17PbtxSOW6HphAxZuSoAEQ
 g0j8KuE35xsXb2GLe6uBxR1K3JDe17CxUBHZv6Oow4EL2qRpsjrpn88CPNklaX6F2piZqhLEHHH
 UwyaV2cEvPLfQQe+W/ZPZwpy9928tdJqFr/mAUoovQqs+xhsRjSNeenR
X-Received: by 2002:a05:690e:4854:10b0:664:e8ac:21ce with SMTP id
 956f58d0204a3-668c79e8708mr1676378d50.24.1785149517320; Mon, 27 Jul 2026
 03:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-2-gshan@redhat.com>
In-Reply-To: <20260727032649.145381-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 11:51:45 +0100
X-Gm-Features: AUfX_mzZhc8aDsTK8wb7UVIuJjvXh_LXSXdQuI6Q99SCQrwpScDncfpuT3-PJd4
Message-ID: <CAFEAcA9cmvjq9AJYrn9N6ZmPYDynd=eFfWtkar5wQpdS5KqgZw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] system/memory: Use memmove() for directly
 accessible regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com, 
 mst@redhat.com, philmd@oss.qualcomm.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 27 Jul 2026 at 04:27, Gavin Shan <gshan@redhat.com> wrote:
>
> Similar to what's done in commit 4a73aee88140 ("softmmu: Use memmove in
> flatview_write_continue"), there are more sites where the overlapping
> source and destination buffer are allowed for the directly accessible
> regions. Use memmove() in those sites, listed as below.
>
>   hw/remote/vfio-user-obj.c::vfu_object_mr_rw
>   include/system/memory.h::address_space_read
>   system/physmem.c::flatview_read_continue_step
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Even if the overlap isn't possible, it's definitely better
to use memmove() than to have to think hard about whether
there's some situation where it might happen :-)

thanks
-- PMM


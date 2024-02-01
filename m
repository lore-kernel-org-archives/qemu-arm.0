Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp368076ejb;
        Thu, 1 Feb 2024 08:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMc8cvTC4ldIy9dNIU3eraHXt3KPo5ug1GKJXNbKZwrQH903+jiuGOdpXEVfKyJ18tIVKO
X-Received: by 2002:a05:6808:23ce:b0:3bd:9e75:15cf with SMTP id bq14-20020a05680823ce00b003bd9e7515cfmr6561910oib.53.1706806756174;
        Thu, 01 Feb 2024 08:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706806756; cv=none;
        d=google.com; s=arc-20160816;
        b=ET99iYRnacCZ42+D9wTxk3tKU7kvsWxGBsE4E3bEzPmfDOsJqgHVitm0ZDRYAKIJwM
         YpAT54URuCbGXT7nc2zBNqalFEHjAm+vaIfOfNltvkkzixdwG9j0OGHe6DVyEKWl3yWo
         tLQYlbpy74hOLcOa/I+XKck53B5s7+FOvY3BahwnlsXQHf886Rhl08Un4Q7/EztX6OOY
         EBeC5ZVTMI2QDNIeMkHN5rQg1qc00v1lOvcqK72CkPOzEfiv0CHIwuoLJFwnkAsjl1C8
         Bw/xobIAy9Ddg69BPH0Nj/pRvODr527TUUoKtOz2lN9Sx0TT+3mixV4p52BXKDTVYfmL
         S0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uA/kGiDfzX1A5w/wxeINU1T2jPUfKCLdYrO6nr1TyFg=;
        fh=sGJxbdKBpeuTlZc7GkdKK1d16gEJxA2EGZroduZmEeE=;
        b=o5ZNl2XJ09TTEDMJ5ijCVgMhzkVQdX9saBkhkBoEm3W4hfr0i3GeVl1h7X+Sbbpzk7
         eqZUmyjtRkgQ7Cexay3cKV6cCUA0UGML20730ytwecxqy+052jhKNhbUQsI3jlW/0NNH
         tKj8ftS5HGoUH985bWcY9JyJisDuQDo20reHl0qfuQoeCUQp+wrDzXhM+sNISw+NyIv4
         vbedMWhevufNKkdASdnzG7rdN86vdEYzmwjd/737eZIbST6IQwMc06jnqeRHh+jjywsT
         lKPQBeRkLecPBKCr96MaiH9cWabLwWwuxLygbVoC+FwrTemOu44yKUBOZnXzgOJc5GE3
         iwbg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trgYBEH1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXA8j42Bh/IXq17R6HAVzic/r4Y+ZzUTiwu1rQcnj6IFDOvgHVi0jXMRmCT2gc6N6EZIayRP8nc3joYDMyMy31LtcsUB21O
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020ac85c4e000000b0042ab228f40dsi6801775qtj.451.2024.02.01.08.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:59:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trgYBEH1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rVaDq-0007V5-VC; Thu, 01 Feb 2024 11:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVaD9-00063I-TX
 for qemu-devel@nongnu.org; Thu, 01 Feb 2024 11:46:48 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVaD7-0003JM-MT
 for qemu-devel@nongnu.org; Thu, 01 Feb 2024 11:46:47 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so1590694a12.0
 for <qemu-devel@nongnu.org>; Thu, 01 Feb 2024 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706806003; x=1707410803; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uA/kGiDfzX1A5w/wxeINU1T2jPUfKCLdYrO6nr1TyFg=;
 b=trgYBEH1QkqEVCutqWfyRMk+W4nd7qUvGUXwgu+fUCYkx6rB3xEE8caKXNvT3oZN8y
 i/MTE/S20TzG/Qb0CXxa9k50OUMZSIQTigAtIjlOhvay8Sv7ipUatsFK5Cpgr5XCSjCj
 vQ5kf0yO4UASPrVDs8lPx/2hmPDga3I5Q40dMv3gjln5MfXSMqXwBcl+kHWAuEPYvVCl
 w/zrTdVXMnj8RGzvC3SxdRQfnRD3zf6ZuT9Qp9OxHAfNTajlft5E1B1zy69myXyWtVH9
 ZavP63zs3WbryktNBex0MT3LcondxmghUI07aBRanq4tecFYf39Ors8L4pVGuhM/ow3t
 CMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706806003; x=1707410803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA/kGiDfzX1A5w/wxeINU1T2jPUfKCLdYrO6nr1TyFg=;
 b=h3vuznbst+GyFC4RsXi6TtQzUNwF78tC3an0nFxaXB+pIJWE5UdvjSuhgPYkWFSuyQ
 Mh4hLN6YuBprBZl5lDBhbIdyvytHjRs17Z2V6osxGseEPNWmJuUrl2DsTDamu0wbwMjY
 gmH9mBTivl6h4/Lsn5c3rBE/QDAzxbutZDZvvlFcFoKIunMHcU0MEtn96HZ0Ijd2lxJa
 be0W5VbAlMNfcWsSMhWvcxVcxSvD4o5q1ztKPOUIdblO/P3g0Vk0KrbfX+UsY9JVU22J
 QeJtq/BsG4thdsmn54MWfSGgjZhfxGssBNAWx0qFx0s0ETX4xOFeyq2v+uPW9ARae69p
 Zs3A==
X-Gm-Message-State: AOJu0Yz39NERDmXbqSYrgHdLUNKwUHHMqDZ5LbzbJW6FFM1TJlPrWR10
 E7f1vUOogJAOtIpiqA33y/zkhbavGNsCWa5+HBNbhgOOUmGeS/+GJHPf/x0Z+dDJfk8RzVe9flo
 H4Qaxp0qlE7P5zVxH4K+OCPyo/mab1mNDkIw42Q==
X-Received: by 2002:a05:6402:1a2f:b0:55f:a102:55 with SMTP id
 be15-20020a0564021a2f00b0055fa1020055mr2817393edb.10.1706806003004; Thu, 01
 Feb 2024 08:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-5-philmd@linaro.org>
In-Reply-To: <20240130190317.25692-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 16:46:31 +0000
Message-ID: <CAFEAcA9V7wQr=LEvv2DYT5SabPe2H3+V2RMQPHRVZ8avrse9ww@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/arm/stellaris: Add missing QOM 'SoC' parent
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZlPKvyj/08qa

On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> QDev objects created with qdev_new() need to manually add
> their parent relationship with object_property_add_child().
>
> Since we don't model the SoC, just use a QOM container.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Ah, this is where the other qdev_new() calls are sorted.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I wonder if we should add a variant on qdev_new() that
you can pass in the parent object to?

thanks
-- PMM

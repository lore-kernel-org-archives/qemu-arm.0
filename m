Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D75CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDP1k-0001B7-Ve; Sun, 04 Oct 2026 12:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP1Y-0000vS-0W
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:25:19 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP1U-00028C-Jn
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:25:14 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66c9995ca60so723622d50.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791131111; cv=none;
 d=google.com; s=arc-20260327;
 b=dnaN62iqb8NMy0gXZRMgXUZcZFQZg6l9bnIEYQuV2DzKeXCJYRLohIdBs6UAeikZJ3
 41S9W4T7cpTjMRIjIvNMrAnLM6yR8NVJK6cnShA1ua5FzzWh9Ik5JdS7lXZT/68499U2
 wMoVWlqUaAcqcd2ET4REw76CafbiRa/woC4J5TcUpnysZBTm4AiEB9wO9Owi0BEsfuJk
 mwQuM/7+Rt9kc3rLHOqVNOIUQFG9YHD7CGF6JqSq9tuPfVDOgBzjR+Gv4jAoHwhwP416
 cE5/HfreuPOHEvI+9vBdkGurKUPfTDBxG3WFP9BzgvFRnkZtu7oaPsTHpqyBGmVJ/685
 8G6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WvKToV4/Sf6+OaHiyZRW6h48VKRpjAkt0F87hwTlvd8=;
 fh=eU94kqZcDZVbqIRuT8L6NAVgewycClGKtBouPJgA90Q=;
 b=Iic5AZ3MLfmmDgFjYY4vkLYHuUuMnuoilrWGveZB406jC6+yLdxej8E/FifdN28UYc
 fTk9WP2KlnO4Ai8qOFlrA9rIts6HTmF2ElQ4M/O6C8p880SntzjMH0PTJwjd/tzh4+8j
 hcLYi6SDWEQZRukkNh5Xw0GAj8q0A0qOzBH0O1X3LU3urUGwYBGH23oYXrNbknrNqYyV
 2yilg2YZLu6xZczuR5arcV8w8GknKptHeWZK6j4giXVaUt7Yb078SjBx74/B1V0dawsb
 3zqtBcUwl/dpjN25BfNbn0Xd1I/J9O2MKSJZ/9O9UggLxoBtUQmS/OvZi5hYzkzLDx7e
 4mjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791131111; x=1791735911; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WvKToV4/Sf6+OaHiyZRW6h48VKRpjAkt0F87hwTlvd8=;
 b=LPC8m3/au/AJMazkI3i38PQz5Xr0B8SyTrLyd+QjAdtrrlQJw+er0O1Q7gP0/NUUcI
 Vw1h0pcs3QC2isLYkES3rDaJ6PnGiOna9LbZjsVh6+dbyDgQR8x4ztK9571banyiOybp
 OfpsOE6T5L1bc21DHwav1o8JeZTubXUrtyYNW9UpZo7h+i6bT0CutsqsGRIeErNRwGdD
 HRXGsdMbwFEByh8Y5z6PIM2ACuxvMHvPuO6ufnVvodu/Sva4VwhR2nvTnjzXGCFBp5ID
 EAB4+ARkN0NF4TJqhzGYzwOLx2WIgxtDA9Thkuu0dL8AENIG6I0QWQUjj5VEZC8YVa3D
 627Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791131111; x=1791735911;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WvKToV4/Sf6+OaHiyZRW6h48VKRpjAkt0F87hwTlvd8=;
 b=2ZZzae1q8X+6fWqA+Eldx+JznPQlLa8Gx5LBjqmv8IZkn6RvYrXWwxRNlaN5/HlgkV
 +qY7If1kgZiCtR8sPr/ICqgNs1pMoCOYumE1429IgzS5vyyUL2wNgAVot/NH6Vllvpre
 JV4ewF3n7eD6Js4/EWBo+0GD7OYoxo0ZjEXaEOsabsuy/IM8edi9lj0o1GdbZpqFLPgW
 5oCJqNQ5H4o4cwzuJgEp8oarqsmsBX1LGFwUq8jOptVi9+ARunYm5T51Hsly6R6h6qOJ
 wYZ2HPdNA4XJyRAfMUwbvzlmVWN61VAv5M7DsmMS8obuOZYLhnawKKwYadkATS4BOlMR
 ITYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYHBGN/2rKzH3MQ90u9aXTrLB2KsO/A2wbwMLsdkoSJlmkNkSLFODBkbI+NV/qJl7A7FlResK2qw==@nongnu.org
X-Gm-Message-State: AFq9FYLc5kTAlEeZgzz37TAnAXb/czigH+Rr+vl7YNYa0/Ww2PWInKDr
 CoHx2+jW8E8NWiHVfUs/+xcFE6NvUtW+yWR81ylBzOPtd5ubNXDrCN+s/fP7iWgZ3Gim9NF4Npi
 06qGN53phFpKt9Y9sAY3Y6fwuTHNwGLc=
X-Gm-Gg: AYBFou1IeO4/IB1tOFpyFQ1oKgEQ+LiPDT4poy5gNsnhoN6G+t4oXVu1KUlPgTDgStv
 Tr2yaafekXWN3eG/gGJhZlk1WFEBnA6q8A0ywP9P8MU1ratV4WlPGXUv0PRGQtQDPsxh7y9jysh
 3TwmMXdYxcl8hyrYC9y4RfogS3nwqU97A7B29xhyhmZqc7M4WZ+nlZILbq7VeWzzD96eueY4ldP
 NanQQNvZvGMGDu3Q5PBHHCR+V8ONjYvsTJ+XMXEnt+hthJX+nHCfJcg3iyKdmOGwJ3OVtEfzMND
 53Ap19VSiPqD3ZsvA79iSlJ3zwhB4JWBCc8xG+KdoE+B4ct/CHnAQEe+nmN7raEU7z9Yh5eu5r1
 3LcyltMbs+zLyCjA=
X-Received: by 2002:a05:690c:6e83:b0:8a8:316e:5973 with SMTP id
 00721157ae682-8acdae8d683mr54135017b3.14.1791131111425; Sun, 04 Oct 2026
 09:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-29-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-29-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:24:59 +0800
X-Gm-Features: AclHuK_jdf0bdEAyq5jHgex5dK4OM_6A_4iLj_Ekk1aA_GFIZaOhNMlCRVU-nTA
Message-ID: <CAEUhbmWwb_yoM1Hty3FSduC4wGfRg+mzZ4N-qX1hZdmKbEcWCQ@mail.gmail.com>
Subject: Re: [PATCH v2 28/30] Kconfig: Extract config IMX_SERIAL from config
 IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sun, Oct 4, 2026 at 8:36=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_SERIAL to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 7 +++++++
>  hw/char/Kconfig     | 3 +++
>  hw/char/meson.build | 2 +-
>  3 files changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>


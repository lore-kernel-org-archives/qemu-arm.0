Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2251163ejb;
        Mon, 20 Nov 2023 07:14:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYmJwxXSBNWxS58LojDTUUyLSnRsJAfIkwXu2FksMA1c4iqpSneA6u5y9Ii/EjHldU3YBH
X-Received: by 2002:a05:600c:4f14:b0:406:f833:d853 with SMTP id l20-20020a05600c4f1400b00406f833d853mr4940950wmq.15.1700493250119;
        Mon, 20 Nov 2023 07:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700493250; cv=none;
        d=google.com; s=arc-20160816;
        b=KSLgxcjdFc0Qpg9k6DBNPwWCFWLmFNP2mwzBtxtY5TRy9WGRhQIh/EKccplJTJW2c0
         vHVYptBHcd49RejcMln8lGutW/9NRiR7lZW261Lt6Eu3QpGajmtDrNoCmyDQiZjhM+ga
         1P9mX5WK/B8EkE0HS2S5O7hKGdLe7bHmhrpwqBnh8qTzNc4rvVX/x16NrnM/e7QVCP/3
         Wb/0nxYbEf1pF6owhVqQPqQyPiMpQjBKSLuF7vcV8GIN7GXuFOGeFgxiPnxmmyx5pOJw
         tCAgySWn04Joa1mpC0ZBfvF/67h6tGnsjuNZLaQWQSnB/wjjQ+qAiSRH0RyUpybLfC6n
         ToMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=owfh7IYvvjcgubE2cvHa+4n0iTItdhT5WQdBEq+V7qo=;
        fh=c9e8ZdZT8wwMBwRGuaC0xkbztqutrDCy/JBNLaqw0pY=;
        b=dQxOb6ukcIiJgnVNH5Rk58olnr2YZPZNXUFetfFuQkS/HOY4bYJ4zhbL30tCLSDM2D
         ZLhIxeNaht5qJtRyShfFJKCy/2hGFs4aJi5E0IZYRPqvyL/qOXI1CkSTz5dwDmwtJJFW
         GkOQXPap9XvhHK8oIKrpt6nHcc/aSuprTEA9jVmQV5SDIF4bRWLrQQ+8lZX+0ukS/sii
         /vlKr90H9y16Vzz8Ejai8s5jRXxpVvSuMBQgDht821DhNdXwJ1mSwxGP65Mj0nCvJhya
         5v2nXZSXvY8GSqvNQ8Rk6ep0FXGlPbXqLb29p9HJVx8dtbMhyR8xND6sVZm0D1ina2nh
         D+lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EtyR0BPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05600c4f9100b004091f72210esi5011919wmq.84.2023.11.20.07.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 07:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EtyR0BPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r55wn-0005b1-Jo; Mon, 20 Nov 2023 10:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r55wl-0005YI-O8
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:12:23 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r55wj-0003e5-Oj
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:12:23 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-548d1f8b388so1149282a12.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700493140; x=1701097940; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=owfh7IYvvjcgubE2cvHa+4n0iTItdhT5WQdBEq+V7qo=;
 b=EtyR0BPwPH1fiVOLx4drm9ZWESsCWqDU6+u4+nXooJ+4KSJ3SZfXRwLMEpSa/sVzuI
 xnf5gn70Royo+jwiI38d5OF1lnEm3jioOOCqh2t3eN8qyAXEVmzV3uOqoubnCHJeOYin
 bHbmNvJ+ZIA2mphvYl+qzZv9yXV64NIB9ArQHTnqUNtvWx6fjGdRuE94HXuQ+V1Zv3E/
 fsITqsekPX3SoBeBZ84DoDdwWYfr7jdahIMeJYJKN4iid5VC3YICr3QW9nznaYC0wqGO
 +N0Tu4zdGPBpCXHO8gsnmtHZlKhDpkGmc0IH0OQt0PKIswYgVNKkxpeWF8vqTItJDn91
 aChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700493140; x=1701097940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=owfh7IYvvjcgubE2cvHa+4n0iTItdhT5WQdBEq+V7qo=;
 b=Ba28bHBDQHhsNit5sWz3/5DKmSQIvghOp9ZUeZDdOeO6+n9RC+Jfk8wpNFlNscpeYf
 +lDt7mxw0XjIQozoUy6phxPeDEpRqMxLFo5xN4XCURF6NHD63+/2JD9AsdigIic85LqC
 C798Y7fwEBrzw9fr5X4iYCvFZeSMTrfX00r1mUtV8pR5fZlOQFfJX+zpUf2I6hJwtPzW
 1v8BIoigM25eO9HWGc7Ps3uO7K71s6KHdvDftlrCWo/5zG6IUjUG57LxUO9FGLwu1cHw
 xVQ6SvXjvAJLPXutrQGGAY2h4y1auqoKnNRgSmj/ZqF5BgDlFu3c0P/zNiawxinLFyPA
 fovw==
X-Gm-Message-State: AOJu0YyokOgULONYiBO5zAs0pRjZUhF3pyQs1hDzI9PwbuJ9B5hdTW5m
 9ysVoFQbsk/30GMvqZCAUQ9Jpo7EhQKhjAiVfUyncHa4I0bYtlzZ
X-Received: by 2002:aa7:c257:0:b0:53e:e6eb:c838 with SMTP id
 y23-20020aa7c257000000b0053ee6ebc838mr5497382edo.8.1700493139985; Mon, 20 Nov
 2023 07:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20231116172818.792364-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20231116172818.792364-1-ben.dooks@codethink.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 15:12:09 +0000
Message-ID: <CAFEAcA8_sYimPQ2hCT_LrDCcJLVOOh5et9M9yE6mASzr260E9A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc/arm_gicv3: ICC_PMR_EL1 high bits should be RAZ
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: /imRK8qJ+E5c

On Thu, 16 Nov 2023 at 17:28, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> The ICC_PMR_ELx and ICV_PMR_ELx bit masks returned from
> ic{c,v}_fullprio_mask should technically also remove any
> bit above 7 as these are marked reserved (read 0) and should
> therefore should not be written as anything other than 0.
>
> This was noted during a run of a proprietary test system and
> discused on the mailing list [1] and initially thought not to
> be an issue due to RES0 being technically allowed to be
> written to and read back as long as the implementation does
> not use the RES0 bits. It is very possible that the values
> are used in comparison without masking, as pointed out by
> Peter in [2], if (cs->hppi.prio >= cs->icc_pmr_el1) may well
> do the wrong thing.
>
> Masking these values in ic{c,v}_fullprio_mask() should fix
> this and prevent any future problems with playing with the
> values.
>
> [1]: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00607.html
> [2]: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00737.html
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

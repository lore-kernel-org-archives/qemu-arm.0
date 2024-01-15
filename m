Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp296957ejf;
        Mon, 15 Jan 2024 07:03:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKOTAsxwKw10b/e0gLvQzFJQAmlKdAfmY/WTXCFLhzW59una8a4rWHS8M5iAypjllh+hMz
X-Received: by 2002:a05:620a:3798:b0:783:1510:e0b3 with SMTP id pi24-20020a05620a379800b007831510e0b3mr5859355qkn.124.1705330995624;
        Mon, 15 Jan 2024 07:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705330995; cv=none;
        d=google.com; s=arc-20160816;
        b=DGVMQpsTQN9Wf8O0gUwCUVOe7qKn3SM++RZLy6whm2M2hPw44UxSdHj/dfO8vbhTKx
         So54xa6HpFNkir/ens1UVugnfOYoK1OeJvA+QEKecYySV04U4XB0Ji3UEa1m/UPuvMB2
         PKolXun91esY8co/T8CcvPcpzr2Q1WAEuolGkpj8kocDeOS7YFyYMuHg8mHr5K68ujRs
         2Y56zWn6gic+RDFHieIOSplPvmE+KLVAhQm7pEaFjqqMskRT2/+hgog7frveBRwUYDRA
         cC/xGZ2RfX+g/TgECC0W5gXdIc97JtEvGC5SShHHXQiRvEsw89xVacuYR+6HXlUTAij/
         6Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=z3c8zkoRhsVi+0uZ1PyGRmF3XCzLQlmD4zvD4m3i0wU=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=SaeRepSCy5+wcIrUzSKc4NENwg9q60i0gMsxC/mo0I3LOlyUGmmQ0/4qq19lJcIqZi
         2KPVGgfowuhjp4i52nAJZOR02+meV90s75v3IljsTehO5rhJHWBdp/jBiM24TuidNW3F
         vwSaP0P1VmpdGEvjcOx0rvXmYtCGl6R0z9x661P5OCGL+1IegC5BGomi3rlcEA4dq7FI
         2czXWORD9EcRlOGDnoMJ2BjOgr22NO6Kd41j058Q7IhzrewMngdh4y4IvlGFz+x3NJGK
         jyr+EXj++y222Xz/BQiGoDqdQOVJrgHjutr6Mub1X59m8BWQcCeB3uMbw5d6qhNywCwP
         kZqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EfyVPc45;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05620a240200b0078314981660si8768740qkn.134.2024.01.15.07.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 07:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EfyVPc45;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rPOTy-0005wm-Gs; Mon, 15 Jan 2024 10:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOTw-0005wF-UX
 for qemu-devel@nongnu.org; Mon, 15 Jan 2024 10:02:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOTv-0008Rw-Dj
 for qemu-devel@nongnu.org; Mon, 15 Jan 2024 10:02:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-558ac3407eeso4672940a12.0
 for <qemu-devel@nongnu.org>; Mon, 15 Jan 2024 07:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705330949; x=1705935749; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z3c8zkoRhsVi+0uZ1PyGRmF3XCzLQlmD4zvD4m3i0wU=;
 b=EfyVPc45V/F9Iy/D5SA0QTAmwWTD7ER/2XZAquQn/QLbK0SC4wc4Y4VlAHOVCCKJVR
 NTjtDp0PDfKYNQgR1fH8XaZ0t3XZCslkTzfthYwmINZ7GJP+nf3/tRurzL8nu2/2VxB3
 gEGS9Thqk6hxxBGiS188Nw9v0Dc9LXeSLrpzhz8ImzeNrhLK2Fvx6LVffj0jqD8Vy7ZX
 qjiIXUB7BVHKTcplA+uXYUsOr6PvkUYKlqpyOeXP6Y4fVy0rQkH4S9rbBxsyGa/RCLJG
 cM2hybHKkuBSzDr5hBrzJOni6YThyuoJZER/KlhFNvqaESz9WoHqxCSEmlrRsrLNSQXY
 st5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330949; x=1705935749;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3c8zkoRhsVi+0uZ1PyGRmF3XCzLQlmD4zvD4m3i0wU=;
 b=nW0tvelKpiStJr4rfXKACWnzItait1Hr2M0eOQhJIXrCQdWIx2W8/VfBBGM4R4KTTG
 pKerXvlEckIlHMAeMKU+n6H75ngjRN0C0irzgrB8aHTEPXsMBIAjaCDQqsQuMMl8spB6
 m1a0LDfMrblaizFuvbkunm96exG+Zbx8/NLAlE4R/O8ypvfgzdk51RfechZoK7cveeHn
 QCPJE9tTe8H/8T4PFIPK1yDCnP6GS7UKV+496qgf6YDrLLFTHcFuzXZKgIcSZtvK15If
 ZCTdqHgdKfEqpzHf1OlWrJQDVk+iSZPvBHgs44A9sB4nXlW0FXoWNYkSA/9WkdZRI7Na
 ZXGw==
X-Gm-Message-State: AOJu0YxUrG19lvRkOd11n+heLoLgq2r/DzXXxkNSsqJNVFWcRWh2ePTE
 TzAM0DFhhANrRuev6cdOx1YcbXuIzXQVMrJGNlJy5DKga8dxJg==
X-Received: by 2002:aa7:c69a:0:b0:558:9a77:63ec with SMTP id
 n26-20020aa7c69a000000b005589a7763ecmr2777669edq.47.1705330949621; Mon, 15
 Jan 2024 07:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-46-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-46-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 15:02:18 +0000
Message-ID: <CAFEAcA-gq3C33ou4HnAX19+Wd2nJf92QvBre35CRnS6Nwx1AYg@mail.gmail.com>
Subject: Re: [PATCH v4 45/45] Add RPi4B to paspi4.rst
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pDYGTe+oJ1QB

On Fri, 8 Dec 2023 at 02:40, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  docs/system/arm/raspi.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Typo in the commit message subject.
Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

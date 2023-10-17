Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4049354ejc;
        Tue, 17 Oct 2023 09:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZibN17Pzhn+jJWRR+SP6BXUlTt6Pc25hXaPLvNafoxllgRJJYtitO028Uf54W0NLugjJ4
X-Received: by 2002:a05:620a:200f:b0:76f:1f05:e994 with SMTP id c15-20020a05620a200f00b0076f1f05e994mr2720516qka.64.1697560301646;
        Tue, 17 Oct 2023 09:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697560301; cv=none;
        d=google.com; s=arc-20160816;
        b=TPoi4bK18t0mk6Fr3m0KAqAPSgfvkEMvuch5o30w2ccexP5Ml5VNYh3UGSm+eW5LnG
         cdvQudS2g91OMYFlN/2v2QeTD/VKwbf1h2IKZYrdTypsN51orY0Mxg4faSPZjU0GnTxX
         NvM07YutsQ/soU1s1/yqlZQrRlNWQZVeIuZJm3jJwkYG4e6E/NGtD4Wmw0eK0FaZ9ad+
         0jVHb+gL52qaCnJr8ju9699V5AwhDo/GDaq/vkUVRaXmbfSuw/HfX6WASCuJSB90Zep2
         oyLpvaH4E9FuypRxooDVOCQm68B4HGT3etF3fASpUhZQX0GCKJRxlgzFs8AgzON9Qbao
         6qQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8+FdS2Hh0u1oHoP7gY5vka4xuDTHAmavulQ/v+ehkN0=;
        fh=SK5x4hx8wvzk6BSdv/2ji2hc+6Da5OLpfcqaB6Bkztg=;
        b=oDMdKqcyjhWlK4zdNHZaQQ/uoyZB2NmvcimcWECXm9G9qgQenqLKqUbeHHhTMmtmpk
         ZnMVlmhjwKGV9+0Tm0RWy63RmRoONCi1qWkfB6j/u4YnHi32HPxdvuD0OBvGZCmJ6LP2
         I5t1py4iJirl0/QX/HMf7QgJ8zHjyYDI3GltBxNlaym4iaSL5NFyyq9YU2F3P8TFQHaF
         scLyg0WV8lbJZFrMZ3t5ELJJYjMBNduwuhz74SK3lSXymW1/qsvPeAY4iXkEmtaZvd9H
         YTbWBntcLCSF1lfqLNBBYylO+NYOoYdl/NgP9NwrioZsF96D4ah+gRI+YvzM+0eMf9WV
         UH+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0XXX37a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05620a290600b0076dad8619a5si1381877qkp.284.2023.10.17.09.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 09:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0XXX37a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsmyZ-0003iO-6c; Tue, 17 Oct 2023 12:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsmyU-0003dy-CT
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 12:31:18 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsmyR-0003DT-Uq
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 12:31:17 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507a3b8b113so4224619e87.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697560274; x=1698165074; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+FdS2Hh0u1oHoP7gY5vka4xuDTHAmavulQ/v+ehkN0=;
 b=A0XXX37az2stadykGsqhQeQcHJerSDf7kKTiezEH76c+QYgoXPahISNaoTxLQm5Qik
 tVxWLkcXBS5MxMZAKhq3UyPR87eutjUR6Nz/OeHAcsMMKlNnpmgmWFqO4y+fU1UslhJR
 Iz1QJj7Uu3dpASCffEULJ1FyvZ3qr7rKSPpqsddxtE/Ui7xRbuJOLsVJlQ0Cho0v4cfY
 1SE9dPd9WPktPbzK8x0EsLKNHf4lR+Ztqw3ksh89Pqeb3/oR+tNXNlRxQy4e0SuSzuNh
 Fz3nsocifjmlLcml8OREIrbsp6UbljK3cyLx1T4T+JXgTuq8RhbaAeuSsQgB0C3vF1Xr
 cMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697560274; x=1698165074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+FdS2Hh0u1oHoP7gY5vka4xuDTHAmavulQ/v+ehkN0=;
 b=tOhJqZD3BkpX+wrsw3sk4FD7Jdl2PaIWFHyV1JGR3hFCHkT+gPpa7zAFaRuDjSap+j
 BzrjYva7kl2xnxuB1W2MNC5ibfY6hFpASBwal2WXQGn/hyEva/T4OIn0mvsCSfdBuAqm
 iZh8tZrWt7HCxnV4HV8tyVPWbPdLRHJ0y27mhtd7XAj+5tw+IZdYGtYsAdF2RyIKeEsR
 xu4B/yRIuZ5nu5sJmewLAym/yARxLhHV+ffO5zzjomPFexzp1tkVn70rWOHkD8pCNyzg
 BNlYkEuq0UpbWryNLaJdFYphcdusXWR9KoIZd5D63PKpDTMESMuI3lhH7RItktta2Pqt
 PgYg==
X-Gm-Message-State: AOJu0YyG/845NfwM4tyCRgD0Dkin5zs8gAIr7C325guYPuIi/2kay0cF
 5aRI3bvf67xd76n4FlmCQa70ooPP9U9ofhUgk60Ziw==
X-Received: by 2002:a19:e05b:0:b0:504:c83e:322b with SMTP id
 g27-20020a19e05b000000b00504c83e322bmr1849374lfj.38.1697560273932; Tue, 17
 Oct 2023 09:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-2-philmd@linaro.org>
In-Reply-To: <20231012121857.31873-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 17:31:02 +0100
Message-ID: <CAFEAcA_tzc+BE237U1pLZ1JO6KCqLvdbR6LMhZ_0VNC7m73dCQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/pci-host/designware: Declare CPU QOM types using
 DEFINE_TYPES() macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: KPtDPKj9GWDY

On Thu, 12 Oct 2023 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. In
> particular because type array declared with such macro
> are easier to review.
>
> Remove a pointless structure declaration in "designware.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

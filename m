Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1101086ejc;
        Mon, 11 Mar 2024 03:37:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6FDe7/N0MywgSUk6wWRmarYVrb0bHMiMmkVJQ8LrIItWfOaBGMjJqaJS9L1JkcEgALLRMuhek48nyWdbpeN1gOmVmFLEv
X-Google-Smtp-Source: AGHT+IFSw0B6dxK802Xq5o9sMBnr+uyWGssMO3ARleicRp3QPywi6wIW1D84RjjBodK+xV7+Wta5
X-Received: by 2002:ad4:57a6:0:b0:690:ca04:cec4 with SMTP id g6-20020ad457a6000000b00690ca04cec4mr4281799qvx.52.1710153423499;
        Mon, 11 Mar 2024 03:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710153423; cv=none;
        d=google.com; s=arc-20160816;
        b=CTe6e9wvUuBXLC+0aHqM00J+NrlV4f4teyx1BDuFOzkVd0cyTWNw+eLOGZnwMV8+kV
         mJAuGdO6DMJwqFQvzVPVeik9GYNZGGD2awax2URZTkHH84FIoGLawl0Tc5xCLuQjf2yz
         jGhd+GObHTrEzjEgaENXtZiyIZU3qEGg2RZg83UsUnD07eRB575luTA4Hv1qQnW5WRz/
         WvmKQVV00t3SVIeTA7SQ9wnh/iXe1zRj5IlruxzUPqcUmde9YxEfRZYzYbl6P/u4UCA3
         LF+rc/6GU9F3qgQjF1rLAdFF6RA8Tt4shVOuwxuBveFPPkQkA9AICwJEck8NFgKC2TjQ
         +M9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zp/MywqdKGQLriABJtnLsQNpE22xitl9JDyNyvgP+3k=;
        fh=UUZCqJUd82M9Tc9PpfB/wn6gOkBrUBw0KKD7Zku7ZH0=;
        b=Cj3UppsKP4mWR08hLxJWcQukNsvdKRu2pYf4zDu70mmF0AAL27F0CAxuzTvWi+KOL6
         1iRoVas4AkMS4l9qvwP0vKiacm0O60KXzdf0gfDiBb3I1FoNi+u5QH+Vskk5TnEgV3ow
         9go2g6tgm5pPot2Zaln8DJatF85cMdvGld0JrVaEOJdb31cLxMcEqOdY2N60vk6UNZxx
         6/RMUwSfPuLpv8sUikMkpz+Jjy0kiovLyMqJZmIekQHmEtY4qLzZbQnKeNVmeKY+Nd3A
         H+BNqsbR81gDPzevvXYuD1HRkLqbKTHebDXASHijs/oRNVnZoQGM5LUxw8hUqn0x7lus
         UR7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFNIUILz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke11-20020a056214300b00b0068fe59e447bsi4971427qvb.315.2024.03.11.03.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2024 03:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFNIUILz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjd1S-0004aN-Mr; Mon, 11 Mar 2024 06:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjd1Q-0004Ze-GL
 for qemu-arm@nongnu.org; Mon, 11 Mar 2024 06:36:44 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rjd1N-0003TP-Nu
 for qemu-arm@nongnu.org; Mon, 11 Mar 2024 06:36:44 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-568241f40e9so3759102a12.0
 for <qemu-arm@nongnu.org>; Mon, 11 Mar 2024 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710153399; x=1710758199; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zp/MywqdKGQLriABJtnLsQNpE22xitl9JDyNyvgP+3k=;
 b=PFNIUILztkORRpTmMuHC76NlWJrBWI5MzPz+fI2hjFCpx3TzXFOyuKzNbmoVVhMQPQ
 /hQhKXhNy205Fh0MLhlvDwftjdqvAP0z+NsdCqzdcmf2UuMdInTQM+P2hwu6iQOQlC88
 Z7MHn1Kex1ahym6ycWZiyt0HPyWymRHGVIYcpyZg7cRmiQ9KsQYjoVNfdGUoV8g9bNBP
 RgpMTshQK3UDXU9rxWH6KkdW3ynvLiE5764ABzev0Xo1wzDvgR8yDh0hkdMRDRG9ZZhU
 qb2XQofPZv5p9zsSyzpVpqeCqQSGZvsQDFQJBtZ+rPts65IkUMuo80Uip0OcdS1nB/1e
 i54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710153399; x=1710758199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zp/MywqdKGQLriABJtnLsQNpE22xitl9JDyNyvgP+3k=;
 b=eqUpwPPy6KRH/EfLj10SGDuNTsKVrafzLxfTI5DmrIDdurBmoq8csXVz41eFRifvcY
 T82pDvTghmze26et2VlErfaTgVcSGzy8o4XJw9mDUAkuG5NbjH3vSZ9xSFYCii4Q8fyE
 kY6SpGls78xEUKDrCHFtSoXNw6neNWA/pTY32YqApw11Q9X2hwZzXtDa8pCdGxBnpmRQ
 TaZZLxQ7V6dMgpC6W0YjSEiJQFa/e77wtjv/u3+2h6C/MkGMSJvAbT6SJz9ShN/em45f
 dQMPrGGJclxES08ADkmEiTiZ3bLN8HKhes5MbbuAWkb8Njcv5IvSvNVsTI5gSeen9gRm
 09Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXElDL49DDi+LWE+wasNEdlp66G2PuQDkInk1xSunc9umzdw6tef1bEXo9lVGbqXIbijUGED8msa/g9z1NahCJAF87f
X-Gm-Message-State: AOJu0YzAUHWAImwqs6G1ACuckFD6MG+CY9v7hLVhh5QTv4d08it2JJT/
 jLVQbsE8NBEp1oqMD24po//oA75/TeJJpDb4V+qmUBp+Jf5Z40WOm/Vt7W1kf5hNh/2dThJ7wWf
 sR5SerwNAwthaggoYW+BMd+rNtkbMxgfIhAaQFA==
X-Received: by 2002:a50:c35d:0:b0:566:95e3:1759 with SMTP id
 q29-20020a50c35d000000b0056695e31759mr4235768edb.26.1710153399038; Mon, 11
 Mar 2024 03:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240306035721.2333531-1-ruanjinjie@huawei.com>
 <fd515ea4-ca4b-4d54-9d9b-59683ccd683e@linaro.org>
 <c57f3338-0f38-1768-7c9f-d2b00a0cb158@huawei.com>
In-Reply-To: <c57f3338-0f38-1768-7c9f-d2b00a0cb158@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Mar 2024 10:36:27 +0000
Message-ID: <CAFEAcA93u-W5nr1bfQJPp91w0pXRomgoAUMxgyuVeTVFYGNpaA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 00/23] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kgYCesqw2R/4

On Mon, 11 Mar 2024 at 04:00, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Ping.

Hi; this is on my list to look at, but since it's not going into
9.0 I'm afraid I'm prioritising things for softfreeze/freeze
period ahead of it. I promise I'll get to it before we unfreeze
for 9.1, though :-)

thanks
-- PMM

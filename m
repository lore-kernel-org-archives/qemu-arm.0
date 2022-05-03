Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1542263lfj;
        Tue, 3 May 2022 09:50:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzlZa6Y+YVpumhEmVzMcj6go+/VxGlQ5D10Fx9UbA6PMqZ1bidNnT87wkK6hpC5InPlQWX
X-Received: by 2002:a05:620a:cd7:b0:69f:b1a7:d1eb with SMTP id b23-20020a05620a0cd700b0069fb1a7d1ebmr13112586qkj.5.1651596628808;
        Tue, 03 May 2022 09:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651596628; cv=none;
        d=google.com; s=arc-20160816;
        b=dSLhl2e9kdZ96rfKyCWCYyvWUogOgN0OSTuu1E5rwqHYvb6BOB1gQzSM3M34/oI3ir
         MZaBdZ/QdlFwyPCVz8i3MZHyUlWFlrxKDCFODEBJB6JFXPv+a3D0b4V6bzI1F2cpyM9I
         4KCysMys1wkgve3Lmxw+63vg7jvLdn6qaIkjjj4Hxjx2Mq72eG0jCgjGq9+x3CniYq6b
         S6SkhCDV5twdcLEovBtJDh1uoo3O2PtRDZOqNnai7G40lCNYeHpMCq4wLLuO1AuNBZQ6
         pS+pFEKyppmxqmtrhrFSXiVDPwqKc9six2xJyes9W8DQd5E3Bbx3Vo9doQhy1lM0mwSH
         /ozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=izkeOjB/U2viz78orIo8nsnSJ162RMifJ2pvrAeLNh4=;
        b=KX/yTO0DkpbBIVaL75IZP9tSLKiMlCsOrerddR/ahoGacOueH1XOBc21y9flUjHkTi
         NL6wKl2APKgJzmBDFHGgOvswtT+FAWLMWnWlMxoUzkhj7AqxHS4JJ40amnT/AtHx9jiP
         kMOy8gK/vi5XJcvyLNNqzrYGQ3vBE/Z/kx6EgBWwhAfO22wTCiP+yBtuzomXMB8hTs0p
         aZxPb5NaTSjdygLlKX3fgq/PuC3kUpPUMc85V8UesXEJYtdw5U5meIRQBwT9e4pevcFP
         DMdOkhMmIh2GMfIt+aGBFosIKQbcdc/05d1nz8n6eE0kKXiJk+4uSAXgzw3f9nA08DxA
         WXzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="z5ZIUt/s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020a05620a268200b0069f566614fasi9053855qkp.297.2022.05.03.09.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="z5ZIUt/s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvjI-0002jv-AH
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvgl-0000V2-GY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:47:51 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvgj-0004vr-Vr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:47:51 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7d621d1caso185876777b3.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izkeOjB/U2viz78orIo8nsnSJ162RMifJ2pvrAeLNh4=;
 b=z5ZIUt/ssZ470V1rV84+9xYGqyRNuOLWxO3voUMReNGh5tR5gsznPj+sZTtmo8ttdy
 949B+GbvHnMEFJtmE0pQpS5x66sD6QGhy1Skrh8IoxfXasz8nHb0TYuwsnHHNonboj3w
 dT26elWREyZ5N7SYD0fGz2OL5TQ5D3f+jg1X1Qq0uCCudFAugcg0QTIhgtcD/LKrxsZz
 gWR9PFJhytbIBQCmlBIII5+npnFEIv4mnifOjN8eAdW9ypPJXawlkUBEHBgcUTVyVg24
 7DpuaUaQChmUmTlAK6La5vRaKLBRqvnGiFDbieBo3tP0SdyoGkbDcQkuzE5zSZqfQtH6
 UFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izkeOjB/U2viz78orIo8nsnSJ162RMifJ2pvrAeLNh4=;
 b=DGfBHvCnzjHo5DN3QJNTJXQk/yboVjdx6isni1uOw2ipg8WuySu4Tvc4I7Iwn7NrDi
 2mFsHhpFriJg135x8vKtePPPNT0607ohel/ytR4oXtl90tZT9CAsJw31mGL4zQ0rZ4Hq
 ALqCOcBaGdj+MW4d7KdxxuiFQKYagBxz8iNHOM1JfqQFcF0mWS6qO1CFuTUwPt2QrGcv
 wapMLEO16TjQqGjU0gk9mL/S+0ernJNij3QssvusuU1Tsv28IgJ/x2vQGlqOeOYljM/2
 qZmsU5ncdPwawmlp7NhDPpQiJzbO/huNO/HwU2DkuuGdbbTi82h8Cdo+rpb2Wmg2QqYk
 +9Xw==
X-Gm-Message-State: AOAM530M50v4c5GC+SqgXqzH2b/MjALjmWsbVceb8OqayIPdhZgs8auo
 eUtzUPPR6DL3jkgJFRGL1oU7KLhH/2cN0jYKUjQl/g==
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr16879733ywb.469.1651596468974; Tue, 03
 May 2022 09:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:47:37 +0100
Message-ID: <CAFEAcA-GDPPyviT1Y3v6HameLfUU3B2mbdEV-5hO1SupXbsLLw@mail.gmail.com>
Subject: Re: [PATCH v4 00/45] target/arm: Cleanups, new features, new cpus
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /yZi8087Nz28

On Sun, 1 May 2022 at 06:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Rebase on master, where the first third is upstream.
>   * Split changes to add_cpreg_to_hashtable into bite sized chunks.
>   * Add ARM_CP_EL3_NO_EL2_{UNDEF,KEEP} flags.
>   * Fix access check for SCXTNUM_ELx (damien).

I'm going to apply patches 1-19, 23, 33 to target-arm.next
(making the minor fixups I noted in review comments for
patches 10 and 19).

I do still plan to review 21,22,34,41.

thanks
-- PMM

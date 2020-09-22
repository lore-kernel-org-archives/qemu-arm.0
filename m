Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5261402lfq;
        Tue, 22 Sep 2020 14:12:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsTMPBhc+UCocoIiyB52JTbfx6yGO3LMeoYM+rdR7rgrnzQYnKbBl037ZX4Ppr5Z8nLzQC
X-Received: by 2002:a25:4207:: with SMTP id p7mr9307748yba.411.1600809175838;
        Tue, 22 Sep 2020 14:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600809175; cv=none;
        d=google.com; s=arc-20160816;
        b=niTy+E6CjirDwO7DXF7CZCiNrUjt2KqAsbfC9R0/bqzhkrbZ6fg4q7Eo2ZHAvQ+r+7
         CwwMwOreKE9bbiUP7vXK8Zsa9gpHxdPWuWUqXFUop7kqFpvVXnMcgZNhREiDk8EVWsD5
         UQZLz8a63iXZCg2NKAAQnmNS0y4oi+I8mT+hqoTYhCc8L6UmDhbHkP8IGt4sATHFnlBZ
         sqkJKByV/IZnO3pvz1J/wLZ1R1G2mHvBINRkuLbQFFCinB9xTeqjfVOqWxg4MdtVrVJC
         WiPSC6LjEluAs3vOzkrF2+ereZYJ/x28RSrmFvpK/O3yA0tCsHdKnpJqiDHUOwt2EcCc
         Rp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/ipl+rogTiPzM94V0fePhfrN6Rn5ekEkWVt2sfv2VQ=;
        b=XujI4Pxv1eiGBQvL9GiN08uyWzskeMPm40dvGm/2HW82Sa0+QfVGFz7Xp4Hj0hibPH
         KHvPlHnfMnx0N9WJMHx30ct5yvTWxJlF6SvWiFqngMFVQ4bc3KKZOuxMajPqkFFC9LZB
         STVUdhMGCza4ydOMvGcWxlN/6obraJer08PudHkKHJ24K/jZfLGFQMox6mt1B6U+wW0W
         JD/EmaSHj0e8bVJXI5S2EFZPrjRsDQKBIeWJZZPBGRAB5SRQVmAmuUQ8Jz2gt6xuQGj9
         Q0n0GteopyKGDG+FFn7irltKoHlgib2jaM3483ypUt3zumrMFcmbkzYmdK4ZSEWkl472
         l/nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MWcrrGpL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si21477072ybc.228.2020.09.22.14.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 14:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MWcrrGpL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKpap-0008FB-5w
	for alex.bennee@linaro.org; Tue, 22 Sep 2020 17:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKpQD-0002Vu-Oq
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 17:01:59 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKpQA-0004eB-Nt
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 17:01:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id t16so17587778edw.7
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2020 14:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/ipl+rogTiPzM94V0fePhfrN6Rn5ekEkWVt2sfv2VQ=;
 b=MWcrrGpLDF0v9wJHSFto0AqVlUuZg3CFNPjrlcg1l9rCMPkDL/iD05yc0R0SJELtjJ
 uKRVxG5KOolCHVFas8B6KG+ur1B7zfZB5p5wBS7TGrD23A6mCWfE+Eo94k4p44byc2Rq
 g4wdWqxATK+wQmTPX5Al/eRkso8EMBByhMsQi0gU62q+lNe/eWnvs/54jHwAIDS23tvt
 0zk7vhiK5DEXsHB66RNQkrNzuuqun/ZZH9mMCYLoRDs5DUskKibB/3ytoKYPKwbCKyJn
 d4zYGpCiV9AzjSd6AUSeUVW4Dp6jd7Xp0YIt2n3fpTmdSUZ3lIGU18O0oPThd7+1E76P
 9erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/ipl+rogTiPzM94V0fePhfrN6Rn5ekEkWVt2sfv2VQ=;
 b=gDyjnyod3Mju2W/84Q50zSAnWs3m2W+/Mqcu1U4GXcrycyi1a8RjpF+bDbFEO356jG
 zyn2yfL5HEQyuwmCS1NR3HLoPy2DQlaHh3FhKroiC0jCx0xt6WOyJHq+C97oxZPPEEJa
 Qyxi38+0V3M1wnf8ugaWwbvJfAgyYaLL9zl+kc/R8q8XpHYlfc0w/AxrNroL5v9oAIxo
 VXzDfvAo8WC0GZOUppHulE4Kf2ajW3jrK2jql9bsG1aFwuCzLQv5hsUqutEw8NX7A1xj
 V9bFTNj7piUz0dQeeszkLU9eqG/EYD61NqZmNoOfXRv5ikxhWXCiDqwYG9+WoBP8FDJk
 jLIA==
X-Gm-Message-State: AOAM530lQBItzS5yEiahzpxz0Npvze1pXbbp2+l+8AHlLY8VFdzoZ5lx
 1BAWaZ/3UAhxaYwSmmvJJomyveUkHAvkuCFjaU//wg==
X-Received: by 2002:a05:6402:1495:: with SMTP id
 e21mr5930780edv.146.1600808512965; 
 Tue, 22 Sep 2020 14:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200921110929.7410-1-kraxel@redhat.com>
In-Reply-To: <20200921110929.7410-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Sep 2020 22:01:41 +0100
Message-ID: <CAFEAcA--PkErHfgZ_OsxyhdsXtipLvszVBe0UwMmoS3DJM113w@mail.gmail.com>
Subject: Re: [PULL 0/1] Input 20200921 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TR8trbzv86Xw

On Mon, 21 Sep 2020 at 12:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 053a4177817db307ec854356e95b5b350800a216:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/fw_cfg-20200918' i=
> nto staging (2020-09-18 16:34:26 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/input-20200921-pull-request
>
> for you to fetch changes up to 38b01a997e6678b4ba86ab12a78a39b7d94ee7d0:
>
>   hw/input/tsc2xxx: Reduce MouseTransformInfo structure exposure (2020-09-21 =
> 11:22:34 +0200)
>
> ----------------------------------------------------------------
> input: tsc2xxx fix.
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

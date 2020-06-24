Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp689585lfm;
        Wed, 24 Jun 2020 13:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVNzkAnhqCQSI9BzSTCZNS91qqXxjMeAnNUn8qJzvpz+e8DvkL9Waj5Ty86OHfHMomNbNd
X-Received: by 2002:a25:dfcc:: with SMTP id w195mr48772805ybg.372.1593029139526;
        Wed, 24 Jun 2020 13:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593029139; cv=none;
        d=google.com; s=arc-20160816;
        b=X0ryyFuMcfFfwLJ2l8EY+TsowPb+flvclvHBvqsBc0pqABxo07mEVPe4rnj6B5NYkw
         Qd0xRJe9We7SmQNpEDM9DsiHZeKPQXx5+6+qEAdx1svgklszbp813YU18epaAJ+6LEEN
         5DlA0vtu9Y5i3JwOFhBmy3+KwQnLY9KHrnZNmyfyK0zDpcNUX+bTgq0U3cp07/QIZYi/
         zop9SHoWB/Dt8+cc5of3wvg2FCIPD3Oe03LKFChlEhf9XMW30erxcuw1evxvnRmok01D
         mAhqO0BFCMoMImhiWoUjWpVzqczsNQsubA99u4JzLy2D1OHssYLa6bCPd5eDjgPYKyXW
         RdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u7yKdx+/jzRdIIBTYmDiCxsyYpVaZsMbKZqKsTdmFxo=;
        b=iGIk3jgvnMcLJptTlqVXWzqdcJurbXiHl+cKNTa2wJbafukESwvjsqkSK48whxFfdo
         nJ1gjUppQeQzdHyP4fQaz+6dJLrgauI4/rYFKYWbRnyR/05LIktXSrjaEH1YumRxaKMt
         tA6h9dcFc9ZYEms5/Uz7oKSjOuxpXP4FABdjJmZGbNfV7fBOZf9vbZNXLMzxHyUIa96/
         +u135Vy7ikrelkiNMoZkiT6SvoOCNVp8PeU71mfRoPOnvlYabwpOKtKM73L0WVDc87AA
         OskryCzmrxnwwFL+aNDUQy7lqeT9Rk82hKatLxpjtlkIGHfZvJ0VyuzibMYql3QVMOXk
         QGDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AP/flQm4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o72si21008523yba.186.2020.06.24.13.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 13:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AP/flQm4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joBeM-00080C-SK
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 16:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joBeC-0007z2-Kn
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 16:05:28 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joBeA-0001fN-RD
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 16:05:28 -0400
Received: by mail-ot1-x335.google.com with SMTP id 64so3133863oti.5
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2020 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u7yKdx+/jzRdIIBTYmDiCxsyYpVaZsMbKZqKsTdmFxo=;
 b=AP/flQm4Q2A/5We7PqTb22ZyWPQ+4vfp4RH4jH51aeFkoYZ4DNtVWEaZYR/kTYEcNN
 5eYmRe6dNydYk3fjzlkyyuv1OOztsoQlZRkgiilfyfB5gdp+7A1XW+bDY98UOE4KVPA9
 Ptziaho9FU12SO7ZVf5gqgRqulQwAaYn86tS/FYAm3xRymeErQWQpHskdQwuRECSs2b+
 j9F2TbsgsQXtoZRyygokdrSkp/0ts/HnQKWgN85IKdpHpGkhQ4hLL0AZZHWbTbkpjbA5
 jPwRaBcifqoZUn+pSf6ohXjCiotiXOvZ3DUarUSban4vfJPUBT7b0INua71IzWv9PNvK
 6nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u7yKdx+/jzRdIIBTYmDiCxsyYpVaZsMbKZqKsTdmFxo=;
 b=uZQgfFdSceVRgzpJTylkOWYu4eQvRFKn0IeDwfbCKar11ymw0PmiljBYTSmCr7MPIp
 fWDdixcNuuQr5z0Md7l3sN66UofSv9iky+Rao+4qDu+7H3LPci6J+liQcWoOdgOOSFDT
 xizsDSMn0De2BJ8ro35qk1YHlqtBUIfXpAxfpJYIgxNHS6ot79NepDw5TUwxMiF9wadS
 NBAnU4cg4tW8QKCWYjSr17GVv2cIgpkUaAcenqHuGZmcK+UCa0WJ7RwjTuK9wnbjqdVm
 Q5LX4ziKbP+raeB+9DzX1Bd+tD4xDGJJMxWcKNcqMl9VM7MoFfauFUT15sq8u3+pJjny
 JYsw==
X-Gm-Message-State: AOAM5336LlbiCECtVidYLcHcmuhY9/9YcZzMEUWDmXQOghqdQuoXFvkB
 LkKBRCgXIsvJz8rcOQpOt93IzgqI/E8WEr5PXPlX4A==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr10088280oth.135.1593029125173; 
 Wed, 24 Jun 2020 13:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
 <20200624160834.5191b73e@redhat.com>
 <3375d8e35d3a481d8298ce3e6a4ce531@huawei.com>
In-Reply-To: <3375d8e35d3a481d8298ce3e6a4ce531@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Jun 2020 21:05:13 +0100
Message-ID: <CAFEAcA86O0fWFR05TZ2bpdTNWW8q5PFanujMiCejfLS+HF1qNQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm/virt: Add memory hot remove support
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "mst@redhat.com" <mst@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TYc6F7dsOhVm

On Wed, 24 Jun 2020 at 17:50, Shameerali Kolothum Thodi
<shameerali.kolothum.thodi@huawei.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > doesn't pc_dimm_unplug() do unrealize already?
> > (/me wonders why it doesn't explode here,
> > are we leaking a refference somewhere so dimm is still alive?)
>
> Does it? From a quick look at the code it is not obvious.
>
> pc_dimm_unplug()
>   memory_device_unplug()
>     memory_region_del_subregion()
>   vmstate_unregister_ram()
>     qemu_ram_unset_idstr()
>     qemu_ram_unset_migratable()
>
> If it does, then we may need to fix x86/ppc as well.

In any case this patch is now in master, so if you determine
that it needs a fix please send that as a followup patch.

thanks
-- PMM

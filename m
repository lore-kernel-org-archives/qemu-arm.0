Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1474364lfo;
        Fri, 4 Mar 2022 03:01:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfOfHXpxrpwLie1PsbA8s+/OHoyXokx5hEFyfxQONV9c7nLqjn6ZsR42n7dStVTxHHcnxp
X-Received: by 2002:ac8:7f8c:0:b0:2de:2bf7:d611 with SMTP id z12-20020ac87f8c000000b002de2bf7d611mr31621835qtj.353.1646391716996;
        Fri, 04 Mar 2022 03:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646391716; cv=none;
        d=google.com; s=arc-20160816;
        b=w4H8RunxU+Sx9T+yJuv4H35JW7aGAFXSwF6p7/HPMjb+ufOZtyum6EUFIjn1fNS/ie
         omWkK8ZONsRp1YluAJFffXYG4cw7DDA2+9qrE5N2/oC6EWnVqC4SW/jbHdzWC4z7Pf/X
         7sE9/QaYPQFIEZ7Qb/ibOhKCMfI4kLg4yqtPRN2ZyWK0WuFM8PtsjfGMskzVnEJcMcdv
         fsbYqVyjRSGvV4HSo3FRCSUG/4OV9uJ3ExUc9yeSeS3djUduL7/5EqMvVsFLASOZ9pol
         D/AQt6CWlAsR55YmAyIaodtva4HJP0jvr+V4vOB6hTrvI4IsU5/7HrhiC1jSjal7EcuS
         Xiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IEqTOW2/vNEoIbUN4mIXeb3VepIcIS7VW9ppKPqlqQs=;
        b=E2K7FD4SHwFHMFg5K1gezimInNWaPXzaebMaDJaurm8JiNWudTMn9rsrwLJqJeCnkw
         msDNunHyqmt1cXGDrTXuOp1CBRpnuBWPv7VdA2fBUR0Uv1nnXmriKNbtl6BS5NMPvCIc
         C2hPUmVS6H+mC714PRYqik6KVYZOK2jETUnvDhVpMdDyATe7yiLJrS3K2Rzv+omQr9rS
         olNQgihZMG4LJcwsa2XtVgMigVlqeLcM8yfj1Hcdxfvrd9DNM5pjcr/0O7SIf6FD/6tm
         ih+8PiB6WxaFozGD/xrPchn4P5MRau2BQnYgGlvCmuWQAR+2tAUTf2iV+eZQItnt5ACv
         K9TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NWnb4qaE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a37a404000000b005f17053b330si780001qke.496.2022.03.04.03.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 03:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NWnb4qaE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQ5h6-000547-GK
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 06:01:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ5do-0002Rp-J6
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 05:58:32 -0500
Received: from [2607:f8b0:4864:20::b35] (port=40808
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ5dk-0004ev-2x
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 05:58:29 -0500
Received: by mail-yb1-xb35.google.com with SMTP id e186so16089232ybc.7
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEqTOW2/vNEoIbUN4mIXeb3VepIcIS7VW9ppKPqlqQs=;
 b=NWnb4qaEqBBNSKW3mY0KLARhuJxYGIiEzQSPM+Dlj5bE59kbMsZi9h6hDRsohe8DJX
 Ns7LdFzBm+4yDIPBo/Iw0CsuUxUKpAjo4yDBe/fGsFBJFw09hh9fwo0m1bLnRrPvwErg
 WaWdUyoFxX/BHO3Js40DrN7KMQ5Iz3fJFRyr0y8JzK+HyqlT0K+MKEetSWe9EmYqQHWF
 x8OT1sXdD1Zv/LXCFa2UxcSXvzS1ajKO3Sd0eQTsSEBlKBZUYYvMzTSQ+g1uoXCBGI8q
 aI+aoUXMpYBk3Mv3Y+O5tO/DFind3BpkjBJAv5aInQwb+7HGYn5T/0kvvqieo5wqASBj
 vNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEqTOW2/vNEoIbUN4mIXeb3VepIcIS7VW9ppKPqlqQs=;
 b=Nzxjh1PcHVGuhhjQKONCQayc/2Lrl8trDxP728C9bljqQirhZhSQROfZ4NbApJFvR3
 qIKlyneJc43e7TGys6MQ0x7IS0rLKl4FTtiRq16D3posU1djXAjcMW9iX/1a8DoHqLzc
 vO19ZHap5Cc+2b6v9YD0tc9iwFYeA/2Uo5JQoCCxhcHfCa78IKWkIY+x4Qgt5O53dciw
 oveNpAjtLDEzo5lgtZd103R97ubbiY7fTAkz6dNeNklwy1rOxJgKSfw8Np6EXzS1KQvw
 8Dlj1F/ItHIJ4IuQreDmbhqPW7K5LP0n0mNDszdAgr0GFBwj9GRoMHSZ71HOEcJyPdIm
 r2QA==
X-Gm-Message-State: AOAM533dc9eER6r3G+UZHj4I5KP6bgWckintFZFDZ5EUVBixlvyKgiR+
 YdyIk9ooiEGFGj0moDrMgX3dtFdPzoM0vWL1szqfnA==
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr15015319ybp.39.1646391507006; Fri, 04
 Mar 2022 02:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
 <20220304115240.71d241ad@redhat.com>
In-Reply-To: <20220304115240.71d241ad@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 10:58:15 +0000
Message-ID: <CAFEAcA8BwRnziYaO2ZP7e_hNuAPBV7UOViX-nDu=ae2_7CemKw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Shan Gavin <shan.gavin@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O9W02SCbzU2q

On Fri, 4 Mar 2022 at 10:52, Igor Mammedov <imammedo@redhat.com> wrote:
> if firmware is not an option, I wouldn't opposed to printing warning
> message from QEMU if you can detect that you are running broken edk2
> and under condition that no new infa/hooks are invented for this.
> (assuming it's worth all the effort at all)

I am definitely not in favour of that. QEMU should provide the
emulated hardware and let the firmware deal with detecting if
it's missing important stuff. It should as far as is possible
not have special-case detection-of-broken-guests handling.

thanks
-- PMM

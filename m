Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1738795lfy;
        Sun, 23 Aug 2020 03:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxeuTJ4hpxa4n/dplekzG5446Vs+qcWtM+FFf9NU475MTDC6srXit4PQfXRfJwZCeQztmd
X-Received: by 2002:a25:2ad3:: with SMTP id q202mr889963ybq.27.1598179089904;
        Sun, 23 Aug 2020 03:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598179089; cv=none;
        d=google.com; s=arc-20160816;
        b=sJzm7autqXfqJcvMbzKwrjHT6pW1wPgt6Pl1KE53wgjQsnYWiTieV7QnJGktP7zoK9
         7GpbqkDUxU1BqWC3Vya++eWIkkpKFzaXk5I3MB4XS1LirF+RkMnY69TuXenGRAlNg9Qb
         FoFBHm9VdhvCl40lv6iNHxpq4DgljVQsFpOr5jZY0SwBYVSu3pdaPLt2e3Ve/DzY4twk
         0Q4iAQUuMriWdiryPKvnjTTVqwwymDzdG7jVc1pGeGwhuRKOaZ2WMwn/COJ9cCDV6CUV
         x0ry1dQoQWMkbd6JSOen/TPyC8XjPYTb8pZL14lEq+1jqblXeZEjpC4+9lCGkdMlRJDB
         4OBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CEyuEsnaP6Ks3ABsjkhtKDGslnnjuldxxwBDZz05Xv4=;
        b=bpDHS52k3BkBYtoCXgKuYmdwxGu1ulPrDy+74xzX5bE87iyqR4CocCgqayz6owDHJV
         /BvZRTEGz+vpJ+2WhGKGHdePdEqURGUBBE/Y/uajoZTiO2/1Arbfz3bOJK5irvh8KW8w
         6SJsjPKiDU/Mfh/BYWuMGiVPMLB9jAGLoTDL5k2WwCRDHUXhLEQ2wGsg5p18bzvnXilH
         MNJdjQIKeL2XchOrVZ0vAGOIjJ/d5ql04XZE2kJOl0NJiUth7Mb7FUdk+YQxF/vKY2RV
         KoW4wPTgF1Ks8dLSakn+z4iXnajL7rWY3CCdnbazAIKsy5VHMaZ2iZXuEaLYb8My1vUd
         7prg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZMGfI8zA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h80si8160448ybg.85.2020.08.23.03.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Aug 2020 03:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZMGfI8zA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9nO5-00020h-7R
	for alex.bennee@linaro.org; Sun, 23 Aug 2020 06:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9nNv-00020B-Iw
 for qemu-arm@nongnu.org; Sun, 23 Aug 2020 06:37:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9nNt-0005u1-JY
 for qemu-arm@nongnu.org; Sun, 23 Aug 2020 06:37:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id t10so8279214ejs.8
 for <qemu-arm@nongnu.org>; Sun, 23 Aug 2020 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CEyuEsnaP6Ks3ABsjkhtKDGslnnjuldxxwBDZz05Xv4=;
 b=ZMGfI8zAQN90nNCvGuHm5ZKHAUmprT9R01fpNw2wusRotZv8QhNgk3gig/0pegLg5O
 vLUxl/xuA2Geeg9qx4gSlEVJv1k1I1LEmZ1HBx2CT+P2thod26n4AKswOWh0V3JOF3Hg
 WnniQzI8lwtfu/YbLAX9dMxhO+53I5ee9dbHmNBZfdmzLof3s0SWrVy1BDN4UrEaAFkV
 GPeKyxg1nzncrt3Iw18skQzr6KW4+rYza0SMZB+2gn8X4V/iww8vfJloyaFdZa1ldtfQ
 XxDydKo8Q8bZlXKSsCJ+GwZx+8lzZ6WV3Ibrp6YAYB6K+7Y+0wtuMnibc+tzZcZ3A/r/
 kAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CEyuEsnaP6Ks3ABsjkhtKDGslnnjuldxxwBDZz05Xv4=;
 b=ZzknrIJsviolpKwBwoJ2DZ1jWEV0B8zqJvxzaZW7g88ftmxrhSj/zQlFotk4/uBC9A
 NzLghKByOOQSU1Pfx4t+iO3XR9Nz48rVw80zkXnYrffxt08piNi+wM6hTXCyF6uLUwVo
 xFgBmWN/gFYJ0nnlekQvAslebJO6O34jEyM26cVBJ9ZGMc70S7E7PjOO78NlDMIx3PUR
 lqforsTP1msiCSA0UgrfgwrfZ/yKwKOeoRiypXmz65qDv+Q4sPgz7dslIgjPMVBQNfPk
 EH+bhaD3Jfiy7kv+XIcKLilzuErqOw2M2+UOiVbzlNyDFYhoDU2/cz8HBQiRN50yYzMZ
 20WQ==
X-Gm-Message-State: AOAM531ollmXpBehA9rXmmBw/o14sUnJ75nd0XL+jJrYg2SwRxE/AVJz
 f9MYt1rM4q7sf2SywzpD0ZLS3b+g+DV43cT1uoptRg==
X-Received: by 2002:a17:906:b248:: with SMTP id
 ce8mr944697ejb.85.1598179075730; 
 Sun, 23 Aug 2020 03:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200821172916.1260954-1-f4bug@amsat.org>
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 23 Aug 2020 11:37:44 +0100
Message-ID: <CAFEAcA_eHxosDuYu4QpDmV6oM7ssipOwCAqce-kO6+3ttCgAjg@mail.gmail.com>
Subject: Re: [PULL 00/23] SD/MMC patches for 2020-08-21
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: luHp5NmIjbOB

On Fri, 21 Aug 2020 at 18:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit d6f83a72a7db94a3ede9f5cc4fb39f9c8e89f9=
54:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/acceptance-tes=
ting=3D
> -20200812' into staging (2020-08-21 14:51:43 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/sd-next-20200821
>
> for you to fetch changes up to 6d2d4069c47e23b9e3913f9c8204fd0edcb99fb3:
>
>   hw/sd: Correct the maximum size of a Standard Capacity SD Memory Card (=
2020=3D
> -08-21 16:49:22 +0200)
>
> ----------------------------------------------------------------
> SD/MMC patches
>
> - Convert legacy SD host controller to the SDBus API
> - Move legacy API to a separate "sdcard_legacy.h" header
> - Introduce methods to access multiple bytes on SDBus data lines
> - Fix 'switch function' group location
> - Fix SDSC maximum card size (2GB)
>
> CI jobs result:
>   https://gitlab.com/philmd/qemu/-/pipelines/180605963


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

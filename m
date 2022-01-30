Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1530107lfk;
        Sun, 30 Jan 2022 02:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYV0O5VpHyOJDham1q73NNxX6dZXw98ifcWYi5D4ObRm3D+sGxO9aYWS0tSuvG8I+Psf2l
X-Received: by 2002:a05:622a:1011:: with SMTP id d17mr11343245qte.377.1643536896396;
        Sun, 30 Jan 2022 02:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643536896; cv=none;
        d=google.com; s=arc-20160816;
        b=bFGTV2l5Vd8aJPp90ijIEUyJk9Ubcn4im++U00HfdAMW5s2HPFgghdk3AYIpXOoeAP
         5I+Pur3tyreb6/zEObXMIsbi85R+TUATW2NoTcKd+PlebCHC0Eh3+9WJ7gTLs4Xo/sE9
         3r/KqLKAJyK1O4DEWavzCbGAFPQB3Go/uR1YUeAaJ4FFgisCmJVQgjrH+xZn7PWHf7Uv
         S7F4fUQa7p+H3Ozzgz4JM8Shm9iuDQkcbcDiqiWZeGM58Re+AoGph4OiaYSDfgUCNxtQ
         UmvoINzKNhtM2w6EvV8Tg+1yjQV3cWIMvyJ3emqvTt1A1tZjEphBlCtLluatKYqbYf5R
         tQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D/Dq/n3a2cacFsRp7SbZgSYk7wKKH12wz9Xle0XJ+oQ=;
        b=nKiUHkjVoIc5y3/VoIV9nFu5UWaO0dUzgYwGa7UkJ0jsEyP/WfwWByysTkuLKci53q
         JV26FeWgMKaKC5b2Dzv3Wt1L9qWRgRUrZlO4HCtz5P76cJL/Ecaf1Gytf25HbktgDlve
         RBZ+482Ij2lCPx3hp5PTkhah86/MhjD1/+LJob8kGJG+5uSljscJjJ5m8OL6H3hRh8jR
         q+LKOQbIKYX4bsMY+gg8nBcjbsZq8lUu7+lHw6Me+DO6tbNSn3Q5vkyKshBbMk1ZJCqX
         6vzR7dcTVOZBABOC3MbsMLfBaj7tn63osuoKqQSGeNleLLl7/GAmEWhOz262h0V4jmOg
         KA4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IlAV81bO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si3755676qvc.495.2022.01.30.02.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 02:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IlAV81bO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nE71b-0003ie-6T
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 05:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nE70Y-0003i1-1S
 for qemu-arm@nongnu.org; Sun, 30 Jan 2022 05:00:33 -0500
Received: from [2a00:1450:4864:20::429] (port=35396
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nE70T-00006E-9U
 for qemu-arm@nongnu.org; Sun, 30 Jan 2022 05:00:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id e2so19723765wra.2
 for <qemu-arm@nongnu.org>; Sun, 30 Jan 2022 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D/Dq/n3a2cacFsRp7SbZgSYk7wKKH12wz9Xle0XJ+oQ=;
 b=IlAV81bOnH586VIfR5jxQbw9gyw3OoEPSkzhuTeYXIMBOBCocM6tmiUxIkL/oMse+W
 mKjGtQ04LtwASJ77zSiGJjjnx7Dk5jXERook1ZdYBhBhEeapTunaSCrl1gQnPpFNATxW
 GGP/3QNrDvO+RjY69Zo+/HL9wPTpXO0vjnOXp9kafhwC4Ooh3vn7DacKEuqtf6G8awCK
 iOcKMMbjTrM8BL09NXh75Qz9vEBaOjeRGtoD/OCFpy+d9hpLUp8UVt0JlUEzjU9uo7oK
 ac2LRU76JwhXRoZ5+aBCJ7gNrlHRMLaQP+eO5mwhjwYMOqyVHHX0y2y2SrlrpXIuclOY
 jrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/Dq/n3a2cacFsRp7SbZgSYk7wKKH12wz9Xle0XJ+oQ=;
 b=TP1pZMjLZgRpywd+XW3VLNqP5COeobogo65AJ8c6bylL1fKr0sZSXexMtvGCwV1S5H
 c9eDOoQr8bTWYLWrDuDM4AUJyYXhKINN+HG74eKjdd1rbdwMPX1952DJpnuk+OF4IEL4
 vtTgRCErW2BIpFYJnefAv/GC3YKmw7GoKxL1eW4IE3jEyq3l/Dmu25drzoTJS6S7r5fi
 MbVF9DFJhLxP9aNeWmxeMDZFgf7UV4euDB9y+pC0IkunNSZtMerWn/skM7XItC5C6UM4
 tb1yzQZ/psA5FvAWVodEnZJ2YDBo0n/56m7yBS4c/DnqNy4scsjphsYKjE++bAx0aS3h
 rdWA==
X-Gm-Message-State: AOAM532EdLCFZWhJW4h6pp8A5lmr2Tqyc729Z2kRumwwNMu/LII3o6U+
 6hgC7HvJJcltILww4BPLh63kXQOf26X8vPMg/zayTQ==
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr4951191wry.319.1643536820056; 
 Sun, 30 Jan 2022 02:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20220128183033.31998-1-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Jan 2022 10:00:08 +0000
Message-ID: <CAFEAcA_0DPM=cwn33jCB3j=ZKKRJtg6_GL6RHWPzY62S-w_RUQ@mail.gmail.com>
Subject: Re: [PULL 00/36] Migration 20220128 patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OCnPmET3gGBN

On Fri, 28 Jan 2022 at 18:31, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit b367db48126d4ee14579af6cf5cdbffeb9496627:
>
>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20220127' into staging (2022-01-28 11:05:29 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20220128-pull-request
>
> for you to fetch changes up to 476ebf77fe8909ded10046edf26685bc28438162:
>
>   migration: Move temp page setup and cleanup into separate functions (2022-01-28 15:38:23 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request (Take 2)
>
> Hi
>
> This time I have disabled vmstate canary patches form Dave Gilbert.
>
> Let's see if it works.
>
> Later, Juan.
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

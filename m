Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp273677lfk;
        Fri, 28 Jan 2022 03:06:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8gMB45yc6gvhBhG5QCVtFOB/qsIGK1Lm5STJZ5YbK5c0lP5GmSTQogqaM3FYRDB1FjLYs
X-Received: by 2002:a25:4c03:: with SMTP id z3mr10783016yba.428.1643367960538;
        Fri, 28 Jan 2022 03:06:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643367960; cv=none;
        d=google.com; s=arc-20160816;
        b=G+3GzJSeV8UmlWckI+8+TfgS1Wl5g5irn3vr69wFbUaBauwgYQC1FFiwUFnQCI8jWe
         nBBnSkTFGP2iMx3TAy4m1izFshGy7tGnl35Qc8V6QEJ0qM54wO15syZOT5Db4BxeZIzn
         EWt7QasLEunAlHTRfF38vVXbvHRfyAZ3bOjGDfPqxzJyit6oreI5ZfABNRemS3C3m4B9
         H6/3CU7irHwUfVbUAUd78KGWzJLec4kiVG6bcI8OcMlG5QZfo+l7GSy3isoCQ5OcCXZe
         QzoKo5Z7Vtabnx8M7iCArNohPoZ+iwoTY3dNdfkBJhr/9N7Si2skC1pgiItoUXVICt+c
         ZRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9sJXmzq/+fkbAOd/q9jweToZmG1D5mLo56dAF5lKKM=;
        b=WJXnOwvi0Mgpma6ab7inN0DfGntPnIUNBPHsy/hU425LYoepcqjj7Km5MzNnMltE1u
         F7R+o7LMRDQ62P/x4KKRwkxmZhN+PEJV0vzUGnvg5Z5rNXPVTJkVzz+B3NjrwiNxUeRs
         iqFhJQkfVcYnyy+1tM2LX4z+ifOodF0frXeJamC8cUVQdGyDMR10IqLathv0AJ482UJX
         n+DoVJvIpDf+snIFD4TrzpqOpfNewpgwvorpo99uaZhu2VH6vKqDLiqaqQFyyv+n9+UZ
         tgBr0Gjxp/MVzkz6QmoOeAlMO8xtuRzwky6CKj83PqCmkeFQm608K3BiHHkXZQulJdKV
         Qt7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aD94kK1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u64si22574424ybb.587.2022.01.28.03.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 03:06:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aD94kK1k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDP4p-00033L-Pp
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 06:05:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDP4H-00030o-4H
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 06:05:25 -0500
Received: from [2a00:1450:4864:20::336] (port=40651
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDP4F-0005C5-Fj
 for qemu-arm@nongnu.org; Fri, 28 Jan 2022 06:05:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so5317413wmd.5
 for <qemu-arm@nongnu.org>; Fri, 28 Jan 2022 03:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9sJXmzq/+fkbAOd/q9jweToZmG1D5mLo56dAF5lKKM=;
 b=aD94kK1kYSzReq2yZXrWt9qFgs48cod7XXirDT8qy3uXzN7cK5xLPmJCuCXWl6Kfbf
 uBjdZTR0714xiD9rwtAmt4OIftTpUvT77k5/PYGfPy53TGqYATzgVvZJe/2PjEgVcCai
 UCSBtQcTHO6+m+YZcUGC0qgVo6Fdz5dY7+qhWocVqJ7PRGT4Y5iDrYn2edcUrDVJsZgN
 8v3sGMHHa3nQy5qhg6Py1j1Ts16gBRpnOeyNELM2WO6M9g0gyOgW6F0ncRrxgsHdUAZZ
 jVYxfX2h4F2FdLGOkVDFJoB/xAPj0lJXEWldNJf/5ZqNMHmXH2LkI2Z5dImQwAbe92nS
 zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9sJXmzq/+fkbAOd/q9jweToZmG1D5mLo56dAF5lKKM=;
 b=oyj1tqUU02jxLrehBL20FTfK3nro2j65ZI4Age/PTZ4dwosNvmNlVxLXYqU+g9ET+r
 ww3Yt1aLrMVPekEAKzt8fES/Q4zmHAT9N/2DEluhOzLCS20bWhkEtO9TR8INoz69uhY9
 SKE+61xB3/D0h4GzP2ha5aUM/z0bEQJ4xth/1Ak18+9HBFazjfWWo0ZbStMThKt/fk5f
 y/Ph6TYWs4szeQpL0sqk42vqoqQgRGrfYgqb6bK0ib9ZcJGXU0qZlJTRHoKmoqjEMZg/
 W1NCedfxQqPhjKtCT9vgWcjrW/hykv8KiNGNNj2llgJV8AWcCIvo+9tK72u34sNgXbFZ
 u6Dw==
X-Gm-Message-State: AOAM532IcL4/DLj1RUuMvpNruC+NH4oo9BrHo7p/fYMttEDrgf083P2e
 mcE4Z3d8Qr2JZNVZVC0+s6fx2MUhQT1yxQBt4/+0PA==
X-Received: by 2002:a05:600c:1e0f:: with SMTP id
 ay15mr6978459wmb.133.1643367921419; 
 Fri, 28 Jan 2022 03:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20220127150548.20595-1-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 11:05:10 +0000
Message-ID: <CAFEAcA9O_nZz=4VSvh+rFE4cXepUEBeUui2WdawBjjos+pqOeg@mail.gmail.com>
Subject: Re: [PULL 00/38] Migration 20220127 patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: woPZiyCPexXm

On Thu, 27 Jan 2022 at 15:06, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20220127-pull-request
>
> for you to fetch changes up to 4e29a822de430e8d0d8bf5c61aaff0561a713d84:
>
>   migration: Move temp page setup and cleanup into separate functions (2022-01-27 13:37:55 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> Hi
>
> This pull request includes every patch ack'd on the list for migration.  In no particular order:
>
> - ram_transferred_add() - (Edmondson)
> - vmstate canary (dgilbert)
> - minimum_version_id_old removal (peter maydell)
> - postcopy cleanups (peter xu)
> - more cleanups (Philippe)
> - yet more cleanups (zheng)
> - colo and cleanups (zhang)

Hi; this fails because we hit this assert in the vmstate canary check
on some of the CI jobs, for instance:
https://gitlab.com/qemu-project/qemu/-/jobs/2024872142
and also on the NetBSD VM in tests/vm.

thanks
-- PMM

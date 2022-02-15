Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp456539lfl;
        Tue, 15 Feb 2022 09:14:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAA9cp+0AUteEaC2mmpgoTVXh+Z+5MjiES5VZCnCZejf9gATeHc2JKlyyap+VzOkGB2gzo
X-Received: by 2002:a5b:14a:: with SMTP id c10mr4573276ybp.538.1644945260417;
        Tue, 15 Feb 2022 09:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644945260; cv=none;
        d=google.com; s=arc-20160816;
        b=zqdq6GnP2bdfwgCLmK1f1dVJIJS5O5wyo0V01/Yi+A35mSLkLSJEj+sGnkpY5kCvQm
         YOYvgZu5nZ5XQuSvy4zms79jaU9PEOcY6993+1sLrSyERI73DhEM5XeZBQ8ob3nM3Pv6
         HvkbKl+QEfk4itZcWTKuG7laeANbed8MkulPebqXfCkhxrfckmHehq9LaX11nVK/JwiN
         vWyDXP7J3DbXp8EnUxF32JiIZsFJeqmRgXC3K5Z+cLjZk+vAW3n9BsI83oRWDkW78GGS
         wbVEuAdijHO4F6HY5+j3Awmz0O4jhzroHJjld9WqFRoQrgCiyWWMdMkofczpkE/Oe0ux
         hgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJ9+C11Z4RAIxgGbyt/CU5lMgJjV6da/JkNXgOTJB7g=;
        b=W3lVMQI97bnANU6z+Jl+ZkPZxQMBcMiwsHIRd2p4KMEIjdIposOj4SWKGbjUXTG0+I
         zFs60Zo+IS7wEyF/gSn6ew80l3yumP5hZi6HGiuRduZXiOZb75uK2pBFQp01ArVgCveq
         qoWixk3eCKkndHy7AzN4/eoiFEOVGZue9TsGKijuZ+wJ8Q0Lx/Ub9/jwMOI2qSRYqSYD
         Pxq+Lt+KEMUBVh9rvTLiEsO4eFtMdM7a4D7lIbrX1f/GQ2nCK/7UMHqWYGul9QVD7sXj
         eQjIjPTZqsjhKX8l7uJpg1iGRobWcUDflwNL66Mq/wFg8BNCTymLqHM8a66+tBekIUzk
         JRjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oXKKuMKz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z200si18827117ywz.319.2022.02.15.09.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Feb 2022 09:14:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oXKKuMKz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nK1P9-0004WY-QM
	for alex.bennee@linaro.org; Tue, 15 Feb 2022 12:14:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK1Ou-0004Ug-Jh
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:14:04 -0500
Received: from [2a00:1450:4864:20::332] (port=55224
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK1Oq-00010D-VQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:14:03 -0500
Received: by mail-wm1-x332.google.com with SMTP id c192so11712477wma.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJ9+C11Z4RAIxgGbyt/CU5lMgJjV6da/JkNXgOTJB7g=;
 b=oXKKuMKz6STx8eoY/afkFOdEaXtFTQP9d5zjs7diJvSzHgUX07q5bUK8PkmpV8FEyw
 BB8grQQp04w37hli12UaDEJDLwoiC/M1roBo0qDhcWPwIGDoE0RPGmPHx/jhJxAWy2KG
 QuOoE91dt0z4iWu0HXvwWvfkwB7FjVJnyfrE3HDyJif3v9/eAzJ+jPdGuBOy703OM9G3
 qOB7rbMB/gbLTkHrNxljytQoYX3BaluZhyaYbWoVSQWr8pAeEoWpdREjkLF6cdkr0EhC
 w+uC4zTafuLyb6qkZxa2g/WZ2TNJmmib3bJDB8snOFasw8WriWyDwdO8gDNTZjHiypDB
 Eq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJ9+C11Z4RAIxgGbyt/CU5lMgJjV6da/JkNXgOTJB7g=;
 b=ExZG+MEEhoU5ItQhMEPeXIvyiihKz6KWVfJffWxaTG8YuOJfmGLjPLaAhBUeRbubH9
 iGYpk+0Mjtl0XsmosT7jZpBL7HA3eMhIYCzqwTmh+mAJd4qM5sj8UhmrmvyCinW5thR0
 qri1SaZHrw5sP64+CRlhztsKv9twKykuMIVurCxPBn4eLtLYJFR8riy29I3l1PyA6Yof
 HUEnHjGt12ZCW7amlj4UzYhmAmqt42gdb+O6Q8DGRWp0EVE9h7ufVni4v5e93DnviHRC
 PGynPkQaiTEEM2aYAERyKfbeS+r66Kn/b/C2Dnd3uD8ZdC3xMx0QdQyhgbXkXHn19G+R
 zngw==
X-Gm-Message-State: AOAM533kHL0cpHQxtVVW1ggJGE1H3o6SonVvxEUwxz9OLZZ0YBHzvaIb
 fdutCPvFS2m+EJQypxYBg7Cut8bQ/D3L9kUx5e4BLw==
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4099877wmq.126.1644945234509; Tue, 15
 Feb 2022 09:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20220127150548.20595-1-quintela@redhat.com>
 <20220127150548.20595-19-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-19-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 17:13:42 +0000
Message-ID: <CAFEAcA8+ri-ndQv0b10yfUjSJZwH5Ec08S10_-2k5C8_OMYYDg@mail.gmail.com>
Subject: Re: [PULL 18/38] Remove unnecessary minimum_version_id_old fields
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: irmAn2MkOTM3

On Thu, 27 Jan 2022 at 15:14, Juan Quintela <quintela@redhat.com> wrote:
>
> From: Peter Maydell <peter.maydell@linaro.org>
>
> The migration code will not look at a VMStateDescription's
> minimum_version_id_old field unless that VMSD has set the
> load_state_old field to something non-NULL.  (The purpose of
> minimum_version_id_old is to specify what migration version is needed
> for the code in the function pointed to by load_state_old to be able
> to handle it on incoming migration.)
>
> We have exactly one VMSD which still has a load_state_old,
> in the PPC CPU; every other VMSD which sets minimum_version_id_old
> is doing so unnecessarily. Delete all the unnecessary ones.
>
> Commit created with:
>   sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
> with the one legitimate use then hand-edited back in.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> ---
>
> It missed vmstate_ppc_cpu.

No, as the commit message notes, it deliberately did not change
that one vmstate, because at the time of writing the patch
that was the one vmstate that really was still using
load_state_old. As it happens commit 8f91aca7ff0044b hit
master first, removing that use of load_state_old (but
forgetting to remove the minimum_version_id_old field along
with it), so this commit as it hit master is OK.

-- PMM

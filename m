Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2794521lft;
        Sun, 3 Jul 2022 15:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uo4Ligvd2cgmzfeQDb9MQqHjwL7mBY89qP/vwsQwxbte5jlF6NUhUjSWI2zzUCM2FdFh2X
X-Received: by 2002:a81:250f:0:b0:31c:3c38:d3cc with SMTP id l15-20020a81250f000000b0031c3c38d3ccmr23872503ywl.306.1656887031165;
        Sun, 03 Jul 2022 15:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656887031; cv=none;
        d=google.com; s=arc-20160816;
        b=oDJIWsKsFL0t0Lomf2BGOsycj/tWjdmQvjNOZ4460N1Ih48atbhvmNzZttdpgXelBJ
         x5CXZYEQmkNnPh0OwBosij0oopu8EgBo9EUcNeevmy4rxPG4CsTxY4rNjtx5FpZayblM
         ugEXhgdm02NP5j5o0fDIO1Uwl4wi9r3db/iV6Z+KmhsJGlv39T7td5f6FaGufZPMxikO
         AkN07r4+z7OWw6d1OojYmPuwXeKI8yDgLgNcwQSlTAZjTNcskN+7vcO/895EE28Ho7QM
         2wP8Y5KmXWaCxHNbB+4+cFfEZ/0FAXZx65og8CPWwM74YzX7sGcx9XalvsxTcCToOTRT
         mZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
        b=RchxEQt5Mh9TmhEi5p9JeXHy8JJqHbc2fzJGyiM/d3qIVvw21pD2g5/ik3pJO1IfT1
         Kg8xkqunGykavA+kBMSXvhi9kaFC/YhfMwjYd/GLuAqrC29+ag9IoR1RweMI/n2lSVl8
         ecD0fRrY1olEj08k9jTkc77argH8lX7KSzksKmUaXa9YYlwkuPZH0bA4hOq+ojXFZpYU
         BKCEsEgbLLkrmPyVmyR3PyNutax2gBlBJZ/DtfXnQ/As9t2eDK2ysvcMEJikFgyQi8M0
         yESsnJYgt18lbpOz/ZygTvibENkVJPRTXUCAtO18kKT0bgjJyuo+I5JGNJlkh4L3gvxz
         cQzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FwNNCW05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83-20020a251656000000b0066e26f3c448si6272018ybw.75.2022.07.03.15.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 15:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FwNNCW05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o880M-00054Q-Io
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 18:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87zS-00051N-CD
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 18:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o87zN-0005SO-I4
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 18:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656886968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
 b=FwNNCW05TU+fPvpw9KyjjYaN/EBwEwTTbpY938+RhkElLpzrBs/ofPf8G1KtuexNPKP+wa
 zvmjAfCrHX80NfUHcPVtmAJmmqzcrZ5wiAu9+xDEQYqb6NAX5koCvNfjirkYmDTLGN+z4B
 rWy/pFh51oxSGjqUOVZ4fVW7J16CzjM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-iPquRctgOQ2r8fPgTA01jA-1; Sun, 03 Jul 2022 18:22:47 -0400
X-MC-Unique: iPquRctgOQ2r8fPgTA01jA-1
Received: by mail-il1-f197.google.com with SMTP id
 x11-20020a056e021cab00b002dada9d2a50so3345765ill.15
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 15:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TopUIyi2bDIF6ETHPUt7meggdZ6D+dZM/h35SyOKp7w=;
 b=Ia2RbKQWA+IZ7rNQuqctmq9eFBSALrgDwSql/PX+VNcv7Hk6F7SHyI8VVRZ65uAX/5
 UMhQ1j3Nx7phqz6rTNOOb+4MLs2CXXTpuYKxdUGs6gc0Vj5puhwqM5iLNOKQNGqO3poS
 qMeEj0K8+RhW7Lbx/Pp3R/gdyr1qW2K/1gGe8tAXwc+f6QcAg9fXD0DtJ+6+pbexfv5N
 boBm6QSal86QgcJHP5SP/oP6KzLTO8Tcx1HnYwgTvyjwe5YyAd2mRenaHmhLYEkiYAJh
 ZtdWFBjbdnvs76bEyK9EFGJNQkR6BWHcdCZIExGaYFuW1znM9/bTgDtxGmUh6Uk/UyPi
 uL3g==
X-Gm-Message-State: AJIora/wFgVY/2gIhCLaZxVlqiIhAMbZEHQZQ2FiGksXHNGnpf373QuX
 7QXWlxS7LCgMjayu8vDiQ2Qn064RPTXXyaLAhFLycoyd0tddAHP+755q3poHKRb+Z2urAR6qeHj
 uBhvchDRujSaJS/tjeumroUsxoFrC
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr15114452ilv.0.1656886967307; 
 Sun, 03 Jul 2022 15:22:47 -0700 (PDT)
X-Received: by 2002:a05:6e02:216b:b0:2da:c09b:179f with SMTP id
 s11-20020a056e02216b00b002dac09b179fmr15114434ilv.0.1656886967102; Sun, 03
 Jul 2022 15:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
In-Reply-To: <f36e2069-e1d8-462d-401f-1194139ee6c2@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Sun, 3 Jul 2022 23:22:11 +0100
Message-ID: <CAELaAXyf7_g7WQHrJUgYzhGCQhEm-D_zai2Qv_ugzWjm3z2hpg@mail.gmail.com>
Subject: Re: [PATCH 00/18] Make block-backend-io.h API more consistent
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Denis V. Lunev" <den@openvz.org>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afaria@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hsEP1e9fSD0

On Sat, Jul 2, 2022 at 3:12 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Alberto, does this need a rebase?

This applies cleanly on "[PATCH v5 00/10] Implement
bdrv_{pread,pwrite,pwrite_sync,pwrite_zeroes}() using
generated_co_wrapper" [1], which applies cleanly to master.

Alberto

[1] https://lore.kernel.org/qemu-devel/20220609152744.3891847-1-afaria@redhat.com/


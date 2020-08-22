Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1320797lfy;
        Sat, 22 Aug 2020 11:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuV4I+ueMFgraVj7We3do4zc+3FYHtnqzMPeCowIW+zzWJRk5voIkU/fS/Qsk6Lzf5DNb9
X-Received: by 2002:a25:c8a:: with SMTP id 132mr10706561ybm.444.1598122647197;
        Sat, 22 Aug 2020 11:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598122647; cv=none;
        d=google.com; s=arc-20160816;
        b=iw9QKiuE1kzWLDmYIvAfNcZaYuiP7oM5Jg3Y6h/dhQGbSreUoAwBU8iidHF6PwfzcP
         LIUvMwvmdQahgrEoyStxV5CyNcMdvpwhPa4ddWIVJ+xvkP9ySysBLnwmeZENS4ldqNjK
         MitjBDH7tAWS80Ex1xMt4DLEddY2HPhgfWeZQUUqq4ywbtbPGhd5Jsy/uC/79vl/LpoE
         3eDN3B5PPtDGktrJd9Yp0HanScdAc1DBVU3KPxEYkInDxayfgG+fFA+Gi06PXpd01Dtc
         It4sAdyYNRCvMBaf8tBy2aYZjXitfCUJ0WWE0ni3Zc0V2LlwVfdp46AVdRH7CovZXefF
         cAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=S6bN9SOOP41St22mnwX3zHKrUpSPUchk0IYPJ8vxJio=;
        b=Ik5SUA3UNzUAxE41BVilbUBi1UGlmufcMFyR5TkqcE0W93+DBx8hbeIoCnGKMMsjNj
         cGTMrQ1eaQJCMxL2zyXc3EmCytqC3A5FGgi9JLa05dcMo65YNFRgkJVgJJMr0etWX7aw
         RJCH2LUq6Gm+HHDIzOAiwRc+fYW5NBecVvHQ7YMkUpTfxmVJYPrwxewIF3WN3Qa5bQ45
         UkMtBXpspmm3EU/sc621xbclBsFR/URp3RkK4jSn6yj09CxWmMXx08SS7ZM9CX8S8gtk
         0qnEcZQuzfFIQwKWDoLvbJCyuzoG1I/EGp/O7llhgM3tNGf81YJ5aAGkEFQe8kW/io03
         daog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATsl1nFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s46si5436810ybe.497.2020.08.22.11.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Aug 2020 11:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATsl1nFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Yhi-00067S-IU
	for alex.bennee@linaro.org; Sat, 22 Aug 2020 14:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9Yha-00066t-F8
 for qemu-arm@nongnu.org; Sat, 22 Aug 2020 14:57:18 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k9YhY-0004Gd-MT
 for qemu-arm@nongnu.org; Sat, 22 Aug 2020 14:57:18 -0400
Received: by mail-ej1-x630.google.com with SMTP id t10so6763138ejs.8
 for <qemu-arm@nongnu.org>; Sat, 22 Aug 2020 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S6bN9SOOP41St22mnwX3zHKrUpSPUchk0IYPJ8vxJio=;
 b=ATsl1nFk/zG9tIkJ8byLZiNkFx/SjDMnOM9camh+RWp8J0Jqo0pBX4GD8cWbQ/RQUl
 QB+jmOzcO5HiflMXgmY/kLc5zYp5FQ0xd5XKi+6+k1dXQe5bDoUs79ksnv1S47uWUT/h
 o76vYzasIsczlYtQe6gKrsMSxraqQDZduFCy8CYT6528IcSC4ZSeWRu81e/Z76fz/Rpi
 saNrk9Z6kCFXNT7fX7kIFjVq0AVf9Jz25iLFMb+U0KLZ5PHThFg1sY1go/UPgwF7fKZK
 icH1FMRib794o/lVUXT+NRssvp9q6u998KXTmseMvw6rTe1ELQKou/WaqZ/FnW3ejmhd
 s2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S6bN9SOOP41St22mnwX3zHKrUpSPUchk0IYPJ8vxJio=;
 b=QJ6pkMm65+L5UU4GQN45x0+3xM0KuSipN6aKcZDulH3kemFj4Vz3sGBVun78rtO2lD
 QWTPJ7gxvSUOUKYjqPKdFNQJzEWwsXFeyA5GPcR23u59kx1ueTs49CcG67pRe6Ww2iWh
 auRfbngmrzV5M3NNTEm3V4P0U5JXI78yh4wg617VoXwTR2pDorQC72UleXUxBYqapNKw
 laE4AQM4OSXP34dlOOEhDh5yXhg4dNWAJOxlAvHOdI4aBl6DnDMn510LsbVwgfEBHLpu
 CVvFNDfktR4MPgz4P7vNDzfH/3u44LobxkfYbDuUE5KQdzqL0zJc3O7cbiAvBbMc0kNX
 4elA==
X-Gm-Message-State: AOAM530Z4XDYMvKtAsNDOiwOcZZUyWChOYh4dN5D20L8MNtqtSeRM/xK
 +EWD2EqpYo4PJeShjQXNI+SlvZdVjrOW7SQKbmwl9g==
X-Received: by 2002:a17:906:68da:: with SMTP id
 y26mr8195213ejr.250.1598122634866; 
 Sat, 22 Aug 2020 11:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200819152258.703874-1-ehabkost@redhat.com>
In-Reply-To: <20200819152258.703874-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Aug 2020 19:57:03 +0100
Message-ID: <CAFEAcA-YyaH8iGAvA5bni_ioMpycv6x3A57LCKX-6CsL0O+dqg@mail.gmail.com>
Subject: Re: [PULL 0/3] Machine queue 2020-08-19
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MFslLeUqG0uH

On Wed, 19 Aug 2020 at 16:23, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 672b2f2695891b6d818bddc3ce0df964c76279=
69:
>
>   Open 5.2 development tree (2020-08-18 13:44:04 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 3ff3c5d31740484b0e19007843094483fb393e80:
>
>   hw: add compat machines for 5.2 (2020-08-19 10:45:48 -0400)
>
> ----------------------------------------------------------------
> Machine queue 2020-08-19
>
> Regular post-release changes:
> * hw: add compat machines for 5.2 (Cornelia Huck)
>
> Features:
> * qmp: Expose MachineClass::default_ram_id
>   (Michal Privoznik)
>
> Cleanups:
> * qdev: Document qdev_prop_set_drive_err() return value
>   (Philippe Mathieu-Daud=C3=A9)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

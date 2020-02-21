Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1839807lfg;
        Fri, 21 Feb 2020 06:02:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiW42KcM7kL3wpTBle7Qxhb4UO1WsshMdKZxvkwa2rNOm7RuRX0M7arUHp2lsXcWC1kHRA
X-Received: by 2002:a9d:638d:: with SMTP id w13mr27261359otk.220.1582293765073;
        Fri, 21 Feb 2020 06:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582293765; cv=none;
        d=google.com; s=arc-20160816;
        b=z5NQQlU8SsQdUPKMHtF8mS6d7HOtcmAFTrRCosTAb0+YmfKZvYeczW57elIreyT907
         VfJBok3TnOuPVMXv4Dpg7Fp5wOLd11LqNxsbOHtke8/W2z/qIIy9kUxciL9PxpwG0YVy
         mvOJWtDdaCYmfYD7dQiskDn4Qu9Mn0cBHZ37amyJuEEsaPG2BAGT1dLLzf6wpFOp9EMZ
         cnb55u8Q7DbiSdrWlavCJKHtZJIS7NTdtKT/UKHwqosmVE4bdKzFebsShg4o3brlwYly
         1frMxJ+GgSoLpZCUbKs2NPrPA2OHMSoDARVdSGNZEEEMJMCjMnVZOe1qkvQUUWFQ0ctc
         d7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ustmWK5mEvdAZcOBmaOSg4VtBioTYnOuWkx56ShVqRc=;
        b=QgYZ597EHmFd7XB9jJwVYQ7DYywESgaO/3Rwr6VDskkxD7pgUsue3OJDwqSESXqDFD
         LME3LlP/PberAfVabdLPBBv2dgtmNOgoZJWORzSxw1I2xH+Ny4C1WTyAO5GT6lKuf9AD
         IqgauZ/wv4fjnEJ7/ovKsvyEUrW6vjoMNg216DvYBVKibRqUW9TVBYn0U0wRyxcvI4dT
         zJeGtPa13wCO3ofp9YoHR8X8lCXaM9/yR7CmvzecHKNcutRX4vv0Wkk2RPvVbFuxbS+N
         8GBjiJLDAOZauDxyIaN36S+pXPnIQzSYW7bUaUD9TCxruaHpIvmN34sZt68Z6L9dUFu6
         4Zbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksSrv+JQ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h11si1494890otr.197.2020.02.21.06.02.44;
        Fri, 21 Feb 2020 06:02:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ksSrv+JQ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgBUOCo (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 21 Feb 2020 09:02:44 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44869 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbgBUOCn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 21 Feb 2020 09:02:43 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so1625328oia.11
        for <kvm@vger.kernel.org>; Fri, 21 Feb 2020 06:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ustmWK5mEvdAZcOBmaOSg4VtBioTYnOuWkx56ShVqRc=;
        b=ksSrv+JQp6iia60+jXznBn1bDqYQPbMAYUjTQvr4KXPkqeSD2mwVnvhvOCiEd0nYMO
         +fX3gUUCsG9jjZzmzjrXMHiRcjpNmmuHttONuw+J+gqM1rbz70fXx123EtxWjaiyUmoZ
         QdwQXxqrzk+7yloQ46ZuZ2no4EmQOrZiRX9c3/FS4Uq6QmCtL0plHzM83fzklhUBE/kf
         r91ZvTUhs0Oo4BE8652GkH8ZZXdXIwahEzUHL5SfSWE9AytFKP9tlQ8unhXEMNj1IH3m
         wAlHaVkOqR53LXl85gOguvTn7u31lxWsKdGQbG9uoioc+M98IBpDaQeYFFm6EOlg8UDB
         kNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ustmWK5mEvdAZcOBmaOSg4VtBioTYnOuWkx56ShVqRc=;
        b=jkS01tRPryGVd7ZbNXg1TZpxVzLdAADRAERuj0H3Pea/oC4V6pR1Sh5qRNUg5Bmcyn
         uoe2qJRYEHzD97Avrlsq3ZoLIoixRq3qtQruZ50axnsOQM4sYKESk9wrKcF3gFePe90s
         TEzKF7RB5GzeG/TUg4guKsFfgaK6gdUo+RYLcWUkEE2CeBT1SYhCNUcW2QEbBcDMyIlx
         QaGKDcMHpsaC3ZrAyc6063w3b/oBzjXHjw3MP1a4L46iWiKEvuQfAIbj4YzThX74t1RR
         WpgulpSpJwP6+EO8Z4OzL/DowoO6dm/nNZInDVzJyGqFXbSedfXKStKp5xFKoSivDDE6
         Qh5g==
X-Gm-Message-State: APjAAAWBwWrfGrSC1FlalfDCs5OvB0UcopXnGI71DDZ0CgoPvRRBi9wl
        URGToJWS7s3DPir7vYVQ2oTVJRJhyBYTmhbsJOj8yA==
X-Received: by 2002:a05:6808:289:: with SMTP id z9mr2070195oic.48.1582293756639;
 Fri, 21 Feb 2020 06:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20200217131248.28273-1-gengdongjiu@huawei.com> <20200217131248.28273-10-gengdongjiu@huawei.com>
In-Reply-To: <20200217131248.28273-10-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 21 Feb 2020 14:02:25 +0000
Message-ID: <CAFEAcA9MaRDKNovYjH1FJXTbAVOL3JaA20Sc_Haa3XjnRNkGvg@mail.gmail.com>
Subject: Re: [PATCH v24 09/10] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Fam Zheng <fam@euphon.net>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Zheng Xiang <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Sf40PR4h77ST

On Mon, 17 Feb 2020 at 13:10, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> Add a SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> translates the host VA delivered by host to guest PA, then fills this PA
> to guest APEI GHES memory, then notifies guest according to the SIGBUS
> type.
>
> When guest accesses the poisoned memory, it will generate a Synchronous
> External Abort(SEA). Then host kernel gets an APEI notification and calls
> memory_failure() to unmapped the affected page in stage 2, finally
> returns to guest.
>
> Guest continues to access the PG_hwpoison page, it will trap to KVM as
> stage2 fault, then a SIGBUS_MCEERR_AR synchronous signal is delivered to
> Qemu, Qemu records this error address into guest APEI GHES memory and
> notifes guest using Synchronous-External-Abort(SEA).
>
> In order to inject a vSEA, we introduce the kvm_inject_arm_sea() function
> in which we can setup the type of exception and the syndrome information.
> When switching to guest, the target vcpu will jump to the synchronous
> external abort vector table entry.
>
> The ESR_ELx.DFSC is set to synchronous external abort(0x10), and the
> ESR_ELx.FnV is set to not valid(0x1), which will tell guest that FAR is
> not valid and hold an UNKNOWN value. These values will be set to KVM
> register structures through KVM_SET_ONE_REG IOCTL.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Xiang Zheng <zhengxiang9@huawei.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

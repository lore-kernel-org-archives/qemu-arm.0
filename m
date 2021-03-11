Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp537735lfg;
        Thu, 11 Mar 2021 10:37:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqDVss7jZwZxteucGUHJcgmGOc5rIAZ+nTbIxkc3xMnF74BSUcdhm01RWL5xOY6C+lrmf9
X-Received: by 2002:ad4:410d:: with SMTP id i13mr8576010qvp.44.1615487845667;
        Thu, 11 Mar 2021 10:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615487845; cv=none;
        d=google.com; s=arc-20160816;
        b=EUsPzqFac5Zae9qe73agR1dkEyE2jUmVDnJOb93G8fRUmo0OihTMFgz+XktHJ+2SCy
         Lix3GPfEQkPKJH/64+TNnw90/VMplnKDVq5OygJs5rrIlnbRdSIIyONNVTV+SJXlkU21
         R/Ye+5Ob15sGk6Zg4MNqEw7g5PPCUVpwn28Ea1VFs1kPkMFIpxAN5Zyu6MJDahs93Spq
         GqeXNM6NIlvvZvBcd2jDU7/XtYJtKJhNTUvzVtGOoZE6uK6BmozCMJaZDsy8EIWijXzW
         PyZkBYMprEE0J5Md8aqJJzrFPp66vZJJgSOLnjoNKscXe1dQUbBZacbeXl31u8n2NFo3
         W7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ov70TAUDYlyHMvYN6fTBML1UlSTX7smftZbhOVMO4zU=;
        b=nwLZLI/dy8830E+DErZw0i+2c0UuDnug02uyGvbygAc5Qt6oRSBnk6Wg0SHOpe8cVN
         8IFqEOl2xIfJ5lgDrTcva9i+1+xuCsnsDL3MxEFl+AF6v6z7qDcDcxsP6yeM3igzaaLm
         djZSs4gV+WB5vFe9uNb3aU7Uham2mtTBZBhWNslCj8Wo5VHwXfP1GNOZ6wC52BQ+meCP
         /0rNWWyZEG1g8ChMpluQbbvubbyozAWM9T3dlWCZ7dGo3ccMcGu/JnNnz9SZzfNlce4A
         ITk89uorTMxC8qFGPwQNvweO4bOwq3k9vGNyNMY19SrqZ54UxmLv5VkPI2IcUMXNQSqm
         9RvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRPBLzKc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si1823115qve.110.2021.03.11.10.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 10:37:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRPBLzKc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKQBY-00063k-SU
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 13:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQ7x-0004FW-Kt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:33:41 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQ7t-0006PX-9c
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:33:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id z1so4310203edb.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ov70TAUDYlyHMvYN6fTBML1UlSTX7smftZbhOVMO4zU=;
 b=TRPBLzKcCy4u6qq8ZF57rfTPp1LCazBWXSyXM7K6/W9cR9ytH1widbOtaUwCTJ9iFj
 9lJFCABx/BpLEJI/6uaVqf9/2/ymINumOa/KdLRO2Pkg/ag9M1XGldq3NB55gc/RxZaK
 BqzXIkF12HRfCO8IjKc42lipuNmjT7ihG7FHE0ZAYmyn8C5MAi6wQ5zfOGs246ZOxHVa
 5LxabUrDGNM0ir5uKw2QZBmBePa4Xv/xT5AcoamijRCCXoeaN7N38UaqX3xdsVseXlID
 HDoKSsw9/tQXgfnLTFyjsHJZkIy67Wq56BlQwduHP9iLl9737c4eZpYttF67xNRmJDBF
 ExfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ov70TAUDYlyHMvYN6fTBML1UlSTX7smftZbhOVMO4zU=;
 b=CqzA54N812NZ6sGFL1xlm88N24FaFjaRKm335DuObCwhLE6XaVtwKk5FPz3x/EMEJc
 0RpdxUbOtcMLrC22nF7+mrBGPayp3+b0Hyn09hMC9vDTeb7qo0f/pim/KYGVEewDjBVf
 /O9FeQcIaoJiuXefAfW5vHBIUK2OgH4YRRcJ6526haXoXTrpjC25ZiJ/vPNiwnL57E+X
 WDMqZyhx/IdqqNjQZxc3WPJih0Y2vXryTXQx8s8QJ6lvXxokEsopNfQjqSZfYAAazsHk
 OwlbNvAgb21qaVnlRBi+3Lu42gJQoecWPf8bQqhJxNvUFuvEC2S1FbNasVhbWquu1b75
 wn2A==
X-Gm-Message-State: AOAM532I8Enw/CoLqLiiXfekf7z7RFdpfjtwnXZmHDbR+ZWIwvhcMoq5
 viBaH7oRmaXjAVf2McB6lBbQqxfN0s8XF+qx9drzNg==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr9766096edt.251.1615487614051; 
 Thu, 11 Mar 2021 10:33:34 -0800 (PST)
MIME-Version: 1.0
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
In-Reply-To: <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 18:33:15 +0000
Message-ID: <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e4musjEe/C4L

On Thu, 11 Mar 2021 at 17:16, Claudio Fontana <cfontana@suse.de> wrote:
> Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?

"max" is "best we can do, whatever that is". (On KVM this is "same as
the host".)
"host" is "whatever the host is (KVM only)".

> KVM: (aarch64-only): aarch64_max_initfn():
>
> The following comment in the code seems wrong to me:
>
> /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */
>
> This is not exactly true:
>
> "-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
> After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.
>
> In the case of cpu host instead,
>
> "-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".
>
> Is this a bug?

Maybe; that's a question for Richard or Drew...

> Are "max" and "host" for KVM supposed to be the same like with x86?

Yes.

thanks
-- PMM

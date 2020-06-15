Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1810015lfm;
        Mon, 15 Jun 2020 08:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhCofAKVNWM2WMDkax5VKr1QidIJlK0vIr40rtA5amXRvMNNFYQIGfDZmRG1fjpFLab+V4
X-Received: by 2002:ac8:1a45:: with SMTP id q5mr16086185qtk.180.1592236432336;
        Mon, 15 Jun 2020 08:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592236432; cv=none;
        d=google.com; s=arc-20160816;
        b=CjYcFIUA+d6y/nj31v9li1n3z8rAqSylEZsg9ZkKbwy6S9rkJL7SN4yqlo0r0gV+zx
         canSA0Oo215uOR1ZJ15Y0uXMSjaJtsHPcC6v3S9/2rzo9hWxM0tmE6dzOOLq5Bk67Y4Q
         TqYQ2O1+2XUKXERi/yrbwFVFbe4OP8lvwSsHd/CBxlu25cdmODHH8HNFgiXy0ae8Zf+2
         PXtCGktqm/Ok2HID+K0cuTOSkGnR1I3lM8+QjqLYa7fb90/lIiKygiodImlzTDRfSSNk
         r6cUtBQY22wjI+MQciQyLPz5OU01Q6QXl4TX6q55577+k9sRm1hBDX9kd5oktc9xe/0O
         rBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+JqJrSpYb3gjbzDhfx55qCCs6zRsSA6j5DidKO+u3kA=;
        b=AJFHMndWcbQjWA++Ap70r62pUCvxPKh2pVMDTjnF/lxYgZeMY+9atLrPXwpmb77WlB
         +rt20zyf0HKWOygTUSqxzGKd4QAO+fzxpiKwADJt6iih/RvOxZFzO+53CtYzQrmKAU6+
         MYV07Ty9kDPv7r48U1nywGCoiCsVRq6P4Q5g5DXxPScIdEu+ZThJ+r7znYP+1NcESsIC
         7Yg/mnSKaOYoBFCvLkq/vl8B5C1QX0yjQOT8DF1QBYWcDRy5F9W1cW5zcOanodp2z1Li
         3k2M2mWLs0kxI1kuwqb4s7QiO/Eb+wUsHsy007AW9vwU8y8bZnnD5u1TZbVFY+vars2u
         Dd/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="kS/4p+1X";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q16si8356302qtb.243.2020.06.15.08.53.52;
        Mon, 15 Jun 2020 08:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="kS/4p+1X";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D65BC4B0C3;
	Mon, 15 Jun 2020 11:53:51 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AySnhMP3FgOZ; Mon, 15 Jun 2020 11:53:50 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id DBAC04B0C7;
	Mon, 15 Jun 2020 11:53:50 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id AFDE14B097
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jun 2020 11:53:49 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JIhp4f8i-hh for <kvmarm@lists.cs.columbia.edu>;
 Mon, 15 Jun 2020 11:53:48 -0400 (EDT)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id C2C2F4B080
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jun 2020 11:53:48 -0400 (EDT)
Received: by mail-oi1-f193.google.com with SMTP id d67so16291925oig.6
 for <kvmarm@lists.cs.columbia.edu>; Mon, 15 Jun 2020 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpWoqLfnguV0GF6n4sJERMG+0Xr1p7BH5DoEXiKawJQ=;
 b=kS/4p+1Xf00zo77o/0QZGXVkaM0e5CHgM4kDNE4lKpSLqYOokRmTrzAoFWyb3xC//y
 Exru4PSTsuX/ZYcu7Q0PY8ysi9YBtcwVMRBzdyQOWq68ug4oaahur3YQR113utD8jZPK
 2TTu5eaAKWuvdCDsq+OgzLxIsKhaPG164KAhWlh4SVeITCLTEZYfqP2V8hN2OFSNw2N2
 c7HxmRj/eHBDhIYFfchWh3i2Pv5Yppb1jdB+itvo1QFWHpx3X+AXTosEa7HkSMkUlZ4a
 XS/cSTyJo5rhwzo+mXVpdZt+7hWA2VMzpDTD4jpGKaUOLoO2jhdCpbFkGY6T7GXexoYg
 KFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpWoqLfnguV0GF6n4sJERMG+0Xr1p7BH5DoEXiKawJQ=;
 b=ipjbCjeUIiQzN/NDXRl/Oma0bIqNd8AJYII9EVfzyaGIETVZrhKmBnFRgweuNuzXK/
 xgaUI/vrXyXClsxpetYRvTj4k92j1G9gXQmA/Hwh3OZm1JuyDD9R8BqUK1mYfYO1akr5
 5fAHt+9yp3Y1OZ9T0b1TDPeFUFuwgeSP+S3xiqVZuLYRHCHbiIWa4hKFqjEw+tw8txhS
 B05vYwNZJDm0+K6cNPBKpfaHdCSVdhpRhQSHQh2CaArr54eKdoYwKo9poetpwNHTq0Mm
 N9NlrlweXbc85BbGBzhOPQGNeGn4aVsSNfshrLpLYBHdVd4Dx30jk01ZtDfyVKGDieRm
 CoPg==
X-Gm-Message-State: AOAM531UQ1yCLfk5yKRbuMQ4T868gLWeZm1ZVRaiDWTjO9+OZujY5WUd
 +f9VVoBR9o48SJwLObWXdvEC2rW9mfCmAh5gNsq4hQ==
X-Received: by 2002:aca:568c:: with SMTP id k134mr4196oib.48.1592236428190;
 Mon, 15 Jun 2020 08:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200529112757.32235-1-beata.michalska@linaro.org>
In-Reply-To: <20200529112757.32235-1-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 16:53:37 +0100
Message-ID: <CAFEAcA_d=F6k3RcihV2x-HiOR-Qq+kWOcwh1FL9AUcG_2SqEVA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] target/arm: kvm: Support for KVM DABT with no
 valid ISS
To: Beata Michalska <beata.michalska@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: JwMX/vI1F2Zs

On Fri, 29 May 2020 at 12:28, Beata Michalska
<beata.michalska@linaro.org> wrote:
>
> Some of the ARMv7 & ARMv8 load/store instructions might trigger a data abort
> exception with no valid ISS info to be decoded. The lack of decode info
> makes it at least tricky to emulate the instruction which is one of the
> (many) reasons why KVM will not even try to do so.
>
> So far, if a guest made an attempt to access memory outside the memory slot,
> KVM reported vague ENOSYS. As a result QEMU exited with no useful information
> being provided or even a clue on what has just happened.
>
> ARM KVM introduced support for notifying of an attempt to execute
> an instruction that resulted in dabt with no valid ISS decoding info.
> This still leaves QEMU to handle the case, but at least now it gives more
> control and a start point for more meaningful handling of such cases.
>
> This patchset relies on KVM to insert the external data abort into the guest.
>
>
> Thanks for all the input on the previous version!



Applied to target-arm.next, thanks.

-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

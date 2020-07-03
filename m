Received: by 2002:a0c:e144:0:0:0:0:0 with SMTP id c4csp1490744qvl;
        Fri, 3 Jul 2020 06:01:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRXF4i9X/XgIKL6OKYKGIX2oyBne1yG6NV52XFCWUgFfdGVFHVb8bQl4XIHYIRbPQpNKXw
X-Received: by 2002:a0c:f385:: with SMTP id i5mr35928012qvk.4.1593781269141;
        Fri, 03 Jul 2020 06:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593781269; cv=none;
        d=google.com; s=arc-20160816;
        b=m5rhXueJLBqHwHhZrH2dNpz2ArRCg4Y8GCVIa0p13Oz0v3fo2TIl4QTAadF77bkJ5O
         jc9OgR6Iet5jF5MuFf/yrpiDuRAld3Q/K6woNV6hCLTFLgmCRdpSw79xj2RWkRvqnIjU
         dAK4WZesS5h0e3G7haAXiLOXycj3tPKrF0XRxN8RqE5w6SwBTS494f42BDIDx2EbSJVk
         2ATvuilEjdb2FJ6ZGT+EXFU98foCwVi0TvGfJJ71lfuCfZt9pSDe+IfPsxRS1POt4h9+
         Iucq1ELB2G5iPPA0t+quvapbKPsMjnXXwD258BWbma0nrO/vT6fPxaE5cHGBHGuVEz5R
         iCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gk3Q3NtAMcNJAztygw+ahWjClWnGBrmhzfEqglBBs9s=;
        b=H6Ps1RVgX6U/YcZoYUh4BSB8QYq+yud0rLjFjVAMAkNk4zzJChBtym5/7QHdLf8FCH
         dRCF0I0hnfW5+gpZ17E1VsYqVTl9wBPvZouZgtJhEXf1smwKkYo6KU3KJ4Xh8XeROFhx
         ccsVs9Uf25IkrRQAqb4oB4+KFIr8KlgHCYPA3FTKcmMjVxOJ3qIlklhoXocM690T5PwN
         K9ohkYUJdCnOk7rAg0iEfiKvh48wavk/gOa9zajAHKM5gqkcwbJSu3Kc7xugFZKqOXh7
         N/AR/k2JN25A8ZBhzYsjCdMwMIbTelX8aOUphPbmpRw2pBk7Oc1MSms5qu4qKkAz2sa6
         kbJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="AhIik/DX";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id b79si7904221qkg.154.2020.07.03.06.01.08;
        Fri, 03 Jul 2020 06:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="AhIik/DX";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9F25C4B14F;
	Fri,  3 Jul 2020 09:01:08 -0400 (EDT)
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
	with ESMTP id sE+r8aoWfqQR; Fri,  3 Jul 2020 09:01:07 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 837584B156;
	Fri,  3 Jul 2020 09:01:07 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id EA0064B14E
 for <kvmarm@lists.cs.columbia.edu>; Fri,  3 Jul 2020 09:01:06 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oN16AV1LgRCf for <kvmarm@lists.cs.columbia.edu>;
 Fri,  3 Jul 2020 09:01:06 -0400 (EDT)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 114594B130
 for <kvmarm@lists.cs.columbia.edu>; Fri,  3 Jul 2020 09:01:06 -0400 (EDT)
Received: by mail-ot1-f65.google.com with SMTP id n5so26676368otj.1
 for <kvmarm@lists.cs.columbia.edu>; Fri, 03 Jul 2020 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5rO2xkav8qempBVEekmcKPJ77H6iG3rRif77s86Ajg=;
 b=AhIik/DXfy2epE5Yz43CROdtoC5KMu0B6oq3VndRKh6iqK8kYO2BsOvUnRhu3QZvLx
 4QR/GVl5BGcODHM94yd2OpB3/GvAfliIrSwitIAegpRmI7cR/SP/1K1jsTc8LR0YxirT
 /aDpq5F1XmcZeag1N46Y3oBedrLBf/9UD64RzCmjbDcwa2CIa6yp+SSk2udxPG/GW/KD
 dJihy4DKTUtxKdbkyhAMgsE79Ba7LQR4kjZZSQ5fJvQNCQhwHaz/nznkiM51hhzWrBL5
 8S30GJNbmWdKxe62Lvm9y1m9VhEbnhuIrncwuQK0ezJ8zmVjWtJXj8WHQ8LjyTuSXOlr
 3JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5rO2xkav8qempBVEekmcKPJ77H6iG3rRif77s86Ajg=;
 b=VBVPmXUhezbTCn7hXIGxSEoUZtDrr9J6gsZkQtC1IjHhh/5T6Se3zBBhMQmRxfMG5x
 bi4TYwlt4azeu13CFetM6bmAWtMn4baT1+wvk+fwK+uM6VF26xbguSKWZJLOQoLMR5rv
 g07m2dylRu7/Auo02NVdDCwtysZFDIRoFhqlNT0DkikcNPR2T1t38kpOJxWNB4pg3FAU
 K3SuT6urVSuBHwSK56pDF9536JRQGr2O3132W/Cp5uowTITQB3hGvlhh+KrCv28HRBPt
 nIA+Q7YtK+Jx3pzedNvnWiIqfWAe29tj6M7p7YMYEB8TdMVlPoBbCCclMBdj/SfTBQrf
 NvZg==
X-Gm-Message-State: AOAM532pPTU8UbtGlISCTPub+CKO/rzFgcaMUl9SOZ+pEWRTGk1Rt2Cj
 tjYN+ZJYWdrbKwrjQsvvE7NUBkZoJRBLgK7kdJTRLA==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr23075129oto.135.1593781265438; 
 Fri, 03 Jul 2020 06:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200629114110.30723-1-beata.michalska@linaro.org>
In-Reply-To: <20200629114110.30723-1-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:00:54 +0100
Message-ID: <CAFEAcA8F-LR8qBw-ozp=0pDe2f9oC+F1fQW4xDO0ooPRws53uQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] target/arm: kvm: Support for KVM DABT with no
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
X-TUID: P3ObiinkqW+2

On Mon, 29 Jun 2020 at 12:41, Beata Michalska
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



Applied to target-arm.next, thanks.

-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

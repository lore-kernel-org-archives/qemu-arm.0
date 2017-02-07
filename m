Received: by 10.25.77.65 with SMTP id a62csp2230687lfb;
        Tue, 7 Feb 2017 07:45:38 -0800 (PST)
X-Received: by 10.237.59.28 with SMTP id p28mr14359491qte.152.1486482338053;
        Tue, 07 Feb 2017 07:45:38 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id t124si3212712qkh.309.2017.02.07.07.45.37;
        Tue, 07 Feb 2017 07:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6631B40C32;
	Tue,  7 Feb 2017 10:45:05 -0500 (EST)
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
	with ESMTP id tnpOzjmTakAW; Tue,  7 Feb 2017 10:45:04 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 81A4B40A66;
	Tue,  7 Feb 2017 10:45:04 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 63BE840A66
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Feb 2017 10:45:03 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CbyKOUpB5EnJ for <kvmarm@lists.cs.columbia.edu>;
 Tue,  7 Feb 2017 10:44:58 -0500 (EST)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id B4F5F40783
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Feb 2017 10:44:58 -0500 (EST)
Received: by mail-wm0-f51.google.com with SMTP id v77so160254630wmv.0
 for <kvmarm@lists.cs.columbia.edu>; Tue, 07 Feb 2017 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mz2Ti61N1caxQzxnHN13STj4nTh5Xbe3X8VZ7ySh+rI=;
 b=EQUsP6oZIIkZwUoeZ68xVtl6htbbpEGb0RW405rNdInyw83lNcOlY+k8EdVDIjTJjD
 Orors1O2rNtrTBe8zckIfcQooXCHdY7uqmSRxLjobQ4pgAxJ2K/bnGL6FEyDQ3eJnyMI
 t3AtCsHTvAOpzyXyJX5jCFj8+JO1ZaHGk91V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mz2Ti61N1caxQzxnHN13STj4nTh5Xbe3X8VZ7ySh+rI=;
 b=dNIz7tj5GB0TAC/YUHPTPuvikRkYcnzQXvo/x08uMGAcrYNK7w6e2pfq9I9MNr/7zm
 /LwcuFSxp3gNz/vL3BYtAchOjS5PzcSrBkvpzZ5tYRW8/5O//Kk9u7r0NP4N1L4ujh8K
 1DvhgJPQcSx5y9RKjypBZWTGZgAYw+tSod9/acRdOjeOLvcLxmA5tVZ6FEwguJ+FiUR6
 qmOXW58t9DkCQ1AVsgNdsZ1n0hw8j9dOIX8Hpn+2HW4lUolPQOtTdYogbzTMoTtC3Xux
 GugZxebe4q9oLajGF9HEBOM0EZ92acFNVuz2ymyl0Ha8pY4dQcAmtA53Xtj+JPNv+t6D
 VskA==
X-Gm-Message-State: AMke39lwCS1y+KBVuvtJoT+YyvdYVpJSCEoyTE4cQ3CVcIbuBYKbPBfxQfkdd0FTlusyzSDg2tTT9rXqPdOwEU/l
X-Received: by 10.28.91.16 with SMTP id p16mr13016064wmb.111.1486482329372;
 Tue, 07 Feb 2017 07:45:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 07:45:08 -0800 (PST)
In-Reply-To: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 15:45:08 +0000
Message-ID: <CAFEAcA_Sn+MSVv8VcjL=o9VNR1+6VpTFFUhf6Mmr1-YGxt5gvg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] target-arm: KVM64: Cross type vCPU support
To: Shannon Zhao <zhaoshenglong@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 wu.wubin@huawei.com,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
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
X-TUID: OMNCMgfaYcwc

On 16 January 2017 at 09:26, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> This patch set support use cross type vCPU when using KVM on ARM and add
> two new CPU types: generic and cortex-a72.
>
> You can test this patch set with QEMU using
> -cpu cortex-a53/cortex-a57/generic/cortex-a72
>
> These patches can be fetched from:
> https://git.linaro.org/people/shannon.zhao/qemu.git cross_vcpu_rfc
>
> You corresponding KVM patches can be fetched from:
> https://git.linaro.org/people/shannon.zhao/linux-mainline.git cross_vcpu_rfc

We should really document the "generic" option for -cpu somewhere
and what it means. Unfortunately I'm not entirely sure where
that should be :-(  Suggestions welcomed but this isn't a blocker
for this series.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

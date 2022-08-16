Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1762510ejf;
        Tue, 16 Aug 2022 05:32:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57P04KXzTZgplH68VZDnHPAnnnT4mdr+ZDEA266F/S7K04xKN2tvicwWJhmTEBV+cmXWbs
X-Received: by 2002:a05:6214:d89:b0:479:6726:7f42 with SMTP id e9-20020a0562140d8900b0047967267f42mr17175220qve.20.1660653124198;
        Tue, 16 Aug 2022 05:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660653124; cv=none;
        d=google.com; s=arc-20160816;
        b=jm0aZcUJ7OUvGE4ly6nDLfD+FzOTPFG2E5byWnDEu/BcTTWiPDzyqtHRfwahVjpeUF
         vot01PUVB1R5YshwGzWQ05WNDFs7as4Ivcx8zPzVOI0p7eyn6yBLZ7BDD8VR/OiOCgmS
         bDIiK3Ir520HscFayP+GW0GnlOYIgFq94Ms2xo2EqArFkG7Qa7xxJXVrYO+tTZhnlJbF
         Xr6hJryMEUX634rFCJZp1WIaGAuanGtJjXcqQxOQWQ81V+ILe62uTEh5XjY4BlalLnau
         jZxBmI7JVoknTtlKUTQt3oIo5uDXqHw1IjJv3fUvWNy7A34BPqBZxqq5SUULhD26LGeE
         PTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KxfYVhtvedHUdR2YPbcNZIs9fvLVJGcRbCLGdKED/38=;
        b=AgXZ9u4hssZLw+oeiAMIPQ6E+9VkYB1mZ4DTmZm4F8Wpu4BPibf7tSfZot+A0CexUF
         ee0cLofsYiredM3MRbWK9zFt5UfFTRaLsH8hvjPudyFLhbIzUXrKL7E/fH4meVt3BRx8
         /ckbBq8Spypdm7CqowGpFS1//85EP3xeZHVXwFb0y/C2kE1Uzt/hvn0Fhxe4hU9xPMqJ
         T4CjKCjPnTDD8hi2zxxQZVIghz6QsimG3j7mP1gdSS3Up37JeXHQUkKqAL3syxDA4341
         El8GMr+n5tGXzL4o5vk62kWF3OSV/vL0qXyxzCFV6SXmZCuP2Ey6ZKmb3eA0Hs8t9H+F
         BTgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=Uas8zK7a;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id jq11-20020ad45fcb000000b00476ff29329fsi7229714qvb.418.2022.08.16.05.32.03;
        Tue, 16 Aug 2022 05:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=Uas8zK7a;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CBFE54D595;
	Tue, 16 Aug 2022 08:32:03 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.789
X-Spam-Level: 
X-Spam-Status: No, score=-1.789 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, T_DKIM_INVALID=0.01, URIBL_BLOCKED=0.001]
	autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMqzHQDZF-W7; Tue, 16 Aug 2022 08:32:02 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 841F74D589;
	Tue, 16 Aug 2022 08:32:02 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3171B4D586
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Aug 2022 08:32:01 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJggl4X4wFge for <kvmarm@lists.cs.columbia.edu>;
 Tue, 16 Aug 2022 08:32:00 -0400 (EDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 244864D585
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Aug 2022 08:32:00 -0400 (EDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-33365a01f29so48799027b3.2
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Aug 2022 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=v+DRertAfOhDVcUnuGx9lEwhV6sbeQ2CQXMPmOp/Nvs=;
 b=Uas8zK7axSC01+TrTA/wNZ1xP2S+vma9C5mERK33X9vd/7Qf/yP3c8zuk8m0kAiPX5
 bke4r+RjlXW89b9dkta4W3qO67/+havYt9AsG9MiIZi+72DYSae059SVy1V1rxmBZznq
 TOWDpQyJVnUR+NNORwT+gx4EHHUCg198Xsg4H0m5tNXAMLxGu51X6d5ET49oz6xGBuVN
 BdnbJ9q2WVCg79oU97HxKgFiZR+fNSd6B8MrGilYQSN+/p+gwjo4nrO9DZ4JX6ipr9E4
 bH9SzVzzwOTj4VLjDb7WsEkzMmI1vP6GsYXkVmOgNiPqbrncLQyrRuvJi3+cduWpUHnD
 RE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=v+DRertAfOhDVcUnuGx9lEwhV6sbeQ2CQXMPmOp/Nvs=;
 b=1nepVTCubPJsMB5UMXEZ/ai+OCNtqWcCq9EnM2biW2HCynyB6FKMTeLapiAKenwRxD
 qAGhjjY1/HlcfAZkJ7LONO+mMgsNz1hBZTTAtRRFcBIGp9Ec2ep8htHV2QP4WY4A8xlW
 Gv81zHpYMMF4LvtMahR7T//fZOkUqlrmDiZv0KUoAcNfcHaIieae3BNMhGUGG/zfrrkH
 sQs7nJEVM5zfExTs8zJqSAw/Pfzm8e4o22D9msIwy2ZS0l9SKvLQvVeAKvSrUBfz0yY4
 QLgnsVDAsMBVgfp1Fl2GKKLkWOzcrHOoeIfy4l7iuFkEYyWBBStu4+kd1ABjt+Nm3pYr
 025w==
X-Gm-Message-State: ACgBeo183fSvjfL52TqFWfcf3K7VaaVhdRx/PGgiPqgmdIbYPxGnotau
 ZMigvw2TG/8tewxmaRILG95vxMQgeGWuUfQB9NqdzQ==
X-Received: by 2002:a25:3d0:0:b0:67c:2231:65e with SMTP id
 199-20020a2503d0000000b0067c2231065emr14218893ybd.67.1660653119619; 
 Tue, 16 Aug 2022 05:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220812021427.cwenhciuftgtaj64@altlinux.org>
 <20220812084529.ur5qcyws5qvoyvuc@altlinux.org>
 <CAFEAcA9BuSe4SwpoWTALURaxoj-8U2y83k=und7oKrZBggLarQ@mail.gmail.com>
 <87h72hv71u.wl-maz@kernel.org> <20220813111137.5plgwrfnosolj2bp@altlinux.org>
 <8735e0s1zw.wl-maz@kernel.org>
In-Reply-To: <8735e0s1zw.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 13:31:18 +0100
Message-ID: <CAFEAcA__6WaoFwTHH1FhAU1xpvGpA2YvZTo1BTjbKw2GqS5q+w@mail.gmail.com>
Subject: Re: qemu-system-aarch64: Failed to retrieve host CPU features
To: Marc Zyngier <maz@kernel.org>
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-arm@nongnu.org,
 "Dmitry V. Levin" <ldv@altlinux.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 QEMU Developers <qemu-devel@nongnu.org>
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
X-TUID: KYhLSwo44EGV

On Sat, 13 Aug 2022 at 14:32, Marc Zyngier <maz@kernel.org> wrote:
> But we probably need to handle EINTR when creating the mini VM.

It's easy enough to add a retry-on-EINTR loop to the KVM_CREATE_VM
ioctl in the target/arm/ code. But do we need to do that more
widely ? At the moment QEMU seems to assume that KVM ioctls
will never fail EINTR except for the one special-cased
KVM_CREATE_VM, plus (more obviously) KVM_RUN...

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

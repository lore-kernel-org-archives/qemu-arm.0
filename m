Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2962340njc;
        Tue, 5 Nov 2024 08:53:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpReHuS+/NxU2GVXg64jWTZWV9YV//UuN3210i3ZBgnnecqP6CVuilrtcT1Zdyp3DhbwCNdzRTZZkWjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCrhGA/2dOdMbTEgpbA3x7R/jFjEDvFJyqVujpvKfaSNn7oZTEzP0rNK/xySnG6/4VfvIt
X-Received: by 2002:a05:6358:94a2:b0:1bc:573a:401a with SMTP id e5c5f4694b2df-1c3f9d13410mr1629500355d.5.1730825638817;
        Tue, 05 Nov 2024 08:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730825638; cv=none;
        d=google.com; s=arc-20240605;
        b=Am7CYI14Qmb60cOag1mekdTBYh2v0C8u1b6PtZ6WJI3BBVwplnMsuJdSRJIbeygc92
         RjVzLgLse0ye5FDDJneLmpwhg46h0rkyo+szVlRTyrEFmRugGAl0mPMWEPXaYkozGEAX
         rW69+UiRyY85BmwPVQsWeZDz2YBSB188yInU4rjNHvkj7J6UIHbWv5nHMh9Gpp6MUinW
         vIYpEuXNLvcE/iGTBtTlxr/ypzRh+CBmuf3Nh78s4nezBIrgJgzIaWSMUaEOcQ3r6Jvt
         FKS9/sZ+1EjyWw2L5ib6T1r6ohUYZlZmkRGVqX3Qi4qRFPK44yLmv6ktqNwTDYtB0e1V
         d0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=flv3ujNe21r/RG52tSwhS+6SmqV+5XOaUrjyRpdhmsg=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=CfZlub0981m83HO/uq+7wIIE8eJPwumVQjG9MNgp7pAz/hZp7M0e0JvD5V9LsS6WnJ
         pXV/DXlaJv7yT3dqp0vcJushgg/qd/uBSj76XaahLLHM0xGzzgeC9I/trlhR8ziDMJib
         Zlw73SJSpwcEagtKCtIKhcq/P3D75M2+F8Ospx/vun9lEWDP0vJJ6u6Kx5LM+CYgpZsF
         P/uxoZsBgdX28Gju7pUulFKraKsDpW0ZbOdK7LSpTxcjVh8LEDZwjpJbs2WD/xdH/zdY
         poI3l9BINOwSUq8q2Tiwt+Nif/SJEV1Bl7iiLBjVigto33e4FfBAHV3SRYK7pyP8WdJZ
         VqXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b="M/WN6RY7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fd0f4asi136793816d6.128.2024.11.05.08.53.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 08:53:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b="M/WN6RY7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8MoD-0001gb-N5; Tue, 05 Nov 2024 11:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8Mo4-0001Ue-1J; Tue, 05 Nov 2024 11:53:29 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8Mo2-0004ug-7u; Tue, 05 Nov 2024 11:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=flv3ujNe21r/RG52tSwhS+6SmqV+5XOaUrjyRpdhmsg=; b=M/WN6RY7KEIIiFu
 flIR0IUlxhlGz9EtQyvf/fG9c0bnjKxh4ZwAn/Ei2I1lKd20QRc7gGQJx23tJATFHffZpMOc+CI4Q
 ucV0DMuo3BJUbWD0tYd5z27yARsftEY/HHf40tHAwwZtG2WCd8x6grevL3tEW+mRbDKlI3LB2CILr
 B4=;
Date: Tue, 5 Nov 2024 17:56:07 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 08/19] hw/microblaze: Propagate CPU endianness to
 microblaze_load_kernel()
Message-ID: <bhyfbuv6k5alp2tvegfdmcpn3777v3jofi3eryfcjr7xeg3pm7@af6so5isinst>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-9-philmd@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C6/NJIcS911L

On 05/11/24, Philippe Mathieu-Daudé wrote:
> Pass vCPU endianness as argument so we can load kernels
> with different endianness (different from the qemu-system-binary
> builtin one).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/microblaze/boot.h                     | 4 ++--
>  hw/microblaze/boot.c                     | 8 ++++----
>  hw/microblaze/petalogix_ml605_mmu.c      | 2 +-
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c          | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>

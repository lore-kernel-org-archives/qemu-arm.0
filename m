Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp572040njb;
        Tue, 4 Feb 2025 16:21:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfPqgWWcEuHEHE5cU4OTyqwUIM1u2YAykkgoe9fo1mK/7Y4GXDlSlQtZA4/7SKBjVG5Xo+06+be/iG9g==@linaro.org
X-Google-Smtp-Source: AGHT+IFR2KGqpYP0+IPdD10xfehCRAA8IjIG5fwIFtQCQfVd/+Z8LosFU3vNNxljY5XrQX0Qiy26
X-Received: by 2002:a05:620a:404f:b0:7b7:142d:53a4 with SMTP id af79cd13be357-7c03a02d527mr128768685a.51.1738714898007;
        Tue, 04 Feb 2025 16:21:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738714897; cv=none;
        d=google.com; s=arc-20240605;
        b=N+f2JJRBzFEa0iLBcdDAW90FWH6XyzwkhvRmHBpCXqLCuOYqSCQf9fcy8rTVp0ljat
         iwJbnyIDUzedSVn4JEVwg/mF0jNyF9oxkQ8qg/jAvBqCxgxfSKEoZ2saohb3O95y3zA7
         haNyCoX0qJ9gPbYJ3cG1qfwYWyvJj6R5S1kONiyRiqoJm0NZVQIlifAL0CgjZxZloivH
         xYQ+ap/gJOomRXqpG0/fgZ2nyG54wJ5LTnAOWfIJ03VBz37g2511HTJ0+mqpeSOFt7xr
         I0Qy5wPWwxW5AklSzX6S/i9VARrqIDx9h633AQoaRqLHbct3ljvlShUkF8dK6idpAIBQ
         TJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=PFss5dzGnXGQw4YqN/Tb8LWsX1MHL2f3VoIIEgRF7Y8=;
        fh=6ubuD4Vw0rpZh1DGiwCVz2VprOM2iUFR5Al4n6EH0R8=;
        b=IhQ2ePKHAUOVJIgeNy8Gelwd1U+bMCCFOJUaNR1lR4uOix0BvgjreW/7QrF37Kvvo0
         W5hKfLgg7kRx2qiAgPsEEaOPvJVHo0Dk+W7/GciS/d9ZsHcEroKvG4BjgNXqlWt0JFbm
         PIyFY+nBci4BMPaBn37KSr1l8en7c7PE7crn2n2NDRYIUsMM9jr8lMu2cn39bEZ43Xb8
         J9vSgku4CZUo/EESxJ4MiBCwOwODEtt30G46dNetEWo3Dd/p4x08Dg6hJZmAo+GVk8zU
         1gEhTRvTocU6nipADoidA7pI/Bh0sbptXg+I410SMB1VB6VnE3fr1UOidEEcndEbdgwy
         ifug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=KSuFD05+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4cadasi382586085a.62.2025.02.04.16.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 16:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=KSuFD05+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfTAZ-0006p3-CX; Tue, 04 Feb 2025 19:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1tfTAU-0006nD-Hm; Tue, 04 Feb 2025 19:21:26 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1tfTAS-0007bo-Lt; Tue, 04 Feb 2025 19:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=PFss5dzGnXGQw4YqN/Tb8LWsX1MHL2f3VoIIEgRF7Y8=; b=KSuFD05+zyWEiU6
 saQGYG3CO8CSQ7EDMcA+kuN+S5L721VsPX/dygIQTfL8Zi9VfHSxsRvvvbhTy1JJEipSRPWftttXb
 CSCQN5EVeUDHfzo3gZYpV7lcNrexJEAm1Epo/NZmO/EF7uu4zYYxGRJlPUVRgNNO0X0Sq5BaZajhm
 Ew=;
Date: Wed, 5 Feb 2025 01:21:12 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v3 10/17] hw/arm/xlnx-zynqmp: Use &error_abort for
 programming errors
Message-ID: <habifz773dkqbagma6uwrgfio5bxi4hxab72fteyjci2e6bjni@jc33nwzmfq4r>
References: <20241108154317.12129-1-philmd@linaro.org>
 <20241108154317.12129-11-philmd@linaro.org>
 <34a2d961-738b-423b-9ef1-5f4a85915e67@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34a2d961-738b-423b-9ef1-5f4a85915e67@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: qng2jRR4IRV+

On 04/02/25, Philippe Mathieu-Daudé wrote:
> ping for trivial review?
> 
> On 8/11/24 16:43, Philippe Mathieu-Daudé wrote:
> > When a property value is static (not provided by QMP or CLI),
> > error shouldn't happen, otherwise it is a programming error.
> > Therefore simplify and use &error_abort as this can't fail.
> > 
> > Reported-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> >   hw/arm/xlnx-zynqmp.c | 44 ++++++++++++++------------------------------
> >   1 file changed, 14 insertions(+), 30 deletions(-)
> > 

Makes sense!:)

Reviewed-by: Anton Johansson <anjo@rev.ng>

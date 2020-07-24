Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp305243lfy;
        Fri, 24 Jul 2020 05:55:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRxMqdy97ieJwPq3LQN+CKRjJxeydfgxnTvzy9voWea7vrXhpJfYagbJPnY8yaavHYzgrw
X-Received: by 2002:a25:6008:: with SMTP id u8mr14280790ybb.519.1595595321127;
        Fri, 24 Jul 2020 05:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595595321; cv=none;
        d=google.com; s=arc-20160816;
        b=RUiVij7SLga68YMQFTGokjT93J5/hYRQJog/HTYsLXK+BL0ArgVaeUOOLqBZttfhdK
         lQQXh6XMx8BRg079Jpaas6zlovikTZpwQw0sfOpEPnljro4ztHCM9c3Y+ImCGSbcne8o
         1cUVyvesS4WlFKE5r4DVKgYT0WJaC7V7epYoyzEECm0OlMxb38jfZSzconGTnvtmqT49
         G1vz0h5E2Yh1YDxxRLTYLbmiGYI063UW3ODjfhtufOr5em7OSfAl8zN/E6OctG54uSgT
         Cx12nxxkbQVfgdvO+Dl9TZNtaRl7nwWq5Eti3HBG305y2OP4S2iHVmAoUjJBW/W2Xthx
         VSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=jr6j5yjl9m6IfHpx6t7CggHYbcvBuJ1x6wyQVRWNojw=;
        b=bIq7X3T6maXG9PrmkvADEchsuNloE8GeQ17DavI8Roc2o5T2aQheRsKI/WwLEXtsjN
         32K49q2C71n7Ap1g3cZRS0U4BTPSlgYNDY6Gfr1cy00AN1VREvORKRs5iKhttvRYUP7S
         pR89g5EcUxBUlHwm/L/2THC7jPVaYJcaf2lyu/JYYLiMjnoPJWcb5ifo76Ih+FcWea7q
         PBjBBqND5XpJQyFj7WoJGHcFapNa2DTE+C74ELLrVawIvmhOfUZH8m4j0NgFgH+cLdGT
         57WSeJxkO75A4siXiRjnSDgdC/hMwPnui64N8OgshkfcyhEauw/NtKuwFzSrG1bJvx14
         rwlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UXckFoNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si950646ybd.357.2020.07.24.05.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 05:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UXckFoNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyxEO-000561-Hc
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 08:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jyxEF-00054d-I0
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 08:55:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38077
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jyxEE-000519-2J
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 08:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595595308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jr6j5yjl9m6IfHpx6t7CggHYbcvBuJ1x6wyQVRWNojw=;
 b=UXckFoNigvPd81YrX7zw21yzrhaeOgiWKeWr0HFP4meA7WfxMXFF7YOpPK+GdB3PbCwRhh
 Wzyr4V+EnUP2SCsZU7htoXJiwke5mnKZp3uO1Asj1bM3DfmuOm9UvzCdLCQfq6IVxkU6o3
 0+Q5iKf9RXQ/Al0sFvbtsIGvOc543l4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-9K5Rh41xPKi5VyJRT9rbiQ-1; Fri, 24 Jul 2020 08:55:04 -0400
X-MC-Unique: 9K5Rh41xPKi5VyJRT9rbiQ-1
Received: by mail-wm1-f69.google.com with SMTP id x8so3164903wmk.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2020 05:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jr6j5yjl9m6IfHpx6t7CggHYbcvBuJ1x6wyQVRWNojw=;
 b=XQo/e8JGdMHyGLKqbenMbAzrP3gjUp0xNc5KiezqYDuSmo4cTcHPIBZ9n2K9OkJSm7
 XYg/NrP0oWOiyB8RzI3YNZWiqBrjBo1tSiZa2m8y9CzAU3dZOO74Cot8vbSXwvQGepX6
 1MgOT5TzL9eZlNSFLjMHbOcM8hZ5b2drnDNq7Dukv+KMbkm0dchnmU7sML3PI7MI+ciN
 sjzpV/fp6ByxZAzXKuJyVqHFi0uOgzofN8j3FogFIM0XfYi9Lg+haVFpGg2lawXRSKkw
 W+XZBFTEyDC6yeTg0uxXnUr8W59aevEdQUaCn1/L19l9qQ5viRLjeBrGaRqSwj0qK2gE
 zxHw==
X-Gm-Message-State: AOAM530pptl+f7J/M1QDWT94gyZ9cgjBPGVFkIuSbn2wqvpe4LwvRfiT
 Oxs83x/LeiRncQYZvoNfVyGbxKMS4hjU8R6HD2EG2cCpgTfEooYBaRm58fvj++zdZTyHrjhD9E7
 r+BGJHMWJkRDW
X-Received: by 2002:a1c:4c0e:: with SMTP id z14mr8631613wmf.54.1595595303706; 
 Fri, 24 Jul 2020 05:55:03 -0700 (PDT)
X-Received: by 2002:a1c:4c0e:: with SMTP id z14mr8631595wmf.54.1595595303529; 
 Fri, 24 Jul 2020 05:55:03 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
 by smtp.gmail.com with ESMTPSA id g16sm1193405wrs.88.2020.07.24.05.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 05:55:02 -0700 (PDT)
Date: Fri, 24 Jul 2020 08:55:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ACPI: Assert that we don't run out of the preallocated
 memory
Message-ID: <20200724085448-mutt-send-email-mst@kernel.org>
References: <20200622113146.33421-1-gengdongjiu@huawei.com>
 <CAFEAcA-NDpWCfqQybu=6svi-ZR=MBBxSKz4dRikDXwW8fftsaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NDpWCfqQybu=6svi-ZR=MBBxSKz4dRikDXwW8fftsaA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 06:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Linuxarm <linuxarm@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Zheng Xiang <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PyeW2jy5J1cc

On Thu, Jul 23, 2020 at 06:50:06PM +0100, Peter Maydell wrote:
> On Mon, 22 Jun 2020 at 12:30, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> >
> > data_length is a constant value, so we use assert instead of
> > condition check.
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> > ---
> > 1. Address Peter and Michael's comments to use assert instead of if().
> > https://lore.kernel.org/qemu-devel/ca79ea28-9ea9-18a5-99ad-25c3eb744721@huawei.com/
> 
> Oops, looks like we forgot about this patch -- Michael, are you
> taking it through your tree or should I take it via target-arm ?
> 
> thanks
> -- PMM

Feel free to merge pls.
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


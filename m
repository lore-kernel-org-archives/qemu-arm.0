Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp682676njc;
        Tue, 25 Jun 2024 07:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyHDZ43QZ3bwfI/TuxFItjmIbG7zILwxCV/qz+vy9RRQwyr834Q8OaiK7tdE4g3kUtnTieaxwgt71NbUadg8XBM9M0k8hT
X-Google-Smtp-Source: AGHT+IGWoScBNILX/tX/QUCdZ/VdZyWQwMvXW02ogadSlXNtCUzkYUtzXUfYAIerXSMdbdJ/ejw9
X-Received: by 2002:a05:6214:929:b0:6b5:4cb4:2eee with SMTP id 6a1803df08f44-6b54cb4314bmr57211886d6.59.1719324477967;
        Tue, 25 Jun 2024 07:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719324477; cv=none;
        d=google.com; s=arc-20160816;
        b=ku8PDwwPTwFAErVJdPgScy/4LHqtQ/6sn1AjqoVsaig3eZJZnFVT2kMfcCGNAuLuLx
         SLivM1NByNVAZZBPVCTJBt3XRaFWEWgFSp6L4cL/e86XzJKUAiPSyjg6Xc4NdxfjOzao
         SMfB1sQYLqiU3UD91WZVBxNNJeXVlii3eB1RpZ8o/cH2M6N6v4BYR9fRw7zlfiOVhe4d
         P5+ZndZoi65CLTnh+DpgVenMNqtNmy4ctaI3gZi/JFTSKLwJo9cT4LZBFqo77FAY64/O
         dRHvUrvHCDBR6WoDGnoh1YmhzqBmrZuOgH8g9vJ0epT+L52jyiOnVJ9tBcr5aZmFtphy
         E+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=JVFv9QKTSgwqt050oMupztT8tboU7QEqc1Nba0hesYo=;
        fh=UlyDAgzpeue9I4NKIIAq0h89R2rEqpHlUaBm8UZlHaQ=;
        b=q37T1gDgjVkSahwHk6EWeg9D/Hc8RWzqDNJE6uIGYUAiupCdVU7zaDWPAyxEiN8YcV
         Pq59vhb4oQ9KIw//+qZiAtTvbWGSyPVDyOSd3lLP+0/A9IkdJvXCeqosBl6fEdq/c0K1
         ngaRDdorOE6RO2tt+/BTzQygdFom6CILVn1iPR1WX9lkXVhDq5uFVAZsPKcWNp3PXsHY
         gpMCj54oph65sDep2e1o5AWS+wBiFhn/+7X2LwS9zGnwzly6vDOirRiNKFUW8dKkK0WM
         LWix3AzZOJI8HVe/ToImbq2ZSP7bEUeVXpSNX7ZcmwQkA5VHXuIHWsht5PG0ur9Gowvg
         qKBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QC60scai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef5c382si107285106d6.577.2024.06.25.07.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 07:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QC60scai;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM6pB-0005GE-SW; Tue, 25 Jun 2024 10:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM6pA-0005FY-Tg
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 10:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sM6p8-00022u-Ng
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 10:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719324423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVFv9QKTSgwqt050oMupztT8tboU7QEqc1Nba0hesYo=;
 b=QC60scaiOMIPpkEQQdHW41l/amC8b/Z1m5re2kjoKoU6P/sVp+QFQ1Ed5mlruhsnEsf78y
 0I8iM63zv+QcHWHt0LBIgB0p4GkEAWmyKeXipVrAxbL892CRx0xoBC0CrxzEyB6quK/3Vp
 I4oqqgNfewnveVowqqPlw49cv81/GEY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-vL-7o2GRNESS8-Y0hA3eYA-1; Tue, 25 Jun 2024 10:07:02 -0400
X-MC-Unique: vL-7o2GRNESS8-Y0hA3eYA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52cdf9f63dcso2204743e87.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719324420; x=1719929220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVFv9QKTSgwqt050oMupztT8tboU7QEqc1Nba0hesYo=;
 b=JX8Vzra5xqfMECFP7AqfqiMBy/LGSJm62LdmGjcqnHkl05nJ/JkZ8Qwgrgzyee2HAW
 jlmlyp/YJzMoAjJPFPNaLggCMhXV8J3yp0xmTS/a8n3xm6I4GDzHSlxC4B9cGiMYlBnu
 JlxMqLRjF1H3H/wEmrbNPNR+4cq7XaDyeLKSU0dI0AqtOFdghOENWg6PR0kfK+DYCTZm
 vgJKqQAnUDl01Scns23sPgT1vaMOqnU+hyGLUl58SgbjHt0IoCKT0Nda0LsjCUysXYDD
 gzgbIg+3mS5NBx+/jx47EsjTVZM7FnJEGCanTu1PyjdtayrV4NtciJfZyFse/yewW/BH
 GVnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtVZEbHuecFbfwAjaIVCa0RWWhjmFqzJmmZaL8kjEBRssr01rI7eO+v8gAXV5lWbRvOWPSpzuGESYATbrIOO9ICOFQ
X-Gm-Message-State: AOJu0YzrIJEzKD2D2Z3wqIU7caM1xQwBSiUrI9eFPC15ENrN7131sxAe
 pLyHB+eYSsu7GHGewc8v67//GRCPzVeRBtToobrOx2b5/bFqZsRc5P5tLP+mUtNfmTdTclODs7V
 ZFSZvfBG6DjinERVt7kB+UtaDwszWedOZnTrkU7RI0pBg05OrFQ==
X-Received: by 2002:ac2:43ce:0:b0:52c:da39:e40d with SMTP id
 2adb3069b0e04-52cdf7f1581mr5006387e87.26.1719324419968; 
 Tue, 25 Jun 2024 07:06:59 -0700 (PDT)
X-Received: by 2002:ac2:43ce:0:b0:52c:da39:e40d with SMTP id
 2adb3069b0e04-52cdf7f1581mr5006364e87.26.1719324419536; 
 Tue, 25 Jun 2024 07:06:59 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424a49d6112sm20251975e9.6.2024.06.25.07.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:06:59 -0700 (PDT)
Date: Tue, 25 Jun 2024 16:06:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Alistair
 Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <20240625160658.6781a17d@imammedo.users.ipa.redhat.com>
In-Reply-To: <Znq4LZCLbpT5zXbA@sunil-laptop>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-15-sunilvl@ventanamicro.com>
 <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
 <20240625140558.168d1a9e@imammedo.users.ipa.redhat.com>
 <Znq4LZCLbpT5zXbA@sunil-laptop>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7EbtgNsK+tA3

On Tue, 25 Jun 2024 17:59:33 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> On Tue, Jun 25, 2024 at 02:05:58PM +0200, Igor Mammedov wrote:
> > On Tue, 25 Jun 2024 13:19:59 +0200
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >   
> > > On Fri, 21 Jun 2024 17:29:05 +0530
> > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >   
> > > > Add basic ACPI table test case for RISC-V.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>    
> > > 
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > I take ack back for now, since patch most likely to cause failures on weaker test host (CI infra)
> > 
> > test case never finishes and timeouts on my x86 host while consuming 100%,
> >   
> Hi Igor,
> 
> Many thanks for your kind review!. I think you are missing the patch [1]
> (which I mentioned in cover letter as well). This patch became a
> dependency since your suggestion to use -cdrom option needed this fix.
> 
> gitlab CI tests also passed for me with that patch included.
> 
> [1] - https://mail.gnu.org/archive/html/qemu-devel/2024-06/msg03683.html

ok, keep my RB but respin series with that patch included to make it complete.
(there is no harm if it gets merged 1st through another tree. but it makes 
life of reviewers/maintainers easier)

>  
> Thanks,
> Sunil
> 


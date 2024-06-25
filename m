Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp701936njc;
        Tue, 25 Jun 2024 08:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd1WBt6VFb2apAH26kvek/exi06Jq/DZKYosOyO4JvSUGFKZBiLsXF1KRB1GznyUUkmpTlPyHy913wrR1kdUWpBF8jlwpW
X-Google-Smtp-Source: AGHT+IHQ6Ie4g7gMI+t/hpg9Ao5lshy0jsWcj5sDGMdIpBP5QXxQGUxZvd2Zj+4SAYeQRaZ/a02U
X-Received: by 2002:a05:620a:44c3:b0:79b:bb97:4851 with SMTP id af79cd13be357-79be6d3d982mr955134285a.19.1719328726378;
        Tue, 25 Jun 2024 08:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328726; cv=none;
        d=google.com; s=arc-20160816;
        b=vj3orOuT6ypSToapWvl9UNWzPJFMJ5ZJileNXvBsqjAOENVMxoiiiEnzAE+Kf1jsC2
         nxerC3+9mI8o23WWzADJ4DEsR/gBRbZKbo3Q8jtIUXgWy5bamEA1lgO//CPjorY6Yuvv
         byshJBKwiJtpgqE2tpWcXd+da+430wepaE0wwjJiaxNf6o13sxcg7COLcvwvu+U880Ts
         Uo8Ck3SqSpaQMWnGkAHwF1X3tIY+oG/ZZE8oHmDBMOtFkQDlXfcl1Q41Fvjn16cZdYzT
         ssJXzrzmMrPNx5ECMCO0dng22Jx5/FDjc+ZZXsKWV4qfCXIT0LWuD8+zBrtdsWYBrOWB
         j+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=1eNQSJ1Cg3sKjP9f8CuJfSvHMNCcOvb284xbwUn5uzg=;
        fh=Xqpne+8fmbk803X61qx6Orz929Xsm1n2TUcqNsVlw4A=;
        b=Wa+wA9u13Y1eSvi2N9xUUSZw05Bca1LKrAtfogwYh9T0xEteyZ+n7jovMuWHzj9Orr
         oylLFBXzAaUptU1ieg/Dp+Dzo/h8kjgSSH1RKTFzbJI1oRYLKUGrVRZzx70CLz5b7IVZ
         vZ/eeqw1g5QB3+dg4+MiEJ1HZLJCl4qKaejj+8mkbzVpwqvKLM5brIWZ5YC9oQbxH/44
         D+LvRkQP/qmX5OIXlAvN6KJHnPWH6c21UhfXXeUqeuIjykt9dUopwZGQCNkLuoS6dJ9f
         UdR3pLIqlB4xRRUj6pIO3tpFojvVJZsDM9GMqUGev6CwRjnjM9s/KyfH5KHuPqi3WxIA
         7WiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Aws4o3IB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9153aasi1117847285a.253.2024.06.25.08.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Aws4o3IB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7w7-0000RR-20; Tue, 25 Jun 2024 11:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7w3-0000PH-Il
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:18:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7w1-0000O9-Kq
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:18:19 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7024d571d8eso4426096b3a.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328696; x=1719933496; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1eNQSJ1Cg3sKjP9f8CuJfSvHMNCcOvb284xbwUn5uzg=;
 b=Aws4o3IB/1D1dmcPBA1jlMbKSdY11MZCPqHrnucYCZUeF0Zel6PmqLB5Xuwirtwevt
 I+Bjqv6q8boKweXe363NrN33xFch1TFMAtim3dooUWYbNaTu4OrfldA61cdkeB8K0KR3
 FpppgB2Gf1mkB/QqPjqiaXrcBaUc3lGe4chQs4S2ZRImogJoEqtUoAxkqj/TX0FWDJEw
 PLx2S+v6GKfL08I34kzPqSyfmLTAwnqrcMr7gby64H79w/vzHIBb6ec1JJNEh4pVKbVF
 ICVGidog2+ZUL5KJhWEXC91Z94IBlOX+dZvh6vtVXpo0/1GOCxaipa/BBn3tpMO2G1g7
 fB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328696; x=1719933496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eNQSJ1Cg3sKjP9f8CuJfSvHMNCcOvb284xbwUn5uzg=;
 b=IoferYJE/hPkEkaAzMnr5il0oaFjxInQMxeTfbfZNoij1EOngutboyPfH5HJQcK41s
 6nr1DC5xKM0WtatY3UrA9BKwKOeT7bZSl/DhPiNBV6zbeBUtSgmaE9LEfEHx0f9zGrxL
 GDlN9ht94K2rjjS6eJFh7Y/gFQ/dDKkqRQCVKVhEVxGOzragr7hAwd99KWmO0fz7NpI7
 XZRNM2voj/UIB4YttmV+p9gw9ZWDNvKyrt/Ez63tI4/pxGIRqLxA0dBK7xz2wPIpTTDG
 U6i2uU+oN80n4Dks7ZiJ3HWbkDZvcNpceLnB3RT3H+c7AhRSpaCkS5ljUWBNaydpAP+S
 gRcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwoF76HyIzNzCWHCGKIcVT53OfssGp3Y72cP7Teh1R+6rrLdmpssXrWpAbXRr/Uha61Y9mxoBglR7mSNuiUnQxYDS
X-Gm-Message-State: AOJu0YwoZyJCJ0kKXQ4Mb+IXnvFnyGErZI2TTTxDHJIw2Jf+o37gtGzL
 NerPSBvDtst4W4jcIXlsf26Vu5biV/0ilE2wRw3U6paoArVsuLnZ1JG2oXz3EoE=
X-Received: by 2002:a05:6a20:4925:b0:1b2:be25:b5b0 with SMTP id
 adf61e73a8af0-1bcf7e7ee16mr8159745637.20.1719328696079; 
 Tue, 25 Jun 2024 08:18:16 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7068ca5a67esm3309744b3a.108.2024.06.25.08.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:18:15 -0700 (PDT)
Date: Tue, 25 Jun 2024 20:48:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 14/15] tests/qtest/bios-tables-test.c: Enable basic
 testing for RISC-V
Message-ID: <Znrfr7SsKPE56CDP@sunil-laptop>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-15-sunilvl@ventanamicro.com>
 <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
 <20240625140558.168d1a9e@imammedo.users.ipa.redhat.com>
 <Znq4LZCLbpT5zXbA@sunil-laptop>
 <20240625160658.6781a17d@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625160658.6781a17d@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: d/6a5DpK7myh

On Tue, Jun 25, 2024 at 04:06:58PM +0200, Igor Mammedov wrote:
> On Tue, 25 Jun 2024 17:59:33 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > On Tue, Jun 25, 2024 at 02:05:58PM +0200, Igor Mammedov wrote:
> > > On Tue, 25 Jun 2024 13:19:59 +0200
> > > Igor Mammedov <imammedo@redhat.com> wrote:
> > >   
> > > > On Fri, 21 Jun 2024 17:29:05 +0530
> > > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >   
> > > > > Add basic ACPI table test case for RISC-V.
> > > > > 
> > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>    
> > > > 
> > > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>  
> > > 
> > > I take ack back for now, since patch most likely to cause failures on weaker test host (CI infra)
> > > 
> > > test case never finishes and timeouts on my x86 host while consuming 100%,
> > >   
> > Hi Igor,
> > 
> > Many thanks for your kind review!. I think you are missing the patch [1]
> > (which I mentioned in cover letter as well). This patch became a
> > dependency since your suggestion to use -cdrom option needed this fix.
> > 
> > gitlab CI tests also passed for me with that patch included.
> > 
> > [1] - https://mail.gnu.org/archive/html/qemu-devel/2024-06/msg03683.html
> 
> ok, keep my RB but respin series with that patch included to make it complete.
> (there is no harm if it gets merged 1st through another tree. but it makes 
> life of reviewers/maintainers easier)
> 
Fair enough. Sorry about that. I have sent v4 as per your recommendation.
It looks like the series has got sufficient reviews. May be it would be
better if it goes via Alistair's tree since the dependent patch is
already merged in his next branch but I will leave it to the
maintainers.

Thanks!
Sunil

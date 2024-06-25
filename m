Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp658325njc;
        Tue, 25 Jun 2024 05:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX687IFpeAMZvxxlIM0vvDFyR6r/4M9Df6eUDniBgJhULcQ+jmKpHLZsqUHZshGjnGeHCNjYZ0WNEvvw6xGYWVKv++0qSqi
X-Google-Smtp-Source: AGHT+IEOGvcK62OXAPIs+Q7q1w1Y+PAkxVNt6S/ihbO2/wUYlJAxmXp6jcNpObcM39lxuRDtk7qI
X-Received: by 2002:a05:620a:178b:b0:79c:c54:ef6e with SMTP id af79cd13be357-79c0c54fbe5mr68310385a.76.1719318600750;
        Tue, 25 Jun 2024 05:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719318600; cv=none;
        d=google.com; s=arc-20160816;
        b=RkNC9t1rw0YhZKSMRbfMiPYgiLT2jUu+F7VS8d/OopuIVJ5s4NHqvUDv3yFMF1p4Rc
         dmfC43/BVt9/8gvPcMnvCK/qMUi/Y5BwmBdlxBRz6DXyaWw3qLZqlydwd4+1TC40CScc
         O0EbH9LZg1Tn/B5wgdjERv21gJzu11R7x6D/G6tU4Tih2CBpwaLl3e7VWnxxqgrumoj8
         y/F2xFLsCRV9e1018D/xmfzmsF6cROQlbUnB2pK2CEzfvocmi85FUkqD4iTQJfJksRia
         m9BccP8J/7qUm3OrP4LahLfYVQs7VIMJ6yJb9q9Y8VhA2+SBvbbxhJWND1M/lNc/7Z1W
         8PRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=kOOOZrv8Wn5GwQsvG+CnPXkGyMtJ3HGlzcbEvGRFSfY=;
        fh=0MNNRFMh3XWp6DyyFsEvok/vrT97gBmCOmvkA66m8xw=;
        b=YmJbygX23xyKEo3CGEdJL+9W4t4g3WHmpB5s2UHluKBpakkDDvecpD3+xvBIjND9aJ
         Z/F6kzg9ToFLdW+fc3MQuuF/77EN5+qlZNIat8OgZVpoohG57rl1fJBcH+QU27jP0GrN
         3nj1y3G35YJxIOKwWJ9rWp54YEIfqNMOM9kuVBBT9KryzhYXN7xLJsbun0scdgZZ7fJu
         t/XrPRY55JuoSI2Jfp3lLQUnT7B+gPeoC9ALy2JTL7bJUbRnY6laYoQ2f+TpvKIDxcz0
         dtWmVlZxu/cuMt6Nl+yr9riHuQYiuhaoX85S8zf3LlSg+dyn3+P4/g4agtxUragsKmsD
         tueg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=EF8YJoV5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92c2a0si1063752585a.518.2024.06.25.05.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=EF8YJoV5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5J1-0007Xl-Gd; Tue, 25 Jun 2024 08:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM5Iz-0007XB-Nx
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:29:49 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM5Ix-0000Lc-Jp
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:29:49 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5c21a177affso141498eaf.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719318586; x=1719923386; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kOOOZrv8Wn5GwQsvG+CnPXkGyMtJ3HGlzcbEvGRFSfY=;
 b=EF8YJoV5iRR5rIL0PFOefVvy0TXeBNMVWzTY27JNTmeCjHWMMdYmZA3pScSjckiB1Z
 F8hof3vnjYOfb+vDvv/LezGFuw8oOdyNqUG9GVUjGICe03021TIsdBm5azNk+MmZg0qb
 +HMJ2GMZBZLyosH3I+iurwozHQxSbQfY2bMGZR28qvCB8wKoq1idnyS8RtN5G3EJKJ/O
 5x5gR6KyOPAW9ztTQLvDnMoGCW00SKjOQxHCJ626MR6pFwNtfIelCHSiebuOPg4977Er
 RwJnCgVzm/EwqTrETRWWcHiFiSqVp0Pn8eHRe8xtSy02nTExxSEN8nNi5tEeIwpAcQV4
 LZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719318586; x=1719923386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOOOZrv8Wn5GwQsvG+CnPXkGyMtJ3HGlzcbEvGRFSfY=;
 b=aiVLyHmX1s65axKwvjzUIyp1Y1nm+PIbkioqpdLBXT0jcdd91LCe+b7UnH7/H8Ms1T
 D52uHhVFNSVv/8E7sUrmP8DYTcomrux8Gb1asZ8IXvyjj+5oaVcWdEkpyOqt9EE4mpfQ
 cL/U3uQZ+qU672sWqo4KqhC4xV3qtXGod1z4pg0JQjlw3MFDoqtcQBZ1MBK+vHnZf/jT
 RcO3f9B6p9y4eqkGd3kFv4WvGVMBsgVwLK6UJE0yCJcb0cCE7eWKAaV1VtlwUTuAX05v
 WBKc1+XIV+GzIz7wKSepRlZ+c1WzXYaWM7wAKGdhvtmrwqKjstJ71hENf0I7zi8Mx/Q0
 iwSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrWazx8jA6e/nrUjcAKy2sWK89nrYm99iR6unYWr5nfPIHGj2ElBRToiGqOyClF/XRqdn7LHEwH3AaMeEFlEgSdlY2
X-Gm-Message-State: AOJu0YzNZUhG1FjwszDBDmni7q2VWjCYjQU5Ms8Wtap5bco46igeIsuA
 H5nV9+TmglA5b2M2BUS6UZMnamtbQdOGfY9zRNcQ0ZuweoLPE29ypk0lmfPwGiI=
X-Received: by 2002:a4a:3515:0:b0:5bb:218e:3436 with SMTP id
 006d021491bc7-5c1eb9de604mr8329919eaf.1.1719318585804; 
 Tue, 25 Jun 2024 05:29:45 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5c1d58ff7e1sm1755337eaf.39.2024.06.25.05.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 05:29:45 -0700 (PDT)
Date: Tue, 25 Jun 2024 17:59:33 +0530
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
Message-ID: <Znq4LZCLbpT5zXbA@sunil-laptop>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-15-sunilvl@ventanamicro.com>
 <20240625131959.67c2fc74@imammedo.users.ipa.redhat.com>
 <20240625140558.168d1a9e@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625140558.168d1a9e@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ENud71TKsisg

On Tue, Jun 25, 2024 at 02:05:58PM +0200, Igor Mammedov wrote:
> On Tue, 25 Jun 2024 13:19:59 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > On Fri, 21 Jun 2024 17:29:05 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > 
> > > Add basic ACPI table test case for RISC-V.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>  
> > 
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> I take ack back for now, since patch most likely to cause failures on weaker test host (CI infra)
> 
> test case never finishes and timeouts on my x86 host while consuming 100%,
> 
Hi Igor,

Many thanks for your kind review!. I think you are missing the patch [1]
(which I mentioned in cover letter as well). This patch became a
dependency since your suggestion to use -cdrom option needed this fix.

gitlab CI tests also passed for me with that patch included.

[1] - https://mail.gnu.org/archive/html/qemu-devel/2024-06/msg03683.html
 
Thanks,
Sunil

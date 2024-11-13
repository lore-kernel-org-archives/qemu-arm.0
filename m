Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp167584njc;
        Tue, 12 Nov 2024 22:54:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7VDiCj+7e4eynRetRBN65ph2tVzRPRGfYJCoJoNHSnqbtQTtUBFv+aW4ktCSfSUPdRS2rQRjFTO5tow==@linaro.org
X-Google-Smtp-Source: AGHT+IFjnL8Apu+uZNR0b0ocvCFKMb7UzihctROTRg2RtcUDcGXjMi8QSN0fZ3bftCAhC7e+lDmR
X-Received: by 2002:a05:6214:53c4:b0:6ce:23b1:ffd1 with SMTP id 6a1803df08f44-6d3d01ffbd0mr77338606d6.27.1731480889487;
        Tue, 12 Nov 2024 22:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731480889; cv=none;
        d=google.com; s=arc-20240605;
        b=jzzd19sR+VsS+GNzjgp0WbjOlz1rSSQMYMMI5TBHiP86nDZTu6cu+EaIgW4GVVMiAb
         zj9SfIllT1YMNFjNdUBE6iftDhnPIVeLBciqLjguOCqwlZCLxRswfQxgwXT7beMvdozH
         FOYp9vni5v33KXJ3ZmbfVRuNHOOEByNgaqGcveci/H642maFfZm6VykW95UTJgGZdTG/
         U1+JMJPJZb3UV+xRL8AE0uJX+qbmNtO//YGR0eWhiCd8Xi9xtNdfdbZ/4fvgN1LdpKV2
         L/VKb0aT9lC8J5VCxAjxaA6gOAmJNFAaRgSuzOMGDPMU5bgs50KSm+7tqUEWy/ENdcSY
         601Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Mt2auE6xrTqqK9WU5lViBp9fSyHpzr/wlEuStKjT8V8=;
        fh=6D/6VQq5Q+Zja9Q7yYPz2cBlGUpAFsxG9UYP7RraElc=;
        b=FL4i3ookI6t6ydlZ/hDjVvgqcwcJ0qo+2aE+lHHeHvUNgOnKSSYsrhCV02BJ/RBJKZ
         6NzKzlTezLRuLiZpRkWlTFzKJBz/tDU7zyoESlmp4S5ODiXDDzsIJoc77n0gqbddJRMN
         zkBs66X/ShYGACVAXPtojwSmo9X/jtBHcfWhvU9QOmdB9VnY0zPoZRY0Q+/8rOT0Ulcl
         3IsRM5rJhee6HQiWBm+mCBTLS9eQXJOMs1UbVYauxk+olUWvXBNs2NWBZOkwh5nO/HUF
         NImqvVNL10v2RQAABemVemn70OIFCbOR/JTG2Ykgdr+3fp/dOKxV64Edm8Jtt07Awr3m
         2JWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PGekILe1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966c0c30si173625536d6.540.2024.11.12.22.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 22:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PGekILe1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tB7Gp-0004AS-Jz; Wed, 13 Nov 2024 01:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB7Gn-00049W-FB; Wed, 13 Nov 2024 01:54:29 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB7Gl-000365-44; Wed, 13 Nov 2024 01:54:29 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9827E5C55F1;
 Wed, 13 Nov 2024 06:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB89C4CED5;
 Wed, 13 Nov 2024 06:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731480864;
 bh=S1HCWxA29Ys4xb5cufUmW11nUI0TOo6r+xDIQrpNQPw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PGekILe12yrH/fZ1iWXhgcWzA2WADkJpwIIgno3ybg7TciAqly6AWKMzfVo2lSdbx
 JNYdssXuUQvkGse6pkOFpI7gKfIC2cxGZUUYuzrC1erpHx5PrrURuaC5CfQdjj7/Xi
 z0/zu6UunI1BAY1nfC6C3ryIYYJP9zwSeHLhWUKWrrbyZswYjBeZZiPcu4vz7FA5o2
 l+RyvRDyNx+DB6RQE0i5QjqXgUGhET+UyH840cajuCpEyQajEbrqUugyMrAVQHtKOU
 SsRMikoCtl+jfx1o+oipdpLqi5S1CqQtfedAWARwNqDWmUNuQbf0y5ZTTNyQaylGy2
 oQFqcYX/ED8+w==
Date: Wed, 13 Nov 2024 07:54:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao
 Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 0/5] Change ghes driver to use HEST-based offsets
Message-ID: <20241113075418.5fa1ac61@foz.lan>
In-Reply-To: <20241002154534.3c58db06@imammedo.users.ipa.redhat.com>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
 <20241002154534.3c58db06@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tPzlmEzlAR4Q

Em Wed, 2 Oct 2024 15:45:34 +0200
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Tue,  1 Oct 2024 13:42:45 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > This RFC series was part of the previous PR to add generic error injection
> > support on GHES.
> > 
> > It contains only the changes of the math used to calculate offsets at
> > HEST table and hardware_error firmware file.
> > 
> > The first patch adds a new firmware file to store HEST address.
> > The second patch makes use of it.
> > The remaining ones add migration support.
> > 
> > PS.: I'm sending this as a RFC as using the proceudure defined at the
> > pseudo-migration of:
> > 
> > 	https://www.linux-kvm.org/page/Migration
> > 
> > Didn't work. I tried to use two different QEMU versions to check a
> > real life case and also to use just one QEMU and trying to load a
> > virt-9.1 state on a virt-9.2 machine. 
> > 
> > For instance, trying to restore a virt-9.1 state on virt-9.2 gave me
> > this error:
> > 
> > 	(qemu) qemu: Machine type received is 'virt-9.1' and local is 'virt-9.2'
> > 	qemu: load of migration failed: Invalid argument  
> 
> that's expected (idea is to keep machine type (virt-X) ABI stable so
> it would work the same way on old and new QEMU)
> migration is meant to move VM of the same machine type to a new/another QEMU instance.

I found a couple of issues and, after the fixes, it can successfully
migrate both virt-9.1 and virt-9.2 machines. 

> 
> i.e try migrate 
> 
> qemu-9.1 -M virt-9.1  => qemu-9.2 -M virt-9.1
> and vice-versa
> migration should succeed and memory error injection should still work
> the old way in both instances (I don't recall anymore how to simulate SEA,
> perhaps original author left a description how to do that somewhere on mail-list).

Those work as well, but I had to pass -cpu cortex-a57 to both 9.1
and 9.2, as using -cpu max caused qemu to refuse loading the guest.

I tested with both:

	qemu-9.1 -M virt-9.1 -cpu cortex-a57 => qemu-9.2 -M virt-9.1 -cpu cortex-a57
	qemu-9.2 -M virt-9.1 -cpu cortex-a57 => qemu-9.1 -M virt-9.1 -cpu cortex-a57

I'll address your other comments to the series and post a new version
today.

Thanks,
Mauro

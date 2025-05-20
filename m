Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp306299njc;
        Mon, 19 May 2025 23:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoagJU9pbsd+rFNC6byHB+g7o/EcKoLLEKwKVvFndBPj5a/H3apw2nUX1oTMCJp2V+hCbA2680xWf/wA==@linaro.org
X-Google-Smtp-Source: AGHT+IGAxjq6/hyudRxL8s6tYsYKHQXtnJsxQ9xwfgz3jfKShkUA+MhsVUyz6jTA5GhCMhGgySsn
X-Received: by 2002:a05:622a:1e0b:b0:494:aa40:b0c3 with SMTP id d75a77b69052e-494ae3371bcmr196903451cf.10.1747723709033;
        Mon, 19 May 2025 23:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747723709; cv=none;
        d=google.com; s=arc-20240605;
        b=Oq2W4bG45IXtHkg7TDPkgSCFR75fXGvXCd6GvD6fqTEWKMIKSsKWU1TFIPlZNEvVlm
         ZPMz+xjsM9DSVEVqBcOcGLbR4TrNdvUXf/USgv8B686zQjcCEZm5rn8/QOChYZ0VxREd
         0cq2LNHwcZOxskcOV4RqBaihaTnRIdkhpNXybNQcyWkBGa18LZT0vFYSgf3Izkh50dbI
         FCrsR19jMu7coVtAixoWk5UTnw5wsK4kLjaH8BZEShKAQED3j9GdenthdjDnBkt4TSQC
         Cs4ENsdSd1wL/CFNxiy+Y/E/pckUvSnXn05yqd7khvAIalny7mkMeVG3TKpvKBlNhrTk
         4Juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=05kd3UK6F1n6z1fof2JVVPqp4+tS/V7IgpNosN6GhBQ=;
        fh=SZgKN5SFOJAlIvgiXYEdI1Uqom3Y29pmt1a84AqH1Ec=;
        b=Ql8/KBYNOaoNmrZbvloiqUeNcDkBSDLYZ243yL6rriECPLamEAQNjTKLIMzLnSp4LP
         KQCzUeQhBoNTQlLoiFpIonbVYdDU9ixUFDZUnCFkEYM8p1WcYRCFdZ3hYhdiUqnyVRw2
         OhEfPYKldv/tAZ7JMIHioB0Kr4XM++s+6lbTu2+GFkE9Zcvfv5VucCwI1DROzCfZoDI6
         N+bspIxB4fKYW3sEUgFoPdZ0CFYv8tA9raE3f2iDY/HT8gl+eQRNR0sxbK3PmDp+g5ND
         59Qu9jBl3abehylfdumi4mLPzqVkZaoiFaLiUyUma1U0ETCHJmWkPINaqoX2Hp+dfhji
         uMNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Y90pPUPL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae59081csi100093411cf.508.2025.05.19.23.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 23:48:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Y90pPUPL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHGlw-0002Pf-Ak; Tue, 20 May 2025 02:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGlt-0002Me-9K; Tue, 20 May 2025 02:48:17 -0400
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGlr-00070i-25; Tue, 20 May 2025 02:48:16 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87BF6A4DC69;
 Tue, 20 May 2025 06:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75961C4CEEB;
 Tue, 20 May 2025 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747723693;
 bh=0+iJkTRrs7XDpaJleK3LNCPN518ONweiiRIUBZT4Fkw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y90pPUPLqBE90/nX/wrvHjO0GfpL6Z1+QhBNtIlX8ADk216FDvOcJpZvzQzUVRJJi
 0X9T2yhVWWYhrMni2pvwW/Fg1ONIdBdCgYHVJi5zpRSrwpgDivT9e+3K+yF8vWtrH4
 22MfW5FQ66Q29TZe7Ypr3LVrd6M0oYtH8q4DtwdYcfODfZ/qFpvBKUbBSi2M4VzPTz
 mi1pzjnwf6uPM0vgbIiYFGkKvFHZuEIlof6m28+k9pN8naTRFyFcHg4VZb45PexQt/
 2Mmu/UYgFSM5yecC5v2PQi32eUTvsWQxNf4KLrMWd3qJijbMUkpS8TrVA9jxCI8IfA
 0GWQzF8q7evPg==
Date: Tue, 20 May 2025 08:48:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Gavin Shan
 <gshan@redhat.com>, Ani Sinha <anisinha@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo Habkost
 <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, John Snow
 <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Markus
 Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/20] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250520084805.5b34d888@foz.lan>
In-Reply-To: <20250511094546-mutt-send-email-mst@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
 <20250511094343-mutt-send-email-mst@kernel.org>
 <20250511094546-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.13,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: fnIotfpr44Rx

Em Sun, 11 May 2025 09:45:55 -0400
"Michael S. Tsirkin" <mst@redhat.com> escreveu:

> On Sun, May 11, 2025 at 09:45:04AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 07, 2025 at 08:14:29PM +0100, Mauro Carvalho Chehab wrote:  
> > > Hi Michael,
> > > 
> > > I'm sending v8 to avoid a merge conflict with v7 due to this
> > > changeset:
> > > 
> > >    611f3bdb20f7 ("hw/acpi/ghes: Make  static")  
> > 
> > 
> > 
> > Applied 1-13.
> > Patch 14 needs to apply compat to 10.0 machine type as well.  
> 
> Sorry i meant 1-11.

Changed on the newest version I just submitted:

	https://lore.kernel.org/qemu-devel/cover.1747722973.git.mchehab+huawei@kernel.org/

Thanks,
Mauro

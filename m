Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp76874eja;
        Wed, 21 Feb 2024 23:16:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7tl+ibyqI3z5HoMZZyqKJcSW93OFZyA/G1IR1Zce9AoKO+SC2HdQ7S5pEh/s+Sn4zoojMO4egRtR8j/PJ41VT9KpvRNP0
X-Google-Smtp-Source: AGHT+IFMkGgqsv4+ImVcWfSRcp1bJeJ1+x4dlF40RrhpGhmGG3Qcn0/DHjO8dGDDTNfiwTboinxb
X-Received: by 2002:a25:4656:0:b0:dc6:7247:5d94 with SMTP id t83-20020a254656000000b00dc672475d94mr1514674yba.55.1708586185145;
        Wed, 21 Feb 2024 23:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708586185; cv=none;
        d=google.com; s=arc-20160816;
        b=F9Nu25FjEmhwA+i1b6ctQHy8TdOHkTJXS6VxlvcrnCP/XiMHQD30x2rCnhvZUim+5I
         8Fhj/5F3tZbOPPE2P5iCJ2ZvDid/o9+jkmbDviy6eYfBtlWTCrmOAAEXLU4xrq1ZoZxF
         bMq7XOvs2+wgoz7T+O+lU14oMFAUh4jBZxuvAeR05aZhrTvj20XuhveQeoh+AIE3Jdrl
         n5bya971Jv3dR3xztHSvLwK2PscpUJd6WRbpGF8RmYsHa3Rh5sNUCw7pL7Yj5wjVelgj
         D4+/5sgJQCNhufRe6Xq2H8dUQtggsZVzYSa3f2y8l9yc8+xtFg9rh+XwUnHS/h2u7r85
         SxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9Yk1wORAI18pmYT8OrXz3/4BXS5kCPsy7O669uUja2s=;
        fh=wBKa9GWBPiuuE8imrcVE4Y4HkIvickYcSxYPtbhCCRA=;
        b=yXg5u2rn9mEWJudh9859z6SMYA2STSxoB4owlAX8wDtLwlPpRbktDRdqbJZS+mVkfd
         QdgPAJrsLMQdOFrVeRc9J841hL0faUH/w9EK6Ur2DyvK45iCzJok4U2HSXB8qkgnG80L
         07oGDLjJbEyznHVkf5FFQuxBjeVcJB5DClkY6BmOhyfOSOC/fuMpTvbl8JMmGfyNMMpC
         NvRbIdcSCeGtZO0kcPi3HmRWD88VTqf6yRpwE7QO95K+7asoyaElFN6Nl+iqLMXxZXOU
         fbnD9cgqeLXRbzk/zeeJcW2gyua8GH+xV0N6EEUc5jCrFVbGiq11Ct8AsWBqhIZlQDgn
         vPHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="kB5/fX1B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05620a121700b0078780c83032si3859848qkj.363.2024.02.21.23.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 23:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="kB5/fX1B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd3J4-0006lP-7T; Thu, 22 Feb 2024 02:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rd3J2-0006kY-O5; Thu, 22 Feb 2024 02:15:44 -0500
Received: from mgamail.intel.com ([192.198.163.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rd3J0-0006ZD-5E; Thu, 22 Feb 2024 02:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708586142; x=1740122142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iAtPZcPDPQdHRcdaRyXRYOc5/6MG+WumigWKJ0gbMLU=;
 b=kB5/fX1BjV52laECzMa292faoXhqjqJoKoU450sYZuSeH8gGVVJtZ/pd
 byUQSYQwD6k4guBJE8Hz4cVfYIl0scy01D3TqqSJJMRhgs02TuEnMWiKV
 2hxgrj4zcE1OfnfwjCrdWqnKLV7RKVoGy9W5+DAjLqv/dacH8bNcQjDVY
 6t0gaVcIGynFPquKRFpWf+69sH6LDSytAxrj90JezWPS9RzksiNhqjnj+
 GCR0OQSD5TNPMjyn+B4JWy7f44xfplKf/XXHp4NAjjQJvRIqRvu9l6bMP
 5HmZZGj597nCR0byQj5pdkuGPQo/ARnYREb8XHpMrSj9hVSTW9PmnOUyI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="5742774"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5742774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10077039"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa004.jf.intel.com with ESMTP; 21 Feb 2024 23:15:35 -0800
Date: Thu, 22 Feb 2024 15:29:15 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 0/6] [PATCH 0/6] Fix missing ERRP_GUARD() when
 dereference @errp
Message-ID: <Zdb3yxXbiHt9h46u@intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <34f501b4-94d3-4cb1-96b8-1d2a77013817@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34f501b4-94d3-4cb1-96b8-1d2a77013817@tls.msk.ru>
Received-SPF: none client-ip=192.198.163.13;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ApHneLYA0Ygv

On Thu, Feb 22, 2024 at 09:04:14AM +0300, Michael Tokarev wrote:
> Date: Thu, 22 Feb 2024 09:04:14 +0300
> From: Michael Tokarev <mjt@tls.msk.ru>
> Subject: Re: [PATCH 0/6] [PATCH 0/6] Fix missing ERRP_GUARD() when
>  dereference @errp
> 
> 21.02.2024 12:43, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Hi all,
> > 
> > Thanks to Markus's explanation about ERRP_GUARD() on my previsou
> > patch [1],
> > 
> > I realize that perhaps more @errp dereference cases need to be
> > double-checked to ensure that ERRP_GUARD() is being used correctly.
> > 
> > Therefore, there're the patches to add more missing ERRP_GUARD().
> > 
> > [1]: https://lore.kernel.org/qemu-devel/875xz0ojg7.fsf@pond.sub.org/
> 
> Hi!
> 
> Since you're going to respin (it looks like), please include the initial
> patch (hw/intc one) into the series as well, so it's all in one go.
> 
> I'm not sure this should come via trivial-patches tree though.  Looks
> trivial enough :)
> 

Hi Michael,

Sure, I'll add that one into this series.
I understand that such small fixes across multiple parts are suited for
trivial-tree.

Thanks,
Zhao


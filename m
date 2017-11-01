Received: by 10.223.161.27 with SMTP id o27csp1099247wro;
        Wed, 1 Nov 2017 10:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+STwsTZzU1zOPNZjvtT8FZoeqNcsk2Gz1/b5FKR+nY+4WUWlco5tDTjtloFpQJA/W6gNj9f
X-Received: by 10.129.88.136 with SMTP id m130mr432170ywb.410.1509557678516;
        Wed, 01 Nov 2017 10:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509557678; cv=none;
        d=google.com; s=arc-20160816;
        b=vvb32ayRWJF0DuNL32tpuHwBHBfM28X+q6dFENEYSyTOXO5xbcvEYtq/1x0ArGZ0ej
         tQitnhrh0rcoSgYCDyQDn99LEAs1873SrfY+fF+S2OSdAAkuD2b7xT6G9E2S6EwM2nVy
         PxkL/cU7r+mHH3ORoN4ipKWvk17yEK+MQpNiR7HS+o2X6ps+xXg/0Rh0IPyA2O1ZhRmQ
         fdf6zZ7JP9Lf84G3bt6ZUSifnadgYCrgjz0BobKixi2w5DS4GO73+WZkQlAvFjma3/lT
         1MTforpGF6+fDme0otp7pRc09AmbxD4icEam9GRf8wL4wYuAKJmv/mRaMCPw/FNVJBVw
         AtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=YHhTpDyCWjRIOo2VGfxSMjcaIfDaXajseJGRuW60G8c=;
        b=vWapI2N0qdWJDgvxj/wIAmGgFmLWtB5S0FRTlJ1IF/iLMCY82aoBlY88KnTfu4z+zz
         Lh4zbllBqCbhC/68w8CNUfLalnvWQWwtZ8MjbBeuRt7qjkpi1MWmLVCRKBuyw1ZK7dc4
         PvLqZj81pgNwUCJS9wtGmRX56QlbiCmi1VTWoCuNYAfr9++K34yuujJkCvVWL/5HDfey
         da56WIlwrIK32AlR28RW+Gt7n1rzwBb7SetjrXdDJZ/bo/63Aaxavf9VXrznZMWp385q
         +4PdiJn1J5N0sWGPzFl4KAOc5SBixEgQsbVSAsRIa2bOvOIVjNMzPOWEyZ7Z7IAAW3Fj
         oOgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si236146ybe.357.2017.11.01.10.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Nov 2017 10:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9wuT-00044G-Ur
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 13:34:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9wuN-00044A-0K
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 13:34:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e9wuJ-0004na-TY
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 13:34:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e9wuJ-0004nD-Li; Wed, 01 Nov 2017 13:34:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37918C050904;
	Wed,  1 Nov 2017 17:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 37918C050904
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.121] (ovpn-116-121.ams2.redhat.com [10.36.116.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3655D757;
	Wed,  1 Nov 2017 17:34:24 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20171025093535.10175-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4ab3bd81-925c-a281-614c-2cd87fce38b5@redhat.com>
Date: Wed, 1 Nov 2017 18:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171025093535.10175-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 01 Nov 2017 17:34:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/51] tcg queued patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, "Emilio G. Cota" <cota@braap.org>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lB/HGQjla5Ru

On 25.10.2017 11:34, Richard Henderson wrote:
> Primarily Emilio's work toward removing tb_lock, with fixes.
> But there are some other tcg-related patches that are queued.
> 
> r~
> 
> The following changes since commit 3d7196d43bfe12efe98568cb60057e273652b99b:
> 
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20171023-pull-request' into staging (2017-10-24 16:05:57 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/rth7680/qemu.git tags/pull-tcg-20171025
> 
> for you to fetch changes up to cc689485ee3e9dca05765326ee8fd619a6ec48f0:
> 
>   translate-all: exit from tb_phys_invalidate if qht_remove fails (2017-10-24 13:53:42 -0700)
> 
> ----------------------------------------------------------------
> TCG patch queue
> 
> ----------------------------------------------------------------
> Emilio G. Cota (25):
>       tcg: define CF_PARALLEL and use it for TB hashing along with CF_COUNT_MASK
>       tcg: convert tb->cflags reads to tb_cflags(tb)
>       target/arm: check CF_PARALLEL instead of parallel_cpus
>       target/hppa: check CF_PARALLEL instead of parallel_cpus
>       target/i386: check CF_PARALLEL instead of parallel_cpus
>       target/m68k: check CF_PARALLEL instead of parallel_cpus
>       target/s390x: check CF_PARALLEL instead of parallel_cpus
>       target/sh4: check CF_PARALLEL instead of parallel_cpus
>       target/sparc: check CF_PARALLEL instead of parallel_cpus
>       tcg: check CF_PARALLEL instead of parallel_cpus
>       cpu-exec: lookup/generate TB outside exclusive region during step_atomic
>       translate-all: use a binary search tree to track TBs in TBContext
>       exec-all: rename tb_free to tb_remove
>       translate-all: report correct avg host TB size
>       tcg: take tb_ctx out of TCGContext
>       tcg: define tcg_init_ctx and make tcg_ctx a pointer
>       gen-icount: fold exitreq_label into TCGContext
>       tcg: introduce **tcg_ctxs to keep track of all TCGContext's
>       tcg: distribute profiling counters across TCGContext's
>       tcg: allocate optimizer temps with tcg_malloc
>       osdep: introduce qemu_mprotect_rwx/none
>       translate-all: use qemu_protect_rwx/none helpers
>       tcg: introduce regions to split code_gen_buffer
>       tcg: enable multiple TCG contexts in softmmu

Seems like something in this patch series broke a couple of ARM boards
(smdkc210, nuri, raspi2, xlnx-ep108 and xlnx-zcu102). With current
master branch, I just get this error:

$ aarch64-softmmu/qemu-system-aarch64  -machine raspi2
**
ERROR:/home/thuth/devel/qemu/tcg/tcg.c:537:tcg_register_thread:
assertion failed: (n < max_cpus)
Aborted (core dumped)

Could you please have a look at this?

 Thanks,
  Thomas

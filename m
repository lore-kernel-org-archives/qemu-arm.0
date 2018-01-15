Received: by 10.28.173.206 with SMTP id w197csp3019102wme;
        Mon, 15 Jan 2018 10:14:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBovFee4+iPDiOu1UNCtHeI55U/z5l4Gehs7rOpNds/xSrilE1IU66kposz9CXEgW5qmQkXfo
X-Received: by 10.37.134.208 with SMTP id y16mr14570549ybm.150.1516040057646;
        Mon, 15 Jan 2018 10:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516040057; cv=none;
        d=google.com; s=arc-20160816;
        b=H21PvNKgr2Dt48OIhoWNXCYzQY95aAf2ipZ9BA5kvZfNlLYSMElx1TuN6cxFAolJqV
         OAK/JDFZoyfOq0XcZVVj0VJv+RCRVQD865/8M6zdB52T8OQpCk3pG2CJYVJFBR0nZ1EX
         2gas+nMYtnBKavvGnCmwMK6tM6VtFyBMfwAskHZJ4dWfOfNtbcaQoJ85B8c+3TR16kRN
         VW6Aasxj0qik+oSvJCsTYAxEwboPPpZFopZFCwRSCruWOdmbke6VdWlNycxHxNt7V0gN
         OyNiqs9yrLgoGACukBMjl5l0tpRrh5G0vmG6SE3NTKM5UB4ZTY1MspMX1XvCX6JbrDYN
         pUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=z3GbYywN15vl5Gk3w6MMw8MrsOEhnuZiDq53j6N3/68=;
        b=oVbc6LhV0CEL6JEFcgHuoXC+7jxqY/QYb8vyJsgmm5sjCCMUxrnRENUWHxAdLIyL8Q
         TFuiDaMg0aw9hLlpXevdPZRp1Xga6B0zj9ZTxtybwnf++h9cXctNjW0XDOOgE6xBPhzp
         VE+Db1g5rOVv/t6Soz5ycgM8vqrKV3JLk2WJuE14w6aUqndj62/T3Zp6XIGpgvIjYq2Y
         Zk595+ZESCGqducb1whqZJ8n3UItdnGYoa58Qulp59+5I91T8AF4qMRC0ZQ3syu0qLlS
         X8d+X3Knelz4+TGHSWP/dWzKNjlQ4+CnnbHOAYwbZJkaSbMsLSFXXrkRTlHMjsWRQ3Ls
         YEng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TNmIzwBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k123si48029yba.187.2018.01.15.10.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:14:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TNmIzwBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb9Gz-0001sN-3q
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:14:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eb9AH-0004hj-Oj
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:07:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eb9AE-00014z-KE
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:07:21 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:35685)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eb9AE-000143-Ed
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:07:18 -0500
Received: by mail-pl0-x241.google.com with SMTP id b96so4237493pli.2
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 10:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z3GbYywN15vl5Gk3w6MMw8MrsOEhnuZiDq53j6N3/68=;
	b=TNmIzwBj/mRN4VgDR9qtozoJLCwbyFCtRrdP7E3Q6o+owO7NGOrFsOdGmckOqsyr76
	8y3vQ3lk7M9h0aOm0nD658Fk0oCckZpSzv0907aQA0QJYL+1HxAFpZTs3GT6UlDFyAWk
	3DooD4JHu5iaSWcpTP4/eWeVFRwAbFqIS0lRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z3GbYywN15vl5Gk3w6MMw8MrsOEhnuZiDq53j6N3/68=;
	b=P21oErlhjCRkXXgK5xkes2ZeUuF2iMxaFTIifrr1xyV0dBlzz20ktxLjcjn0WjZmQ5
	OaaKDEyzmzeVlqlEkvgVE7wr8jQuW4GNI31BQMGRIawjhjdIJU3RBo86lNIFtcelujx2
	SDAfEweiwmHbh3NnP2yB6shbP5ptD/NcYYN/ap71pr415ZXN40TilXyVAMU0Cs2gZAc+
	eG8ueTtrP+Jt4swlR4QCTKRX/c+tl1hcAdPd8wLXSJoNW7tpxZnR+RX6Ilk60O5So2Cv
	HMTEF1h0/AxBiTSvSXz/ReQzmVlSHI3V623lv0UUCQB6QD52+2Uz9SubbCfTQMQA3cZb
	MFBg==
X-Gm-Message-State: AKGB3mL2HNEsIihgmIU8xo4XF4tLjBXirkNYqwGOYqEdZayZehgZPHLd
	vgAY8eLJdoFfYB2fRL7Ko0pz+Q==
X-Received: by 10.84.217.14 with SMTP id o14mr24246231pli.78.1516039637594;
	Mon, 15 Jan 2018 10:07:17 -0800 (PST)
Received: from cloudburst.twiddle.net (24-181-135-57.dhcp.knwc.wa.charter.com.
	[24.181.135.57])
	by smtp.gmail.com with ESMTPSA id b81sm303557pfm.25.2018.01.15.10.07.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 10:07:16 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20180113004338.16867-1-laurent@vivier.eu>
	<20180113004338.16867-2-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a3f4e0b-dd3c-272a-b836-8f25647ceda5@linaro.org>
Date: Mon, 15 Jan 2018 10:07:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180113004338.16867-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/7] accel/tcg: add size
 paremeter in tlb_fill()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Chris Wulff <crwulff@gmail.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OATPryYZLzIE

On 01/12/2018 04:43 PM, Laurent Vivier wrote:
> The MC68040 MMU provides the size of the access that
> triggers the page fault.
> 
> This size is set in the Special Status Word which
> is written in the stack frame of the access fault
> exception.
> 
> So we need the size in m68k_cpu_unassigned_access() and
> m68k_cpu_handle_mmu_fault().
> 
> To be able to do that, this patch modifies the prototype of
> handle_mmu_fault handler, tlb_fill() and probe_write().
> do_unassigned_access() already includes a size parameter.
> 
> This patch also updates handle_mmu_fault handlers and
> tlb_fill() of all targets (only parameter, no code change).
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> v2: use "0" for the access size when we don't know
>     the size of the access
>     

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4283166wru;
        Tue, 7 Aug 2018 07:41:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeuKpIoS4Sv2m5XP8RnycMR2hbZQ67r5Q2egQUzGuaiVW+dFw8muKDUK7alQZlA9McWBxhi
X-Received: by 2002:a37:5ac2:: with SMTP id o185-v6mr17497086qkb.115.1533652916867;
        Tue, 07 Aug 2018 07:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533652916; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQJVEyKVZ/7T9Ex0m/BK/hGCrlBDexzRovBfaBMIGBwshfLpFnfRQ/FyD3PwZlJ/R/
         IBw7XKT45DGAwSJVUI9rm13Ap0fzuP80cMOCTpXz7ErAiBzVaEC/HNEp7UUgzGm9KtRL
         cAUoz0vRzkkU+FxR63sN1yw+MsPNxrh06wPfuTcEfXaJ8lx+gyhqaoSLEsWDX1TCe/cw
         X8/BAYfg0btsZAGpxIEsGFIv3k82KfZ3TtIxPB7TO8guPUKlHz7/n7W8b4DClrCQea2d
         kl/frjtdN3DutoT0W9GnyTHjiwMu+3h62zkuuOTWP2ZcVX48EC6trXVaA1HRpls0rJkl
         RG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:arc-authentication-results;
        bh=8YETFhb6En/mOVfYIJ6JJKqgLpz+9gjyEh4jFcZlD24=;
        b=Xst4/l/t0xek7GjSBQnk85Mm4Hpx61RIVgsUGzH/T+LPRclllHrjZgHTAjrn/DIIdD
         Moy+Ai/CxUeqHhLxBaqMN5Sz5cVJWOKXEA6F4OWf0lMOCztui0kGNWAmgPvDN1dilKAN
         FjafG7iVHCJihIGn934mUf57KhK5nxHFlpQ5l4ykuemCWpXDGlcJkC/x7aSxDPWYvUFH
         sBUDm8tNLtF2UmSSTSVqYlAv/RQt3geKFX/Z5E8gtb9KlileTj6otORzsiRZJMBj6m2r
         Jx91jmoOlySQ8aT6nxoXwK8OB2CfJhZZD+bObNPii5rXZHYkNvoakS8TlWL8vPy+oE/N
         zm/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11-v6si1211455qvn.144.2018.08.07.07.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3BM-00010K-E5
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn3BB-0000xA-WB
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn3BA-0007WC-6s
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:41:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35826 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1fn3BA-0007W1-1K; Tue, 07 Aug 2018 10:41:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D7C77CBBA;
	Tue,  7 Aug 2018 14:41:43 +0000 (UTC)
Received: from localhost (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5311C671;
	Tue,  7 Aug 2018 14:41:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20180806123445.1459-5-peter.maydell@linaro.org> (Peter Maydell's
	message of "Mon, 6 Aug 2018 13:34:44 +0100")
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-5-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 07 Aug 2018 16:41:39 +0200
Message-ID: <871sba2q8s.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 07 Aug 2018 14:41:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 07 Aug 2018 14:41:43 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 4/5] hw/intc/arm_gicv3_common:
 Move post_load hooks to top-level VMSD
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
Reply-To: quintela@redhat.com
Cc: patches@linaro.org, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYIWP3UhTBV1

Peter Maydell <peter.maydell@linaro.org> wrote:
> Contrary to the the impression given in docs/devel/migration.rst,
> the migration code does not run the pre_load hook for a
> subsection unless the subsection appears on the wire, and so
> this is not a place where you can set the default value for
> state for the "subsection not present" case. Instead this needs
> to be done in a pre_load hook for whatever is the parent VMSD
> of the subsection.
>
> We got this wrong in two of the subsection definitions in
> the GICv3 migration structs; fix this.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


Received: by 10.25.21.96 with SMTP id l93csp155636lfi;
        Fri, 17 Jun 2016 01:44:26 -0700 (PDT)
X-Received: by 10.140.38.5 with SMTP id s5mr828330qgs.83.1466153065977;
        Fri, 17 Jun 2016 01:44:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si30524733qkb.0.2016.06.17.01.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 01:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDpO5-0007b6-BP
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 04:44:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDpNx-0007Xz-T6
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 04:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDpNv-0003mQ-WF
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 04:44:16 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDpNv-0003mE-Kg
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 04:44:15 -0400
Received: by mail-vk0-x231.google.com with SMTP id j2so107158028vkg.2
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ll1QtiOeifdapSIK/JsfTrlC9kFsS3LEGxoO0l5uDsc=;
	b=fRV/dQ0+QstwCEvSfYKdV4uSpS9auKbq8c1Bzv8N4sX3yDhQRKixWTq1eCS5tMV3Ch
	Sdp/XFwanZBSY8AU6fy6/IcPs9RQhID4jSwv2qkoOe7yS3xXt/qoChw3wb3xGx6M4HUW
	+lyKudJuo2OvnbSA0fjwJ0xe23Xr65v9xbVwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ll1QtiOeifdapSIK/JsfTrlC9kFsS3LEGxoO0l5uDsc=;
	b=nAdx3FKl86VfzQJ+5/Cu9ZM+841TDfceq8w/PoAO8VAegZA3RPNF3nrFRHKMte00gc
	t+MOyZjnjY0u7A6S2ikrWVMY4clc8F33ffHaVieu0bywmFqBeekCrA+5Gk3eXJbP8yG8
	9FM1Wv24bPOvhfS7FpvFePeP3EPNaPl/VT8gKpPVIZ8fdjt5SPJDboE5kYJ3APBGk1tW
	CtdRBlTD29j0HDe0alUNRWIuFaNBBqjhSTGIqCvvaknZycyjGrwFhZ4NkPjjR+zH+263
	9r1T6V5Fciow85C28AQXsmzlNcZMT0JN2g08GCjwyzEFAKASeu28gfFkn8FvdkHePICu
	lZUQ==
X-Gm-Message-State: ALyK8tI46BQG+uuBGeo/aOOI5R77AV4IJWinFLwSirHyHG55wI6o0VLr4ace87DpxgmVmuNkBbpnQJmv9taNYQSb
X-Received: by 10.176.1.238 with SMTP id 101mr283925ual.119.1466153054948;
	Fri, 17 Jun 2016 01:44:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 01:43:55 -0700 (PDT)
In-Reply-To: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jun 2016 09:43:55 +0100
Message-ID: <CAFEAcA_7peAWc0Xop8pQ8meik=Gs-o_MmPuFDJwA-hU2YE=LPw@mail.gmail.com>
To: Tsung-Han Lin <tsunghan.tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [RFC] target-arm: fix semihosting ram base issue
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: US4gN3NldSHq

On 17 June 2016 at 03:37, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> Hi, I made some changes to TRY TO fix the ARM semihosting issue in
> SYS_HEAPINFO handling.
> This problem has been bothering me for quite a while.
>
> A new global variable 'main_ram_base' is added while a new memory
> API, memory_region_add_subregion_main, is also provided to let
> SoC/board creator to initialize this variable.
> I am not sure if this is a good idea (to add a new API)
> or maybe we just let SoC/board creator to simply
> set 'main_ram_base' in their 'xxx_realize' functions?
>
> As for Cortex-M series, 'main_ram_base' is set during cpu initialization.
> A64 semihosting handling is also added and use zynqmp as an example.

Could you explain what the bug is you're trying to fix, please?

thanks
-- PMM

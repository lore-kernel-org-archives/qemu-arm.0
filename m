Received: by 10.182.158.201 with SMTP id ww9csp850144obb;
        Tue, 17 Nov 2015 09:09:58 -0800 (PST)
X-Received: by 10.31.155.131 with SMTP id d125mr5188145vke.86.1447780198794;
        Tue, 17 Nov 2015 09:09:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si3676208vkf.2.2015.11.17.09.09.58
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 09:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:59784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyjlW-0002UG-Fm
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 12:09:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjlU-0002SL-6H
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:09:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjlT-0005qk-CO
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:09:56 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:32961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZyjlT-0005qZ-7z
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:09:55 -0500
Received: by vkgy188 with SMTP id y188so7010977vkg.0
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 09:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ANMzK2xynzMgVDCurtKYcsElJHmbs1cDjDJruBhaBXM=;
	b=hbfWuZ7Tp3WIgz0KHTreZkZgvkKFmC7ev+WXyI7iCtBBr0vL+KE4tA+FchW0NTdFel
	hMjG0hg+QEyAlwVkCuomKLodipvFtcNf6g2kRJ/rPGSrbPOvUBwZoxi7es4dL6bt8V4k
	OKudC10G5PbLHso9ufGaoAYtbzpau9fcO6V3wcc1W2E4vxeq+jNAbbIAsqRagfGqRWsC
	E/7USuOzaFhm+GE5X8RCc7VB7UEb+Ude93daRJILi6xRqeXS/50iO8CmQ1jwwk53bkmy
	DBul7czxZVkpkqi3VdpaebosZLaz6Dd30+LAJAcNMD4PtB1IHRvr2cveattt0DQ6lH9H
	AYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ANMzK2xynzMgVDCurtKYcsElJHmbs1cDjDJruBhaBXM=;
	b=k5iUBovavuDQCcMt15sv/tmdiCey7+6QWp54wqAxHUwUHkIDei35QiLtuqi+QHtbaD
	79V6ZkisHS1C3CuZySBQ0LQ9R/yJrgNHQxGJmTUNnw6tzbvFO9Liy1FswR+Mh34oTUPo
	ScqAW5zx53ayddCWpCJp+727cSZkuVye0o8R/3msOH8QQk1BaXZwarSCQScRL+27NCb8
	olsSAq7F6z8ZZ84uJpY979eQZoC/Z7XsIvZig4Ms92z0ZWuudgziLcStsu+T3l54iaHb
	aj8EhBlzBW4Xr1AdaiGEU6MXVPLjyh2QOR2lOXzK/X7t+g4BFjesXEm3B2gvSOx5m15M
	FZfw==
X-Gm-Message-State: ALoCoQlbYQxzSQbepEg9Oz6Wxnj4+OFWWgMg4ViuGvI4KZjHkIpA4Bkqbx4LjjmwZt3PMyLGJGAS
X-Received: by 10.31.41.195 with SMTP id p186mr4710020vkp.139.1447780194761;
	Tue, 17 Nov 2015 09:09:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 09:09:35 -0800 (PST)
In-Reply-To: <1447031505-12477-2-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-2-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 17:09:35 +0000
Message-ID: <CAFEAcA_vH5thMyAD+nrz_zoB-oBV=EujBEv86j+1gL5Xv-Fgqg@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 01/18] armv7m: MRS/MSR handle unprivileged
	access
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OvmPW2dBEItf

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> The MRS and MSR instruction handling isn't checking
> the current permission level.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> ---
>  target-arm/helper.c | 79 +++++++++++++++++++++++++----------------------------
>  1 file changed, 37 insertions(+), 42 deletions(-)

This patch looks good overall, but there's one style nit:

> +    case 0 ... 7: /* xPSR sub-fields */
> +        mask = 0;
> +        if ((reg&1) && el) {

you want spaces around operators, so "reg & 1" here and elsewhere.

It would also be good to mention in the commit message the
other things this patch is fixing:
 * privileged attempts to write EPSR should do nothing
 * accessing an unknown special register now triggers a
   guest-error warning rather than aborting QEMU

thanks
-- PMM

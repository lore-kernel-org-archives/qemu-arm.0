Received: by 10.182.105.169 with SMTP id gn9csp1915375obb;
        Tue, 10 Nov 2015 09:51:40 -0800 (PST)
X-Received: by 10.140.152.83 with SMTP id 80mr6611041qhy.8.1447177900964;
        Tue, 10 Nov 2015 09:51:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w191si3796095qka.96.2015.11.10.09.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Nov 2015 09:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:34588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwD52-0004f4-M8
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 12:51:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwD4a-00045N-Bu
	for qemu-devel@nongnu.org; Tue, 10 Nov 2015 12:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwD4Z-0003OS-Eu
	for qemu-devel@nongnu.org; Tue, 10 Nov 2015 12:51:12 -0500
Received: from mail-yk0-x234.google.com ([2607:f8b0:4002:c07::234]:32983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwD4Z-0003OC-At
	for qemu-devel@nongnu.org; Tue, 10 Nov 2015 12:51:11 -0500
Received: by ykdv3 with SMTP id v3so6673897ykd.0
	for <qemu-devel@nongnu.org>; Tue, 10 Nov 2015 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=utz1EPRblym2IdsqVbCPkExlqPg2ethiUjEaelYLpTA=;
	b=BosKXIOKe8E7e3dOG+tqemSOD+kNbaUkTZ5t9OWnBdyg6Y5lWXsk8OG+9pfOL9I1g/
	44XfIIMluQmTmCPMxRXotjW7kClqfHpqbyNErkt9cfhbrIlTBIPL1HBWhnYSfjVAEW8s
	t3bLr8/GTvCEeYEdbkil5j8WihH2HNM9Ahytu/k+r1UeCEg7SfNMKyUGYodpBMG3h+UB
	WQcqaSO/wqVrPKfZJEam7yqNUKA45MqMr4i1a9Aa/Dv5IhCncloRpu99bWDUHi3u1Zwa
	ExZbCEaHnUIDusdCGB/6dCxTdK4mqD5mBHHiq0sIxCJ+7DVKlPCY6KMSI+VF2/x4AhU+
	yFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=utz1EPRblym2IdsqVbCPkExlqPg2ethiUjEaelYLpTA=;
	b=AFRsnJ96DXwA65pkxYlcdqfoxTTGtJioRUK+SpdrmdbyD69KQ1Q2DMwIUhxNRYqzi4
	pE7WaSQptm5Ny6hG5s1KJKN0r/ysD+OCeVuyYOsCDqE9plq48hTdo0ur8B1C3Ye3163q
	u2cxivCWlXso1n/vvLhzIEQLLy9tw9B9Nzk5I7XbfTH5Vhd2AYy9oj9FdK0A5uEqJF6W
	wkOb2o8xPvZJ8Yb0xIAjhN/AoHrZGbIG8VQtjaw5oiX3pAV+/wXepBO5YUL5eOo7n+0Z
	Z8u5Wd8yQ1n5vs1i8o1kslQlp3Uardz2PSSc+4hFjp7vIcIruuFH1ogp2vj2YBRe3KXE
	27jw==
X-Gm-Message-State: ALoCoQnIKSbMupApCphJXLvre4pSMK/gb1FyXlp0eDmZZt2n4KBGWkSMjUlDKH+l/mysiCxXRqnP
X-Received: by 10.129.75.131 with SMTP id y125mr4649556ywa.48.1447177870938;
	Tue, 10 Nov 2015 09:51:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 10 Nov 2015 09:50:51 -0800 (PST)
In-Reply-To: <1447176222-16401-1-git-send-email-serge.fdrv@gmail.com>
References: <1447176222-16401-1-git-send-email-serge.fdrv@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2015 17:50:51 +0000
Message-ID: <CAFEAcA8KsMRop8+4-q-NHYuiMsaCYxfXZ1MW=5no00tfppWJNQ@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::234
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] target-arm: Update PC before calling
	gen_helper_check_breakpoints()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 682TTECSVrqI

On 10 November 2015 at 17:23, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> PC should be updated in the CPU state before calling check_breakpoints()
> helper. Otherwise, the helper would not see the correct PC in the CPU
> state if it is not at the start of a TB.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> ---
>  target-arm/translate-a64.c | 1 +
>  target-arm/translate.c     | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index d7e0954..fe485a4 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -11102,6 +11102,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>              QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
>                  if (bp->pc == dc->pc) {
>                      if (bp->flags & BP_CPU) {
> +                        gen_a64_set_pc_im(dc->pc);
>                          gen_helper_check_breakpoints(cpu_env);
>                          /* End the TB early; it likely won't be executed */
>                          dc->is_jmp = DISAS_UPDATE;
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index a56f7fe..4351854 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -11373,6 +11373,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
>                  if (bp->pc == dc->pc) {
>                      if (bp->flags & BP_CPU) {
> +                        gen_set_pc_im(dc, dc->pc);
>                          gen_helper_check_breakpoints(cpu_env);
>                          /* End the TB early; it's likely not going to be executed */
>                          dc->is_jmp = DISAS_UPDATE;
> --
> 1.9.1
>

Applied to target-arm.next, thanks.

-- PMM

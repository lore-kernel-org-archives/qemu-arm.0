Received: by 10.25.208.211 with SMTP id h202csp1049406lfg;
        Sun, 6 Mar 2016 11:04:35 -0800 (PST)
X-Received: by 10.55.78.207 with SMTP id c198mr23772667qkb.34.1457291075683;
        Sun, 06 Mar 2016 11:04:35 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q141si3943622qha.77.2016.03.06.11.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 11:04:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acdyl-0005AT-7L
	for alex.bennee@linaro.org; Sun, 06 Mar 2016 14:04:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1acdyL-0004cV-Dn
	for qemu-devel@nongnu.org; Sun, 06 Mar 2016 14:04:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1acdyI-0006vx-8P
	for qemu-devel@nongnu.org; Sun, 06 Mar 2016 14:04:09 -0500
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233]:36794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1acdyH-0006vS-Vw; Sun, 06 Mar 2016 14:04:06 -0500
Received: by mail-lb0-x233.google.com with SMTP id x1so109154466lbj.3;
	Sun, 06 Mar 2016 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=+Lo8a/5mxnYgX/QlBgQa9EPqAZIdl304jerT6TxtrYQ=;
	b=ckAbBj4yZKNHD9P2L3THyjeV53uy2Ye9nE7bJPMl5Z177MN7ewgrETx/OIwDSIIPDJ
	trAurDDcfVXNiyBtwxi017hjaUQkqvBrXoGw4d3ymGXzDftg4mbT2Rj7nO9CnnR2E/Nl
	WZRYau+hnUWS2zLEB0tQRZ3a2cWCaGlamCVS6c9A9Nr3QzKBQDKgxLtS2qHUxDZ4/Cua
	zBTuPFISxBgz3orlevjSqZSBik+Q0JYqflc7u/ghZrNplftSX6KaJ10Dp5KZR+kQQ7yf
	9XpQAmeeYSszNX2uvH6RCaCVdtpgUMQYNi13HusgOThLu3IvZLGFiQZ2oiuvMb/o+W6O
	rmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=+Lo8a/5mxnYgX/QlBgQa9EPqAZIdl304jerT6TxtrYQ=;
	b=IUH1mEikMZFkjBUy+oopyrLf+LaoSRwAjUbhokY1SVDcKJcWGO+Vpi62c+8HM1N7IT
	wAb9ULEJMBBwQ2fHw+Ut3mv/njGid9tufY2CWqhPtyYxG54pMo54fj++LdOHybnwWWu0
	UaryOXz12mn1pUm5pH78xy8vfuHAWSeVJbnIaVJTUjfdtqiMXBrvMPlT6eTX3o4crHTN
	lLx3r6nzkKtOOuS02NaoSvIO29WrYoK69hY3mnfSkAw1V6OVXnikv5CJzAWGeYFILV3C
	CHO4eMZFjzNr/Flr0QmlAjLhSCduStHQDLFClm0M/GaY3PUTTlGrGwTmIY3FmI5qK2lQ
	/DHQ==
X-Gm-Message-State: AD7BkJJVR/cr/36pyrnceiIPH75YTTk1YoLQoL+2h4G47PklOBtoeY6gDlgKDk+d+YJiWg==
X-Received: by 10.112.149.73 with SMTP id ty9mr5110078lbb.48.1457291044732;
	Sun, 06 Mar 2016 11:04:04 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.gmail.com with ESMTPSA id
	ub6sm2235193lbb.17.2016.03.06.11.04.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Mar 2016 11:04:03 -0800 (PST)
To: Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>, qemu-arm@nongnu.org
References: <20160222222554.GA11598@beta.comsecuris.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56DC7F23.8030104@gmail.com>
Date: Sun, 6 Mar 2016 22:04:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160222222554.GA11598@beta.comsecuris.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::233
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] Fix bug: SRS instructions would
 trap to EL3 in Secure EL1 even if specified mode was not monitor mode.
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
X-TUID: NMrE8Q0U9r+U

On 23.02.2016 01:25, Ralf-Philipp Weinmann wrote:
> According to the ARMv8 Architecture reference manual [F6.1.203], ALL
> of the following conditions need to be met for SRS to trap to EL3:
> * It is executed at Secure PL1.
> * The specified mode is monitor mode.
> * EL3 is using AArch64.

The code changes in the patch looks good for me. But anyway, you should:
  (1) tweak the commit message title according to the requirements [1] and
  (2) add your "Singed-off-by:" line [2]

Actually, you'd better read the whole page [3] carefully.

[1] 
http://wiki.qemu.org/Contribute/SubmitAPatch#Write_a_meaningful_commit_message
[2] 
http://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
[3] http://wiki.qemu.org/Contribute/SubmitAPatch

Kind regards,
Sergey

> ---
>   target-arm/translate.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index c29c47f..a7688bb 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7582,7 +7582,8 @@ static void gen_srs(DisasContext *s,
>       bool undef = false;
>   
>       /* SRS is:
> -     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
> +     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1 and
> +     *   mode is monitor mode
>        * - UNDEFINED in Hyp mode
>        * - UNPREDICTABLE in User or System mode
>        * - UNPREDICTABLE if the specified mode is:
> @@ -7592,7 +7593,7 @@ static void gen_srs(DisasContext *s,
>        * -- Monitor, if we are Non-secure
>        * For the UNPREDICTABLE cases we choose to UNDEF.
>        */
> -    if (s->current_el == 1 && !s->ns) {
> +    if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
>           gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
>           return;
>       }


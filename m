Received: by 10.28.91.67 with SMTP id p64csp1981384wmb;
        Sun, 18 Mar 2018 15:48:41 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtWl14GEagIr0/NnRZKdwqQM+q0sweZjGFJYk4O65702rG5Ju/JJXfoGByu+C8oirPFswve
X-Received: by 10.200.61.129 with SMTP id v1mr15241030qtf.341.1521413321346;
        Sun, 18 Mar 2018 15:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521413321; cv=none;
        d=google.com; s=arc-20160816;
        b=EFVw/M7T9tf+U2oAnZwA2fCYt0c6A86A9+78SmiLxydg3bTvMVW3TGxGJsLIDx5Ow9
         A+gRsuk7hO2/3elOUbid8zrX6aMReO0uSBOnZz6ZC8IPGJ124Y6AkuV/xu7az+X+7aiW
         shbUxPyAEIzrluRXX5GsY8ZvSep1n5olsnRv8JCIVkmgBg6BFAliq93CBRLSLiGBT4lL
         PvqHkf/L6FUkcfyF0JdHo6vSbVNjdVWpK6wnuxd6Ze6FAhy6QlBbwwkfoLk5AX14lS3a
         ihX0twQBiSugL7rUT7ToLoMvi0nsMPINey8lv/4NqHQ7+mFJGr9pGl4uUDjwP1XgmquG
         EzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=quG64bn/WS7wN+eWwmqnzYPv/CumWRCrcaLil6BTWYQ=;
        b=GYotHveX5321F3Xg6xfgAdn6JtQPcZZ2QL4GD0WSM0LCVj9r+NlVlv/r9kNyv8zDmL
         O3iVELVWEnZ3ry2XJv5UGAMBm1ehiklymkmG/Fczskk0eNNVCPGXwP8LnuS36V6Ekt4W
         KDs+CuevrPr7x+fIlqUVhe0Z5IYUjNS3gzZczF/T12VG392TvYyqzcKosnH9/ZRpKS70
         u0kZxXxsvmlAeGYDnZbg/ydWmTGqmKbS9dMHivfgdQTyKzlWCsYZcVQDm/kr3tRNmNuZ
         8uHMX+SeTlfpPcKiAsS6Tfu2K+pStdybcGF/uLWGrVkY8X0dcEwjMj0Ur+zzFkfuMXbm
         KT+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uaJaVEPc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si2851158qtk.363.2018.03.18.15.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 15:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uaJaVEPc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exh6W-0000Ky-SY
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 18:48:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh6M-0000K7-Q1
	for qemu-arm@nongnu.org; Sun, 18 Mar 2018 18:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh6L-0000yX-SU
	for qemu-arm@nongnu.org; Sun, 18 Mar 2018 18:48:30 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:38624)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh6H-0000vZ-30; Sun, 18 Mar 2018 18:48:25 -0400
Received: by mail-wr0-x236.google.com with SMTP id l8so16748251wrg.5;
	Sun, 18 Mar 2018 15:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=quG64bn/WS7wN+eWwmqnzYPv/CumWRCrcaLil6BTWYQ=;
	b=uaJaVEPc9+6wjrBrsdQhIVIwl6wFsFmwzTJyKKErUVdVShQW7BBILmBMfcq4Q9MRl2
	M2KwJTwTuSL4/R5KlNkDBGjBiUTQSt31pJIHlXWHgWwW049bMSH/DAsDZRJvTEjrWWjg
	zalBB36OGtzz9prLvU9J9jwnxse1hWHKFdJ8CayVoyx06sMHFou/GCMoAboHUda7W9tZ
	6Auf5qWf6b0Ix53QSk4TJhX06jdT2Nfcb4SUPlcfoh7WZys54SKxV8TClU5RRyylfvgv
	7xoZCgczf1h7cyaqpZtFNdUWN4BDaXzsFLRRrYRVYVKyaIDKYILb/hFQ5knpXlZit1bc
	ejQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=quG64bn/WS7wN+eWwmqnzYPv/CumWRCrcaLil6BTWYQ=;
	b=CVB+ZRoyd9OvEHsIJ7b9zFLhiSCt+yimi8qwjXfBQ1OVhpPlFe6IA/ZbZOPWWhtZq2
	A4GTlWQoMSjJxUHZYXH0e+5bFAzKQmJascR/LANWLslraOxtanvcHGuC45Nh1jUMP0vS
	sxL9axZ7m8CrRS+bv7Q7ePgY4LmAf2SdgOrC4zOPhIkH1Qw2c07GsqhOCD3T2nzRiN5J
	QtCTj5javrpGQNYHqvqMLxDeNOVCVnKfq1Q+WK9GzyVPRYby0tldeExunu7oPQcqFwcO
	lUk0wjqUkwd3V9HBVJ7jvnI8gCL36F0fayrCvLlLs10T9HW+G1TFXdjKGM7vnBMXS69R
	nlWQ==
X-Gm-Message-State: AElRT7E7wc/KtNUsCye/Z7e2LvF33Hm4qBgOvDki807JP0jGfMvS7+lw
	j5MV3FD8evM9P+CvTNmicFo=
X-Received: by 10.223.143.7 with SMTP id p7mr7239372wrb.207.1521413303716;
	Sun, 18 Mar 2018 15:48:23 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id
	m35sm3835561wrm.59.2018.03.18.15.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:48:23 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-21-git-send-email-alindsay@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b8b7a898-b714-3563-7f7a-84374db2b283@amsat.org>
Date: Sun, 18 Mar 2018 23:48:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521232280-13089-21-git-send-email-alindsay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-arm] [PATCH v3 20/22] target/arm: PMU: Add instruction
 and cycle events
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: StEX610ZtE0l

On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> The instruction event is only enabled when icount is used, cycles are
> always supported. Always defining get_cycle_count (but altering its
> behavior depending on CONFIG_USER_ONLY) allows us to remove some
> CONFIG_USER_ONLY #defines throughout the rest of the code.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
[...]>  #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
>  static const pm_event pm_events[] = {
> +#ifndef CONFIG_USER_ONLY
> +    { .number = 0x008, /* INST_RETIRED */

"Instruction architecturally executed" seems more explicit to me.

> +      .supported = instructions_supported,
> +      .get_count = instructions_get_count
> +    },
> +    { .number = 0x011, /* CPU_CYCLES */
> +      .supported = event_always_supported,
> +      .get_count = cycles_get_count
> +    },
> +#endif
[...]

Received: by 10.223.197.9 with SMTP id q9csp1037468wrf;
        Fri, 29 Sep 2017 14:08:15 -0700 (PDT)
X-Received: by 10.237.59.91 with SMTP id q27mr8423689qte.340.1506719295885;
        Fri, 29 Sep 2017 14:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506719295; cv=none;
        d=google.com; s=arc-20160816;
        b=l67MeeotRtRZCyaZUSdYaNISx3y+OQK5tmeWeNN5CmLFEgOwZvaSjUOPI2BBdZu8D6
         kSChFXuqAE43iVlxkrtboGFN5IqNiLGMTfBaCjnQbmkbmvLvU+yfed8S9D1xP4SYrTZV
         gFDpgnBIS1UBQhTn6bBaUjJ6cVR7CXFp/gyuoNl4B9PZNnbMn+uwsrmhmcUNwtLuwzgD
         ciQ7zGUVS+m0D1XKIAgo1mzp56zqVLlj9TyWnBV8k11k9pe9ufZ8Pj6ftn9bUsodiVjl
         MqUZpnNkePJtM+qWFags1xxbHd2rQeqic9ScpqphMMOZPx4PcWEIzJqE22+YgtQUOp8p
         FNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=gkEFgUsC5YQEHtEuReTCD5RvVDkFjIcoZMXl26At7ao=;
        b=IooX8aJkU8BRQXITI5WtG7J1YDGit0VIb25HVfPBKn8e0YtnVwRPfF0+bpYudgiYfp
         JHGDXPTFpzo588H7whU1v6qoqbBIDwl33zbOBL0kbR6cSP4f4tOPVkQb7yPh/zBb6QbU
         vDwzJ1x8hmylV9A6yhluit6yGJhr1m7CuEAujVsedEjpQC4NQDdyiM2Ro3OyGQPcdIYE
         8x1w1an+xxiKIDyTB3N0AYK3Cwm4rZ2hv6O5rpRAItD2wazvjXOHFhkw4qGYoTxTPDnE
         AOzKgtzktKiBzCtUa7KrdK3I55pV8qq+xjqVhuZuUnebf1ztbILrvcrbWoOruijg3e/s
         Jmmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZCIYdsn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z187si4326783qke.51.2017.09.29.14.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 14:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZCIYdsn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy2W5-0004XI-Ix
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 17:08:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2Vw-0004W8-FH
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 17:08:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2Vv-0005Ax-D9
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 17:08:04 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36405)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2Vq-00059Q-R6; Fri, 29 Sep 2017 17:07:58 -0400
Received: by mail-pg0-x242.google.com with SMTP id d8so486164pgt.3;
	Fri, 29 Sep 2017 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gkEFgUsC5YQEHtEuReTCD5RvVDkFjIcoZMXl26At7ao=;
	b=ZCIYdsn50H11XV88B2lLcEIXjxz77OEvRnkRudlbtCSjoTmNxZk+u6bwKx/E+7kORF
	4/he+r63ot9xSvZ8Tq3vlnoKN67XIGRHrVajWP1lPa8T+nWVa0B882UYLeMeEjZUVTDV
	oYJKe8hXdx/JPwNBxg/ToJe0+XRRnSf91yn3QP8sd0FXQTMNh3cyjpHBCydTpCktWWec
	zc5vx4cFBIzv/HuV0RtU92dSJQsuj++ZNcCyolTQ4eh6aEdSVaGrNGoDUyD8KCoZs4kI
	/oammANsToCVlNHDl2Kd9luWR+ul0Vctq46SANgZkRQjDjIE7crEccGCUz4FAJFVmyBB
	pmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gkEFgUsC5YQEHtEuReTCD5RvVDkFjIcoZMXl26At7ao=;
	b=A9PBZ958i//aRB6BH1yn+Pet3VXGqPSpcWeX/WqRkL5GOW6TK9nYEdTxuFLOPDN3gV
	ED+/Termlv2Pv55p5fRPUpCNRZB6NuAp6QnavGUfmoOxhHYStOI16+ue73BTBOuraI1O
	6QHHHeiGJJT4uGgHn3XC8GaaYfr+G9Dun7VaQyrREWPiX1IFrz6uQSQGQYKTqKsul8pR
	tLOwaQpYsUhT6KYIN6Hys4UmFjDYRO3wrklV2BBNyNOAm53UOlse0sxjEtxweGUFWbHU
	+UbuJk6XTLk9uMkMpczke9lf34yhBgQRF/2o+BFz0NlGszJnfvSYBGpmHTOlOQbpZxtu
	/Bbw==
X-Gm-Message-State: AHPjjUikQ+xsaJwNoUtNCsgMudFR7odcb2YqVk5i5SpXhqAdRmWwc5QH
	NVVjKUA9zu6Y/iYfAGR2m9roB/Ho
X-Google-Smtp-Source: AOwi7QCgwiFkowwEBN9MnQsSqMge0m0/AeVZ4yVKXL14rqPIj4EQQ4RRolckwAxxhDcQoylDM/PWSQ==
X-Received: by 10.84.238.131 with SMTP id v3mr8357870plk.342.1506719278019;
	Fri, 29 Sep 2017 14:07:58 -0700 (PDT)
Received: from [172.31.205.142] ([216.9.110.14])
	by smtp.gmail.com with ESMTPSA id
	g68sm7755559pfc.64.2017.09.29.14.07.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 14:07:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-9-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b455f17e-e8e0-fbdc-0f81-2731d5427bbd@amsat.org>
Date: Fri, 29 Sep 2017 18:07:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/20] target/arm: Don't warn
 about exception return with PC low bit set for v8M
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: XFx+0H+Ot9ep

On 09/22/2017 11:59 AM, Peter Maydell wrote:
> In the v8M architecture, return from an exception to a PC which
> has bit 0 set is not UNPREDICTABLE; it is defined that bit 0
> is discarded [R_HRJH]. Restrict our complaint about this to v7M.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/helper.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 979129e..59a07d2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6421,16 +6421,22 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>           env->regs[12] = ldl_phys(cs->as, frameptr + 0x10);
>           env->regs[14] = ldl_phys(cs->as, frameptr + 0x14);
>           env->regs[15] = ldl_phys(cs->as, frameptr + 0x18);
> -        if (env->regs[15] & 1) {
> +
> +        /* Returning from an exception with a PC with bit 0 set is defined
> +         * behaviour on v8M (bit 0 is ignored), but for v7M it was specified
> +         * to be UNPREDICTABLE. In practice actual v7M hardware seems to ignore
> +         * the lsbit, and there are several RTOSes out there which incorrectly
> +         * assume the r15 in the stack frame should be a Thumb-style "lsbit
> +         * indicates ARM/Thumb" value, so ignore the bit on v7M as well, but
> +         * complain about the badly behaved guest.
> +         */
> +        if ((env->regs[15] & 1) && !arm_feature(env, ARM_FEATURE_V8)) {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "M profile return from interrupt with misaligned "
> -                          "PC is UNPREDICTABLE\n");
> -            /* Actual hardware seems to ignore the lsbit, and there are several
> -             * RTOSes out there which incorrectly assume the r15 in the stack
> -             * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
> -             */
> -            env->regs[15] &= ~1U;
> +                          "PC is UNPREDICTABLE on v7M\n");
>           }
> +        env->regs[15] &= ~1U;
> +
>           xpsr = ldl_phys(cs->as, frameptr + 0x1c);
>   
>           if (arm_feature(env, ARM_FEATURE_V8)) {
> 

Received: by 10.25.159.19 with SMTP id i19csp554457lfe;
        Sat, 6 Feb 2016 10:26:28 -0800 (PST)
X-Received: by 10.140.27.202 with SMTP id 68mr24236085qgx.4.1454783188740;
        Sat, 06 Feb 2016 10:26:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x143si22256039qka.122.2016.02.06.10.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS7Yx-0004ZV-Mq
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:26:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7YY-000401-NQ
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:26:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS7YV-0008Cx-Hu
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:26:02 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS7YV-0008Ct-3n; Sat, 06 Feb 2016 13:25:59 -0500
Received: by mail-lf0-x244.google.com with SMTP id 78so3933307lfy.1;
	Sat, 06 Feb 2016 10:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=XkY8DhrmUCYr1Is29tUGyVAHGR+EX8wvD5C2N+89Ets=;
	b=KsZTMNhIJsJYU7p7u3QiLhluP1heA7ysCb8kXjiMqTWRasfSf47LGeHqx7IyATVIn5
	zCYz88FV9cSEUkXgjMaJN3gF1sghaXOCCvdP4JcAMSW8FqRhz8E6AXlz7q0Zf+DvVhVy
	Q3QhKDnuxYIdzgNJvyzsh2tuE3iQQBXIW1USlR8m5OPDP0ZtJAX+HFT7ejl9fBsAFDyu
	CkBu/X3F8AtOWhghKJnrn/CKOhMczMTihwz0TcgNuim8FhTkFw+pvWRj/w1HEbZnpwXA
	sSJya5br5d42BbNTSlPpntNG2UhywWpA/S1cYDtRr41vstErgrP+S1ZqQ5Q5BYVfmMAH
	5gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:references:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XkY8DhrmUCYr1Is29tUGyVAHGR+EX8wvD5C2N+89Ets=;
	b=DizsMq+2c/zM5xJwkh+Pw0ZJKoTmpps7o26LPPJTGLX0Ky7KUfQNfNyAhgCqPyZdcR
	BYISnz7EadEGzKvUhSB6iqmZg0fek4gSbpnSGM3wDcmgqotgYJNYHjScuSmJkxpNHXX/
	ifsNyNYz36w1zogjpMoK+siaNJYhw7OUzra2WDs5nWvoxmFkRnRA8u2eKl2q5Ik1ulEd
	Iv38byu+dkjiTG8RWwRTcPHgK4AmNDv6hpcek2+iMFu6+OTJYbnaW9k/MfWUSxFe42A6
	RZyz4bkJR6wCiinYEcyoUwFvAphzvQyX2+al3TUkLR5nRNAFJWSEOcX9lGPfIPG0pmEb
	BiBg==
X-Gm-Message-State: AG10YOTkfHx7LmbaqXK5XQQekNo6jLX9GgPdASWZXtC007anj1F62MCp2hWVdroWhoSsxw==
X-Received: by 10.25.134.137 with SMTP id i131mr8242745lfd.94.1454783158340;
	Sat, 06 Feb 2016 10:25:58 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	ne8sm2948353lbc.21.2016.02.06.10.25.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:25:57 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454683067-16001-1-git-send-email-peter.maydell@linaro.org>
	<1454683067-16001-4-git-send-email-peter.maydell@linaro.org>
Message-ID: <56B63AB4.4020705@gmail.com>
Date: Sat, 6 Feb 2016 21:25:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454683067-16001-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] target-arm: Fix IL bit
 reported for Thumb VFP and Neon traps
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
X-TUID: GRJyrPv67U5o

On 05.02.2016 17:37, Peter Maydell wrote:
> All Thumb Neon and VFP instructions are 32 bits, so the IL
> bit in the syndrome register should be set. Pass false to the
> syn_* function's is_16bit argument rather than s->thumb
> so we report the correct IL bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 10792e8..fa8e22c 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -3077,7 +3077,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
>       */
>      if (s->fp_excp_el) {
>          gen_exception_insn(s, 4, EXCP_UDEF,
> -                           syn_fp_access_trap(1, 0xe, s->thumb), s->fp_excp_el);
> +                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
>          return 0;
>      }
>  
> @@ -4399,7 +4399,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
>       */
>      if (s->fp_excp_el) {
>          gen_exception_insn(s, 4, EXCP_UDEF,
> -                           syn_fp_access_trap(1, 0xe, s->thumb), s->fp_excp_el);
> +                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
>          return 0;
>      }
>  
> @@ -5137,7 +5137,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>       */
>      if (s->fp_excp_el) {
>          gen_exception_insn(s, 4, EXCP_UDEF,
> -                           syn_fp_access_trap(1, 0xe, s->thumb), s->fp_excp_el);
> +                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
>          return 0;
>      }
>  


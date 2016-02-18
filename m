Received: by 10.25.208.211 with SMTP id h202csp735971lfg;
        Thu, 18 Feb 2016 09:43:54 -0800 (PST)
X-Received: by 10.140.27.139 with SMTP id 11mr10414251qgx.62.1455817434836;
        Thu, 18 Feb 2016 09:43:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si53966420qge.20.2016.02.18.09.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:43:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWScM-00074n-A6
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:43:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSbQ-0005d8-J8
	for qemu-devel@nongnu.org; Thu, 18 Feb 2016 12:42:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSbP-0001HT-7c
	for qemu-devel@nongnu.org; Thu, 18 Feb 2016 12:42:56 -0500
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235]:33008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSbI-0001HA-HM; Thu, 18 Feb 2016 12:42:48 -0500
Received: by mail-lb0-x235.google.com with SMTP id x4so33386247lbm.0;
	Thu, 18 Feb 2016 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=+0VJtQFPhPIuF3QP9dZcgOoTy5huUudkfEit7xZf+xo=;
	b=BP1PYfyo+ytSUdgeIrrsX5F9WeaqsJyumNP50fcjDFUaobHaFkCqvc0dqPEbWgoeMx
	r9xjfkiEEJ0WOtKZ4dkrpxsNMaZ8MK9XWssoNZir0/lB/81YiPDk+IA6iCU3UkV/gp99
	1sKhSVrCi2L2mDDS/g8LsHLSR+VKFm4mGrrRgfgEHEALN4EdbhXZmkoAXER0ws3NQTRT
	I84rbGrnedqoC7WPc+PMVy+NkvXYVOF1BUpJKiPtGdVlRzK3ie+9OcILjnJZo09axrjy
	yC5fxPlyFNjqTwLC+WT5ITykYIpG4ZsApPlrtWJsa0TUuWBtYePINgBFCc14iz7QYOsZ
	p8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+0VJtQFPhPIuF3QP9dZcgOoTy5huUudkfEit7xZf+xo=;
	b=SYmv1dWMo7PwjO/8pdRt3AxqwZbGzXB3P4DP2oyLe+xdumRGj02qtGLf+ihtu/EdLg
	nwuF12hL+tEzAAANHibygrzpMrHdF6PPzq71XYnZIAInvX6Ag1ue7W4BsNFgNah9Dld7
	KxjAdcfhxO/mq64orae0qKcjPGDljwOTCu7EXwSGFqA3umFws41YN/B5gzFzGWxGlebH
	Xn+7O6tcNPLcoG8p68y3YFu/j7SvXfQAGNENZGTJbfxdaRJShM5gzCRUinVVBn/2KSj2
	aipFAV6HYNgZNv328dmRK9qjnRjK1KsQUIa2kHkfbOL28CVBC5VpebVvjNYyyoN3sTvA
	+Htg==
X-Gm-Message-State: AG10YOQSV42ep1+uQEePxSCfFnQubz9OeqEIkO9+Qwdd+4iu4zOImHmfq4IYGpUx/C4oog==
X-Received: by 10.112.135.230 with SMTP id pv6mr3734909lbb.68.1455817367752;
	Thu, 18 Feb 2016 09:42:47 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	n96sm1079247lfi.45.2016.02.18.09.42.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:42:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-5-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C60295.9010400@gmail.com>
Date: Thu, 18 Feb 2016 20:42:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::235
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 04/11] linux-user: Use restrictive mask
 when calling cpsr_write()
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
X-TUID: PObHH7X34bO/

On 15.02.2016 20:22, Peter Maydell wrote:
> When linux-user code is calling cpsr_write(), use a restrictive
> mask to ensure we are limiting the set of CPSR bits we update.
> In particular, don't allow the mode bits to be changed.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  linux-user/main.c   | 3 ++-
>  linux-user/signal.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 1269470..c467fa7 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -4446,7 +4446,8 @@ int main(int argc, char **argv, char **envp)
>  #elif defined(TARGET_ARM)
>      {
>          int i;
> -        cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteByInstr);
> +        cpsr_write(env, regs->uregs[16], CPSR_USER | CPSR_EXEC,
> +                   CPSRWriteByInstr);
>          for(i = 0; i < 16; i++) {
>              env->regs[i] = regs->uregs[i];
>          }
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 82f81c7..962111c 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1611,7 +1611,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
>  	env->regs[13] = frame_addr;
>  	env->regs[14] = retcode;
>  	env->regs[15] = handler & (thumb ? ~1 : ~3);
> -        cpsr_write(env, cpsr, 0xffffffff, CPSRWriteByInstr);
> +        cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
>  }
>  
>  static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)


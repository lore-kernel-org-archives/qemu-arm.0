Received: by 10.182.158.201 with SMTP id ww9csp645409obb;
        Tue, 17 Nov 2015 02:59:08 -0800 (PST)
X-Received: by 10.31.139.6 with SMTP id n6mr2952431vkd.132.1447757948197;
        Tue, 17 Nov 2015 02:59:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x71si2215727vkx.180.2015.11.17.02.59.08
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 02:59:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zydyd-0002rE-Ue
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 05:59:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1Zydyc-0002r9-CV
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 05:59:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZydyZ-0007BE-6t
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 05:59:06 -0500
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c]:34716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZydyY-0007B0-Uo; Tue, 17 Nov 2015 05:59:03 -0500
Received: by lbbcs9 with SMTP id cs9so3077370lbb.1;
	Tue, 17 Nov 2015 02:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=7ZYYVIIGzdekLDqaAoKtO2RDCOF8ZMr5w1ty4qVcweU=;
	b=RPasq19hqfPGAgKSpd4YipkT/13d1uZZezqfzSSvmjbR4I8kQuxEDnzLp/uEcTT+o/
	7Wu/zPVqhakqCtc/07KyHoe5yM0+eqrjvs7XYjpuS9dfYjNhm5UzY4xbp36+eyxNalfU
	0J8YvBaOuXEXF244UwbH/SE6K8tDBrVIip+VOyDO+N+xugo/zcjNw3G8NY4YlxcCQBEf
	ftGQOk9qE28A/t1lJx9kghxClC0cAhhmENrPVoA3AsNQxGFDLxnkDOfXSH9UJrtRHg4c
	HzD+a58Xz6/24XSjarU6f8g/b7J0nUG5URTafVThRYUwWaIhLoPOcmoggMjnIDPVZ7mN
	yr7Q==
X-Received: by 10.112.235.65 with SMTP id uk1mr19627819lbc.118.1447757941928; 
	Tue, 17 Nov 2015 02:59:01 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	64sm6351925lfu.35.2015.11.17.02.59.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 02:59:01 -0800 (PST)
To: qemu-devel@nongnu.org
References: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
	<1447702479-6997-2-git-send-email-serge.fdrv@gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <564B0874.3050902@gmail.com>
Date: Tue, 17 Nov 2015 13:59:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447702479-6997-2-git-send-email-serge.fdrv@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::22c
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 1/2] target-arm: Update condexec before CP
 access check in AA32 translation
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
X-TUID: sbo+DYS9UvTB

On 16.11.2015 22:34, Sergey Fedorov wrote:
> Coprocessor access instructions are allowed inside IT block.
> gen_helper_access_check_cp_reg() can raise an exceptions thus condexec
> bits should be updated before.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> ---
>  target-arm/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 4351854..f1f8129 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7210,6 +7210,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>                  break;
>              }
>  
> +            gen_set_condexec(dc);

Ah, there must be gen_set_condexec(s).

>              gen_set_pc_im(s, s->pc - 4);
>              tmpptr = tcg_const_ptr(ri);
>              tcg_syn = tcg_const_i32(syndrome);


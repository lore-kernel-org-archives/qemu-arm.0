Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp764444wru;
        Wed, 1 Aug 2018 06:31:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcctErKxVMr+KZLuPfKF0jjT+yZDQSgLI91xygeovGREfW1Ld0g+u/a2GatWPuAJazWW9tS
X-Received: by 2002:a0c:c993:: with SMTP id b19-v6mr23341610qvk.95.1533130307412;
        Wed, 01 Aug 2018 06:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533130307; cv=none;
        d=google.com; s=arc-20160816;
        b=V7JQncWIB/STlfNwFMWbFOVVS23IxZU5xQxUo30Iw43VFiD7bKTValtkTvPIZbRohw
         fEfUvSo8w7DauTfo7i+f7mh5/KyqBNFJx3RObs1BhU6AWeFiL1PM5RpCZ01YH309z+uW
         SD9SnjjzDpwkk6Hbz1M3116W60hsG9hGcSWqEgfnGRdqG+y2cckweciJtaEootW6m5sJ
         bwBFSx8oFh5zcscIpD8Ba+beRgBxzAI5e5GnKpx6uV6IQfV253BvTU1VTXYNdQkFdzhX
         oyqJ7vMZ7OHTWcom3y4UEGjk+9i3wZhj1lmoqMoe0tDqpJeVS0jdM4ddGcnQ3vKaCNOQ
         LAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=X7CPN+WNzGN/SgOAKLhCoLxcPld/W0s3UZjHpQJIMR4=;
        b=UGn5caLC0xBO5tNgtSFX3SF+QvYncVrb9XiAOChMuIoWkMRS4lp8xPN303vLcSorEf
         Vikue/ZmXpjv/Nal87lgGX8dKRL8+0nALB+2YsHfHGUzXZpZJcAfdgK0rjxWJJestzBV
         3nDr4lk/j9INwG7h3FYnWU5jsQO+ZgzT1vx8eSdJG6tUp37qGSTaUmkjtL4vWS1mJ4aA
         g1+LerrWEW9l8WNX7JOC+3KhqaQcai/DQt+9qufdw1zUWpenjaCgARRYD9O75v9fZrYD
         EtokXgk8F/Mowmt+xF6qLs4XihaYqASK66a2Z3d8EnQ6dsyN2ar9hjHg34tc3kvL16EW
         5bhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SaS6C5yu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m32-v6si15283839qvg.182.2018.08.01.06.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 06:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SaS6C5yu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkrEA-0003fR-S5
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 09:31:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrCf-0002GO-1a
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrCe-0006EP-6m
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:30:13 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:41668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkrCU-00068A-Bm; Wed, 01 Aug 2018 09:30:02 -0400
Received: by mail-qt0-x242.google.com with SMTP id e19-v6so19800470qtp.8;
	Wed, 01 Aug 2018 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X7CPN+WNzGN/SgOAKLhCoLxcPld/W0s3UZjHpQJIMR4=;
	b=SaS6C5yuhLHEw+U1hSaF9JBi/1KvKD9VzzXwR0zFzNIQpb6nOGAv+BgGXHGfxUG1ux
	jXmb9IKxXSoqzCAayme61IrZCBdfeGCVbBPl1Qw7uMrdk5USdn6Lf5AYnpqIM7QRWyOT
	n7RIKB4W3fT9E5viFEtc9bb44bj6Up5mW7nCrnXMGaWcOqbU754/rFJzZn16fp73Kmlj
	pSOfZSyrUSRqzX5u+7Qj1HI+gl4cEUjbF7ZFEQiL4lydTYhYRJ0QM4eeOIBBc7TUVTCK
	6c5k96TY89+AUCrEnHFqBJYNqRyCJfB6Q4PZd+REV8kJXa5uaEW7tYaedHIPfMehRZLV
	T3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X7CPN+WNzGN/SgOAKLhCoLxcPld/W0s3UZjHpQJIMR4=;
	b=hXfGkgH2yw8GjSbBhU3JCPmmX4p/j+HGz41bv3sc1v2IVlOM/nt4WEKK7nv3T/jH5V
	U7F8bapMetV7U9edGr3BRGNIdvDhd6jqjQF1MLCg19AycxmQ2/VNVm6UdWn0gUYiR6GB
	Wt1RpSkFPqpevqhLVx69LYy3RUC9LSCScR/dD1dXV7S7E5+L/sB4NWq2XBRSiNyhK/av
	+1IQoI44qVy0trhb/rxALRadqUyBtIauymbmCVzS6KW5vRonke44dUlCFFiTHiAxelye
	YsHG+2/3xgJExJb+VFtsub2QPDREt/ivW6EtYwjwvkGqiSAafxnfHseO2XirPdyoTDI7
	feXQ==
X-Gm-Message-State: AOUpUlGESLN5cGbxVtJU7t9w8yu7Msrsa7ar6os9w2tEJMM2b16Il5ZM
	3c4u+s2w6sH3KjSXq34rGgyaJYvflsf8SywpWXY=
X-Received: by 2002:ac8:524f:: with SMTP id
	y15-v6mr24885260qtn.227.1533130201793; 
	Wed, 01 Aug 2018 06:30:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 06:30:01 -0700 (PDT)
In-Reply-To: <20180801123111.3595-3-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
	<20180801123111.3595-3-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 15:30:01 +0200
Message-ID: <CABoDooMKtkuvvgrF9T63-9dMJaCPFX9=P7mCa6zGZk2JXEw2Zg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 2/4] target/arm: Fix typo in do_sat_addsub_64
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOnC7VRSpjGO

On Wed, Aug 1, 2018 at 2:31 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Used the wrong temporary in the computation of subtractive overflow.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>


Laurent

> ---
>  target/arm/translate-sve.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 374051cd20..9dd4c38bab 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -1625,7 +1625,7 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
>              /* Detect signed overflow for subtraction.  */
>              tcg_gen_xor_i64(t0, reg, val);
>              tcg_gen_sub_i64(t1, reg, val);
> -            tcg_gen_xor_i64(reg, reg, t0);
> +            tcg_gen_xor_i64(reg, reg, t1);
>              tcg_gen_and_i64(t0, t0, reg);
>
>              /* Bound the result.  */
> --
> 2.17.1
>

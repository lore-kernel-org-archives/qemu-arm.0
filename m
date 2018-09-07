Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2309452wrd;
        Fri, 7 Sep 2018 16:26:31 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYdy2sgruZc+R9+qlIPwyHTXt20j9ZM5oF4n8QsCkIr5kGRWINC8UFK2bW2Sov2qZzQrkPi
X-Received: by 2002:a0c:9664:: with SMTP id 33-v6mr7541058qvy.137.1536362791476;
        Fri, 07 Sep 2018 16:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536362791; cv=none;
        d=google.com; s=arc-20160816;
        b=Qte8uI58PhFxXBduXt6luKjdMbkiwXISTInjuE9NkvyytZ6nsNlbSbj42FO9QL2PjK
         mHnpPTslg4NHhYPiYF1fG/kPduDAA5hG+IZu1H9pcNPSEjWxYjbihZChqyo1ky0rKNr/
         MQC3tjk1V7OJdkXH+sL92Wq31h0oVspwsmswvlkmIaUZCqmEW1OyeI5MnTt0rPshugZz
         pLJ7dFqoqNf7jGWtB/H9kFcw0t7fVRawceoYYkEUCjm+g4e/cJveN0AzIQENHDfaqr+7
         KyqlvujMjZC6RWkZNaKa2fxVRFHFMd/x/l72A3cus2LGFQrFO/sIZE/+smwXL9iPt9jX
         hyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=mxqUcJsrXNJL4GF59ULJEqB/cQUagY3vrQanBRkho7k=;
        b=tnJZi6QXQNSBwUwAEiUQVnJHIQG/kaAs9hoVCIiy81/vITzRQm10AS3WhpjiT5wgmr
         GJi/Jg56ivZt09znkR5vBxwlazzHLI6Hzo1v5qj/Z1VYk+2tKPmD90kq6EXu3Xmj9wKU
         pGpHV4Ay5HPL46lt6fVtqmtTUH/28inuqyex6YgIQULtV0CNeCmCXatz5jKD7S1xZ78z
         ULqtBrhIjRMj9CzUMm9rif9G9LoCA4uK0bStlDSyK/S3Pvn78QL8swSzI+vg4Vipod7N
         SphrXYW9ySknWKEOArcWAomc18YVHGitL7zgdNxSmGjJxyVDVT3Kwy5JxWI3XOYYZzKm
         3Vwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Np9hXZnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i43-v6si1048844qtf.22.2018.09.07.16.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 16:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Np9hXZnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyQ90-0002aV-W2
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 19:26:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQ8s-0002aD-7V
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:26:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQ8o-00050p-VI
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:26:22 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQ8o-0004t0-LO; Fri, 07 Sep 2018 19:26:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id v16-v6so16379412wro.11;
	Fri, 07 Sep 2018 16:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mxqUcJsrXNJL4GF59ULJEqB/cQUagY3vrQanBRkho7k=;
	b=Np9hXZnExIHpULJ7kJzLMtVLDY9BTx3IF+2YRewuitHVkhS2dBb/ZNSikGGtAC393o
	8YERa27I6hZvb5osPjVRf2ngkxeIYLbpq2A+Pc3tJzphg088UKobRZNBQDClRa6ydyL0
	Ej6d1ywsqfUnmXg5G+h0WXyJrcbw8QvDOnCLbnd8R2ZCQBCTDYOUaVyCUOvuBiQzblWh
	izdikgpP80HZzbLMiru1jF/6JsHpGNkTH7eh8SOMdZeoOWfqr6ycqEcOIcFjCO7nIHy8
	7mvsfxkMFcttT/LjG7Smqce/FpeyN4JNp9yRuBTnuIE5HwlKQVO8aUnt4UOjsUjMPhAa
	w+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=mxqUcJsrXNJL4GF59ULJEqB/cQUagY3vrQanBRkho7k=;
	b=KNKiGs4H1PT83jS3oLiCxndYkv8dWrwZ8HeAE/vH5mU0piuwpBZM9jJ+LmKh1Sy7+C
	IUXNPaZqbkSus7LCeebxCyL1qYsGHFI7B6IZ3X4zeaPQrj6/iOL5/NR6kUSPlI+wa33S
	OFGe5WU9lpWtEgH2uPty7L4EI7iHLikjJEDvaFtEJXGRPKttS4EopoPdc8SU1f6h8GD/
	snfogRUyUhFzFDF3zauXzq8KtQNppVGfbzWbHTPFiBBa3rcP2TTQAySf2IzLum4/ln5l
	cFjX2v73EpGN/AMtI6NS9LkFxSM/Dg1MYjbD0qp0kDhtDt2UGKyTrbkcdF29vF01RfIJ
	E/WQ==
X-Gm-Message-State: APzg51A/teKW6/mZnmFRxL/vOlv796XPyT3P01yfO/WLfKePzdz2XKaS
	BMdQi0BK29dwYidhLx3R7K9rE1qt
X-Received: by 2002:adf:a708:: with SMTP id c8-v6mr7855261wrd.56.1536362777297;
	Fri, 07 Sep 2018 16:26:17 -0700 (PDT)
Received: from [192.168.43.186] (dynggepcrak-122-5-66-105.inwitelecom.net.
	[105.66.5.122]) by smtp.gmail.com with ESMTPSA id
	y128-v6sm10441818wmy.26.2018.09.07.16.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 16:26:16 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180901124639.19735-1-luc.michel@greensocs.com>
	<20180901124639.19735-6-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <28394c9a-fa7f-7687-77a6-22c2682792a4@amsat.org>
Date: Fri, 7 Sep 2018 20:25:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180901124639.19735-6-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [PATCH 05/15] gdbstub: add multiprocess support to
 'sC' packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mx0ek1ahfhBK

On 9/1/18 9:46 AM, Luc Michel wrote:
> Change the sC packet handling to support the multiprocess extension.
> Instead of returning the first thread, we return the first thread of the
> current process.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  gdbstub.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 2cb9cb6d97..c15250ce65 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1531,13 +1531,18 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>              type = strtoul(p, (char **)&p, 16);
>              sstep_flags = type;
>              put_packet(s, "OK");
>              break;
>          } else if (strcmp(p,"C") == 0) {
> -            /* "Current thread" remains vague in the spec, so always return
> -             *  the first CPU (gdb returns the first thread). */
> -            put_packet(s, "QC1");
> +            /* "Current thread" remains vague in the spec, so always return the
> +             * first thread of the current process (gdb returns the first
> +             * thread).
> +             */
> +            cpu = get_first_cpu_in_process(s, gdb_get_cpu_process(s, s->g_cpu));
> +            snprintf(buf, sizeof(buf), "QC%s",
> +                     get_thread_id(s, cpu, thread_id, sizeof(thread_id)));
> +            put_packet(s, buf);
>              break;
>          } else if (strcmp(p,"fThreadInfo") == 0) {
>              s->query_cpu = first_cpu;
>              goto report_cpuinfo;
>          } else if (strcmp(p,"sThreadInfo") == 0) {
> 

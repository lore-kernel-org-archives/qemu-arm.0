Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2553637wrd;
        Mon, 24 Sep 2018 06:52:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62nH/X2vkIJXog0mrHiTLIfuZkmtTCYmGNU5uN0FgqEhY5Mv69KOe+Z+e4yzPC8GaWj9f2E
X-Received: by 2002:aed:2122:: with SMTP id 31-v6mr8119168qtc.24.1537797137928;
        Mon, 24 Sep 2018 06:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537797137; cv=none;
        d=google.com; s=arc-20160816;
        b=v+FMmq3dSuSNEV/XHMfbQa9fpRhBYSxQnWFjqJ3//uJY7B7KTAGvdm21WcDEqKOPhN
         oZ0xvQ+abD3+OnhHVa4/z9/H0tLuaDM3TLDQR4buATmLuScp1LR9FKc8FhgsEOLJZyOT
         TV22IwBVaAOH5b8Yo1iE/JVE1wvGdUZfkGSgckanz2C2VfIoQ0HPxDjiERMwB/GCyCkA
         nSd0mJIe1QLEsGSfqDg1gghwxWFBOgsR+w7yPrYAUrb68guFaEc2zVqW7ogEP/7QG6uf
         y+CoM8Pzfj1zw+M27El0PmV0DozeQIUfUQxvNDGo+K9Ah44mGRQaTc8Df2wLt2BHQxft
         IC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=C36KP4UbUH5Geavq64ipOZp3Xmw+2MRKd43/pUjGoes=;
        b=Nnryj/0fDsOORpDINQ0LpUAUbu92Ad/FcteU/21oA3sL3X47a0jzju9WZWUeaUsfUr
         wC7Eoxjt81IJFZvt4d4lKuN6uw1Qd9rqEfal7rDaoZPgWgXAuxQ/m0PtpjTNlaOmrdPK
         gyAscgj58K3SiiH+Uji+FzLFQOY4d6+5D25wD698TZ/Jex/CN6UvVAz2cIZmgt7bUB/N
         k6MoPaafe236WcUvkbKvixzBwMG1V2DxOnlE7tgZ2JadNRuuM9Yp79fz4c0TW73N9pjc
         IPU3U07GsMaQCkz2e51IKZQyqMPBwXeBfLR2aMoCKe31GBGMk3ygxzL+bMi6ybQkrHQi
         Z1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mnux2XHB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2-v6si683206qvl.238.2018.09.24.06.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 06:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mnux2XHB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4RHd-0001S6-F1
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 09:52:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g4RHT-0001R1-9r
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g4RHS-0002MX-I0
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 09:52:07 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g4RHO-0002Kf-0Y; Mon, 24 Sep 2018 09:52:02 -0400
Received: by mail-wr1-x444.google.com with SMTP id m16so3291236wrx.12;
	Mon, 24 Sep 2018 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C36KP4UbUH5Geavq64ipOZp3Xmw+2MRKd43/pUjGoes=;
	b=Mnux2XHB0y4fh28uc6Ob4QNSjBZ2gygSNokmlDn9jBeRq7R1TbOtgFEZvgmo6sWPKG
	eUw4dsPtKle8qhVvfe/kS1ASDORXUEKJ7Da1MT9LlE9pqyc3XqWDLmC/eW62X0jb02PN
	mCqViRRNgXFjK+O+NnziA8cXjGCIdBVsQaiMHVF650NNPwacvvH9WsLQEbl1l1gBzvFW
	myQpaelB2NkDpq5AIFGIdkdEEv4z9pLFfQiFeXcgSyaiB08skOyVVuiqP3t50utGtlkW
	VtapkyLLYuqIzyOMJEm0Y9DHxLHJx9soaDkGsKbsfU0hrvSv338PwJmP0GGz1d96Ewdc
	kymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=C36KP4UbUH5Geavq64ipOZp3Xmw+2MRKd43/pUjGoes=;
	b=D11R8Ey74yebP97iNXZpmX+boShf4vWCmd/J3hZSJfWu2Z1/W1PGFS/3+Qwyhs5EP/
	YCFKSd8fhKHqQU0f1bkpNnUMiYAq62+zV6gh57Q4fpljrvmTEe4VyIQUSJzKyqkD9mFO
	JILN82lEPE2hrlryoxSO2Z6OWtUytweq8dpkFVtEH9hpg+bfhZH8KmUWTbDmu6YyJhLC
	/eEL5Qd1gqhyyKDzZaI/nilg55cbJfBqLx91kTg2obsWlydamGAFSOVzEvYrXDTVI60A
	bxk6DmwNzG/aUHgxVhXgQOO8o219hrZCN9yXrQJakS9NHQKExPODeId8PvxxOZafP1a+
	7k4Q==
X-Gm-Message-State: ABuFfohHgokhpdFmqb8eXyugFkrCTMYw2ZRtHI0aR2FfOTWr9/Fi/Z+s
	M37RJHgR2MVubvkNx4qnHGc=
X-Received: by 2002:adf:8485:: with SMTP id 5-v6mr8880314wrg.34.1537797120858; 
	Mon, 24 Sep 2018 06:52:00 -0700 (PDT)
Received: from [192.168.2.36] (106.red-88-7-90.staticip.rima-tde.net.
	[88.7.90.106]) by smtp.gmail.com with ESMTPSA id
	p9-v6sm4336903wmc.37.2018.09.24.06.51.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 06:52:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180924123122.14549-1-peter.maydell@linaro.org>
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
Message-ID: <0ea41175-4a2a-e54f-5c7b-84dc562817f6@amsat.org>
Date: Mon, 24 Sep 2018 15:51:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180924123122.14549-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [PATCH] hw/timer/cmsdk-apb-dualtimer: Add missing
 'break' statements
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6nVHOpW3+TNs

On 9/24/18 2:31 PM, Peter Maydell wrote:
> Add 'break' statements missing from a switch in the APB dual-timer
> write function. Spotted by Coverity as CID 1395626 and 1395633.
> 
> Reported-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/timer/cmsdk-apb-dualtimer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> index ccd49753b7f..30245990f34 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -296,9 +296,11 @@ static void cmsdk_apb_dualtimer_write(void *opaque, hwaddr offset,
>          case A_TIMERITCR:
>              s->timeritcr = value & R_TIMERITCR_VALID_MASK;
>              cmsdk_apb_dualtimer_update(s);
> +            break;
>          case A_TIMERITOP:
>              s->timeritop = value & R_TIMERITOP_VALID_MASK;
>              cmsdk_apb_dualtimer_update(s);
> +            break;
>          default:
>          bad_offset:
>              qemu_log_mask(LOG_GUEST_ERROR,
> 

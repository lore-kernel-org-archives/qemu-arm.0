Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2322071wrd;
        Fri, 7 Sep 2018 16:42:49 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ/QnWaddi7H7u7dY7KKQTAteCdcK45qHr5MQ/rb3Xjt44QQkdGugDI/bmgCIheA4pirnJr
X-Received: by 2002:a37:8e41:: with SMTP id q62-v6mr7598439qkd.76.1536363769056;
        Fri, 07 Sep 2018 16:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536363769; cv=none;
        d=google.com; s=arc-20160816;
        b=W7VO3OnsOs+1PSyEvSiCzzS57xc1HCL0PNwok8tGmJ80Y3M6KkqvgP3V2Fr6gv6ssQ
         TDWkpJGOypo0cRXw3YZ3rqU6lHXLt6k0VknZzVir3UkzVP+qlDsJdGgWW94aYxlWPPLY
         1xD9Zx8f8fhmSzaVgrS8vcpWKaV1x986o77f6PaMv2R0h4xQrtxLrwJMG+DOR2qUSdZG
         S8WOrRNSpFqUaIYAIdIU6kDcXeShQoiAm3FSRkjl/7a+nVeeNda3ps6FVB2mhW6Rz/2w
         SVU5ZT20HBUQ+nLYo97E1yk6pMASO8pSt54TUq4qmpiQeV/xl0RargjATCqMS+dHjhid
         g2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=OwzUVG2AXMBZYW2ARlRHa1BHhylCZfEqGG+74JRCoMQ=;
        b=i6qQ0fIp/aiGsviGnpGapGdSra4hfUGxtxjAytH0hrPvJglP4233P2xhU1xljCSS++
         04Ma6l8sWqTJGu9YXnjJbb3QmdLTtsG+vpQXTr05LjMOt9LKPq9roWBwTxwUZSiOXEYK
         kOd9Ugwk125epUaU5zvwj1nylOx3U/TvOKuNuVZvB0N9uFXr/apGwoMFCxbVOQlzyc+w
         It/r6NVYey1bbFqKlzts76qduBLHaZFVC0k9Cy/mqZzkZeQWtH4LKE38BQClcOYjNi37
         huBvFKRJ3AwJWrC5HlmM5soUgj0VDr06SnfuwDrW1WCK7gD/V0phbvqn0F9+VlH6gBAy
         4Jfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T1es4Ynh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b22-v6si948473qkj.199.2018.09.07.16.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 16:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T1es4Ynh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyQOm-0000ox-J6
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 19:42:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQOg-0000og-9h
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:42:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQOd-0001sq-4U
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:42:42 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:51719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQOc-0001p8-Ta; Fri, 07 Sep 2018 19:42:39 -0400
Received: by mail-wm0-x244.google.com with SMTP id y2-v6so16125600wma.1;
	Fri, 07 Sep 2018 16:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OwzUVG2AXMBZYW2ARlRHa1BHhylCZfEqGG+74JRCoMQ=;
	b=T1es4YnhTZDfJsELuw35c4iRB3k8TK+seNdmbXeKekEDZw9d+UUTHNYh4Mgfzk/gQL
	ZboBrRHbssRj2q4TGW2w9Atk1XziQiyU64cFi3CbtMIsezr/7MldKNuWG825dGqy4ZtN
	fU62AF5Tdbp/QDwzcDXXm6H1iaiDzwS1UcYUvu4pSVv4ZGYNSM68PHWMSFbXz38F7453
	yZRO+NhuxHwlD8gUfsknJ3qeRZ1Ea0e9hhV2rb0eDhJ3inJ8t9sPUVqWK5H2uj+GlWxh
	fcXpvFtOBkJJUwHR8e+uVF+6h3hddbwNJhLRLY6eSwpW17xwUpKw/D+IvqS8UQF+Mwgo
	AGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=OwzUVG2AXMBZYW2ARlRHa1BHhylCZfEqGG+74JRCoMQ=;
	b=TBeTB8MboU6SMwvxpSw8+lxA77dubgg7JMi+9TutaSy7xAoepXXXSAQsophrAKt+KP
	5vgLuRFelf1Jp0LKLpbL0HgOMOVoA6EUw4E6fqrHEd6lxESidi1DBFu5pt2rk7VYtcRS
	QS7VcwQP2xPaDcveAaohTkV5QqokSYsu+2MYjomdhdTJJsyaLFOvIi0KL3LXMZA7P4Ci
	AgS591b53byLBCpZ9RQsDXwCOVv2noYsWuglGbdP2zUYHCsDf4DL+X6/qBTZY0GiEKsQ
	wSDrtAhtP+b9VqqGRCshyRzCGPBlCpcFYjwbbp34C2Mjz7Ws1N6aA6DWbfkSPV4yuF23
	wsOw==
X-Gm-Message-State: APzg51DQvrCqrVJDwRDb5g4uedFU9dV+pGDPaUfmh3kwNkIq9At3tiOi
	/sOivtnQOpBeHYnQohI8HGXy40Db
X-Received: by 2002:a1c:1510:: with SMTP id 16-v6mr6172582wmv.74.1536363757654;
	Fri, 07 Sep 2018 16:42:37 -0700 (PDT)
Received: from [192.168.43.186] (dynggepcrak-122-5-66-105.inwitelecom.net.
	[105.66.5.122]) by smtp.gmail.com with ESMTPSA id
	z21-v6sm5950423wmi.29.2018.09.07.16.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 16:42:37 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180901124639.19735-1-luc.michel@greensocs.com>
	<20180901124639.19735-3-luc.michel@greensocs.com>
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
Message-ID: <571adbe5-9f9a-f11c-8b0f-55e5fb01278f@amsat.org>
Date: Fri, 7 Sep 2018 20:42:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180901124639.19735-3-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH 02/15] gdbstub: add multiprocess support to
 '?' packets
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
X-TUID: AIOWJ72Mdfgn

Hi Luc,

On 9/1/18 9:46 AM, Luc Michel wrote:
[...]
> +static char *get_thread_id(const GDBState *s, CPUState *cpu,
> +                           char *buf, size_t buf_size)

To avoid confusion with 'int qemu_get_thread_id()' from "qemu/osdep.h",
can we use another name such gdb_fmt_thread_id() or
get_thread_id_string() or better?

> +{
> +    if (s->multiprocess) {
> +        snprintf(buf, buf_size, "p%02x.%02x",
> +                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
> +    } else {
> +        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
> +

extra newline ;)

> +    }
> +
> +    return buf;
> +}

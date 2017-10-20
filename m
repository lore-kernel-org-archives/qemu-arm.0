Received: by 10.223.197.9 with SMTP id q9csp7475542wrf;
        Thu, 19 Oct 2017 20:27:02 -0700 (PDT)
X-Received: by 10.200.7.74 with SMTP id k10mr4990619qth.279.1508470022391;
        Thu, 19 Oct 2017 20:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508470022; cv=none;
        d=google.com; s=arc-20160816;
        b=0pASSjnw6892u2boRjJpicIW4Iz/7vQHQt9PzbNIlVhdHO53xKX2vVPpjGR148rdzz
         NC/1S3VW82KbDx2CWj8OhdKKq0kSNEp9X2Gs+1fak+/C8qAltNKDcKHODl65Q2Ssa5Fo
         TrwstxoHHS1jkMBECf74dD6jbRTIZ4xD7nvT1Rt3zaatLlAjBuRLJyfcZGEpeip0TBMR
         L8fmA5j5a2ZORssugFyLTTC9A9er5DJwL7+BjBECw0QITPslg9NroKd63KRBAiyAbZOU
         TUfSvYGwoOvxgN9X6EWE6UlSonH0HX0IkcFLf7Is0NWWana50o+Wm6qGn5iyP2bnlCVk
         fXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=A3ruwMuaqkQGCTbDh2AUn4tPngOsXZnxX3hMnf5fRfY=;
        b=V9nuPLZvgEmCgmun4yScpaEFOD7uPN1eYZJ5XoZFm9PVsPzqrXttjc/6IC1m1iYz/Q
         DvhPKvj1CHpdL8D9Tmd2XZ66/Plv8tEdv/k16Rr2LOMOJAteMddT9cL8ZDil1fpAgopC
         V87YxaW46rCMMU5826bc+4OinMhbQelPfPp+smVVfFj78BREJRCfXc7Upk56R8tVikOh
         7H2hTWE51SzL/gW5YXf4EY5fS2NGjxCEQSzcgsoPFjTIrIgbHYUZFpV+FyNbgh8A0nmD
         RsR+a8ac/ghuDncCx4TJb9us0uk6ACYVW6+iz/Yy/gFbbtXv4zMzscRtEG/DBq8KbvTk
         qTvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P0FWsqrk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o54si3121qta.404.2017.10.19.20.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 20:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P0FWsqrk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Nxc-0003l2-4N
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 23:27:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NxR-0003iz-9o
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 23:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NxQ-0001zM-Ac
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 23:26:49 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:50258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NxL-0001lx-QF; Thu, 19 Oct 2017 23:26:43 -0400
Received: by mail-qk0-x242.google.com with SMTP id o187so12878060qke.7;
	Thu, 19 Oct 2017 20:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A3ruwMuaqkQGCTbDh2AUn4tPngOsXZnxX3hMnf5fRfY=;
	b=P0FWsqrkrq65VmoX9+/3DaSTB6yF8/yleAtFC2GLM9jPYzLeqWtCxkP52958nFBTiS
	F9YGmy20cFIPwlFxDOfFCvUHgcMJNYsW0sDps39AQpYRbZpBMBTEgf7hU04+JvEqbTJS
	8zCDXS+68J5zh7qolC+TbEBNSKVKYeQLMjk9i7VXL0hgAnGX5bAbo+Ee0bfEVBeWbAsh
	rYE34ZagM6SShp7c8MgPOMEEbHxxx/y9DfEXiUAstwI9AVqx76LbfCRR6eosXrNeutjW
	PobVtU2pZod4YZlccPkhvnpf2JHviQl0FWtO4nsymoRODNVJwLmYEz1+W9JVBWojmmPe
	fAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=A3ruwMuaqkQGCTbDh2AUn4tPngOsXZnxX3hMnf5fRfY=;
	b=XZnoe7haGsCQdFXNv000f49ZZ0aaLfs6G79L85YRYTuX94wDGVqo6ZvsHnOOl1tGtC
	vQVppG0NEzSaN6UBfueYx384Iiz+yWqaslg5N2s2lxnabqTdAddp5ACnEBObuv9sddTw
	89N58UkfrPBPdVgGoP0bQ4MgRbvTb8Jcud3YAOlHFvCoK2YPsBxsFuWev2h3QJq52rfM
	scYDAC+UZoJYRj28mXVsMqKecqdCC8DzYp8e+OsaHI8q/K+XI+2IlaiRa/AE+Xz+3BUb
	k6SWsjwvGaCnjtRQcvqMVPD4O/8Ev397YLH+a4sW5AE+p5X1KXP4bxXaa5HM4aNWLs7o
	1aYA==
X-Gm-Message-State: AMCzsaWZ8IMGTRYTHMN7d9rfJuZfQJSKmvFiODhVR4d9rqK0t2MnL01a
	tMVksN8wAXkmOwvMrx0br9U=
X-Google-Smtp-Source: ABhQp+T1RXh23wAQey4CMd36+6r+LXJ5akDTBNcbXkWMuQWEOFR73q27hRGrv3IIZBadP064+qAnBA==
X-Received: by 10.55.26.91 with SMTP id a88mr4665464qka.11.1508470003276;
	Thu, 19 Oct 2017 20:26:43 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id m50sm12555qtm.31.2017.10.19.20.26.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 20:26:42 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<9aee5a95c03d6cb4f4ba6359828809ceab535bfb.1508390588.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f0c582f1-f524-1719-637f-362a8d7483fb@amsat.org>
Date: Fri, 20 Oct 2017 00:25:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <9aee5a95c03d6cb4f4ba6359828809ceab535bfb.1508390588.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 46/46] target: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, armbru@redhat.com, alistair23@gmail.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CC6CFonBPs4X

On 10/19/2017 01:18 PM, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
[...]
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Acked-by: Cornelia Huck <cohuck@redhat.com> (s390x part)

I was not sure commenting after the mail would break scripts, but it
doesn't appear to, good to know!

http://patchwork.ozlabs.org/patch/828257/  <- parsed correctly

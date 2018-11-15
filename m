Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6692407wrw;
        Wed, 14 Nov 2018 23:33:03 -0800 (PST)
X-Google-Smtp-Source: AJdET5c0qgrqUozZU+H8KdXoFdI5GlOilOEMJL8Veypr2U3iWOQfxbbECPXz6AP2ee7wOOVkzCVa
X-Received: by 2002:a0c:b8ac:: with SMTP id y44mr5094484qvf.76.1542267183758;
        Wed, 14 Nov 2018 23:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542267183; cv=none;
        d=google.com; s=arc-20160816;
        b=x/Zcyro/KqQjpZV8joQL/7Yh/c0wd9/ojvKuGd3g53ohXkp0lSaD+F1mKXx+ozlT05
         6T+vZB8CmAIQW5KjwzgUQgAHht0mesA/b7U8qhPFfr9Da6zU+x1OBDXtfL5Hm7m8FKLj
         WS4OVNcwS2Sxq5+czNge+nGBlCr8v3hhMZBj5gW1dn3vpSCuXEgyg9qjQBpAgTzYV2RU
         T2hn5Qol2OfyAOUpknJlxrK6ub037aO5MtHVYplzcLDcN1lnzr2n2F0YYKhgUmWqRT5T
         vE9TTxMfN3yZN+2cg5nfZG/wGPOnJrtTLWWF9GRhQcoNlX7ZfWN6B5rJRACmQfdIV7a8
         96UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=nN03QNuyjHuQ6WdydwMOCAt7qY0S5pxxuMc4K2E4q+U=;
        b=h3cdxIm+KiovcyEEQXvzzBNcLqZx54NVscpXXovhYE1mQG0eG52Zy6e7UDo8/Gk4M/
         Hd7TQ1TnAoV3zB/dLHZ6sp3ykTPfmNwTKdv3lnYlYiZax7ExdiCZj9RoKx9OKIOnKgSn
         RiEF3PB7dpeHq76TnDK4DUIXCEjKFXgICLsK3f6Cilhoaww1hX6L74yhlEEOspfHHcwO
         rkPgHUfp0CFa6GBcwajKaHZXUt+Gz40EAp2K/TbCmZvl7N7FYfUKdI/KQSvoXL+MYt0n
         TvQfwc2teMPOihc5QMmZ1QhnSB+JUx33irjMQdnEKCrmUk+V/OppqwrW5mlVUPSHVShs
         dFlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GVDyoz9E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si3114239qvb.136.2018.11.14.23.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 23:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GVDyoz9E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36655 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNC99-0005IZ-4Y
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 02:33:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gNC90-0005HX-AH
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 02:32:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gNC8z-0000HL-Gr
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 02:32:54 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1gNC8v-00008a-3F; Thu, 15 Nov 2018 02:32:49 -0500
Received: by mail-wm1-x341.google.com with SMTP id 124-v6so17866225wmw.0;
	Wed, 14 Nov 2018 23:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nN03QNuyjHuQ6WdydwMOCAt7qY0S5pxxuMc4K2E4q+U=;
	b=GVDyoz9EJsLX8N2K0NmKQRFQWVlO9fUlpgCOMSdL0wQkQhigtmBoCQk76tMWi6K8tH
	kT1BUdw9uI/IF64DQq/KwdHtcRhffhc2r7OjsxkRAnRCmWf6nSOlETFXvlLOm1nxXjk6
	podDDBMQ8E3IDB7TD1YOUGGrXYH89jG79JAxXLf975IB12o/1d7/qy3tgWeqSbEt2SqW
	J730Ja9VZi6nGdENsd4SfsQNl+ypPYLt0joRmicwfcr9iIBQaB5jTk2fqk1mYp6oMyXE
	Ze2umMfTOoQEUst7ooOUjLLUfOUZF0N+K6qEnU1k/gorI0d/eecpwruHFcc5ZZWiDUk1
	TcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nN03QNuyjHuQ6WdydwMOCAt7qY0S5pxxuMc4K2E4q+U=;
	b=M2nyo94SBrypAr67qW8ukSkypOBHug9hcfXfms+oCxuGMKqC69Ms0ih3ZMtIqlqBCC
	mb9Z4XLHSTnbJqgU6UbqC/sHYZypwMF9WUSKWg2dhctIz0v2O5MXC0XCWJ7pcYuowkhZ
	djd1m+DZMsFSZnbeqDmRo1zxC1DIOMFAWHMmjj++WL8ixmm1TSnhjzGdIpoDLhqnJzZB
	cShJChFcUIehRWL+eFKewORs7UYtHn2zKq0CP+XQDbjgCHGU5RVAvqLseBJN/FYXVxhw
	DjBog51HVoXkZ3524PpbvPZO5G/Yo60QVcS2ABXif2DBs8mJye9tstGQCiOp5QTa7Ww7
	U6kQ==
X-Gm-Message-State: AGRZ1gLWQmabK9/P0gC+UK11CMre+wruA5yY9ajzK7qsRJk/33Cnk/cm
	iU5MwC1fYhzljAqlRQ1g/uY=
X-Received: by 2002:a1c:c545:: with SMTP id v66mr4470580wmf.132.1542267163965; 
	Wed, 14 Nov 2018 23:32:43 -0800 (PST)
Received: from cloudburst.twiddle.net
	(38.red-37-10-247.dynamicip.rima-tde.net. [37.10.247.38])
	by smtp.googlemail.com with ESMTPSA id
	j8sm14215590wrt.40.2018.11.14.23.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 23:32:42 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-6-peter.maydell@linaro.org>
	<3ac12d41-2095-f0ad-db1b-0e3ceea8f44e@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <7e05e89a-6eec-257d-03af-78a2d2b60628@twiddle.net>
Date: Thu, 15 Nov 2018 08:32:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <3ac12d41-2095-f0ad-db1b-0e3ceea8f44e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] accel/tcg: Return -1 for
 execution from MMIO regions in get_page_addr_code()
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //WcoBkRbQAm

On 11/14/18 6:19 PM, Thomas Huth wrote:
> Program received signal SIGSEGV, Segmentation fault.
> [...]
> (gdb) bt
> #0  0x0000555555addc68 in onenand_read (opaque=0x555557600600, addr=98304, size=4) at hw/block/onenand.c:612

So the crash is an off-by-one on the line above:

--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -608,7 +608,7 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
     int offset = addr >> s->shift;

     switch (offset) {
-    case 0x0000 ... 0xc000:
+    case 0x0000 ... 0xbfff:
         return lduw_le_p(s->boot[0] + addr);

     case 0xf000:       /* Manufacturer ID */

as the memory segment has size 0xc000.

The guest will now eventually crash with

onenand_read: unknown OneNAND register c000
...
onenand_read: unknown OneNAND register fefe
qemu: hardware error: onenand_read: implement ECC

CPU #0:
R00=00000000 R01=00000000 R02=00000000 R03=00000000
R04=00000000 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=00000000 R14=00000000 R15=0001fe04
PSR=400001d3 -Z-- A svc32
s00=00000000 s01=00000000 d00=0000000000000000
s02=00000000 s03=00000000 d01=0000000000000000
s04=00000000 s05=00000000 d02=0000000000000000
s06=00000000 s07=00000000 d03=0000000000000000
s08=00000000 s09=00000000 d04=0000000000000000
s10=00000000 s11=00000000 d05=0000000000000000
s12=00000000 s13=00000000 d06=0000000000000000
s14=00000000 s15=00000000 d07=0000000000000000
s16=00000000 s17=00000000 d08=0000000000000000
s18=00000000 s19=00000000 d09=0000000000000000
s20=00000000 s21=00000000 d10=0000000000000000
s22=00000000 s23=00000000 d11=0000000000000000
s24=00000000 s25=00000000 d12=0000000000000000
s26=00000000 s27=00000000 d13=0000000000000000
s28=00000000 s29=00000000 d14=0000000000000000
s30=00000000 s31=00000000 d15=0000000000000000
FPSCR: 00000000
Aborted (core dumped)

I'll note that fprintf at the end of onenand_read should be
qemu_log(LOG_GUEST_ERROR) instead.


r~

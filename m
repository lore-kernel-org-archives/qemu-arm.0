Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3867165wrq;
        Tue, 10 Jul 2018 11:19:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc0CJ2w9W9z7frM/3SywTOyh7LJHF2LL7vnUG7VQSIt8dEo3HTtSfROYgUu7+hRC7GlW112
X-Received: by 2002:a37:98c1:: with SMTP id a184-v6mr1021325qke.328.1531246781776;
        Tue, 10 Jul 2018 11:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531246781; cv=none;
        d=google.com; s=arc-20160816;
        b=dwlSRmRFRyk5/NCYUawk/59wQS7rtfprP9iaAW/qoTd8ikmCGGo0IgtoH49bdbDWxH
         0P9vntlPutoPgt6XRinD9Q/vfPH9Em4xn6XdFPAbjA4xFev6DyjLDaB7XMFJ+egNl4ZR
         2L3GaMljU6sPgeF+eft812ykuJc7wpNF4/u4/AJdzmO32qbmvXFY1+GHU13iSrQaT5Wx
         JNODBnB3NSvjhoul7PrLcMXtbcRcma5N02pp8wQdzWUGimIOWsGpzOG5lWALDKOP3SO1
         b9PoOUErAaoRH8/CqgaVQERi1oeCI9VkNYk2YuBTWl6cuyjASamhavouLI3GvfTqJcUP
         tr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=fb0V7qKvdFBb++xIJbKyOhWAUYU/JNlinj+tNXLI1L0=;
        b=WZ8oAWfQAlD93olKgxKnEisAlU1R5dDEDfwHPP531ZvCuR+Ms88dpHlydoluJvJUWF
         sxM24RvNG9kkEyRPg6k2ZqLMwZIY32F0B8URQdeZnpxcTd72M6qOYBvysInXKw3uYnQc
         5JkBdbnV+dVsZNecoejYFlp9cwQevHYN7YjSVdwz7QHkGdmSYmc+9auaLkox9715Dua1
         3Y2H+CM7lT/nj7pzd3LQNydF/lftpju7pP7s9T1VNPKI1o8aR0Zy72EICkgdw+FcyTlH
         CWoVFfCWvp+cWl0kcwK1cYKYlm9VtG6vFX5VZNg7dfXCxn2tcHWDmbadHr/F5LgKfCiD
         XiUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lWo1AtCR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2-v6si5018889qkl.233.2018.07.10.11.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 11:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lWo1AtCR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcxEj-0006Iu-6d
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 14:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxEJ-0006I4-Cy
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 14:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxEF-0007Ve-EM
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 14:19:15 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:45659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fcxEF-0007UH-8C; Tue, 10 Jul 2018 14:19:11 -0400
Received: by mail-pl0-x244.google.com with SMTP id a17-v6so2132800plm.12;
	Tue, 10 Jul 2018 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fb0V7qKvdFBb++xIJbKyOhWAUYU/JNlinj+tNXLI1L0=;
	b=lWo1AtCR1wR70rdzXcM4ElVCpa2e+mpzRnjNAj8C7JOeevrAaMGEYwf5WYJfFZypVy
	Oe2DBjX07UncszlrVRrgC7W0O3k5RvpnLkMke3y8vbWn2TY8IEU0x8XHa1leWpdAvE5Q
	J9FRgYnkrTAkc6oNapORNXsRFfh4t1jYAobusIgKDsiigK1HDjOk7iaOEObCnI3sDQKz
	lEfUhLXddToo2NcZ+WTVrn93QJscA2dlrZR6wK6hL/fwFK4zgGIcyfO0ebEYDCV/aF2k
	3RY32qvR5tHk7PqGjJBFdHAz2nG3/itpeyon4xJnpjIpus1eSVNZCTOjQIkae86Mtg4E
	wBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=fb0V7qKvdFBb++xIJbKyOhWAUYU/JNlinj+tNXLI1L0=;
	b=O+YJvQ++MAyTz7pFbPdhjg3ebVpTIQPgcoWXdpRQ7/aUD+garGxczVTK1bTRCJrxn9
	CZ5dO7s+3I9h5G9HuSL0gVhPtCwwprjeCSvEuPlHawF6ujrJTGiR8g3rqDCxZVLxmjNF
	WVxH2Y1JMgrKB0uC2rbmZbugVrBKGVXlxFJDpOVmMG4CM8I7a7LwCfOThZ1djgTvXp1Y
	GUJSAmebQDtac6FS69esRGOG4GciNX8uriC69NDcY3b+WdoaSqJMSbaTuUxm7+V3f7wL
	pHdkW+RRbZp6K1Gwu+sp/HIUTFPIdpL4F9jJShVgtLL2e4XnnSmT0t7PJ2ViohLyxdRD
	X4VA==
X-Gm-Message-State: APt69E1oE8E3GrmdkWojAXBJqeYWVXIUxfHouzAP+n9E5CppbvFNwj3L
	9dtb4OOSXbZgx0FWilfUZB0=
X-Received: by 2002:a17:902:9345:: with SMTP id
	g5-v6mr24774739plp.10.1531246749971; 
	Tue, 10 Jul 2018 11:19:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	r1-v6sm54224693pfi.17.2018.07.10.11.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 11:19:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-2-peter.maydell@linaro.org>
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
Message-ID: <48a986e1-acd8-ce94-cf2a-763d51878ad6@twiddle.net>
Date: Tue, 10 Jul 2018 11:19:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-devel] [PATCH 1/6] accel/tcg: Pass read access type
 through to io_readx()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNV65xGTu8gR

On 07/10/2018 09:00 AM, Peter Maydell wrote:
> The io_readx() function needs to know whether the load it is
> doing is an MMU_DATA_LOAD or an MMU_INST_FETCH, so that it
> can pass the right value to the cpu_transaction_failed()
> function. Plumb this information through from the softmmu
> code.
> 
> This is currently not often going to give the wrong answer,
> because usually instruction fetches go via get_page_addr_code().
> However once we switch over to handling execution from non-RAM by
> creating single-insn TBs, the path for an insn fetch to generate
> a bus error will be through cpu_ld*_code() and io_readx(),
> so without this change we will generate a d-side fault when we
> should generate an i-side fault.
> 
> We also have to pass the access type via a CPU struct global
> down to unassigned_mem_read(), for the benefit of the targets
> which still use the cpu_unassigned_access() hook (m68k, mips,
> sparc, xtensa).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/softmmu_template.h | 11 +++++++----
>  include/qom/cpu.h            |  6 ++++++
>  accel/tcg/cputlb.c           |  5 +++--
>  memory.c                     |  3 ++-
>  4 files changed, 18 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

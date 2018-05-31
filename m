Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5375767wre;
        Wed, 30 May 2018 18:27:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLQ9YL6d59kG6U9eF/5Tr5QccviYjK0K08gzfwcvmidBqE0jaJBC46hRBwEJCLcRWM4FF4A
X-Received: by 2002:a37:8ac2:: with SMTP id m185-v6mr4602156qkd.356.1527730060440;
        Wed, 30 May 2018 18:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527730060; cv=none;
        d=google.com; s=arc-20160816;
        b=fWmqD6ol8z3WLYVWavbed+UQlRTjRdMCbhWFAirm8IHjZi4EcymU0qMbhBPt8tCRAE
         sBxH5cRw4tZIiCIkoXI2yCRAAGUgUNMmUV2lk4VVJfT/zWan/3oTtcanLbeOotgcpKa3
         Y1ZRXzrHfUm2uUlifyo3Ppa76kzdDUwk7ARPKYDd2V1pEmsSF+YYA4rhu+h2D7ekwcS4
         iTA910wPDL0V28qw7TX1GP+7O8HUBkvwVxjLWA6jkkfS2mpjBb4WbhWYeLJQT1eRaQ0F
         2XPDKzzoadKbbaMlxIobYUDej9vAVQP7zsxvqe9cM6eMo7F5Ai0L37E6oHPhntNtJF+K
         0rUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=LdJizaw5fuqZwkH21KO4zrsR0F5sDMpYQ0v9iYW8888=;
        b=hEt6tcAdrBKwSiwKkHS93KlOpPQVFbmtSQMJXV3fWyf3+ju3i5wJvIfioy2/Y3SAPr
         6N7u7XRKS2STVFXUc7TZP7Snj6fU1x0JBKJMEc2OkzK9iCb/lfVRCp23180D3xw9uhIn
         hLf4sKF692b5wwM1DZ+XSBmejUAa/hxf7+su0Is5F5ou8TrRfZ3IT7oieNcAVdDfSHQG
         EAEtQYE7s5hAB/LR10ALg/arypTExdkn5NlTb1yUfwC/BrFrTv6AAJhHDwdGmFmUcCM1
         J4L/nUWoB6abwLoQ8iMPNRpBWU2DabzlG/OrSt/F4iQtAw4ZnBCsM/YDIebm58WXhvCT
         tAfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o3L0Zj+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11-v6si3128315qtq.38.2018.05.30.18.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 18:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o3L0Zj+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOCNP-0007ic-Td
	for alex.bennee@linaro.org; Wed, 30 May 2018 21:27:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fOCNF-0007hG-QP
	for qemu-arm@nongnu.org; Wed, 30 May 2018 21:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fOCNF-0007Fg-1K
	for qemu-arm@nongnu.org; Wed, 30 May 2018 21:27:29 -0400
Received: from mail-pl0-x230.google.com ([2607:f8b0:400e:c01::230]:45806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fOCN8-0007CE-RU; Wed, 30 May 2018 21:27:22 -0400
Received: by mail-pl0-x230.google.com with SMTP id c23-v6so864762plz.12;
	Wed, 30 May 2018 18:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LdJizaw5fuqZwkH21KO4zrsR0F5sDMpYQ0v9iYW8888=;
	b=o3L0Zj+KL7j0L2WEv4JTIfvyCj+fz7eB45hMZIM2n7RjmevQfc6T0K+WF5cWt7cQyT
	6R539yEFwTLbXLDhVWZB3js+q7JvqS30ZHC6gXFneu0Sok/wxF/z+P+/0tJpZF8CIjqX
	j/wcJI5epiy0IbRHUgQ7mrnxI4B1R28yTKG0xe99SeEG+g/mrrsO4Wa3kTiUve5njTjV
	M1w7/js1/U99P1UCCHFPw0yOirY6TkdBuv6Q41A58/oV4o0H9lcb/Ec32r8XjK4cLn4K
	DT3F0otSlneUCDwaFy1Gnr8cb/A9r4UW+7yZBxZO0+TINCB5dXQ8gvnW6gbojMMXyYr/
	qQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=LdJizaw5fuqZwkH21KO4zrsR0F5sDMpYQ0v9iYW8888=;
	b=kXxB3QLhOqw/MXCK5SC/zwLX/OCAYGDAgOhx95pyxxNOGZ87BgwpUXHP316kh1xa2j
	JnvzG07cn2lhA4lSQP60PSOE4JktYRArbq6n4nvIBtxflBVWSZd7/Zw9xRAVgxQW01QN
	tGnC6HX3+q4Om6eZjKgsGAYXgXMD3HGGRlxoXWd/8n+XGPHi8LlYlSQuaW/uSjQE0ZGK
	v6UhUGtM/qyJrWxeuANtWC03aVvC2oCFmifE2h15DrkHSAeA/q+umgI8Df2QIlBoOq5x
	UlGxLG7g6zj1RHS3gwV7wz4q8+Mx2qd3WTmOTUkS2ZUQ51TiZlh0yM/4TaZziYOxx5+I
	AU1g==
X-Gm-Message-State: ALKqPwcnVmZVKH+O++PoeRV31Dw+kTOQRoQoAz9IFHC9TwxJ1RtiydPh
	hbm+BhZ97MJKKR0sC4kt2GBBqnCM
X-Received: by 2002:a17:902:8602:: with SMTP id
	f2-v6mr4969746plo.5.1527730041346; 
	Wed, 30 May 2018 18:27:21 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	b29-v6sm65607647pfh.155.2018.05.30.18.27.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 May 2018 18:27:20 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20180531011321.3119-1-richard.henderson@linaro.org>
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
Message-ID: <0fb6ee09-59a9-a416-ae36-8193f3d7962e@twiddle.net>
Date: Wed, 30 May 2018 18:27:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180531011321.3119-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::230
Subject: Re: [Qemu-arm] [PATCH] tcg: Pass tb and index to tcg_gen_exit_tb
 separately
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FN3n57M5uBvU

On 05/30/2018 06:13 PM, Richard Henderson wrote:
> +void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx)
> +{
> +    uintptr_t val = (uintptr_t)tb + idx;
> +
> +    if (tb == NULL) {
> +        tcg_debug_assert(idx == 0);
> +    } else if (idx <= 1) {
> +        /* This is an exit following a goto_tb.  Verify that we have
> +           seen this numbered exit before, via tcg_gen_goto_tb.  */
> +        tcg_debug_assert(tcg_ctx->goto_tb_issue_mask & (1 << idx));

Ho hum -- #ifdef needed around this statement.
For some reason goto_tb_issue_mask is itself #ifdef'ed.


r~

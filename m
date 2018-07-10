Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3879582wrq;
        Tue, 10 Jul 2018 11:33:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdZYnLb4tuZ1gcUV0u6wclrRaoLY3wS3VhyAm3GmGrfXJfvvrxNHhf9JcKT5kkd7JbBOvQG
X-Received: by 2002:ac8:31e:: with SMTP id q30-v6mr24565795qtg.255.1531247604422;
        Tue, 10 Jul 2018 11:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531247604; cv=none;
        d=google.com; s=arc-20160816;
        b=bf6O8Zk4nwAVCQ4NwjQM6hSHFDsXbBDOJO7A+AhvuyDhKmyK9ss008X4Ch0zak8Yog
         zsFvYeoarhA7c1Z/9vTOmKa2v8zoBXax6WBMVWpDvudK0gCSYhLa2oy9QeC+OvfACsSg
         k2CGcqUfHGwneQQCLx1BEuUvr1niQigjQT1GUc/NhUJiXhp5jL+6Xw63hJ+0sAvL3Y0+
         R+9jYV44vfHqLqqeCH7VjkQ8wfXVhXb9gw0Xuezdye/+A3f4AKhFiRFL/R9PmtVJ/n9H
         HvBHRLtwsFDRGmUhdTVECRNqePGXmG4/nsy7pRSWXqluAeWU8/5atkmJWhuOy4rhffVj
         CZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=G97oioVIvnOMZk865bUk5pxSnLg6jDD4wkaZtCTZMfs=;
        b=OPjhvAvx4mINxbBKZqyGtfwRtnupwBeATcfqnjkRy8MDlurmhWy5vCOgE0+jb7nlS9
         pDOnLejjId6LQyqPCCl9jaD6UhSaDuq23xpmZEcNnbqT9wM8RNiuNzlyEOxbz0MwFntx
         b82obmBhhZ5JlF3yIPGIZ+kCWIHnCT6icrW9rbJYUG8EqUsxyeTx0UDtmfnm4IFvsX2/
         n64RUMhaFvWIGjTrQULaY6/rkI5tbw2pqV2eFpM2kldh4pO+Pif2C/xAaegeI/jWDLKF
         XHwuvRChSxeONJ0q+fbUSuvaet5RjpfPJOmfOWdkGOIK3KbsFEgaWphxRhuXAti7xuRz
         LDAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CQk8753u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61-v6si5823365qta.266.2018.07.10.11.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 11:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CQk8753u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcxRz-000628-RK
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 14:33:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxRk-00060S-Ez
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxRj-0006VB-Lh
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:33:08 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fcxRf-0006SK-CG; Tue, 10 Jul 2018 14:33:03 -0400
Received: by mail-pf0-x242.google.com with SMTP id x13-v6so6734517pfh.5;
	Tue, 10 Jul 2018 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G97oioVIvnOMZk865bUk5pxSnLg6jDD4wkaZtCTZMfs=;
	b=CQk8753uIA13yonHyP6E4EIz1JI/e9htiselcIk/00+wQ3yNLC3DBimpItXUz2r8zW
	OV7tKRHemH+vMqffeahSJbwWucGlbmjboAOCJqVPI+Qw84H+rEb5KjQSeud70O/qtoyP
	83Ow3DjBfT9EB1qJO7HAOxAW6Weu9NQUy/BuuMAskXoODDpqqPNDscwGFwEVY3mTXXoc
	pT2Zn+1z9+8Yfvf4NpqTrUp0g7BPuYYDmwyQeERoSssVI1LKjw1VL9e+3jBkAQgaBYXR
	BvhCHz8sjezlnxEoSNvyU2tGgFyZuyMZAXtoaMTb4N6qzvovn9ta2/9k1SOs6JlFaZZ4
	+sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=G97oioVIvnOMZk865bUk5pxSnLg6jDD4wkaZtCTZMfs=;
	b=pwh6KBGEYffmvXdQvyR6Qwx+Jz6aZN1B2soM6Rq7U87SUOR4321sdf+n0Bl94vGH0y
	Pi24fk3GSxM8U8Ii1EpzWFYXL8BaCsji9yRwFLe3flIXzw7yDzBqnnTDLOQ1jCXnkYbp
	jAzzviQ3j2VGDVMindkaDJAzCgJpDk1Igo6b0UMEJCCxQDNsjB3GqaHE4Rjwv9u1CWp1
	PXibToDL6IAi6uqTewPApw+w6w3bbQQ5ca9/N0pTw4ntuC2NOXrtwcmSXoY/t6euNICz
	LEoL3bR1aeh9KdzOv94/YkLgLbKSoae/vDbLdblhnkpWs5qYMKfoSmdtCdoY6m3LluUT
	mjOQ==
X-Gm-Message-State: APt69E0O04GlZo74cQUrtc6rMFJOkUONWP4N3qNXn3yrVAy0pTLtA/Ft
	AIKqaE4KTD98WC1BGI4g48w=
X-Received: by 2002:a62:998:: with SMTP id 24-v6mr24928058pfj.99.1531247582394;
	Tue, 10 Jul 2018 11:33:02 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	c131-v6sm22543881pga.69.2018.07.10.11.33.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 11:33:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-6-peter.maydell@linaro.org>
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
Message-ID: <09c87542-9178-6277-85d3-6a5830616e88@twiddle.net>
Date: Tue, 10 Jul 2018 11:33:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [PATCH 5/6] accel/tcg: Return -1 for execution from
 MMIO regions in get_page_addr_code()
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
X-TUID: LSI0FTT60HqR

On 07/10/2018 09:00 AM, Peter Maydell wrote:
> Now that all the callers can handle get_page_addr_code() returning -1,
> remove all the code which tries to handle execution from MMIO regions
> or small-MMU-region RAM areas. This will mean that we can correctly
> execute from these areas, rather than ending up either aborting QEMU
> or delivering an incorrect guest exception.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/cputlb.c | 95 +++++-----------------------------------------
>  1 file changed, 10 insertions(+), 85 deletions(-)

Yay!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


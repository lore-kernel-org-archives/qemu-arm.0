Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3880609wrq;
        Tue, 10 Jul 2018 11:34:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcFOZ2Lpz9Qm9F9RT1Y3gHePYm9pdMCUrt9ylSM9hE+li6Os+nrTvKl19LQFYrIozxH8ONF
X-Received: by 2002:ac8:3864:: with SMTP id r33-v6mr23529230qtb.24.1531247670818;
        Tue, 10 Jul 2018 11:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531247670; cv=none;
        d=google.com; s=arc-20160816;
        b=LlHrWPYu9pEnW9btzQR0FmIuiAUKLMmxG8oQNYXfYGZNRY7UFmvqovVXIsHsANKeV9
         UFu2lWTVFW4MW4rvG9feV7L/+8gtWiUTEz8XAbpRnFeGVTNWIodgvGso52hm4pY9wnU+
         x+/f+87QD0tyc8Pp0k+z/gkBNCQ1Mny6WUl1yyaN9HR6Sqkbbps+6eEgElhhltypCy6U
         RmSATaCpbE6Sf48RtEMPf3U5UEXBK4IanukxaA8821OhT1D8sygboam31Cob2qFQC65x
         rZ7X3ZSqR5j0MRaoMsUSz0+zgZiV4q3qYyVq0rY6IIGCcMBKA+IvID6JoAOfWwZwOitR
         NabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=wnJUZfGm6JuVwaVsg81AZBB+VnmroXReiG6jsjVs+WI=;
        b=QJzyVKkw5zPjyFMbHv8kCpgacLpcMobtq1ltRoi0WEhJtzBRyd1QPiHPIbVt4VUfBn
         CZ71Yfi5upE3Mwv6EITU5Fo6Xk6sP4v4Grjp061LfGt88mLkQSlX3AgSh7KK3pqaRun6
         4G0TvLFD2ePt0vHMiTrl/P7x4ydCMChP2HXX64u8g0jxrKhvo5bWXwaRvCgyF7oHXC7R
         igekriKe9WizLFL1RuvypP8L9bjv7hr+pmDiLnsfdkjIiJm5A9DVKEeax2x3B0FL0XWL
         ZwSxlbgw4hxncdx0BTji20yL54p7CxWpN1YKBV14wCjebx3Lee2hnxW+1PczVWmd9zU5
         PVTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OPJnsKwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b184-v6si5315207qkd.69.2018.07.10.11.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 11:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OPJnsKwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcxT4-0006oR-5v
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 14:34:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxSo-0006lJ-Qu
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxSo-0006tK-3w
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:34:14 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:39402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fcxSf-0006of-NU; Tue, 10 Jul 2018 14:34:05 -0400
Received: by mail-pf0-x243.google.com with SMTP id s21-v6so16682102pfm.6;
	Tue, 10 Jul 2018 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wnJUZfGm6JuVwaVsg81AZBB+VnmroXReiG6jsjVs+WI=;
	b=OPJnsKweKnwWI8j/BFbTyr18ixdGvLJTNMP4DcIDBNXPi5fMbXMz0K9GltV0PBYZQX
	tEy9tILdXNGm+SxAkVLQFsJHL/EK6kstByjsM+wu0UHHROH6G2bhvRg1UTWzvDBY4CnF
	0x5OlNuTNrClUoSM6LYl3nrRnU15aeHz/jXoz+PaFfbGouhSswM4u32onKvPVOph+asb
	hHFm4XYI+UYIV4LIj6puQzapFh0mzujnIYH1m5A8ENy1LN3HwRYkjNKc7l4Oef/5VdH3
	OUdxEZgHZqFq8W2bJiNFRy6/C/6z8HOyJ17G2uPEKY/XYxPDVySVLNnZ6UreS8bLwQRv
	vq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wnJUZfGm6JuVwaVsg81AZBB+VnmroXReiG6jsjVs+WI=;
	b=bOpGuVjO5c7owCkSynHmvbMyc2dmE5mGPsPjbefIFQr6NZsAJuqmyNFEfjMXh+pEmz
	zERJ+HBltznJJQdQccrnQR7gNxR7erozRl7OU1x4JvuCozzRP6ukXPJ0rq8f2bLaeoPv
	F1xZqaveD2+lNoILEFcILFa7s4Ar0qnKTonwIJZhF14AKc4PJX8SUd8E/lIhIY1JTndM
	5guK9jiUNpZH541jMiJ7gG8LKEKJUaJNdd84ta4cehUIFvgfT3Qwss2/3tMkFSMPM4gr
	3PFh5cRr1lmQsHN8yrLgUdRxvPoGUGfdlJ87LNLRirToA1+2YkO95uxnzEMlzzzBWf33
	ISZQ==
X-Gm-Message-State: APt69E2z2+bUOjdIHQ6TQ3RickjRxT5jvD+GWPjCjFl4t5Rbk7S3U2F8
	R27y8BrzDS6nHnrm7nVdDGI=
X-Received: by 2002:aa7:8307:: with SMTP id
	t7-v6mr26876758pfm.81.1531247644669; 
	Tue, 10 Jul 2018 11:34:04 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	l28-v6sm36902206pfi.4.2018.07.10.11.34.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 11:34:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-7-peter.maydell@linaro.org>
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
Message-ID: <c502f24b-84fa-ecd7-e88a-a15e8d587796@twiddle.net>
Date: Tue, 10 Jul 2018 11:34:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [PATCH 6/6] target/arm: Allow execution from small
 regions
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
X-TUID: oo0/PBi+S8G7

On 07/10/2018 09:00 AM, Peter Maydell wrote:
> Now that we have full support for small regions, including execution,
> we can remove the workarounds where we marked all small regions as
> non-executable for the M-profile MPU and SAU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 23 -----------------------
>  1 file changed, 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


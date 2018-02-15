Received: by 10.28.71.27 with SMTP id u27csp2578197wma;
        Thu, 15 Feb 2018 05:27:29 -0800 (PST)
X-Google-Smtp-Source: AH8x224pZJ0p4ELrEIFvRq5oQ2fSYh2CDccveClLz0iV6N2QlrixU5y/0jiha5PIzUiOiv7LyyJo
X-Received: by 10.129.107.196 with SMTP id g187mr983917ywc.459.1518701249752;
        Thu, 15 Feb 2018 05:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518701249; cv=none;
        d=google.com; s=arc-20160816;
        b=TksDS+ngpfit3c2y40sBubksVYHkgY8SWOTJNkfkJuwUyitADcGZVttTGWPamgkoMZ
         Ab0HeZvW0XxM5ObcRk6rzBiK+/7A16bOOUMHxcQYzkeFviDD3C21evZzjearxQP9jqsz
         xGq1n+aNXavXGek5ZC8S+R9235qVvLtKFejIHf+dbdEWR109g7nk9Uq/BamGfLHOsy5l
         E4wywuPzWYhExMlCoQ3PpBlJhFus2mS1qPdV0X1SMfFpSgfv8bR7p5+I2LBq/mXhrNLM
         C2dTou/5G40Y72i/e3orVHpZkLBmB5BlQaZTLYCJ4IMiiiBfmD5gSbdhJzi26DpyWlKf
         Jp4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=2L1o7qNq+a3+u5fqDEkpDXNHc3LIst2O99su5nIxUj0=;
        b=s0Om1k1Ju/YkWZnbUlgROq1nTJmDtC6ujhnLbwiiefUlGkdSENbsFFQOkTvLAcxiMG
         CVzqQt231micmafuGvdYpt7lTVqEkVaOV+nTUiBcR3TcXTdAyAmHHNwbU2V5EsoB5fOB
         cq3rkjsobtPVx5WK2YgBPAbEvNNQioDcj4aa/TYOxIlDYe4Eq3fj/wDDLUqkDZ31mvdv
         RGAxJuxZcbC6xwlE8c2xY1Wgm6SvzAwd8jzf12ObnWZY5cvhk1zWp0Mka2SNZgfJsGud
         DQj18ZMVRzDB/woRMfE7pur29HW/H+l7Aj1RZwkntzLNzsWnWL09ofCuTRUrrefNM50O
         n6og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3si2689682ybk.480.2018.02.15.05.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 05:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emJZR-0006Nr-7d
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 08:27:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1emJZD-0006Mf-SG
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:27:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1emJZ9-0008MA-OD
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 08:27:15 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:34463)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1emJZ9-0008Ls-DN; Thu, 15 Feb 2018 08:27:11 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue003 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MNQ45-1eseIF2n9t-006tVb; Thu, 15 Feb 2018 14:26:58 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
References: <671eaa99f4e0bf3a58f76f9151f7cfa24662227f.1517565566.git.agx@sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <548deb35-8970-8dae-2baa-7e60c610ae4b@vivier.eu>
Date: Thu, 15 Feb 2018 14:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <671eaa99f4e0bf3a58f76f9151f7cfa24662227f.1517565566.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:qSYEnZ/CLGvARRZ7xqj5+9TyK8/ZKFNX2fp0JEdRvhwF/3eMaKl
	RlnqCBvWlAHdpqDcz+VfXQ90WzOlD9eruiR1qe1sSqIbxFe2DOWeg3n57gCPXCKo4kVeh7O
	VIvTDJQxDePypg3c7ddtYFJT/D1kN1/0iHaZDK5M7fq6wu2r7FHE1p2g5w9UtT6KiBf7GQF
	hGpgsVKuq3QTdFilNotMA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:v3O/ywcKTtA=:02mCSVz+xPCXx1U14WZIAT
	xNO7SvOpM9d6A208/EoSCeUhWHT00IsjVlSaFVzSEjCt99H7EJA5U9CGB0Mrd8bOapBQEIIM2
	kT6g2vR2AdXlHTnqE8fhdMfcyQiCtPHIhNqjYKGdYAGdn0T0WCwvRjpUPc6d1mzQOhpm1RlMV
	yS2La/xBpd9Ug2Q6dSJEwlkfqD2moHJWFtrOicdj+epvipYx8pTRvc7neoBQxzzskZ2NMArr5
	fp+yQhWB4tHelGKVsl1fNEhgWQd6TQPHpj1j7TspPej6Kg4vgKdoG26TlBfUBPH9Y9gCCnqJs
	uukCSqn35E1CoBMFiuB2VWemSQZUfKMof3oCHKYk3Ht64SE7ozIYVKR3a17IDx4OV5KnxR18w
	f/cPr03Q5qUy0I07gTm+8kR51RIBoO720tWxkQ0nhMtYl9ob0G/Z7JuUv29SQ1tuiJmAK939P
	h8NIfvvzkoNwUOLHwO+fMdOVbgVuKaxLIxSd5ZFSNdhWTnC4NNPx+323CYUifveKWCq9EGY4r
	tUsg+oCt23/HcfawCIC2QlXYl4bOw2xRpRFeEtJ3rziM+4u+4WdWnm26FGNM9LKpc6ivq9Lnu
	vn+JIfnPWm3Lrye3u/ANoB1BYedMjKnsutfi/0bXCkCRMiu4NFGFYLT4K1Cy++Vu1HI0HZ1BN
	eDZIUU0/UGzlqPLycQWgvIPK8R7FJ9lb64X6b3h6ePjvVnH0F/DkdVfFpaDkSvuNnsjudJ4GN
	XQPrrlJOv2HCqNoSDcfP5s6gCd0GoeLmexMFkrAOuAryeg82HkHziBzRQz4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] linux-user: Fix register
 used for 6th and 7th syscall argument on aarch64
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LxP5ZHRvrewp

Le 02/02/2018 à 11:02, Guido Günther a écrit :
> This unbreaks the testcase from
> 
>     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html
> 
> Thanks to Laurent Vivier for spotting the 7th one.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Suggested-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3 collects *-by: replies. Anything else I can do to get this applied?
> 
>  linux-user/host/aarch64/safe-syscall.inc.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to my 'linux-user-for-2.12' branch.

Thanks,
Laurent


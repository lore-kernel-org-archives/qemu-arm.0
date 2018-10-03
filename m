Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp39660wrt;
        Wed, 3 Oct 2018 13:17:55 -0700 (PDT)
X-Google-Smtp-Source: ACcGV601PWRWlRktoXKJrL62mkk31Eb97mrOzWg1EwP3tR+yFteclJaj3vvyBcG0XXaKq0geZXS0
X-Received: by 2002:a0c:869c:: with SMTP id 28-v6mr2693219qvf.92.1538597875217;
        Wed, 03 Oct 2018 13:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538597875; cv=none;
        d=google.com; s=arc-20160816;
        b=OXNfPXXMPcmezqI9gSxyUZ7OGoWpZvy7bTBfkZstchUpH0L6M1ZNf9TyOucXINu12+
         DEY7HXxBD+sYcpHF7ssSHHNegvk20JTCIjHJJZFsRSZYgKkF2/tA6MHOv+6HZxzSHpIk
         f/0EwpTeGcuNmThEQDbiugmFe0T19+zB1Ee2IvSzvzEzE6X/nlSzP4amkVvuyOG+q/bv
         nmkxeNxemD1B8ff6x9lWshOtR3x6d7oOCO+/w8r2itml/HSqfdcvxKNiPP9dMssAnHNe
         UBsbJ6DlNrRpZ+DDA4gs9lFypoGqtiGFhyso8J+ijhdGLi44qOkkMN0nx8G1Oqs5BF2r
         NlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TCrSK8vAqxihZMw/zBTgYTDc7dlEn05fBni+Y0S6OSk=;
        b=bCZpzN2T/7Gp0eLaQNGrwAMRVOm5VioY6YsRoZSU0gVhUvQ+YZzuZZ8AYpb/QQODQX
         pGysN/lu8vfjAIKZYkURCe4ra25NQ8FDCoLU0bPtX8kz8PUTtPSLM+mk3FL3ylgNuvyz
         u/4/3VPbExqtohCcsT+Lv4Xdd8ipjF2oa4cgS99+a0hY9JUT+KTV8v19HnPicsJHD7No
         Uux3PnaCGvHkohPo3dSrOiBb4ozd7L2sKsbtn0TbdSINOBA7cJyYVccf6PQg3QvJqQwo
         u5WuePFcaQdo3IfPrxIcvA1Pa56scYMBISLnVHFLRqChyG2WqO4mmMnwguApohV0IXvi
         bPMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eBTCfmJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o30-v6si1520174qve.201.2018.10.03.13.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:17:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eBTCfmJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nak-0003zl-KS
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:17:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7naS-0003yV-QX
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7naP-0005Ir-8C
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:17:36 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:36529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7naO-0005Hi-NB
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:17:33 -0400
Received: by mail-oi1-x243.google.com with SMTP id p125-v6so5639909oic.3
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TCrSK8vAqxihZMw/zBTgYTDc7dlEn05fBni+Y0S6OSk=;
	b=eBTCfmJfSnLCztqGSBsTdKV00A4DL94hRH54zv2ZmrNdlo91q+/Wcyb90jBkne0Xvg
	iYKRjrjyRy5yHJsGysk1kslGZeITkN+fOCaF5SQE0H83lPm/LP4Jrc8t0DMbMBnKgIUE
	Yof+d9C6NEGcqpZD/7mw85HIia4AbPqIprWEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TCrSK8vAqxihZMw/zBTgYTDc7dlEn05fBni+Y0S6OSk=;
	b=Kt60+jAAgBL/e/QWaTIyNgsERwqVPiS/QgI+vjQJoH41jV91OYDPZ27I/3PrDaPSRj
	xN4BYYHz7uK1JLsEOZwaFRDN3AgKJpqvduDRN+jiEUi6AKantNfe8ubhJIvWtHRULZpD
	caCDKil5OzmwtVIJyM8kuwBhOejHZ1LVXlBnCHVeixcp3FqlnPmBdf4POW5cehyZ8uSQ
	isA2uhTSxMVq2DR6D+prdsUrombDOdHTgZyYwGSpoWlmnS/p4nUMHeOUusWD2oXFv+Xs
	N6bVcHB2xrmYTZTxNzozqWxrh4L2gBW7hKLxlYL+nbwV5gD7qaDTruqWjxv0skAsKk5O
	VpjA==
X-Gm-Message-State: ABuFfohMe98LmlHiOFONHEsJJy44DV5GB/OlDQgT3q08qlMn9HaHg6DU
	SuuTllF4KVAhZs/ceUpGF0C0ng==
X-Received: by 2002:aca:b40a:: with SMTP id
	d10-v6mr1426222oif.190.1538597851670; 
	Wed, 03 Oct 2018 13:17:31 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	b49sm1197587otb.33.2018.10.03.13.17.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:17:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3e1f68c9-e878-8f75-d38f-7b73dd718a7a@linaro.org>
Date: Wed, 3 Oct 2018 15:17:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/13] target/arm: Add v8M stack
 checks for Thumb2 LDM/STM
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E27O7zM3xWhB

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add the v8M stack checks for:
>  * LDM (T2 encoding)
>  * STM (T2 encoding)
> 
> This includes the 32-bit encodings of the instructions listed
> in v8M ARM ARM rule R_YVWT as
>  * LDM, LDMIA, LDMFD
>  * LDMDB, LDMEA
>  * POP (multiple registers)
>  * PUSH (muliple registers)
>  * STM, STMIA, STMEA
>  * STMDB, STMFD
> 
> We perform the stack limit before doing any other part
> of the load or store.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



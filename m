Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1378127wrx;
        Fri, 22 Mar 2019 19:56:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/VsowVyD9RhBGqJwviLR2C2ODhSWu6RHriuVtlkX7ZHDiJAZA7QyG0LTMB3XgN44J8hAP
X-Received: by 2002:a81:1d96:: with SMTP id d144mr11553868ywd.339.1553309818403;
        Fri, 22 Mar 2019 19:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553309818; cv=none;
        d=google.com; s=arc-20160816;
        b=ntQWqT7/U4B+lp+dBpFN9hz8Bg5vYWblNg/8xnYg1mtODuQyBP4p/+zfWon+KEdh/n
         K6Oh81yliG1pufZAVNdWNsAuSpFEUZFyxABjh2yrGjjToI3z8MDiKJdX4m/AKjPtGI64
         02dlL7P5pJlwE7ZoQccoRWyl3vqdVd/Svtmd5PNrgMiFmRea0lWkamBNubhMRmXXJKNw
         fUeDwqzbaExdMOAJZlYDwt46+y6CJRz0GKasRE3LVIjCBa9ywx4GLpRfJuXbN+aUnxrB
         2vJP01agXPDj2kxZmcCCU7GaPfos/OQ0/r7tlyKnToCzgDUInlWmLwI+GnGi1qAhHkI6
         44Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:date:dkim-signature;
        bh=sLnRAPkFwlpwCg0XJRDGg/6jCD751F+aIMWEAqwU5NQ=;
        b=p1WVcHzlcjFHELYjzOj6ceTrkC4Z++FsKo0ONl2IEAwKkY4/6oW9LMR/lJdFDG75U2
         ShxPFQ52hPynw7peYKfSCS+mJabDBNbKBQKfiZ1J2fCJEqpvT8f69sdmmcemsJ5MjGfk
         NfWVZqr5oNy08HgelF1PRwlDaOvUACtuXHbpbDs4xcNviajtuYWLJ2+QyVbiZ/XTub4J
         l6HGSzg8Ikg26apCuAOR2hkCBahczOI1zdgcy37jwdj8UrpBw+cyBBKXmEFO8cV1XXx6
         qgUwQaIEyrnp2GtDOf9M62NJbI+OkM4GySBIKwFeE7c2SUgGmw1dXHD6xD80J2HsPadW
         4pmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yahoo.com header.s=s2048 header.b=me1jywFv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si6059249ywy.370.2019.03.22.19.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 19:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yahoo.com header.s=s2048 header.b=me1jywFv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7Wq9-0006o9-Vm
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 22:56:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lucienmp_antispam@yahoo.com>) id 1h7WpX-0006db-Eg
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 22:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lucienmp_antispam@yahoo.com>) id 1h7WgB-0001AS-U1
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 22:46:40 -0400
Received: from sonic306-22.consmr.mail.ne1.yahoo.com ([66.163.189.84]:58687)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lucienmp_antispam@yahoo.com>)
	id 1h7WgB-00017k-CR
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 22:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1553309197; bh=i6g9uutzdVkno4/wfJBE8aYMCM3UHbCWNeRszSW3PLg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=me1jywFvFn/1Goa3t+zS1HQbklWDaheHu7FbVp1vUTUa/E1TZJVSGgH+JRC78ojxzdoIxQzzwX3je9GYt4Ep2A3/lKXE5NRTyMVnq/CktTW25+d/Pq8A7AD8NzPkHFGMTdrgYVh2TibwC1SqFr+zVrsEIQ9+pct1hlktsphBzekoc7nvrg8IWILAyo63U3tHT2e+6HVU0GcYyP2LWzRVLDMH3crLVbwbdbL0lOqRhn1JtVX0sERckgp1gfH573hj1hSNeXBAJRUq7u5PH2aB17o2+h6ECNuUWKsEZ4I+BZPWG19CV6Ku7Rpmaua2kw44omFMqyxLcFAySMMlNnz8+g==
X-YMail-OSG: nD5oVTAVM1lTup9UBHtGzJKMH9JbG_B28zJiLMxGeOi52kFMmAE_LN55v69.iEv
	YdbG0GUeBGirqfSYQsT5QbLIUfit0PAA25Nc8VVJyNoFaS3Lj8iJF2pSfJY29AO0X1Uc9JrNDND3
	1ZcUaQOYXc1M_7.pRIS5en4x8HMBk8TiV4AggSkYYzENp9XRasP2v3h.YFdKdVvGgAwdi78ArmGI
	omFDb5jc0ZgaU_S_QL0VK8pIYGgLoCQHEoKe_3kttIvaZHwcvb43YkVH3b84MU6WlPVlNk_V0Rjj
	GDZNqeoYiVsNs1k7FeyhHGX680PaC9dAr9drI1TkUBVygaWV96GNbQYLpBAw5A3RgD0NdBmzQ8Cv
	zFMHW9oV3x_WjAnZLlmWUdFYMlC4LB_RGFXkiPHOfJrinaYYtotMYD8.CzyXd3b.kvRn9_ITV9bt
	ZMK_vfKi6OkaM1R4l8bh2KNlNl0ZNc2tC4_crV6_QAj6QhOsAaImDzRn8rZSJ6H8082uFIamZT4G
	mNtG0lwAWeL_VtOogOhehu2dMbVNUW6Sf.PHT.pyr3STX4aAHWzF4muxv93_A.kdEJEa287V_fsq
	lBBWMtjGMHDJImdQS_4kDDyDhDHBhjvnt6CNXFh8aFtl3pZL5fHqok6eoKKkizdkE65XvdUoauNn
	IE01rWUiQWmEvJZkLjI7PU91mWcy36DC.j9PeQf4bACr48w3SfCmidZG8Kwhceatg1vObUQjpXmD
	T3eSSUJjuDlkgBOM00mBzC_OTPtqKKUa.IE3fZuQbKFNKR8aqr3TztykCSiW.AjhpJOz_0asF9xU
	G5LalQl0Zo7OJrnnNhVfaWCk77Kz0l.V0tlQjdIlM8zwYKyHC08WGDXjZF6hDRyneYO4WErYBAQC
	8ewuXX6QbcVAip0MrqPMyqlsmHUHm1D6VJyGGg4lt9n72F7kMWw4NY2cfJXj.TZygZEzWxRQgO5o
	3yYij5Pyeqah9J3V3D2SN.aWywj4PCmFFHrQ5y4FHEXj6D4AIDmfAXtf6Lh9aifxTihacj8R5hkI
	1Np.xaG_ZDILa_shhovcB11LO7JKBLbXVombs.SLC6pxdgj7VdHLvCVD_FvK9fYh5RGs0WEITNdZ
	LwWqFSHccqbAhoMYQozUZCwoGg0IWlwBxTA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic306.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 23 Mar 2019 02:46:37 +0000
Date: Sat, 23 Mar 2019 02:46:34 +0000 (UTC)
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org, 
	Luc Michel <luc.michel@greensocs.com>
Message-ID: <423334518.10114999.1553309194198@mail.yahoo.com>
In-Reply-To: <a4e14ea5-dbbc-c970-ccfd-bed51ad2bf58@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-6-luc.michel@greensocs.com>
	<9dbafcdb-75f1-b52b-b62d-f36e3a13404b@siemens.com>
	<a4e14ea5-dbbc-c970-ccfd-bed51ad2bf58@greensocs.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.13212 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
	x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121
	Safari/537.36
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 66.163.189.84
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v8 05/16] gdbstub: add multiprocess support
 to vCont packets
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
From: Lucien Anti-Spam via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Lucien Anti-Spam <lucienmp_antispam@yahoo.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 12MFixMqLFAm

 

   > On Friday, March 22, 2019, 11:01:34 PM GMT+9, Luc Michel <luc.michel@greensocs.com> wrote: > Lucien: do you plan to send a re-roll? Otherwise I'll do it on next
> Monday (25/03) because I would like this bug to be fixed before it hits 4.0.

I am on assignment in China which is why I havent gotten to it, I will attempt to get to it this Sunday.
Cheers,Luc


  

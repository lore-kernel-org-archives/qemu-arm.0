Received: by 10.223.172.38 with SMTP id v35csp226224wrc;
        Wed, 13 Sep 2017 16:36:21 -0700 (PDT)
X-Received: by 10.55.99.139 with SMTP id x133mr250300qkb.263.1505345781655;
        Wed, 13 Sep 2017 16:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505345781; cv=none;
        d=google.com; s=arc-20160816;
        b=dTjw+/9VmJhOm5o772zD38BvdBjuvPAmY3TqBXZUVWsu+oGzDqFRDqPBk7aB9XwqkJ
         TXUbV1yguG7GB3NwnjL/r7beX7v5uqCs7NMcnI4izxGUNVSheYqCRBwavrxJOXOKdmi7
         hOTHg6uVKBiS+MkcEuFn8ehWWEbdhAR+WaIz//eplWlH8QP9NI99Zs0xQaLrCIvXfhbj
         0JhbbrbMn7uoNOCPB6nzZg4nv7IJHci1rP4BBr0MWALAHskpTIlq4+2dmbpuyxSBLZ1s
         kS6upBCXPyN3QAQKgl5AONFBfKxFEsyvjKwQ2UTELEMc69pZ/cwMoDNmEeUB9lYMIuFD
         zj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=5Py05TBD/9MUdN3IOV+OoUqeSSPD9BLYNYbPEDLGwrQ=;
        b=tpt8Xo6xgqMW0LdvwfegAEI0Db8smZAfu0pyf0aqAZsQ4VmBQ2NBAucldFkBH7HXcD
         b+2vKCEbE44TjeKMxPMmhYLrtX14vQCM4P6HVOLkgJEhlPuMUD0NZBrRBYnqBTEez9Sz
         a8KFSt12IVjjnzw7BfBLxw1YELeMmb0oSz7EpnmsBkZBw+4DpaV9pE8Wl/UU3pwsEDw1
         tpUOWtEQNIZjQYTtwhGVhjbnNpb+q6QjezEgNgku0Gl2fA759sYImLUTqeSf/NbMA680
         w0y6Jaq7T7xx8Nwbt/Zlbj8ftLBdy+Gx19obcPeLYSJuxzeALEobTY1Ih6oIVpRAVGcd
         eeUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g9cquz6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64si4978431qtc.470.2017.09.13.16.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 16:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g9cquz6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsHCd-00028u-Cc
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 19:36:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsHCO-00028P-Mx
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 19:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsHCJ-0004qZ-Pu
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 19:36:04 -0400
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:45689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsHCJ-0004q3-Ie
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 19:35:59 -0400
Received: by mail-pf0-x22a.google.com with SMTP id q76so2497267pfq.2
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5Py05TBD/9MUdN3IOV+OoUqeSSPD9BLYNYbPEDLGwrQ=;
	b=g9cquz6IAD6NkqFojSs8EyOdHxKjCultYVtdIhPizqAbQHju1sLXa06aU+BNSTiyBq
	9ZaveLA9bxU9Vs4zNPkY5RjbtkSYifV3nCLFzuG+9Bdr904zLkwajzdI+Ihdks7U54Qv
	KOv8chy1FN5Nrg4qGNdMHrec/eW4InToVXpuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5Py05TBD/9MUdN3IOV+OoUqeSSPD9BLYNYbPEDLGwrQ=;
	b=NKP+Fr/VphoQVs57YQERRSgeBf7Y0JFGdWLMgSJWe4zgL43QKi3xXpEQgCvMrdXY5k
	n4Vt35h1yiB7ubao7HWOdtyC+G9iFbbyR/hHn0B58vSnCRNwF/QkBAk56Ugo3jNDyQ2b
	0z3Nluif0tyEOyl2gk/dWHGG3x4wJUV2kNxl7X31oIcY7XpXwfTMLrjjbnXOebb7HqIg
	eXVX6lXdz0Lo7YQ6QA+AWpxZRr5D8AH6JoiohjvFT+6v+96tvQHSOb7pAIRGlGUxqpfM
	ZjkwrPluNDGowDP6AtOwJcTTo0nhZWqsAnIKfqG8R1e+OkNuEKOi2r2hV41emKnCd/Ma
	WMPQ==
X-Gm-Message-State: AHPjjUhSEw02aowzN9cJnli0CQsCTtxJiJetDeuWjdbjUrXQYSqy3t50
	I0xZ6SYHXWDji2pq
X-Google-Smtp-Source: ADKCNb7kg27Qm4NnWGueT3j6Ma78P1qRdmr45/BGlHswjmwMCHj4TjHREIxJJkZCxI+qrv5mXhJg8A==
X-Received: by 10.84.229.13 with SMTP id b13mr22913099plk.189.1505345758471;
	Wed, 13 Sep 2017 16:35:58 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	w12sm10459503pfk.83.2017.09.13.16.35.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 16:35:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2f92aa2-d016-5f90-3c40-c6eb19d26632@linaro.org>
Date: Wed, 13 Sep 2017 16:35:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/19] nvic: Implement AIRCR
 changes for v8M
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
X-TUID: uuSHr5e51UU7

On 09/12/2017 11:13 AM, Peter Maydell wrote:
> The Application Interrupt and Reset Control Register has some changes
> for v8M:
>  * new bits SYSRESETREQS, BFHFNMINS and PRIS: these all have
>    real state if the security extension is implemented and otherwise
>    are constant
>  * the PRIGROUP field is banked between security states
>  * non-secure code can be blocked from using the SYSRESET bit
>    to reset the system if SYSRESETREQS is set
> 
> Implement the new state and the changes to register read and write.
> For the moment we ignore the effects of the secure PRIGROUP.
> We will implement the effects of PRIS and BFHFNMIS later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp905468wrt;
        Thu, 13 Dec 2018 06:51:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W26eO7b/jS25OCQiHkA0Evw9wT2zVJWdAiV9awVhtESwsOqZ+n6lXPQHngoFH40l6/q1qd
X-Received: by 2002:aed:3bb8:: with SMTP id r53mr23874060qte.77.1544712708664;
        Thu, 13 Dec 2018 06:51:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544712708; cv=none;
        d=google.com; s=arc-20160816;
        b=0JqwYt5Q1/xqXWbqwmGXYp+jfUvmoYK8eomJ6IPfZACTnsvtiuRU3wtkmxI8wX5vCe
         5r1v7lr+Se5Hik96CdSgmktnFdWa4J8X4HQ4kSCL5tDLFtfevw68GVHohYbY1od2mmPd
         DxMOLZkbCTTBOODPFQ/Cf2HkFthi1UPs/yHvIO89wQdU6bCrlZe74J2CTX7aIcMs8Xzc
         T9ZkygIOjzEj50S3D4cQr4IQjoMPGn01oZkc2NWKN1qa3Z74/8GYHphP4iTjm/qtMerg
         AvpshwzGHnCVK8tdBnKwyVKMUhbxOAxNqCQk1A2tCtpEG5Y9VKYpLMnYR5Q9+5kWugCy
         QVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Xcyu236H3s+Tag+SYUIxO50t90FG5QcX/0f/avGxwzk=;
        b=xCJg1UHVGwW3DUiaVwEpQveczUYQMpRBAcBJFOwYQ49SQrB/KmPJZhZncx/O3eWknW
         a1OodHMcayxSfs/2j8zOhNFHOIaE+jCL7S4KMI4vtsy1c9/860q76P+KD9j5nXFE1IEA
         u+FNvQPzxad+x7AKDNq+rO3O2tCSbdD3VwGUb155H4f64ZgECLTBYuj52raD9UPiHzHC
         Mzw1JfAGuBFcgV9wyyMDqDRPOkAMS68rw5mG3pfxAMdHhxaHaljMMPHojkjifXoCFdIh
         KjMINhoo+XjTi96fPxM9/TjV8SGJYnu7OvUTGGMglbQOYmGzBm6X/W+R4Db4jO9NG3Fg
         2A4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q3UV5eY7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si1183661qvv.131.2018.12.13.06.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 06:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q3UV5eY7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXSL6-0000zh-0g
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 09:51:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXSJD-0008Jb-9U
	for qemu-devel@nongnu.org; Thu, 13 Dec 2018 09:49:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXSJC-0006xi-Eo
	for qemu-devel@nongnu.org; Thu, 13 Dec 2018 09:49:51 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gXSJA-0006tZ-TZ
	for qemu-devel@nongnu.org; Thu, 13 Dec 2018 09:49:49 -0500
Received: by mail-ot1-x341.google.com with SMTP id f18so2092148otl.11
	for <qemu-devel@nongnu.org>; Thu, 13 Dec 2018 06:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Xcyu236H3s+Tag+SYUIxO50t90FG5QcX/0f/avGxwzk=;
	b=Q3UV5eY7g4CbMx9466xQ5Zrj4ta/WtT3ey5nz2epYDdBoTSTd2sK8yxSGYbMqoJzbZ
	a+3/nrQ6gJL2N3SjV+U0VtgJXxCZfiNrDe9oxHvCi1qyaX9PmdixB5rxnS0O3ha0Dlup
	YfMCF/3M/bomjWnkAcEXZmL5nAfoSM3wYUnho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Xcyu236H3s+Tag+SYUIxO50t90FG5QcX/0f/avGxwzk=;
	b=B5XEa2yaLILJWEbgYF4NPDOhR7DpvKVy/r0l8/P25mjIim1THqspYC3XgqrzwvgWGN
	Vb2eaKQNfwTNg+WP5CAWbtlhHKk6G8M0p/lKY3J+7HxRSwnLA3h/OEUH4ShjFOWzNd81
	QFq/WsoaI8/Gtn0+vY6U47lGffLeL5MWXsEJhDhtQdw88oCK/K8w41s3gUJK4gAXKNnA
	J6RFgln/yTc6rcaqk37ea0egTB0u03JbKVjRvbjcFFi1PMeOC2nkJrgp2j0inpHyTmfL
	yTCbVVhzcnuKLYL8mb3PDzqqclwVa7aq/kX8rsi9Q00qVBkasPnNbvvV/gCUzdAXzSoe
	habw==
X-Gm-Message-State: AA+aEWZZWZEcftXEBmMkvTfY9fPbzbAqqOQcLdjDcm/B+otMWgimesIP
	UE8j+7/TYP0WZDic6S1ipRj50gO9jqKLMmUYRwZWcA==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr17534318otb.238.1544712587594; 
	Thu, 13 Dec 2018 06:49:47 -0800 (PST)
MIME-Version: 1.0
References: <1544708743.4811.30.camel@rwth-aachen.de>
In-Reply-To: <1544708743.4811.30.camel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Dec 2018 14:49:36 +0000
Message-ID: <CAFEAcA-p-LC2swC8-AQt60QBhQN=PNJvBjbGXrtdvvvDd-74QA@mail.gmail.com>
To: lukas.juenger@rwth-aachen.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [Qemu-arm] Warning when DTB memory nodes are noped
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGzwuxCL/JtO

On Thu, 13 Dec 2018 at 14:42, J=C3=BCnger, Lukas
<lukas.juenger@rwth-aachen.de> wrote:
>
> Hi all,
>
> If I understand correctly, all memory nodes contained in a DTB passed
> via the -dtb option are noped in hw/arm/boot.c:556-568.
> I did not expect this to happen and only figured it out by debugging
> the kernel.
> Do you think a warning should be issued if a DTB contains memory
> regions that are noped?

No, because generally we expect that to happen: the DTB will
have a memory node for whatever the stock amount of RAM on the
target board is, but we want to delete that so we can replace
it with a memory node saying that the system has however much
RAM the user asked for on the command line.

Was the deletion of the memory node actually wrong in your case?
If so we should look at fixing the wrong behaviour, rather than
just being noisier about what we're doing...

thanks
-- PMM

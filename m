Received: by 10.223.150.237 with SMTP id u100csp2204870wrb;
        Mon, 13 Nov 2017 00:19:45 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa4dbb+7IC2UswC7mYl2r9Xle0RS8suQIDSE8IHnHffP0xp2VcCApb45par8yLumbLmWxl9
X-Received: by 10.37.5.207 with SMTP id 198mr1039070ybf.336.1510561185500;
        Mon, 13 Nov 2017 00:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510561185; cv=none;
        d=google.com; s=arc-20160816;
        b=y2fScsKzs4qBt09sS5AFeWJGzXCxNk8oRBA/ksEy7t9CtQp9zLDZo43rzDV1+BqfPQ
         MlvEksTbH+uGWSW6pfez+RnDqEPtQ2hcYz4YJFQEeG+X72dMOjyxpLxIaKmMQtWyFi5q
         Eme2jYF9q9Ry/knoEloiAqeSp3AJ+X6TxkXFx9YB/LYdNEKf3qdnyaypSmA7fqqj+07h
         phYNiF+EBbAaOKnSPhie5lhV/I/QnmNdUCCVH/6a84rGtdcc5As2gsJvlSjyjIwkIGvF
         aNgnL0DX0KeRVyEcw5wDp4YAc08yZ1mOotd4QcGJtdLG7mvrtH3lZLAI3SGylibmTaIU
         csug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=B5a8TG4/pNH/1VA94/RejSpnNN/pQooKDcI5CH1DiGA=;
        b=pnq3mJx7TwHlh7IAQQYsU/4ZQtM4lhUJQ/eVA13m5R6th7LTygStQ5PcgftUSCaZKJ
         eubTvKpSM9U/iNT4564/clIA/W2XoEPfu2E0TpA9F8JuMnHhwhiNZGPTbOS68kneuoCq
         XMmBRlD61pDN9fSjKwcgO5f2Cd9bEWOvHAYCZk+DmmytnR3yAUlc3O5wpm9aDlb8rUkZ
         zh2SIoU30r+aK3HEhqAHSvhkVByWj/xS6XdU6l4CFwo4iOVL4a6bRjnjFdTd2R04wjR2
         CyU7tmpECGxwbT1BUa0GXAI2ej0+NaMJbgAAROLOsW3ScQhqBEEMvEsuphoQ3AtZkcXZ
         5EEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jiYQY9SL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i4si33534ybh.118.2017.11.13.00.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 00:19:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jiYQY9SL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eE9y4-0002WL-V3
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 03:19:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eE9xw-0002W6-80
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 03:19:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eE9xt-0002q2-4P
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 03:19:36 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:34822)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eE9xs-0002pY-SV
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 03:19:33 -0500
Received: by mail-wm0-x22a.google.com with SMTP id y80so12886187wmd.0
	for <qemu-arm@nongnu.org>; Mon, 13 Nov 2017 00:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=B5a8TG4/pNH/1VA94/RejSpnNN/pQooKDcI5CH1DiGA=;
	b=jiYQY9SLE5Nz1G4KSooMs77n58eP1jH4G/Z9kc1o2B1K67xLEzzof4OhWSGS8beOps
	tN3X/bvOfe8YljIwZiR+rIcb5Ajvf82eaq+Pvi2sT5raT0+7A5/IJPxX3gIXS5CQyu5D
	jQJtvcz9dOWKEfl7doC8ROeoCE2hgoOjbtTuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=B5a8TG4/pNH/1VA94/RejSpnNN/pQooKDcI5CH1DiGA=;
	b=IvmXr/8ATmY1H6vuHR8ujLGEUbsgTOjlPIT26YjS7jjll2AuA3s19Vud8fIqd8FIcH
	jpLUpxizkv2DfvwyfaAhnCZtpOeWWMtrQELXqBkp5PswzFdDebCpKKPjdkx1fHXVLBxv
	sENVppWnjkW5kBnYDft5e/b1ayGZhiwgV7LOpDMbO8MML3FCYkkCBHY53BOMZ9dp/+ok
	FtG2zaIBc/QdHWiM61MPQNNsFuTVKPFfeDDIvzijtI1YvQzYclRfAWcsrE3CX5Uv2cuL
	n/tpXYmKbjitRwN4wvDVR1cVsago315d2xA8LcUKPB+nAnkhoo6n2GZjLHuF0KeoVRho
	p02A==
X-Gm-Message-State: AJaThX6Wx/JU4djA+314K8g5bAA2bIzKnpvMRPMCKP1EFTQa1Gtk3akN
	nrGN+lk+2jR5lcqHK0/jSepfdg==
X-Received: by 10.80.173.20 with SMTP id y20mr11678854edc.23.1510561171415;
	Mon, 13 Nov 2017 00:19:31 -0800 (PST)
Received: from cloudburst.twiddle.net
	(201.red-2-142-30.dynamicip.rima-tde.net. [2.142.30.201])
	by smtp.gmail.com with ESMTPSA id s7sm4344709edm.80.2017.11.13.00.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 00:19:30 -0800 (PST)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1510343626-25861-1-git-send-email-cota@braap.org>
	<1510343626-25861-2-git-send-email-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecaff279-4255-5a7d-a209-971892fc2f1f@linaro.org>
Date: Mon, 13 Nov 2017 09:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510343626-25861-2-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH for 2.11 1/5] qom: move
 CPUClass.tcg_initialize to a global
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kiznFVslC871

On 11/10/2017 08:53 PM, Emilio G. Cota wrote:
> 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
> introduces a per-CPUClass bool that we check so that the target CPU
> is initialized for TCG only once. This works well except when
> we end up creating more than one CPUClass, in which case we end
> up incorrectly initializing TCG more than once, i.e. once for
> each CPUClass.

... more than one CPUClass for a given translator.

Ideally, cortex-r5 and cortex-a53 would have a common parent class which would
hold all of the bits that are common between them, including the translator.

That said,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
